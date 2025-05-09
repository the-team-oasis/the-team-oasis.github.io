---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "4월 OCI Infrastructure 업데이트 소식"
teaser: "2025년 4월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2025-infrastructure
tags:
   - oci-release-notes-2025
   - Apr-2025
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



## Use SCSI Persistent Reservations with block volumes
* **Services**: Block Volume
* **Release Date**: April 22, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/blockvolume/persistent-reservations.htm](https://docs.oracle.com/iaas/releasenotes/blockvolume/persistent-reservations.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
**SCSI Persistent Reservation(SCSI PR)**은 SCSI(Small Computer System Interface) 프로토콜의 기능으로, 여러 장치가 하나의 스토리지 장치를 공유하여 접근할 수 있도록 해줍니다. 이 기능을 통해 애플리케이션은 공유 스토리지 장치에 대한 접근을 예약하고 관리할 수 있습니다.
특히 여러 장치가 하나의 스토리지를 공유해야 하는 클러스터링 환경에서 유용하게 사용됩니다. 
- 아래는 윈도우SQL 서버 구성시 해당 제약 때문에 디스크 공유가 안되었던 부분이 해결되어 아래와 같이 가이드를 통해서 셋팅이 가능합니다. (https://docs.oracle.com/en/learn/oci-mssql-wsfc/index.html#objectives)

![](/assets/img/infrastructure/2025/architecture.png " ")