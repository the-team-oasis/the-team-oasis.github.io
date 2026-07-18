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

Ops Insights News Reports에 Database Management 리포트 유형이 추가되었습니다. 데이터베이스 플릿의 상태 요약을 리포트로 만들 수 있어 운영자가 여러 DB의 상태를 정기적으로 확인하기 쉬워졌습니다.

Database Management는 Oracle Database의 성능, 구성, 상태를 관리하는 서비스이고 Ops Insights는 리소스 사용과 성능 추세를 분석하는 서비스입니다. 두 서비스의 리포팅 연계는 운영 보고 자동화에 유용합니다.

## Cross-region Support in SQL Insights - Fleet Analysis
* **Services:** Ops Insights
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/operations-insights/cross-region-support-sql-insights.htm](https://docs.oracle.com/iaas/releasenotes/operations-insights/cross-region-support-sql-insights.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

SQL Insights - Fleet Analysis 대시보드가 여러 리전의 데이터를 조회할 수 있게 되었습니다. 여러 리전에 분산된 Oracle Database 환경에서도 SQL 성능과 플릿 상태를 한 관점에서 분석할 수 있습니다.

멀티 리전 운영 환경에서는 리전별 성능 편차와 이상 SQL을 통합적으로 보는 것이 중요합니다. 이번 업데이트는 전사 DB 운영팀의 분석 범위를 넓히는 데 도움이 됩니다.

## Use Deep Data Security in Autonomous AI Database
* **Services:** Autonomous Database Serverless
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-deep-data-security.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-deep-data-security.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 Deep Data Security를 사용할 수 있습니다. 이번 항목은 Select AI 직접 연계 기능이 아니라 데이터 접근제어와 보안 정책 성격이므로 Data Platform / Oracle로 분류합니다.

Deep Data Security는 데이터 행·열 수준 접근제어와 사용자 맥락 기반 권한 적용처럼 민감 데이터 보호를 강화하는 기능입니다. AI 시대에는 데이터 접근 범위를 더 세밀하게 통제해야 하므로, 분석 사용자와 애플리케이션 계정의 권한 분리가 중요합니다.

## Iceberg REST Catalog Integration with DBMS_DCAT
* **Services:** Autonomous Database Serverless
* **Release Date:** June 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-iceberg-rest-catalog.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-iceberg-rest-catalog.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database Serverless에서 DBMS_DCAT을 통해 Iceberg REST Catalog와 통합할 수 있습니다. Apache Iceberg는 대규모 분석 테이블을 관리하기 위한 오픈 테이블 포맷이고, REST Catalog는 Iceberg 테이블 메타데이터를 표준 API로 조회하게 해주는 구성입니다.

이번 기능은 ADB가 외부 데이터 레이크 테이블 메타데이터와 더 쉽게 연계되도록 돕습니다. AI 기능이 아니라 데이터 카탈로그·분석 테이블 연계 기능이므로 Oracle Data Platform 영역에 포함합니다.

## Lake Cache for Mounted Catalog Tables
* **Services:** Autonomous Database Serverless
* **Release Date:** June 17, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-lake-cache-mounted-catalogs.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-lake-cache-mounted-catalogs.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Mounted Catalog Tables에 Lake Cache를 사용할 수 있습니다. Lake Cache는 외부 데이터 레이크 테이블 접근 시 반복 조회 성능을 높이기 위한 캐시 계층입니다.

데이터 레이크와 ADB를 함께 사용하는 환경에서는 외부 테이블 조회 성능과 비용이 중요한 고려사항입니다. 이번 업데이트는 분석 쿼리 성능 개선과 데이터 레이크 통합 활용도를 높이는 데 의미가 있습니다.

## Oracle Data Safe Promotion for On-Premises Databases, Databases on Compute, and Amazon RDS for Oracle
* **Services:** Data Safe
* **Release Date:** June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/data-safe/onprem-promotion.htm](https://docs.oracle.com/iaas/releasenotes/data-safe/onprem-promotion.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Safe가 온프레미스 데이터베이스, Compute 위의 데이터베이스, Amazon RDS for Oracle에 대한 프로모션을 제공합니다. Data Safe는 민감 데이터 탐지, 사용자 위험 분석, 감사, 보안 평가를 제공하는 Oracle Database 보안 서비스입니다.

AI-assisted attack처럼 공격 방식이 고도화되는 상황에서 데이터베이스 보안 상태를 정기적으로 평가하는 것이 중요합니다. 하이브리드 또는 멀티클라우드 Oracle DB 환경도 보안 점검 범위에 포함할 수 있다는 점이 핵심입니다.

## Autonomous AI Database Serverless on Oracle AI Database@AWS
* **Services:** Autonomous Database Serverless
* **Release Date:** June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-adbs-on-aws.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-adbs-on-aws.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database Serverless를 Oracle AI Database@AWS에서 사용할 수 있습니다. 이 항목은 이름에 AI Database가 포함되지만 Select AI 직접 연계 기능이 아니라 배포/서비스 제공 위치와 관련된 일반 데이터베이스 업데이트로 보아 Data Platform / Oracle에 배치합니다.

Oracle Database@AWS는 Oracle Database 서비스를 AWS 환경과 인접하게 활용하는 멀티클라우드 선택지를 제공합니다. 이 항목은 ADB Serverless의 Select AI 직접 연계 기능이 아니므로 Oracle DB 일반 업데이트로 정리합니다.

## Veridata now available in OCI GoldenGate
* **Services:** GoldenGate
* **Release Date:** June 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/goldengate/veridata-dr-pipelines.htm](https://docs.oracle.com/iaas/releasenotes/goldengate/veridata-dr-pipelines.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI GoldenGate에서 Veridata와 Disaster Recovery 관련 기능이 제공됩니다. GoldenGate는 데이터 복제와 실시간 데이터 통합에 사용되는 서비스이며, Veridata는 원본과 대상 데이터의 정합성을 검증하는 도구입니다.

데이터 복제 환경에서는 단순히 파이프라인이 동작하는 것뿐 아니라 복제 결과가 정확한지 확인하는 것이 중요합니다. Veridata 지원은 마이그레이션, DR, 실시간 동기화 시 데이터 검증 절차를 강화하는 데 도움이 됩니다.
