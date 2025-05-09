---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "3월 OCI Database Service - Others 업데이트 소식"
teaser: "2025년 3월 OCI Database Service - Others 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2025-others
tags:
  - oci-release-notes-2025
  - Mar-2025
  - Others
  - Redis
  - OCI Cache with Redis
  - PostgreSQL
  - OCI Database with PostgreSQL
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

## Copy database system backups to another region
* **Services:** OCI Database with PostgreSQL
* **Release Date:** March 05, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/postgresql/backup-region-copy.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/backup-region-copy.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Oracle의 PostgreSQL Database 서비스에서도 **백업을 다른 리전(Region)으로 복사(Copy)**할 수 있는 기능이 새롭게 지원됩니다. 이 기능은 재해 복구(DR), 데이터 보호, 리전 간 마이그레이션 준비에 매우 유용합니다.
이 기능을 통해 사용자는 PostgreSQL 인스턴스에서 생성한 **수동 백업(Manual Backup)**을 다른 리전으로 복사할 수 있으며, 복사된 백업은 독립적으로 존재하고 관리됩니다.

#### 기능
**백업 복사** : 기존 수동 백업을 선택해 다른 리전으로 복사

**콘솔, CLI, API 지원** : 원하는 방식으로 작업 가능

**복사된 백업 재사용 가능**  : 대상 리전에서 PostgreSQL 인스턴스 생성 가능

#### 제약사항 
- 현재는 수동 백업만 복사 가능 (자동 백업은 미지원)
- 대상 리전에도 PostgreSQL 서비스가 활성화되어 있어야 함
- 복사된 백업은 기존과 별도로 관리되며 삭제 정책도 별도 적용


## OCI Database with PostgreSQL adds support for pglogical and PostGIS extensions
* **Services:** OCI Database with PostgreSQL
* **Release Date:** March 05, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/postgresql/pglogical.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/pglogical.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
관리자는 이제 OCI의 PostgreSQL 데이터베이스에서 pglogical 및 PostGIS 확장 기능을 활성화할 수 있습니다. pglogical 확장은 특정 테이블 또는 데이터의 일부만을 복제할 수 있도록 하여 논리적 복제 기능을 제공합니다. PostGIS 확장은 공간(지리) 정보 관리를 지원합니다.