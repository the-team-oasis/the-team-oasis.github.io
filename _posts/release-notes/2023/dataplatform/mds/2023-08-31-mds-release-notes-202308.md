---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "8월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2023년 8월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-mds
tags:
  - oci-release-notes-2023
  - Aug-2023
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

## MySQL HeatWave: Database Audit
* **Services:** MySQL HeatWave
* **Release Date:** Aug. 15, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/cd1fb315-ddef-4da6-aa81-ef582dbf8c10/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/cd1fb315-ddef-4da6-aa81-ef582dbf8c10/){:target="_blank" rel="noopener"}

## 릴리즈 내용

MySQL HeatWave에 MySQL Enterprise Audit 플러그인을 지원하는 데이터베이스 감사 기능이 추가되었습니다. 이 기능을 사용하면 MySQL 서버 활동에 대한 감사 추적을 생성할 수 있습니다. 여기에는 클라이언트 연결 및 연결 해제와 같은 이벤트는 물론 특정 스키마 및 테이블에 액세스하는 등 데이터베이스 내에서 수행한 작업도 포함됩니다. 또한 MySQL 엔터프라이즈 감사를 사용하여 느린 쿼리와 같은 쿼리 실행 통계를 수집할 수도 있습니다.

> 기본적으로 감사 플러그인 로그는 비활성화되어 있으며 모든 사용자에 대해 감사 가능한 모든 이벤트 로깅을 사용 설정해야 합니다

* MySQL 엔터프라이즈 감사 플러그인: 감사 플러그인을 사용하면 MySQL Server에서 서버 활동에 대한 감사 기록이 포함된 로그 파일을 생성할 수 있습니다. 로그 내용에는 클라이언트의 연결 및 연결 해제 시점, 클라이언트가 연결하는 동안 수행하는 작업(예: 액세스하는 데이터베이스 및 테이블)이 포함됩니다. 각 쿼리의 시간 및 크기에 대한 통계를 추가하여 이상값을 감지할 수 있습니다. 플러그인의 기본값은 변경할 수 없습니다.

아래 감사 플러그인은 기본적으로 수정이 불가합니다. 
- audit_log_buffer_size: 10485760
- audit_log_compression: GZIP
- audit_log_database: mysql_audit
- audit_log_file: /db/audit/audit.log
- audit_log_flush_interval_seconds: 60
- audit_log_format: JSON
- audit_log_format_unix_timestamp: ON
- audit_log_max_size: 5368709120
- audit_log_prune_seconds: 604800
- audit_log_rotate_on_size: 52428800

## MySQL HeatWave: Channels with Delayed Replication and Generate Primary Keys
* **Services:** MySQL HeatWave
* **Release Date:** Aug. 14, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/47984cb9-d41a-4c48-8f3f-6db82f572532/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/47984cb9-d41a-4c48-8f3f-6db82f572532/){:target="_blank" rel="noopener"}


## 릴리즈 내용 

하이브리드 배포 및 온프레미스 환경에서 복제 채널 구성시 아래 2가지 옵션에 따른 선택을 선택 할 수 있습니다. 

* 대상 테이블에 보이지 않는 기본 키를 자동으로 생성하여 CREATE TABLE 또는 ALTER TABLE 문에 기본 키가 표시되지 않은 소스에서 지속적인 복제를 허용합니다.
* 대상 DB 시스템에 복제된 트랜잭션을 적용할 때 의도적으로 지연을 추가하여 복제본이 원본보다 지속적으로 뒤처져 복구 또는 보고 목적으로 사용할 수 있도록 합니다