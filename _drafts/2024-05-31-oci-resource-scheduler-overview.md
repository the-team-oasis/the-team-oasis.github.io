---
layout: page-fullwidth
#
# Content
#
subheadline: "Governance & Administration"
title: "OCI Resource Scheduler Overview"
teaser: "OCI Resource Scheduler는 OCI 자원에 대한 시작/중지 스케쥴링을 지원해주는 서비스입니다. OCI Resource Scheuler를 통해서 OCI 자원 비용을 절감할 수 있습니다."
author: dankim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, resource scheduler]
#published: false

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

### OCI Resource Scheduler란
OCI Resource Scheduler는 OCI에서 사용하는 자원에 대해서 필요할 때만 사용하도록 스케쥴링을 통해서 관리해주는 서비스입니다. 이 기능을 통해서 리소스에 대한 수명 주기 및 운영 시간을 관리하여 운영 비용을 최소화 할 수 있습니다.

현재 지원되는 OCI 자원은 다음과 같습니다.
* Compute Instance
* Autonomous Database

### OCI Resource Scheduler 이점
* **비용 절감:** 사용하지 않을 때 자동으로 리소스를 중지하는 스케쥴러를 활용하면 리소스에 대한 사용 비용을 절감할 수 있습니다.
* **효율적인 자원 관리:** 다양한 자원 관리 모범 사례를 적용할 수 있습니다. 예를 들어 테스트, 개발과 같은 단기간 사용하는 자원을 효과적으로 관리할 수 있습니다. (사용예: 관리자는 테스트 혹은 데모용 리소스들을 특정 시간에 시작하고, 필요하지 않을 때 자동으로 중지할 수 있도록 스케쥴링 합니다.)