---
layout: page-fullwidth
subheadline: "Security & Automation"
title: "OCI Certificates와 Load Balancer를 위한 ACME 인증서 갱신 자동화"
teaser: "Certbot DNS-01과 OCI Certificates Service를 연결해 와일드카드 인증서의 발급·가져오기·Listener 반영을 하나의 안전한 운영 흐름으로 자동화합니다."
author: dankim
date: 2026-09-01 00:00:00
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, certificates, load-balancer, certbot, lets-encrypt, acme, automation, security]
#published: false
header: no
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

와일드카드 인증서는 편리하지만 유효 기간이 짧고, 인증서 발급 후에는 OCI Certificates Service의 imported certificate를 갱신한 뒤 Load Balancer Listener까지 반영해야 합니다. 이 글은 Oracle Linux 9의 별도 자동화 VM에서 다음 흐름을 일일 실행하도록 구성한 사례입니다.

1. OCI Certificates Service의 `CURRENT` 버전 만료일을 조회한다.
2. 갱신 임계값 안에 들어온 경우 Certbot이 OCI DNS API를 사용해 DNS-01 검증 및 갱신을 수행한다.
3. 새 PEM 파일을 OCI Certificates Service에 import하고 `ACTIVE`까지 대기한다.
4. 해당 Certificate OCID를 사용하는 Load Balancer Listener를 갱신하고 Work Request 완료를 확인한다.

> 이 글은 **Certbot·`certbot-dns-oci`·자동화 스크립트와 검증**에 집중합니다. OCI CLI 설치/프로파일 구성, OCI DNS zone·권한, 그리고 Load Balancer에 certificate를 최초 연결하는 콘솔 절차는 이미 작성한 [OCI CLI 구성 가이드](/getting-started/oracle-linux-ocicli-config/) 및 [OCI Certificates Service 인증서를 Load Balancer에 적용하는 방법](/infrastructure/oci-certificate-with-lb/)을 참고하세요.

## 왜 imported certificate 갱신을 별도로 자동화해야 할까?

OCI Certificates Service는 외부 CA가 발급한 imported certificate의 PEM을 갱신할 수는 있지만, 해당 인증서의 갱신 자체를 대신 수행하지는 않습니다. 따라서 ACME CA에서 새 인증서를 받은 후 certificate PEM, private key PEM, chain PEM을 같은 Common Name으로 OCI에 업데이트하는 자동화가 필요합니다. Common Name이 달라지면 OCI는 사용할 수 없는 `Failed` 인증서 버전을 만들 수 있습니다.[1]

와일드카드 인증서는 DNS-01 검증이 필요합니다. Certbot의 DNS 플러그인은 DNS 레코드를 API로 변경해 도메인 제어를 증명하므로, Load Balancer나 웹 서버가 있는 VM과 인증서 발급 VM이 달라도 됩니다.[3]

## 구성 전제와 권한 범위

자동화 VM에는 다음이 준비되어 있어야 합니다.

| 항목 | 용도 |
|---|---|
| Oracle Linux 9 및 Python 3.11 | Certbot과 플러그인을 격리한 실행 환경 |
| OCI CLI와 OCI API key 또는 Instance Principal | Certificates Service, Load Balancer 조회·갱신 |
| `certbot-dns-oci` | OCI DNS API로 `_acme-challenge` TXT 레코드 생성·삭제 |
| `openssl`, `jq`, `flock` | PEM 검증, JSON 처리, 동시 실행 방지 |
| 최소 권한 IAM 정책 | DNS record 관리, certificate update, Load Balancer listener update |

`certbot-dns-oci`는 OCI DNS API로 DNS-01 TXT 레코드를 생성하고 삭제하는 third-party Certbot authenticator입니다. Zone이 OCI DNS를 사용해야 하며 DNS record를 관리할 권한이 필요합니다. API key 대신 Instance Principal을 사용할 수도 있습니다.[5]

> **권한 설계:** Certbot용 주체에는 필요한 DNS zone의 record 관리 권한만, OCI import/Listener 갱신용 주체에는 필요한 compartment의 Certificates·Load Balancer 변경 권한만 부여합니다. API key를 쓰는 경우 `~/.oci/config`와 private key는 `600`으로 제한합니다.

## 1. Certbot과 `certbot-dns-oci`를 Python 가상환경에 설치

OS 패키지 Certbot, 시스템 Python, pip 설치본을 섞으면 실행 바이너리와 플러그인 위치가 달라져 `dns-oci`를 찾지 못하는 문제가 자주 발생합니다. 운영용 venv를 하나 정하고 **Certbot 실행 파일은 항상 절대 경로**로 호출합니다.

```bash
sudo dnf -y install git python3.11 openssl jq util-linux-core

git clone https://github.com/therealcmj/certbot-dns-oci.git
cd certbot-dns-oci

V=/opt/certbot-venv311
sudo python3.11 -m venv "$V"
sudo "$V/bin/python" -m pip install --upgrade pip
sudo "$V/bin/python" -m pip install --no-cache-dir certbot .

"$V/bin/python" -m pip check
"$V/bin/certbot" --version
"$V/bin/certbot" plugins
```

검증 결과의 plugin 목록에 `dns-oci`가 보여야 합니다. `pip check`가 의존성 충돌을 보고하거나 `certbot plugins`에 authenticator가 없다면, 별칭(`alias certbot=...`)으로 우회하지 말고 설치에 사용한 venv와 실행 경로를 다시 일치시키세요.

Certbot 2.0부터 새 인증서의 기본 private key 유형은 ECDSA P-256입니다. 기존 인증서는 기존 키 유형을 유지합니다.[3] Listener cipher suite와 클라이언트 호환성이 ECDSA를 지원하는지 확인한 후 운영해야 하며, 호환성 기준을 명확히 해야 한다면 최초 발급에서 `--key-type rsa`를 지정하는 방법도 있습니다.

## 2. 최초 와일드카드 인증서 발급

다음은 별도 `config`, `work`, `logs` 디렉터리를 venv 아래에 두는 예입니다. 실제 운영 도메인으로 바로 시험하지 말고, 먼저 `--test-cert`로 DNS 권한과 TXT 전파 시간을 확인하는 것을 권장합니다.

```bash
V=/opt/certbot-venv311
CERTBOT="$V/bin/certbot"
DOMAIN='example.com'

sudo "$CERTBOT" certonly \
  --test-cert \
  --email ops@example.com \
  --agree-tos --no-eff-email \
  --logs-dir "$V/logs" \
  --work-dir "$V/work" \
  --config-dir "$V/config" \
  --authenticator dns-oci \
  --dns-oci-propagation-seconds 120 \
  -d "*.${DOMAIN}"
```

검증이 끝나면 `--test-cert`를 제거하여 실제 발급을 실행합니다. `--dns-oci-propagation-seconds`는 OCI DNS API 호출 성공 후 권한 DNS에 TXT 레코드가 전파될 시간을 주는 값입니다. 기본값에만 의존하지 말고 환경에서 성공한 값을 기록합니다.[5]

발급 후 파일 위치와 키 유형을 확인합니다.

```bash
sudo "$CERTBOT" certificates \
  --config-dir "$V/config" \
  --work-dir "$V/work" \
  --logs-dir "$V/logs"

CERT_DIR="$V/config/live/${DOMAIN}"
sudo openssl x509 -in "$CERT_DIR/cert.pem" -noout -subject -issuer -dates
sudo openssl verify -untrusted "$CERT_DIR/chain.pem" "$CERT_DIR/cert.pem"
```

Certbot의 `certonly`는 인증서만 발급하고 웹 서버 설정은 변경하지 않습니다. 이 글의 경우 발급 결과물을 OCI Certificates Service에 import하므로 적절한 선택입니다.[3]

## 3. OCI import와 Listener 반영을 위한 설정 파일

스크립트와 설정 파일은 root 소유로 관리하고 설정 파일에는 `600` 권한을 적용합니다. 아래 OCID와 도메인은 예시이므로 반드시 교체합니다.

```bash
sudo install -d -m 700 /etc/oci-certificate-renew
sudo tee /etc/oci-certificate-renew/renew-oci-certificate.conf >/dev/null <<'EOF'
CERTIFICATE_OCID="ocid1.certificate.oc1.<region>.<unique_id>"
LOAD_BALANCER_OCID="ocid1.loadbalancer.oc1.<region>.<unique_id>"

# Certbot live 디렉터리 이름. 보통 최초 도메인 이름입니다.
CERTBOT_CERT_NAME="example.com"
CERTBOT_BIN="/opt/certbot-venv311/bin/certbot"
OCI_BIN="/usr/bin/oci"

# 자동 탐지가 불가능하거나 여러 Listener가 같은 certificate를 쓸 때 지정합니다.
LISTENER_NAME="https-443"
RENEW_BEFORE_DAYS=30
FORCE_RENEWAL=0

# root timer에서 일반 사용자 OCI 프로파일을 읽어야 하는 경우에만 지정합니다.
OCI_CLI_PROFILE="DEFAULT"
OCI_CLI_CONFIG_FILE="/home/opc/.oci/config"

CERTBOT_CONFIG_DIR="/opt/certbot-venv311/config"
CERTBOT_WORK_DIR="/opt/certbot-venv311/work"
CERTBOT_LOGS_DIR="/opt/certbot-venv311/logs"
LE_LIVE_DIR="/opt/certbot-venv311/config/live"
OCI_WAIT_SECONDS=1200
EOF
sudo chmod 600 /etc/oci-certificate-renew/renew-oci-certificate.conf
```

OCI import에는 leaf certificate, certificate chain, private key가 필요합니다. OCI CLI의 `update-certificate-by-importing-config-details`는 이 세 PEM을 인수로 받아 imported certificate를 업데이트합니다.[1] 일반적으로 `cert.pem`, `chain.pem`, `privkey.pem`을 사용하며, 특정 체인 구성이 이미 성공한 환경에서만 `fullchain.pem` 또는 별도 intermediate chain을 사용하도록 명시적으로 관리합니다. CA chain은 변경될 수 있으므로 특정 root를 무조건 덧붙이지 않습니다.

## 4. 갱신·import·Listener refresh 스크립트

아래 스크립트의 핵심은 **OCI의 실제 `CURRENT` certificate version**을 갱신 판단 기준으로 사용한다는 점입니다. 로컬 파일만 보고 판단하면 OCI 반영 실패 상태를 놓칠 수 있습니다.

```bash
#!/usr/bin/env bash
# /usr/local/sbin/renew-oci-certificate.sh
set -Eeuo pipefail

CONFIG_FILE=/etc/oci-certificate-renew/renew-oci-certificate.conf
source "$CONFIG_FILE"

: "${CERTIFICATE_OCID:?CERTIFICATE_OCID is required}"
: "${LOAD_BALANCER_OCID:?LOAD_BALANCER_OCID is required}"
: "${CERTBOT_CERT_NAME:?CERTBOT_CERT_NAME is required}"

RENEW_BEFORE_DAYS="${RENEW_BEFORE_DAYS:-30}"
FORCE_RENEWAL="${FORCE_RENEWAL:-0}"
SKIP_CERTBOT_RENEWAL="${SKIP_CERTBOT_RENEWAL:-0}"
OCI_ARGS=(--profile "$OCI_CLI_PROFILE" --config-file "$OCI_CLI_CONFIG_FILE")
CERTBOT_ARGS=(--config-dir "$CERTBOT_CONFIG_DIR" --work-dir "$CERTBOT_WORK_DIR" --logs-dir "$CERTBOT_LOGS_DIR")
CERT_DIR="${LE_LIVE_DIR}/${CERTBOT_CERT_NAME}"
CERT_PEM="$CERT_DIR/cert.pem"
CHAIN_PEM="$CERT_DIR/chain.pem"
KEY_PEM="$CERT_DIR/privkey.pem"
FULLCHAIN_PEM="$CERT_DIR/fullchain.pem"

for cmd in openssl jq flock "$OCI_BIN" "$CERTBOT_BIN"; do
  command -v "$cmd" >/dev/null 2>&1 || { echo "missing: $cmd" >&2; exit 1; }
done
umask 077
exec 9>/tmp/oci-certificate-renew.lock
flock -n 9 || { echo "another renewal is running"; exit 0; }

versions="$("$OCI_BIN" certs-mgmt certificate-version list \
  --certificate-id "$CERTIFICATE_OCID" --all "${OCI_ARGS[@]}")"
current="$(jq -ce '[.data.items[] | select(.stages | index("CURRENT"))] | if length == 1 then .[0] else error("CURRENT version") end' <<<"$versions")"
not_after="$(jq -er '.validity["time-of-validity-not-after"]' <<<"$current")"
expiry_epoch="$(date -d "$not_after" +%s)"
days_left=$(( (expiry_epoch - $(date +%s)) / 86400 ))
echo "OCI CURRENT expires at ${not_after} (${days_left} day(s) remaining)."

if (( FORCE_RENEWAL == 0 && days_left > RENEW_BEFORE_DAYS )); then
  echo "No renewal needed."
  exit 0
fi

for file in "$CERT_PEM" "$CHAIN_PEM" "$KEY_PEM" "$FULLCHAIN_PEM"; do
  [[ -r "$file" ]] || { echo "cannot read $file" >&2; exit 1; }
done
openssl x509 -in "$CERT_PEM" -noout >/dev/null
openssl pkey -in "$KEY_PEM" -noout >/dev/null
cmp -s <(openssl x509 -in "$CERT_PEM" -pubkey -noout) \
        <(openssl pkey -in "$KEY_PEM" -pubout) \
  || { echo "certificate and private key do not match" >&2; exit 1; }

if (( SKIP_CERTBOT_RENEWAL == 0 )); then
  "$CERTBOT_BIN" renew --cert-name "$CERTBOT_CERT_NAME" --force-renewal \
    --non-interactive "${CERTBOT_ARGS[@]}"
else
  echo "SKIP_CERTBOT_RENEWAL=1: reusing existing local certificate."
fi

new_expiry_epoch="$(openssl x509 -in "$FULLCHAIN_PEM" -noout -enddate | cut -d= -f2- | xargs -I{} date -d '{}' +%s)"
(( new_expiry_epoch > expiry_epoch )) || { echo "expiry did not advance; OCI unchanged" >&2; exit 1; }

request="$(mktemp /tmp/oci-certificate-import.XXXXXX.json)"
trap 'rm -f "$request"' EXIT
jq -n --arg certificateId "$CERTIFICATE_OCID" \
  --rawfile certificatePem "$CERT_PEM" \
  --rawfile certChainPem "$CHAIN_PEM" \
  --rawfile privateKeyPem "$KEY_PEM" \
  '{certificateId: $certificateId, certificatePem: $certificatePem, certChainPem: $certChainPem, privateKeyPem: $privateKeyPem, stage: "CURRENT"}' > "$request"

"$OCI_BIN" certs-mgmt certificate update-certificate-by-importing-config-details \
  --from-json "file://${request}" --wait-for-state ACTIVE \
  --max-wait-seconds "$OCI_WAIT_SECONDS" --force "${OCI_ARGS[@]}" >/dev/null

echo "OCI certificate version is ACTIVE."
lb_json="$("$OCI_BIN" lb load-balancer get --load-balancer-id "$LOAD_BALANCER_OCID" "${OCI_ARGS[@]}")"
listener="$(jq -ce --arg name "$LISTENER_NAME" '.data.listeners[$name]' <<<"$lb_json")"
"$OCI_BIN" lb listener update \
  --load-balancer-id "$LOAD_BALANCER_OCID" --listener-name "$LISTENER_NAME" \
  --default-backend-set-name "$(jq -er '.["default-backend-set-name"]' <<<"$listener")" \
  --port "$(jq -er '.port' <<<"$listener")" \
  --protocol "$(jq -er '.protocol' <<<"$listener")" \
  --ssl-certificate-ids "[\"${CERTIFICATE_OCID}\"]" \
  --wait-for-state SUCCEEDED --max-wait-seconds "$OCI_WAIT_SECONDS" \
  --force "${OCI_ARGS[@]}" >/dev/null

echo "SUCCESS: certificate renewed, imported to OCI, and listener updated."
```

```bash
sudo install -o root -g root -m 700 \
  renew-oci-certificate.sh /usr/local/sbin/renew-oci-certificate.sh
sudo /usr/local/sbin/renew-oci-certificate.sh
```

이 구현은 PEM 형식·certificate/private key 공개키 일치 여부를 먼저 확인합니다. Certbot 성공 뒤 로컬 인증서의 만료일이 늘어나지 않았으면 OCI를 바꾸지 않으므로, 잘못된 파일을 서비스 인증서로 적용하는 것을 방지합니다. OCI API 호출은 `ACTIVE`, Load Balancer 호출은 `SUCCEEDED`를 기다립니다.

## 5. 실제 실행 결과와 검증

원문 환경에서 강제 갱신을 수행해 OCI Certificates Service의 버전이 3개로 증가했고 최신 버전이 `Current`가 된 것을 확인했습니다. 최신 버전의 유효 기간은 2026-09-01부터 2026-11-30까지로 표시됩니다.

![OCI Certificates Service의 갱신된 certificate version](/assets/img/infrastructure/2026/oci-acme-certificate-renewal/oci-acme-certificate-versions.png "OCI Certificates Service의 갱신된 certificate version")

실행 로그는 다음 순서가 정상입니다.

```text
OCI CURRENT certificate version ... expires at ... (.. day(s) remaining).
Renewing Let's Encrypt certificate 'example.com'.
OCI certificate version is ACTIVE.
Refreshing listener 'https-443' with the current OCI certificate version.
SUCCESS: certificate renewed, imported to OCI, and listener updated.
```

Listener에는 Certificates Service의 certificate가 연결되어 있으며, TLS 1.2와 1.3을 허용하는 구성을 확인했습니다.

![Load Balancer Listener의 Certificates Service certificate 선택](/assets/img/infrastructure/2026/oci-acme-certificate-renewal/oci-acme-listener-certificate.png "Load Balancer Listener의 Certificates Service certificate 선택")

![Load Balancer Listener의 TLS 1.2 및 1.3 설정](/assets/img/infrastructure/2026/oci-acme-certificate-renewal/oci-acme-listener-tls.png "Load Balancer Listener의 TLS 1.2 및 1.3 설정")

외부 서비스 검증은 TLS handshake와 인증서 subject/issuer/만료일을 함께 확인합니다.

```bash
DOMAIN=example.com
openssl s_client -connect "${DOMAIN}:443" -servername "$DOMAIN" </dev/null 2>/dev/null \
  | openssl x509 -noout -subject -issuer -dates -serial

curl -Iv "https://${DOMAIN}/"
```

> 화면 캡처에는 운영 환경의 certificate 이름·compartment 이름·도메인 식별자가 보일 수 있습니다. 게시 전 조직의 공개 기준에 맞춰 마스킹 여부를 확인하세요. API key, private key, 전체 OCID, EAB HMAC은 어떤 경우에도 로그나 화면에 노출하면 안 됩니다.

## 6. 운영 명령과 실패 복구

일일 timer는 기본 실행만 수행합니다. OCI의 `CURRENT` 인증서가 30일보다 많이 남았다면 `No renewal needed.`로 종료합니다.

```bash
sudo /usr/local/sbin/renew-oci-certificate.sh
```

실제 end-to-end 갱신을 한 번 시험할 때만 임계값을 우회합니다. 이 명령은 CA에 실제 발급 요청을 보내므로 반복 실행하면 안 됩니다.

```bash
sudo FORCE_RENEWAL=1 /usr/local/sbin/renew-oci-certificate.sh
```

Certbot 발급은 성공했지만 OCI import 또는 Listener 업데이트만 실패했다면, 새 로컬 PEM을 재사용해 OCI 반영만 재시도합니다. 이 경로는 불필요한 ACME 재발급을 줄입니다.

```bash
sudo FORCE_RENEWAL=1 SKIP_CERTBOT_RENEWAL=1 \
  /usr/local/sbin/renew-oci-certificate.sh
```

Let’s Encrypt도 발급 제한을 두고 있으므로, 개발·통합 시험은 staging 또는 `--dry-run`을 우선 사용하고 운영 CA에 대한 강제 발급은 장애 검증 등 필요한 경우에만 사용해야 합니다.[8]

간단한 systemd timer 예시는 다음과 같습니다.

```ini
# /etc/systemd/system/oci-certificate-renew.service
[Unit]
Description=Renew ACME certificate and update OCI Certificate/Load Balancer

[Service]
Type=oneshot
ExecStart=/usr/local/sbin/renew-oci-certificate.sh
```

```ini
# /etc/systemd/system/oci-certificate-renew.timer
[Unit]
Description=Run OCI certificate renewal daily

[Timer]
OnCalendar=*-*-* 03:17:00
Persistent=true
RandomizedDelaySec=20m

[Install]
WantedBy=timers.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now oci-certificate-renew.timer
systemctl list-timers oci-certificate-renew.timer
journalctl -u oci-certificate-renew.service --since today
```

## 7. 운영 체크리스트

- [ ] `certbot plugins`에 `dns-oci`가 표시되는가?
- [ ] `CERTBOT_BIN`, OCI CLI 경로, `CERTBOT_CONFIG_DIR`가 같은 운영 계정/권한 모델과 일치하는가?
- [ ] API key, OCI config, 스크립트, timer가 root 또는 전용 운영 계정만 수정 가능하도록 제한됐는가?
- [ ] certificate/private key 공개키 일치 및 `openssl verify`를 확인했는가?
- [ ] OCI 인증서의 Common Name과 갱신 PEM의 Common Name이 같은가?[1]
- [ ] Load Balancer cipher suite가 실제 key type(RSA/ECDSA)과 TLS client 요구사항을 만족하는가?
- [ ] `SKIP_CERTBOT_RENEWAL=1` 복구 절차와 마지막 성공 로그를 운영 문서에 기록했는가?

## 부록: 같은 흐름에 Google Trust Services 인증서 적용하기

Google Trust Services(GTS) Public CA도 ACME를 통해 공개 신뢰 TLS 인증서를 무료로 발급합니다. OCI DNS-01, PEM 검증, OCI Certificates import, Listener refresh라는 **후반 자동화 흐름은 Let’s Encrypt와 동일**합니다. 달라지는 부분은 ACME endpoint와 계정 등록입니다.

### GTS에서 추가되는 준비

GTS Public CA는 External Account Binding(EAB)을 지원하는 ACME client가 필요합니다. Google Cloud 프로젝트에서 Public CA API를 활성화하고, EAB key를 만들 권한(`roles/publicca.externalAccountKeyCreator`)을 부여합니다.[6]

```bash
gcloud services enable publicca.googleapis.com

gcloud publicca external-account-keys create
```

출력의 `keyId`, `b64MacKey`는 민감 정보입니다. secret manager 등 안전한 위치에 저장하고 로그에 남기지 마세요. EAB secret은 발급 후 7일 내에 사용해야 하며, 한 ACME account 등록에 한 번만 사용할 수 있습니다.[6]

### Certbot을 GTS ACME endpoint에 등록

먼저 GTS staging endpoint로 DNS-01과 EAB 구성을 검증합니다. staging 인증서는 브라우저가 신뢰하지 않으므로 Listener 운영 적용 검증에는 사용하지 않습니다.[6]

```bash
CERTBOT=/opt/certbot-venv311/bin/certbot

# GTS staging: 통합 시험용, 공개 신뢰 인증서가 아님
sudo "$CERTBOT" register \
  --email ops@example.com --no-eff-email \
  --server https://dv.acme-v02.test-api.pki.goog/directory \
  --eab-kid "$EAB_KID" \
  --eab-hmac-key "$EAB_HMAC_KEY"
```

운영 endpoint는 다음입니다.

```text
https://dv.acme-v02.api.pki.goog/directory
```

GTS production EAB key를 사용해 계정을 등록한 뒤, 최초 발급 명령에 `--server`만 추가합니다. DNS authenticator는 기존과 동일하게 OCI DNS를 사용합니다.

```bash
sudo "$CERTBOT" certonly \
  --email ops@example.com --agree-tos --no-eff-email \
  --server https://dv.acme-v02.api.pki.goog/directory \
  --logs-dir /opt/certbot-venv311/logs \
  --work-dir /opt/certbot-venv311/work \
  --config-dir /opt/certbot-venv311/config \
  --authenticator dns-oci \
  --dns-oci-propagation-seconds 120 \
  -d '*.example.com'
```

### Let’s Encrypt 대비 변경점

| 구분 | Let’s Encrypt | Google Trust Services Public CA |
|---|---|---|
| ACME account 등록 | 일반 Certbot 등록 흐름 | GCP project 기반 EAB key ID/HMAC 필요 |
| ACME directory | Certbot 기본 endpoint 사용 가능 | `--server https://dv.acme-v02.api.pki.goog/directory` 명시 |
| 사전 권한 | DNS API·OCI 권한 | DNS API·OCI 권한 + GCP Public CA API/EAB 생성 권한 |
| DNS-01 처리 | `certbot-dns-oci` | 동일한 `certbot-dns-oci` |
| OCI import/Listener update | 이 글의 스크립트 | 동일한 스크립트 |
| staging | Let’s Encrypt staging 또는 `--dry-run` | GTS staging endpoint 및 staging용 EAB key 사용 |

GTS를 사용할 때는 production/staging endpoint와 그에 대응하는 EAB key를 섞지 않아야 합니다. 또한 Google은 certificate chain과 key type이 고정된 것으로 가정하지 말고 RSA와 ECDSA를 모두 처리할 수 있게 설계할 것을 권고합니다.[4] 따라서 CA를 바꾼 뒤에는 `openssl s_client`로 실제 제공 체인과 key type을 다시 확인하고, OCI Load Balancer의 TLS/cipher 호환성도 재검증하세요.

## 마무리

ACME 인증서 자동화의 핵심은 단순히 Certbot을 매일 실행하는 것이 아닙니다. **실제로 서비스가 사용하는 OCI `CURRENT` 버전을 기준으로 갱신을 판단**하고, PEM 무결성을 확인한 후 `ACTIVE`와 `SUCCEEDED`까지 대기해야 운영 상태와 로컬 상태의 불일치를 줄일 수 있습니다.

Let’s Encrypt와 GTS는 ACME endpoint·계정 등록 방식은 다르지만, OCI DNS-01과 OCI Certificates import 이후 Load Balancer 반영 흐름은 그대로 재사용할 수 있습니다. 따라서 CA 교체는 발급 계층의 설정 변경으로 제한하고, PEM 검증·OCI 반영·외부 TLS 검증은 동일한 운영 표준으로 유지하는 것이 좋습니다.

## References

1. [Updating a Certificate PEM - Oracle Cloud Infrastructure](https://docs.oracle.com/en-us/iaas/Content/certificates/updating-certificate-PEM.htm)
2. [Importing a Certificate - Oracle Cloud Infrastructure](https://docs.oracle.com/en-us/iaas/Content/certificates/importing-certificate.htm)
3. [Certbot User Guide](https://eff-certbot.readthedocs.io/en/stable/using.html)
4. [Google Trust Services FAQ](https://pki.goog/faq/)
5. [therealcmj/certbot-dns-oci](https://github.com/therealcmj/certbot-dns-oci)
6. [Request a certificate using Public CA and an ACME client - Google Cloud](https://docs.cloud.google.com/certificate-manager/docs/public-ca-tutorial)
7. [Public CA - Google Cloud](https://docs.cloud.google.com/certificate-manager/docs/public-ca)
8. [Let’s Encrypt Rate Limits](https://letsencrypt.org/docs/rate-limits/)
