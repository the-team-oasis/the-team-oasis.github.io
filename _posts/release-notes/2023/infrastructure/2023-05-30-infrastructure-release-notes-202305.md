---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "5월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 5월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - May-2023
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

## File Storage support for policy-based snapshots
* **Services:** File Storage
* **Release Date:** May 31, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/84b97e94-d6bc-4f44-97bc-4380d18dcb41/](https://docs.oracle.com/iaas/releasenotes/changes/84b97e94-d6bc-4f44-97bc-4380d18dcb41/){:target="_blank" rel="noopener"}

### 릴리즈 내용
파일스토리지의 스케쥴에 의해서 주기적인 스냅샷이 생성이 가능하며, 스냅샷은 주기가 만료될 경우 삭제 됩니다. 
- 스냅샷은 최대 10개의 서로 다른 일정을 등록 할 수 있습니다. 

일정 유형은 다음과 같습니다. 
- Hourly
- Daily
- Weekly
- Monthly
- Yearly


![](/assets/img/infrastructure/2023/release-note/SCR-20230728-heqq.png " ")

스냅샷 보존 기간은 아래와 같습니다. 

![](/assets/img/infrastructure/2023/release-note/SCR-20230728-hgkg.png " ")




## Soft stop for instance pools and autoscaling, more settings for instance configurations
* **Services:** Compute
* **Release Date:** May 11, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/782705a7-6cad-44bc-ac75-0c855e0a65ec/](https://docs.oracle.com/iaas/releasenotes/changes/782705a7-6cad-44bc-ac75-0c855e0a65ec/){:target="_blank" rel="noopener"}

### 릴리즈 내용
ACPI (Advanced Configuration and Power Interface) 의 약자로 고급 환경 설정 및 전원 인터페이스라고 합니다. 
일반적으로는 compute 종료시, shutdown 명령어를 OS 전달하고, 작업종료까지 최대 15분까지 기다리다가 종료합니다. 그러나 어플리케이션을 통해서 15분 이상의 시간이 필요한 경우 자동적으로 종료가되어 데이터의 손실이 발생할 수 있습니다. 
따라서 위 ACPI 명령어를 통해서 작업을 안전하게 종료 할 수 있습니다. 
