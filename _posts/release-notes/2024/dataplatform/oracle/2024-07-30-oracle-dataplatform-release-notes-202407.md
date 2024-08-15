---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "7월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2024년 7월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2024-dataplatform
tags:
  - oci-release-notes-2024
  - July-2024
  - DATAPLATFORM, DATABASE, BIGDATA, DATAFLOW, SPARK, ORACLE
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

## OCI Database with PostgreSQL adds support for additional performance tiers
* **Services:** OCI Database with PostgreSQL
* **Release Date:** July 10, 2024
* **Documentation:** [hhttps://docs.oracle.com/iaas/releasenotes/postgresql/additional-performance-tiers.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/additional-performance-tiers.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

PostgreSQL을 탑재한 OCI 데이터베이스는 이제 다음을 포함하여 데이터베이스 시스템에 대한 추가 성능 계층을 지원합니다.

- PostgreSQL 추가적인 Performance Tier
  - 375,000 IOPS
  - 450,000 IOPS
  - 525,000 IOPS
  - 600,000 IOPS
  - 675,000 IOPS
  - 750,000 IOPS

375,000 IOPS 이상의 성능 계층은 최소 16개의 OCPU가 있는 Shape 에 사용할 수 있습니다.

- Database with PostgreSQL 생성 화면
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/19_oci_postgresql_01.png)


## MySQL Insights for Ops Insights
* **Services:** Ops Insights
* **Release Date:** July 17, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/95e02548-5387-4c28-b594-4cd6bbe72c55/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/95e02548-5387-4c28-b594-4cd6bbe72c55/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

HeatWave MySQL 데이터베이스 시스템에서는 이제 Ops Insights 서비스에서 SQL Insights 와 용량 계획이 지원되어 쿼리 성능 Insight 와 직관적인 Resource Planning 이 가능합니다.

- Ops Insight MySQL Dashboards
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/20_oci_ops_insight_mysql_01.png)  


## GoldenGate 23ai for Big Data, MySQL, and SQL Server now available
* **Services:** GoldenGate
* **Release Date:** July 17, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/73b3a1ca-98ec-4e9a-b5c4-f779d3c46678/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/73b3a1ca-98ec-4e9a-b5c4-f779d3c46678/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

BigData, MySQL, SQL Server 배포를 위한 GoldenGate 23ai가 출시되었습니다. (Oracle 을 위한 GoldenGate 23ai  버전은 아직 미출시 - 23ai 버전 Connection 은 지원)

- OCI GoldenGate New Release
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/21_oci_goldengate_new_release_01.png)  

- OCI GoldenGate 배포 화면 (공식적으로 아직 23ai 버전에 대한 Connection 은 포함되어 있지 않음)
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/22_oci_goldengate_new_release_02.png)  

## Filtering for Table Names in Data Discovery
* **Services:** Data Safe
* **Release Date:** July 23, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/1c34f2a2-9790-41e2-b5cf-3df4ee260ecc/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/1c34f2a2-9790-41e2-b5cf-3df4ee260ecc/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Safe 서비스에서 Data Discovery 중에 테이블 이름을 필터링할 수 있습니다. 선택적으로 대상 데이터베이스에서 선택한 스키마 내의 특정 테이블을 선택할 수 있습니다. 선택한 경우 검색은 스키마의 지정된 테이블에서만 실행됩니다. 또는 이 단계를 건너뛰고 다음으로 진행하여 선택한 스키마 내의 모든 테이블을 스캔할 수 있습니다. <br>
또한 민감한 데이터 모델 세부 정보 페이지에는 이제 SDM (Sensitive Data Model) 에 포함된 민감한 유형과 스키마가 표시되어 가시성이 향상되었습니다. 

- Data Safe 의 Sensitive Data Discovery
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/23_oci_datasafe_data_discovery_01.png)

- Data Safe 의 Sensitive Data Model 생성 화면
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/24_oci_datasafe_sensitive_data_model_02.png)

- Data Safe 의 Sensitive Data Model 을 생성을 위한 특정 스키마 선택
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/25_oci_datasafe_sensitive_data_model_03.png)

- Data Safe 의 Sensitive Data Model 을 생성을 위한 특정 테이블 선택
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/26_oci_datasafe_sensitive_data_model_04.png)

  <br>

  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/27_oci_datasafe_sensitive_data_model_05.png)

  <br>

  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/28_oci_datasafe_sensitive_data_select_06.png)

  <br>

  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/29_oci_datasafe_sensitive_data_select_07.png)

- Sensitive Data Model 을 통해 발견된 민감 정보

  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/30_oci_datasafe_sensitive_data_08.png)


## New release for Data Integration (bug fixes)
* **Services:** Data Integration, Oracle Cloud Infrastructure
* **Release Date:** July 25, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/a1a84708-2e77-4ba1-a687-73a0f29b77e7/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/a1a84708-2e77-4ba1-a687-73a0f29b77e7/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이 릴리스에는 다음이 포함되어 있습니다.

- Security Remediations (보안 수정)
- 다음과 같은 버그 수정:
  - Imported Project 및 Application 에서 객체를 다시 게시할 때 발생한 참조 문제를 해결했습니다.
  - Application 에 실행 객체가 백만 개 가까이 있을 때 쿼리 시간 초과 오류로 인해 발생한 문제에 대해 패치를 적용하여 해결했습니다.
  - Expression Operation 에 Parameter 가 있는 작업이 간헐적으로 실패하는 문제를 해결했습니다.
  - Child Pipeline 실행에서 보고된 Null 포인터 예외 문제를 해결했습니다.


## Custom Alert Policies in Oracle Data Safe
* **Services:** Data Safe
* **Release Date:** July 31, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/8144f390-f211-40cd-95cd-a622dc3af318/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/8144f390-f211-40cd-95cd-a622dc3af318/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Custom Alert Policy 를 사용하면 관심 있는 특정 데이터베이스 활동을 모니터링할 수 있는 유연한 방법을 제공합니다. Custom Alert Policy 불필요한 알림의 "Noise"를 줄이고 부적절하거나 잠재적으로 악의적인 활동을 감지하는 능력을 강화합니다. Custom Alert Policy 정책을 사용하면 위험이 확대되기 전에 사전에 위험을 식별하고 완화할 수 있습니다. 

- Data Safe 의 Custom Alert 기능
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/31_oci_datasafe_custom_alert_09.png)


---