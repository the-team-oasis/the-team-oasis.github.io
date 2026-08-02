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

## OCI Database with PostgreSQL available in Oracle US Government Cloud and US Defense Cloud
* **Services:** OCI Database with PostgreSQL, Oracle Cloud Infrastructure Government Cloud
* **Release Date:** July 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/multiple/postgresql-fedramp.htm](https://docs.oracle.com/iaas/releasenotes/multiple/postgresql-fedramp.htm){:target="_blank" rel="noopener"}
* **Documentation:** [OCI Database with PostgreSQL](https://docs.oracle.com/iaas/Content/postgresql/home.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Oracle US Government Cloud](https://docs.oracle.com/iaas/Content/General/Concepts/govfedramp.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Oracle US Defense Cloud](https://docs.oracle.com/iaas/Content/General/Concepts/govfeddod.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL이 Oracle US Government Cloud와 US Defense Cloud에서 제공됩니다. 공공·방위 고객이 규정 준수 요구사항이 있는 realm에서 managed PostgreSQL 선택지를 사용할 수 있게 된 점이 핵심입니다.

### 제공 범위 변화

OCI Database with PostgreSQL이 Oracle US Government Cloud와 US Defense Cloud에서 제공됩니다. 공공·방위 고객이 compliance 요구사항이 있는 realm에서 managed PostgreSQL을 사용할 수 있게 된 점이 핵심입니다.

### Government/Defense Cloud 검토 항목

상용 region과 달리 Government/Defense realm은 접근 권한, region availability, compliance boundary, network connectivity가 다를 수 있습니다. 고객이 어떤 realm과 region을 사용할 수 있는지, PostgreSQL service가 대상 region에 표시되는지, backup/DR 정책이 규정 요건을 충족하는지 확인해야 합니다.

```text
도입 확인 항목
- 대상 realm: US Government Cloud 또는 US Defense Cloud
- region/service availability
- compartment/IAM policy
- private subnet, security rule, bastion/access path
- backup retention, encryption, audit requirement
```

### 운영상 영향

Government realm의 운영 절차는 일반 commercial OCI와 다를 수 있으므로, 고객 보안팀과 접속 경로·감사·데이터 반출 제한을 먼저 합의하는 것이 안전합니다.
## HA Availability Domain and Fault Domain Aware Shard Placement
* **Services:** Search with OpenSearch
* **Release Date:** July 27, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/search-opensearch/ad-fd-aware.htm](https://docs.oracle.com/iaas/releasenotes/search-opensearch/ad-fd-aware.htm){:target="_blank" rel="noopener"}
* **Documentation:** [High Availability](https://docs.oracle.com/iaas/Content/search-opensearch/Concepts/high-availability.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Search with OpenSearch에서 HA 구성을 위한 Availability Domain(AD) 및 Fault Domain(FD) aware shard placement를 지원합니다. primary shard와 replica를 서로 다른 AD/FD의 node에 자동 분산해 correlated failure 위험을 줄이는 기능입니다.

### Shard Placement 동작

OCI Search with OpenSearch가 AD/FD aware shard placement를 지원합니다. primary shard와 replica shard를 서로 다른 Availability Domain과 Fault Domain의 node에 자동 분산해 correlated failure 위험을 줄이고 production workload의 resiliency를 높입니다.

### OpenSearch 개념 정리

OpenSearch index는 shard로 나뉘며, replica는 primary shard의 복제본입니다. 같은 shard의 primary와 replica가 같은 장애 도메인에 있으면 장애 시 동시에 영향을 받을 수 있으므로, shard allocation awareness가 중요합니다. OpenSearch community documentation에서도 zone awareness와 shard allocation awareness는 고가용성 cluster의 핵심 개념입니다.

### 운영 확인 예시

```bash
# shard 배치 확인 예시
curl -s "https://<opensearch-endpoint>/_cat/shards?v" \
  -u "$OPENSEARCH_USER:$OPENSEARCH_PASSWORD"

# cluster health 확인
curl -s "https://<opensearch-endpoint>/_cluster/health?pretty" \
  -u "$OPENSEARCH_USER:$OPENSEARCH_PASSWORD"
```

### 설계 주의사항

Replica 수를 늘리면 가용성은 높아지지만 storage와 indexing cost가 증가합니다. Node 수, AD/FD 분산, shard 수, replica 수를 함께 설계해야 합니다.
