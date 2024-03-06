---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "1월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2024년 1월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2024-dataplatform
tags:
  - oci-release-notes-2024
  - Jan-2024
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

## Database Management Support for PDBs on the Base Database Service and Exadata Cloud Infrastructure
* **Services:** Database Management
* **Release Date:** Jan 11, 2022
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/5c451419-aa5f-4440-976f-9fa1c01019f3/](ttps://docs.oracle.com/iaas/releasenotes/changes/5c451419-aa5f-4440-976f-9fa1c01019f3/){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 Oracle Cloud Pluggable Databases(기본 데이터베이스 서비스의 PDB 및 전용 인프라의 Exadata 데이터베이스 서비스)에 대한 데이터베이스 관리를 활성화하고 모니터링, 성능 관리, 튜닝 및 관리를 위해 데이터베이스 관리 기능을 사용할 수 있습니다. 

- Database Management PDB 관리
  ![Data Safe](/assets/img/dataplatform/2024/release_note/202402/03_oci_database_management_pdb.png)


##  You can now view the top five security assessment findings in Oracle Data Safe
* **Services:** Data Safe
* **Release Date:** Jan 17, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/f5a674da-0d11-4d0f-8b2f-a00e4cabe01a/](https://docs.oracle.com/iaas/releasenotes/changes/f5a674da-0d11-4d0f-8b2f-a00e4cabe01a/){:target="_blank" rel="noopener"}

### 업데이트 내용

- 이제 보고서 상단에 강조 표시된 보안 평가의 상위 5개 보안 결과를 찾아 세부 정보를 쉽게 드릴다운할 수 있습니다. 보안 평가 보고서에는 이러한 5가지 제어 각각이 평가된 위험 수준이 표시됩니다.

- Oracle Data Safe now supports Active Data Guard associated target databases - 이제 Active Data Guard 관련 데이터베이스를 Oracle Data Safe 대상 데이터베이스로 등록할 수 있습니다. 대상 등록 중에 기본 데이터베이스에 등록할 Standby 데이터베이스를 선택할 수 있습니다. 활동 감사에서는 이제 기본 및 대기 데이터베이스에서도 감사 레코드를 수집할 수 있습니다. 

- Oracle Data Safe now allows you to configure and defer risk findings- 이제 보안 평가에서 위험 결과의 위험 수준을 무기한으로 또는 설정된 시간 동안 수동으로 조정할 수 있습니다. 또한 새로운 위험 수준인 연기됨을 사용하면 결과를 검토했으며 나중에 작업할 것임을 나타내므로 후속 보고서에서 위험으로 다시 표시되지 않습니다. 

- Oracle Data Safe now allows you to view user schema access details - 이제 사용자 평가에서는 사용자가 액세스할 수 있는 스키마 및 테이블에 대한 세부 정보를 볼 수 있는 기능을 제공합니다. 또한 이러한 스키마와 테이블에 대해 사용자에게 부여된 권한도 확인할 수 있습니다.


- Data Safe 화면
 ![Data Safe](/assets/img/dataplatform/2024/release_note/202402/02_oci_data_safe_02.png)
<br>

  ![Data Safe](/assets/img/dataplatform/2024/release_note/202402/01_oci_data_safe.png)

- Data Safe - Security Assessment 보고서 예
 ![Data Safe](/assets/img/dataplatform/2024/release_note/202402/11_oci_data_safe_sec_assess_example.png)

---