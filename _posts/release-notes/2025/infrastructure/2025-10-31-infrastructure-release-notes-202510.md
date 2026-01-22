---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "10월 OCI Infrastructure 업데이트 소식"
teaser: "2025년 10월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2025-infrastructure
tags:
   - oci-release-notes-2025
   - Oct-2025
   - Infrastructure
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

<!--
## Vanity URL support using API Gateway
* **Services**: Autonomous Database Serverless
* **Release Date**: October 28, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-vanity-url-support-using-api-gateway.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-vanity-url-support-using-api-gateway.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

엘라스틱 풀의 데이터베이스에 대해 API Gateway를 사용하여 Autonomous AI Database에서 vanity URL을 활성화하고 Autonomous AI Database 인스턴스에 대한 vanity URL 사용자 정의 도메인을 구성할 수 있습니다.

Vanity URL 이란 : 사람이 기억하기 쉬운 나만의 도메인 주소입니다.

**기본 Oracle URL : https://adb.ap-seoul-1.oraclecloudapps.com/ords/...**

**Vanity URL 적용 후 : https://apps.mycompany.com**

위처럼 길고 복잡한 Oracle 기본 주소를 회사 도메인이나 서비스 이름이 들어간 주소로 바꾸는 기능입니다.

**왜 Vanity URL이 필요할까?**

Oracle Autonomous Database에서 제공하는 APEX 앱이나 Database Tools(SQL Developer Web 등)를 사용할 때:

	•	URL이 너무 길다
	•	서비스나 회사 이름이 드러나지 않는다
	•	외부 사용자나 고객에게 공유하기 어렵다

이 문제를 해결하기 위해 Vanity URL을 사용합니다.

> **참고:**
> - HTTP 엔드포인트를 사용하는 OCI API 게이트웨이는 Vanity URL을 지원하지만 MongoDB 및 SQLNET과 같은 TCP 기반 엔드포인트는 지원하지 않습니다.
> - Oracle Machine Language(OML) 도구는 Vanity URL을 지원하지 않습니다.

자세한 내용은 [Enable a Vanity URL on your Elastic Pool Member Database](https://docs.oracle.com/iaas/autonomous-database-serverless/doc/apex-vanity-url.html#GUID-2A325D70-1892-4E40-9642-694B23E0E4B7)를 참조하세요.


## Identity Available in Database Tools
* **Services**: Database Tools
* **Release Date**: October 28, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/database-tools/identity.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/identity.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Identity가 Database Tools 서비스에서 사용 가능합니다. Identity를 사용하면 Database Tools 서비스에서 관리하는 리소스 주체 자격 증명을 사용하여 Oracle Base Database Service 및 Oracle Autonomous Database (ADB)와 같은 모든 Oracle Database Cloud Service에서 OCI 리소스에 액세스할 수 있습니다. 이를 통해 사용자 자격 증명을 직접 관리할 필요 없이 안전하고 간소화된 인증 및 권한 부여가 가능합니다.

자세한 내용은 [Using Identities with Database Tools](https://docs.oracle.com/iaas/database-tools/doc/database-tools-identity.html)를 참조하세요.


## Certificates in PEM format is Supported in Database Tools
* **Services**: Database Tools
* **Release Date**: October 28, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/database-tools/pem-format.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/pem-format.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud Infrastructure (OCI) Database Tools가 이제 PEM 포맷 인증서를 지원합니다. 이를 통해 Oracle Database Wallet 정보를 PEM 키 저장소(wallet)로 사용한 데이터베이스 연결을 만들 수 있게 되었습니다. 

이전에는 Database Tools에서 Oracle DB Wallet 정보를 다루는 데 제한이 있었을 수 있지만,
이번 릴리스부터는 아래가 가능해졌습니다:

✔ PEM 형식 인증서를 key store(키 저장소) 형태로 사용하는 데이터베이스 연결 생성

✔ PEM 인증서를 사용한 보안 연결을 보다 유연하게 구성

✔ 기업 보안 요구 사항(예: 특정 키 관리 정책)을 충족할 수 있는 확장성 제공  ￼

즉, Database Tools가 이제 PEM 포맷 인증서 기반 연결 설정을 공식 지원한다는 것입니다.

자세한 내용은 [Creating a connection](https://docs.oracle.com/iaas/database-tools/doc/using-oracle-cloud-infrastructure-console.html#GUID-8F5F7A3E-461F-4FF5-A487-C0F724EC7B4F)을 참조하세요.


## Connections with Resource Principal are Available in Database Tools
* **Services**: Database Tools
* **Release Date**: October 28, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/database-tools/resource-principal.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/resource-principal.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 인증된 주체에 의존하는 대신 데이터베이스 연결 비밀번호 및 연결 지갑 정보를 검색하기 위해 리소스 주체 자격 증명을 사용하도록 연결을 구성할 수 있습니다. Authenticated Principal과 Resource Principal은 데이터베이스 연결을 설정하기 위해 데이터베이스 연결 비밀번호 및 연결 지갑 정보에 대한 액세스를 제공하는 서로 다른 방법입니다. Resource Principal을 사용하면 리소스가 비밀번호를 검색합니다. 이 방법은 자격 증명 관리 오버헤드를 줄이고 연결 보안을 향상시킵니다.

✔ (기존 방식) Authenticated Principal

기존에는 Database Tools 연결이 비밀번호나 Wallet 정보 등을 가져오기 위해서
로그인한 사용자의 인증 정보를 기반으로 접근해야 했습니다.

	•	사용자가 OCI에 로그인

	•	연결 비밀번호/Wallet 검색 권한을 IAM에서 사용자에게 부여

	•	Database Tools가 사용자 계정으로 Vault에서 비밀번호 등 가져옴

이 방식은 관리/보안 측면에서 아래와 같은 단점이 있었습니다:

	•	연결 설정에 사용자 권한이 필요

	•	사용자별 권한 부여 이슈

	•	비밀번호/자격 증명 노출 리스크 존재  ￼

✔ (신규 방식) Resource Principal

이제는 Database Tools 자체 리소스가 자격 증명을 대신 하는 방식을 쓸 수 있습니다.

	•	Database Tools Connection이 스스로 Resource Principal이 됨

	•	Vault 등에서 필요한 비밀번호/Wallet을 가져옴

	•	사용자가 자격 증명을 직접 관리할 필요 없음  ￼

아래 부분이 강화 되었습니다.

✔ 보안이 강화됨

	•	사용자 자격 증명을 저장/노출하지 않아도 됨

	•	일반 사용자 권한으로 Secret(비밀번호) 접근 권한 설정 X

	•	Database Tools 리소스에만 필요한 권한 부여하면 됨  ￼

✔ 관리 및 운영이 쉬워짐

   Resource Principal은 OCI가 자동으로 토큰/자격 증명을 관리하기 때문에
   사용자 수명주기(user lifecycle) 또는 패스워드 회전 등의 관리 부담이 줄어듭니다


자세한 내용은 [Resource Principal](https://docs.oracle.com/iaas/database-tools/doc/resource-principal.html)을 참조하세요.


## Cross-Tenancy Standby database using Autonomous Data Guard Groups model
* **Services**: Autonomous Database on Dedicated Exadata Infrastructure
* **Release Date**: October 28, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-audg-update.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-audg-update.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

기존에는 동일 테넌시(OCI Tenancy) 안에서만 Standby 데이터베이스를 구성할 수 있었지만, 이제 Autonomous Data Guard Groups 모델을 사용하여 다른 테넌시에 Standby 데이터베이스를 생성할 수 있게 되었습니다.  

이 기능은 Autonomous Data Guard Groups 모델을 기반으로 하며, 다음을 지원합니다:

	- 최대 2개의 Standby DB를 서로 다른 테넌시에서 설정 가능  ￼

	- Standby DB는 같은 지역이나 다른 리전에도 둘 수 있음  ￼

	- Cross-Tenancy Standby는:  Standby를 다른 테넌시로 옮겨 Disaster Recovery 구성 또는 테넌시 간 데이터베이스 마이그레이션 경로로 활용 가능

자세한 내용은 [Autonomous Data Guard Configuration Options](https://docs.oracle.com/en/cloud/paas/autonomous-database/dedicated/adbau/index.html#ADBAU-GUID-FA4256AC-1F78-4F68-AB50-42022A4C6A69) 및 [Add a Cross Tenancy Standby Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/dedicated/adbcl/index.html#ADBCL-GUID-D66A04E2-5CC1-4EF6-B4BB-9D53C349D39B)를 참조하세요.


## NoSQL Database Cloud : Customer-Managed Encryption key feature support in dedicated environment
* **Services**: NoSQL Database Cloud
* **Release Date**: October 27, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/nosql-database-cloud/nosql-rnlatest-oct25.htm](https://docs.oracle.com/iaas/releasenotes/nosql-database-cloud/nosql-rnlatest-oct25.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle NoSQL Database Cloud에서 다음 새로운 기능을 사용할 수 있습니다:

- **고객 관리 암호화 키(CMEK)**: Oracle NoSQL Database Cloud Service는 전용 환경에서 데이터 암호화 키를 암호화하는 데 사용되는 고유한 마스터 암호화 키를 정의하는 옵션을 제공합니다. CMEK는 서비스 티켓을 발행하여 전용 환경에서 활성화할 수 있습니다.
-->


## Sync with Object Storage
* **Services**: File Storage with Lustre, Oracle Cloud Infrastructure
* **Release Date**: October 29, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/lustre/sync-object-storage.htm](https://docs.oracle.com/iaas/releasenotes/lustre/sync-object-storage.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI의 File Storage with Lustre는 이제 Object Storage 버킷과 데이터 양방향 동기화를 지원하여, Object Storage의 데이터를 Lustre로 가져와 고속 처리하고, 처리된 결과를 다시 Object Storage로 내보내는 효율적인 데이터 파이프라인을 제공합니다

(1) Lustre 디렉터리 ↔ Object Storage 버킷 연결(Link) 생성

	Lustre 파일 시스템의 특정 디렉터리를
	Object Storage 버킷에 **“Link”**로 연결합니다.

	이 Link가 동기화의 기본 단위가 됩니다.

(2) Import 또는 Export 작업(Job) 시작

	Link를 생성한 뒤,
	→ Import 작업 또는
	→ Export 작업을 시작하면 동기화 Job이 생성됩니다.

	각 작업(Job)에는 고유 ID가 있고, 상태를 추적할 수 있습니다.

> Job 단위로 동기화가 이루어지며,
새로 생기거나 변경된 파일과 메타데이터만 복사합니다.
삭제된 파일은 동기화되지 않습니다 

### 제약 사항

| 제약 사항 | 설명 |
|-----------|------|
| 리전/테넌시 제한 | Lustre 파일 시스템과 Object Storage 버킷이 같은 리전·테넌시에 있어야 함. 리전 간/테넌시 간 동기화 미지원 |
| 동시 작업 제한 | 하나의 Lustre 파일 시스템에서 동시에 여러 Job 실행 불가 (다른 파일 시스템은 독립 실행 가능) |
| Link 수 제한 | 각 Lustre 파일 시스템당 최대 10개 Object Storage Link |
| 메타데이터 제한 | 하드 링크는 원래대로 유지 안됨, 메타데이터만 변경된 파일은 복사 대상 제외 |

<!--
| 항목 | 설명 |
|------|------|
| 복사 단위 | 한 번 Job 시작 시 변경된 파일 + 메타데이터만 복사됨 |
| 삭제 파일 처리 | 삭제된 파일은 동기화되지 않음 |
| 동시 작업 제한 | 한 파일 시스템당 1개의 작업(Job) |
| Link 수 제한 | 최대 10개 |
-->

### 보안 관점

- **전송 중 데이터(in transit)** — 암호화 처리됩니다.
- **저장 시 데이터(at rest)** — 각 스토리지 시스템의 암호화 정책에 따라 보호됩니다.

Lustre로 데이터를 불러와(high-speed) 처리하고, 처리 결과를 다시 Object Storage로 보내(long-term storage) 저장할 수 있습니다.
이 기능은 대규모 데이터 워크로드(예: AI/ML, HPC) 파이프라인에서 매우 유용합니다



## Add ZPR security attributes to File Storage
* **Services**: File Storage, Zero Trust Packet Routing
* **Release Date**: October 29, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/zero-trust-packet-routing/file-storage-supported.htm](https://docs.oracle.com/iaas/releasenotes/zero-trust-packet-routing/file-storage-supported.htm){:target="_blank" rel="noopener"}



### 업데이트 내용

이제 File Storage 마운트 대상에 Zero Trust Packet Routing (ZPR) 보안 속성을 추가할 수 있습니다. 자세한 내용은 [Adding Security Attributes to a Mount Target](https://docs.oracle.com/iaas/Content/File/Tasks/zpr-mount-target.htm)을 참조하세요.

[보안 속성](https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/security-attributes.htm)은 ZPR 정책이 참조하는 레이블입니다. 이러한 속성을 통해 특정 보안 속성을 가진 클라이언트 엔드포인트가 이러한 속성도 가진 다른 엔드포인트에 액세스할 수 있습니다. ZPR은 액세스가 요청될 때마다 네트워크 레벨에서 이 [정책](https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/zpr-policy-overview.htm)을 강제하여 네트워크 아키텍처의 잠재적인 변경 사항이나 잘못된 구성과 관계없이 보안을 보장합니다.

ZPR이란? : 리소스(컴퓨트 인스턴스, 데이터베이스 등)에 data:sensitive와 같은 보안 라벨을 붙입니다. "애플리케이션(app:server)은 데이터베이스(data:sensitive)에 SQL 포트로만 접근할 수 있다"와 같이 사람이 읽기 쉬운 정책을 작성합니다. 네트워크 패킷 수준에서 실시간으로 확인됩니다. 정책에 명시되지 않은 트래픽은 아예 물리적으로 전달되지 않습니다.




## Full Stack Disaster Recovery introduces support for Automatic DR Configuration and provides other updates
* **Services**: Full Stack Disaster Recovery
* **Release Date**: October 29, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/disaster-recovery/oct-2025.htm](https://docs.oracle.com/iaas/releasenotes/disaster-recovery/oct-2025.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Full Stack Disaster Recovery가 다음 새로운 기능을 도입했습니다:

- **Automatic DR Configuration 지원**: Automatic DR Configuration을 생성하여 재해 복구(DR) 플랜 실행을 자동화할 수 있습니다. 지원되는 플랜 유형은 Switchover DR Plans 및 Failover DR Plans입니다.
- **Resource Principal Policies 지원**: 리소스 주체를 사용하여 다른 Oracle Cloud Infrastructure 리소스에 인증하고 액세스할 수 있습니다.
- **Oracle Exadata Database Service on Dedicated Infrastructure 및 Oracle Exadata Database Service on Cloud@Customer용 DR Drill 플랜의 내장 플랜 그룹 지원**: Full Stack DR은 이제 두 서비스 모두에 대한 DR Drill 플랜의 내장 플랜 그룹을 지원합니다.



Automatic DR 구성은 다음 순서로 진행됩니다.

1. **스탠바이 DRPG에서 Automatic DR Configuration 생성** — Automatic DR은 Standby DRPG에서만 생성할 수 있습니다.
2. **자동화할 데이터베이스 멤버 선택** — DRPG에 포함된 여러 DB 중 자동 전환 대상으로 삼을 DB만 선택합니다.
3. **자동 실행할 DR Plan 지정** — Switchover Plan 또는 Failover Plan, 혹은 둘 다 지정할 수 있습니다.
4. **트리거 이벤트 지정** — Switchover 발생 시, Failover 발생 시, 또는 둘 다를 지정합니다.
5. **Resource Principal 인증 기반 자동 실행** — 사용자 계정이 아닌 서비스가 IAM Policy를 기반으로 자동 실행합니다.

Automatic DR 사용 시 반드시 알아야 할 제약 사항은 다음과 같습니다.

- **DRPG당 Automatic DR Configuration은 1개만 가능**: Protection Group 하나에 오직 하나의 AutoDR 설정만 가질 수 있습니다. 추가 설정을 만들려면 기존 설정을 삭제해야 하며, 여러 DB를 자동화하려면 한 번의 구성에 모두 포함해야 합니다.
- **DR Plan과 Trigger Operation은 모두 필수**: AutoDR은 실행할 DR Plan과 자동 실행 트리거(Switchover/Failover)를 모두 지정해야 동작합니다.
- **스탠바이 DRPG에서만 생성 가능**: Primary에서 생성할 수 없으며, Automatic DR의 실행 주체는 Standby DRPG입니다.
- **Resource Principal 인증을 위한 IAM Policy 필요**: DR Plan을 자동 실행하려면 서비스가 대신 수행해야 하므로 IAM Policy 설정이 필요합니다. 예시: `Allow service fullstackdr to manage dr-protection-groups in tenancy` 정확한 정책은 공식 문서를 참고해야 하며, 누락 시 Auto DR이 실패하거나 시작 자체가 불가능합니다.
- **AutoDR에 선택된 DB만 자동 실행**: DRPG 내 DB가 여러 개 있어도 AutoDR 구성 시 선택한 DB만 Switchover/Failover를 자동 수행하며, 선택되지 않은 DB는 수동 DR Plan 대상입니다.
- **지원 DR Plan 종류는 2가지**: Switchover DR Plan, Failover DR Plan만 자동화할 수 있으며 Reinstate Plan은 자동화 대상이 아닙니다.

추가 기능:

- **Custom Audit Event 지원**: AutoDR이 실행되면 DR Plan 자동 제출 성공, 자동 이벤트 처리 실패, 실행 불가 상태 감지 등의 이벤트가 자동 기록됩니다.

**AutoDR은 “DB 이벤트를 기준으로 전체 스택을 자동 복구"하는 기능입니다.**



자세한 내용은 [Full Stack Disaster Recovery Documentation](https://docs.oracle.com/iaas/disaster-recovery/index.html) 및 [Full Stack Disaster Recovery API](https://docs.oracle.com/iaas/api/#/en/disaster-recovery/20220125/)를 참조하세요.

Using Oracle Cloud Infrastructure Full Stack Disaster Recovery : [Manage Automatic DR](https://docs.oracle.com/en/cloud/iaas/disaster-recovery/cssgm/manage-autodr.html#GUID-0AF95EEE-DE1D-41F7-ABC6-468884960911)


## File Storage supports LDAP group membership via RFC2307bis
* **Services**: File Storage
* **Release Date**: October 22, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/filestorage/file-newSchema-RFC2396BIS.htm](https://docs.oracle.com/iaas/releasenotes/filestorage/file-newSchema-RFC2396BIS.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

File System 마운트 대상을 구성할 때 이제 [RFC2307bis](https://docs.oracle.com/iaas/Content/File/Tasks/ldap.htm#ldap-prereqs)를 지원하는 LDAP 디렉토리 스키마를 사용할 수 있습니다. File Storage는 기존 `memberUid` 옵션 외에 `uniqueMember` 속성을 통해 그룹 멤버십을 인식합니다. 풀어 말하면 다음과 같습니다.

- OCI File Storage에서 NFS 마운트 타깃을 만들 때, 기존에는 LDAP 그룹 멤버십을 `memberUid` 방식으로만 인식했습니다.
- 이번 업데이트(2025-10-22 기준)로 RFC2307bis 스키마의 `uniqueMember` 속성도 지원합니다.
- Active Directory/LDAP 환경에서 RFC2307bis 구조의 그룹 멤버십을 그대로 사용할 수 있습니다.
- 기업 LDAP 표준에 더 잘 맞고, 그룹 관리를 더 유연하게 지원합니다.


<!--
## Live workload capture-replay between Autonomous AI Databases
* **Services**: Autonomous Database Serverless
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-live-workload-capture-replay-between-adb.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-live-workload-capture-replay-between-adb.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

라이브 워크로드 캡처-재생을 사용하여 소스 Autonomous AI Database 인스턴스에서 실행 중인 워크로드를 캡처하고, 소스 데이터베이스에서 워크로드가 실행되는 동안 대상 새로 고침 가능 클론에서 동시에 재생할 수 있습니다.

자세한 내용은 [Test Workloads with Oracle Real Application Testing](https://docs.oracle.com/iaas/autonomous-database-serverless/doc/autonomous-real-application-testing.html#GUID-EB8F065E-5FBB-480D-BAF6-5A0446740073)를 참조하세요.
-->


<!--
## Invoke Python scripts with the WITH_CONTEXT attribute from an Autonomous AI Database instance
* **Services**: Autonomous Database Serverless
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-invoke-python-scripts-withcontext-from-adb.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-invoke-python-scripts-withcontext-from-adb.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database 인스턴스에서 `WITH_CONTEXT` 속성을 사용하여 Python 스크립트를 호출할 수 있습니다.

Python 스크립트를 실행하려면 EXTPROC 에이전트가 설치된 Oracle 제공 Autonomous AI Database 컨테이너 이미지에서 원격으로 호스팅된 스크립트를 사용합니다.

자세한 내용은 [Invoke Python Scripts with WITH_CONTEXT on Autonomous AI Database](https://docs.oracle.com/iaas/autonomous-database-serverless/doc/invoke-python-scripts-on-autonomous-database.html#GUID-8737329E-40CB-4ACC-9879-AEE668B8BDC8)를 참조하세요.


## Automatic caching for external tables
* **Services**: Autonomous Database Serverless
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-automatic-caching-for-external-tables.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-automatic-caching-for-external-tables.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 External Table Cache를 사용하면 외부 테이블에서 자주 액세스하는 데이터를 데이터베이스에 캐시할 수 있습니다.

외부 테이블에 대해 정책 기반 또는 자동 캐싱 중 하나를 선택할 수 있습니다. 정책 기반 관리에서는 캐시가 생성, 채우기, 새로 고침 및 폐기되는 방식을 정의하여 캐시 내용과 수명 주기에 대한 정밀한 제어를 제공합니다. 자동 캐싱의 경우 데이터베이스가 외부 테이블 캐시의 생성, 채우기, 새로 고침 및 삭제를 포함하여 전체 캐시 수명 주기를 관리합니다.

자세한 내용은 [Use External Table Cache to Improve Performance for External Tables](https://docs.oracle.com/iaas/autonomous-database-serverless/doc/improve-application-performance-with-external-table-cache.html)를 참조하세요.


## Backup and restore with Autonomous AI Database for Developers
* **Services**: Autonomous Database Serverless
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-backup-restore-with-adb-for-developers.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-backup-restore-with-adb-for-developers.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database for Developers는 Autonomous AI Database에서 사용 가능한 백업 및 복원 기능을 지원합니다.

자세한 내용은 [Backup and Restore Autonomous AI Database Instances](https://docs.oracle.com/iaas/autonomous-database-serverless/doc/backup-restore.html)를 참조하세요.
-->


<!--
## HeatWave: Disk Usage Forecasts
* **Services**: MySQL HeatWave
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40374-heatwave-diskforecast.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40374-heatwave-diskforecast.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Health Monitor가 이제 디스크 사용 추세를 분석하고 잠재적인 저장 공간 부족을 예측합니다. 이를 통해 계획되지 않은 중단을 방지하고 디스크 공간이 중요한 상황이 되기 전에 조치를 취할 수 있습니다.

자세한 내용은 [Health Monitor](https://docs.oracle.com/iaas/mysql-database/doc/health-monitor.html)를 참조하세요.


## HeatWave: Support for Versions 9.5.0, 8.4.7, and 8.0.44
* **Services**: MySQL HeatWave
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40295-heatwave-950-847-8044.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40295-heatwave-950-847-8044.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

HeatWave가 MySQL 데이터베이스 9.5.0, 8.4.7 및 8.0.44 버전을 지원합니다. 이 버전들은 보안 및 버그 수정을 제공합니다. 새로운 DB 시스템은 기본적으로 8.4.7 버전을 기반으로 합니다. 새 DB 시스템을 생성할 때 선택적으로 9.5.0 또는 8.0.45를 선택할 수 있습니다. 기존 DB 시스템의 경우 버전 8.4.5에서 8.4.7로 또는 버전 8.0.42에서 8.0.44로 수동으로 업그레이드하거나 유지 관리 정책이 업그레이드를 처리하도록 할 수 있습니다.

세 가지 버전 모두 9.5.0(Innovation), 8.4.7(LTS) 및 8.0.44(Bugfix)는 프로덕션 수준의 품질입니다. 최신 발전과 향상을 활용하고 최첨단 기술을 최신 상태로 유지하려면 Innovation 릴리스가 가장 적합할 수 있습니다. 확립된 동작이 필요한 경우 LTS 또는 Bugfix 릴리스가 더 적합합니다.

Innovation 릴리스에는 생성된 열이 있는 테이블의 대량 로드, 구체화된 뷰 및 MySQL HeatWave 쿼리 내에서 저장된 함수 사용이 포함됩니다. HeatWave Lakehouse는 이제 Delta Lake 테이블 읽기를 지원합니다. HeatWave GenAI는 이제 하이브리드 검색 및 벡터 인덱스 자동 생성을 지원합니다. HeatWave AutoML은 이제 향상된 로그 이상 탐지 및 고급 추천 기능을 지원합니다.

자세한 내용은 [Changes in HeatWave 9.5.0](https://dev.mysql.com/doc/relnotes/heatwave/en/news-9-5-0.html), [MySQL 9.5.0 Release Notes](https://dev.mysql.com/doc/relnotes/mysql/9.4/en/news-9-5-0.html), [MySQL 8.4.7 Release Notes](https://dev.mysql.com/doc/relnotes/mysql/8.4/en/news-8-4-7.html) 및 [MySQL 8.0.44 Release Notes](https://dev.mysql.com/doc/relnotes/mysql/8.0/en/news-8-0-44.html)를 참조하세요.


## HeatWave: Configurable Version Upgrade Policies
* **Services**: MySQL HeatWave
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-36922-heatwave-configurable-maintenance.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-36922-heatwave-configurable-maintenance.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 예약된 유지 관리 업그레이드가 수행되는 방식을 구성할 수 있습니다. 유지 관리 일정이 새로운 옵션으로 업데이트되어 업그레이드할 버전, 버전 트랙 및 버전 패밀리를 선택할 수 있습니다.

자세한 내용은 [DB System Maintenance](https://docs.oracle.com/iaas/mysql-database/doc/advanced-options.html#GUID-E7525D53-DF90-4084-9AC8-4DBBE011664C)를 참조하세요.


## Internet of Things (IoT) is available in US West (San Jose)
* **Services**: Internet of Things
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/internet-of-things/update10.21.2025.htm](https://docs.oracle.com/iaas/releasenotes/internet-of-things/update10.21.2025.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Internet of Things 서비스가 US West (San Jose) 리전(`us-sanjose-1`)에서 사용 가능합니다.

자세한 내용은 다음을 참조하세요:

- Internet of Things [Overview](https://docs.oracle.com/iaas/Content/internet-of-things/home.htm)
- Internet of Things [Documentation](https://docs.oracle.com/iaas/Content/internet-of-things/home.htm)
- IoT Platform [Product page](https://www.oracle.com/cloud/cloud-native/iot-platform/)


## Oracle Critical Patch Update (CPU) October 2025 for Oracle Java SE
* **Services**: Java Management
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/java-management/jdk-oct-cpu.htm](https://docs.oracle.com/iaas/releasenotes/java-management/jdk-oct-cpu.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Java Management는 Oracle Java SE의 2025년 10월 Oracle Critical Patch Update (CPU)의 일부인 다음 릴리스를 지원합니다.

- 25.0.1
- 21.0.9
- 17.0.17
- 11.0.29
- 8u471

이러한 Oracle Java Runtime은 [Java Download](https://docs.oracle.com/iaas/jms/doc/java-download.html) 및 [Java Runtime Lifecycle Management](https://docs.oracle.com/iaas/jms/doc/java-runtime-lifecycle-management.html#AJSUG-GUID-08673CB1-D87D-4BC5-A61D-E59DCC879ABB)에서 찾을 수 있습니다. Java Management에 대한 자세한 내용은 [Java Management user documentation](https://docs.oracle.com/iaas/jms/index.html)을 참조하세요.


## Compute Cloud@Customer - New Documentation URLs
* **Services**: Compute Cloud@Customer
* **Release Date**: October 21, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/compute-cloud-at-customer/release-note-2025-10-21.htm](https://docs.oracle.com/iaas/releasenotes/compute-cloud-at-customer/release-note-2025-10-21.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

2025년 10월부터 Compute Cloud@Customer 문서 URL이 변경되었습니다.
-->


## VN Encryption changes
* **Services**: Networking
* **Release Date**: October 20, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/govcloud/vn_encryption.htm](https://docs.oracle.com/iaas/releasenotes/govcloud/vn_encryption.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

VN Encryption 기능이 변경되어 이제 테넌시 관리자가 Oracle 고객 지원의 개입 없이 **Create VCN** 또는 **Edit VCN** 워크플로우를 사용하여 VCN에서 활성화하거나 비활성화할 수 있습니다. 또한 지원되는 Compute 셰이프도 변경되었습니다.

VN Encryption 업데이트 요약은 다음과 같습니다.

- **Tenancy Admin 직접 활성화/비활성화 지원**: 기존에는 Oracle Support SR이 필요했지만, 이제 Tenancy Administrator 권한 보유자가 **Create VCN** 및 **Edit VCN** 워크플로우에서 즉시 Enable/Disable할 수 있습니다.
- **지원 Compute Shape 목록 업데이트**: 일부 Shape가 새롭게 지원되고 일부는 제외될 수 있습니다. 최신 목록은 [OCI GovCloud — VN Encryption](https://docs.oracle.com/iaas/Content/gov-cloud/govinfo.htm#govinfo_topic_LAN-encryption)에서 확인하세요.

VN Encryption 기능은 VCN 내부 트래픽을 자동으로 암호화하여 애플리케이션 변경 없이 네트워크 계층에서 내부 통신을 보호합니다.

- **암호화되는 트래픽 구간**: VCN 내부 VM ↔ VM, VM ↔ Load Balancer, VCN 내부 서비스 간 통신, 서브넷 간/동일 서브넷 트래픽
- **암호화 기술 방식**: AES-GCM 256-bit 암호화, Compute NIC 기반 Offload 방식, 애플리케이션/OS 변경 없음
- **암호화되지 않는 구간**: VCN 밖(Public Internet)은 TLS/IPSec 필요, Classic NAT 일부 구간
- **실무 영향 및 활용 시나리오**: SR 없이 내부에서 즉시 적용 가능, PoC 및 고객 보안 요구사항 대응 시간 단축, Shape 호환성 확인 필요
- **권장 사용 고객/시나리오**: 금융/공공 등 내부망 암호화 요구 고객, SaaS ISV의 고객 데이터 보호 강화, Zero Trust architecture 요구 기업, Migration 프로젝트에서 내부 트래픽 보호

자세한 내용은 [VN Encryption](https://docs.oracle.com/iaas/Content/gov-cloud/govinfo.htm#govinfo_topic_LAN-encryption)을 참조하세요.


<!--
## Log Analytics: Support to ingest logs from OCI Vault
* **Services**: Log Analytics
* **Release Date**: October 17, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/log-analytics/oct25-oob-oci-vault.htm](https://docs.oracle.com/iaas/releasenotes/log-analytics/oct25-oob-oci-vault.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Log Analytics는 이제 OCI Logging을 통해 Service Connector를 사용하여 OCI Vault에서 로그를 수집하는 것을 지원합니다. 다음 새로운 Oracle 정의 리소스를 사용할 수 있습니다:

- Oracle 정의 소스 **OCI Key Management Crypto Logs**
- Oracle 정의 파서 **OCI Key Management Crypto Log Format**

수집을 설정하고 수집 권한을 활성화하기 위한 IAM 정책에 대한 단계는 [Ingest Logs from Other OCI Services Using Service Connector](https://docs.oracle.com/iaas/log-analytics/doc/ingest-logs-from-other-oci-services-using-service-connector.html)를 참조하세요.


## Oracle Autonomous AI Database
* **Services**: Autonomous Database on Dedicated Exadata Infrastructure, Autonomous Database on Exadata Cloud@Customer
* **Release Date**: October 14, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-service-rebranding.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-service-rebranding.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle AI Database는 핵심에 인공 지능(AI)을 설계하여 모든 주요 데이터 유형과 워크로드에 걸쳐 AI를 원활하게 통합합니다.

그 결과 Oracle Autonomous Database는 **Oracle Autonomous AI Database**가 되었습니다. 또한 Oracle Autonomous Transaction Processing은 **Oracle Autonomous AI Transaction Processing**이 되고, Oracle Autonomous JSON Database는 **Oracle Autonomous AI JSON Database**가 되었습니다.

**Oracle Autonomous AI Lakehouse**가 Autonomous Data Warehouse의 차세대 제품으로 추가되었습니다. 모든 기능을 유지하면서 Iceberg 및 기타 오픈 소스 기술과 긴밀하게 통합하기 위한 다양한 기능을 도입했습니다.

Oracle Autonomous AI Database 26ai가 Oracle Autonomous Database 23ai를 대체합니다. 따라서 `dbVersion`에 대해 23ai를 사용하여 [CreateAutonomousDatabase](https://docs.oracle.com/iaas/api/#/en/database/latest/AutonomousDatabase/CreateAutonomousDatabase)를 계속 사용할 수 있습니다. REST API는 Oracle Database 23ai를 반환하지만 Oracle Cloud Infrastructure (OCI) 콘솔에서는 Oracle Database 26ai가 표시됩니다.

Oracle Cloud Infrastructure (OCI) 콘솔, REST API 및 관련 문서에서 새로운 서비스 이름을 확인할 수 있습니다.

자세한 내용은 [Press Release](https://www.oracle.com/news/announcement/ai-world-database-26ai-powers-the-ai-for-data-revolution-2025-10-14/) 및 [Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html)를 참조하세요.


## Oracle Autonomous AI Database
* **Services**: Autonomous Database Serverless
* **Release Date**: October 14, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-oracle-autonomous-ai-database.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-oracle-autonomous-ai-database.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle AI Database는 핵심에 인공 지능(AI)을 설계하여 모든 주요 데이터 유형과 워크로드에 걸쳐 AI를 원활하게 통합합니다.

그 결과 Oracle Autonomous Database는 **Oracle Autonomous AI Database**가 되었습니다. 또한 Oracle Autonomous Transaction Processing은 **Oracle Autonomous AI Transaction Processing**이 되고, Oracle Autonomous JSON Database는 **Oracle Autonomous AI JSON Database**가 되었습니다.

**Oracle Autonomous AI Lakehouse**가 Autonomous Data Warehouse의 차세대 제품으로 추가되었습니다. 모든 기능을 유지하면서 Iceberg 및 기타 오픈 소스 기술과 긴밀하게 통합하기 위한 다양한 기능을 도입했습니다.

Oracle Autonomous AI Database 26ai가 Oracle Autonomous Database 23ai를 대체합니다. 따라서 `dbVersion`에 대해 23ai를 사용하여 [CreateAutonomousDatabase](https://docs.oracle.com/iaas/api/#/en/database/latest/AutonomousDatabase/CreateAutonomousDatabase)를 계속 사용할 수 있습니다. REST API는 23ai를 반환하지만 Oracle Cloud Infrastructure (OCI) 콘솔에서는 **26ai**가 표시됩니다.

Oracle Cloud Infrastructure (OCI) 콘솔, REST API 및 관련 문서에서 새로운 서비스 이름을 확인할 수 있습니다.

자세한 내용은 [Press Release](https://www.oracle.com/news/announcement/ai-world-database-26ai-powers-the-ai-for-data-revolution-2025-10-14/) 및 [Oracle Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html)를 참조하세요.


## Use xAI Grok 4 Fast in OCI Generative AI
* **Services**: Generative AI
* **Release Date**: October 10, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/xAI-grok-4-fast.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/xAI-grok-4-fast.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

사전 훈련된 xAI Grok 4 Fast 모델이 OCI Generative AI용 xAI 플랫폼에서 일반 사용 가능(GA) 상태입니다. Grok 4 Fast는 xAI의 주요 Grok 4 모델의 속도 및 비용 최적화 버전입니다. Grok 4 Fast는 Grok 4보다 빠르며, 빠른 첫 토큰 시간과 높은 출력 속도를 제공합니다. 이러한 속도 우선순위로 인해 이 모델은 실시간 애플리케이션에 이상적입니다.

시작하려면 지원되는 리전에서 playground를 사용하여 xAI Grok 4 Fast 모델을 사용해 보세요. 모델 기능 및 지원되는 리전에 대한 자세한 내용은 [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/xai-grok-4-fast.htm)을 참조하세요.
-->

<!--
## Log Analytics: Support to ingest logs from OCI Cache
* **Services**: Log Analytics
* **Release Date**: October 10, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/log-analytics/oct25-oob-oci-cache.htm](https://docs.oracle.com/iaas/releasenotes/log-analytics/oct25-oob-oci-cache.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Log Analytics는 이제 OCI Logging을 통해 Service Connector를 사용하여 OCI Cache에서 로그를 수집하는 것을 지원합니다. 다음 새로운 Oracle 정의 리소스를 사용할 수 있습니다:

- Oracle 정의 소스 **OCI Cache Engine Logs**
- Oracle 정의 파서 **OCI Cache Engine Log Format**

수집을 설정하고 수집 권한을 활성화하기 위한 IAM 정책에 대한 단계는 [Ingest Logs from Other OCI Services Using Service Connector](https://docs.oracle.com/iaas/log-analytics/doc/ingest-logs-from-other-oci-services-using-service-connector.html)를 참조하세요.



## Protect on-premises Oracle Databases with Oracle Database Zero Data Loss Cloud Protect
* **Services**: Oracle Database Autonomous Recovery Service
* **Release Date**: October 09, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/recovery-service/cloud-protect-fleetagent.htm](https://docs.oracle.com/iaas/releasenotes/recovery-service/cloud-protect-fleetagent.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Database Zero Data Loss Cloud Protect가 제공됩니다: OCI에 배포된 Oracle Zero Data Loss Autonomous Recovery Service를 사용하여 온프레미스 Oracle 데이터베이스를 보호합니다. 이 새로운 기능은 실시간 트랜잭션 보호, 논리적으로 공기 격리된 불변 백업을 제공하며 모든 위치에서 빠른 특정 시점 복구를 가능하게 합니다.

자세한 내용은 [Protecting On-premises Databases using Oracle Database Zero Data Loss Cloud Protect](https://docs.oracle.com/iaas/recovery-service/doc/protecting-premises-databases-using-recovery-service.html)를 참조하세요.
-->


<!--
## Deprecated API version
* **Services**: Network Firewall
* **Release Date**: October 31, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/network-firewall/API-deprecation.htm](https://docs.oracle.com/iaas/releasenotes/network-firewall/API-deprecation.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

[Oracle Network Firewall API의 20211001 버전](https://docs.oracle.com/iaas/api/#/en/network-firewall/20211001/)에 대한 지원이 2026년 1월 30일에 종료됩니다. 지속적인 기능 및 지원을 보장하기 위해 이 API의 20230501 버전으로 업그레이드하는 것을 강력히 권장합니다.

자세한 내용은 [service change announcement](https://docs.oracle.com/iaas/Content/servicechanges.htm#NetworkFirewall)를 참조하세요.
-->


<!--
## Log Analytics: Support to ingest more logs from Oracle Enterprise Manager
* **Services**: Log Analytics
* **Release Date**: October 31, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/log-analytics/oct25-oob-em-api.htm](https://docs.oracle.com/iaas/releasenotes/log-analytics/oct25-oob-em-api.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Log Analytics는 이제 Oracle Enterprise Manager에서 더 많은 로그 수집을 지원합니다. 다음 새로운 Oracle 정의 소스를 사용할 수 있습니다:

- **Enterprise Manager API Gateway Access Logs**
- **Enterprise Manager API Gateway Application Logs**
- **Enterprise Manager API Gateway LCM Logs**
-->