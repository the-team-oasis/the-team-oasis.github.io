---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "4월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 4월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Apr-2023
  - DATAPLATFORM, DATABASE, BIGDATA, DATAFLOW, SPARK, ORACLE, GOLDENGATE
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


## New GoldenGate deployment and connection types
* **Services:** Data Flow
* **Release Date:** March 1, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/ada5da89-7e43-4ee9-ad81-b70054aee27b/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/ada5da89-7e43-4ee9-ad81-b70054aee27b/){:target="_blank" rel="noopener"}

### 서비스 소개

OCI GoldenGate 서비스에 이제 Microsoft SQL Server 배포 유형 및 연결을 지원합니다. 빅 데이터 연결에 대한 지원도 추가되었습니다.

- Microsoft SQL Server 를 위한 Deployment Type 이 추가되어 아래와 같은 서비스에 연결들을 제공합니다.
  - Azure SQL Database
  - Azure SQL Managed Instance
  - Microsfot SQL Server
  - Amazon RDS for SQL Server

- Big Data Deployment Type 도 지원하고 있으며 아래와 같은 서비스에 연결들을 제공합니다.
  - Oracle NoSQL (target only)
  - Oracle WebLogic Java Message Service (JMS)
  - Amazon S3 (target only)
  - Apache HDFS
  - Autonomous JSON Database (target only)
  - Azure Cosmos DB for MongoDB
  - MongoDB
  - Snowflake (target only)

- 다양하게 추가된 OCI GoldenGate Deployment Type 

![OCI GoldenGate]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/release_note/202303/03.oci_goldengate_deployment_type.png)


## ADDM Spotlight Integration
* **Services:** Operation Insights
* **Release Date:** April 18, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/c6539641-6b07-4a9e-b70f-dec2906e8c32/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/c6539641-6b07-4a9e-b70f-dec2906e8c32/){:target="_blank" rel="noopener"}

### 서비스 소개

이제 Operations Insights에 통합된 새로운 ADDM(Automatic Database Diagnostic Monitor) Spotlight를 사용하여 데이터베이스 내장 ADDM 데이터를 기반으로 데이터베이스 및 애플리케이션 성능에 대한 중요한 세부 정보를 수집할 수 있습니다. ADDM Spotlight 분석 보고서는 조사 결과 요약 (Findings), 권장 사항 (Recommendations) 및 제안된 구성 변경 사항을 제공합니다.

- ADDM Spotlight Findings 화면

![OCI GoldenGate]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/release_note/202303/04.operation_insights_addm_spotlight_findings.png)

- ADDM Spotlight Reommendations 화면

![OCI GoldenGate]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/release_note/202303/05.operation_insights_addm_spotlight_recommendations.png)

## New SQL Worksheet in Database Tools
* **Services:** Operation Insights
* **Release Date:** April 18, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/c6539641-6b07-4a9e-b70f-dec2906e8c32/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/c6539641-6b07-4a9e-b70f-dec2906e8c32/){:target="_blank" rel="noopener"}

### 서비스 소개

Database Tools 는 OCI 에서 제공하는 Database 개발을 위한 툴을 제공하고 있으며, 보다 진보된 SQL Developer 와 유사한 UI 제공합니다.

Database Tools 는 아래와 같이 Private Endpoint 기반의 Connections 를 설정하여 연결하고 Vault 에 Secret Key 를 저장하여 관리합니다.

- Database Tools Connection / Vault Secret

![OCI GoldenGate]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/release_note/202303/06.db_tools_1.png)

이제 Database Tools 에는 다양한 새로운 기능을 갖춘 새롭고 더욱 강력한 버전의 SQL Worksheet 가 포함되어 있습니다.

- Database Tools - SQL Worksheet

![OCI GoldenGate]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/release_note/202303/07.db_tools_2.png)

- Explain Plan Diagram

![OCI GoldenGate]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/release_note/202303/07.db_tools_explain_plan.jpg)

---
