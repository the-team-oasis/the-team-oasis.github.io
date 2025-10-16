---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "9월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 9월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - September-2025
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

## Container Security Configuration for OKE in Cloud Guard
* **Services:** Cloud Guard
* **Release Date:** September 02, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/cloud-guard/using/container.htm](https://docs.oracle.com/en-us/iaas/Content/cloud-guard/using/container.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Cloud Guard에서 Container Security Configuration Detector 레시피를 통해 OKE Cluster내 컨테이너 실행 환경 보안, 운영, 조직 정책 위반 사항을 자동 감지할 수 있습니다. 주요 특징은 다음과 같습니다.

1. 기본 제공 룰(out-of-the-box rules) 제공
2. 정책 위반 자동 감지 및 대응

> Container Security Configuration은 Enhanced Cluster에서만 사용할 수 있습니다.

### Container Security Configuration Detector rules
![](/assets/img/cloudnative-security/2025/2025-09-28-cloudnative-security-release-notes-2.png)

## Key Management Introduces Event Notifications
* **Services:** Key Management, Vault
* **Release Date:** September 16, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Tasks/event_notification.htm](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Tasks/event_notification.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Key, KeyVersion, Vault 리소스의 상태 변경 이벤트를 거의 실시간으로 알림을 받을 수 있습니다. 이를 통해서 Valut 구성 문제 발생 시 빠른 조치가 가능해졌습니다.

Valut 관련 이벤트 유형은 아래 링크에서 확인할 수 있습니다.  
[Events for Vaults and Keys](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Tasks/event_notification.htm)

> 이벤트 구성은 OCI Event 서비스에서 구성할 수 있습니다.