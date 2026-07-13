---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "Bastion VM을 경유하여 SQL Developer로 OCI Private Subnet Database 접속하기"
teaser: "OCI Private Subnet에 위치한 Base Database에 로컬 SQL Developer로 접속하기 위해, Public Subnet에 Bastion VM(점프 서버)을 구성하고 SSH 로컬 포트 포워딩 터널을 경유하는 방법을 정리합니다. Bastion VM 생성, Security List Rule 구성, SSH 터널 설정, SQL Developer 접속 정보 입력까지의 절차를 다룹니다."
author: "yhcho"
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, database, base-database, sql-developer, bastion, ssh-tunnel, private-subnet]
#
# Styling
#
header: no
# image:
#     title: mediaplayer_js-title.jpg
#     thumb: mediaplayer_js-thumb.jpg
#     homepage: mediaplayer_js-home.jpg
#     caption: Photo by Corey Blaz
#     caption_url: https://blaz.photography/
# mediaplayer: true

---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

### 개요

OCI에서 Database는 보안상 인터넷에서 직접 접근할 수 없는 **Private Subnet**에 배치하는 것이 일반적입니다. 이 경우 로컬 PC에서 SQL Developer로 데이터베이스에 바로 접속할 수 없으므로, 중간에 접속을 중계할 **Bastion(점프 서버)**이 필요합니다.

OCI는 완전 관리형 **Bastion 서비스**를 제공하지만, 세션 수명이 최대 3시간으로 제한되어 상시 접속에는 번거로운 면이 있습니다. 이번 포스팅에서는 관리형 Bastion 서비스 대신, **Public Subnet에 Bastion 용도의 Compute VM을 직접 생성**하고 이를 SSH 점프 서버로 사용하여 SQL Developer를 Private Subnet의 Database에 접속하는 방법을 정리합니다.

핵심 원리는 다음과 같습니다. 로컬 PC에서 Bastion VM으로 SSH 연결을 맺으면서 **로컬 포트 포워딩(SSH Local Port Forwarding)** 터널을 함께 생성하고, SQL Developer는 원격 Database가 아니라 로컬에 열린 터널 입구(`localhost`)로 접속합니다. 그러면 트래픽이 `내 PC → Bastion VM → Private Subnet Database` 경로로 전달됩니다.

```
내 PC (localhost:1521) ──SSH 터널──▶ Bastion VM ──내부망──▶ DB Private IP:1521
```

### 목적
* Public Subnet에 Bastion 용도의 Compute VM 생성
* Bastion VM으로의 SSH 접속(22)과 Bastion → Database 통신(1521)을 허용하도록 Security List Rule 구성
* SSH 로컬 포트 포워딩 터널 생성
* SQL Developer에서 `localhost` 기준 접속 정보 입력 및 연결 확인

### 고려사항
* Bastion VM은 Database와 **동일한 VCN**의 Public Subnet에 생성하여, 내부망으로 Private Subnet Database에 도달할 수 있어야 합니다.
* Bastion VM은 최소 사양(예: VM.Standard.E2.1.Micro, Always Free 대상)으로 충분합니다. 점프 용도 외 작업을 올리지 않는 것이 보안상 바람직합니다.
* SSH 22번 포트는 가능한 한 **관리자 PC의 공인 IP만** 허용하고, `0.0.0.0/0` 전체 개방은 지양합니다.
* Private Subnet Database의 Security List에는 **Bastion이 위치한 Public Subnet CIDR(또는 Bastion 사설 IP)**에서 오는 1521 트래픽만 허용합니다.
* 로컬 SSH 클라이언트가 OpenSSH 8.8 이상인 경우 `ssh-rsa` 키 협상이 기본 비활성화되어 접속이 실패할 수 있으므로, 이 경우 별도 옵션이 필요합니다(트러블슈팅 참고).
* 운영 환경에서는 Security List보다 NSG(Network Security Group)를 사용하여 VNIC 단위로 규칙을 세밀하게 제어하는 구성을 권장합니다.

### 구성 환경
이번 예시에서는 다음과 같은 네트워크 구성을 사용합니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="Bastion VM configuration example"><caption></caption><colgroup><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1">항목</th>
      <th class="entry" id="About__entry__2">값</th>
      <th class="entry" id="About__entry__3">설명</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">VCN</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">vcn-dbcs-demo</span></td>
      <td class="entry" headers="About__entry__3">Bastion VM과 Database가 위치한 VCN</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Public Subnet CIDR</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">10.0.0.0/24</span></td>
      <td class="entry" headers="About__entry__3">Bastion VM이 위치한 Subnet</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Private Subnet CIDR</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">10.0.1.0/24</span></td>
      <td class="entry" headers="About__entry__3">Database가 위치한 Subnet</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Bastion VM Public IP</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">131.186.21.40</span></td>
      <td class="entry" headers="About__entry__3">로컬에서 SSH로 접속하는 주소</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Database Private IP</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">10.0.1.63</span></td>
      <td class="entry" headers="About__entry__3">터널의 최종 목적지 (SSH Local Port Forward 대상)</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">허용 포트</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">TCP 22, TCP 1521</span></td>
      <td class="entry" headers="About__entry__3">SSH 접속(22), Bastion → DB 리스너 통신(1521)</td>
      </tr>
      </tbody>
</table>

### 1. Bastion VM 생성
Database와 동일한 VCN의 **Public Subnet**에 Bastion 용도의 Compute Instance를 생성합니다. OCI Console에서 **Compute > Instances > Create Instance**로 이동합니다.

인스턴스 생성 화면에서 다음 항목을 설정합니다.

* **Image and shape:** Oracle Linux(예: Oracle Linux 8) / 최소 사양(예: VM.Standard.E2.1.Micro)
* **Networking > Virtual cloud network:** Database와 동일한 VCN(`vcn-dbcs-demo`) 선택
* **Networking > Subnet:** Public Subnet(`10.0.0.0/24`) 선택
* **Public IPv4 address:** **Assign a public IPv4 address** 활성화
* **Add SSH keys:** 로컬에 보관 중인 공개키 업로드 또는 신규 키페어 생성 후 개인키 다운로드

인스턴스가 **Running** 상태가 되면 상세 화면에서 **Public IP Address**와 (SSH Local Port Forward에 필요한) **Private IP Address**를 확인합니다.

![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-01.png " ")

> Oracle Linux 이미지의 기본 SSH 사용자 계정은 `opc`입니다. Ubuntu 이미지를 사용한 경우 `ubuntu` 계정을 사용합니다.

### 2. Security List Rule 구성
Bastion VM으로의 SSH 접속과, Bastion에서 Database로 향하는 통신을 각각 허용해야 합니다. 두 Subnet의 Security List에 규칙을 나누어 추가합니다.

**Public Subnet Security List — Ingress Rules**

Bastion VM으로 SSH 접속을 허용합니다. Source CIDR은 가능한 한 관리자 PC의 공인 IP로 제한합니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="Security list rules for bastion public subnet"><caption></caption><colgroup><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="Pub__entry__1">Source CIDR</th>
      <th class="entry" id="Pub__entry__2">IP Protocol</th>
      <th class="entry" id="Pub__entry__3">Destination Port Range</th>
      <th class="entry" id="Pub__entry__4">설명</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="Pub__entry__1"><span class="ph">&lt;관리자 PC 공인 IP&gt;/32</span></td>
      <td class="entry" headers="Pub__entry__2"><span class="ph">TCP</span></td>
      <td class="entry" headers="Pub__entry__3"><span class="ph">22</span></td>
      <td class="entry" headers="Pub__entry__4">로컬 PC → Bastion VM SSH 접속</td>
      </tr>
      </tbody>
</table>

**Private Subnet Security List — Ingress Rules**

Bastion VM에서 Database 리스너(1521)로 향하는 통신을 허용합니다. Source CIDR은 Bastion이 위치한 Public Subnet CIDR을 사용합니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="Security list rules for database private subnet"><caption></caption><colgroup><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="Priv__entry__1">Source CIDR</th>
      <th class="entry" id="Priv__entry__2">IP Protocol</th>
      <th class="entry" id="Priv__entry__3">Destination Port Range</th>
      <th class="entry" id="Priv__entry__4">설명</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="Priv__entry__1"><span class="ph">10.0.0.0/24</span></td>
      <td class="entry" headers="Priv__entry__2"><span class="ph">TCP</span></td>
      <td class="entry" headers="Priv__entry__3"><span class="ph">1521</span></td>
      <td class="entry" headers="Priv__entry__4">Bastion VM → Database 리스너 통신</td>
      </tr>
      </tbody>
</table>

여기서 Private Subnet의 Source CIDR `10.0.0.0/24`는 Bastion VM이 위치한 Public Subnet CIDR입니다. 더 엄격하게 제어하려면 Bastion VM의 사설 IP(예: `10.0.0.5/32`)만 허용해도 됩니다.

![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-02.png " ")
![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-03.png " ")

> Security List 대신 NSG를 사용하는 경우에는 Bastion VM VNIC에 SSH(22) Ingress와 Database VNIC에 1521 Ingress를 각각 구성하고, Bastion VM에서 Database로의 Egress도 함께 검토합니다.

### 3. Bastion VM SSH 접속 확인
터널을 구성하기 전에, 로컬 PC에서 Bastion VM으로 SSH 접속이 정상적으로 되는지 먼저 확인합니다.

```bash
ssh -i <개인키경로> opc@<Bastion-Public-IP>
```

정상적으로 로그인되면 Security List(22)와 SSH 키가 올바르게 설정된 것입니다. 접속을 확인한 뒤에는 `exit`로 빠져나옵니다.

> 접속이 되지 않으면 Public Subnet Security List의 22번 Ingress, 인스턴스에 등록한 SSH 공개키, 개인키 파일 권한(`chmod 400`)을 순서대로 점검합니다.

### 4. 방법 A — 터미널 SSH 터널 + SQL Developer Basic 접속
가장 확실하고 버전에 독립적인 방식은, 터미널에서 직접 SSH 로컬 포트 포워딩 터널을 열어두고 SQL Developer는 `localhost`로만 접속하는 방법입니다.

**4-1. SSH 로컬 포트 포워딩 터널 생성**

터미널에서 다음 명령을 실행합니다.

```bash
ssh -i <개인키경로> -N -L 1521:<Database-Private-IP>:1521 opc@<Bastion-Public-IP>
```

* `-L 1521:<Database-Private-IP>:1521` : 로컬 `1521` 포트로 들어온 요청을 Bastion을 거쳐 Database 사설 IP의 `1521`로 전달
* `-N` : 원격 셸을 열지 않고 포워딩만 수행(프롬프트가 돌아오지 않는 것이 정상)

로컬 `1521` 포트가 이미 사용 중이면 `-L 15210:<Database-Private-IP>:1521`처럼 다른 로컬 포트로 지정합니다. **이 터미널 창은 접속하는 동안 닫지 않습니다.**

**4-2. SQL Developer 새 접속 생성**

SQL Developer의 Connections 패널에서 **+** 아이콘을 눌러 New Database Connection 창을 엽니다. 다음과 같이 입력합니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="SQL Developer connection fields for basic method"><caption></caption><colgroup><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="ConnA__entry__1">필드</th>
      <th class="entry" id="ConnA__entry__2">값</th>
      <th class="entry" id="ConnA__entry__3">설명</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="ConnA__entry__1"><span class="ph">Name</span></td>
      <td class="entry" headers="ConnA__entry__2"><span class="ph">oci-priv-db-via-bastion</span></td>
      <td class="entry" headers="ConnA__entry__3">구분용 접속 이름(자유 입력)</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="ConnA__entry__1"><span class="ph">Username / Password</span></td>
      <td class="entry" headers="ConnA__entry__2"><span class="ph">DB 계정 / 비밀번호</span></td>
      <td class="entry" headers="ConnA__entry__3">Save Password 체크 시 매번 입력 생략</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="ConnA__entry__1"><span class="ph">Connection Type</span></td>
      <td class="entry" headers="ConnA__entry__2"><span class="ph">Basic</span></td>
      <td class="entry" headers="ConnA__entry__3">터널이 로컬 리스너를 제공하므로 Basic 사용</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="ConnA__entry__1"><span class="ph">Hostname</span></td>
      <td class="entry" headers="ConnA__entry__2"><span class="ph">localhost</span></td>
      <td class="entry" headers="ConnA__entry__3">DB 사설 IP가 아니라 로컬 터널 입구를 지정</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="ConnA__entry__1"><span class="ph">Port</span></td>
      <td class="entry" headers="ConnA__entry__2"><span class="ph">1521</span></td>
      <td class="entry" headers="ConnA__entry__3">터널을 열 때 지정한 로컬 포트</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="ConnA__entry__1"><span class="ph">Service name / SID</span></td>
      <td class="entry" headers="ConnA__entry__2"><span class="ph">DB 서비스명 또는 SID</span></td>
      <td class="entry" headers="ConnA__entry__3">리스너에 등록된 이름과 정확히 일치</td>
      </tr>
      </tbody>
</table>

여기서 가장 헷갈리기 쉬운 부분은 **Hostname에 Database 사설 IP가 아니라 `localhost`를 넣는다**는 점입니다. 내 PC는 Private Subnet의 사설 IP에 직접 도달할 수 없고, 오직 로컬에 열린 SSH 터널을 통해서만 Database에 접근하기 때문입니다.

하단 **Test** 버튼으로 검증한 뒤 `Success`가 표시되면 **Save > Connect**로 접속합니다.

![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-04.png " ")

### 5. 방법 B — SQL Developer 내장 SSH 터널로 접속
별도 터미널 없이 SQL Developer의 내장 SSH 기능으로 터널과 접속을 한 번에 관리할 수도 있습니다. 이 경우 Database의 네트워크 위치(사설 IP:1521)와 인증 정보(서비스명·계정)를 **서로 다른 화면**에 나누어 입력하게 됩니다.

**5-1. SSH Host 등록 (= Bastion VM 정보)**

상단 **View > SSH** 메뉴로 SSH 패널을 엽니다. **SSH Hosts**를 우클릭하여 **New SSH Host**를 선택하고 다음을 입력합니다.

* **Name:** 구분용 이름(예: `oci-bastion`)
* **Host:** Bastion VM의 **Public IP**
* **Port:** `22`
* **Username:** `opc`
* **Use key file:** 체크 후 개인키 파일 지정

**5-2. Local Port Forward 등록 (= Database 네트워크 위치)**

**로컬 포트 전달 추가** 를 체크하여 다음을 입력합니다. **여기가 Database의 사설 IP와 포트를 넣는 자리**입니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="SQL Developer local port forward fields"><caption></caption><colgroup><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="Fwd__entry__1">필드</th>
      <th class="entry" id="Fwd__entry__2">값</th>
      <th class="entry" id="Fwd__entry__3">설명</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="Fwd__entry__1"><span class="ph">Name</span></td>
      <td class="entry" headers="Fwd__entry__2"><span class="ph">db-forward</span></td>
      <td class="entry" headers="Fwd__entry__3">포워드 구분용 이름</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="Fwd__entry__1"><span class="ph">Host</span></td>
      <td class="entry" headers="Fwd__entry__2"><span class="ph">10.0.1.63</span></td>
      <td class="entry" headers="Fwd__entry__3">Database의 사설 IP (Bastion 입장에서 도달할 대상)</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="Fwd__entry__1"><span class="ph">Port</span></td>
      <td class="entry" headers="Fwd__entry__2"><span class="ph">1521</span></td>
      <td class="entry" headers="Fwd__entry__3">Database 리스너 포트</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="Fwd__entry__1"><span class="ph">Local port</span></td>
      <td class="entry" headers="Fwd__entry__2"><span class="ph">Use specific local port: 1521</span></td>
      <td class="entry" headers="Fwd__entry__3">고정 포트 권장(자동 할당도 가능)</td>
      </tr>
      </tbody>
</table>

즉 **Host/Port는 "Bastion이 마지막 홉에서 접속할 Database 사설 주소"**를 의미합니다. 내 PC 기준이 아니라 Bastion 기준으로 도달 가능한 사설 IP를 그대로 입력하는 것이 핵심입니다.

![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-05.png " ")

**5-3. SSH 호스트 및 로컬 포트 전달 활성화**
Database 접속 생성 전에 생성한 SSH 호스트 및 로컬 포트 전달을 활성화 해야 합니다.

* 먼저 SSH 호스트 접속 테스트를 수행합니다.

![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-07.png " ")
![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-08.png " ")

* 테스트가 정상적으로 완료되면, 생성한 SSH 호스트를 우클릭 후 **접속**을 클릭합니다.

![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-09.png " ")

* 생성한 로컬 포트 전달도 우클릭 후 **접속**을 클릭합니다.

![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-10.png " ")

**5-4. 새 접속 생성 (= localhost + DB 인증정보)**

New Database Connection 창에서 Connection Type을 **Basic**으로 두고 다음을 입력합니다.

* **Hostname:** `localhost`
* **Port:** 5-2에서 지정한 로컬 포트(`1521`)
* **Service name / SID:** Database 서비스명 또는 SID
* **Username / Password:** DB 계정 정보

정리하면 Database 정보는 두 군데로 나뉩니다. **네트워크 위치(사설 IP·포트)는 Local Port Forward에, 서비스명과 계정 정보는 접속 창에** 입력합니다. 이 접속으로 Connect하면 SQL Developer가 SSH 터널을 자동으로 열고 연결합니다.


![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-06.png " ")


### 6. 접속 상태 확인
접속에 성공하면 SQL Developer 워크시트에서 다음과 같이 현재 접속 상태를 확인할 수 있습니다.

```sql
SELECT sys_context('USERENV','SERVER_HOST')   AS db_host,
       sys_context('USERENV','INSTANCE_NAME') AS instance,
       sys_context('USERENV','SERVICE_NAME')  AS service
  FROM dual;
```

![](/assets/img/dataplatform/2026/blog/sqldev-bastion-vm/oci-sqldev-bastion-11.png " ")

정상적으로 결과가 반환되면 Bastion VM을 경유한 SQL Developer 접속 구성이 완료된 것입니다.

### 트러블슈팅

**ORA-12541 (TNS: no listener)**
터널이 열려 있지 않거나, 접속 창의 Port가 터널의 로컬 포트와 일치하지 않는 경우입니다. 방법 A라면 `ssh -N -L ...` 터미널 창이 살아 있는지 먼저 확인합니다.

**ORA-12514 (service ... not known)**
Service name이 리스너에 등록된 이름과 다른 경우입니다. `v$parameter`의 `service_names` 값을 확인하여 접속 정보를 맞춥니다.

**IO Error / 연결 자체 실패**
터널은 열렸으나 Bastion에서 Database로 도달하지 못하는 경우로, Private Subnet Security List에 Bastion(Public Subnet CIDR 또는 사설 IP) → 1521 Ingress가 누락된 경우가 대부분입니다.

**`no matching host key type found` / `ssh-rsa` 협상 실패**
로컬 OpenSSH 8.8 이상에서 `ssh-rsa`가 기본 비활성화되어 발생합니다. 터널 명령에 다음 옵션을 추가합니다.

```bash
ssh -i <개인키경로> \
  -o HostKeyAlgorithms=+ssh-rsa \
  -o PubkeyAcceptedAlgorithms=+ssh-rsa \
  -N -L 1521:<Database-Private-IP>:1521 opc@<Bastion-Public-IP>
```

### 마무리
OCI Private Subnet에 위치한 Database는 인터넷에서 직접 접근할 수 없으므로, SQL Developer로 접속하려면 중간에 접속을 중계하는 Bastion이 필요합니다. 관리형 Bastion 서비스는 세션 수명이 최대 3시간으로 제한되지만, Public Subnet에 Bastion VM을 직접 구성하면 시간 제한 없이 상시 점프 서버로 사용할 수 있습니다.

이를 위해서는 Database와 동일한 VCN의 Public Subnet에 Bastion VM을 생성하고, Public Subnet에는 SSH(22) Ingress를, Private Subnet에는 Bastion으로부터의 1521 Ingress를 허용하도록 Security List를 구성합니다. 이후 SSH 로컬 포트 포워딩 터널을 생성하고, SQL Developer에서는 Database 사설 IP가 아닌 `localhost`와 터널 로컬 포트로 접속하는 것이 핵심입니다.

내장 SSH 기능을 사용할 경우에는 Database의 네트워크 위치를 Local Port Forward에, 서비스명과 계정 정보를 접속 창에 나누어 입력한다는 점만 기억하면, 별도 터미널 없이 하나의 접속으로 터널과 연결을 함께 관리할 수 있습니다.

### 참고 문서

* [Connecting to a Port Forwarding Session (OCI Bastion)](https://docs.oracle.com/en-us/iaas/Content/Bastion/Tasks/connect-port-forwarding.htm)
* [Oracle SQL Developer User's Guide](https://docs.oracle.com/en/database/oracle/sql-developer/)
