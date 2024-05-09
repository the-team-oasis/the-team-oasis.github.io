---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "1월 OCI Infrastructure 업데이트 소식"
teaser: "2024년 1월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2024-infrastructure
tags:
  - oci-release-notes-2024
  - Jan-2024
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


## Collection Issues
* **Services**:Operations Insights
* **Release Date**: Jan. 29, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/03d827cb-7ec3-42c3-82b3-0b2e66cd4325/](https://docs.oracle.com/iaas/releasenotes/changes/03d827cb-7ec3-42c3-82b3-0b2e66cd4325/){:target="_blank" rel="noopener"}

### 업데이트 내용

Operations Insights 새로운 대시 보드가 추가되었습니다. 새로운 대시보드는 Operations Insights 등록된 Exadata , 호스트 및 데이터 베이스에 데이터 수집에 문제가 없는지 확인 할 수 있습니다.

![](/assets/img/infrastructure/2024/SCR-20240306-jnmq.png " ")





## New Release of Secure Desktops
* **Services**:Secure Desktops
* **Release Date**: Jan. 29, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/5aca12af-64a0-44d9-b5df-e610b6d525a1/](https://docs.oracle.com/iaas/releasenotes/changes/5aca12af-64a0-44d9-b5df-e610b6d525a1/){:target="_blank" rel="noopener"}

### 업데이트 내용
이 릴리스에는 다음과 같은 개선 사항과 버그 수정이 포함되어 있습니다:

- 보안 데스크톱은 특정 작업에 대한 작업 요청을 생성합니다. 관리자는 관리자 콘솔을 사용하여 이러한 작업의 상태를 추적할 수 있습니다.
  작업의 상태를 추적할 수 있으며, 작업 실패 이유를 확인할 수 있습니다.
- 보안 데스크톱 관리자 콘솔에서 새로 생성된 데스크톱은 이제 OCID(오라클 클라우드 ID)를 사용하여 식별됩니다.
  참고: 기존 데스크톱은 계속 UUID(범용 고유 식별자)를 사용하여 식별됩니다.
- 서비스 현지화 개선 되었습니다.
- 서비스 로그 및 오류 메시지가 개선되어 서비스 편의성이 향상되었습니다.
- 관리자가 사용 가능한 목록에서 임의의 서브넷을 선택할 수 있도록 문제를 수정했습니다.



## Enhanced Health Monitor Experience for Dedicated Virtual Machine Host
* **Services**:Compute
* **Release Date**: Jan. 29, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/adaa912d-2a94-4c71-9884-fe3d5eb21758/](https://docs.oracle.com/iaas/releasenotes/changes/adaa912d-2a94-4c71-9884-fe3d5eb21758/){:target="_blank" rel="noopener"}

### 업데이트 내용
전용 머신을 사용하는 VM에 모니터링 기능이 향상되었습니다. 
- 예약된 유지 관리 이벤트와 같은 모든 유지 관리 시나리오를 포함하도록 전용 가상 머신 호스트의 가상 머신 인스턴스에 대한 유지 관리 상태 메트릭 보고서가 개선되었습니다.
- 전용 가상 머신 호스트에 대한 새로운 상태 메트릭 보고서를 도입하여 각 호스트의 인스턴스 상태 및 성능 상태를 모니터링 할 수 있습니다.
- 전용 가상 머신 호스트에 대한 예정된 유지 관리 이벤트를 일회성 시스템 알림을 통해 문제를 확인 할 수 있씁니다. 
- 콘솔 페이지에 인스턴스 상태 표시기를 추가하여 전용 가상 머신 호스트의 인스턴스 상태 문제를 식별할 수 있습니다.