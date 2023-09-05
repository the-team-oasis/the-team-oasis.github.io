---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "3월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 3월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - March-2023
  - Infrastructure
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

## X9-based virtual machine GPU shapes for Compute instances
* **Services:** Compute
* **Release Date:** March 1, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/7cbf2532-ffb0-42f2-82e0-c1442a724873/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/7cbf2532-ffb0-42f2-82e0-c1442a724873/){:target="_blank" rel="noopener"}

### 릴리즈 내용
NVIDIA A10 기반의 GPU를 이용한 VM 이 신규로 출시되었습니다. Intel Xeon Platinum 8358. Base frequency 2.6 GHz, max turbo frequency 3.4 GHz 기반으로 그래픽 성능에 최적화되어 있습니다.


## Independently manage instances in a cluster network by using compute clusters
* **Services:** Compute
* **Release Date:** March 28, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/ba4986c3-92b4-476a-adc4-ca55f143b65c/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/ba4986c3-92b4-476a-adc4-ca55f143b65c/){:target="_blank" rel="noopener"}

### 릴리즈 내용
컴퓨팅 클러스터는 고대역폭, 초저지연 네트워크로 연결된 고성능 컴퓨팅(HPC), GPU 또는 최적화된 인스턴스 그룹입니다. 클러스터의 각 노드는 다른 노드와 물리적으로 근접한 곳에 위치한 베어 메탈 머신입니다. 노드 간의 RDMA(원격 직접 메모리 액세스) 네트워크는 온프레미스 HPC 클러스터와 비슷한 한 자릿수 마이크로초의 낮은 레이턴시를 제공합니다.

사용 가능한 리소스의 경우 아래와 같습니다. 
- BM.HPC2.36
- BM.GPU.A100-v2.8
- BM.GPU4.8
- BM.Optimized3.36

![]({{site.urlblogimg2023}}/assets/img/infrastructure/2023/release-note/SCR-20230427-nhsv.png " ")

![]({{site.urlblogimg2023}}/assets/img/infrastructure/2023/release-note/SCR-20230427-niie.png " ")
"전용 컴퓨터 클러스터"를 선택 할 수 있습니다.  


  






