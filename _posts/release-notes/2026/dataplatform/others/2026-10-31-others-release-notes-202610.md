---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "10월 OCI Database Service - Others 업데이트 소식"
teaser: "2026년 10월 OCI Database Service - Others 업데이트 소식입니다."
author: lim
breadcrumb: true
permalink: "release-notes-2026-dataplatform/others-release-notes-202610/"
categories:
  - release-notes-2026-others
tags:
  - oci-release-notes-2026
  - Oct-2026
  - DATABASE
  - Big Data
  - PostgreSQL
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

## OCI Database with PostgreSQL: 인플레이스 메이저 버전 업그레이드 지원

* **Services:** OCI Database with PostgreSQL
* **Release Date:** 2026년 10월 20일

### 업데이트 내용

OCI Database with PostgreSQL이 기존 DB System을 더 최신 PostgreSQL 메이저 버전으로 업그레이드하는 인플레이스 업그레이드를 지원합니다. Oracle은 `pg_upgrade`를 주요 인플레이스 방식으로 안내하며, 데이터 파일 복사와 시스템 카탈로그 업데이트를 사용하므로 덤프·복원 방식보다 다운타임을 줄일 수 있습니다.

업그레이드 전에 사용 중인 `pglogical`, `anon`, `pgaudit` 확장을 제거해야 하며, 완료 후 필요한 확장을 다시 생성하고 핵심 테이블의 행 수 및 대상 검증을 수행할 수 있습니다. 큰 DB에서 15~30분 이상의 읽기 전용 기간을 허용하기 어렵거나 즉시 전환이 필요한 경우에는 `pg_dump`/`pg_restore` 또는 `pglogical` 방식이 대안입니다.

### 참고

- Release Note: https://docs.oracle.com/iaas/releasenotes/postgresql/inplace-upgrade.htm
- Oracle 문서 — Major Version Upgrade Guide for OCI Database with PostgreSQL: https://docs.oracle.com/iaas/Content/postgresql/upgrades.htm#pg-upgrade

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Device Data FHIR Service: PUT 기반 리소스 관리 및 Subscription 상태 권한 개선

* **Services:** Device Data FHIR Service
* **Release Date:** 2026년 10월 21일

### 업데이트 내용

OCI Device Data FHIR Service가 FHIR R4 및 FHIR R6 Ballot 4에서 클라이언트가 지정한 논리 ID와 PUT을 사용해 리소스를 생성·갱신·논리 삭제 후 복원할 수 있도록 지원합니다. 미사용 ID의 생성과 논리 삭제된 리소스의 복원은 `201 Created`를, 활성 리소스 갱신은 `200 OK`를 반환합니다.

동시 변경으로 인한 덮어쓰기를 방지하기 위해 PUT 요청에서 ETag를 `If-Match` 헤더에 지정할 수 있습니다. 버전이 일치하지 않으면 리소스를 변경하지 않고 `412 Precondition Failed`를 반환합니다. 또한 FHIR R6 Ballot 4의 `Subscription/$status`는 유형 수준 요청에는 Subscription 검색 권한, 인스턴스 수준 요청에는 Subscription 읽기 권한을 사용하며, 별도의 SubscriptionStatus scope는 필요하지 않습니다.

### 참고

- Release Note: https://docs.oracle.com/iaas/releasenotes/device-data-fhir/update-10212026.htm
- Oracle 문서 — Create, Update, and Restore Resources with PUT: https://docs.oracle.com/iaas/device-data-fhir/fhir-upsert.htm
- Oracle 문서 — Manage a FHIR Resource Through Its Lifecycle: https://docs.oracle.com/iaas/device-data-fhir/fhir-crud-lifecycle.htm#update-the-patient
- Oracle 문서 — Subscription Status: https://docs.oracle.com/iaas/device-data-fhir/subscription-status.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->
