---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "12월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 12월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - Dec-2023
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


## Reboot Migration and Changing the Shape for Dedicated Virtual Machine Host instances now available
* **Services:** Compute
* **Release Date:**  Dec. 15, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/fb1de4bf-f304-4154-9cce-c53dbd44e391/](https://docs.oracle.com/iaas/releasenotes/changes/fb1de4bf-f304-4154-9cce-c53dbd44e391/){:target="_blank" rel="noopener"}

### 릴리즈 내용
전용 가상 머신 호스트 인스턴스에 대한 두 가지 새로운 기능의 일반 가용성을 제공합니다.
- 재부팅 마이그레이션 : 전용 호스트 장비의 마이그레이션이 필요한 경우, 고객이 계획된 유지관리를 통해서 새로운 가상 전용 머신으로 자동 마이그레이션을 지원합니다.
- 인스턴스 형태 변경 : 인스턴스 형태를 변경하여, 어플리케이션 재배포 없이 인스턴스 shape을 변경 할 수 있습니다.


## New Release of OS Management Hub
* **Services:** OS Management Hub
* **Release Date:**  Dec. 6, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/f5b636d9-4dff-43af-bed4-964a2934ddb5/](https://docs.oracle.com/iaas/releasenotes/changes/f5b636d9-4dff-43af-bed4-964a2934ddb5/){:target="_blank" rel="noopener"}

### 소개 
OS Management Hub를 사용하여 중앙 집중식 관리 콘솔을 사용하여 사설 데이터 센터의 오라클 리눅스 환경에 대한 업데이트 및 패치를 관리 및 모니터링 제공합니다.
### 릴리즈 내용
이번 릴리스에는 다음과 같은 향상된 기능이 포함되어 있습니다.

관리 스테이션이 등록할 수 없는 경우 상태 메시지가 개선되었습니다.
패키지 세부정보 페이지의 "파일 목록" 리소스에서 불필요한 열을 제거했습니다.
Oracle Linux 9.3 BaseOS 및 Oracle Linux 8.9 BaseOS용 소프트웨어 소스가 추가되었습니다.
이번 릴리스에는 다음과 같은 버그 수정이 포함되어 있습니다.

- 모든 보안 업데이트에 Ksplice 업데이트가 적용되는 문제를 수정했습니다.
- 완료된 작업 탭에 반복 작업이 표시되지 않는 문제를 해결했습니다.
- 예약된 작업에 대한 일부 작업 실행 기록 항목에 액세스할 때 발생하는 문제를 수정했습니다.
- 일부 모듈 스트림 프로필을 선택할 수 없는 문제를 수정했습니다.
- 사용 가능하고 설치된 패키지에 대한 검색 결과 문제가 수정되었습니다.
- 적용할 업데이트가 없을 때 Oracle Linux 7 업데이트 작업이 실패로 표시되는 문제를 수정했습니다.
- 그룹의 기타 업데이트에서 불필요한 작업을 제거하는 문제가 수정되었습니다.
- 등록 중에 호환되지 않는 프로필을 사용하는 경우 인스턴스 상태 문제를 수정했습니다.
- 활성 관리 스테이션이 등록 취소되도록 허용하는 문제를 수정했습니다.

