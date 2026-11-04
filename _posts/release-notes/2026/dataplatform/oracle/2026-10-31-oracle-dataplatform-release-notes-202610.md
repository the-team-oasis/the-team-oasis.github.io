---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "10월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2026년 10월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
permalink: "release-notes-2026-dataplatform/oracle-dataplatform-release-notes-202610/"
categories:
  - release-notes-2026-oracle-dataplatform
tags:
  - oci-release-notes-2026
  - Oct-2026
  - DATAPLATFORM
  - DATABASE
  - ORACLE
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

## Oracle GoldenGate Veridata: 멀티클라우드·오픈소스 DB 연결 유형 확대

* **Services:** Oracle GoldenGate
* **Release Date:** 2026년 10월 1일

### 업데이트 내용

Oracle GoldenGate Veridata가 데이터 검증을 위한 연결 유형을 확대했습니다. 새로 지원되는 대상에는 Amazon Aurora MySQL·PostgreSQL, Amazon RDS for MariaDB·MySQL·PostgreSQL, Azure Cosmos DB for PostgreSQL, Azure Database for MySQL·PostgreSQL, Google Cloud SQL for PostgreSQL이 포함됩니다.

이와 함께 MariaDB, MySQL Database Server, OCI의 HeatWave, PostgreSQL 및 파생 DB, SingleStoreDB도 지원합니다. 멀티클라우드 또는 이기종 DB 복제 환경에서 데이터 정합성 검증 범위를 넓히는 업데이트입니다.

### 참고

- Release Note: https://docs.oracle.com/iaas/releasenotes/goldengate/veridata-connections.htm
- Oracle GoldenGate 문서 — What’s New: https://docs.oracle.com/en/cloud/paas/goldengate-service/ocigg/whats-new-in-oracle-cloud-infrastructure-goldengate.html

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Iceberg 외부 테이블에 파티션 프루닝 적용
* **Services:** Autonomous Database Serverless
* **Release Date:** October 06, 2026

### 업데이트 내용
Autonomous AI Database가 Apache Iceberg 파티션 메타데이터를 이용해 쿼리에 불필요한 파일을 건너뛸 수 있습니다. 애플리케이션은 원래 테이블 열에 대한 일반 SQL을 유지하면서 Object Storage 접근을 줄이고 대형 lakehouse 테이블의 조회 성능 개선을 기대할 수 있습니다.

### 참고

- [Release Note: Improve Iceberg External Table Query Performance with Partition Pruning](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-10-partition-pruning.htm){:target="_blank" rel="noopener"}
- [Documentation: Optimize Iceberg Queries with Partitioning](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/query-external-data-apache-iceberg.html#GUID-3954CA2F-30C1-4FCD-97DD-612CC79D09F8){:target="_blank" rel="noopener"}

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Essbase를 관리형 도구로 제공
* **Services:** Autonomous Database Serverless
* **Release Date:** October 06, 2026

### 업데이트 내용
기존 Autonomous AI Database Serverless 인스턴스에서 Essbase를 관리형 도구로 활성화할 수 있습니다. 별도 Essbase 인프라를 배포하거나 관리하지 않고 다차원 분석·모델링·계획·예측·재무 보고 기능을 사용할 수 있습니다.

### 참고

- [Release Note: Multidimensional Analytics with Oracle Essbase](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-10-oracle-essbase.htm){:target="_blank" rel="noopener"}
- [Documentation: What-if analysis, Planning, and Business Analytics with Oracle Essbase](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/use-essbase-autonomous-ai-database-tool.html#GUID-26A10A9F-C5B7-4516-9D97-A267DC796700){:target="_blank" rel="noopener"}

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## 스토리지 캐시 읽기·쓰기 적중률 지표 제공
* **Services:** Autonomous Database Serverless
* **Release Date:** October 13, 2026

### 업데이트 내용
스토리지 캐시의 read-hit 및 write-hit 지표를 모니터링할 수 있습니다. 데이터베이스의 읽기·쓰기 I/O 요청 중 캐시가 처리한 비율을 각각 확인하여 캐시 효율을 평가할 수 있습니다.

### 참고

- [Release Note: Monitor Storage Cache Hit Metrics](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-10-monitor-storage.htm){:target="_blank" rel="noopener"}
- [Documentation: Available Metrics: oci_autonomous_database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/autonomous-monitor-metrics-list.html#GUID-C52DF6AC-EF10-437A-AEEA-6E79A173AB7F){:target="_blank" rel="noopener"}

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Oracle Data Safe: Crypto Posture Assessment 제공

* **Services:** Oracle Data Safe
* **Release Date:** 2026년 10월 20일

### 업데이트 내용

Oracle Data Safe에 등록된 대상 데이터베이스의 암호화 상태를 중앙에서 확인하는 **Crypto Posture Assessment** 기능이 추가되었습니다. 이 기능은 네트워크·데이터 암호화, 인증서, 지갑(wallet), 백업, FIPS 준수 여부, 양자 내성(quantum readiness)을 평가하고, 취약점과 권장 조치 정보를 제공합니다.

Overview 화면에서는 암호화 프로토콜, 인증서 상태, 양자 내성, FIPS 준수 상태를 확인하고 대상 DB별 상세 분석, 우선순위별 발견 사항, 이력 추세, 보고서 및 평가 일정을 관리할 수 있습니다. 사용 전에는 등록·프로비저닝된 대상 DB와 IAM 권한이 필요하며, 지원 대상은 Oracle Database 19.32 이상 또는 Oracle AI Database 23.26.3 이상입니다.

### 참고

- Release Note: https://docs.oracle.com/iaas/releasenotes/data-safe/crypto-assessment.htm
- Oracle Data Safe 문서 — Crypto Posture Assessment Overview: https://docs.oracle.com/iaas/data-safe/doc/crypto-posture-assessment-overview.html

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Oracle GoldenGate: AI 서비스 및 처리 엔진 연결 유형 추가

* **Services:** Oracle GoldenGate
* **Release Date:** 2026년 10월 20일

### 업데이트 내용

Oracle GoldenGate가 AI 서비스와 데이터 처리 엔진을 위한 새 연결 유형을 추가했습니다. 지원 대상은 OCI Generative AI, OpenAI, Google Gemini, Voyage AI, Apache Spark, Databricks Engine, Oracle AI Data Platform Engine입니다.

이번 업데이트는 GoldenGate 기반 데이터 이동·통합 흐름을 생성형 AI와 AI 데이터 처리 환경까지 확장하는 기반이 됩니다. 데이터 파이프라인에서 모델·임베딩·분석 처리 플랫폼으로 연결하는 아키텍처를 검토할 때 참고할 수 있습니다.

### 참고

- Release Note: https://docs.oracle.com/iaas/releasenotes/goldengate/r12connections.htm
- Oracle GoldenGate 문서 — What’s New: https://docs.oracle.com/en/cloud/paas/goldengate-service/ocigg/whats-new-in-oracle-cloud-infrastructure-goldengate.html

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## 애플리케이션 부하 진단을 위한 SQL 추적 지원
* **Services:** Autonomous Database Serverless
* **Release Date:** October 20, 2026

### 업데이트 내용
SQL tracing으로 고부하 SQL 등 과도한 데이터베이스 부하의 원인을 진단할 수 있습니다. 현재 세션을 추적하거나 DBMS_USERDIAG 패키지로 특정 SQL·세션·client identifier 또는 service·module·action을 대상으로 지정할 수 있습니다. 바인드 변수·대기 이벤트·실행 계획 정보도 수집할 수 있습니다.

### 참고

- [Release Note: SQL Tracing for Application Workloads](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-10-sql-tracing.htm){:target="_blank" rel="noopener"}
- [Documentation: Perform SQL Tracing on Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/application-tracing.html#GUID-25A5160B-C72A-4897-9CC9-0BE23EA7EC01){:target="_blank" rel="noopener"}

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->
