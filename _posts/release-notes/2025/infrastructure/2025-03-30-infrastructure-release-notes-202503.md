---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "3월 OCI Infrastructure 업데이트 소식"
teaser: "2025년 3월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2025-infrastructure
tags:
   - oci-release-notes-2025
   - Mar-2025
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



## File System Quotas
* **Services**: File Storage
* **Release Date**: March 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/filestorage/file-system-quotas.htm](https://docs.oracle.com/iaas/releasenotes/filestorage/file-system-quotas.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
Oracle Cloud Infrastructure(OCI)의 File Storage는 고성능 공유 파일 시스템을 제공할 뿐만 아니라, 사용자 또는 그룹 단위로 저장 용량과 파일 수(inodes)를 제한하는 Quota 기능도 지원합니다. 이 기능은 자원의 공정한 분배, 예상치 못한 과다 사용 방지, 운영 안정성 확보에 유용합니다.

1.Quota란?
- Quota는 특정 사용자 또는 그룹이 사용할 수 있는 저장 용량 (bytes), 파일 개수 (inodes)를 제한하는 기능입니다.
- Soft limit(경고 기준)과 Hard limit(절대 초과 불가)로 구성되어 있어, 유연한 제어가 가능합니다.

2.주요 기능
- 사용자 Quota	특정 사용자 단위로 제한 설정
- 그룹 Quota	그룹 단위로 제한 설정 가능
- Soft / Hard Limit	사용량 경고 vs. 강제 차단 기준 설정
- 사용량 모니터링	quota, repquota 등 명령어로 확인 가능

4.설정 방법 요약 (Linux CLI 기준)


4-1. Quota 기능 활성화
````shell
sudo mount -o usrquota,grpquota /mnt/myfileshare
sudo quotacheck -cug /mnt/myfileshare
sudo quotaon /mnt/myfileshare
 ````

4.2 사용자 Quota 설정 예시
````shell
sudo setquota -u opc 10000000 11000000 100000 110000 /mnt/myfileshare
````
위 명령은 opc 사용자에게 10GB 저장공간 및 100,000개의 파일 제한을 설정

4.3 현황 확인
````shell
quota -u opc
````

### 유의사항
- NFS v3 마운트 환경에서만 지원
- Snapshot에는 quota 적용되지 않음
- 잘못 설정하면 저장 실패나 서비스 장애로 이어질 수 있으니 테스트 환경에서 먼저 적용 권장


## New Release of Secure Desktops
* **Services**: Secure Desktops
* **Release Date**: March 18, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/secure-desktops/js-1086.htm](https://docs.oracle.com/en-us/iaas/releasenotes/secure-desktops/js-1086.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
Oracle Cloud의 Secure Desktops 서비스는 원격 가상 데스크탑 환경을 제공하는 솔루션으로, 보안성과 편의성을 동시에 고려한 인프라 서비스입니다. 이번 JS-1086 릴리스를 통해 관리자가 사용자 클라이언트 장치 정보를 확인할 수 있는 기능이 추가되었습니다!
- 접속한 클라이언트 장치의 정보가 기록됨
- 정보는 세션이 활성화될 때 자동 수집
- OCI 콘솔 또는 API를 통해 조회 가능

### 관리자가 확인 할 수 있는 정보 
장치 유형 : 예: Windows, Mac, Linux 등
접속 위치 : 접속한 네트워크의 IP 주소
접속 시간 : 세션 활성화 시점 기준
접속 방법 : 웹 브라우저, 전용 클라이언트 등

### 추가된 기능
보안 강화 : 비인가 장치에서의 접근 여부 모니터링 가능
운영 편의성 : 사용자 환경 분석 및 문제 해결에 유리
컴플라이언스 대응 : 감사 로그 기반의 기록 확보 가능


이번 업데이트를 통해 OCI Secure Desktops는
단순한 가상 데스크탑을 넘어, 더 강력한 보안 관리와 감사 기능을 갖추게 되었습니다.