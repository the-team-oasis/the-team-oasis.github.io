---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "10월 OCI Database Service - Others 업데이트 소식"
teaser: "2023년 10월 OCI Database Service - Others 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-others
tags:
  - oci-release-notes-2023
  - Oct-2023
  - Others
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

## Cache with Redis is now available
* **Services:** Cache with Redis, Oracle Cloud Infrastructure
* **Release Date:** Oct. 17, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/ac53961a-195c-4e30-be4b-4835e53fcebe/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/ac53961a-195c-4e30-be4b-4835e53fcebe/){:target="_blank" rel="noopener"}

### 서비스 내용
OCI Cache with Redis 는 애플리케이션을 위한 메모리 기반 스토리지 솔루션인 Redis 클러스터를 구축하고 관리할 수 있는 관리형 서비스로 보안 업데이트와 같은 작업을 포함하여 클러스터의 관리 및 작업을 처리합니다.
클러스터의 한 노드는 항상 기본 노드로 구성되고 다른 노드는 복제본으로 구성됩니다. 클러스터의 모든 노드는 동일한 지역에 있지만 OCI Cache with Redis 서비스는 이를 최대한 결함 도메인과 가용성 도메인(여러 가용성 도메인 지역용)에 분산되도록 구성합니다.
노드 수나 클러스터 노드당 사용 가능한 메모리 양을 늘리거나 줄여 클러스터 크기를 조정할 수 있으며, 중복성을 향상시키기 위해 클러스터의 노드 수를 늘릴 수 있습니다. 
만약 캐시에 더 많은 메모리가 필요한 경우 클러스터당 메모리를 늘릴 수 있습니다. 메모리를 조정하면 더 많은 네트워크 대역폭이 클러스터에 할당되기 때문에 대역폭을 늘려야 할 경우 클러스터의 메모리를 늘리시면 됩니다.

### 제약사항
Cache with Redis 클러스터의 제약사항입니다.
+ 클러스터당 최대 5개 노드 생성 가능
+ 노드당 메모리 최대 500 GB

Region 내에서의 Redis 클러스터의 제약사항
+ 최대 20개 노드 
+ 최대 1000 GB 메모리

### Pricing
가격 정책은 메모리 기준으로 시간당 가격으로 책정되며, 10GB 이하인 경우 GB당 $0.0194, 10GB가 초과분 부터는 GB당 $0.0136 이 부과 됩니다.

#### 예시1. 9GB 노드의 시간당 가격
- 9 GB * $0.0194 / GB / hr -> **$0.1764**

#### 예시2. 12GB 노드의 시간당 가격
- 10 GB * $0.0194 / GB / hr -> **$0.194**
- 2 GB * $0.0136 / GB / hr -> **$0.0272**
- 총 **$0.2212**