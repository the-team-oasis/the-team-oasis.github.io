---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "11월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 11월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - November-2025
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

## Kubernetes Engine support for clusters containing both managed node pools and virtual node pools
* **Services:** Kubernetes Engine
* **Release Date:** November 06, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcomparingvirtualwithmanagednodes_topic.htm](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcomparingvirtualwithmanagednodes_topic.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OKE 에서 하나의 클러스터에 Managed Node Pool 과 Virtual Node Pool을 동시에 포함하는 클러스터를 생성할 수 있으며, 기존 클러스터에도 두 유형의 노드 풀을 추가할 수 있도록 지원합니다. 기존에는 클러스터가 Managed Node Pool만 사용하거나, Virtual Node Pool만 사용하는 방식 중 하나만 가능했지만, 이번 개선으로 이러한 제약이 사라졌습니다. 
하나의 클러스터 안에 Managed Node Pool, Virtual Node Pool, Self-managed Node를 모두 함께 구성할 수 있게 되면서, 워크로드 특성에 따라 유연한 노드 운영과 혼합 아키텍처 구성이 가능해졌습니다.

## Support for using image URI to get image details
* **Services:** Container Registry
* **Release Date:** November 14, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/Registry/Tasks/registryviewingimagedetails.htm](https://docs.oracle.com/en-us/iaas/Content/Registry/Tasks/registryviewingimagedetails.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI Container Registry 서비스에서 이미지 정보를 조회할 때, 이미지 OCID 대신 이미지의 URI(Image URI)를 사용하여 조회할 수 있는 기능이 추가되었습니다. 이제 CLI나 API를 통해 이미지 세부 정보를 가져올 때 OCID뿐 아니라 Image URI를 식별자(identifier)로 사용할 수 있습니다.

### CLI 사용 예시
#### Using the image's OCID to get image details:
```shell
oci artifacts container image get --image-id ocid1.containerimage.oc1.phx.0.ansh81vru1zp.aaaaaaaalqzjyks...
```

#### Using the image's URI to get image details:
```shell
oci artifacts container image lookup --image-uri ansh81vru1zp/project01/acme-web-app:v2.0.test
```

