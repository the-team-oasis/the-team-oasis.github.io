---
layout: page-fullwidth
#
# Content
#
subheadline: "Release Notes 2022"
title: "12월 OCI Infrastructure 업데이트 소식"
teaser: "2022년 12월 OCI Infrastructure 업데이트 소식입니다."
author: ks.kim
breadcrumb: true
categories:
- release-notes-2022-infrastructure
tags:
- oci-release-notes-2022
- Dev-2022
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


## The Queue service is now available
* **Services:** Queue
* **Release Date:**  Dec. 14, 2022
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/21273619-d234-43eb-b757-6c5023cbcafb/](https://docs.oracle.com/iaas/releasenotes/changes/21273619-d234-43eb-b757-6c5023cbcafb/){:target="_blank" rel="noopener"}

### 기능 소개
Queue 서비스는 완전 관리형 서버리스 서비스로 사용시에만 비용이 과금됩니다.Queue는 손실이나 중복 없이 독립적으로 처리된 메시지가 필요한 대용량 트랜잭션 데이터를 처리합니다.




- 일반적인 구성
![](/assets/img/infrastructure/2022/12/queue-overview.png)

- 화면 구성 (Developer Services -> Application Integration -> Queues)
![](/assets/img/infrastructure/2022/12/SCR-20230116-jnq.png)

- 제한사항
![](/assets/img/infrastructure/2022/12/SCR-20230116-jg5.png)

- 가격
![](/assets/img/infrastructure/2022/12/SCR-20230118-k5r.png)


<<<<<<< HEAD
=======

>>>>>>> 76b9f49a49d662719cb5f1feb56cb08f16c24472
## Live migration supported for Windows-based compute instances
* **Services:** Compute
* **Release Date:**  Dec. 19, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/c4d8411e-82bd-4a69-b169-46ec31b1f11e/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/c4d8411e-82bd-4a69-b169-46ec31b1f11e/){:target="_blank" rel="noopener"}

### 기능 소개
Infrastructure Maintenance는 Oracle Cloud Infrastructure는 컴퓨팅 인스턴스의 물리적 인프라에 대해 정기적인 데이터 센터 유지 보수를 수행합니다. 이 유지 보수에는 하드웨어 업그레이드 및 교체 또는 호스트 전원 공급을 중단하는 유지 보수 수행과 같은 작업이 포함됩니다.

Live Migration의 경우, 기존 인스턴스가 계속 실행 중일 때 상태가 좋지 않은 인스턴스가 상태가 좋은 호스트로 복사됩니다. 실행 중인 인스턴스에 최소한의 중단이 있습니다.

인스턴스를 실시간으로 마이그레이션할 수 없는 경우 Oracle Cloud Infrastructure는 14-16일 이내에 마이그레이션을 재부팅하기 위한 예정일을 예약하고 알림을 보냅니다. 만료일 전에 인스턴스를 사전에 재부팅하지 않으면 해당 인스턴스가 마이그레이션되어 재부팅됩니다.

기본적으로 Oracle Cloud Infrastructure는 예정된 유지 보수에 대한 알림을 보내지 않고 인스턴스를 실시간으로 마이그레이션합니다. 실시간 마이그레이션이 시작되고 종료되면 인프라 유지 보수 이벤트가 발생합니다. 자동화를 사용하여 인프라 유지 보수 이벤트를 추적할 수 있습니다.
> 윈도우, Linux 지원하며, 반가상화 네트워크 기반이어야 합니다. 

지원되는 shape 리스트
- VM.Standard1 series
- VM.Standard.B1 series
- VM.Standard2 series
- VM.Standard3.Flex
- VM.Standard.E2 series
- VM.Standard.E2.1.Micro
- VM.Standard.E3.Flex
- VM.Standard.E4.Flex



![](/assets/img/infrastructure/2022/12/SCR-20230116-iev.png)