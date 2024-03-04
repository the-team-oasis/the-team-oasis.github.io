---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "4월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2023년 4월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-mds
tags:
  - oci-release-notes-2023
  - Apr-2023
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

## MySQL Database Service: Point in Time Recovery (PITR) for High Availability (HA) DB Systems
* **Services:** MySQL Database
* **Release Date:** April 6, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/dbd0fff8-d81e-450a-8f24-621487f1ed23/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/dbd0fff8-d81e-450a-8f24-621487f1ed23/){:target="_blank" rel="noopener"}

### 릴리즈 내용
DB 시스템의 데이터를 최신 DB 시스템 또는 특정 시점에 복원 할 수 있습니다. 특정 시점에서 복원 하려면 DB시스템의 백업 계획에서 특정 복구 시점을 활성화 해야합니다. 
- 지정 시간 복구는 약 5분의 RPO를 제공합니다. 
- 일일 백업은 24시간 RPO를 제공합니다.

> 지정 시간 복구를 위해서는 MDS의 초기 데이터 전체 백업이 필수입니다. 

아래 표는 지원되는 시점 복구 시나리오입니다. 

![]({{site.urlblogimg2023}}/assets/img/infrastructure/2023/release-note/SCR-20230428-buss.png " ")



## MySQL Database Service: 128 TB Storage Capacity per DB System
* **Services:** MySQL Database
* **Release Date:** April 6, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/c69d9715-2879-43f7-84c4-3a7fd399f557/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/c69d9715-2879-43f7-84c4-3a7fd399f557/){:target="_blank" rel="noopener"}

### 릴리즈 내용
최대 스토리지로 저장할 수 있는 용량이 128TB까지 확장되었습니다. 

![]({{site.urlblogimg2023}}/assets/img/infrastructure/2023/release-note/SCR-20230427-npcj.png " ")