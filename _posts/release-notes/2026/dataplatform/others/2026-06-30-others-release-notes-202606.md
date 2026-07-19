---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "6월 OCI Database Service - Others 업데이트 소식"
teaser: "2026년 6월 OCI Database Service - Others 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-others

tags:
  - oci-release-notes-2026
  - Jun-2026
  - Others
  - PostgreSQL
  - OpenSearch
  - Kafka
  - Redis

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

## OpenSearch Version 3.6 Support
* **Services:** Search with OpenSearch
* **Release Date:** June 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/search-opensearch/opensearch-v36-support.htm](https://docs.oracle.com/iaas/releasenotes/search-opensearch/opensearch-v36-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Upgrading Search with OpenSearch Cluster Software](https://docs.oracle.com/iaas/Content/search-opensearch/Concepts/supportedversions.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Search with OpenSearch가 OpenSearch 3.6을 지원합니다. 신규 cluster 생성 또는 eligible existing cluster upgrade를 통해 AI-powered search, observability, pull-based ingestion GA, vector search 개선, Query Insights 향상 같은 기능을 사용할 수 있습니다.

운영 영향은 검색·로그 분석·벡터 검색 workload의 기능 선택지가 넓어진다는 점입니다. 기존 cluster를 업그레이드할 때는 plugin compatibility, index format, snapshot/backup, maintenance window를 먼저 확인해야 합니다.

검증은 staging cluster에서 upgrade path를 확인하고, 주요 query latency, dashboard, ingestion pipeline, vector search 결과가 기존과 호환되는지 비교하는 방식이 적절합니다.

## Dedicated Coordinator Nodes for OCI Search with OpenSearch
* **Services:** Search with OpenSearch
* **Release Date:** June 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/search-opensearch/coordinator-nodes.htm](https://docs.oracle.com/iaas/releasenotes/search-opensearch/coordinator-nodes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Search with OpenSearch cluster에서 dedicated coordinator node를 사용할 수 있게 되었습니다. coordinator node는 search request 관리와 OpenSearch Dashboards hosting 같은 coordination task를 data node에서 분리합니다.

production cluster에서는 data node가 storage, indexing, search operation에 집중할 수 있어 workload isolation과 전반적인 성능 안정성에 도움이 됩니다. 검색 요청이 많거나 Dashboards 사용량이 높은 환경에서는 coordinator node 도입을 통해 data node resource pressure를 줄일 수 있습니다.

적용 전에는 현재 cluster의 query load, dashboard 사용 패턴, data node CPU/memory pressure를 확인해야 합니다. 적용 후에는 search latency, data node resource 사용률, coordinator node 병목 여부를 함께 모니터링하는 것이 좋습니다.

## Use Query Insights to Understand OCI Database with PostgreSQL Performance
* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/postgresql/query-insights.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/query-insights.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Understanding OCI Database with PostgreSQL](https://docs.oracle.com/iaas/Content/postgresql/query-insights.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 Query Insights를 사용해 query performance와 monitoring 정보를 확인할 수 있습니다. long-running 또는 resource-intensive SQL statement를 식별하고 session activity trend를 파악해 query tuning, capacity planning, forecasting에 활용할 수 있습니다.

운영 활용은 병목 SQL 탐지와 용량 계획입니다. 애플리케이션 성능 저하가 발생했을 때 CPU/IO 사용량이 높은 쿼리를 확인하고, 최근 activity trend를 기준으로 scaling 또는 data model 조정 필요성을 판단할 수 있습니다.

검증 시에는 대표 workload 실행 후 Query Insights에 주요 SQL이 수집되는지, resource usage 지표가 실제 DB 부하와 맞는지, tuning 전후 latency와 실행 계획 변화가 확인되는지 살펴보면 됩니다.

## Kerberos Authentication
* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/postgresql/kerberos-authentication.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/kerberos-authentication.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Kerberos Authentication for OCI Database with PostgreSQL](https://docs.oracle.com/iaas/Content/postgresql/kerberos.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 Kerberos authentication을 enable/manage할 수 있게 되었습니다. PostgreSQL의 built-in GSSAPI를 통해 중앙 credential management, single sign-on, passwordless network authentication flow, Active Directory 또는 MIT Kerberos 같은 enterprise identity system 연동을 지원합니다.

활용 시나리오는 기업 표준 인증 체계를 PostgreSQL database 접근에 적용하고, 사용자의 DB password 관리를 줄이는 것입니다. 적용 전에는 Kerberos realm, principal, keytab, client 환경, DB user mapping을 정리해야 합니다.

검증은 Kerberos ticket 발급, PostgreSQL 접속, 권한 매핑, password fallback 차단 여부를 순서대로 확인하는 것이 좋습니다.

## New Features in OCI Database with PostgreSQL
* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/postgresql/june16-new-features.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/june16-new-features.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Stopping and Starting a Database System](https://docs.oracle.com/iaas/Content/postgresql/stop-start-db.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에 database system stop/start와 replication with warm standby가 추가되었습니다. stop/start는 사용하지 않는 시간에 system을 중지해 Compute billing을 줄이고, start 시 기존 storage와 network 설정을 유지한 채 기능을 복원합니다.

Replication with warm standby는 같은 region 또는 cross-region에 continuously updated standby database system을 유지해 RPO SLO 기반 DR 구성을 지원합니다. 장애나 region 이슈에 대비해 recovery time을 줄이고, 같은 region에서는 8-node 제한을 넘어서는 horizontal scaling 시나리오도 검토할 수 있습니다.

적용 시에는 업무 시간/비업무 시간에 따른 stop/start 정책, standby region, replication lag, failover 절차를 함께 설계해야 합니다. 검증은 중지/시작 후 endpoint와 connection 복구, warm standby 동기화 상태, DR 전환 리허설로 진행하는 것이 좋습니다.

## Public connectivity for Kafka clusters
* **Services:** Kafka
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/kafka/public-connectivity.htm](https://docs.oracle.com/iaas/releasenotes/kafka/public-connectivity.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Using Add-ons with Kafka Clusters](https://docs.oracle.com/iaas/Content/kafka/addons-overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Streaming with Apache Kafka cluster는 기본적으로 private connectivity로 생성되지만, 이제 public connectivity add-on을 설치해 active Kafka cluster를 public internet에서 접근 가능하게 구성할 수 있습니다. Console의 Kafka cluster details page에서 add-on을 install, update, uninstall할 수 있습니다.

활용 시나리오는 on-premises나 다른 cloud에서 Kafka cluster로 연결해야 하는 migration, hybrid integration, 외부 producer/consumer 연동입니다. 단, public endpoint는 노출 범위가 커지므로 인증, network allowlist, client certificate/credential 관리, audit를 함께 설계해야 합니다.

검증은 add-on 설치 후 외부 client bootstrap 연결, 인증 실패/성공 케이스, private client 영향 여부, 보안 정책과 logging을 확인하는 방식이 적절합니다.

## Streaming with Apache Kafka support for Apache Kafka 4.0.0
* **Services:** Kafka
* **Release Date:** June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/kafka/kafka-4-0.htm](https://docs.oracle.com/iaas/releasenotes/kafka/kafka-4-0.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Supported Apache Kafka Versions](https://docs.oracle.com/iaas/Content/kafka/versions.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Streaming with Apache Kafka가 Apache Kafka 4.0.0을 지원합니다. Kafka 4.0.0부터는 supported coordination mode가 KRaft뿐이며 ZooKeeper는 지원되지 않습니다.

신규 cluster나 업그레이드 계획이 있는 고객은 ZooKeeper 기반 운영 절차, monitoring, backup/restore, client compatibility를 KRaft 기준으로 재검토해야 합니다. 적용 전에는 Kafka client library와 connector가 4.0.0 및 KRaft 환경을 지원하는지 확인하는 것이 좋습니다.
