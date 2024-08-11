---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "5월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2024년 5월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2024-cloudnative-security
tags:
  - oci-release-notes-2024
  - May-2024
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

## Cloud Guard Adds Instance Security
* **Services:** Cloud Guard
* **Release Date:** May 15, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/cloud-guard/using/cgis.htm#cgis](https://docs.oracle.com/en-us/iaas/cloud-guard/using/cgis.htm#cgis){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Cloud Guard에 Computing host에 대한 의심슬운 활동 감지를 위한 Instance Security가 추가되었습니다. Instance Security는 Computing host에 대한 의심스러운 활동을 감지하기 위해 Computing host를 모니터링하는 새로운 Oracle Cloud Guard Detect Service입니다.
Instance Security는 보안 경고(Cloud Guard의 Problem), 취약성, 오픈 포트와 같은 Computing host에 대한 중요한 보안 정보를 수집하여 탐지 및 예방을 위한 지침을 제공합니다. OS 수준 가시성을 통해 의심스러운 프로세스, 오픈 포트 생성, 워크로드에 대한 스크립트 실행을 탐지할 수 있습니다.

![](https://blogs.oracle.com/content/published/api/v1.1/assets/CONTF12356BD0A9A44429EE95571D966A923/Medium?cb=_cache_cb4d&format=jpg&channelToken=f7814d202b7d468686f50574164024ec)

#### Instance Security Detector rules
* SELinux is not enforced on the host
* RPM of un-approved versions found on host.
* Odo container running with non root user
* Odo container root filesystem is not read-only
* Network Time Protocol daemon (ntpd) is not installed or running as expected.
* Local Accounts with stale credentials detected.
* IMDS Version is Deprecated
* Host Metrics are failing.
* Griffin Agent is not installed or running as expected
* Container image not scanned in the last 30 days
* Container image has vulnerabilities
* ClamAV is not installed or running as expected.
* Check Software Inventory.
* Check Container Inventory from Instance
* CHEF is not installed or running as expected.
* Agent is either not installed or not running as expected
* AIDE is not installed or running as expected.

## Support for C# (.NET 8.0)
* **Services:** Functions
* **Release Date:** May 23, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/languagessupportedbyfunctions.htm](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/languagessupportedbyfunctions.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Functions에 C# (.NET) 언어도 지원합니다. 현재 Functions에서 지원하는 언어는 다음과 같습니다.

![](/assets/img/cloudnative-security/2024/2024-05-29-cloudnative-security-release-notes-1.png)
