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
permalink: "release-notes-2026-dataplatform/oracle-dataplatform-release-notes-202608/"
categories:
  - release-notes-2026-oracle-dataplatform
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

### 업데이트 내용
Oracle Data Safe의 Security Assessment에 Patch Compliance 화면이 추가되어 Oracle Database fleet의 분기별 Release Update 적용 상태를 한곳에서 확인할 수 있습니다. 최신 RU 적용 여부뿐 아니라 패치가 필요한 대상, 버전 업그레이드가 필요한 대상, RU 정보를 확인할 수 없는 대상을 구분하고 open CVE, 뒤처진 RU 수, 마지막 평가 시각을 데이터베이스별로 보여 줍니다.

### 참고

- [Release Note: Oracle database Patch Compliance in Oracle Data Safe](https://docs.oracle.com/iaas/releasenotes/data-safe/patch-compliance.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: View Patch Compliance](https://docs.oracle.com/iaas/data-safe/doc/view-patch-compliance.html){:target="_blank" rel="noopener"}

## Configure HTTP Retry Behavior for DBMS_CLOUD.SEND_REQUEST
* **Services:** Autonomous Database Serverless
* **Release Date:** August 05, 2026

### 업데이트 내용
Autonomous AI Database의 `DBMS_CLOUD.SEND_REQUEST`에 요청별 HTTP 재시도 동작을 조정하는 선택적 `retry_params` JSON CLOB 매개변수가 추가되었습니다. 정기 job이나 batch workload가 일시적으로 사용할 수 없는 endpoint를 호출할 때 재시도 횟수와 총 대기 시간을 제한하고 exponential backoff를 적용할 수 있습니다.

### Retry policy 구성

`max_attempts`는 최초 요청 이후 재시도 횟수를 0~100 범위에서 지정하며 0이면 재시도를 끄고 기본값은 5입니다. `total_timeout`은 요청과 재시도 사이의 대기를 포함한 전체 retry loop를 1~600초로 제한하고, `backoff_base_wait`는 첫 재시도 전 대기를 0~10초로 지정하며 기본값은 0.5초입니다. `max_wait_between_attempts`는 exponential backoff의 회차별 최대 대기를 제한합니다.

`retry_params`는 `DBMS_CLOUD`가 retryable로 판단하는 throttling, 일부 server error, timeout과 network error 등에 적용됩니다.

### 참고

- [Release Note: Configure HTTP Retry Behavior for DBMS_CLOUD.SEND_REQUEST](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-configure-http.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: DBMS_CLOUD Subprograms and REST APIs](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-subprograms.html#GUID-B063870D-6C1F-4F33-B354-885B73C81D37){:target="_blank" rel="noopener"}

## Background Execution Of SQL Statements and Scripts
* **Services:** Database Tools
* **Release Date:** August 06, 2026

### 업데이트 내용
Database Tools의 SQL Worksheet에서 SQL statement와 script를 background job으로 실행할 수 있어 긴 작업이 활성 session과 독립적으로 계속 실행됩니다. 기본 **Run Statement**와 **Run Script**는 동기 실행이고, **Run in Background**와 **Run Script in Background**는 비동기 실행입니다.

### Object Storage 결과와 장기 작업 관리

Background execution 결과는 OCI Object Storage에 저장되며, output pane의 **Background Executions** 탭에서 실행을 모니터링하고 완료 후 결과를 검토할 수 있습니다.

### 참고

- [Release Note: Background Execution Of SQL Statements and Scripts](https://docs.oracle.com/iaas/releasenotes/database-tools/backgrnd-execution.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Executing Statements and Scripts in the Background](https://docs.oracle.com/iaas/database-tools/doc/running-statements-and-scripts-background.html){:target="_blank" rel="noopener"}

## Database Tools MCP Server Enhancements
* **Services:** Database Tools
* **Release Date:** August 06, 2026

### 업데이트 내용
Database Tools MCP server에서 현재 구성에 필요한 OCI IAM policy statement를 **View recommended policies**로 생성할 수 있고, 자연어 요청을 검증된 SQL statement로 변환하는 Generative AI SQL Assistant toolset을 사용할 수 있습니다.

### Toolset·권한 구성

권장 policy는 MCP server와 Database Tools connection의 runtime identity가 Authenticated Principal인지 Resource Principal인지, database 인증이 token인지 password인지, scope가 resource인지 compartment인지에 따라 달라집니다. SQL Assistant를 사용하는 주체에는 `generative-ai-nl2sql` 사용 권한이 추가로 필요하며, tool access는 Identity Domains의 `MCP_User` 또는 `MCP_Administrator` application role로 제어합니다.

### 새 도구 사용 전 확인

Token 인증의 on-behalf-of 연결에 필요한 `database-tools-db-connect-obo` 권한은 현재 특정 database나 compartment로 제한할 수 없어 tenancy 수준에서 부여됩니다. MCP server와 connection의 runtime identity가 모두 Authenticated Principal이면 asynchronous request가 지원되지 않습니다.

> **MCP (Model Context Protocol):** AI 애플리케이션이 외부 도구·데이터 소스와 문맥을 교환하기 위한 공개 프로토콜입니다. [MCP 소개](https://modelcontextprotocol.io/introduction){:target="_blank" rel="noopener"}

### 참고

- [Release Note: Database Tools MCP Server Enhancements](https://docs.oracle.com/iaas/releasenotes/database-tools/gen-ai.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Database Tools MCP Servers](https://docs.oracle.com/iaas/database-tools/doc/policies-mcp-server.html){:target="_blank" rel="noopener"}
- [Oracle Documentation: Database Tools MCP Toolsets](https://docs.oracle.com/iaas/database-tools/doc/database-tools-mcp-toolsets.html){:target="_blank" rel="noopener"}

## Time Travel for Apache Iceberg Tables
* **Services:** Autonomous Database Serverless
* **Release Date:** August 11, 2026

### 업데이트 내용
Autonomous AI Database에서 Apache Iceberg external table을 `AS OF TIMESTAMP`로 조회해 지정 시점의 snapshot을 읽을 수 있습니다. Databricks, AWS Glue, OCI Object Storage의 Hadoop Catalog를 통해 접근하는 Iceberg 데이터에 대해 과거 분석, 감사, 장애 조사와 동일 시점 기준의 반복 보고서를 만들 수 있습니다.

### Snapshot 기준 조회

Catalog-managed external table은 catalog가 현재 metadata와 snapshot을 해석하므로 필요한 catalog credential, object store credential, outbound HTTPS ACL을 구성해야 합니다. 특정 업무 시각을 기준으로 현재 조회와 `AS OF TIMESTAMP` 결과를 비교하면 upstream 변경 전후의 데이터 차이를 database SQL에서 분석할 수 있습니다.

Iceberg time travel 지원 catalog는 Databricks, AWS Glue, OCI Object Storage의 Hadoop Catalog이며, partitioned Iceberg table과 merge-on-read delete file은 지원되지 않습니다. Fixed external table의 schema가 Iceberg metadata의 schema version과 달라지면 table을 다시 생성해야 하고, metadata 파일을 직접 지정한 external table은 새 snapshot을 자동으로 반영하지 않습니다.

> **Apache Iceberg:** 대규모 분석 테이블의 snapshot과 schema evolution을 지원하는 오픈소스 table format입니다. [Apache Iceberg](https://iceberg.apache.org/){:target="_blank" rel="noopener"}

### 참고

- [Release Note: Time Travel for Apache Iceberg Tables](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-time-travel.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Query Apache Iceberg Tables](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/query-external-data-apache-iceberg.html#GUID-C8ABBCC1-3742-441C-8712-4BDFBD49FB71){:target="_blank" rel="noopener"}

## Changes to DBMS_CLOUD.EXPORT_DATA Parquet Type Mappings
* **Services:** Autonomous Database Serverless
* **Release Date:** August 18, 2026

### 업데이트 내용
`DBMS_CLOUD.EXPORT_DATA`의 Parquet export 구현이 변경되어 reliability와 performance가 개선되고, 생성 파일의 Oracle-to-Parquet type mapping도 갱신되었습니다.

### 변경된 Type mapping

새 mapping에서 `DATE`와 `TIMESTAMP(3)`은 `TIMESTAMP_MILLIS`, `TIMESTAMP(6)`은 `TIMESTAMP_MICROS`, `TIMESTAMP(9)`은 `TIMESTAMP_NANOS`로 대응하며, `NUMBER(p)`는 precision에 따라 `DECIMAL/INT64` 또는 `DOUBLE` 계열로 달라질 수 있습니다. 변환에는 export session의 `NLS_DATE_FORMAT`, `NLS_TIMESTAMP_FORMAT`, `NLS_TIMESTAMP_TZ_FORMAT`, `NLS_NUMERIC_CHARACTERS` 값이 사용됩니다.

### 기존 export 호환성

NLS format의 두 자리 연도 `RR` mask는 Parquet export에서 지원되지 않으므로, 지원되는 NLS date/timestamp format으로 변경해야 합니다. `BFILE`, `BLOB`, `LONG`, `LONG RAW`, object type은 지원되지 않고, `DATE`는 Parquet export에서 시·분·초를 지원하지 않는 등 type별 제한이 있습니다.

### 참고

- [Release Note: Changes to DBMS_CLOUD.EXPORT_DATA Parquet Type Mappings](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-export-data-changes.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: DBMS_CLOUD Package Oracle Data Type to Parquet Mapping](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/data-type-mapping-oracle-parquet.html#GUID-AEFEC843-027D-44A0-A8FA-892C523CDA38){:target="_blank" rel="noopener"}
- [Oracle Documentation: Export Data as Parquet to Cloud Object Storage](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/export-data-parquet.html#GUID-7C1CADFE-3A39-416D-A0FF-96AC447489D0){:target="_blank" rel="noopener"}

## External File System Support for Workload Capture and Replay
* **Services:** Autonomous Database Serverless
* **Release Date:** August 18, 2026

### 업데이트 내용
Autonomous AI Database의 workload capture와 replay가 Oracle-managed Object Storage뿐 아니라 고객 관리 directory의 external file system에도 capture file, replay file과 report를 저장할 수 있습니다.

### Directory object 구성

`DBMS_CLOUD_ADMIN.START_WORKLOAD_CAPTURE`의 `params`에 `directory_name`을 지정하면 capture file이 해당 고객 관리 directory에 저장되고, `REPLAY_WORKLOAD`에도 같은 방식으로 directory를 지정해 파일을 읽을 수 있습니다. 실행 주체는 `ADMIN`이거나 `DBMS_CLOUD_ADMIN`에 대한 `EXECUTE` 권한이 있어야 하며, 상태와 이력은 `DBA_CAPTURE_REPLAY_STATUS`와 `DBA_CAPTURE_REPLAY_HISTORY`에서 확인합니다.

### Capture·Replay 경로 제약

Replay 대상은 source와 논리적으로 일관된 상태의 full clone 또는 refreshable clone이어야 하며, capture file에는 transaction detail, bind value와 SQL text가 포함될 수 있습니다. 동일한 capture name이 여러 개면 최신 capture가 사용됩니다.

### 참고

- [Release Note: External File System Support for Workload Capture and Replay](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-external-file-system.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Capture and Replay Between Autonomous AI Database Instances](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/capture-replay-workloads-standard.html#GUID-865F8C42-634D-41A0-BBE4-B8958AEADF82){:target="_blank" rel="noopener"}

## Service Logs for Database Tools MCP Servers
* **Services:** Database Tools
* **Release Date:** August 21, 2026

### 업데이트 내용
Database Tools MCP server 작업에 OCI Logging service log를 수집해 호출 활동을 조사하고 장애를 분석할 수 있습니다. `MCP Invocation Logs`는 기본적으로 비활성화되어 있으므로 필요한 MCP server에서 명시적으로 활성화해야 합니다.

### Service log 활성화와 호출 추적

MCP server의 **Monitoring** 탭에서 `MCP Invocation Logs`의 **Enable log**를 선택하고 기존 log group을 지정하거나 새 group을 생성합니다. 작업 완료 후 상태가 `Active`로 바뀌었는지 확인하고, log name의 **Explore log**에서 MCP client가 반환한 `opc-request-id`를 검색해 호출 기록이 수집되었는지 확인합니다.

### 로그 접근·보존 범위

> **편집자 권고:** Log group과 invocation log의 접근, 보존·삭제 및 조사 자료 공유 범위는 조직의 IAM·감사 정책에 따라 별도로 정하십시오.


### 참고

- [Release Note: Service Logs for Database Tools MCP Servers](https://docs.oracle.com/iaas/releasenotes/database-tools/logging.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Logging](https://docs.oracle.com/iaas/database-tools/doc/logging.html){:target="_blank" rel="noopener"}

## Maintenance Schedule Selection in OCI
* **Services:** Autonomous Database Serverless
* **Release Date:** August 25, 2026

### 업데이트 내용

기존 Autonomous AI Database의 **Maintenance** 영역에서 **Maintenance schedule** 옆 **Edit**을 선택하면, 해당 리전에서 현재 데이터베이스를 수용할 수 있는 window 목록을 확인할 수 있습니다. 각 항목은 요일, UTC 기준 2시간 구간, availability domain을 표시합니다. 리전에 현재 일정 외 선택지가 없을 수도 있습니다.

### 변경 시점과 제약

일정은 가장 이른 가용 시점 또는 다음 maintenance window에 적용하도록 선택할 수 있습니다. 이 기능은 모든 workload type의 ECPU Autonomous AI Database에 적용되며, Early patch level 데이터베이스에서는 사용할 수 없습니다. 선택한 window 또는 AD에 충분한 capacity가 없으면 변경 요청이 실패할 수 있으므로, 변경 직후 **Next maintenance**와 **Maintenance schedule** 값을 다시 확인합니다.

Autonomous Data Guard의 local standby가 있는 경우 새 일정으로 primary와 standby가 같은 AD가 될 상황에서는 standby가 다른 AD로 이동합니다. 장기 실행 작업이 있다면 maintenance Information event를 구독해 patch 시작 전 작업을 중지하고 종료 후 재개하는 절차를 운영 runbook에 반영합니다.

### 참고

- [Release Note: Maintenance Schedule Selection in OCI](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-maintenance-schedule.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Manage Patch Levels and Maintenance Window for an Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/maintenance-windows-patching.html#GUID-B2DF6516-601A-4350-93E7-8E5E778052D1){:target="_blank" rel="noopener"}

## Autonomous Container Database (ACD) cloning enhancements
* **Services:** Autonomous Database on Dedicated Exadata Infrastructure, Autonomous Database on Exadata Cloud@Customer
* **Release Date:** August 18, 2026

### 업데이트 내용
Dedicated Exadata Infrastructure와 Exadata Cloud@Customer에서 Autonomous Container Database(ACD)의 full clone과 partial clone을 사용할 수 있습니다. full clone은 source container와 포함된 Autonomous AI Database의 metadata·data를 복제하고, partial clone은 선택한 Autonomous AI Database만 복제합니다.

### 적용 전 확인

원격 backup에서 clone할 때는 partial clone을 사용할 수 없으며, ACD는 clone 중 `PROVISIONING` 상태가 됩니다. 동시에 하나의 clone만 실행할 수 있으므로, 대규모 복제는 AVMC 가용 리소스와 운영 창을 함께 검토한 뒤 실행합니다. clone 후에는 대상 ACD와 포함 database의 상태·연결 정보·애플리케이션 접근을 검증합니다.

### 참고

- [Release Note: Autonomous Container Database (ACD) cloning enhancements](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-acd-cloning-enh.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: About Cloning Autonomous Container Database on Dedicated Exadata Infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/dedicated/adbaa/about-cloning-autonomous-container-database-on-dedicated.html){:target="_blank" rel="noopener"}
- [Oracle Documentation: Clone an Autonomous Container Database {](https://docs.oracle.com/en/cloud/paas/autonomous-database/dedicated/adbaa/clone-an-autonomous-container-database.html){:target="_blank" rel="noopener"}

## View total backup storage for an Autonomous Container Database (ACD)
* **Services:** Autonomous Database on Dedicated Exadata Infrastructure, Autonomous Database on Exadata Cloud@Customer
* **Release Date:** August 11, 2026

### 업데이트 내용
ACD Details 페이지에서 ACD 전체 backup storage 사용량을 확인할 수 있습니다. Exadata 기반 Autonomous 환경의 backup 용량을 컨테이너 단위로 파악해 보존 정책과 용량 계획을 검토하는 데 활용할 수 있습니다.

### 운영 시 확인

표시된 사용량을 장기 backup과 예정된 clone 작업의 용량 요구사항과 함께 확인합니다. 이 기능은 별도 설정이 아니라 가시성 개선이므로, 사용량 증가가 확인되면 backup 보존 요건과 스토리지 비용을 함께 검토합니다.

### 참고

- [Release Note: View total backup storage for an Autonomous Container Database (ACD)](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-view-backup-storage.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: View Details of an Autonomous Container Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/dedicated/adbaa/view-details-of-an-autonomous-container-database.html){:target="_blank" rel="noopener"}

## Use a Cross-Tenancy OCI Vault and Master Encryption Key for an Autonomous Container Database (ACD)
* **Services:** Autonomous Database on Dedicated Exadata Infrastructure
* **Release Date:** August 04, 2026

### 업데이트 내용
Oracle Public Cloud에서 **새 ACD를 프로비저닝할 때** 다른 tenancy OCI Vault의 customer-managed master encryption key를 사용할 수 있습니다. 기존 ACD에는 이 구성을 적용할 수 없습니다.

### 권한과 Data Guard 조건

이 구성의 ACD에 Autonomous Data Guard standby를 추가할 때 primary와 standby 모두 같은 Vault와 key에 접근할 수 있어야 합니다. standby가 다른 region에 있으면 해당 region에서 Vault 접근에 필요한 dynamic group과 cross-tenancy IAM policy를 먼저 구성하고, 양쪽 tenancy의 key 접근 범위를 검증합니다.

### 참고

- [Release Note: Use a Cross-Tenancy OCI Vault and Master Encryption Key for an Autonomous Container Database (ACD)](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-crosstenancy-ocivault.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Master Encryption Keys in Autonomous AI Database on Dedicated Exadata Infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/dedicated/adbaa/master-encryption-keys-in-autonomous-ai-database-on.html#GUID-2A922508-9B7B-4972-968A-A82D92C249BB){:target="_blank" rel="noopener"}
