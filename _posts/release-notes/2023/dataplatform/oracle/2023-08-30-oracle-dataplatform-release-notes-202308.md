---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "7월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 8월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Aug-2023
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

## Exadata Database on Dedicated Infrastructure: Update Guest VM (domU) Operating System to Oracle Linux 8
* **Services:** Database
* **Release Date:** Aug. 2, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/e5b3447c-029f-466d-bec6-02793974a5d8/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/e5b3447c-029f-466d-bec6-02793974a5d8/){:target="_blank" rel="noopener"}

### 릴리즈 내용

OCI Console 이나 API를 사용하여 게스트 VM 운영 체제를 Oracle Linus 8 로 업데이트 할 수 있게 되었습니다. 이 업데이트는 Exadata X7, X8M 및 X9M 시스템을 사용하는 경우에만 적용할 수 있습니다.

- Exadata Cloud Service 의 구성 절차

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/01_ExaCS_provisioning.png)

- Exadata Cloud Service 구성 예

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/02_ExaCS_config_example.png)

- Exadata Cloud Service System Software 23.1 patch apply (Zero Downtime)

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/03_ExaCS_System_Software_update.png)

- Exadata Software 23.1 Release 의 핵심은 Oracle Linux 8.7 UEK6 로의 업그레이드 입니다.

## Exadata Fleet Update OCI service
* **Services:** Database
* **Release Date:** Aug. 2, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/7d36c4ef-5bee-4650-a0ce-5ad330696a7b/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/7d36c4ef-5bee-4650-a0ce-5ad330696a7b/){:target="_blank" rel="noopener"}

### 릴리즈 내용

Oracle Exadata Database Service 고객은 이제 자신의 환경에 따라 업데이트를 그룹화하고 예약하여 통제된 방식으로 Oracle Grid Infrastructure 및 Oracle Database 배포를 하나의 집합으로 업데이트할 수 있습니다. Exadata Fleet Update는 추가 비용 없이 사용이 가능합니다.

- Exadata Fleet Update 화면

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/04_ExaCS_Fleet_update.png)

## Additional Maintenance features added for GoldenGate
* **Services:** GoldenGate
* **Release Date:** Aug. 8, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/7d36c4ef-5bee-4650-a0ce-5ad330696a7b/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/7d36c4ef-5bee-4650-a0ce-5ad330696a7b/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 세부 Maintenance 관리 기간 구성, 업그레이드 일정 변경 및 취소를 포함하여 GoldenGate에서 확장된 Maintenance 관리 기능을 사용할 수 있습니다.

- Maintenance 관리 설정 화면

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/05_OCI_GoldenGate_MA.png)

## Operations Insights News Report
* **Services:** Operations Insights
* **Release Date:** Aug. 10, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/68151ed4-5bee-4e52-8dc5-51b8b8a5f104/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/68151ed4-5bee-4e52-8dc5-51b8b8a5f104/){:target="_blank" rel="noopener"}

### 릴리즈 내용

Operations Insights 서비스는 고객의 환경 또는 워크로드에 대한 뉴스 보고서를 생성하여 데이터베이스, 호스트 및 Exadata 시스템 전체에 걸쳐 새로운 활용률 최고치, 대규모 활용률 변경 및 재고 변경 사항에 대한 주간 분석을 보낼 수 있게 되었습니다.

- News Report 생성 화면

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/06_operation_insights_news_report_01.png)

- News Report Sample 화면

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/07_operation_insights_news_report_02.png)


## Base Database: Autonomous Recovery Service as the Default Backup Destination
* **Services:** Database
* **Release Date:** Aug. 21, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/6ba70b71-59f6-4616-b552-abd34293393b/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/6ba70b71-59f6-4616-b552-abd34293393b/){:target="_blank" rel="noopener"}

### 릴리즈 내용

데이터베이스 백업의 자동 백업 Destination 으로 Autonomous Recovery 서비스에 대한 기본 지정이 가능하게 되었습니다.

- Database Backup Destination
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/08_autonomous_backup_destination.png)

- Autonomous Recovery 서비스란?
  - OCI에서 Oracle 데이터베이스를 지속적으로 보호하기 위한 완전 관리형 자동화 서비스로 과거의 ZDLRA (Zero Data Loss Recovery Appliance) 기술이 OCI 에 반영되었습니다.

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/09_autonomous_recovery_service.png)

- Autonomous Recovery 서비스 백업 관리 화면

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/10_autonomous_recovery_service_02.png)

## Exadata Database on Dedicated Infrastructure: Cancel a Running Full or Incremental Backup
* **Services:** Database
* **Release Date:** Aug. 21, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/6ba70b71-59f6-4616-b552-abd34293393b/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/6ba70b71-59f6-4616-b552-abd34293393b/){:target="_blank" rel="noopener"}

### 릴리즈 내용

Database 에 대한 자동 백업이 진행되면 백업이 완료될 때까지 취소할 수가 없었습니다. 이제 진행 중인 백업에 대한 취소가 가능해졌습니다. OCI API 를 통해서도 최소가 가능합니다.

- Backup 취소 기능

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/10_cancel_backup.png)

## New release for Data Integration
* **Services:** Data Integration, Oracle Cloud Infrastructure
* **Release Date:** Aug. 28, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/5f2252dc-e783-4052-a162-c3a953b75daf/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/5f2252dc-e783-4052-a162-c3a953b75daf/){:target="_blank" rel="noopener"}

### 릴리즈 내용

Data Integratioon 의 Data Asset 의 Data Source 로 Salesforce 를 연결할 수 있게 되었습니다.

- Data Asset 지원 목록
  - Object Storage
  - Oracle Database
  - Oracle Peoplesoft
  - Oracle Siebel
  - Oracle E-Business Suite
  - Autonomous Data Warehouse or Autonomous Transaction Processing
  - Oracle Fusion Applications using Oracle Business Intelligence Cloud Connector (BICC)
  - Oracle Fusion Applications using Oracle Business Intelligence Publisher (BIP)
  - Amazon Aurora
  - Amazon RDS for SQL Server
  - Amazon Redshift
  - Amazon S3
  - Generic REST Data Asset
  - HDFS
  - Hive
  - IBM DB2
  - Influx DB
  - Microsoft Azure SQL Database
  - Microsoft Azure Synapse Analytics
  - Microsoft SQL Server
  - MySQL
  - MySQL HeatWave
  - MySQL on Amazon RDS
  - Oracle Database on Amazon RDS
  - PostgreSQL
  - Salesforce

## GoldenGate now supports Stream Analytics
* **Services:** GoldenGate
* **Release Date:** Aug. 30, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/0d90b761-a341-4f44-b839-d12fa87aafe6/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/0d90b761-a341-4f44-b839-d12fa87aafe6/){:target="_blank" rel="noopener"}

### 릴리즈 내용

Event Stream Processing Pipeline 구축을 위해 OCI GoldenGate Stream Analytics 서비스가 추가 되었습니다. 아직 LA 단계로 특정 Region 에서만 사용 가능합니다.

- Stream Analytics 개념
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202308/11_stream_analytics.png)

---
