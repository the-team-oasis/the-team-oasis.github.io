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

### 주요 기능
- 업데이트 및 패치 관리: OCI, 온프레미스 및 타사 클라우드 인스턴스에서 운영 체제 업데이트와 패치를 자동으로 식별, 다운로드 및 설치합니다.
- 소프트웨어 취약점 관리: 시스템을 스캔하여 알려진 취약점을 식별하고 심각도에 따라 우선 순위를 지정합니다. 취약점 해결을 위한 자동화된 패치 배포도 가능합니다.
- 규정 준수 관리: CIS Benchmarks, NIST 800-53 및 PCI DSS와 같은 규정 준수 요구 사항을 충족하도록 시스템을 구성하고 유지 관리하는 데 도움을 줍니다.
- 보고 및 분석: 업데이트, 패치 및 취약점 상태에 대한 상세한 보고서를 제공하여 시스템 보안 상태를 파악하고 필요한 조치를 취하도록 합니다.

### 장점
- 향상된 보안: 운영 체제 업데이트 및 패치를 최신 상태로 유지하여 시스템을 최신 취약점으로부터 보호합니다.
- 개선된 안정성: 시스템 충돌 및 성능 저하를 방지하며 시스템 가동 시간을 늘립니다.
- 운영 효율성 향상: 업데이트 및 패치 관리 프로세스를 자동화하여 관리 오류를 줄이고 IT 관리자의 작업량을 줄입니다.
- 비용 절감: 라이선스 비용 및 시스템 다운타임으로 인한 손실을 줄여줍니다.

### 지원 OS
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

