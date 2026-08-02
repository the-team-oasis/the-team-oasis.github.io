---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2026년 7월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-dataplatform
tags:
  - oci-release-notes-2026
  - Jul-2026
  - DATAPLATFORM, DATABASE, ORACLE
#
# Styling
#
header: no
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## External Authentication Support for Database Tools in Autonomous AI Database
* **Services:** Autonomous Database Serverless
* **Release Date:** July 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-external-authentication.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-external-authentication.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Use External Authentication with Database Tools](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/use-external-authentication-with-database-tools.html#GUID-D20607FB-7680-4981-A3E0-FB8745521D94){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 Database Tools에서 external authentication을 지원합니다. Database Actions(SQL Developer Web)와 Data Studio에 OCI IAM, Microsoft Entra ID, Google Cloud Platform, AWS Cognito, Okta 같은 중앙 identity provider를 사용해 database password 없이 로그인할 수 있습니다.

### 인증 방식 변화

Autonomous AI Database의 Database Tools가 external authentication을 지원합니다. Database Actions(SQL Developer Web)와 Data Studio에서 OCI IAM, Microsoft Entra ID, Google Cloud Platform, AWS Cognito, Okta 같은 중앙 identity provider를 사용할 수 있고, database password 없이 globally identified database user로 로그인할 수 있습니다.

### 사용자 매핑 예시

외부 인증은 identity provider group과 database role mapping을 명확히 설계해야 합니다. 아래 SQL은 개념 예시이며 실제 구문과 provider 설정은 공식 문서를 기준으로 조정해야 합니다.

```sql
-- 외부 인증 사용자/role 설계 개념 예시
create user app_analyst identified globally as 'idp-group-app-analyst';
grant create session to app_analyst;
grant read on app_owner.sales_view to app_analyst;
```

### IAM·감사 관점

OCI IAM 또는 외부 IdP의 sign-in log와 database audit log를 연결해 누가 어떤 tool로 접근했는지 추적할 수 있어야 합니다. 공유 database password를 줄일 수 있다는 장점이 있지만, group mapping이 과도하면 권한이 넓어질 수 있습니다.

### 도입 체크리스트

* IdP group, database user, database role mapping을 문서화합니다.
* Database Actions와 Data Studio 각각에서 로그인·권한을 테스트합니다.
* 퇴사자/이동자 권한 회수 절차가 IdP group과 DB role에 동시에 반영되는지 확인합니다.
## Oracle APEX 26.1
* **Services:** Autonomous Database Serverless
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-oracle-apex.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-oracle-apex.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Create Applications with Oracle APEX in Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/apex-autonomous-database.html#GUID-6B304741-9B26-4B8E-9D6D-193AFF6679DA){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 Oracle APEX Release 26.1을 사용합니다. APEX 기반 enterprise application 개발과 실행 환경에 최신 기능과 개선 사항을 적용할 수 있게 된 업데이트입니다.

### APEX 애플리케이션 영향

Autonomous AI Database에서 Oracle APEX 26.1을 사용합니다. APEX 기반 enterprise application은 runtime, builder, theme, plugin, authentication scheme 변화에 영향을 받을 수 있으므로 단순 버전 표기 이상의 검토가 필요합니다.

### 사전 점검 항목

```sql
-- APEX 버전 확인 예시
select version_no
from apex_release;

-- workspace/application inventory 확인 예시
select workspace, application_id, application_name
from apex_applications
order by workspace, application_id;
```

운영 application은 테스트 환경에서 page rendering, process, dynamic action, REST source, authentication, authorization, custom plugin을 먼저 확인합니다.

### 배포 관리

APEX app export를 백업하고, 변경 전후 SQL Workshop, REST Enabled SQL, external authentication 등 연계 기능이 정상 동작하는지 확인합니다. 고객-facing app은 UI regression test도 필요합니다.
## Availability Domain Selection in Autonomous AI Database
* **Services:** Autonomous Database Serverless
* **Release Date:** July 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-ad-selection.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-ad-selection.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Specify an Availability Domain when you provision a new instance using the API](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/autonomous-provision.html#GUID-17A0E50E-33F2-45BD-A704-21347B287192){:target="_blank" rel="noopener"}
* **Documentation:** [Change Availability Domain on the OCI Console](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/view-network-information.html#GUID-F19D104D-76C5-4091-B485-58653C5F0369){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 기존 instance의 Availability Domain을 OCI Console로 변경할 수 있고, 신규 생성 또는 clone 시 API로 AD를 선택할 수 있습니다. Compute VM 등 관련 OCI resource와 같은 AD에 배치해 network latency를 줄이는 설계가 가능해졌습니다.

### 배치 설계 변화

Autonomous AI Database에서 기존 instance의 Availability Domain을 Console로 변경할 수 있고, 신규 생성 또는 clone 시 API로 AD를 선택할 수 있습니다. Compute VM 같은 관련 OCI resource와 같은 AD에 배치해 latency를 줄이는 설계가 가능해졌습니다.

### API 사용 예시

공식 문서의 provisioning API 흐름에서는 Autonomous Database 생성 payload에 availability domain 관련 속성을 포함해 배치 의도를 지정합니다. 실제 field 이름과 값은 사용 중인 API version과 SDK 문서를 기준으로 확인해야 합니다.

```json
{
  "compartmentId": "ocid1.compartment.oc1..example",
  "dbName": "APPDB01",
  "displayName": "appdb01",
  "computeModel": "ECPU",
  "computeCount": 4,
  "dataStorageSizeInTBs": 1,
  "availabilityDomain": "Uocm:AP-SEOUL-1-AD-1"
}
```

### 운영상 영향

AD 선택은 latency 최적화와 장애 격리 사이의 trade-off입니다. 애플리케이션 tier와 DB를 같은 AD에 두면 latency는 줄 수 있지만, 특정 AD 장애에 함께 영향을 받을 수 있습니다. HA/DR 요구사항이 큰 시스템은 AD 배치와 backup, clone, cross-region strategy를 함께 검토해야 합니다.
## Explore Database Management Using Demo Mode
* **Services:** Database Management
* **Release Date:** July 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-management/enable-demo-mode.htm](https://docs.oracle.com/iaas/releasenotes/database-management/enable-demo-mode.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Explore Database Management Using Demo Mode](https://docs.oracle.com/iaas/database-management/doc/explore-database-management-using-demo-mode.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Management에서 Demo Mode를 사용할 수 있습니다. 실제 monitored environment를 구성하지 않아도 curated demo data가 있는 read-only 환경에서 monitoring과 analysis capability를 탐색할 수 있습니다. 고객 데모, 내부 교육, 기능 비교 자료 준비에 특히 유용합니다.

### 데모 모드의 목적

Database Management Demo Mode는 monitored environment를 직접 구성하지 않아도 curated demo data로 monitoring과 analysis 기능을 탐색할 수 있는 read-only 경험입니다. 고객 워크숍, 내부 교육, 기능 소개에서 credential이나 agent 설치 없이 화면 흐름을 설명할 수 있습니다.

### 실제 운영 환경과 구분할 점

Demo Mode의 지표와 finding은 실제 운영 DB의 성능 상태가 아닙니다. 고객에게 보여줄 때는 “기능 이해를 위한 샘플 데이터”라고 명시하고, 실제 도입 시 필요한 agent, database connection, permission, metric collection 절차를 별도로 안내해야 합니다.

### 교육 자료 구성 팁

* Demo Mode 화면: 기능 탐색과 UI 설명에 사용
* 실제 managed database 화면: 운영 분석 절차 설명에 사용
* 성능 분석 보고서: 실제 workload 기간, 배포 이벤트, 통계 수집 시점과 함께 작성
## Compare Period ADDM
* **Services:** Database Management
* **Release Date:** July 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-management/compare-period-addm.htm](https://docs.oracle.com/iaas/releasenotes/database-management/compare-period-addm.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Monitor and Manage a Specific Managed Database](https://docs.oracle.com/iaas/database-management/doc/monitor-manage-specific-managed-database.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Management에서 Compare Period ADDM을 Preview로 사용할 수 있습니다. Same time yesterday, Same time last week 같은 옵션으로 두 기간의 database performance를 비교하고, overview, findings, resource usage, configuration comparison details를 확인할 수 있습니다. 보고서는 HTML 또는 XML로 다운로드할 수 있습니다.

### 분석 가능한 것

Compare Period ADDM은 두 기간의 database performance를 비교하고 overview, findings, resource usage, configuration comparison details를 제공합니다. Same time yesterday, Same time last week 같은 기준을 활용할 수 있으며, HTML 또는 XML report로 다운로드할 수 있습니다.

### 비교 기간 선정 방법

성능 저하를 분석할 때는 기준 기간과 문제 기간의 workload 성격이 비슷해야 합니다. 배포 직후, batch window, 월말 마감, 통계 수집 전후처럼 workload가 다른 기간을 단순 비교하면 잘못된 결론이 나올 수 있습니다.

```text
권장 분석 메모
- 기준 기간: 2026-07-20 10:00~11:00, 정상 응답 시간
- 비교 기간: 2026-07-23 10:00~11:00, 배포 후 지연 발생
- 관련 이벤트: app release v2.4, index 변경 없음, batch 없음
- 확인 대상: DB time, wait event, SQL elapsed time, configuration diff
```

### Preview 제약

Compare Period ADDM은 preview이므로 결과 형식과 제공 범위가 변경될 수 있습니다. 운영 의사결정에는 ADDM finding만 보지 말고 AWR/ASH, application metric, OS/resource metric과 함께 판단합니다.
## New connection types added for GoldenGate
* **Services:** GoldenGate
* **Release Date:** July 27, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/goldengate/r11connections.htm](https://docs.oracle.com/iaas/releasenotes/goldengate/r11connections.htm){:target="_blank" rel="noopener"}
* **Documentation:** [What is new in OCI GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/ocigg/whats-new-in-oracle-cloud-infrastructure-goldengate.html){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI GoldenGate에 AI Models와 Google Managed Service for Apache Kafka 등 신규 connection type이 추가되었습니다. 데이터 통합 pipeline에서 AI endpoint 또는 외부 Kafka 관리형 서비스와의 연결 선택지가 넓어진 것이 핵심입니다. 이 글에서는 일반 데이터 통합 관점의 신규 연결 유형이 운영 설계에 주는 영향 중심으로 정리합니다.

### 신규 연결 유형의 의미

GoldenGate가 AI Models와 Google Managed Service for Apache Kafka 등 신규 connection type을 지원합니다. 데이터 pipeline이 전통적인 database replication을 넘어 AI endpoint, 외부 managed streaming platform과 연결될 수 있다는 점이 중요합니다.

### Kafka 연계 고려사항

Google Managed Service for Apache Kafka 같은 외부 Kafka와 연계할 때는 bootstrap server, TLS, authentication, topic naming, consumer group, network egress를 함께 설계해야 합니다. Apache Kafka는 분산 commit log 기반 event streaming platform이며, throughput과 ordering, partition 설계가 품질을 좌우합니다.

```properties
# Kafka connection 검토 항목 예시
bootstrap.servers=<broker1>:9092,<broker2>:9092
security.protocol=SASL_SSL
sasl.mechanism=PLAIN
# 실제 credential은 GoldenGate connection credential store 또는 보안 저장소 사용
```

### AI Models 연결 시 주의점

AI Models 연결은 데이터가 model endpoint로 전달될 수 있음을 의미합니다. PII, 고객 데이터, prompt logging, inference 비용, retry 시 중복 호출을 반드시 검토해야 합니다.

### 운영 설계

신규 connection type은 네트워크와 인증 실패가 replication lag로 드러날 수 있습니다. connection test, lag monitoring, dead-letter/retry 정책, schema evolution 전략을 함께 준비합니다.
## Database Developer Portal for Database Tools
* **Services:** Database Tools
* **Release Date:** July 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-tools/dev-db.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/dev-db.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Database Developer Portal](https://docs.oracle.com/iaas/database-tools/doc/database-tools-database-developer-portal.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Tools에 Database Developer Portal이 추가되었습니다. 개발자는 단일 workspace에서 새 database service provisioning, database connection 생성·관리, 지원되는 development tool 실행, 자주 쓰는 database와 connection 접근을 수행할 수 있습니다. 개발자 경험 측면에서는 OCI 콘솔 안의 데이터베이스 작업 진입점을 더 명확히 모으는 변화입니다.

### 개발자 작업 흐름

Database Developer Portal은 database developer가 OCI 안에서 database service provisioning, database connection 관리, 개발 도구 실행, 자주 사용하는 database 접근을 한곳에서 처리하도록 돕는 workspace입니다. Database Tools가 단순 connection 목록을 넘어 개발자 진입점 역할을 하게 된 변화입니다.

### 권한과 연결 관리

Database connection은 compartment, private endpoint 또는 public endpoint 접근성, credential 저장 방식, vault/secret 사용 여부, database user 권한과 함께 관리해야 합니다. 개발자가 포털에서 connection을 볼 수 있다고 해서 database 내부 권한까지 자동으로 제한되는 것은 아니므로, OCI IAM과 database privilege를 모두 점검해야 합니다.

```text
권한 분리 예시
- OCI IAM: Database Tools connection 조회/사용 권한
- Network: 개발자 subnet 또는 bastion 경로에서 database endpoint 접근
- Database: 개인 계정 또는 role 기반 최소 권한
- Audit: Database Actions 접속과 SQL 실행 이력 추적
```

### 적용 시나리오

개발·테스트 DB는 developer portal로 접근성을 높이고, 운영 DB는 별도 approval과 read-only role을 요구하는 방식이 안전합니다. 여러 프로젝트가 같은 테넌시를 쓰는 경우 connection naming convention과 tag를 표준화해야 합니다.
