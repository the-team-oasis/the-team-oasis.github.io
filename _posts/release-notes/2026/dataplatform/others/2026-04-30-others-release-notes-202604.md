---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "4월 OCI Database Service - Others 업데이트 소식"
teaser: "2026년 4월 OCI Database Service - Others 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2026-others
tags:
  - oci-release-notes-2026
  - Apr-2026
  - Others
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

---

## OCI Database with PostgreSQL adds support for PostgreSQL 17

* **Services:** OCI Database with PostgreSQL
* **Release Date:** April 29, 2026
* **Documentation:** [OCI Database with PostgreSQL adds support for PostgreSQL 17](https://docs.oracle.com/en-us/iaas/releasenotes/postgresql/db-17.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [PostgreSQL Version and Upgrades](https://docs.oracle.com/iaas/Content/postgresql/upgrades.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 PostgreSQL 17 버전을 지원합니다. 이제 DB System을 생성할 때 PostgreSQL 17을 선택할 수 있습니다.

### 주요 기능

* 신규 PostgreSQL DB System 생성 시 버전 선택 옵션에 PostgreSQL 17이 포함됩니다.
* PostgreSQL 17 기반 애플리케이션 검증, 신규 워크로드 배포, 상위 버전 호환성 테스트를 OCI 관리형 PostgreSQL 환경에서 진행할 수 있습니다.
* 기존 DB System의 메이저 버전 업그레이드는 새 DB System 생성 방식으로 계획해야 하며, 마이너 버전은 유지보수 윈도우를 통해 자동 적용됩니다.

### 운영 포인트

기존 PostgreSQL 14/15 기반 시스템을 PostgreSQL 17로 이전하려면 신규 DB System을 생성한 뒤 데이터 마이그레이션, 애플리케이션 호환성 검증, 전환 계획을 함께 수립하는 방식이 적합합니다.
