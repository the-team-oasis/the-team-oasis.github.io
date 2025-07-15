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


## Resource Scheduler new features
* **Services**: Resource Scheduler
* **Release Date**: April 29, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/blockvolume/persistent-reservations.htm](https://docs.oracle.com/iaas/releasenotes/blockvolume/persistent-reservations.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
Oracle Cloud Infrastructure(OCI)의 Resource Scheduler는 2025년 4월 29일에 새로운 기능을 도입하여 리소스 스케줄링과 관리에 대한 제어력을 강화했습니다. 주요 업데이트는 다음과 같습니다:

- 지원 리소스 유형 확대
  - Compute 인스턴스
  - Compute 인스턴스 풀
  - Autonomous Databases
  - Function 리소스

- 구획 수준의 스케쥴 관리 
  - 스케줄을 생성할 때 특정 컴파트먼트를 지정할 수 있으며, 기존 스케줄을 다른 컴파트먼트로 이동하는 것도 가능합니다. 이를 통해 조직 구조에 맞춘 유연한 스케줄링이 가능합니다.

- 리소스별 추가 파라미터 설정
  - 일부 리소스 유형에 대해 스케줄에 추가할 때 추가 파라미터를 설정할 수 있습니다. 예를 들어, 특정 인스턴스의 시작 또는 중지 시점에 맞춰 세부적인 동작을 정의할 수 있어, 보다 정밀한 리소스 제어가 가능합니다.
