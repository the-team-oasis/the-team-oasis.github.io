---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "10월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 10월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - Oct-2023
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


## New Release of VCN Flow Logs
* **Services:** Logging,Networking
* **Release Date:** Oct. 10, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/2be233e2-8717-495a-ba1e-cc96aa1663c3/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/2be233e2-8717-495a-ba1e-cc96aa1663c3/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 캡처 필터를 사용하여 지정한 트래픽에 대해서만 플로우 로그를 생성할 수 있습니다:

- VCN 또는 서브넷의 모든 VNIC에 대해 플로우 로그를 사용하도록 설정하거나 특정 인스턴스, 네트워크 로드 밸런서 또는 리소스 VNIC를 사용 지점으로 지정할 수 있습니다.
- 캡처할 네트워크 흐름의 비율(샘플링 속도)을 지정합니다.
- 지정한 기준에 따라 트래픽을 포함하거나 제외할 규칙을 최대 10개까지 만들 수 있습니다.  
  (예를 들어 소스 또는 대상 IP 주소 또는 CIDR 블록, IP 프로토콜 또는 트래픽이 수신 또는 송신 트래픽의 일부인지 여부에 따라 트래픽을 포함하거나 제외할 수 있습니다.)

![](/assets/img/infrastructure/2023/capture filter01.png)
![](/assets/img/infrastructure/2023/capture filter02.png)
