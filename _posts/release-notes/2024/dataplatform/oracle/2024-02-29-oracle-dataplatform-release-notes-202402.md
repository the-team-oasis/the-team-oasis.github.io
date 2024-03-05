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
  ![Data Safe](/assets/img/dataplatform/2024/release_note/202402/04_oci_database_integration_01.png)

---