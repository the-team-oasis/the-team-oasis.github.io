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
*  TOC
{:toc}
</div>

---

## New Database Management Report Type in News Reports

* **Services:** Database Management, Ops Insights
* **Release Date:** June 30, 2026
* **Release Note:** [New Database Management Report Type in News Reports](https://docs.oracle.com/iaas/releasenotes/operations-insights/database-management-report-type-opsi.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [News Reports](https://docs.oracle.com/iaas/operations-insights/doc/news-reports.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Ops Insights News Reports에 Database Management 보고서 유형이 추가되었습니다. Database Fleet Health Summary를 생성해 미해결 알람, CPU 사용률이 높은 데이터베이스, 연결할 수 없는 데이터베이스, 미해결 HA 알람을 일간 또는 주간 보고서로 받을 수 있습니다.

### 주요 기능

* 여러 데이터베이스의 상태와 주요 알람을 정기 보고서로 요약할 수 있습니다.
* 보고서 일정, 수신자, 대상 Fleet을 운영 조직의 점검 주기에 맞게 구성할 수 있습니다.
* 장애 징후와 고가용성 관련 알람을 이메일로 전달해 선제 대응에 활용할 수 있습니다.

### 적용 및 검증 포인트

보고서를 발송하기 전에 일정, 수신 대상, Fleet 범위, 알람 기준을 확인하는 것이 좋습니다. 시험 보고서를 통해 포함된 데이터베이스와 알람 정보가 Console의 상태와 일치하는지도 점검해야 합니다.

### 사전 조건

Database Management 보고서를 사용하려면 대상 데이터베이스가 Database Management와 Ops Insights에 모두 등록되어 있어야 합니다.

필요한 IAM Policy에는 ONS Topic 조회, Operations Insights 서비스의 ONS Topic 사용, `opsinewsreport` Principal의 Alarm, Metric, Database Management 리소스 읽기 권한이 포함됩니다. Ops Insights Administration의 News Reports에서 Database Management와 DB Fleet Health Summary를 선택해 보고서를 구성할 수 있습니다.

---

## Cross-region Support in SQL Insights - Fleet Analysis

* **Services:** Ops Insights
* **Release Date:** June 30, 2026
* **Release Note:** [Cross-region Support in SQL Insights - Fleet Analysis](https://docs.oracle.com/iaas/releasenotes/operations-insights/cross-region-support-sql-insights.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [View SQL Insights](https://docs.oracle.com/iaas/operations-insights/doc/sql-insights-dashboards.html){:target="_blank" rel="noopener"}

### 업데이트 내용

SQL Insights의 Fleet Analysis Dashboard에서 여러 리전의 데이터를 한 번에 조회할 수 있게 되었습니다. Region Filter를 사용해 Ops Insights가 활성화된 데이터베이스를 Cross-Region Fleet View로 분석할 수 있습니다.

### 주요 기능

* Region Filter에서 하나 이상의 리전을 선택할 수 있습니다.
* 여러 리전의 SQL Insights 데이터를 하나의 Fleet View에서 비교할 수 있습니다.
* Top Databases 테이블의 Region 컬럼에서 각 데이터베이스의 위치를 확인할 수 있습니다.

### 적용 및 검증 포인트

각 리전에서 대상 데이터베이스의 Ops Insights 활성화 여부와 데이터 수집 상태를 확인해야 합니다. 기본 리전 조회 결과와 Cross-Region Filter 결과를 비교하면 누락된 리전이나 데이터베이스를 찾는 데 도움이 됩니다.

### 활용 방법

멀티 리전 환경에서 리전별 SQL 성능 화면을 따로 확인하는 과정을 줄이고, 전체 Fleet의 부하와 병목 데이터베이스를 한 화면에서 비교할 수 있습니다. 리전별 데이터 수집 지연이 있을 수 있으므로 동일한 시간 범위를 기준으로 결과를 검토하는 것이 좋습니다.

---

## Use Deep Data Security in Autonomous AI Database

* **Services:** Autonomous Database Serverless
* **Release Date:** June 30, 2026
* **Release Note:** [Use Deep Data Security in Autonomous AI Database](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-deep-data-security.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Use Oracle Deep Data Security in Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/deep-data-security.html#GUID-DD655C38-594E-4EBC-ADD2-535F4510FCB6){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 Oracle Deep Data Security를 사용할 수 있게 되었습니다. 인증된 최종 사용자의 Identity를 기준으로 데이터베이스 내부에서 행과 컬럼 단위의 세분화된 접근 정책을 적용할 수 있습니다.

### 주요 기능

* 애플리케이션, Reporting Tool, REST API, SQL Client, AI Agent에 동일한 데이터 접근 정책을 적용할 수 있습니다.
* 애플리케이션 계층의 필터와 별개로 데이터베이스에서 권한을 강제합니다.
* AI가 동적으로 SQL을 생성하는 환경에서도 최종 사용자별 데이터 접근 범위를 유지할 수 있습니다.

### 적용 및 검증 포인트

대표 사용자와 역할별로 허용 및 거부 시나리오를 정의하고, 여러 접근 경로에서 동일한 정책 결과가 적용되는지 검증하는 것이 좋습니다. 기존 애플리케이션 권한과 데이터베이스 정책이 충돌하지 않는지도 함께 확인해야 합니다.

### 제약 및 적용 방식

Oracle Deep Data Security는 Oracle AI Database 26ai에서만 지원됩니다. 민감 데이터가 포함된 테이블을 여러 애플리케이션과 AI 기능이 함께 사용하는 경우, 데이터베이스 중심의 일관된 권한 통제에 활용할 수 있습니다.

---

## Iceberg REST Catalog Integration with DBMS_DCAT

* **Services:** Autonomous Database Serverless
* **Release Date:** June 23, 2026
* **Release Note:** [Iceberg REST Catalog Integration with DBMS_DCAT](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-iceberg-rest-catalog.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [DBMS_DCAT Package](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/autonomous-dbms-dcat.html#GUID-4D927F21-E856-437B-B42F-727A2C02BE8D){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 `DBMS_DCAT` PL/SQL 패키지가 Iceberg REST 호환 Catalog와 연동할 수 있게 되었습니다. Databricks Unity Catalog와 Polaris 같은 외부 Catalog를 연결하고, Catalog의 Iceberg 테이블을 동기화해 SQL로 조회할 수 있습니다.

### 주요 기능

* Iceberg REST 호환 Catalog의 Metadata를 Autonomous AI Database와 동기화할 수 있습니다.
* 동기화 과정에서 보호된 Schema와 External Table이 생성됩니다.
* 데이터 복사 없이 Lakehouse Catalog의 테이블을 Autonomous AI Database SQL 분석에 활용할 수 있습니다.

### 적용 및 검증 포인트

Catalog Endpoint와 Credential을 구성한 뒤 Schema 및 External Table이 정상적으로 동기화되는지 확인해야 합니다. Metadata 변경 후 재동기화와 실제 SQL 조회 결과도 함께 검증하는 것이 좋습니다.

### 권한 및 동작 방식

`DBMS_DCAT`를 사용하려면 `dcat_sync` Role이 필요합니다. 동기화된 Schema는 인증할 수 없는 사용자로 생성되며, 로컬 사용자가 직접 변경할 수 없도록 Protected Clause가 적용됩니다.

동기화된 External Table에는 기본적으로 `dcat_admin`과 `ADMIN`만 접근할 수 있습니다. 실제 분석 사용자에게는 `dcat_admin` 또는 `ADMIN`이 `READ` 권한을 명시적으로 부여해야 합니다.

---

## Lake Cache for Mounted Catalog Tables

* **Services:** Autonomous Database Serverless
* **Release Date:** June 17, 2026
* **Release Note:** [Lake Cache for Mounted Catalog Tables](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-lake-cache-mounted-catalogs.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Cache Mounted Catalog Tables with Lake Cache](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/improve-application-performance-with-lake-cache.html#GUID-FB78CC23-84DA-4397-9A19-ED5B8D8399FF){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 Lake Cache가 Mounted Catalog Table을 지원합니다. `schema.table@catalog_name` 형식의 테이블을 `DBMS_EXT_TABLE_CACHE.CREATE_CACHE`에 전달해 Cache를 만들 수 있습니다.

### 주요 기능

* Mounted Catalog Table의 자주 조회하는 데이터를 Autonomous AI Database 내부에 캐시합니다.
* 애플리케이션 SQL을 변경하지 않고 Cache 데이터를 투명하게 사용할 수 있습니다.
* Resource Group을 지정해 Cache 생성과 Refresh에 사용할 자원을 제어할 수 있습니다.
* 전체 테이블 또는 필요한 컬럼만 선택해 캐시할 수 있습니다.

### 적용 및 검증 포인트

Cache 생성 전후의 조회 시간과 원격 데이터 전송량을 비교하고, 원본 데이터 변경 후 Refresh 결과를 확인하는 것이 좋습니다. Resource Group 설정이 기존 워크로드의 자원 사용에 미치는 영향도 함께 점검해야 합니다.

### 적용 방식

Lake Cache는 Oracle AI Database 26ai에서만 지원합니다. Mounted Catalog Table은 `[schema].object@catalog_name` 형식으로 조회하며, 기본 Schema가 설정된 경우 `object@catalog_name` 형식도 사용할 수 있습니다. 반복적인 Cross-Cloud 또는 Cross-Region 조회의 응답 시간과 데이터 접근 비용을 줄이는 데 활용할 수 있습니다.

---

## Oracle Data Safe Promotion for On-Premises Databases, Databases on Compute, and Amazon RDS for Oracle

* **Services:** Data Safe
* **Release Date:** June 12, 2026
* **Release Note:** [Oracle Data Safe Promotion for On-Premises Databases, Databases on Compute, and Amazon RDS for Oracle](https://docs.oracle.com/iaas/releasenotes/data-safe/onprem-promotion.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Data Safe Target Database Registration](https://docs.oracle.com/en/cloud/paas/data-safe/udscs/register-target-databases.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Safe가 온프레미스 Oracle Database, Compute Instance의 Oracle Database, Amazon RDS for Oracle을 대상으로 2026년 6월 12일부터 2027년 2월 28일까지 서비스 요금 면제 프로모션을 제공합니다.

### 대상 기능

* Security Assessment 및 User Assessment
* Sensitive Data Discovery 및 Data Masking
* Activity Auditing, Alerts and Reporting
* SQL Firewall

### 적용 및 검증 포인트

대상 데이터베이스의 등록 방식과 프로모션 적용 조건을 확인한 뒤 Data Safe에 연결해야 합니다. Audit Record 수집량이 무료 사용 한도를 초과하면 관련 비용이 발생할 수 있으므로 Pricing 문서와 실제 사용량을 함께 점검하는 것이 좋습니다.

---

## Autonomous AI Database Serverless on Oracle AI Database@AWS

* **Services:** Autonomous Database Serverless
* **Release Date:** June 12, 2026
* **Release Note:** [Autonomous AI Database Serverless on Oracle AI Database@AWS](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-adbs-on-aws.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Autonomous AI Database Serverless in Multicloud Environments](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/autonomous-ai-database-serverless-multicloud.html#GUID-AC0F69C8-A027-42F1-BE7C-980D8F7B5729){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database Serverless를 Oracle AI Database@AWS에서 사용할 수 있게 되었습니다. 지원되는 AWS 리전에 Autonomous AI Lakehouse, Transaction Processing, JSON Database, APEX Application Development 워크로드를 배포하면서 OCI 기반 관리 모델을 유지할 수 있습니다.

### 주요 기능

* AWS 애플리케이션과 가까운 위치에 Autonomous AI Database 워크로드를 배포할 수 있습니다.
* Amazon S3, AWS KMS, Amazon CloudWatch, Amazon EventBridge와 연계할 수 있습니다.
* Amazon Zero-ETL을 포함한 AWS 데이터 파이프라인과의 통합 시나리오를 지원합니다.
* 데이터베이스 운영과 관리는 OCI 기반 모델을 사용합니다.

### 적용 및 검증 포인트

지원 AWS 리전과 워크로드 유형을 확인하고, AWS와 OCI 사이의 Identity, Network, Encryption Key 권한을 함께 설계해야 합니다. 애플리케이션 연결, AWS 서비스 연계, 모니터링 이벤트가 예상한 경로로 동작하는지 시험 환경에서 검증하는 것이 좋습니다.

---

## Veridata now available in OCI GoldenGate

* **Services:** GoldenGate
* **Release Date:** June 10, 2026
* **Release Note:** [Veridata now available in OCI GoldenGate](https://docs.oracle.com/iaas/releasenotes/goldengate/veridata-dr-pipelines.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [What's New in Oracle Cloud Infrastructure GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/ocigg/whats-new-in-oracle-cloud-infrastructure-goldengate.html){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI GoldenGate에서 Veridata를 사용해 데이터 검증을 수행할 수 있게 되었습니다. 이번 업데이트에는 원격 Peer에 대한 DR Precheck와 ZeroETL Pipeline의 Object Storage Initial Load 지원도 포함됩니다.

### 주요 기능

* GoldenGate 복제 또는 마이그레이션 후 소스와 타겟 데이터의 일치성을 검증할 수 있습니다.
* DR Precheck로 원격 Peer의 준비 상태를 전환 전에 확인할 수 있습니다.
* ZeroETL Pipeline의 초기 적재 소스로 Object Storage를 사용할 수 있습니다.

### 적용 및 검증 포인트

Veridata 검증 대상과 비교 기준을 정의하고, 불일치 결과가 운영 데이터와 일치하는지 확인해야 합니다. DR Pipeline은 원격 Peer에 대한 Precheck 결과를 검토한 뒤 전환 절차를 시험하고, Object Storage Initial Load는 권한과 초기 적재 이후의 증분 반영 상태를 함께 검증하는 것이 좋습니다.
