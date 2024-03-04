---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "9월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 9월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - Sept-2023
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

## Queue now supports channels
* **Services:** Queue
* **Release Date:** Sept. 6, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/cb2c5cca-e9b6-43a1-a391-051b0e7a39a1/](https://docs.oracle.com/iaas/releasenotes/changes/cb2c5cca-e9b6-43a1-a391-051b0e7a39a1/){:target="_blank" rel="noopener"}

### 릴리즈 내용

큐에서 채널을 지원합니다. 대기열에서의 임시 저장소입니다. 대기열에 임시의 저장소를 두어서 병목 현상을 처리 할 수 있게 해 줍니다.

채널은 단일 대기열 내에서 주소 지정이 가능한 개별 대상의 수를 늘려 더 나은 확장을 가능하게 합니다.

![](/assets/img/infrastructure/2023/queue channel01.png)


## IPv6 addressing at Compute instance launch
* **Services:** Compute,Networking
* **Release Date:** Sept. 5, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/e5e38fe2-20b7-411d-b378-1133020f84fc/](https://docs.oracle.com/iaas/releasenotes/changes/e5e38fe2-20b7-411d-b378-1133020f84fc/){:target="_blank" rel="noopener"}

### 릴리즈 내용

컴퓨트 인스턴스에 연결된 VNIC에 IPv6 주소를 할당할 수 있습니다.  할당된 IP 주소는 시작 후 즉시 인스턴스에 액세스할 수 있습니다.
> IPv6로 인스턴스를 사용하려면 인스턴스가 시작되는 VCN과 서브넷을 IPv6 주소로 구성해야 합니다.

