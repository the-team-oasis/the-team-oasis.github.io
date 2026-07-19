---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "6월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2026년 6월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
 - release-notes-2026-dataplatform

tags:
 - oci-release-notes-2026
 - Jun-2026
 - DATAPLATFORM, DATABASE, ORACLE

#
# Styling
#
header: no
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
* TOC
{:toc}
</div>

## New Database Management Report Type in News Reports
* **Services:** Database Management, Ops Insights
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/operations-insights/database-management-report-type-opsi.htm](https://docs.oracle.com/iaas/releasenotes/operations-insights/database-management-report-type-opsi.htm){:target="_blank" rel="noopener"}
* **Documentation:** [News Reports](https://docs.oracle.com/iaas/operations-insights/doc/news-reports.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Ops Insights News Reports에 Database Management report type이 추가되었습니다. database fleet health summary report를 만들어 open alarms, high CPU databases, unreachable databases, open HA alarms 같은 항목을 daily 또는 weekly insight로 받을 수 있습니다.

활용 시나리오는 운영자가 여러 database fleet 상태를 정기 리포트로 받아 장애 징후를 조기에 확인하는 것입니다. 설정 후에는 report schedule, 수신 대상, fleet scope, alarm 기준이 운영 조직의 점검 주기와 맞는지 확인해야 합니다.

### 주요 변경 포인트

* 데이터베이스 운영, 분석, 보안, multicloud 또는 replication 시나리오에서 활용할 수 있는 기능이 보완되었습니다.
* 설정 위치, 권한, 지원 대상, region 또는 서비스 조합을 확인한 뒤 적용하는 것이 중요합니다.
* 운영자는 단순 기능 사용 여부뿐 아니라 기존 모니터링, 감사, 성능 기준에 어떤 변화가 생기는지 함께 봐야 합니다.

### 적용 및 검증 포인트

적용 전에는 대상 database 또는 service instance가 지원 조건을 만족하는지 확인해야 합니다. 적용 후에는 연결, 권한, 성능, 감사 로그, 보고서 또는 replication 상태를 실제 workload 기준으로 검증하는 것이 좋습니다.

### 사전 조건

News Reports는 Capacity Planning, Database Management, SQL Insights report를 email로 보내는 기능입니다. Database Management report type을 사용하려면 database가 Database Management와 Ops Insights 양쪽 모두에 enable되어 있어야 합니다.

필요한 policy에는 ONS topic inspect, Operations Insights service의 ONS topic 사용, `opsinewsreport` principal의 alarm/metric/database management resource read 권한이 포함됩니다. 보고서를 만들 때는 Ops Insights Administration의 News reports에서 report type을 선택하고, Database Management의 경우 DB fleet health summary를 선택해 health alert 중심 보고서를 받을 수 있습니다.

## Cross-region Support in SQL Insights - Fleet Analysis
* **Services:** Ops Insights
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/operations-insights/cross-region-support-sql-insights.htm](https://docs.oracle.com/iaas/releasenotes/operations-insights/cross-region-support-sql-insights.htm){:target="_blank" rel="noopener"}
* **Documentation:** [View SQL Insights](https://docs.oracle.com/iaas/operations-insights/doc/sql-insights-dashboards.html){:target="_blank" rel="noopener"}

### 업데이트 내용

SQL Insights - Fleet Analysis dashboard에서 multiple regions 데이터를 한 번에 조회할 수 있게 되었습니다. Region filter를 사용해 Ops Insights-enabled database를 cross-region fleet view로 분석할 수 있습니다.

멀티 리전 운영 환경에서는 region별 SQL 성능 문제를 별도로 확인하던 과정을 줄일 수 있습니다. 검증 시에는 각 region의 Ops Insights enablement, 데이터 수집 지연, dashboard filter가 의도한 fleet 범위를 포함하는지 확인하는 것이 좋습니다.

### 주요 변경 포인트

* 데이터베이스 운영, 분석, 보안, multicloud 또는 replication 시나리오에서 활용할 수 있는 기능이 보완되었습니다.
* 설정 위치, 권한, 지원 대상, region 또는 서비스 조합을 확인한 뒤 적용하는 것이 중요합니다.
* 운영자는 단순 기능 사용 여부뿐 아니라 기존 모니터링, 감사, 성능 기준에 어떤 변화가 생기는지 함께 봐야 합니다.

### 적용 및 검증 포인트

적용 전에는 대상 database 또는 service instance가 지원 조건을 만족하는지 확인해야 합니다. 적용 후에는 연결, 권한, 성능, 감사 로그, 보고서 또는 replication 상태를 실제 workload 기준으로 검증하는 것이 좋습니다.

### 활용 방법

SQL Insights Fleet Analysis dashboard는 Ops Insights-enabled database fleet을 상위 수준에서 분석하는 화면입니다. Region filter에서 하나 이상의 region을 선택하면 여러 region의 SQL Insights data를 하나의 fleet view로 집계해 볼 수 있습니다.

여러 region을 선택하면 Top databases table의 Region column으로 각 database 위치를 확인할 수 있습니다. 운영에서는 current console region만 보는 기본 동작과 cross-region filter 적용 결과를 비교해, 누락된 region이나 Ops Insights 미활성 database가 없는지 확인하는 것이 좋습니다.

## Use Deep Data Security in Autonomous AI Database
* **Services:** Autonomous Database Serverless
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-deep-data-security.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-deep-data-security.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Use Oracle Deep Data Security in Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/deep-data-security.html#GUID-DD655C38-594E-4EBC-ADD2-535F4510FCB6){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 Oracle Deep Data Security를 사용할 수 있게 되었습니다. 이 기능은 인증된 end-user identity를 기준으로 database 내부에서 row-level과 column-level access control을 enforcement하는 fine-grained authorization 방식입니다.

운영 영향은 애플리케이션, 분석 도구, AI-powered workload 전반에서 같은 데이터 접근 정책을 일관되게 적용할 수 있다는 점입니다. 민감 데이터가 포함된 테이블을 여러 애플리케이션과 AI 기능이 함께 사용하는 경우, 애플리케이션별 별도 필터링보다 database 중심 정책으로 통제하는 시나리오에 적합합니다.

### 주요 변경 포인트

* 데이터베이스 운영, 분석, 보안, multicloud 또는 replication 시나리오에서 활용할 수 있는 기능이 보완되었습니다.
* 설정 위치, 권한, 지원 대상, region 또는 서비스 조합을 확인한 뒤 적용하는 것이 중요합니다.
* 운영자는 단순 기능 사용 여부뿐 아니라 기존 모니터링, 감사, 성능 기준에 어떤 변화가 생기는지 함께 봐야 합니다.

### 적용 및 검증 포인트

적용 전에는 대상 database 또는 service instance가 지원 조건을 만족하는지 확인해야 합니다. 적용 후에는 연결, 권한, 성능, 감사 로그, 보고서 또는 replication 상태를 실제 workload 기준으로 검증하는 것이 좋습니다.

### 제약 및 적용 방식

Oracle Deep Data Security는 Oracle AI Database 26ai에서만 지원됩니다. 인증된 end-user identity를 기준으로 row-level 및 column-level authorization을 database 내부에서 enforcement합니다.

특히 AI assistant, copilot, agentic AI application이 동적으로 SQL을 생성하는 환경에서는 애플리케이션 계층의 필터링만으로 일관된 권한 통제를 유지하기 어렵습니다. Deep Data Security는 application, reporting tool, REST API, SQL client, AI agent 등 접근 경로가 달라도 같은 database policy를 적용한다는 점이 핵심입니다.

## Iceberg REST Catalog Integration with DBMS_DCAT
* **Services:** Autonomous Database Serverless
* **Release Date:** June 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-iceberg-rest-catalog.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-iceberg-rest-catalog.htm){:target="_blank" rel="noopener"}
* **Documentation:** [DBMS_DCAT Package](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/autonomous-dbms-dcat.html#GUID-4D927F21-E856-437B-B42F-727A2C02BE8D){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 DBMS_DCAT PL/SQL 26ai package가 Iceberg REST-compatible catalog와 연동할 수 있게 되었습니다. 예시는 Databricks Unity Catalog와 Polaris 같은 외부 catalog이며, Oracle Autonomous AI Database에서 외부 Iceberg catalog 기반 table을 connect, synchronize, query할 수 있습니다.

활용 시나리오는 lakehouse catalog에 있는 데이터를 Autonomous AI Database SQL 분석과 연결하는 것입니다. 데이터 복사 없이 catalog metadata를 기준으로 외부 table을 다룰 수 있어, 데이터 플랫폼과 Oracle Database 분석 환경을 함께 운영하는 고객에게 유용합니다.

### 주요 변경 포인트

* 데이터베이스 운영, 분석, 보안, multicloud 또는 replication 시나리오에서 활용할 수 있는 기능이 보완되었습니다.
* 설정 위치, 권한, 지원 대상, region 또는 서비스 조합을 확인한 뒤 적용하는 것이 중요합니다.
* 운영자는 단순 기능 사용 여부뿐 아니라 기존 모니터링, 감사, 성능 기준에 어떤 변화가 생기는지 함께 봐야 합니다.

### 적용 및 검증 포인트

적용 전에는 대상 database 또는 service instance가 지원 조건을 만족하는지 확인해야 합니다. 적용 후에는 연결, 권한, 성능, 감사 로그, 보고서 또는 replication 상태를 실제 workload 기준으로 검증하는 것이 좋습니다.

### 권한 및 동작 방식

DBMS_DCAT는 OCI Data Catalog의 metadata를 Autonomous AI Database와 동기화해 protected schema와 external table을 만드는 package입니다. 이 package를 사용하려면 `dcat_sync` role이 필요하며, 동기화된 schema는 no authentication user로 생성되고 local user가 직접 변경할 수 없도록 protected clause로 만들어집니다.

동기화 후 기본적으로 synced external table에 접근할 수 있는 사용자는 `dcat_admin`과 `ADMIN`입니다. 실제 분석 사용자는 `dcat_admin` 또는 `ADMIN`이 READ privilege를 명시적으로 부여해야 하므로, catalog 연결 자체뿐 아니라 권한 부여와 SQL 조회 테스트까지 검증해야 합니다.

## Lake Cache for Mounted Catalog Tables
* **Services:** Autonomous Database Serverless
* **Release Date:** June 17, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-lake-cache-mounted-catalogs.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-lake-cache-mounted-catalogs.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Cache Mounted Catalog Tables with Lake Cache](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/improve-application-performance-with-lake-cache.html#GUID-FB78CC23-84DA-4397-9A19-ED5B8D8399FF){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 Lake Cache가 mounted catalog table을 지원합니다. Catalog SQL syntax로 접근하는 `schema.table@catalog_name` 형태의 table을 `DBMS_EXT_TABLE_CACHE.CREATE_CACHE`에 전달해 cache를 만들 수 있습니다.

이 기능은 mounted catalog 데이터를 반복 조회할 때 local read를 빠르게 하고, cross-cloud 또는 cross-region 데이터 접근 비용을 줄이는 데 도움이 됩니다. 애플리케이션 SQL을 크게 바꾸지 않고 catalog-qualified reference를 캐시 대상으로 지정할 수 있다는 점이 운영상 장점입니다.

### 주요 변경 포인트

* 데이터베이스 운영, 분석, 보안, multicloud 또는 replication 시나리오에서 활용할 수 있는 기능이 보완되었습니다.
* 설정 위치, 권한, 지원 대상, region 또는 서비스 조합을 확인한 뒤 적용하는 것이 중요합니다.
* 운영자는 단순 기능 사용 여부뿐 아니라 기존 모니터링, 감사, 성능 기준에 어떤 변화가 생기는지 함께 봐야 합니다.

### 적용 및 검증 포인트

적용 전에는 대상 database 또는 service instance가 지원 조건을 만족하는지 확인해야 합니다. 적용 후에는 연결, 권한, 성능, 감사 로그, 보고서 또는 replication 상태를 실제 workload 기준으로 검증하는 것이 좋습니다.

### 적용 방식

Lake Cache는 Oracle AI Database 26ai에서만 지원되며, external table 또는 mounted catalog table의 자주 접근하는 데이터를 Autonomous AI Database 내부에 cache하는 기능입니다. Mounted catalog table은 `[schema].object@catalog_name` 또는 default schema가 설정된 경우 `object@catalog_name` 형태로 query할 수 있습니다.

Lake Cache는 애플리케이션 SQL을 바꾸지 않고도 cache된 데이터를 사용하도록 투명하게 동작합니다. Cache 생성/refresh 시 resource group을 지정해 caching operation에 사용할 자원을 제어할 수 있고, 전체 table이 아니라 일부 column만 cache하는 선택도 가능합니다.

## Oracle Data Safe Promotion for On-Premises Databases, Databases on Compute, and Amazon RDS for Oracle
* **Services:** Data Safe
* **Release Date:** June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/data-safe/onprem-promotion.htm](https://docs.oracle.com/iaas/releasenotes/data-safe/onprem-promotion.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Data Safe Target Database Registration](https://docs.oracle.com/en/cloud/paas/data-safe/udscs/register-target-databases.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Safe가 on-premises Oracle Database, Compute instance의 Oracle Database, Amazon RDS for Oracle database에 대해 2026년 6월 12일부터 2027년 2월 28일까지 service charge waiver 프로모션을 제공합니다. 대상 기능에는 Security Assessment, User Assessment, Sensitive Data Discovery, Data Masking, Activity Auditing, Alerts and Reporting, SQL Firewall이 포함됩니다.

활용 시나리오는 OCI 외부 Oracle Database까지 Data Safe 기반 보안 점검과 감사 체계를 확장하는 것입니다. 단, audit record collection이 free usage limit을 초과하면 관련 비용이 계속 발생할 수 있으므로 pricing documentation과 사용량 제한을 반드시 확인해야 합니다.

### 주요 변경 포인트

* 데이터베이스 운영, 분석, 보안, multicloud 또는 replication 시나리오에서 활용할 수 있는 기능이 보완되었습니다.
* 설정 위치, 권한, 지원 대상, region 또는 서비스 조합을 확인한 뒤 적용하는 것이 중요합니다.
* 운영자는 단순 기능 사용 여부뿐 아니라 기존 모니터링, 감사, 성능 기준에 어떤 변화가 생기는지 함께 봐야 합니다.

### 적용 및 검증 포인트

적용 전에는 대상 database 또는 service instance가 지원 조건을 만족하는지 확인해야 합니다. 적용 후에는 연결, 권한, 성능, 감사 로그, 보고서 또는 replication 상태를 실제 workload 기준으로 검증하는 것이 좋습니다.

## Autonomous AI Database Serverless on Oracle AI Database@AWS
* **Services:** Autonomous Database Serverless
* **Release Date:** June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-adbs-on-aws.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-adbs-on-aws.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Autonomous AI Database Serverless in Multicloud Environments](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/autonomous-ai-database-serverless-multicloud.html#GUID-AC0F69C8-A027-42F1-BE7C-980D8F7B5729){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database Serverless를 Oracle AI Database@AWS에서 사용할 수 있게 되었습니다. 선택된 AWS Region에 Autonomous AI Lakehouse, Transaction Processing, JSON Database, APEX Application Development workload를 배포하면서 OCI 기반 관리와 운영 모델을 유지할 수 있습니다.

공식 릴리스 노트는 Amazon S3, AWS KMS, Amazon CloudWatch, Amazon EventBridge, Amazon Zero-ETL 같은 AWS 서비스와의 integration을 언급합니다. AWS에 애플리케이션과 데이터 파이프라인이 있는 고객은 database workload를 AWS 가까이에 두면서 Oracle Autonomous AI Database 기능을 활용하는 multicloud 시나리오를 검토할 수 있습니다.

### 주요 변경 포인트

* 데이터베이스 운영, 분석, 보안, multicloud 또는 replication 시나리오에서 활용할 수 있는 기능이 보완되었습니다.
* 설정 위치, 권한, 지원 대상, region 또는 서비스 조합을 확인한 뒤 적용하는 것이 중요합니다.
* 운영자는 단순 기능 사용 여부뿐 아니라 기존 모니터링, 감사, 성능 기준에 어떤 변화가 생기는지 함께 봐야 합니다.

### 적용 및 검증 포인트

적용 전에는 대상 database 또는 service instance가 지원 조건을 만족하는지 확인해야 합니다. 적용 후에는 연결, 권한, 성능, 감사 로그, 보고서 또는 replication 상태를 실제 workload 기준으로 검증하는 것이 좋습니다.

## Veridata now available in OCI GoldenGate
* **Services:** GoldenGate
* **Release Date:** June 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/goldengate/veridata-dr-pipelines.htm](https://docs.oracle.com/iaas/releasenotes/goldengate/veridata-dr-pipelines.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Learn more about what's new in this release](https://docs.oracle.com/en/cloud/paas/goldengate-service/ocigg/whats-new-in-oracle-cloud-infrastructure-goldengate.html){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI GoldenGate에서 Veridata가 제공되어 데이터 검증 기능을 사용할 수 있게 되었습니다. 이 릴리스에는 Veridata 외에도 remote peer에 대한 DR precheck operation, ZeroETL pipeline의 Object Storage Initial Load 지원이 포함됩니다.

활용 시나리오는 GoldenGate replication 또는 migration 후 source/target 데이터 일치성을 검증하는 것입니다. DR pipeline을 운영하는 경우 precheck로 원격 peer 준비 상태를 확인하고, Object Storage Initial Load를 통해 초기 적재 경로를 더 유연하게 구성할 수 있습니다.

### 주요 변경 포인트

* 데이터베이스 운영, 분석, 보안, multicloud 또는 replication 시나리오에서 활용할 수 있는 기능이 보완되었습니다.
* 설정 위치, 권한, 지원 대상, region 또는 서비스 조합을 확인한 뒤 적용하는 것이 중요합니다.
* 운영자는 단순 기능 사용 여부뿐 아니라 기존 모니터링, 감사, 성능 기준에 어떤 변화가 생기는지 함께 봐야 합니다.

### 적용 및 검증 포인트

적용 전에는 대상 database 또는 service instance가 지원 조건을 만족하는지 확인해야 합니다. 적용 후에는 연결, 권한, 성능, 감사 로그, 보고서 또는 replication 상태를 실제 workload 기준으로 검증하는 것이 좋습니다.
