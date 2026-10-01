---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "9월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2026년 9월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-dataplatform
tags:
  - oci-release-notes-2026
  - Sep-2026
  - MDS
  - MySQL HeatWave
#
# Styling
#
header: no
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## HeatWave: Default MySQL Version Changes to 9.7 LTS
* **Services:** MySQL HeatWave
* **Release Date:** September 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-97x-default-track.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-97x-default-track.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

새 HeatWave DB System의 기본 MySQL 버전이 8.4 LTS에서 9.7 LTS로 변경됩니다. 신규 생성 표준과 기존 환경의 버전 정책을 구분해 검증해야 합니다.

## HeatWave: Automatic Storage Expansion Enhanced
* **Services:** MySQL HeatWave
* **Release Date:** September 24, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-automatic-storage-expansion-enhanced.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-automatic-storage-expansion-enhanced.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/mysql-database/doc/managing-db-system.html](https://docs.oracle.com/iaas/mysql-database/doc/managing-db-system.html){:target="_blank" rel="noopener"}
### 업데이트 내용

HeatWave DB System은 남은 저장 공간이 10% 이하일 때 자동 storage expansion을 수행합니다. 용량 경보와 비용 관리 기준은 자동 확장 동작을 반영해 점검해야 합니다.

### 용량·비용 점검

자동 확장은 남은 저장 공간이 임계값에 도달했을 때 동작하므로, 기존 용량 경보와 비용 예산 알림을 함께 조정해야 합니다. 확장 후에는 DB System의 사용량과 workload 증가 원인을 확인해 예상치 못한 반복 확장을 점검합니다.
