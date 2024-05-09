---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "3월 OCI Database Service - Others 업데이트 소식"
teaser: "2024년 3월 OCI Database Service - Others 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-others
tags:
  - oci-release-notes-2024
  - Mar-2024
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

## Search with OpenSearch now supports OpenSearch version 2.11
* **Services:** Search Service with OpenSearch
* **Release Date:** March 13, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/69cff0e5-0db2-4f97-83d9-809559f0f141/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/69cff0e5-0db2-4f97-83d9-809559f0f141/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 OCI Search with OpenSearch 에서 OpenSearch 버전 2.11을 지원합니다.
2.11 버전에서 추가된 기능은 아래와 같습니다.

- 커스텀 모델을 활용한 Semantic search 를 지원 합니다. [관련 문서](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/semanticsearch.htm){:target="_blank" rel="noopener"}
- OCI Generative AI 서비스에서 호스팅하는 LLM 모델에 대한 외부 커넥터와의 대화 검색 기능을 지원 합니다. [관련 문서](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/ocigenaiconnector.htm){:target="_blank" rel="noopener"}
- 마이너 버전 업그레이드를 위한 인라인 업그레이드를 지원 합니다.
- 레포팅 기능과 쿼리 워크벤치, 향상된 테이블 기능과 함께 추가적인 플러그인을 지원합니다.

### 업그레이드 방법
업데이트 발표된 이후 새롭게 생성하는 OpenSearch 클러스터는 기본적으로 OpenSearch 2.11 클러스터로 생성됩니다. 
기존 클러스터는 이전 버전의 OpenSearch를 계속 사용하지만 아래 방식 중 하나를 사용하여 버전 2.11로 업그레이드할 수 있습니다:
- OpenSearch 2.3 클러스터를 사용하는 경우 : [OCI OpenSearch 2.3 버전에서 2.11 버전으로 업그레이드 하기](https://the-team-oasis.github.io/cloudnative/opensearch-2.11-upgrade-from-2.3/){:target="_blank" rel="noopener"}
- OpenSearch 1.2.4 클러스터를 사용하는 경우 : [OpenSearch 클러스터 업그레이드 하기](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Tasks/upgradingacluster.htm){:target="_blank" rel="noopener"}