---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "8월 OCI Oracle Data Platform 업데이트 소식"
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


## New Oracle-defined Dashboard in Database Management
* **Services:** Database Management
* **Release Date:** Aug 15, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/84da66bf-cfad-46a7-a5f9-343a26aa7f65/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/84da66bf-cfad-46a7-a5f9-343a26aa7f65/){:target="_blank" rel="noopener"}

### 릴리즈 내용
Oracle에서 정의한 자율 운영 데이터베이스 성능 대시보드를 데이터베이스 관리에서 사용할 수 있습니다.
이 대시보드는 지정된 기간 동안 단일 데이터베이스 관리 지원 자율 운영 데이터베이스의 성능에 대한 개요를 제공합니다.

#### 대시보드에서 제공되는 측정 항목
<table border="1" cellpadding="4" cellspacing="0" class="Formal" frame="hsides" rules="rows" summary="This table lists the widgets displayed in the Autonomous
                    Database Performance dashboard and a brief description of each
                widget" title="">
<thead>
<tr align="left" valign="top">
<th align="left" id="d19334e93" valign="bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">위젯</font></font></th>
<th align="left" id="d19334e95" valign="bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">설명</font></font></th>
</tr>
</thead>
<tbody>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e99" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">평균 활성 세션</font></font></span></strong></td>
<td align="left" headers="d19334e99 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">포그라운드 세션별 데이터베이스 시간(CPU + 대기)의 평균 누적 비율입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e108" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">CPU 사용률(%)</font></font></span></strong></td>
<td align="left" headers="d19334e108 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">모든 소비자 그룹에서 집계된 CPU 사용률입니다. </font><font style="vertical-align: inherit;">사용률은 데이터베이스에서 사용할 수 있는 CPU 수를 기준으로 보고됩니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e117" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">CPU 및 대기(AAS)</font></font></span></strong></td>
<td align="left" headers="d19334e117 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">단일 데이터베이스의 포그라운드 세션에서 사용되는 CPU 시간, 대기 시간 및 사용자 I/O 시간입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e126" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">스토리지 사용량(GB)</font></font></span></strong></td>
<td align="left" headers="d19334e126 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">사용된 최대 저장 공간입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e135" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">사용자 호출</font></font></span></strong></td>
<td align="left" headers="d19334e135 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">구문 분석, 로그온 및 실행 호출의 총 수입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e144" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">현재 로그온</font></font></span></strong></td>
<td align="left" headers="d19334e144 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">성공적인 로그온 수입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e153" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">업무</font></font></span></strong></td>
<td align="left" headers="d19334e153 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">사용자 커밋 및 사용자 롤백의 총 수입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e162" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">구문 분석 횟수</font></font></span></strong></td>
<td align="left" headers="d19334e162 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">하드 및 소프트 구문 분석의 총 수입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e171" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">세션</font></font></span></strong></td>
<td align="left" headers="d19334e171 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">데이터베이스의 세션 수입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e180" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">실행 횟수</font></font></span></strong></td>
<td align="left" headers="d19334e180 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">SQL 문을 실행한 사용자 및 재귀 호출의 총 수입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e189" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">문 실행</font></font></span></strong></td>
<td align="left" headers="d19334e189 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">모든 소비자 그룹에서 집계된 실행 중인 SQL 문 수입니다.</font></font></p>
</td>
</tr>
<tr align="left" valign="top">
<td align="left" headers="d19334e93" id="d19334e199" valign="top"><strong><span class="uicontrol bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대기 중인 문</font></font></span></strong></td>
<td align="left" headers="d19334e199 d19334e95" valign="top">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">모든 소비자 그룹에 걸쳐 집계된 대기열에 있는 SQL 문의 수입니다.</font></font></p>
</td>
</tr>
</tbody>
</table>

#### 대시보드 예시
![](/assets/img/dataplatform/2023/release_note/202308/adb-performance-dashboard.png " ")


## Database Migration introduces new features, new regions, and API changes
* **Services:** Database Migration, Oracle Cloud Infrastructure
* **Release Date:** Aug 21, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/35b7787c-785d-4b67-b592-9e7d55f82401/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/35b7787c-785d-4b67-b592-9e7d55f82401/){:target="_blank" rel="noopener"}

### 릴리즈 내용

- Database Migration 서비스가 Mexico Central (Queretaro), Israel Central (Jerusalem), Mexico Northeast (Monterrey) 리전에서도 사용할 수 있게 되었습니다.
- Database Connection에 네트워크 보안 그룹을 적용할 수 있도록 기능이 추가되었습니다. NSG는 최대 5개까지 설정할 수 있습니다.
  ![](/assets/img/dataplatform/2023/release_note/202308/database-connection-nsg.png " ")
- SSH 를 사용하지 않고 DB Host로 마이그레이션 지원: ADB가 아닌 데이터베이스와 연결의 경우에는 SSH 연결은 옵션입니다. 새롭게 추가된 기능은 HTTPS를 통해 OSS에 연결하는 Oracle의 내장 프로시저를 활용하여 덤프를 전송합니다.
- 마이그레이션 개체의 Bulk Import/Export 기능 지원: 마이그레이션 중에 개체를 Bulk로 Import/Export 할 수 있는 기능이 추가 되었습니다. 쉼표로(",") 구분된 구조의 개체 목록을 텍스트를 복사하여 붙여넣을 수 있습니다
  ![](/assets/img/dataplatform/2023/release_note/202308/dms-object-add.png " ")
- Validation & Migration Errors, Cause and Resolution : 오류에 대한 사용자 친화적인 설명, 명확한 원인, 가능한 해결 방법 제공하는 기능이 추가되었습니다.
- 복제 성능(복제 설정): 새로운 성능 프로파일로 복제 성능 선택하여 간소화할 수 있는 기능이 추가되었습니다.
- DB 블록 크기(초기 로드): 응용프로그램에서 마이그레이션하는 동안 대상 데이터베이스에 테이블스페이스를 8K 및 16K중 자동으로 생성하도록 선택할 수 있는 기능이 추가되었습니다.


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


## Operations Insights Change Utilization Thresholds

* **Services:** Operations Insights
* **Release Date:** Aug 30, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/ab216707-2b74-4a37-b15e-4eed6c6db261/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/ab216707-2b74-4a37-b15e-4eed6c6db261/){:target="_blank" rel="noopener"}

### 릴리즈 내용
Operations Insights에서 CPU, 스토리지 및 메모리 Insights의 높은 활용률 임계값과 낮은 활용률 임계값을 사용자 정의할 수 있는 기능이 추가되었습니다.
기본적으로 Operations Insights는 CPU, Storage 및 Memory Insights에 대해 높은 사용률 임계값과 낮은 사용률 임계값을 각각 75%와 25%로 설정합니다.
이러한 예측 지표 임계값을 사용자 정의하면 보다 세부적인 용량 관리 예측이 제공되므로 보다 정확한 예측을 위해 특정 대상 유형과 더 관련성이 높은 임계값을 설정하여 보다 적극적으로 리소스를 관리할 수 있습니다.

![](/assets/img/dataplatform/2023/release_note/202308/custom_threshold1.png " ")




## Test connection introduced in Database Migration
* **Services:** Database Migration, Oracle Cloud Infrastructure
* **Release Date:** Aug 30, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/586ade65-79ce-474d-80ee-eb15b5ca543d/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/586ade65-79ce-474d-80ee-eb15b5ca543d/){:target="_blank" rel="noopener"}

### 릴리즈 내용
데이터베이스를 마이그레이션 하기 전에 Database Connection 서비스에서 연결을 테스트 할 수 있도록 "Test Connection" 기능이 추가 되었습니다.
![](/assets/img/dataplatform/2023/release_note/202308/test-connection.png " ")


## Operations Insights Policy Advisor

* **Services:** Operations Insights
* **Release Date:** Aug 30, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/094aefec-584f-4a15-9adb-1332d9fc9ba9/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/094aefec-584f-4a15-9adb-1332d9fc9ba9/){:target="_blank" rel="noopener"}

### 릴리즈 내용
정책 관리자를 사용하면 Operations Insights에서 활성화할 수 있는 리소스에 대한 OCI 권한을 빠르게 설정할 수 있습니다.
정책 관리자에서는 Operations Insights에 필요한 정책을 보고, 생성하고, 업데이트하고, 삭제할 수 있습니다.

Policy Advisor는 다음 정책 생성을 자동화합니다.
- Operations Insights 사용자(관리자 및 읽기 전용 사용자 모두)에게 필요한 정책 관리
- Operations Insights 서비스가 제대로 작동하기 위해 필요한 정책 관리
- 데모 모드 설정을 위한 정책(선택 사항)

![](/assets/img/dataplatform/2023/release_note/202308/operation-insight-policy-advisor.png " ")

---
