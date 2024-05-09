---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "3월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2024년 3월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2024-dataplatform
tags:
  - oci-release-notes-2024
  - Mar-2024
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

## Announcing the general availability of Oracle Globally Distributed Autonomous Database
* **Services:** Globally Distributed Autonomous Database
* **Release Date:** March. 4, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/22a22e7c-f043-49b2-b3c2-2c3e0389de20/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/22a22e7c-f043-49b2-b3c2-2c3e0389de20/){:target="_blank" rel="noopener"}

### GA 내용


Oracle Globally Distributed Autonomous Database는 높은 수준의 성능과 가용성, 데이터 주권에 대한 글로벌 기업의 요구 사항을 해결하도록 설계되었습니다. 이를 통해 조직은 고성능과 가용성으로 모든 유형의 데이터를 사용하는 중요한 분산 데이터베이스를 보다 쉽게 실행할 수 있습니다. 결제 처리, 신용 카드 사기 탐지, 개인화된 마케팅, 모바일 메시징, 인터넷 인프라 및 사물 인터넷(IoT)을 포함한 광범위한 애플리케이션에 이상적입니다.

- Key Capabilities
  - High Availability
  - Horizontal Scalability
  - Data Sovereignty 
  - Data 분산 방법의 선택
  - Autonomous 관리
  - AI - Autonomous Database Select AI도 지원되므로 사용자는 데이터의 구조나 위치를 알 필요 없이 LLM 지원 자연어 쿼리를 사용하여 분산 데이터베이스에 액세스할 수 있습니다.
  - Simple Application 개발 - 글로벌 분산 자율 데이터베이스는 애플리케이션에 통합된 논리적 데이터베이스 보기를 제공합니다. 클라우드 네이티브 기능과 Oracle Database의 풍부한 기능 세트에 대한 지원은 최신 애플리케이션을 위한 이상적인 플랫폼을 제공합니다. 자동화되고 투명한 데이터 배포 및 액세스는 분산 애플리케이션 개발을 단순화합니다.

- Global Distributed Autonomous Database 가 필요한 경우
  - 트랜잭션 처리 및 혼합 워크로드를 위한 대규모 성능 달성
  - 분산 Datawarehouse 및 Data Lake 에 대한 데이터 주권 요구 사항을 해결
  - 동시 Data Pipeline 및 Machine Learning 분석 배포
  - Mission Critical 애플리케이션에 최대 가용성 제공
  - 클라우드 기반의 확장 가능한 애플리케이션 구축

- Global Distributed Autonomous Database Concept
![OCIGGSA](/assets/img/dataplatform/2024/release_note/202402/07_oci_global_distributed_adb.png)

- Global Distributed Autonomous Database Pricing
![OCIGGSA](/assets/img/dataplatform/2024/release_note/202404/01_oci_global_adb_price.png)

## OCI GoldenGate Data Transforms is now available
* **Services:** GoldenGate
* **Release Date:** March 5, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/6d6ca6c7-ca82-4900-8a22-04b19f092ef0/](https://docs.oracle.com/iaas/releasenotes/changes/6d6ca6c7-ca82-4900-8a22-04b19f092ef0/){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OCI GoldenGate를 사용할 수 있는 모든 Commercial Region 에서 데이터 변환을 사용할 수 있습니다.

- Data Tranforms Concept
  - 강력한 Data Tranformations
    - 입증된 Data Transformation 아키텍쳐
    - 클라우드 데이터베이스에 최적화된 High Performance ELT
    - OCI GoldenGate 와의 Linkage
  - 100 개 이상의 Buit-in Connections
    - Fusion Apps 와 Salesforce 를 포함한 Popular Apps (ERP) 지원
    - 범용적인 Data Warehouse 와 OLTP DB 지원
  - 최대 유연성 과 자동화 지원
    - 필요에 따라 3배까지 Auto-Scale 설정 가능
    - 업그레이드, 패치, 백업, 복구에 용이

- OCI GoldenGate Data Transforms 생성 화면
![OCIGGDT](/assets/img/dataplatform/2024/release_note/202404/02_oci_goldengate_odi_01.png)

- OCI GoldenGate Data Transforms Data Flow 설계
![OCIGGDT](/assets/img/dataplatform/2024/release_note/202404/03_oci_goldengate_odi_03.png)

- OCI GoldenGate Data Transforms 와 OCI Data Integration Use Case 에 따른 Positioning
![OCIGGDT](/assets/img/dataplatform/2024/release_note/202404/04_oci_goldengate_odi_vs_ocidi.png)

- OCI Data Integration 과 Oracle Data Integrator 의 Use Case 에 따른 Positioning
![OCIGGDT](/assets/img/dataplatform/2024/release_note/202404/04_oci_odi_vs_oracle_di_02.png)


## Availability of scope information for incremental discovery in Data Safe
* **Services:** Data Safe
* **Release Date:** March 14, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/dfd30fe6-5404-4f9f-bcce-34b9f24aff0e/](https://docs.oracle.com/iaas/releasenotes/changes/dfd30fe6-5404-4f9f-bcce-34b9f24aff0e/){:target="_blank" rel="noopener"}

### 업데이트 내용

- Availability of scope information for incremental discovery in Data Safe : 이제 Data Safe 에서 최신 increamental discovery 는 물론 과거 increamental discovery 의 범위 세부 정보를 볼 수 있습니다. increamental discovery 가 수행된 시기, increamental discovery 를 위해 선택한 스키마, 선택한 민감한 유형, 승인되거나 거부된 열 변경 사항, 변경 사항이 민감한 데이터 모델에 적용되었는지 여부를 볼 수 있습니다.

- Updated checks in Data Safe's Security Assessment : Oracle Data Safe의 보안 평가는 Oracle Database 19c CIS Benchmark v1.2 및 STIG V2R8 for Oracle Database의 추가 검사와 데이터베이스 보안 상태의 변경 사항을 더 쉽게 식별할 수 있는 기타 업데이트로 업데이트되었습니다. [상세 사항](https://docs.oracle.com/iaas/releasenotes/changes/b0c851bb-30f7-4a4b-8859-0729f0719fb0/){:target="_blank" rel="noopener"}
  - CIS ( Center for Information Security ) Benchmark versions [cisecurity.org](https://www.cisecurity.org/benchmark/oracle_database)
    - Oracle Database 19c (1.2.0)
    - Oracle Database 18c (1.1.0)
    - Oracle Database 12c (3.0.0)
    - Oracle Database 11gR2 (2.2.0)
    - Oracle Database Server 11 - 11g R2 (1.0.0)

- Create a sensitive data model manually in Data Safe : 이제 민감한 데이터 모델을 수동으로 생성할 수 있습니다. 이를 통해 검색 실행을 수행하고 원치 않는 열을 모두 제거할 필요 없이 중요한 데이터 모델에 관심 있는 열만 추가할 수 있습니다. [상세 사항](https://docs.oracle.com/iaas/releasenotes/changes/38d05cee-8c5d-447e-928b-f4eea643509e/){:target="_blank" rel="noopener"}

### 주요 기능

- Data Safe 의 Data Discovery 기능 : 데이터베이스의 스키마를 분석하여 어떤 테이블과 열에 민감한 데이터가 포함되어 있는지 파악하고 이 정보를 사용하여 감사 정책을 알리고 마스킹 데이터의 정책을 정의할 수 있도록 도움을 주는 기능
  ![OCIGGSA](/assets/img/dataplatform/2024/release_note/202404/05_oci_datasafe_discovery_01.png)

- Manual Sensitive Data Model 생성
  ![OCIGGSA](/assets/img/dataplatform/2024/release_note/202404/09_oci_datasafe_create_manual_model_05.png)

- Sensitive Data 에 대한 모델 정의 : 회사나 조직에서 다루는 민감 정보들의 유형들을 모아서 Model 로 관리
  ![OCIGGSA](/assets/img/dataplatform/2024/release_note/202404/06_oci_datasafe_discovery_model_02.png)

  ![OCIGGSA](/assets/img/dataplatform/2024/release_note/202404/07_oci_datasafe_discovery_model_03.png)

- Sensitive Data 에 대한 Increamental Discovery (증분 검색) 및 수동 수행
  ![OCIGGSA](/assets/img/dataplatform/2024/release_note/202404/08_oci_datasafe_discovery_inc_discovery_04.png)


## New Release for Data Catalog
* **Services:** Data Catalog, Oracle Cloud Infrastructure
* **Release Date:** March 19, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/c138a058-6919-47de-a7a0-94fdc928c1d1/](https://docs.oracle.com/iaas/releasenotes/changes/c138a058-6919-47de-a7a0-94fdc928c1d1/){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Catalog 의 새로운 릴리스가 반영되었습니다. 버그 수정 및 Enhancement 외에도 이제 다음을 수행할 수 있습니다.

- Oracle Object Storage 데이터 자산의 모든 데이터 엔터티에 대한 사용자 정의 속성을 대량으로 업데이트 할 수 있게 되었습니다. (이전 버전에서는 Oracle Object Storage 데이터 자산의 논리적 엔터티에 대해서만 사용자 정의 속성 대량 업데이트가 가능했었음)

- Private Endpoint 와 SCAN(Single Client Access Name) IP 구성을 사용하여 Autonomous Database Dedicated 인스턴스에 연결이 가능하게 되었습니다. (이전 버전에서는 Autonomous Database Shared 인스턴스에만 연결할 수 있었음)

### 주요 기능

- Data Catalog 의 Concept
  - Data Catalog 는 데이터 소비자가 데이터를 검색하고 거버넌스를 개선하는 데 도움이 되는 메타데이터 관리 서비스입니다. Data Catalog 를 사용하면 데이터 분석가, 데이터 과학자, 데이터 엔지니어 및 데이터 관리자가 사용 가능한 데이터를 검색할 수 있는 환경을 갖게 됩니다.
    ![OCIDCAT](/assets/img/dataplatform/2024/release_note/202404/10_oci_data_catalog_01.png)

- Data Catalog Main 화면
  ![OCIDCAT](/assets/img/dataplatform/2024/release_note/202404/11_oci_data_catalog_main_02.png)

- Harvest 수행 후 수집된 데이터, 테이블의 메타데이터

  ![OCIDCAT](/assets/img/dataplatform/2024/release_note/202404/12_oci_data_catalog_main_03.png)

- Object Storage 데이터 자산의 모든 데이터 엔터티에 대한 사용자 정의 속성을 대량으로 업데이트 (파일 이름 패턴 활용)

  ![OCIDCAT](/assets/img/dataplatform/2024/release_note/202404/13_oci_data_catalog_filename_pattern_04.png)


## Operations Insights is now Ops Insights
* **Services:** Ops Insights
* **Release Date:** March 26, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/9c7b097f-4911-4db3-9d92-2189c8a548e8/](https://docs.oracle.com/iaas/releasenotes/changes/9c7b097f-4911-4db3-9d92-2189c8a548e8/){:target="_blank" rel="noopener"}

### 업데이트 내용

Operation Insights 서비스 명이 Ops Insights 로 이름이 변경되었습니다.

---