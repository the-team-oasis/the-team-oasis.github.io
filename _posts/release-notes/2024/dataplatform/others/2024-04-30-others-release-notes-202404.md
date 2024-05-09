---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "4월 OCI Database Service - Others 업데이트 소식"
teaser: "2024년 4월 OCI Database Service - Others 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-others
tags:
  - oci-release-notes-2024
  - Apr-2024
  - Others
  - Redis
  - OCI Cache with Redis
  - PostgreSQL
  - OCI Database with PostgreSQL
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

## Cache with Redis support for Network Security Groups (NSGs)
* **Services**:OS Management Hub
* **Release Date**: April 23, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/f54b1d6a-4a74-4aa1-a039-5c98e5904ed7/](https://docs.oracle.com/iaas/releasenotes/changes/f54b1d6a-4a74-4aa1-a039-5c98e5904ed7/){:target="_blank" rel="noopener"}

### 업데이트 내용
Redis 생성중에 네트워크 보안 그룹(NSG) 사용하여 Redis 대한 네트워크 보안 설정을 할 수 있게 되었습니다.
NSG는 Security List 보다 정교하게 규칙이 적용되는 대상 서버를 그룹으로 한정할 수 있다는 장점이 있습니다.

![](/assets/img/infrastructure/2024/SCR-20240509-irrj.png " ")
