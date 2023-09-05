---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "3월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 3월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Mar-2023
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


##  Data Flow Supports Arm-Based Compute Shapes
* **Services:** Data Flow
* **Release Date:** March 1, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/ada5da89-7e43-4ee9-ad81-b70054aee27b/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/ada5da89-7e43-4ee9-ad81-b70054aee27b/){:target="_blank" rel="noopener"}

### 서비스 소개

OCI Data Flow는 Apache Spark ™ 애플리케이션을 실행하기 위한 완전 관리형 서비스입니다. 개발자가 애플리케이션에 집중할 수 있도록 하고 이를 실행할 수 있는 쉬운 런타임 환경을 제공합니다. 

OCI Data Flow 서비스에서 이제 driver 및 executor 에 대한 ARM 기반 컴퓨팅 Shape 을 선택할 수 있습니다.

ARM 프로세서는 가격이 저렴하고, Linear 한 Scaling 이 가능하고 보안이 내장되어 있는 단일 Thread 코어 아키텍쳐를 가지고 있는 프로세서로써 폭넓은 개발자 에코시스템을 보유하고 있는 프로세서 입니다.

- Ampere (Altra Processor) A1 이 적합한 Case
  - 컨테이너화된 workloads
  - In-memory 기반 databases (MySQL 포함)
  - Web application
  - Media encoding
  - AI 와 Machine learning (ML) inferencing
  - Mobile apps 과 game 개발
  - High performance computing (HPC)

- Data Flow 의 ARM Processor Shape 선택 화면

![OCI GoldenGate]({{site.urlblogimg2023}}/assets/img/dataplatform/2023/release_note/202303/08.data_flow_arm.png)

##  New maintenance features available for GoldenGate
* **Services:** GoldenGate
* **Release Date:** March 14, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/cb6d73a2-1dc7-46e1-8895-658ed9539b6d/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/cb6d73a2-1dc7-46e1-8895-658ed9539b6d/){:target="_blank" rel="noopener"}

### 서비스 소개

OCI 의 GoldneGate 서비스에 대해 이제 업그레이드를 예약하고, 업그레이드 알림을 구독하고, 업그레이드 알림을 일시 중지하고, 업그레이드를 롤백할 수 있습니다.

- 자동 업그레이드 - OCI GoldenGate Deployment 의 Upgrades 메뉴에서 아래와 같이 Patch 가 필요한 내역들이 나타나게 되며, 일정 기간이 경과 후 자동으로 업그레이드를 진행합니다.

- Unpgrade Now - 바로 업그레이드가 진행되고 다운타임이 발생합니다.

- Snooze - Patch 적용을 원하는 시간에 수행하기 위해 자동 업그레이드를 중지할 수 있습니다.

![OCI GoldenGate]({{site.urlblogimg2023}}/assets/img/dataplatform/2023/release_note/202303/02.oci_goldengate_upgrade.png)

##  New Database Summary Daily and Database Summary Hourly data objects
* **Services:** Operation Insights
* **Release Date:** March 14, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/28a401ff-c258-4457-a9e8-3d5d2e4c577f/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/28a401ff-c258-4457-a9e8-3d5d2e4c577f/){:target="_blank" rel="noopener"}

### 서비스 소개

신규 데이터베이스 Database Summary Daily 및 Database Summary Hourly 데이터 개체를 Database Explorer 및 Host Explorer에서 사용할 수 있습니다.

- Data Object 란?
  - Data Object 는 Operations Insights 서비스에 대해 수집된 고도로 선별된 데이터를 Explorer user interface 에서 사용할 수 있는 데이터를 말합니다. 원시 데이터 수집은 사후 처리되고 관련 엔터티 구성으로 결과 집합을 쉽게 생성할 수 있습니다.

- Host Explorer 화면 예

![Host Explorer]({{site.urlblogimg2023}}/assets/img/dataplatform/2023/release_note/202303/01.host_explorer.png)


##  New Release for Data Integration
* **Services:** Data Integration
* **Release Date:** March 20, 2023
* **Documentation:** [hhttps://docs.oracle.com/en-us/iaas/releasenotes/changes/080636ba-37f0-46b2-bd89-1ebf7900e0dc/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/080636ba-37f0-46b2-bd89-1ebf7900e0dc/){:target="_blank" rel="noopener"}

### 서비스 소개

Data Integration 서비스에 새로운 신규 기능과 Bug Fix 가 반영된 신규 Release 가 반영이 되었습니다.

- 신규 기능
  - Workspace 내에서 또는 다른 Workspace 로 프로젝트 및 해당 디자인 Artifacts 로 복사하는 기능
  - 미리 빌드된 템플릿에서 애플리케이션을 생성
  - Data Integration 에서 Public Logging 사용이 가능하고 OCI 로깅을 사용하여 Log data 에 액세스
  - Data Flow 와 연결된 게시된 작업에서 통합 작업의 복사본을 저장하는 기능
  - 계산식 (Expression) 및 계층적 데이터 유형을 지원하는 데이터 흐름 연산자와 함께 고차(변환) 함수를 사용하는 기능

- Bug Fix
  - 파이프라인의 REST 작업에서 JSON 출력의 추출 문제를 수정
  - 원본 테이블에 특수 문자가 포함된 열 이름이 있는 경우 작업 실행 실패 문제 해결
  - 파이프라인을 열 때 REST 작업의 매개변수화된 요청 본문이 손상되는 문제를 수정
  - 수신 매개변수 값이 JSON 출력 SYS.RESPONSE_PAYLOAD_JSON 또는 SYS.RESPONSE_HEADERS_JSON인 경우 파이프라인에서 다운스트림 SQL 작업 실행 실패 문제를 해결

---
