---
layout: page-fullwidth
subheadline: "Security & Automation"
title: "OCI Certificates와 Load Balancer를 위한 Let’s Encrypt 인증서 발급·갱신 자동화"
teaser: "Let’s Encrypt 와일드카드 인증서를 Certbot DNS-01으로 발급·갱신하고 OCI Certificates Service import와 Load Balancer Listener 반영까지 안전하게 자동화합니다."
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
# Copy to renew-oci-certificate.conf and restrict it to the account that runs
# the timer: chmod 600 renew-oci-certificate.conf
CERTIFICATE_OCID="ocid1.certificate.oc1.<region>.<unique_id>"

LOAD_BALANCER_OCID="ocid1.loadbalancer.oc1.<region>.<unique_id>"

# The Certbot certificate name is normally the directory name under
# /etc/letsencrypt/live (often the primary domain name).
CERTBOT_CERT_NAME="example.com"
CERTBOT_CONFIG_DIR="/home/opc/certbot-venv311/config"

# Certbot installed in a Python virtual environment must use its absolute
# executable path. Examples: /opt/certbot-venv311/bin/certbot or
# /home/oci-renew/certbot-venv311/bin/certbot
CERTBOT_BIN="/home/opc/certbot-venv311/bin/certbot"

# Set an absolute path as well if OCI CLI is installed only for the opc user.
OCI_BIN="oci"

# Leave empty to auto-detect the single listener currently using CERTIFICATE_OCID.
# Set it explicitly if multiple listeners use the certificate.
LISTENER_NAME=""

# 30 days is recommended for Let's Encrypt's 90-day certificates.
RENEW_BEFORE_DAYS=30

# Keep 0 for the daily timer. Set to 1 only in a one-off command when testing
# a real end-to-end renewal; do not save 1 here.
FORCE_RENEWAL=0

# Set only when the configured OCI CLI profile is not DEFAULT.
OCI_CLI_PROFILE="DEFAULT"

# Required when this script runs as root but OCI CLI is configured for another
# user (for example, opc). Root can read a private key protected by mode 600.
OCI_CLI_CONFIG_FILE="/home/opc/.oci/config"

# Usually leave unchanged. Override only if Certbot's live directory differs.
LE_LIVE_DIR="/home/opc/certbot-venv311/config/live"
OCI_WAIT_SECONDS=1200

CERTBOT_WORK_DIR="/home/opc/certbot-venv311/work"
CERTBOT_LOGS_DIR="/home/opc/certbot-venv311/logs"

OCI_CERT_CHAIN_PEM="/home/opc/certbot-venv311/config/live/example.com/chain.pem"
OCI_CHAIN_EXTRA_CERT_PEM="/etc/oci-certificate-renew/isrg-root-x1.pem"
EOF
sudo chmod 600 /etc/oci-certificate-renew/renew-oci-certificate.conf
```

OCI import에는 leaf certificate, certificate chain, private key가 필요합니다. OCI CLI의 `update-certificate-by-importing-config-details`는 이 세 PEM을 인수로 받아 imported certificate를 업데이트합니다.[1] 최신 설정은 기본적으로 `chain.pem`을 사용하며, 이미 성공한 import 형식과 맞춰야 할 때만 `OCI_CERT_CHAIN_PEM`으로 `fullchain.pem` 등을 명시합니다. `OCI_CHAIN_EXTRA_CERT_PEM`은 필요한 추가 CA PEM을 임시 chain에 결합하는 선택값입니다. CA chain은 변경될 수 있으므로 특정 root를 모든 환경에 일괄 추가하지 말고, 성공한 import 및 클라이언트 검증 결과를 기준으로 적용하세요.

## 4. 갱신·import·Listener refresh 스크립트

아래는 원문의 최신 스크립트를 반영한 버전입니다. 스크립트와 같은 디렉터리의 `renew-oci-certificate.conf`를 기본으로 읽고, 없으면 `/etc/oci-certificate-renew/renew-oci-certificate.conf`를 사용합니다. 단발성 `FORCE_RENEWAL`·`SKIP_CERTBOT_RENEWAL` 환경변수는 설정 파일보다 우선합니다. 핵심은 **OCI의 실제 `CURRENT` certificate version**을 갱신 판단 기준으로 사용한다는 점입니다. 로컬 파일만 보고 판단하면 OCI 반영 실패 상태를 놓칠 수 있습니다.

```bash
#!/usr/bin/env bash
# Let's Encrypt 인증서를 갱신하고, 새 PEM을 OCI Certificates Service에 import한 뒤
# OCI Load Balancer Listener에 반영한다.
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# CONFIG_FILE을 직접 넘기지 않으면 스크립트와 같은 디렉터리의 설정을 우선 사용한다.
CONFIG_FILE="${CONFIG_FILE:-${SCRIPT_DIR}/renew-oci-certificate.conf}"
# source 이후 설정 파일 값으로 덮어써지지 않도록 일회성 환경 변수 값을 미리 보관한다.
FORCE_RENEWAL_FROM_ENV="${FORCE_RENEWAL:-}"
SKIP_CERTBOT_RENEWAL_FROM_ENV="${SKIP_CERTBOT_RENEWAL:-}"
# systemd 배포 시에는 /etc의 root 전용 설정 파일을 자동으로 찾는다.
if [[ ! -r "$CONFIG_FILE" && -r /etc/oci-certificate-renew/renew-oci-certificate.conf ]]; then
  CONFIG_FILE=/etc/oci-certificate-renew/renew-oci-certificate.conf
fi

if [[ ! -r "$CONFIG_FILE" ]]; then
  echo "Configuration file not found: $CONFIG_FILE" >&2
  exit 1
fi
# shellcheck은 아래 설정 파일 예시를 기준으로 변수 정의를 확인한다.
source "$CONFIG_FILE"
# 일회성 환경 변수는 영구 설정 파일보다 우선한다. 따라서 일일 타이머는
# FORCE_RENEWAL=0을 안전하게 유지하면서 필요할 때만 강제 실행할 수 있다.
[[ -n "$FORCE_RENEWAL_FROM_ENV" ]] && FORCE_RENEWAL="$FORCE_RENEWAL_FROM_ENV"
[[ -n "$SKIP_CERTBOT_RENEWAL_FROM_ENV" ]] && SKIP_CERTBOT_RENEWAL="$SKIP_CERTBOT_RENEWAL_FROM_ENV"

: "${CERTIFICATE_OCID:?CERTIFICATE_OCID is required}"
: "${LOAD_BALANCER_OCID:?LOAD_BALANCER_OCID is required}"
: "${CERTBOT_CERT_NAME:?CERTBOT_CERT_NAME is required}"

RENEW_BEFORE_DAYS="${RENEW_BEFORE_DAYS:-30}"
# 실제 갱신을 일회성으로 시험할 때만 1로 설정한다. 일일 타이머 설정에 남기면
# 매일 새 인증서를 요청하므로 항상 0으로 유지한다.
FORCE_RENEWAL="${FORCE_RENEWAL:-0}"
# 이미 갱신된 로컬 인증서로 OCI import/LB 적용만 재시도할 때 1로 설정한다.
# 불필요한 두 번째 ACME 인증서 발급을 막는다.
SKIP_CERTBOT_RENEWAL="${SKIP_CERTBOT_RENEWAL:-0}"
CERTBOT_BIN="${CERTBOT_BIN:-certbot}"
OCI_BIN="${OCI_BIN:-oci}"
# OCI CLI의 선택 옵션은 배열로 구성해 공백이 있는 경로도 하나의 인자로 안전하게 전달한다.
OCI_PROFILE_ARGS=()
[[ -n "${OCI_CLI_PROFILE:-}" ]] && OCI_PROFILE_ARGS+=(--profile "$OCI_CLI_PROFILE")
[[ -n "${OCI_CLI_CONFIG_FILE:-}" ]] && OCI_PROFILE_ARGS+=(--config-file "$OCI_CLI_CONFIG_FILE")
# Certbot 최초 발급 시 사용한 상태 디렉터리를 renew에도 동일하게 전달한다.
CERTBOT_DIR_ARGS=()
[[ -n "${CERTBOT_CONFIG_DIR:-}" ]] && CERTBOT_DIR_ARGS+=(--config-dir "$CERTBOT_CONFIG_DIR")
[[ -n "${CERTBOT_WORK_DIR:-}" ]] && CERTBOT_DIR_ARGS+=(--work-dir "$CERTBOT_WORK_DIR")
[[ -n "${CERTBOT_LOGS_DIR:-}" ]] && CERTBOT_DIR_ARGS+=(--logs-dir "$CERTBOT_LOGS_DIR")
LE_LIVE_DIR="${LE_LIVE_DIR:-/etc/letsencrypt/live}"
CERT_DIR="${LE_LIVE_DIR}/${CERTBOT_CERT_NAME}"
CERT_PEM="${CERT_DIR}/cert.pem"
CHAIN_PEM="${CERT_DIR}/chain.pem"
PRIVATE_KEY_PEM="${CERT_DIR}/privkey.pem"
FULLCHAIN_PEM="${CERT_DIR}/fullchain.pem"
# 일반적으로 chain.pem을 사용한다. 기존 OCI import가 fullchain.pem 형식을
# 요구한 것이 확인된 경우에만 OCI_CERT_CHAIN_PEM을 fullchain.pem으로 지정한다.
OCI_CERT_CHAIN_PEM="${OCI_CERT_CHAIN_PEM:-$CHAIN_PEM}"
OCI_CHAIN_EXTRA_CERT_PEM="${OCI_CHAIN_EXTRA_CERT_PEM:-}"
LOCK_FILE="${LOCK_FILE:-/tmp/oci-certificate-renew.lock}"

log() { printf '%s %s\n' "$(date -Is)" "$*"; }
die() { log "ERROR: $*" >&2; exit 1; }

# 실행에 필요한 명령이 없으면 OCI 변경 전 즉시 중단한다.
for command in openssl jq flock; do
  command -v "$command" >/dev/null 2>&1 || die "Required command is missing: $command"
done
[[ -x "$OCI_BIN" ]] || command -v "$OCI_BIN" >/dev/null 2>&1 \
  || die "OCI CLI executable is not available: $OCI_BIN"
[[ -x "$CERTBOT_BIN" ]] || command -v "$CERTBOT_BIN" >/dev/null 2>&1 \
  || die "Certbot executable is not available: $CERTBOT_BIN"
umask 077
# flock의 파일 디스크립터를 열어, 동시에 실행된 타이머가 인증서를 중복 갱신하지 못하게 한다.
exec 9>"$LOCK_FILE"
flock -n 9 || { log "Another renewal process is already running; exiting."; exit 0; }

# 로컬 파일이 아닌 OCI의 CURRENT 버전 만료일을 갱신 기준으로 사용한다.
certificate_versions_json="$("$OCI_BIN" certs-mgmt certificate-version list \
  --certificate-id "$CERTIFICATE_OCID" \
  --all \
  "${OCI_PROFILE_ARGS[@]}")"
# OCI CLI 버전에 따라 data가 배열이거나 data.items 객체일 수 있어 두 형식을 모두 처리한다.
# 정확히 하나의 CURRENT 버전만 존재해야 안전하게 자동화할 수 있다.
current_version_json="$(jq -ce '
  [(.data | if type == "object" then (.items // []) else . end)[]
   | select((.stages // []) | index("CURRENT"))]
  | if length == 1 then .[0] else error("expected exactly one CURRENT certificate version") end
' <<<"$certificate_versions_json")" \
  || die "Could not determine the CURRENT OCI certificate version."
not_after="$(jq -er '.validity["time-of-validity-not-after"]' <<<"$current_version_json")" \
  || die "OCI CURRENT certificate version has no validity end date."
current_version_number="$(jq -er '."version-number"' <<<"$current_version_json")"
expiry_epoch="$(date -d "$not_after" +%s)" \
  || die "Could not parse OCI certificate expiry: $not_after"
now_epoch="$(date +%s)"
# 소수점 시간은 버리고 남은 일수 단위로 비교한다.
days_left=$(( (expiry_epoch - now_epoch) / 86400 ))
log "OCI CURRENT certificate version ${current_version_number} expires at ${not_after} (${days_left} day(s) remaining). Renewal threshold: ${RENEW_BEFORE_DAYS} day(s)."

if [[ "$FORCE_RENEWAL" != "0" && "$FORCE_RENEWAL" != "1" ]]; then
  die "FORCE_RENEWAL must be 0 or 1."
fi
if [[ "$SKIP_CERTBOT_RENEWAL" != "0" && "$SKIP_CERTBOT_RENEWAL" != "1" ]]; then
  die "SKIP_CERTBOT_RENEWAL must be 0 or 1."
fi

if (( FORCE_RENEWAL == 0 && days_left > RENEW_BEFORE_DAYS )); then
  log "No renewal needed."
  exit 0
fi

if (( FORCE_RENEWAL == 1 )); then
  log "FORCE_RENEWAL=1: bypassing the expiry threshold for this run."
fi

# 실제 OCI import에 필요한 PEM 파일과 만료일 확인용 fullchain.pem의 읽기 권한을 확인한다.
for file in "$CERT_PEM" "$OCI_CERT_CHAIN_PEM" "$PRIVATE_KEY_PEM" "$FULLCHAIN_PEM"; do
  [[ -r "$file" ]] || die "Cannot read $file"
done
IMPORT_CHAIN_PEM="$OCI_CERT_CHAIN_PEM"
TEMP_CHAIN_PEM=""
IMPORT_REQUEST_JSON=""
cleanup() {
  # 공개 체인 임시 파일과 private key를 포함하는 JSON은 성공·실패 모두에서 제거한다.
  [[ -n "${TEMP_CHAIN_PEM:-}" ]] && rm -f -- "$TEMP_CHAIN_PEM"
  [[ -n "${IMPORT_REQUEST_JSON:-}" ]] && rm -f -- "$IMPORT_REQUEST_JSON"
}
trap cleanup EXIT
if [[ -n "$OCI_CHAIN_EXTRA_CERT_PEM" ]]; then
  [[ -r "$OCI_CHAIN_EXTRA_CERT_PEM" ]] || die "Cannot read $OCI_CHAIN_EXTRA_CERT_PEM"
  TEMP_CHAIN_PEM="$(mktemp "${TMPDIR:-/tmp}/oci-certificate-chain.XXXXXX.pem")"
  # OCI가 요구하는 경우에만 기본 chain 뒤에 추가 Root PEM을 붙여 임시 체인을 만든다.
  awk '1' "$OCI_CERT_CHAIN_PEM" "$OCI_CHAIN_EXTRA_CERT_PEM" > "$TEMP_CHAIN_PEM"
  IMPORT_CHAIN_PEM="$TEMP_CHAIN_PEM"
fi
openssl x509 -in "$CERT_PEM" -noout >/dev/null \
  || die "Leaf certificate is not a readable PEM: $CERT_PEM"
openssl pkey -in "$PRIVATE_KEY_PEM" -noout >/dev/null \
  || die "Private key is not a readable PEM: $PRIVATE_KEY_PEM"
# 인증서 공개키와 private key에서 추출한 공개키를 비교해 잘못된 키 쌍 업로드를 막는다.
if ! cmp -s \
  <(openssl x509 -in "$CERT_PEM" -pubkey -noout) \
  <(openssl pkey -in "$PRIVATE_KEY_PEM" -pubout); then
  die "Leaf certificate and private key do not match."
fi

# 로컬 인증서가 OCI CURRENT보다 새로우면 이전 실행의 OCI 단계만 실패한 것으로 간주한다.
local_expiry_epoch="$(openssl x509 -in "$FULLCHAIN_PEM" -noout -enddate | cut -d= -f2- | xargs -I{} date -d '{}' +%s)"
if (( SKIP_CERTBOT_RENEWAL == 0 && local_expiry_epoch > expiry_epoch )); then
  # 이전 실행에서 ACME 발급은 성공했지만 OCI import가 실패했을 수 있다.
  # 새 인증서를 다시 요청하지 않고, 더 최신인 로컬 인증서를 재사용한다.
  SKIP_CERTBOT_RENEWAL=1
  log "A local certificate newer than the OCI CURRENT version already exists; skipping Certbot and retrying OCI import."
fi

if (( SKIP_CERTBOT_RENEWAL == 0 )); then
  CERTBOT_WAS_RUN=1
  log "Renewing Let's Encrypt certificate '${CERTBOT_CERT_NAME}'."
  # 일반 실행은 앞선 만료일 확인으로 시점이 제한된다. FORCE_RENEWAL=1은
  # 이 제한을 의도적으로 우회하는 일회성 운영자 명령이다.
  "$CERTBOT_BIN" renew --cert-name "$CERTBOT_CERT_NAME" --force-renewal --non-interactive \
    "${CERTBOT_DIR_ARGS[@]}"
else
  CERTBOT_WAS_RUN=0
  log "SKIP_CERTBOT_RENEWAL=1: using the existing local certificate for OCI retry."
fi

if (( CERTBOT_WAS_RUN == 1 )); then
  # Certbot이 새 파일을 교체했으므로 갱신 후 만료일을 다시 읽는다.
  new_expiry_epoch="$(openssl x509 -in "$FULLCHAIN_PEM" -noout -enddate | cut -d= -f2- | xargs -I{} date -d '{}' +%s)"
else
  new_expiry_epoch="$local_expiry_epoch"
fi
if (( new_expiry_epoch <= expiry_epoch )); then
  die "Certbot completed but the certificate expiry did not advance; OCI was not changed."
fi
log "Importing the local certificate into OCI Certificates Service (certificate: ${CERT_PEM}, chain: ${IMPORT_CHAIN_PEM})."
IMPORT_REQUEST_JSON="$(mktemp "${TMPDIR:-/tmp}/oci-certificate-import.XXXXXX.json")"
# --from-json을 사용하면 PEM 내용이 프로세스 인자 목록에 노출되지 않는다.
# jq --rawfile은 PEM의 줄바꿈을 보존해 OCI API가 기대하는 문자열을 만든다.
jq -n \
  --arg certificate_id "$CERTIFICATE_OCID" \
  --rawfile certificate_pem "$CERT_PEM" \
  --rawfile cert_chain_pem "$IMPORT_CHAIN_PEM" \
  --rawfile private_key_pem "$PRIVATE_KEY_PEM" \
  '{
    certificateId: $certificate_id,
    certificatePem: $certificate_pem,
    certChainPem: $cert_chain_pem,
    privateKeyPem: $private_key_pem,
    stage: "CURRENT"
  }' > "$IMPORT_REQUEST_JSON"

# import 완료 후 ACTIVE 상태까지 대기한다. 실패하면 set -e로 Listener 갱신을 수행하지 않는다.
"$OCI_BIN" certs-mgmt certificate update-certificate-by-importing-config-details \
  --from-json "file://${IMPORT_REQUEST_JSON}" \
  --wait-for-state ACTIVE \
  --max-wait-seconds "${OCI_WAIT_SECONDS:-1200}" \
  --force \
  "${OCI_PROFILE_ARGS[@]}" >/dev/null

log "OCI certificate version is ACTIVE. Resolving the Load Balancer listener."
# Listener 갱신에 필요한 backend set, port, protocol은 현재 LB 설정에서 읽어 보존한다.
lb_json="$("$OCI_BIN" lb load-balancer get --load-balancer-id "$LOAD_BALANCER_OCID" "${OCI_PROFILE_ARGS[@]}")"
if [[ -z "${LISTENER_NAME:-}" ]]; then
  # Listener 이름을 비워 둔 경우에는 이 Certificate OCID를 참조하는 Listener를 자동 탐색한다.
  mapfile -t matching_listeners < <(
    jq -r --arg certificate_id "$CERTIFICATE_OCID" '
      .data.listeners | to_entries[]
      | select((.value["ssl-configuration"]["certificate-ids"] // []) | index($certificate_id))
      | .key
    ' <<<"$lb_json"
  )
  if (( ${#matching_listeners[@]} != 1 )); then
    die "Could not uniquely find the listener using this certificate. Set LISTENER_NAME in $CONFIG_FILE."
  fi
  LISTENER_NAME="${matching_listeners[0]}"
fi

listener_json="$(jq -ce --arg listener "$LISTENER_NAME" '.data.listeners[$listener]' <<<"$lb_json")" \
  || die "Listener '$LISTENER_NAME' was not found on the specified Load Balancer."
backend_set="$(jq -er '.["default-backend-set-name"]' <<<"$listener_json")"
port="$(jq -er '.port' <<<"$listener_json")"
protocol="$(jq -er '.protocol' <<<"$listener_json")"

log "Refreshing listener '${LISTENER_NAME}' with the current OCI certificate version."
# 기존 Listener 속성은 유지하고, 같은 Certificate OCID의 새 CURRENT 버전을 다시 적용한다.
"$OCI_BIN" lb listener update \
  --load-balancer-id "$LOAD_BALANCER_OCID" \
  --listener-name "$LISTENER_NAME" \
  --default-backend-set-name "$backend_set" \
  --port "$port" \
  --protocol "$protocol" \
  --ssl-certificate-ids "[\"${CERTIFICATE_OCID}\"]" \
  --wait-for-state SUCCEEDED \
  --max-wait-seconds "${OCI_WAIT_SECONDS:-1200}" \
  --force \
  "${OCI_PROFILE_ARGS[@]}" >/dev/null

log "SUCCESS: certificate imported to OCI and listener '${LISTENER_NAME}' updated."
```

```bash
sudo install -o root -g root -m 700 \
  renew-oci-certificate.sh /usr/local/sbin/renew-oci-certificate.sh
# 설정 파일은 스크립트 디렉터리 또는 /etc/oci-certificate-renew/에 둡니다.
sudo /usr/local/sbin/renew-oci-certificate.sh

# 다른 경로의 설정 파일을 일회성으로 사용하려면
sudo CONFIG_FILE=/secure/path/renew-oci-certificate.conf \
  /usr/local/sbin/renew-oci-certificate.sh
```

이 구현은 설정 파일 탐색 실패, 필수 값, 실행 파일, PEM 형식·certificate/private key 공개키 일치를 모두 먼저 확인합니다. `flock`으로 동시 실행을 막고, `FORCE_RENEWAL`과 `SKIP_CERTBOT_RENEWAL`에는 `0` 또는 `1`만 허용합니다. Certbot 성공 뒤 로컬 인증서의 만료일이 늘어나지 않았으면 OCI를 바꾸지 않으므로, 잘못된 파일을 서비스 인증서로 적용하는 것을 방지합니다. OCI API 호출은 `ACTIVE`, Load Balancer 호출은 `SUCCEEDED`를 기다립니다. `LISTENER_NAME`을 비워 두면 이 certificate OCID를 사용하는 Listener가 정확히 하나일 때 자동으로 찾아 갱신하고, 0개 또는 여러 개면 안전하게 중단합니다.

## 5. 실제 실행 결과와 검증

원문 환경에서 강제 갱신을 수행해 OCI Certificates Service의 버전이 3개로 증가했고 최신 버전이 `Current`가 된 것을 확인했습니다. 최신 버전의 유효 기간은 2026-09-01부터 2026-11-30까지로 표시됩니다.

![OCI Certificates Service의 갱신된 certificate version](/assets/img/infrastructure/2026/oci-acme-certificate-renewal/oci-acme-certificate-versions.png "OCI Certificates Service의 갱신된 certificate version")

실행 로그는 다음 순서가 정상입니다.

```text
2026-..-..T..:..:..+..:.. OCI CURRENT certificate version ... expires at ... (.. day(s) remaining). Renewal threshold: 30 day(s).
2026-..-..T..:..:..+..:.. Renewing Let's Encrypt certificate 'example.com'.
2026-..-..T..:..:..+..:.. OCI certificate version is ACTIVE. Resolving the Load Balancer listener.
2026-..-..T..:..:..+..:.. Refreshing listener 'https-443' with the current OCI certificate version.
2026-..-..T..:..:..+..:.. SUCCESS: certificate renewed, imported to OCI, and listener 'https-443' updated.
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
