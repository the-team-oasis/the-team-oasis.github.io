---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "4월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 4월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - April-2023
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

## Support for preemptible capacity when configuring node pool placement
* **Services:** Container Engine for Kubernetes
* **Release Date:** April 4, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengusingpreemptiblecapacity.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengusingpreemptiblecapacity.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 OKE 노드 풀에서 Worker Node 인스턴스의 Capacity 유형으로 Preemptible capacity를 지정할 수 있습니다. Preemptible Capacity를 사용하면 Preemptible 인스턴스를 사용하여 짧은 기간 동안만 실행해야 하거나 용량 회수 시 중단될 수 있는 워크로드를 실행함으로써 비용을 절감할 수 있습니다. Preemptible 인스턴스는 일반 컴퓨팅 인스턴스와 동일하게 작동하지만 다른 곳에서 필요할 때 용량이 회수되고 인스턴스가 종료됩니다.

Preemptible 인스턴스가 종료되면 OKE에 알려지게 되며, 노드 인스턴스가 종료되기전에 다음과 같은 상태가 됩니다.
* kube-scheduler가 해당 노드에 새 포드를 배치하지 못하도록 Worker Node를 통제하게 됩니다.
* Pod을 안전하게 제거하기 위해 Worker Node를 Drain하며, Pod의 컨테이너가 정상적으로 종료되고 필요한 정리를 수행하도록 합니다.

Preemptible Capacity를 지정하기 위해서는 Cluster 생성 시 Custom Create (사용자 지정 생성)하여야 하며, Pool 구성에서 Preemptible Capacity를 선택할 수 있습니다. 또한 생성된 Cluster에서도 Node Pool을 추가할 경우 지정하여 생성할 수 있습니다.

![]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2023/2023-04-28-cloudnative-security-release-notes-1.png)

## Support for Kubernetes version 1.26.2
* **Services:** Container Engine for Kubernetes
* **Release Date:** April 25, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/b4d16d65-6cbf-4304-a10f-5a51382e1072/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/b4d16d65-6cbf-4304-a10f-5a51382e1072/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Kubernetes 1.25.4 및 1.24.1 외에도 1.26.2 버전을 추가로 지원합니다. 이에 따라 OKE에서는 2023년 6월 1일에 Kubernetes 버전 1.23.4에 대한 지원을 중단합니다. 이에 따라 1.23.4 버전에 대한 다음 작업을 수행할 수 없게 됩니다.

* Kubernetes 버전 1.23.4를 실행하는 새 클러스터를 만듭니다.
* Kubernetes 버전 1.23.4를 실행하는 기존 클러스터에 새 노드 풀을 추가합니다.

## Support for service mesh and performance improvements when using the VCN-Native CNI plugin
* **Services:** Container Engine for Kubernetes
* **Release Date:** April 26, 2023
* **Documentation:** [https://docs.cloud.oracle.com/iaas/Content/ContEng/Concepts/contengpodnetworking_topic-OCI_CNI_plugin.htm](https://docs.cloud.oracle.com/iaas/Content/ContEng/Concepts/contengpodnetworking_topic-OCI_CNI_plugin.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
OCI VCN-Native Pod Networking CNI 플러그인에서는 이제 다음과 같은 추가 기능을 제공합니다.

1. OCI Service Mesh, Istio 및 Linkerd와 같은 Service Mesh 솔루션을 지원합니다. 단, 현재는 Oracle Linux 7만 지원하며, Oracle Linux 8은 향후 지원할 예정입니다.
2. 네트워크 성능이 대폭 개선이 됩니다.