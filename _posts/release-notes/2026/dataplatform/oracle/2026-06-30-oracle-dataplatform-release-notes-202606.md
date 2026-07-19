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

## New Database Management Report Type in News Reports
* **Services:** Database Management, Ops Insights
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/operations-insights/database-management-report-type-opsi.htm](https://docs.oracle.com/iaas/releasenotes/operations-insights/database-management-report-type-opsi.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Ops Insights News Reports에 Database Management report type이 추가되었습니다. database fleet health summary report를 만들어 open alarms, high CPU databases, unreachable databases, open HA alarms 같은 항목을 daily 또는 weekly insight로 받을 수 있습니다.

활용 시나리오는 운영자가 여러 database fleet 상태를 정기 리포트로 받아 장애 징후를 조기에 확인하는 것입니다. 설정 후에는 report schedule, 수신 대상, fleet scope, alarm 기준이 운영 조직의 점검 주기와 맞는지 확인해야 합니다.

## Cross-region Support in SQL Insights - Fleet Analysis
* **Services:** Ops Insights
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/operations-insights/cross-region-support-sql-insights.htm](https://docs.oracle.com/iaas/releasenotes/operations-insights/cross-region-support-sql-insights.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

SQL Insights - Fleet Analysis dashboard에서 multiple regions 데이터를 한 번에 조회할 수 있게 되었습니다. Region filter를 사용해 Ops Insights-enabled database를 cross-region fleet view로 분석할 수 있습니다.

멀티 리전 운영 환경에서는 region별 SQL 성능 문제를 별도로 확인하던 과정을 줄일 수 있습니다. 검증 시에는 각 region의 Ops Insights enablement, 데이터 수집 지연, dashboard filter가 의도한 fleet 범위를 포함하는지 확인하는 것이 좋습니다.

## Use Deep Data Security in Autonomous AI Database
* **Services:** Autonomous Database Serverless
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-deep-data-security.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-deep-data-security.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Use Oracle Deep Data Security in Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/deep-data-security.html#GUID-DD655C38-594E-4EBC-ADD2-535F4510FCB6){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 Oracle Deep Data Security를 사용할 수 있게 되었습니다. 이 기능은 인증된 end-user identity를 기준으로 database 내부에서 row-level과 column-level access control을 enforcement하는 fine-grained authorization 방식입니다.

운영 영향은 애플리케이션, 분석 도구, AI-powered workload 전반에서 같은 데이터 접근 정책을 일관되게 적용할 수 있다는 점입니다. 민감 데이터가 포함된 테이블을 여러 애플리케이션과 AI 기능이 함께 사용하는 경우, 애플리케이션별 별도 필터링보다 database 중심 정책으로 통제하는 시나리오에 적합합니다.

적용 전에는 end-user identity 전달 방식, 정책 대상 테이블/컬럼, 기존 애플리케이션 권한 모델과의 충돌 여부를 검토해야 합니다. 검증은 사용자별 row/column 접근 결과가 정책대로 달라지는지, 분석/AI workload에서도 같은 제어가 적용되는지 확인하는 방식이 좋습니다.

## Iceberg REST Catalog Integration with DBMS_DCAT
* **Services:** Autonomous Database Serverless
* **Release Date:** June 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-iceberg-rest-catalog.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-iceberg-rest-catalog.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 DBMS_DCAT PL/SQL 26ai package가 Iceberg REST-compatible catalog와 연동할 수 있게 되었습니다. 예시는 Databricks Unity Catalog와 Polaris 같은 외부 catalog이며, Oracle Autonomous AI Database에서 외부 Iceberg catalog 기반 table을 connect, synchronize, query할 수 있습니다.

활용 시나리오는 lakehouse catalog에 있는 데이터를 Autonomous AI Database SQL 분석과 연결하는 것입니다. 데이터 복사 없이 catalog metadata를 기준으로 외부 table을 다룰 수 있어, 데이터 플랫폼과 Oracle Database 분석 환경을 함께 운영하는 고객에게 유용합니다.

적용 시에는 catalog endpoint, 인증 정보, network path, DBMS_DCAT package 권한을 확인해야 합니다. 검증은 catalog 동기화, table metadata 조회, sample query 실행, 권한 오류 여부를 순서대로 확인하는 방식이 적절합니다.

## Lake Cache for Mounted Catalog Tables
* **Services:** Autonomous Database Serverless
* **Release Date:** June 17, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-lake-cache-mounted-catalogs.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-lake-cache-mounted-catalogs.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 Lake Cache가 mounted catalog table을 지원합니다. Catalog SQL syntax로 접근하는 `schema.table@catalog_name` 형태의 table을 `DBMS_EXT_TABLE_CACHE.CREATE_CACHE`에 전달해 cache를 만들 수 있습니다.

이 기능은 mounted catalog 데이터를 반복 조회할 때 local read를 빠르게 하고, cross-cloud 또는 cross-region 데이터 접근 비용을 줄이는 데 도움이 됩니다. 애플리케이션 SQL을 크게 바꾸지 않고 catalog-qualified reference를 캐시 대상으로 지정할 수 있다는 점이 운영상 장점입니다.

적용 전에는 반복 조회 빈도, 원본 catalog 데이터 갱신 주기, cache refresh 전략을 함께 검토해야 합니다. 검증은 cache 생성 전후 query latency, 데이터 최신성, cache 대상 table의 권한을 확인하는 방식이 좋습니다.

## Oracle Data Safe Promotion for On-Premises Databases, Databases on Compute, and Amazon RDS for Oracle
* **Services:** Data Safe
* **Release Date:** June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/data-safe/onprem-promotion.htm](https://docs.oracle.com/iaas/releasenotes/data-safe/onprem-promotion.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Safe가 on-premises Oracle Database, Compute instance의 Oracle Database, Amazon RDS for Oracle database에 대해 2026년 6월 12일부터 2027년 2월 28일까지 service charge waiver 프로모션을 제공합니다. 대상 기능에는 Security Assessment, User Assessment, Sensitive Data Discovery, Data Masking, Activity Auditing, Alerts and Reporting, SQL Firewall이 포함됩니다.

활용 시나리오는 OCI 외부 Oracle Database까지 Data Safe 기반 보안 점검과 감사 체계를 확장하는 것입니다. 단, audit record collection이 free usage limit을 초과하면 관련 비용이 계속 발생할 수 있으므로 pricing documentation과 사용량 제한을 반드시 확인해야 합니다.

적용 전에는 대상 database 연결 방식, audit collection volume, 보안 평가 주기, masking 대상 데이터를 정리하는 것이 좋습니다.

## Autonomous AI Database Serverless on Oracle AI Database@AWS
* **Services:** Autonomous Database Serverless
* **Release Date:** June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-adbs-on-aws.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-adbs-on-aws.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Autonomous AI Database Serverless in Multicloud Environments](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/autonomous-ai-database-serverless-multicloud.html#GUID-AC0F69C8-A027-42F1-BE7C-980D8F7B5729){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database Serverless를 Oracle AI Database@AWS에서 사용할 수 있게 되었습니다. 선택된 AWS Region에 Autonomous AI Lakehouse, Transaction Processing, JSON Database, APEX Application Development workload를 배포하면서 OCI 기반 관리와 운영 모델을 유지할 수 있습니다.

공식 릴리스 노트는 Amazon S3, AWS KMS, Amazon CloudWatch, Amazon EventBridge, Amazon Zero-ETL 같은 AWS 서비스와의 integration을 언급합니다. AWS에 애플리케이션과 데이터 파이프라인이 있는 고객은 database workload를 AWS 가까이에 두면서 Oracle Autonomous AI Database 기능을 활용하는 multicloud 시나리오를 검토할 수 있습니다.

설계 시에는 region availability, AWS/OCI identity와 network 연결, KMS/key 관리, monitoring/event integration, 데이터 이동 비용을 함께 판단해야 합니다. 검증은 AWS 측 애플리케이션 latency, OCI 관리 작업, backup/monitoring/event 연동이 기대대로 동작하는지 확인하는 방식이 좋습니다.

## Veridata now available in OCI GoldenGate
* **Services:** GoldenGate
* **Release Date:** June 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/goldengate/veridata-dr-pipelines.htm](https://docs.oracle.com/iaas/releasenotes/goldengate/veridata-dr-pipelines.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Learn more about what's new in this release](https://docs.oracle.com/en/cloud/paas/goldengate-service/ocigg/whats-new-in-oracle-cloud-infrastructure-goldengate.html){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI GoldenGate에서 Veridata가 제공되어 데이터 검증 기능을 사용할 수 있게 되었습니다. 이 릴리스에는 Veridata 외에도 remote peer에 대한 DR precheck operation, ZeroETL pipeline의 Object Storage Initial Load 지원이 포함됩니다.

활용 시나리오는 GoldenGate replication 또는 migration 후 source/target 데이터 일치성을 검증하는 것입니다. DR pipeline을 운영하는 경우 precheck로 원격 peer 준비 상태를 확인하고, Object Storage Initial Load를 통해 초기 적재 경로를 더 유연하게 구성할 수 있습니다.

검증 시에는 대상 deployment의 GoldenGate 버전, Veridata 연결 대상, 비교 범위, DR precheck 결과, Initial Load 후 row count/checksum 결과를 함께 확인하는 것이 좋습니다.
