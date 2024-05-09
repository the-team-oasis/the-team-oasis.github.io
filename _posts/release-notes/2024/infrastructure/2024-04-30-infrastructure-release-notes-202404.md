---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "4월 OCI Infrastructure 업데이트 소식"
teaser: "2024년 4월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2024-infrastructure
tags:
  - oci-release-notes-2024
  - April-2024
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


## OS Management End of Life
* **Services**:OS Management
* **Release Date**: April 23, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/36a20ac8-5c76-4193-b952-c82ee1de2c5f/](https://docs.oracle.com/iaas/releasenotes/changes/36a20ac8-5c76-4193-b952-c82ee1de2c5f/){:target="_blank" rel="noopener"}

### 업데이트 내용
OS Management 서비스가 종료됨에 따라서 OS Management Hub 변경되었습니다. 2025년 4월23일 이후에는 해당 서비스가 더 이상 서비스 되지 않으며, 기존 사용자는 2025년까지 4월23일까지 사용 가능하며, 신규 서비스로 마이그레이션 해야합니다.




## New Release of OS Management Hub
* **Services**:OS Management Hub
* **Release Date**: April 23, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/e69d732e-9918-4fd8-ba57-30cc117b1be4/](https://docs.oracle.com/iaas/releasenotes/changes/e69d732e-9918-4fd8-ba57-30cc117b1be4/){:target="_blank" rel="noopener"}

### 업데이트 내용
OS Management 서비스를 대신하며 더욱 향샹 기능의 OS Management Hub GA(4월5일) 되었습니다.
중앙 집중식 관리 콘솔을 사용하여 OCI, 프라이빗 데이터 센터 또는 지원되는 타사 클라우드 환경의 인스턴스에 대한 업데이트 및 패치를 관리할 수 있습니다.

![](/assets/img/infrastructure/2024/SCR-20240509-iolq.png " ")

### 기능
- 운영 체제 환경 전반에서 중요한 문제를 추적하고 해결하기 위한 도구를 제공합니다.
- 시스템을 그룹화하고 업데이트를 모니터링합니다.
- 개발부터 프로덕션까지 제어 지점을 통해 보안 오류 및 기타 콘텐츠의 단계적 롤아웃을 제공할 수 있는 기능을 제공합니다.
- 다운타임 없는 보안 업데이트를 위한 Oracle Ksplice와 같은 미션 크리티컬 Oracle Linux 기능과의 통합되었습니다.

### 지원범위
- On-premise (Private Datacenter) - Oracle Linux 7,8,9
- Oracle Cloud - Oracle Linux 6,7,8,9 
- Oracle Cloud - Microsoft Windows Server(Standard, Datacenter) 2016, 2019, 2022
- 3rd party cloud (Azure, AWS) - Oracle Linux 7,8,9

### 메인 화면
![](/assets/img/infrastructure/2024/SCR-20240509-odkx.png " ")


## Cache with Redis support for Network Security Groups (NSGs)
* **Services**:OS Management Hub
* **Release Date**: April 23, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/f54b1d6a-4a74-4aa1-a039-5c98e5904ed7/](https://docs.oracle.com/iaas/releasenotes/changes/f54b1d6a-4a74-4aa1-a039-5c98e5904ed7/){:target="_blank" rel="noopener"}

### 업데이트 내용
Redis 생성중에 네트워크 보안 그룹(NSG) 사용하여 Redis 대한 네트워크 보안 설정을 할 수 있게 되었습니다.
NSG는 Security List 보다 정교하게 규칙이 적용되는 대상 서버를 그룹으로 한정할 수 있다는 장점이 있습니다.

![](/assets/img/infrastructure/2024/SCR-20240509-irrj.png " ")

