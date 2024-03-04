---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "7월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2023년 7월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-mds
tags:
  - oci-release-notes-2023
  - July-2023
  - MDS
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

## MySQL HeatWave: Support for MySQL Versions 8.1.0 and 8.0.34
* **Services:** MySQL HeatWave
* **Release Date:** July 25, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/077fc5aa-ab62-4cce-8628-dbb48b524541/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/077fc5aa-ab62-4cce-8628-dbb48b524541/){:target="_blank" rel="noopener"}

## 릴리즈 내용

MySQL HeatWave는 이제 MySQL 데이터베이스 8.1.0 및 8.0.34 버전을 지원합니다.



## MySQL HeatWave: New metrics for resource allocation and utilization
* **Services:** MySQL HeatWave
* **Release Date:** July 6, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/388c0986-611d-4535-b3cd-bf646fb761e8/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/388c0986-611d-4535-b3cd-bf646fb761e8/){:target="_blank" rel="noopener"}

## 릴리즈 내용

MySQL HeatWave는 이제 6개의 새로운 메트릭을 지원하여 MySQL DB 시스템의 리소스 할당 및 사용률을 모니터링, 비교, 알람을 생성할 수 있습니다. 콘솔의 통합 가시성 및 관리->모니터링->메트릭 탐색기에서 다음과 같은 새로운 메트릭을 oci_mysql_database 네임스페이스에서 볼 수 있습니다.

* OCPU 할당
* OCPU 사용량
* 메모리 할당
* 메모리 사용량
* 저장소 할당됨
* 저장소 사용
