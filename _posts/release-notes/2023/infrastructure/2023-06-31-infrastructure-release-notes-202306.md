---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "6월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 6월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - June-2023
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

## SCSI UNMAP command support
* **Services:** Block Volume
* **Release Date:** June 15, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/497cc5ed-b90b-4901-ad6a-f43e4bc1ec84/](https://docs.oracle.com/iaas/releasenotes/changes/497cc5ed-b90b-4901-ad6a-f43e4bc1ec84/){:target="_blank" rel="noopener"}

### 릴리즈 내용
부트볼륨과 블록볼륨에 사용하지 않는 공간 즉 컴퓨터에서 디스크조각모음과 같은 기능을  제공하는 기능으로 디스크의 사용하지 않는 공간을 효율적으로 정리해줌으로서 디스크의 성능을 올려줍니다.
- 해당 기능을 사용에 따른 디스크 성능 이슈는 없습니다.
- 해당 기능이 처리되는 시간은 디스크 볼륨 크기, 성능(IOPS)  따라 다릅니다.


## OS Management Hub is now available
* **Services:** OS Management Hub
* **Release Date:**  June 27, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/25c65d30-d8b3-4538-ac36-0ce28ae6c28a/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/25c65d30-d8b3-4538-ac36-0ce28ae6c28a/){:target="_blank" rel="noopener"}

### 릴리즈 내용

오라클 리눅스을 관리하기 위한 관리 솔루션입니다. 중앙집중관리 콘솔을 사용하여 오라클 리눅스 환경의 업데이트 및 패치를 관리하고 모니터링 할 수 있습니다. 

아래와 같은 기능을 제공합니다. 

* 오라클 리눅스 인스턴스 환경 전반에서 중요한 문제를 추적하고 해결하기 위한 도구입니다. 
* 시스템을 그룹화하여 업데이트를 모터링 합니다.
* 개발부터 프로덕션까지 단계를 두어 단계적으로 롤아웃하는 기능을 제공합니다. 
* 가동 중단 없는 보안 업데이트를 위해 Oracle Ksplice와 Oracle Linux 기능과 통합됩니다. 

* 아키텍처 : 아래 그림은 on-prem 환경 및 클라우드 환경에서의 서비스를 제공합니다.
![](/assets/img/infrastructure/2023/osmh-overview.png)

* 화면 상태 : 화면에서 접근 접근할 경우, 아래와 같이 관리 대시보드가 보여집니다.
![](/assets/img/infrastructure/2023/OSManagement Hub.png)



