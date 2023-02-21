---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "1월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 1월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Jan-2023
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

##  Database Management Support for PDBs on the Base Database Service and Exadata Cloud Infrastructure
* **Services:** Database Management
* **Release Date:** Jan 11, 2022
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/5c451419-aa5f-4440-976f-9fa1c01019f3/](https://docs.oracle.com/iaas/releasenotes/changes/5c451419-aa5f-4440-976f-9fa1c01019f3/){:target="_blank" rel="noopener"}

### 서비스 소개

오라클 데이터베이스 클라우드 서비스들을 관리할 수 있는 Database Management 서비스의 신규 기능이 업데이트 되었습니다.


* 신규 기능
  - 이제 Oracle Cloud Pluggable Databases(기본 데이터베이스 서비스의 PDB 및 Exadata 데이터베이스 서비스)에 대한 데이터베이스 관리를 활성화하고 모니터링, 성능 관리, 조정 및 관리를 위해 데이터베이스 관리 기능을 사용할 수 있습니다.
  - PDB 에 대한 Database Management 기능을 사용하기 위해서는 CDB 에 대한 Full Management 옵션을 가진 Database Management 기능이 Enable 되어 있어야 합니다.
  - 하나의 CDB 에 대해 최대 10개의 PDB 를 등록하여 모니터링하고 관리할 수 있습니다.
<br>

* PDB 에 대한 Database Management 등록 및 모니터링

![Database Management](/assets/img/dataplatform/2023/01_database_management_overview.png)

* PDB - Database Management Enable 기능

![Database Management](/assets/img/dataplatform/2023/02_oci_database_management_pdb.png)

* PDB 에 대한 Database Management 등록

![Database Management](/assets/img/dataplatform/2023/03_oci_database_management_pdb_enable_2.png)

<br>

##  Automatically Generate and Add Policies for Database Management
* **Services:** Database Management
* **Release Date:** Jan. 31, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/921fc2c9-5e92-4e10-9aad-077add24c40a/](https://docs.oracle.com/iaas/releasenotes/changes/921fc2c9-5e92-4e10-9aad-077add24c40a/){:target="_blank" rel="noopener"}

### 서비스 소개

오라클 데이터베이스 클라우드 서비스들을 관리할 수 있는 Database Management 서비스의 신규 기능이 업데이트 되었습니다.

* 신규 기능
  - 이제 Database Management 에서 안내된 Policy 설정을 사용하여 데이터베이스 관리를 활성화하고 사용하는 데 필요한 IAM 사용자 및 서비스 정책을 자동으로 생성하고 추가할 수 있습니다. Policy 자동 설정 기능은 Database Management 기능을 Enable 설정을 하기 위한 화면에서 나타납니다.

  - Database Management 기능을 사용하기 위해 아래의 Permission 들이 필요합니다. (DB-MMT-ADMIN 그룹은 example)

    - Allow group DB-MGMT-ADMIN to manage dbmgmt-private-endpoints in tenancy
    - Allow group DB-MGMT-ADMIN to read dbmgmt-work-requests in tenancy
    - Allow group DB-MGMT-ADMIN to manage dbmgmt-family in tenancy

<br>


##  New compute model: ECPUs for Autonomous Database on Dedicated Exadata Infrastructure
* **Services:** Database
* **Release Date:** Jan. 31, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/01eb3918-60b9-4158-a3e2-1ff3b827ce86/](hhttps://docs.oracle.com/iaas/releasenotes/changes/01eb3918-60b9-4158-a3e2-1ff3b827ce86/){:target="_blank" rel="noopener"}

### 서비스 소개

Autonomous Database 리소스 생성 시 ECPU 라는 새로운 컴퓨팅 유형을 선택해서 사용하실 수 있습니다.

Dedicated Exadata 인프라의 Autonomous Database는 Autonomous Database 리소스를 구성하는 동안 아래 두가지 형태의 컴퓨팅 모델을 제공합니다. (* Shared Autonomous Database 에는 해당하지 않음)

  - ECPU: ECPU는 컴퓨팅 리소스의 추상화된 측정값입니다. ECPU는 Exadata 데이터베이스 서버 및 스토리지 서버의 공유 풀에서 탄력적으로 할당되는 코어 수를 기반으로 합니다.
    - Autonomous Data Warehouse의 최소 ECPU 값은 2 ECPU입니다.
    - Dedicated 된 ADB 를 할당해 놓은 환경에서 최소값인 2개의 ECPU가 모두 다 필요하지 않은 Autonomous Transaction Processing 워크로드가 있는 데이터베이스의 경우 ECPU 수를 0.2에서 1.8까지 0.2 ECPU 단위로 할당할 수 있습니다. 이를 통해 CPU를 오버프로비저닝하고 각 인프라 인스턴스에서 더 많은 데이터베이스를 실행할 수 있습니다. 
    - CPU 오버프로비저닝과 함께 ECPU를 사용하는 Autonomous Transaction Processing 워크로드는 Auto Scaling을 지원하지 않습니다. 

  - OCPU: OCPU는 컴퓨팅 리소스의 물리적 측정입니다. OCPU는 하이퍼 스레딩이 활성화된 프로세서의 물리적 코어를 기반으로 합니다.
    - 새 데이터베이스를 프로비저닝하고 기존 데이터베이스를 복제하고 기존 데이터베이스의 CPU 리소스를 확장하거나 축소하는 동안: CPU 수는 기본적으로 1씩 증가하는 1 OCPU입니다. 예를 들어 데이터베이스에 3.5 OCPU를 할당할 수 없습니다. 3보다 큰 다음 사용 가능한 OCPU 수는 4입니다.
    - 전체 OCPU가 필요하지 않은 데이터베이스의 경우 0.1에서 0.9까지 0.1 OCPU 단위로 OCPU를 할당할 수 있습니다. 이를 통해 CPU를 오버프로비저닝하고 각 인프라 인스턴스에서 더 많은 데이터베이스를 실행할 수 있습니다.

<br>

---