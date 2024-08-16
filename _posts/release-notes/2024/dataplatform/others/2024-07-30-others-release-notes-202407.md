---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "7월 OCI Database Service - Others 업데이트 소식"
teaser: "2024년 7월 OCI Database Service - Others 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-others
tags:
  - oci-release-notes-2024
  - July-2024
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

## OCI Database with PostgreSQL adds support for additional performance tiers
* **Services**:OCI Database with PostgreSQL
* **Release Date**: July 10, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/postgresql/additional-performance-tiers.htm](https://docs.oracle.com/en-us/iaas/releasenotes/postgresql/additional-performance-tiers.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 OCI Database with PostgreSQL 서비스의 Storage 성능 옵션이 추가 되었습니다. 추가된 옵션은 아래와 같습니다.
- 375,000 IOPS
- 450,000 IOPS
- 525,000 IOPS
- 600,000 IOPS
- 675,000 IOPS
- 750,000 IOPS

![](/assets/img/aiml/2024/release/202407-postgresql.png " ")

### 제약사항
375K IOPS 이상의 옵션을 사용하려면 최소 16 OCPUs 이상의 Shape을 선택해야 합니다. 
