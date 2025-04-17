---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "1월 OCI Infrastructure 업데이트 소식"
teaser: "2025년 1월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2025-infrastructure
tags:
   - oci-release-notes-2025
   - Jan-2025
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



## Windows Server: Microsoft Bring Your Own License
* **Services**: Compute
* **Release Date**: December 10, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/compute/microsoft-byol-support.htm](https://docs.oracle.com/iaas/releasenotes/compute/microsoft-byol-support.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Microsoft Flexible Virtualization Benefit을 활용하여 Windows Server에 대한 BYOL(Bring Your Own License, 자체 라이선스 사용)이 가능합니다.

1. Flexible Virtualization Benefit이란?
- Microsoft 라이선스를 사용자가 직접 가져와(BYOL) 원하는 클라우드에서 사용할 수 있도록 하는 제도
2. 기존과 달라진 점

   •기존: Microsoft 라이선스는 특정 승인된 클라우드(Authorized Outsourcer)에서만 사용 가능
   •이제: 더 많은 클라우드 서비스 제공업체에서 공유 서버에서도 사용 가능

3. 어떤 제품이 해당되나요?

   ✔ Windows Server

   ✔ SQL Server

   ✔ Microsoft 365 Apps (Office, Windows 10/11 등)

   ✔ 기타 Microsoft 서버 제품

4. 어떤 클라우드에서 사용할 수 있나요? 
   - Microsoft가 제한한 “Listed Provider”(예: AWS, Google Cloud)는 사용 불가 하지만 Oracle Cloud(OCI), IBM Cloud 같은 클라우드에서는 사용 가능

5. 왜 유용한가요?

   ✔ 원하는 클라우드에서 비용 절감 가능

   ✔ 특정 클라우드에 종속되지 않고 유연하게 운영 가능

   ✔ 기존 라이선스를 그대로 활용(BYOL) 할 수 있어 비용 효율적


## Private IP address support for Object Storage
* **Services**: Object Storage
* **Release Date**: August 27, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/objectstorage/private_endpoints.htm](https://docs.oracle.com/iaas/releasenotes/objectstorage/private_endpoints.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 **프라이빗 엔드포인트(Private Endpoints)**를 지원하여 가상 클라우드 네트워크(VCN) 또는 온프레미스 네트워크에서 프라이빗 IP 주소를 사용하여 Object Storage 서비스에 접근할 수 있습니다.
- 프라이빗 엔드포인트는 **VCN의 특정 서브넷에 속하는 VNIC(가상 네트워크 인터페이스 카드)**를 통해 생성됨
- 퍼블릭 인터넷을 거치지 않고 내부 네트워크를 통해 직접 Object Storage에 접근 가능
- 프라이빗 엔드포인트를 사용하면서도 퍼블릭 엔드포인트 및 서비스 게이트웨이와 병행하여 사용 가능

