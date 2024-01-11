---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "12월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 12월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Dec-2023
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

## Base Database: Upgrade operating system to Oracle Linux 8 
* **Services:** Database
* **Release Date:** Dec. 6, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/f77cdf38-b95f-41f1-90af-89534f519969/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/f77cdf38-b95f-41f1-90af-89534f519969/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 콘솔이나 API를 사용하여 DB 시스템의 운영 체제를 Oracle Linux 8(OL8)로 업그레이드할 수 있습니다.

- DBCS - Oracle Linux 8 업그레이드
  ![DBCS_OL](/assets/img/dataplatform/2023/release_note/202312/02_oci_dbcs_linux_8.png)

## Base Database: Backup and restore from a standby database in a Data Guard association
* **Services:** Database
* **Release Date:** Dec. 6, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/f46b8bf7-cd3a-4b8a-9894-5eeef6993311/](https://docs.oracle.com/iaas/releasenotes/changes/f46b8bf7-cd3a-4b8a-9894-5eeef6993311/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 Data Guard 로 연결된 Standby 데이터베이스에서 백업 및 복원을 수행할 수 있습니다.

- Data Guard DB 에서의 Automatic Backup
  - Data Guard 의 Peered DB 에서도 Automatic Backup 을 구성할 수 있습니다.
    ![DBCS_OL](/assets/img/dataplatform/2023/release_note/202312/02_oci_dbcs_data_guard_backup_config.png)

- Data Guard DB 에서의 Manual Backup 및 Restore
  - Data Guard 의 Peered DB 에서는 Manual Backup 을 수행할 수 없습니다.
  - Data Guard 의 Peered DB 에 Automatic 으로 Backup 된 백업들 중에서 신규 DB 를 생성하여 Restore 를 할 수 있습니다.
    ![DBCS_OL](/assets/img/dataplatform/2023/release_note/202312/03_oci_dbcs_data_guard_backup_restore.png)


## Manage Truststore certificates in OCI GoldenGate
* **Services:** GoldenGate
* **Release Date:** Dec. 6, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/48b41dd0-5b3b-4bef-91bb-db4ac1860601/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/48b41dd0-5b3b-4bef-91bb-db4ac1860601/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 Deployment 가 클라이언트-서버 방식으로 통신하는 다른 Oracle GoldenGate Deployment 에 대한 Truststore 인증서를 관리할 수 있습니다.

일반적으로 통신을 시작하는 Deployment 는 클라이언트이고 통신을 수신하는 Deployment 는 서버입니다.

* On-Premise 와 OCI GoldenGate 의 연동
  ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/04_oci_goldengate_onprem_integration.png)

* On-Premise Oracle GoldenGate 21c 에서의 Certification 관리

  ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/05_on-prem_goldengate_certification.png)

* OCI GoldenGate 의 Truststore 관리 메뉴

  ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/06_oci_goldengate_truststore.png)

## Database Migration service now supports File Storage service
* **Services:** Database Migration, Oracle Cloud Infrastructure
* **Release Date:** Dec. 7, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/50c676f3-295a-40af-8b05-2708137a9bcf/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/50c676f3-295a-40af-8b05-2708137a9bcf/){:target="_blank" rel="noopener"}

### 릴리즈 내용

데이터베이스 마이그레이션 서비스에서 이제 File Storage Service 를 지원합니다. 이제 Source 와 Target Database 간의 전송 매체로 공유 File Storage Mount 를 사용할 수 있습니다.

* Migration 생성 시 File Storage Service 지원

  ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/07_oci_migration_filestorage.png)

## New features available for GoldenGate
* **Services:** GoldenGate
* **Release Date:** Dec. 12, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/ef16a911-9ed0-415b-b158-c9e57d6475d9/](https://docs.oracle.com/iaas/releasenotes/changes/ef16a911-9ed0-415b-b158-c9e57d6475d9/){:target="_blank" rel="noopener"}

### 릴리즈 내용
최신 GoldenGate 릴리스에는 SOURCE 및 TARGET 연결 생성 시 새로운 Networking 옵션과 Deployment 에 대한 상황별 Notification 을 설정하는 기능이 포함되어 있습니다.

### - 12월 업데이트 내용
  - 네트워킹 업데이트 
    - GoldenGate console 의 Public Access 를 위해 Load Balancer 를 사용할 수 있도록 지원
      ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/08_oci_goldengate_load_balancer.png)

    - Connection 생성 시 Shared endpoint 를 사용할지, Dedicated endpoint 를 사용할지 선택
      ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/09_oci_goldengate_nework_endpoint.png)
  
  - Contextual notifications
    - Deployment 상세 화면에서 contextual notification 설정할 수 있습니다. OCI GoldenGate Deployment 내에서 발생하는 event 에 대해 notification 을 받으실 수 있습니다.
      ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/10_oci_goldengate_notification.png)

  - Truststore certificates
    - OCI GoldenGate Deployment 가 통신하는 다른 GoldenGate Deployment 에 대한 Truststore Certificate 를 관리할 수 있습니다.
  - REST APIs
    - 최신의 기능들과 업데이트가 반영되어 Refresh 되었습니다.


## Base Database: Use SQL Worksheet for Pluggable Databases
* **Services:** Database
* **Release Date:** Dec. 13, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/9efd2543-fcdc-4d09-93de-08d02fe47cb1/](https://docs.oracle.com/iaas/releasenotes/changes/9efd2543-fcdc-4d09-93de-08d02fe47cb1/){:target="_blank" rel="noopener"}

## 릴리즈 내용
이제 콘솔에서 플러그형 데이터베이스용 SQL Worksheet 를 시작하고 사용할 수 있습니다. 이 기능 지원으로 DB 가 위치하는 Private Network 으로의 연결 및 SQL Developer 툴 설치와 같은 작업들이 필요없이 Cloud Console 에서 데이터 베이스의 내용을 바로 확인할 수 있습니다.

- PDB 상세 화면에서의 SQL Worksheet 기능
  - DB 연결을 위한 Connection
      ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/11_oci_dbcs_sqlworksheet_01.png)
      
      ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/12_oci_dbcs_sqlworksheet_02.png)
  
  - SQL Worksheet 화면
      ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/13_oci_dbcs_sqlworksheet_03.png)


## Announcing availability of Oracle@Azure multicloud database service
* **Services:** Database
* **Release Date:** Dec. 13, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/5ec69089-ecdb-4437-a7ac-479f1f871959/](https://docs.oracle.com/iaas/releasenotes/changes/5ec69089-ecdb-4437-a7ac-479f1f871959/){:target="_blank" rel="noopener"}

## 릴리즈 내용
Oracle Database@Azure는 Azure에서 Oracle 데이터베이스 워크로드를 실행하는 Oracle Cloud 데이터베이스 서비스입니다. Oracle Database@Azure용 모든 하드웨어는 Azure의 데이터 센터에 함께 배치되어 Azure에 있는 애플리케이션에 단순성, 보안 및 짧은 대기 시간을 제공합니다.

- 참고 사이트 : [Oracle Database@Azure 소개](https://learn.microsoft.com/ko-kr/azure/oracle/oracle-db/database-overview){:target="_blank" rel="noopener"}
      ![OCI_GoldenGate](/assets/img/dataplatform/2023/release_note/202312/14_oci_dbcs_at_azure.png)


## Database Migration introduces a new policy template 
* **Services:** Database Migration, Oracle Cloud Infrastructure
* **Release Date:** Dec. 20, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/9814ab60-7e17-4194-b698-9fbfb60cb9ab/](https://docs.oracle.com/iaas/releasenotes/changes/9814ab60-7e17-4194-b698-9fbfb60cb9ab/){:target="_blank" rel="noopener"}

## 릴리즈 내용
Database Migration Service 에 대한 Policy 설정이 간편해졌습니다. Policy 작성기(정책 생성) 섹션에 Database Migration 과 관련된 새 Policy Template 들이 추가되었습니다. 이를 통해 테넌트 관리자는 필요한 모든 정책(다른 종속 OCI 서비스에 대한 정책 포함)을 한 번에 프로비저닝하고 사용자가 Migration 을 설정하고 사용할 수 있습니다.

- Policy Builder 에서 Database Migration 관련 Policy 설정

  ![DMS Policy Builder](/assets/img/dataplatform/2023/release_note/202312/15_oci_database_migration_policy_builder.png)

## Operations Insights AWR Hub Explorer
* **Services:** Operations Insights
* **Release Date:** Dec. 20, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/39da14f9-8c60-4840-9309-6001d6a6ea7b/](https://docs.oracle.com/iaas/releasenotes/changes/39da14f9-8c60-4840-9309-6001d6a6ea7b/){:target="_blank" rel="noopener"}

## 릴리즈 내용

AWR Hub Explorer 를 사용하면 직관적인 시각화가 생성될 수 있는 데이터를 추출하는 SQL 쿼리를 통해 AWR 의 성능 통계를 탐색할 수 있습니다. 쿼리는 이 경우 단순히 DBA_HIST_* 뷰인 데이터 개체를 활용합니다. AWR Hub Explorer 의 시각화 View 에는 AWR Hub 내에 저장된 AWR Snapshot 도 포함되어 있습니다. ( * 현재는 Autonomous Database 만 지원 )

- AWR Hub Explorer 는 AWR Hub 저장소의 Data 를 시각화하는 역할을 담당합니다.

  ![OCI_AWR_Hub_Explorer](/assets/img/dataplatform/2023/release_note/202312/16_oci_awr_hub_explorer.png)

- 일반적인 AWR Report 분석에서는 시계열 분석이 어려움
  ![AWR Report](/assets/img/dataplatform/2023/release_note/202312/17_awr_report_analysis.jpg)

- AWR 데이터를 시각화 (AWR Hub Explorer)



---
