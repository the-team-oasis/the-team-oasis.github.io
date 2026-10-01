---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "9월 OCI Database Service - Others 업데이트 소식"
teaser: "2026년 9월 OCI Database Service - Others 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-dataplatform
tags:
  - oci-release-notes-2026
  - Sep-2026
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


## Use your own encryption key in OCI Database with PostgreSQL
* **Services:** OCI Database with PostgreSQL
* **Release Date:** September 15, 2026

### 업데이트 내용
OCI Database with PostgreSQL에서 고객 관리 encryption key를 사용할 수 있습니다. key lifecycle·access policy·복구 절차를 database 운영 기준에 함께 반영해야 합니다.

### 키 수명주기

고객 관리 key를 사용할 때는 Vault 권한, key rotation, key disable·삭제 시 복구 영향까지 database 운영 절차에 포함해야 합니다. 적용 전에는 관리자가 key에 접근할 수 있는지와 장애 시 복구 시나리오를 검증합니다.

### 참고

- [Release Note: Use your own encryption key in OCI Database with PostgreSQL](https://docs.oracle.com/iaas/releasenotes/postgresql/byok.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Using Your Own Encryption Key in OCI Database with PostgreSQL](https://docs.oracle.com/iaas/Content/postgresql/using-own-key.htm){:target="_blank" rel="noopener"}

## ODH-Based Versioning in OCI Big Data Service
* **Services:** Big Data
* **Release Date:** September 01, 2026

### 업데이트 내용
OCI Big Data Service가 cluster 생성·Console 표기·release documentation에서 ODH version을 기본 version 기준으로 사용합니다. 기존 BDS version 기준의 운영 문서와 automation을 점검해야 합니다.

### 참고

- [Release Note: ODH-Based Versioning in OCI Big Data Service](https://docs.oracle.com/iaas/releasenotes/big-data/odh-based-versioning.htm){:target="_blank" rel="noopener"}
