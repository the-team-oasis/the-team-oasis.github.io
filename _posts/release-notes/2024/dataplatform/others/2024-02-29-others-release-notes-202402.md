---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "2월 OCI Database Service - Others 업데이트 소식"
teaser: "2024년 2월 OCI Database Service - Others 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-others
tags:
  - oci-release-notes-2024
  - Feb-2024
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

## OCI Database with PostgreSQL adds support for additional shapes
* **Services:** OCI Database with PostgreSQL
* **Release Date:** Feb. 26, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/343483cf-6c53-4b86-b63c-5124fba99e2e/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/343483cf-6c53-4b86-b63c-5124fba99e2e/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 기존에 AMD Epyc 프로세서 기반의 VM 인스턴스만 지원하던 OCI Database with PostgreSQL 서비스가 Intel Xeon 기반의 VM 인스턴스를 지원하게 되었습니다.
새롭게 추가된 Shape은 아래와 같습니다.
- PostgreSQL.VM.Standard3.Flex.2.32GB
- PostgreSQL.VM.Standard3.Flex.4.64GB
- PostgreSQL.VM.Standard3.Flex.8.128GB
- PostgreSQL.VM.Standard3.Flex.16.256GB
- PostgreSQL.VM.Standard3.Flex.32.512GB

![](/assets/img/dataplatform/2024/release_note/others/postgresql_shape.png " ")