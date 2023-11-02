---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "10월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2023년 10월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-mds
tags:
  - oci-release-notes-2023
  - Oct-2023
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

## MySQL HeatWave: Read Replicas with different Shapes, Configurations, and Versions
* **Services:** MySQL HeatWave
* **Release Date:** Oct. 6, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/fce26cd1-0560-4394-b0a5-a632cdf9adda/](https://docs.oracle.com/iaas/releasenotes/changes/fce26cd1-0560-4394-b0a5-a632cdf9adda/){:target="_blank" rel="noopener"}

## 릴리즈 내용

다양한 형태, 구성 및 버전으로 MySQL HeatWave에서 읽기 복제본을 사용하여 유연성을 높일 수 있으며, 아래와 같은 장점이 있습니다.

- 특정 구성을 사용하여 읽기 전용 작업에 맞게 읽기 복제본을 조정하여 성능과 리소스 활용도를 최적화할 수 있습니다. 또한 중요한 변경 사항을 구현하기 전에 별도의 복제본을 사용하여 구성을 검증할 수 있습니다. 이러한 사전 예방적 접근 방식은 비즈니스 연속성을 보장할 뿐만 아니라 운영 안정성을 강화합니다.
- 읽기 복제본의 형태를 개별적으로 변경하여 워크로드에 적합한 컴퓨팅 리소스를 선택하고 읽기 작업에 대해 보다 폭넓은 탄력성을 확보하세요.
- 먼저 복제본의 MySQL 버전을 업데이트하고 유효성을 검사한 다음 다른 인스턴스를 업그레이드합니다. 이 방식은 업그레이드 전략, 변경 관리, 위험 완화를 개선합니다.