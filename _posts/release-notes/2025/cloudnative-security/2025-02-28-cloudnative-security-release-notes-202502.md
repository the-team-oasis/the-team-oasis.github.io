---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "2월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 2월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - Jan-2025
  - cloudnative
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

## Cross Cluster Connections in OCI Search with OpenSearch
* **Services:** Search with OpenSearch
* **Release Date:** February 10, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/search-opensearch/opensearchcrossclustersearch.htm](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/opensearchcrossclustersearch.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OCI Search with OpenSearch가 Cross Cluster 연결을 지원하여, 여러 OpenSearch Cluster에서 데이터를 검색하고 분석할 수 있어 분산된 데이터 소스로부터 더 깊은 인사이트를 얻을 수 있게 되었습니다.

Cross Clluster 연결은 Inbound Cluster(데이터를 제공받는 클러스터) 및 Outbound Cluster(데이터를 제공하는 클러스터) 모두 OpenSearch 2.15 이상이어야만 사용할 수 있습니다.

### Limits and Considerations🔗
* Tenancy당 최대 5개의 Cluster까지만 Cross Cluster 구성이 가능합니다.
* 동일한 OpenSearch 버전 또는 하나 낮은 버전과만 연결할 수 있습니다.
* 동일한 OC1 리전 또는 OC1 영역(realm) 내 모든 리전 간 연결을 지원합니다.

## Cross Cluster Replication in OCI Search with OpenSearch
* **Services:** Search with OpenSearch
* **Release Date:** February 28, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/search-opensearch/opensearchcrossclustersearch.htm#crossclusterreplication](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/opensearchcrossclustersearch.htm#crossclusterreplication){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OCI Search with OpenSearch가 Cross Cluster Replication을 지원하여, 하나의 OpenSearch Cluster(Outbound Cluster)에서 다른 OpenSearch Cluster(Inbound Cluster)로 Index, Mapping, Metadata를 복제할 수 있습니다. 이후 Outbound Cluster에서 발생하는 모든 작업(documents creating, updating, or deleting)이 Inbound Cluster로 복제됩니다.

### 사용될 수 있는 시나리오
* Primary Cluster에 장애가 발생할 경우 전환할 수 있는 Standby Cluster로 사용
* 지리적으로 분산된 지역에서 사용자와 가깝게 위치한 지역에 데이터를 복제하여 빠른 쿼리 성능 제공
* 여러 클러스터 간에 쿼리 및 인덱싱 로드 분산 (Active-Active)

Inbound Cluster와 Oubound Cluster간 네트워크 지연, Oubound Index의 빈번한 업데이트 크기와 빈도, 두 Cluster의 자원 가용성에 따라 복제 성능에 영향을 받을 수 있습니다.

## Kubernetes Engine support for 5000 worker nodes per Kubernetes cluster
* **Services:** Kubernetes Engine
* **Release Date:** February 28, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm#Container_Engine_for_Kubernetes_Limits](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm#Container_Engine_for_Kubernetes_Limits){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Enhanced Cluster에서 Flannel CNI plugin을 사용하는 경우 하나의 Cluster에서 최대 5,000개의 노드를 지원합니다. 만약 VCN-Native Pod Networking CNI plugin을 사용하는 경우라면, 최대 2,000개의 노드를 지원합니다.

참고로 Basic cluster는 1,000개의 노드 지원.