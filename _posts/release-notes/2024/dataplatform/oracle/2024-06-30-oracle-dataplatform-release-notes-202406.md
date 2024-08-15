---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "6월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2024년 6월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2024-dataplatform
tags:
  - oci-release-notes-2024
  - Jun-2024
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

## GoldenGate adds support for Db2 for z/OS and other connection types
* **Services:** GoldenGate
* **Release Date:** June 05, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/d85978bc-0507-4f24-9867-6169ed82dab2/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/d85978bc-0507-4f24-9867-6169ed82dab2/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

GoldenGate는 이제 IBM Db2 for z/OS 배포를 위한 데이터 복제를 지원하고 Oracle Exadata @ Azure, OCI PostgreSQL, Azure Cosmos DB for PostgreSQL, MySQL Heatware on AWS, MySQL Heatwave on Azure, OCI Redis Cluster, Db2 for z/OS와 같은 새로운 연결 유형을 지원합니다.

- Supported Technology Connections

  ![DB23AI](/assets/img/dataplatform/2024/release_note/202407/13_oci_goldengate_new_connection_01.png)


- What is Db2 for z/OS?
  - Db2 for z/OS는 IBM zSystems 플랫폼에서 실행되는 관계형 데이터베이스 관리 시스템입니다. 
  - z/OS는 IBM의 하드웨어 플랫폼인 IBM zSystems의 주요 운영 체제입니다.

## Base Database: AMD E5 flex shape
* **Services:** Database
* **Release Date:** June 11, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/fac96cd1-1ebb-4ab0-91c2-56b98b591127/index.htm](hhttps://docs.oracle.com/iaas/releasenotes/changes/fac96cd1-1ebb-4ab0-91c2-56b98b591127/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 DB 시스템에 AMD E5 Flexible Shape 을 사용할 수 있습니다. 

- Base Database System Shape 선택 화면
  ![DBCS](/assets/img/dataplatform/2024/release_note/202407/14_oci_dbcs_amd5_01.png)


## Ops Insights Service Configurations
* **Services:** Ops Insights
* **Release Date:** June 15, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/ba669670-8779-4fe3-b022-e4007a3c05bb/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/ba669670-8779-4fe3-b022-e4007a3c05bb/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Service Configuration 을 사용하면 모든 Ops Insights 구성을 단일 위치에서 설정할 수 있습니다. Service Configuration 을 사용하여 Ops Insights가 작동하는 방식과 용량 계획, 필터링 경험 등과 같은 애플리케이션에서 얻을 수 있는 경험을 Tag 를 이용하여 커스터마이징할 수 있습니다.
Ops Insights 메뉴안에서 Resource Tag 를 쉽게 만들고 지정하여 사용할 수 있습니다.

- Resource Tag 를 활용한 Filtering 및 그룹화
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/15_oci_ops_insights_01.jpg)

- 즉시 사용 가능한 태그 기반 필터 만들기
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/16_oci_ops_insights_02.png)


## Base Database: Custom Software Images
* **Services:** Database
* **Release Date:** June 26, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/4648c951-3e1d-4d4a-bcb0-c22595b3c597/index.htm](https://docs.oracle.com/iaas/releasenotes/changes/4648c951-3e1d-4d4a-bcb0-c22595b3c597/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

모든 필수 업데이트가 함께 묶여 고객 환경에서 인증된 Oracle Database 및 Grid Infrastructure 용 Custom Software Image 를 만드는 기능을 통해 개발자와 데이터베이스 관리자는 승인되고 재사용 가능한 "Gold Image"를 구축할 수 있습니다.

- Database 및 Grid Software Custom 이미지 생성 기능
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/17_oci_dbcs_custom_image.png)

- Database 패치가 포함된 Gold Image
  ![OpsInsights](/assets/img/dataplatform/2024/release_note/202407/18_oci_dbcs_custom_image_02.png)



---