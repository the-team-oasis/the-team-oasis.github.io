---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "5월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2024년 5월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2024-dataplatform
tags:
  - oci-release-notes-2024
  - May-2024
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

## Base Database: Oracle Database 23ai is available on Base Database Service
* **Services:** Database
* **Release Date:** May 02, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/26517edf-0e91-4cee-9569-da1342b2cf07/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/26517edf-0e91-4cee-9569-da1342b2cf07/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Database 23ai는 300개 이상의 주요 새로운 기능과 수천 개의 개선 사항이 포함되어 있습니다. Oracle의 주력 데이터베이스의 최신 Long-Term Support Release 입니다. 

- Oracle Database 23ai new Features

  ![DB23AI](/assets/img/dataplatform/2024/release_note/202407/01_oci_dbcs_23ai_01.png)


- Oracle Database Support Timeline

  Oracle Database 23ai 는 Long Term Support Release 2032년까지 Support Plan 이 잡혀져 있습니다.

  ![DB23AI](/assets/img/dataplatform/2024/release_note/202407/02_oci_dbcs_23ai_support_plan_02.png)

- Oracle Database 23ai Major Features

  Oracle Database 23ai 에 추가된 주요 기능을 요약하면 아래와 같습니다.

  ![DB23AI](/assets/img/dataplatform/2024/release_note/202407/03_oci_dbcs_23ai_major_features_03.png)

  - AI Vector Search : Oracle AI Vector Search는 인공 지능(AI) 워크로드를 위해 설계되었으며 키워드가 아닌 의미론을 기반으로 데이터를 쿼리할 수 있습니다.
  - Globally Distributed Database : 글로벌 분산 데이터베이스는 여러 지리적 위치에 걸쳐 데이터베이스를 관리하고 복제합니다.
  - True Cache : Oracle True Cache는 Oracle 데이터베이스 앞에 배치된 메모리 내, 일관성 있고 자동으로 새로 고쳐지는 SQL 및 Object Cache 기능 입니다.
  - SQL Firewall : SQL Firewall 은 권한이 있는 SQL Statement 및 Connection 에만 데이터베이스 액세스를 제한하여 일반적인 데이터베이스 공격으로부터 실시간 보호를 제공합니다.
  - JSON Relational Duality : JSON 관계형 이중성은 관계형 데이터에 대한 업데이트 가능하고 일관된 JSON 문서 뷰를 제공하는 새로운 데이터 모델링 기능입니다.

- Oracle Database 23ai on OCI
  ![DB23AI](/assets/img/dataplatform/2024/release_note/202407/04_oci_dbcs_23ai_provisioning_04.png)


## Data Safe Now Includes a Pre-Masking Check
* **Services:** Data Safe
* **Release Date:** May 03, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/074855bb-9552-4172-bc57-bf5ef7b78b61/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/074855bb-9552-4172-bc57-bf5ef7b78b61/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Safe 의 Data Masking 기능에 사전에 마스킹 작업을 시작하기 전에 데이터베이스가 마스킹 작업에 대해 올바르게 구성되었는지 확인하기 위해 사전 마스킹 검사를 수행할 수 있는 기능이 추가되었습니다.

- Data Masking Pre-Check
  ![DATASAFE](/assets/img/dataplatform/2024/release_note/202407/05_oci_datasafe_masking_precheck_01.png)

- Data Masking Pre-Check 수행 결과 조회
  ![DATASAFE](/assets/img/dataplatform/2024/release_note/202407/06_oci_datasafe_masking_precheck_report.png)
  사전 마스킹 검사에서 오류가 발생하면 수정 권장 사항을 수행해야 합니다.


## Base Database: Backup and restore from a standby database in a Data Guard association for Autonomous Recovery Service
* **Services:** Database
* **Release Date:** May 08, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/500b6bfa-63b9-4060-b40a-57eae0cedfbf/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/500b6bfa-63b9-4060-b40a-57eae0cedfbf/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Recovery Service 의 Data Guard 연결에 있는 Standby Database 에서 백업하고 복원할 수 있습니다.

- Data Guard Association 의 Standby Database 에서 Backup 및 Restore
  - Recovery Service 또는 Object Storage를 사용하여 Standby Database 를 백업할 수 있습니다.
  - Standby Database 에서 자동 백업을 예약하고 보관 기간 및 백업 일정을 구성할 수 있습니다.
  - Standby Database 의 백업에서 같은 Region 또는 다른 Region 내의 다른 가용성 도메인(AD)에 데이터베이스를 만들 수 있습니다.
  - Primary Database 에서 자동 백업이 구성된 경우 Switchover 시 백업이 새 Standby Database 에서 계속됩니다.
  - Standby Database 에서 자동 백업이 구성된 경우 Failover 시 백업이 새 Primary Database 에서 계속되고 백업이 새 Standby Database 에서 비활성화됩니다.

## New Release for Data Catalog
* **Services:** Data Catalog
* **Release Date:** May 10, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/990aa098-8250-4a6c-8abd-daf3fa288c82/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/990aa098-8250-4a6c-8abd-daf3fa288c82/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Catalog의 새 릴리스가 출시되었습니다. 버그 수정 및 개선 사항 외에도 이제 다음을 수행할 수 있습니다.

- OCI Data Flow 애플리케이션에서 처리한 데이터의 데이터 계보 (Data Lineage) 를 확인이 가능합니다.
- API ImportLineage 를 사용하여 사용자 지정 애플리케이션에서 처리한 데이터의 계보를 수집할 수 있습니다.

- Data Linease 란?
  - 데이터가 신뢰할 수 있는 소스에서 왔는지, 어떤 시스템을 통해 흐르는지, 데이터 파이프라인에서 어떻게 변경되는지 보여주는 그래프입니다.
  - 데이터 분석가, 비즈니스 분석가, 데이터 과학자와 같은 데이터 소비자는 일반적으로 다양한 소스에서 수집하여 다양한 시스템에서 처리하는 데이터로 작업합니다. 데이터 분석가들은 데이터 파이프라인에서 어떻게 변경되는지 이해해야 합니다. Data Linease 를 알면 데이터를 더 잘 추적하여 데이터 문제를 해결하는 데 도움이 됩니다.

- Data Catalog 의 Data Linease 화면
  ![DATALINEASE](/assets/img/dataplatform/2024/release_note/202407/07_oci_datacatalog_data_linease_01.jpg)

- Data Integration 에서 Data Linease 수집 방법 (API ImportLinease 로도 가능)
  ![DATALINEASE](/assets/img/dataplatform/2024/release_note/202407/08_oci_dataintegration_data_linease_02.jpg)

- OCI Data Catalog 는 OCI Data Integration 애플리케이션에서 처리된 Data Linease 를 쉽게 볼 수 있는 방법을 제공합니다. 데이터 소스를 알면 데이터에 대한 신뢰가 생기고 데이터 파이프라인에 대한 변경 사항의 영향을 평가하여 해당 변경 사항을 적용할지 판단할 수 있습니다.

## New Release for Database Management
* **Services:** Database Management
* **Release Date:** May 28, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/7a85d168-35f4-4da8-96e2-0fe32e2fa2ff/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/7a85d168-35f4-4da8-96e2-0fe32e2fa2ff/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Management의 새로운 릴리스가 출시되었습니다. 이제 다음을 수행할 수 있습니다.

- Database Management에서 Oracle Data Guard 구성의 일부인 Primary 및 Standby Database 를 모니터링할 수 있습니다. 
  - Data Guard 특정 속성 및 성능 메트릭 모니터링
  - Data Guard 메트릭이 지정된 트리거를 충족할 때 알림을 받을 알람 생성

- Data Guard 구성에서 역할 전환 모니터링
  - Matric Extension 을 사용하여 사용자 지정 메트릭을 생성하여 Database Management가 활성화된 외부 데이터베이스의 상태 및 성능에 대한 포괄적인 View 를 보실 있습니다.

- Database Management 에서 Data Guard 모니터링
  ![DATALINEASE](/assets/img/dataplatform/2024/release_note/202407/09_oci_database_management_01.png)


## New release for Data Integration (and bug fixes)
* **Services:** Data Integration
* **Release Date:** May 29, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/512ea0d7-a641-4fc3-b744-5ba6afd64b99/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/512ea0d7-a641-4fc3-b744-5ba6afd64b99/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

신규로 출시된 Data Integration 에서 이제 다음을 수행할 수 있습니다.

- Pipeline 에서 들어오는 매개변수를 구성할 때 다음 시스템 및 출력 매개변수 사용 가능 : SYS.TASK_KEY 및 SYS.TASK_NAME
- "HH:mm:ss UTC" 형식으로 SYS.LAST_LOAD_DATE 값 지정
SQL 작업에서 스키마 이름에 스칼라 매개변수 사용

- Data Integration Pipeline 화면에서의 Parameter 지정
  ![DATALINEASE](/assets/img/dataplatform/2024/release_note/202407/10_oci_data_integration_pipeline_01.png)

- Parameter 출력에 대한 Expression 생성 화면 (추가된 SYS.TASK_KEY 및 SYS.TASK_NAM)
  ![DATALINEASE](/assets/img/dataplatform/2024/release_note/202407/11_oci_data_integration_add_param_02.png)

- 결과 저장 예시
  ![DATALINEASE](/assets/img/dataplatform/2024/release_note/202407/12_oci_data_integration_add_param_03.png)


---