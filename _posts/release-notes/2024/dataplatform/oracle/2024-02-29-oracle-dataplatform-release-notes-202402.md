---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "2월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2024년 2월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2024-dataplatform
tags:
  - oci-release-notes-2024
  - Feb-2024
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

## Globally Distributed Autonomous Database is now in General Availability
* **Services:** Globally Distributed Autonomous Database
* **Release Date:** Feb. 1, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/22a22e7c-f043-49b2-b3c2-2c3e0389de20/](https://docs.oracle.com/iaas/releasenotes/changes/22a22e7c-f043-49b2-b3c2-2c3e0389de20/){:target="_blank" rel="noopener"}

### 업데이트 내용


Oracle Globally Distributed Autonomous Database는 높은 수준의 성능과 가용성, 데이터 주권에 대한 글로벌 기업의 요구 사항을 해결하도록 설계되었습니다. 이를 통해 조직은 고성능과 가용성으로 모든 유형의 데이터를 사용하는 중요한 분산 데이터베이스를 보다 쉽게 실행할 수 있습니다. 결제 처리, 신용 카드 사기 탐지, 개인화된 마케팅, 모바일 메시징, 인터넷 인프라 및 사물 인터넷(IoT)을 포함한 광범위한 애플리케이션에 이상적입니다.

- Key Capabilities
  - High Availability
  - Horizontal Scalability
  - Data Sovereignty 
  - Data 분산 방법의 선택
  - Autonomous 관리
  - AI
  - Simple Application 개발

- Global Distributed Autonomous Database 가 필요한 경우
  - 트랜잭션 처리 및 혼합 워크로드를 위한 대규모 성능 달성
  - 분산 Datawarehouse 및 Data Lake 에 대한 데이터 주권 요구 사항을 해결
  - 동시 Data Pipeline 및 Machine Learning 분석 배포
  - Mission Critical 애플리케이션에 최대 가용성 제공
  - 클라우드 기반의 확장 가능한 애플리케이션 구축

- Global Distributed Autonomous Database Concept
![OCIGGSA](/assets/img/dataplatform/2024/release_note/202402/07_oci_global_distributed_adb.png)



## OCI GoldenGate Stream Analytics is now available
* **Services:** GoldenGate
* **Release Date:** Feb. 12, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/b946d726-d744-47b1-be04-391ac8ba7bf3/](https://docs.oracle.com/iaas/releasenotes/changes/b946d726-d744-47b1-be04-391ac8ba7bf3/){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Stream Analytics 를 OCI 에서 사용할 수 있게 되었습니다.
OCI GoldenGate Stream 는 분석을 사용하여 이벤트 스트림에 대한 실시간 모니터링 및 분석을 제공하는 맞춤형 운영 대시보드 생성 기능을 제공합니다. 관심 있는 event 를 식별하고, event stream 에 대해 실시간으로 쿼리를 실행하거나, 분석을 기반으로 경고를 발생시킬 수 있습니다.

- Stream Analytics Concept
  - Connection : Source 와 Target 에 대한 연결 정보를 저장
  - Stream : 동적인 데이터의 지속적인 흐름
  - Pipeline : Source 로부터 Target 으로의 워크플로우 데이터
  - Business Logic : 분석하려는 정확한 데이터를 얻기 위해 적용할 수 있는 다양한 Filter 와 Function 들 

- 지원되는 Source Connections
  - Oracle Autonomous Database
  - Oracle Database
  - OCI Streaming
  - OCI MySQL Database Service
  - Apache Kafka
  - Confluent Kafka
  - Oracle GoldenGate server

- 지원되는 Target Connections
  - Oracle Autonomous Database
  - Oracle Database
  - OCI Object Storage
  - Apache Kafka
  - OCI Streaming

- OCI GoldenGate Stream Analytics Editor 화면
  ![OCIGGSA](/assets/img/dataplatform/2024/release_note/202402/06_oci_stream_analytics_editor_01.jpg)


##  New release for Data Integration
* **Services:** Data Integration, Oracle Cloud Infrastructure
* **Release Date:** Feb 17, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/2049c802-ec91-4e33-8071-8f7bd0eb58cd/](https://docs.oracle.com/iaas/releasenotes/changes/2049c802-ec91-4e33-8071-8f7bd0eb58cd/){:target="_blank" rel="noopener"}

### 업데이트 내용

새로이 Release 된 Data Integration 을 통해 이제 다음을 수행할 수 있습니다.

- Snowflake를 소스로 연결합니다.
- 일반 REST 소스에 연결할 때 OAUTH 2.0 인증을 사용합니다.
- 작업공간을 내보내고 가져옵니다.
- 개체를 가져올 때 기존 데이터 자산을 제외합니다(사용자 정의 라이브러리 및 함수 제외).

Oracle 데이터 소스(ADW/ATP 제외) 및 Fusion 애플리케이션 소스에 제약이 없는 숫자 열이 있는 경우 이제 다음 조건이 충족되면 숫자 데이터 유형으로 정밀도 없이 숫자를 유지할 수 있습니다.

- 정밀도와 배율이 없는 숫자를 varchar로 처리하는 옵션을 사용합니다(데이터 자산 생성).
- 대상에 새 데이터 엔터티 만들기(데이터 흐름 만들기)

- Data Asset 에 추가된 Data Source
  ![DI](/assets/img/dataplatform/2024/release_note/202402/04_oci_database_integration_01.png)

- Data Integration 변환 (ETL) 설계 - Data Flow
  ![DI](/assets/img/dataplatform/2024/release_note/202402/08_oci_data_integration_02.png)

- Data Integration 변환 (ETL) 설계 - 변환 샘플 데이터 조회
  ![DI](/assets/img/dataplatform/2024/release_note/202402/09_oci_data_integration_03.png)



---