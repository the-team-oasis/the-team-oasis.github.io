---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "8월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2026년 8월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-dataplatform
tags:
  - oci-release-notes-2026
  - Aug-2026
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

## Oracle database Patch Compliance in Oracle Data Safe
* **Services:** Data Safe
* **Release Date:** August 04, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/data-safe/patch-compliance.htm](https://docs.oracle.com/iaas/releasenotes/data-safe/patch-compliance.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/data-safe/doc/view-patch-compliance.html](https://docs.oracle.com/iaas/data-safe/doc/view-patch-compliance.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Safe의 Security Assessment에 Patch Compliance 화면이 추가되어 Oracle Database fleet의 분기별 Release Update 적용 상태를 한곳에서 확인할 수 있습니다. 최신 RU 적용 여부뿐 아니라 패치가 필요한 대상, 버전 업그레이드가 필요한 대상, RU 정보를 확인할 수 없는 대상을 구분하고 open CVE, 뒤처진 RU 수, 마지막 평가 시각을 데이터베이스별로 보여 줍니다.

### 적용 및 운영 영향

Patch Compliance 페이지에서 compartment와 target database group으로 범위를 좁힌 뒤 상태 차트와 RU 분포 차트를 확인합니다. 개별 데이터베이스 행의 **Refresh data**를 실행하면 갱신 진행률과 완료 상태를 확인할 수 있으므로, 보안 점검 전에 최신 평가 결과를 확보하는 흐름으로 운영할 수 있습니다. 여러 데이터베이스의 패치 우선순위를 같은 기준으로 비교할 수 있지만, 이 화면은 패치 상태를 평가하고 표시하는 기능이며 실제 RU 적용 작업을 대신하지는 않습니다.

### 확인 포인트

요약 표에서 `Release Updates behind`, `Open CVEs`, `Days since patched`, `Recommended Release Update`, `Last Updated`를 확인하고, 갱신 완료 후 대상이 의도한 compliance status로 분류되는지 검증합니다. `Release Update information unavailable` 상태는 미패치로 단정하지 말고 데이터 수집과 평가 상태를 먼저 점검해야 합니다.

## Configure HTTP Retry Behavior for DBMS_CLOUD.SEND_REQUEST
* **Services:** Autonomous Database Serverless
* **Release Date:** August 05, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-configure-http.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-configure-http.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-subprograms.html#GUID-B063870D-6C1F-4F33-B354-885B73C81D37](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-subprograms.html#GUID-B063870D-6C1F-4F33-B354-885B73C81D37){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 `DBMS_CLOUD.SEND_REQUEST`에 요청별 HTTP 재시도 동작을 조정하는 선택적 `retry_params` JSON CLOB 매개변수가 추가되었습니다. 정기 job이나 batch workload가 일시적으로 사용할 수 없는 endpoint를 호출할 때 재시도 횟수와 총 대기 시간을 제한하고 exponential backoff를 적용할 수 있습니다.

### 재시도 설정

`max_attempts`는 최초 요청 이후 재시도 횟수를 0~100 범위에서 지정하며 0이면 재시도를 끄고 기본값은 5입니다. `total_timeout`은 요청과 재시도 사이의 대기를 포함한 전체 retry loop를 1~600초로 제한하고, `backoff_base_wait`는 첫 재시도 전 대기를 0~10초로 지정하며 기본값은 0.5초입니다. `max_wait_between_attempts`는 exponential backoff의 회차별 최대 대기를 제한합니다.

### 영향, 제약 및 검증

호출 시간이 예측 가능해지고 장애 endpoint에 반복 요청이 집중되는 것을 줄일 수 있지만, `retry_params`가 모든 오류를 재시도 가능하게 바꾸지는 않으며 `DBMS_CLOUD`가 기존에 retryable로 판단하는 throttling, 일부 server error, timeout과 network error 등에만 적용됩니다. 멱등성이 보장되지 않는 `POST`나 `PUT`은 재시도로 중복 처리가 발생할 수 있는지 애플리케이션 측에서 먼저 확인해야 합니다. 테스트 endpoint에서 성공, retryable failure, non-retryable failure를 각각 실행해 실제 시도 횟수와 총 경과 시간이 설정 범위에서 종료되는지 검증합니다.

## Background Execution Of SQL Statements and Scripts
* **Services:** Database Tools
* **Release Date:** August 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-tools/backgrnd-execution.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/backgrnd-execution.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/database-tools/doc/running-statements-and-scripts-background.html](https://docs.oracle.com/iaas/database-tools/doc/running-statements-and-scripts-background.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Tools의 SQL Worksheet에서 SQL statement와 script를 background job으로 실행할 수 있어 긴 작업이 활성 session과 독립적으로 계속 실행됩니다. Background execution은 작업을 비동기로 수행해 실행 중에도 다른 작업을 계속할 수 있게 합니다.

### 실행·결과 확인

기본 **Run Statement**와 **Run Script**는 동기 실행이고, **Run in Background**와 **Run Script in Background**는 비동기 실행입니다. Background execution 결과는 OCI Object Storage에 저장되며, output pane의 **Background Executions** 탭에서 실행 상태를 모니터링하고 완료된 결과를 확인합니다. 완료와 실패 상태를 구분해 확인하고, 실패한 실행은 표시된 오류와 결과 출력을 바탕으로 원인을 조사합니다.

### 운영 시 유의사항

> **운영 권고:** 장시간 SQL을 background로 전환하기 전에 사용 권한, 예상 실행 시간과 database 부하를 확인합니다. Object Storage에 저장되는 결과의 접근 권한과 보존·삭제 기준을 정하고, 완료·실패 알림 또는 정기 확인 절차를 마련해 session과 독립적으로 실행되는 작업을 놓치지 않도록 관리합니다.

## Database Tools MCP Server Enhancements
* **Services:** Database Tools
* **Release Date:** August 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-tools/gen-ai.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/gen-ai.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/database-tools/doc/policies-mcp-server.html](https://docs.oracle.com/iaas/database-tools/doc/policies-mcp-server.html){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/database-tools/doc/database-tools-mcp-toolsets.html](https://docs.oracle.com/iaas/database-tools/doc/database-tools-mcp-toolsets.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Tools MCP server에서 현재 구성에 필요한 OCI IAM policy statement를 **View recommended policies**로 생성할 수 있고, 자연어 요청을 검증된 SQL statement로 변환하는 Generative AI SQL Assistant toolset을 사용할 수 있습니다. MCP client에 제공되는 database 기능을 toolset 단위로 정의하면서 초기 IAM 구성 누락을 줄일 수 있는 변화입니다.

### 권한과 Toolset 구성

권장 policy는 MCP server와 Database Tools connection의 runtime identity가 Authenticated Principal인지 Resource Principal인지, database 인증이 token인지 password인지, scope가 resource인지 compartment인지에 따라 달라집니다. SQL Assistant를 사용하는 주체에는 `generative-ai-nl2sql` 사용 권한이 추가로 필요하며, tool access는 Identity Domains의 `MCP_User` 또는 `MCP_Administrator` application role로 제어합니다. 생성된 문장은 그대로 넓게 적용하기보다 resource scope와 대상 OCID 조건을 검토해 최소 권한으로 반영합니다.

### 제약 및 검증

Token 인증의 on-behalf-of 연결에 필요한 `database-tools-db-connect-obo` 권한은 현재 특정 database나 compartment로 제한할 수 없어 tenancy 수준에서 부여되므로, 신뢰할 수 있는 관리자가 운영하는 MCP server로 대상을 제한해야 합니다. 두 runtime identity를 모두 Authenticated Principal로 구성하면 asynchronous request를 지원하지 않으며, SQL Assistant가 만든 SQL도 실행 전 database 권한과 업무 안전성을 별도로 통제해야 합니다. MCP client에서 허용된 사용자와 차단된 사용자를 각각 호출하고, SQL Assistant toolset discovery와 대표 자연어 요청의 SQL 변환, database connection의 최소 권한 동작을 검증합니다.

## Time Travel for Apache Iceberg Tables
* **Services:** Autonomous Database Serverless
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-time-travel.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-time-travel.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/query-external-data-apache-iceberg.html#GUID-C8ABBCC1-3742-441C-8712-4BDFBD49FB71](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/query-external-data-apache-iceberg.html#GUID-C8ABBCC1-3742-441C-8712-4BDFBD49FB71){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 Apache Iceberg external table을 `AS OF TIMESTAMP`로 조회해 지정 시점의 snapshot을 읽을 수 있습니다. Databricks, AWS Glue, OCI Object Storage의 Hadoop Catalog를 통해 접근하는 Iceberg 데이터에 대해 과거 분석, 감사, 장애 조사와 동일 시점 기준의 반복 보고서를 만들 수 있습니다.

### 구성과 활용 영향

Catalog-managed external table은 catalog가 현재 metadata와 snapshot을 해석하므로 필요한 catalog credential, object store credential, outbound HTTPS ACL을 구성해야 합니다. 특정 업무 시각을 기준으로 현재 조회와 `AS OF TIMESTAMP` 결과를 비교하면 upstream 변경 전후의 데이터 차이를 database SQL에서 분석할 수 있습니다.

### 지원 범위와 검증

Iceberg time travel 지원 catalog는 Databricks, AWS Glue, OCI Object Storage의 Hadoop Catalog이며, partitioned Iceberg table과 merge-on-read delete file은 지원되지 않습니다. Fixed external table의 schema가 Iceberg metadata의 schema version과 달라지면 table을 다시 생성해야 하고, metadata 파일을 직접 지정한 external table은 새 snapshot을 자동으로 반영하지 않습니다. 검증 시 catalog의 알려진 snapshot 시각 전후로 `AS OF TIMESTAMP` 결과를 비교하고, 현재 snapshot 조회와 행 수·핵심 값을 대조하며 ACL과 credential 오류가 없는지 확인합니다.

## Changes to DBMS_CLOUD.EXPORT_DATA Parquet Type Mappings
* **Services:** Autonomous Database Serverless
* **Release Date:** August 18, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-export-data-changes.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-export-data-changes.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/data-type-mapping-oracle-parquet.html#GUID-AEFEC843-027D-44A0-A8FA-892C523CDA38](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/data-type-mapping-oracle-parquet.html#GUID-AEFEC843-027D-44A0-A8FA-892C523CDA38){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/export-data-parquet.html#GUID-7C1CADFE-3A39-416D-A0FF-96AC447489D0](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/export-data-parquet.html#GUID-7C1CADFE-3A39-416D-A0FF-96AC447489D0){:target="_blank" rel="noopener"}

### 업데이트 내용

`DBMS_CLOUD.EXPORT_DATA`의 Parquet export 구현이 변경되어 reliability와 performance가 개선되고, 생성 파일의 Oracle-to-Parquet type mapping도 갱신되었습니다. 기존 export를 교체하거나 downstream engine이 Parquet schema를 고정해 읽는 환경에서는 파일 내용뿐 아니라 logical type과 precision 변화를 함께 검토해야 합니다.

### Type Mapping 영향

새 mapping에서 `DATE`와 `TIMESTAMP(3)`은 `TIMESTAMP_MILLIS`, `TIMESTAMP(6)`은 `TIMESTAMP_MICROS`, `TIMESTAMP(9)`은 `TIMESTAMP_NANOS`로 대응하며, `NUMBER(p)`는 precision에 따라 `DECIMAL/INT64` 또는 `DOUBLE` 계열로 달라질 수 있습니다. Export session의 `NLS_DATE_FORMAT`, `NLS_TIMESTAMP_FORMAT`, `NLS_TIMESTAMP_TZ_FORMAT`, `NLS_NUMERIC_CHARACTERS`도 변환에 사용되므로 배치마다 동일한 session 설정을 적용해야 합니다.

### 제약 및 검증

NLS format의 두 자리 연도 `RR` mask는 Parquet export에서 지원되지 않아 application error가 발생하므로 `YYYY` 기반 형식으로 변경해야 합니다. `BFILE`, `BLOB`, `LONG`, `LONG RAW`, object type은 지원되지 않고, `DATE`는 Parquet export에서 시·분·초를 지원하지 않는 등 type별 제한이 있습니다. 대표 데이터셋으로 신규 Parquet를 생성한 뒤 downstream engine에서 schema, timestamp precision, timezone, 큰 precision의 NUMBER, null과 경계값을 읽어 기존 파일과 비교하고, `NLS_SESSION_PARAMETERS` 값도 함께 기록해 검증합니다.

## External File System Support for Workload Capture and Replay
* **Services:** Autonomous Database Serverless
* **Release Date:** August 18, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-external-file-system.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-external-file-system.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/capture-replay-workloads-standard.html#GUID-865F8C42-634D-41A0-BBE4-B8958AEADF82](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/capture-replay-workloads-standard.html#GUID-865F8C42-634D-41A0-BBE4-B8958AEADF82){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 workload capture와 replay가 Oracle-managed Object Storage뿐 아니라 고객 관리 directory의 external file system에도 capture file, replay file과 report를 저장할 수 있습니다. 저장 위치와 보존 정책을 고객이 관리해야 하는 환경에서 workload 이동과 테스트 자료 관리의 선택지가 넓어졌습니다.

### Directory 기반 구성

`DBMS_CLOUD_ADMIN.START_WORKLOAD_CAPTURE`의 `params`에 `directory_name`을 지정하면 capture file이 해당 고객 관리 directory에 저장되고, `REPLAY_WORKLOAD`에도 같은 방식으로 directory를 지정해 파일을 읽을 수 있습니다. 실행 주체는 `ADMIN`이거나 `DBMS_CLOUD_ADMIN`에 대한 `EXECUTE` 권한이 있어야 하며, 상태와 이력은 `DBA_CAPTURE_REPLAY_STATUS`와 `DBA_CAPTURE_REPLAY_HISTORY`에서 확인합니다.

### 제약 및 검증

Replay 대상은 source와 논리적으로 일관된 상태의 full clone 또는 refreshable clone이어야 하며, capture file에는 transaction detail, bind value와 SQL text가 포함될 수 있어 directory 접근 권한과 보존·삭제 정책을 엄격히 적용해야 합니다. 동일한 capture name이 여러 개면 최신 capture가 사용되므로 혼동을 피하려면 이름을 고유하게 관리합니다. 짧은 대표 workload를 capture한 후 `cap`, `capfiles` 하위 파일 생성과 상태 완료를 확인하고, clone에서 replay한 뒤 report 생성 및 핵심 transaction 결과를 원본과 비교합니다.

## Service Logs for Database Tools MCP Servers
* **Services:** Database Tools
* **Release Date:** August 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-tools/logging.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/logging.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/database-tools/doc/logging.html](https://docs.oracle.com/iaas/database-tools/doc/logging.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Tools MCP server 작업에 OCI Logging service log를 수집해 호출 활동을 조사하고 장애를 분석할 수 있습니다. `MCP Invocation Logs`는 기본적으로 비활성화되어 있으므로 필요한 MCP server에서 명시적으로 활성화해야 합니다.

### 활성화 및 확인

MCP server의 **Monitoring** 탭에서 `MCP Invocation Logs`의 **Enable log**를 선택하고 기존 log group을 지정하거나 새 log group을 생성합니다. 작업 완료 후 상태가 `Active`로 바뀌었는지 확인합니다. 이어서 log name의 **Explore log**에서 MCP client가 반환한 `opc-request-id`를 검색해 해당 호출 기록이 수집되었는지 검증합니다.

### 운영 시 유의사항

> **운영 권고:** Log group과 MCP invocation log에 대한 IAM 접근 권한은 조사 담당자에게 필요한 범위로 제한하고, 호출 기록의 업무·감사 요구사항에 맞춰 보존 및 삭제 기준을 설정합니다. 대표 성공·실패 호출의 `opc-request-id`가 각각 검색되는지 정기적으로 확인하고, 조사 자료를 공유할 때는 log에 포함된 식별자와 민감한 요청 정보의 노출 여부를 점검합니다.

## Maintenance Schedule Selection in OCI
* **Services:** Autonomous Database Serverless
* **Release Date:** August 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-maintenance-schedule.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-maintenance-schedule.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/maintenance-windows-patching.html#GUID-B2DF6516-601A-4350-93E7-8E5E778052D1](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/maintenance-windows-patching.html#GUID-B2DF6516-601A-4350-93E7-8E5E778052D1){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Console에서 기존 Autonomous AI Database instance의 recurring maintenance schedule을 사용 가능한 다른 window로 변경할 수 있습니다. 업무량이 낮은 시간에 patching을 배치하고 application 운영 일정과 maintenance를 맞출 수 있게 된 변화입니다.

### 일정 변경과 운영 영향

Database detail의 **Maintenance schedule > Edit**에서 region이 현재 수용할 수 있는 2시간 window를 선택하고, `Earliest available schedule` 또는 현재 시각부터 30일 이내의 `Schedule for later`로 변경 시점을 정합니다. 즉시 가능한 일정 변경은 추가 비용이 없지만, 나중 일정 예약은 추가 비용이 발생할 수 있으며 instance 크기에 따라 반영 시간이 달라집니다. 작업은 work request로 생성되고 instance는 `Updating`을 거쳐 완료되면 `Available`로 돌아옵니다.

### 제약 및 검증

변경 기능은 ECPU compute model의 모든 workload type에서 지원되며 Always Free, Autonomous AI Database for Developers, Oracle Database@Azure·Google Cloud 배포와 `Early` patch level database에는 제공되지 않습니다. Region 용량에 따라 현재 window 외에 선택 가능한 항목이 없을 수 있고, 예약 변경을 다시 미룰 때는 기존 계획보다 늦은 시각만 선택할 수 있습니다. 적용 후 Maintenance schedule 필드와 work request 성공 상태를 확인하고, `DB_NOTIFICATIONS`에서 `TYPE='MAINTENANCE'`인 예정 시각과 상태를 대조하며, maintenance 중 잠시 끊길 수 있는 기존 connection의 재연결 동작도 사전에 시험합니다.
