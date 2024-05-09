---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "3월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2024년 3월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2024-cloudnative-security
tags:
  - oci-release-notes-2024
  - March-2024
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

## Container-level metrics now available
* **Services:** Container Instances
* **Release Date:** March 8, 2024
* **Documentation:** [https://docs.oracle.com/iaas/Content/container-instances/container-instance-metrics.htm](https://docs.oracle.com/iaas/Content/container-instances/container-instance-metrics.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
기존 Container Instance 수준의 Metrics에 더하여 Container 수준의 Metrics를 추가로 제공합니다.
제공되는 Container Metrics은 다음과 같습니다.

* **ContainerCpuUsed:** Container CPU 리소스 누적 사용량입니다.
* **ContainerEphemeralStorageUsed:** Container에서 사용하는 임시 스토리지 사용량입니다.
* **ContainerMemoryUsed:** Container에서 사용하는 총 메모리 사용량입니다.

---

## Support for Kubernetes version 1.29.1
* **Services:** Container Engine for Kubernetes
* **Release Date:** March 28, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/b9e628eb-fa59-442a-b2dc-3bda645bff8b/](https://docs.oracle.com/iaas/releasenotes/changes/b9e628eb-fa59-442a-b2dc-3bda645bff8b/){:target="_blank" rel="noopener"}

### 업데이트 내용
OKE에 Kubernetes 1.29.1 버전이 추가되었습니다. 이로써 기존 1.26.7버전은 2024년 4월 29일부터 더 이상 지원하지 않습니다.

현재 지원 버전 1.29.1, 1.28.2, 1.27.2, 1.26.7