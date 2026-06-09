---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "3월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2025년 3월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2025-mds
tags:
  - oci-release-notes-2025
  - Mar-2025
  - MDS
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


## HeatWave: Schedule cross region automatic backups
* **Services**: HeatWave
* **Release Date**: March 11, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-copy-autobackup.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-copy-autobackup.htm){:target="_blank" rel="noopener"}
### 업데이트 내용
**교차 리전 백업(Cross-Region Backup)**은 데이터베이스 백업을 다른 OCI 리전에 복사 저장하는 기능입니다. 이는 **재해 복구(DR)**와 데이터 보호를 위한 필수 전략 중 하나로, 지역 장애나 특정 리전의 이슈 발생 시에도 데이터 손실 없이 복원이 가능하도록 합니다.
기존에는 사용자가 수동으로 교차 리전 백업을 생성해야 했지만, 이제는 자동 스케줄링 기능이 제공되어, 정기적으로 다른 리전에 백업을 복사할 수 있습니다.

![](/assets/img/infrastructure/2025/crossregion_copy.png " ")

1. 주요기능
- 원하는 대상 리전 선택 가능, 자동 백업 정책 기반으로 실행됨, 스케줄된 교차 리전 백업은 수동 백업과 동일하게 관리 가능

2. 설정방법
    1.	MySQL DB System 선택
    2.	“Backups” → “Scheduled Cross-Region Backups” 메뉴로 이동
    3.	대상 리전(예: Singapore, Tokyo 등) 선택
    4.	정책 활성화 및 저장
3. 유의사항 
- 교차 리전 백업은 MySQL 8.0.34 이상 버전에서만 사용 가능
- 대상 리전에는 해당 MySQL 서비스가 활성화되어 있어야 함
- 복원 시에도 대상 리전에서 DB 인스턴스를 새로 생성 가능

