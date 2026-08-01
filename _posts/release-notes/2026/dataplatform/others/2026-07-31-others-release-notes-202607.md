---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI Database Service - Others 업데이트 소식"
teaser: "2026년 7월 OCI Database Service - Others 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-others
tags:
  - oci-release-notes-2026
  - Jul-2026
  - Others
  - PostgreSQL
  - OpenSearch
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


## HA Availability Domain and Fault Domain Aware Shard Placement
* **Services:** Search with OpenSearch
* **Release Date:** July 27, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/search-opensearch/ad-fd-aware.htm](https://docs.oracle.com/iaas/releasenotes/search-opensearch/ad-fd-aware.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Search with OpenSearch에서 HA 구성을 위한 Availability Domain 및 Fault Domain aware shard placement를 지원합니다. 샤드를 장애 도메인에 더 균형 있게 배치해 가용성을 높일 수 있습니다.

### 운영 시 참고 사항

OpenSearch 클러스터의 shard 배치는 성능과 복구 시간에 영향을 줍니다. 노드 수, replica 수, AD/FD 분산 상태, 장애 시나리오를 함께 검토하는 것이 좋습니다.

## OCI Database with PostgreSQL available in Oracle US Government Cloud and US Defense Cloud
* **Services:** OCI Database with PostgreSQL, Oracle Cloud Infrastructure Government Cloud
* **Release Date:** July 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/multiple/postgresql-fedramp.htm](https://docs.oracle.com/iaas/releasenotes/multiple/postgresql-fedramp.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL이 Oracle US Government Cloud 및 US Defense Cloud에서 제공됩니다. 공공·방위 환경에서 PostgreSQL 관리형 서비스를 사용할 수 있는 선택지가 확대됩니다.

### 운영 시 참고 사항

Government Cloud와 Defense Cloud는 리전, 규정 준수, 접근 권한 요구사항이 일반 상용 리전과 다를 수 있습니다. 대상 고객의 compliance 요구사항과 서비스 가용 리전을 먼저 확인해야 합니다.
