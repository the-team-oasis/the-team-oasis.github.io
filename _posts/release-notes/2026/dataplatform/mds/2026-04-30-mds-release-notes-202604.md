---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "4월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2026년 4월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2026-mds
tags:
  - oci-release-notes-2026
  - Apr-2026
  - MDS
  - MySQL HeatWave
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

---

## HeatWave: Support for Versions 9.7.0, 8.4.9, and 8.0.46

* **Services:** MySQL HeatWave
* **Release Date:** April 29, 2026
* **Documentation:** [HeatWave: Support for Versions 9.7.0, 8.4.9, and 8.0.46](https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-970-849-8046.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Changes in MySQL HeatWave 9.7.0](https://dev.mysql.com/doc/relnotes/heatwave/en/news-9-7-0.html){:target="_blank" rel="noopener"}, [MySQL 9.7.0 Release Notes](https://dev.mysql.com/doc/relnotes/mysql/9.7/en/){:target="_blank" rel="noopener"}, [MySQL 8.4.9 Release Notes](https://dev.mysql.com/doc/relnotes/mysql/8.4/en/news-8-4-9.html){:target="_blank" rel="noopener"}, [MySQL 8.0.46 Release Notes](https://dev.mysql.com/doc/relnotes/mysql/8.0/en/news-8-0-46.html){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave에서 MySQL 데이터베이스 버전 9.7.0, 8.4.9, 8.0.46을 지원합니다. 세 버전 모두 보안 수정과 버그 수정을 포함하며, 신규 DB System의 기본 버전은 8.4.9입니다.

### 주요 기능

* 신규 DB System 생성 시 기본 버전은 8.4.9입니다.
* 최신 기능을 빠르게 활용하려면 9.7.0을 선택할 수 있습니다.
* 안정적인 LTS 기반 운영이 필요하면 8.4.9를 선택하는 것이 적합합니다.
* 기존 8.0 환경의 호환성이 필요한 경우 8.0.46을 선택할 수 있습니다.
* 기존 DB System은 수동 업그레이드 또는 유지보수 정책을 통해 신규 버전으로 업그레이드할 수 있습니다.

### HeatWave 9.7.0 주요 변경

* HeatWave MySQL에서 로드된 테이블이 stale 상태가 되는 원인 추적을 지원합니다.
* HeatWave Lakehouse에서 AVRO 파일 적재 시 컬럼 재매핑 기능이 강화되었습니다.
* GenAI의 `NL_SQL` 루틴은 Gemini 및 OpenAI 모델을 지원합니다.
* 외래 키가 있는 테이블의 Bulk Load 지원이 추가되어 복잡한 관계형 데이터 적재 시 제약 조건 검증이 개선되었습니다.

### MySQL 8.0 EOL 참고

2026년 4월 기준 MySQL 8.0은 EOL에 도달했습니다. 기존 MySQL 8.0 DB System은 중단 없이 계속 동작하지만, 2026년 4월 이후에는 신규 MySQL 8.0 DB System 생성이나 기존 시스템의 주요 변경이 제한됩니다. Oracle Linux 8 및 MySQL 8.0.46 이상에서 실행 중인 DB System에는 2027년 4월까지 중요 보안 패치가 적용되며, 이후 남은 MySQL 8.0 DB System은 MySQL 8.4로 자동 업그레이드됩니다.
