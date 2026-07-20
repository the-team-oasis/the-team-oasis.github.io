---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "5월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2026년 5월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-dataplatform
tags:
  - oci-release-notes-2026
  - May-2026
  - DATAPLATFORM
  - DATABASE
  - AUTONOMOUS DATABASE
  - DATABASE TOOLS
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

---

## Multifactor Authentication in Autonomous AI Database 26ai

* **Services:** Autonomous Database Serverless
* **Release Date:** May 08, 2026
* **Documentation:** [Multifactor Authentication in Autonomous AI Database 26ai](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-05-multifactor-authentication-aidb.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Use Multifactor Authentication with Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/multifactor-authentication-autonomous-ai-database.html){:target="_blank" rel="noopener"}

![Autonomous AI Database SQL Access Token workflow](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/img/autonomous-sqlaccesstoken-workflow.png)

### 업데이트 내용

Autonomous AI Database 26ai에서 MFA(Multifactor Authentication)를 지원합니다. 사용자 비밀번호 외에 추가 인증 요소를 요구해 데이터베이스 접근 보안을 강화할 수 있습니다.

### 주요 기능

* 데이터베이스 로그인 시 MFA를 요구하는 Login-Time MFA를 구성할 수 있습니다.
* 민감한 SQL 실행 시 별도 토큰 검증을 요구하는 SQL Access MFA를 구성할 수 있습니다.
* Oracle Mobile Authenticator와 Cisco Duo를 통한 Push 인증을 지원합니다.
* SQL Access Token은 Email, Slack, OMA, Duo 채널을 통해 인증 흐름을 구성할 수 있습니다.
* `DBMS_MFA_*` 패키지를 통해 MFA 사용자 등록, 알림 채널 구성, 토큰 속성 관리를 수행합니다.

### 기대 효과

비밀번호 탈취, 피싱, 무차별 대입 공격으로 인한 데이터베이스 접근 위험을 줄이고, 금융/공공/의료처럼 강한 인증 통제가 필요한 환경에서 규제 대응력을 높일 수 있습니다.

---

## Improved Outbound Connection options for Private Endpoints on Oracle Autonomous AI Database 26ai

* **Services:** Autonomous Database Serverless
* **Release Date:** May 08, 2026
* **Documentation:** [Improved Outbound Connection options for Private Endpoints on Oracle Autonomous AI Database 26ai](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-05-outbound-conn-options.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Configure Network Access with Private Endpoints](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/private-endpoints-autonomous.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Private Endpoint를 사용하는 Autonomous AI Database 26ai에서 아웃바운드 연결을 더 엄격하게 제어할 수 있는 옵션이 개선되었습니다. 데이터베이스 속성을 설정해 대상 호스트로 나가는 연결이 Private Endpoint의 Egress Rule을 따르도록 강제할 수 있습니다.

### 주요 기능

* `ROUTE_OUTBOUND_CONNECTIONS` 데이터베이스 속성을 사용할 수 있습니다.
* 값으로 `PRIVATE_ENDPOINT` 또는 `ENFORCE_PRIVATE_ENDPOINT`를 설정할 수 있습니다.
* 아웃바운드 트래픽은 Private Endpoint가 연결된 VCN Security List 또는 NSG의 Egress Rule에 의해 제한됩니다.
* `ENFORCE_PRIVATE_ENDPOINT`는 `DBMS_CLOUD` 계열 패키지, External Table, Data Pump 작업에도 더 넓은 제한을 적용합니다.

### 운영 포인트

외부 API, Object Storage, SMTP, LDAP, DB Link 등을 사용하는 데이터베이스에서는 어떤 아웃바운드 경로가 필요한지 먼저 식별하고, VCN/NSG Egress Rule을 서비스별로 명확하게 설계하는 것이 좋습니다.

---

## Reduced Steps for Network Configuration Switching

* **Services:** Autonomous Database Serverless
* **Release Date:** May 08, 2026
* **Documentation:** [Reduced Steps for Network Configuration Switching](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-05-network-conf-switching.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Configure Network Access with Access Control Rules](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/access-control-rules-autonomous.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 Private Endpoint Access를 `Secure access from allowed IPs and VCNs only` 방식으로 전환하는 절차가 간소화되었습니다. 이번 업데이트로 기존 TLS 설정을 보존한 상태에서 네트워크 구성을 전환할 수 있습니다.

### 주요 기능

* Private Endpoint에서 허용 IP/VCN 기반 Public Endpoint 접근 방식으로 더 간단히 전환할 수 있습니다.
* 전환 과정에서 기존 TLS 관련 구성을 유지할 수 있습니다.
* Access Control Rule을 통해 IP Address, CIDR Block, VCN, VCN OCID 기반 접근 제어를 구성할 수 있습니다.
* Database Actions, APEX, Spatial Studio, Graph Studio, OML Notebooks, ORDS 같은 도구도 ACL 적용 대상에 포함됩니다.

### 기대 효과

보안 정책이나 접속 경로 변경으로 네트워크 접근 방식을 바꿔야 할 때 절차가 줄어 운영 부담이 낮아집니다. 특히 개발/테스트 단계에서 Private Endpoint와 제한된 Public Access를 오가며 검증해야 하는 경우 유용합니다.

---

## Migrate Data with DBMS_CLOUD_IMPORT

* **Services:** Autonomous Database Serverless
* **Release Date:** May 08, 2026
* **Documentation:** [Migrate Data with DBMS_CLOUD_IMPORT](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-05-migratedata-dbmscloud.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Migrate Data with DBMS_CLOUD_IMPORT](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/migrate-data-with-dbms-cloud-import.html){:target="_blank" rel="noopener"}

### 업데이트 내용

`DBMS_CLOUD_IMPORT`를 사용해 Oracle 및 비Oracle 데이터베이스의 데이터를 Autonomous AI Database로 가져올 수 있게 되었습니다. 여러 데이터베이스 기술과 포맷을 각각 다른 도구로 다루지 않고, 일관된 PL/SQL 패키지 방식으로 데이터 이동을 구성할 수 있습니다.

### 주요 기능

* Oracle Database, MySQL, PostgreSQL, Amazon Redshift 소스를 지원합니다.
* Oracle 소스는 데이터와 데이터베이스 객체를 함께 가져올 수 있습니다.
* 비Oracle 소스는 데이터 이동과 Oracle 호환 타입 변환 중심으로 동작합니다.
* 전체 데이터베이스 또는 특정 스키마/테이블 단위로 가져올 수 있습니다.
* Oracle Scheduler Job을 통해 Import Task가 백그라운드에서 실행됩니다.
* 병렬 처리와 자동 재개 기능을 지원하며, 소스 유형과 사전 조건에 따라 중단 지점부터 재개할 수 있습니다.
* `DBA_DATA_IMPORT_TASK_STATUS`, `DBA_DATA_IMPORT_TABLE_STATUS` 뷰로 진행 상태와 오류를 모니터링할 수 있습니다.

### 사용 흐름

1. 소스 데이터베이스 접속 정보를 담은 Credential을 생성합니다.
2. `DBMS_CLOUD_IMPORT.CREATE_IMPORT_TASK`로 Import Task를 생성합니다.
3. 필요 시 `schema_list`, `table_list`, `gateway_params`로 가져올 범위와 소스 타입을 지정합니다.
4. 진행 상황은 데이터 딕셔너리 뷰로 모니터링하고, 필요하면 `SUSPEND_IMPORT_TASK`, `RESUME_IMPORT_TASK`로 일시 중지/재개합니다.

---

## Absolute Path Support in CREATE DIRECTORY

* **Services:** Autonomous Database Serverless
* **Release Date:** May 08, 2026
* **Documentation:** [Absolute Path Support in CREATE DIRECTORY](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-05-absolute-pathsupport-createdir.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Create Directory in Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/create-directory.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 `CREATE DIRECTORY` 문에 절대 경로를 사용할 수 있게 되었습니다. 데이터베이스는 입력된 절대 경로를 관리형 파일 시스템 위치 아래에 매핑해 Directory Object와 실제 디렉터리를 생성합니다.

### 주요 기능

* `stage`, `stage/sales` 같은 상대 경로뿐 아니라 `/my_subdirectory/my_dir` 같은 절대 경로도 사용할 수 있습니다.
* `CREATE DIRECTORY` 실행 시 데이터베이스 Directory Object와 파일 시스템 디렉터리가 함께 생성됩니다.
* 기존 Oracle Database에서 절대 경로를 사용하는 스크립트의 마이그레이션 호환성이 높아집니다.
* Directory 생성에는 `CREATE ANY DIRECTORY` 시스템 권한이 필요하며, ADMIN 사용자는 해당 권한을 가지고 있습니다.

### 활용 예시

기존 온프레미스 Oracle Database에서 사용하던 Data Pump, 외부 테이블, 파일 처리 스크립트가 절대 경로 기반으로 작성되어 있는 경우 Autonomous AI Database로 이전할 때 수정 범위를 줄일 수 있습니다.

---

## Zero Data Loss Protection with Local Autonomous Data Guard Standby

* **Services:** Autonomous Database Serverless
* **Release Date:** May 08, 2026
* **Documentation:** [Zero Data Loss Protection with Local Autonomous Data Guard Standby](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-05-zero-dataloss-protection.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Use Standby Databases with Autonomous Data Guard for Disaster Recovery](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/autonomous-data-guard.html){:target="_blank" rel="noopener"}, [About Standby Databases](https://docs.oracle.com/en/cloud/paas/autonomous-database/adbsa/autonomous-data-guard-about.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Data Guard에서 Local Standby Database를 사용할 때 Zero Data Loss Protection(RPO = 0)이 제공됩니다. Local Standby가 있고 시스템이 무손실 전환을 보장할 수 있는 경우 자동 Failover가 수행됩니다.

### 주요 기능

* Local Autonomous Data Guard Standby에서 RPO 0을 제공합니다.
* Primary와 Standby 간 동기식 Redo 전송으로 커밋된 트랜잭션을 보호합니다.
* 별도 수동 구성이나 튜닝 없이 완전 관리형으로 동작합니다.
* 자동 Failover는 데이터 손실 한도 내에서 수행되며, 한도는 0~3600초 범위로 지정할 수 있습니다.
* Local Standby 기반 Autonomous Data Guard는 낮은 RTO와 무손실 보호가 필요한 업무에 적합합니다.

### 기대 효과

업무 연속성과 데이터 보호 수준을 동시에 높일 수 있습니다. 특히 트랜잭션 손실 허용 범위가 매우 낮은 핵심 업무 시스템에서 Autonomous Database의 DR 구성을 더 단단하게 가져갈 수 있습니다.

---

## Database Tools Connections Support IAM Authentication

* **Services:** Database Tools
* **Release Date:** May 12, 2026
* **Documentation:** [Database Tools Connections Support IAM Authentication](https://docs.oracle.com/en-us/iaas/releasenotes/database-tools/iam-authentication.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Integrating IAM Authentication with Database Tools Connections](https://docs.oracle.com/en-us/iaas/database-tools/doc/integrating-iam-authentication.html){:target="_blank" rel="noopener"}, [Prerequisites](https://docs.oracle.com/en-us/iaas/database-tools/doc/prerequisites-integrating-iam-authentication-database-tools.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Tools Connection에서 Oracle Database에 대한 IAM Token-Based Authentication과 Proxy Authentication을 지원합니다. 데이터베이스 접속 정보를 단순 사용자/비밀번호 중심으로 관리하던 방식에서 OCI IAM 기반 인증 흐름을 사용할 수 있습니다.

### 주요 기능

* Database Tools Connection 생성 시 IAM 인증을 선택할 수 있습니다.
* Autonomous Database, Exadata Database Service, Base Database Service 같은 Oracle DBaaS 환경을 지원합니다.
* ADB의 경우 대부분의 TLS/Wallet 선행 조건이 Database Tools 서비스에 이미 구성되어 있어 IAM 정책과 DB 사용자 매핑 중심으로 준비할 수 있습니다.
* 비ADB Oracle Database는 TCPS/TLS 서버 인증, Wallet/Certificate 구성이 필요합니다.
* Proxy Authentication을 사용해 IAM 사용자와 데이터베이스 스키마 매핑을 더 유연하게 구성할 수 있습니다.

### 운영 포인트

IAM Authentication을 쓰려면 데이터베이스 쪽 Global User 매핑과 OCI IAM 정책이 함께 필요합니다. 운영 권한은 IAM에서, 실제 데이터베이스 권한은 DB Role/Schema에서 분리해 관리하는 구성이 가능합니다.

---

## Manage ORDS with Database API Gateway Configurations

* **Services:** Database Tools
* **Release Date:** May 12, 2026
* **Documentation:** [Manage ORDS with Database API Gateway Configurations](https://docs.oracle.com/en-us/iaas/releasenotes/database-tools/db-api-gateway.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Working with Database API Gateway Configurations](https://docs.oracle.com/en-us/iaas/database-tools/doc/database-api-gateway-configuration.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Database API Gateway Configuration이 신규 OCI 리소스로 제공됩니다. 이를 통해 Oracle REST Data Services(ORDS) 구성을 OCI에서 중앙 관리할 수 있습니다.

### 주요 기능

* ORDS의 Global Settings를 OCI 리소스로 관리할 수 있습니다.
* Connection Pool 설정으로 어떤 데이터베이스에 어떤 방식으로 라우팅할지 정의할 수 있습니다.
* 사용자 정의 REST 리소스용 API Spec과 데이터베이스 객체의 AutoREST 구성을 관리할 수 있습니다.
* Database Tools에 저장된 Oracle Database Connection을 ORDS Connection Pool에서 참조할 수 있습니다.
* OCI API를 통해 ORDS 설정을 표준화하고 자동화할 수 있습니다.

### 기대 효과

ORDS 설정을 서버별 수동 파일 관리 중심으로 운영하던 환경에서, OCI 리소스와 API 기반으로 일관되게 관리할 수 있습니다. 여러 데이터베이스에 REST API를 제공하는 팀에서는 구성 표준화와 변경 추적에 특히 유용합니다.
