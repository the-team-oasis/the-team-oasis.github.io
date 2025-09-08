---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "Autonomous Database Cloud Service 살펴보기"
teaser: "OCI (Oracle Cloud Infrastructure) 에서 제공하고 있는 Autonomous Database Cloud Service 에 대해 알아봅니다."
author: lim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, database, exadata, autonomous]
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

### 서비스 소개
OCI 에는 오라클 데이터베이스 서비스를 사용할 수 있는 방법이 두가지가 있습니다. 하나는 오라클 데이터베이스를 On-Premise 에서 운영하는 형태와 동일하게 DBA 및 인프라 관리자의 도움을 받아 운영하는 형태의 Oracle Base Database Cloud 서비스와 Exadata Cloud Service 가 하나의 형태이고, DBA 나 인프라 운영 관리자의 도움없이도 완전하게 자동적으로 운영이 가능한 Autonomous Database 서비스가 바로 두번째 형태입니다. 이번 블로그에서는 완전 자동적으로 운영되는 Autonomous Database 에 대해 살펴보기로 합니다.
Autonomous Database 는 완전 자동화된 클라우드 전용의 오라클 데이터베이스 서비스로써 보다 저렴하게 데이터베이스에 대한 관리 부담없이 사용하실 수가 있습니다.

#### Autonomous Database 란?
Autonomous Database 는 오라클 데이터베이스 소프트웨어하고 고성능의 데이터베이스 전용의 Exadata 하드웨어 그리고 오라클의 오랜 노하우인 Best Practice 들이 함께 접목이된 완전 자동화된 클라우드 서비스입니다.

* Autonomous Database 개요

![ADB Overview](/assets/img/dataplatform/2025/blog/oci_adb_overview_01.png " ")

경쟁사 데이터베이스들과 비교를 하자면, 구글의 BigQuery, Snowflake, Databrics 나 ICEBERG 등의 클라우드 전용의 데이터베이스들과 유사한 서비스와 동일 개념의 오라클 데이터베이스 서비스입니다.

최근 Oracle Database 23ai 버전 출시와 함께 많은 Select AI 기능, Vector Search 기능, Generative AI 연동 기능 등이 포함되게 되어 AI 기능이 포함된 어플리케이션 개발에 많이 유용한 데이터베이스 서비스이기도 합니다. 더불어 ML 을 위한 다양한 모델들도 기본 탑재가 되어 있어 데이터 예측 분석이 용이한 데이터베이스 서비스 입니다.

* Autonomous Database 에 포함된 AI 관련 기능

![ADB Overview](/assets/img/dataplatform/2025/blog/oci_adb_overview-ai_02.png " ")

#### Autonomous Database Deployment Options

Autonomous Database 는 워크로드의 형태에 따라 세가지 형태의 Deploy 옵션들을 선택하여 Deploy 하실 수 있습니다.

![ADB Deployment](/assets/img/dataplatform/2025/blog/oci_adb_deployment_options_03.png " ")

**1. Autonomous Transaction Processing (ATP)**

- 워크로드의 형태가 온라인 트랜잭션 위주의 OLTP 성 데이터를 많이 처리해야 하는 데이터베이스가 필요한 경우

**2. Autonomous DataWarehouse (ADW)**

- 워크로드의 형태가 대규모의 데이터를 DW 형태로 데이터를 보관해서 분석 용도로 데이터베이스를 사용하시는 경우

**3. Autonomous JSON Database (AJD)**
- MongoDB 와 같은 DocumentDB 형식의 워크로드를 처리할 경우 (MongoDB API 호환성 제공)


#### Autonomous Database 의 특장점

**1. 빠른 Provisioning**
- Autonomous Database 는 데이터베이스 이름과 관리자 비밀번호만 입력하여 2 ~ 3분만에 빠르게 데이터베이스를 생성하실 수 있습니다.

  ![ADB Deployment](/assets/img/dataplatform/2025/blog/oci_adb_provisioning_07.png " ")

**2. 자동화된 운영**
- Autonomous Database 는 자동 패치, 자동 백업, 자동 스케일링, 자동 튜닝등 대부분의 기능들이 자동화 되어 있습니다. 

  ![ADB Deployment](/assets/img/dataplatform/2025/blog/oci_adb_autonomous_features_04.png " ")

**3. 자동 스케일링**
- 자체적으로 부하에 따라 초기 설정한 CPU 갯수의 3배까지 자동 스케일 아웃이 수행되고, 부하가 줄어들면 초기 설정한 CPU 갯수로 스케일인을 수행해서 서비스 사용 비용을 효과적으로 절감할 수 있습니다.

**4. 다양한 어플리케이션 개발툴 제공**
- Autonomous Database 는 개발자 및 비즈니스 사용자가 직접 데이터베이스를 접근하고 데이터를 로드하고 데이터를 모델링 할 수 있는 다양한 툴들을 제공합니다.

  ![ADB Deployment](/assets/img/dataplatform/2025/blog/oci_adb_database_tools_05.png " ")

**5. 비용 효율성**
- 오라클 데이터베이스 기반의 데이터베이스 서비스이기 때문에 서비스 사용 비용이 고비용이라는 선입견이 있을 수 있으나, 예측 가능하고 매우 합리적인 가격 Pricing을 제공합니다.
특히, 개발자를 위해 8 vCPU (4 ECPU) 상당의 사양을 월 $30 의 비용으로 사용이 가능한 개발자 모드도 제공하고 있어 많은 비용을 절감하실 수 있습니다.

  ![ADB Deployment](/assets/img/dataplatform/2025/blog/oci_adb_price_06.png " ") 

### 마무리
Autonomous Database 내부적으로는 Exadata 기술이 활용되고 있어서 매우 빠른 성능을 보장하고, 데이터베이스 운영과 관련해서 완전 자동화가 되어 있고, 빠르게 Deploy 해서 저렴한 비용으로 사용이 가능한 오라클 데이터베이스 PaaS 서비스라고 보시면 되겠고 AI 개발을 위한 많은 기능과 ML 모델들이 내장되어 있습니다. 또한, 
Auto Scaling 기능을 통해서 CPU 를 탄력적으로 확장, 축소가 가능하기 때문에 비용 효율적으로 사용이 가능하고 어플리케이션 개발에 많은 도움을 줄 수 있는 서비스입니다.

### 추가 참고 자료
- [Autonomous Database Cloud Service Hands-On - Provisioning, Object Storage Parquet Data Load 하기](https://the-team-oasis.github.io/dataplatform/Autonomous-database-cloud-service-overview/)

---

