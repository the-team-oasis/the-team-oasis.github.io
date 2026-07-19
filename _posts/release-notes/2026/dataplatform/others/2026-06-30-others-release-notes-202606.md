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
* TOC
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

### 주요 확인 포인트

* 새 버전 또는 지원 범위가 실제 생성·업그레이드 화면에서 선택 가능한지 확인해야 합니다.
* 기존 운영 버전과의 호환성, 패치 정책, 롤백 가능성을 함께 검토하는 것이 좋습니다.
* 운영 반영 전에는 테스트 환경에서 연결, 모니터링, 백업 또는 복구 절차가 기존과 동일하게 동작하는지 확인해야 합니다.

### 적용 및 검증 포인트

버전 업데이트 성격의 항목은 기능 자체보다 적용 시점과 호환성 확인이 중요합니다. Console/API에서 대상 버전이 보이는지, 기존 클라이언트와 드라이버가 영향을 받지 않는지, 업그레이드 후 주요 metric과 log에 이상이 없는지 점검하는 방식으로 검증하면 좋습니다.

## Dedicated Coordinator Nodes for OCI Search with OpenSearch
* **Services:** Search with OpenSearch
* **Release Date:** June 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/search-opensearch/coordinator-nodes.htm](https://docs.oracle.com/iaas/releasenotes/search-opensearch/coordinator-nodes.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Coordinator Nodes](https://docs.oracle.com/iaas/Content/search-opensearch/Tasks/creatingsearchclusters.htm#config-coord-nodes){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Search with OpenSearch cluster에서 dedicated coordinator node를 사용할 수 있게 되었습니다. coordinator node는 search request 관리와 OpenSearch Dashboards hosting 같은 coordination task를 data node에서 분리합니다.

production cluster에서는 data node가 storage, indexing, search operation에 집중할 수 있어 workload isolation과 전반적인 성능 안정성에 도움이 됩니다. 검색 요청이 많거나 Dashboards 사용량이 높은 환경에서는 coordinator node 도입을 통해 data node resource pressure를 줄일 수 있습니다.

### 주요 변경 포인트

* 데이터 서비스의 운영, 성능 분석, 접속 방식, 가용성 옵션을 보완하는 업데이트입니다.
* 새 기능을 적용하면 성능 병목 분석, 인증 통합, 클라이언트 접근 경로, 버전 선택 같은 운영 선택지가 늘어납니다.
* 기존 cluster 또는 DB system에 적용할 때는 서비스별 prerequisites와 network/security 설정을 같이 확인해야 합니다.

### 적용 및 검증 포인트

테스트 환경에서 새 옵션을 활성화한 뒤 metric, log, client connection, failover 또는 stop/start 동작을 확인하는 것이 좋습니다. 운영 반영 시에는 지원 region과 version, endpoint 접근 정책, 백업/복구 계획을 함께 점검해야 합니다.

## Use Query Insights to Understand OCI Database with PostgreSQL Performance
* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/postgresql/query-insights.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/query-insights.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Understanding OCI Database with PostgreSQL](https://docs.oracle.com/iaas/Content/postgresql/query-insights.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 Query Insights를 사용해 query performance와 monitoring 정보를 확인할 수 있습니다. long-running 또는 resource-intensive SQL statement를 식별하고 session activity trend를 파악해 query tuning, capacity planning, forecasting에 활용할 수 있습니다.

운영 활용은 병목 SQL 탐지와 용량 계획입니다. 애플리케이션 성능 저하가 발생했을 때 CPU/IO 사용량이 높은 쿼리를 확인하고, 최근 activity trend를 기준으로 scaling 또는 data model 조정 필요성을 판단할 수 있습니다.

### 주요 변경 포인트

* 데이터 서비스의 운영, 성능 분석, 접속 방식, 가용성 옵션을 보완하는 업데이트입니다.
* 새 기능을 적용하면 성능 병목 분석, 인증 통합, 클라이언트 접근 경로, 버전 선택 같은 운영 선택지가 늘어납니다.
* 기존 cluster 또는 DB system에 적용할 때는 서비스별 prerequisites와 network/security 설정을 같이 확인해야 합니다.

### 적용 및 검증 포인트

테스트 환경에서 새 옵션을 활성화한 뒤 metric, log, client connection, failover 또는 stop/start 동작을 확인하는 것이 좋습니다. 운영 반영 시에는 지원 region과 version, endpoint 접근 정책, 백업/복구 계획을 함께 점검해야 합니다.

## Kerberos Authentication
* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/postgresql/kerberos-authentication.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/kerberos-authentication.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Kerberos Authentication for OCI Database with PostgreSQL](https://docs.oracle.com/iaas/Content/postgresql/kerberos.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 Kerberos authentication을 enable/manage할 수 있게 되었습니다. PostgreSQL의 built-in GSSAPI를 통해 중앙 credential management, single sign-on, passwordless network authentication flow, Active Directory 또는 MIT Kerberos 같은 enterprise identity system 연동을 지원합니다.

활용 시나리오는 기업 표준 인증 체계를 PostgreSQL database 접근에 적용하고, 사용자의 DB password 관리를 줄이는 것입니다. 적용 전에는 Kerberos realm, principal, keytab, client 환경, DB user mapping을 정리해야 합니다.

### 주요 변경 포인트

* 서비스의 사용 방식 또는 운영 옵션이 확장되었습니다.
* 기존 운영 절차와 자동화 스크립트에 영향을 줄 수 있는 설정 항목을 먼저 확인하는 것이 좋습니다.
* Console, API, CLI 중 실제 운영에서 사용하는 경로 기준으로 적용 가능 여부를 검증해야 합니다.

### 적용 및 검증 포인트

운영 반영 전에는 테스트 환경에서 생성·수정·조회·삭제 흐름을 확인하고, 관련 IAM policy, network path, logging/monitoring 지표를 함께 점검하는 것이 좋습니다.

### 사전 조건과 절차

OCI Database with PostgreSQL의 Kerberos authentication은 PostgreSQL의 GSSAPI를 사용하며, Active Directory나 MIT Kerberos 같은 KDC 기반 중앙 인증 환경을 전제로 합니다. 사전 조건에는 운영 중인 Kerberos infrastructure, OCI Vault 접근 및 권한, KDC와 OCI resource에 대한 privileged access, PostgreSQL role 관리 이해가 포함됩니다.

설정은 KDC에서 PostgreSQL endpoint FQDN에 대한 service principal과 keytab을 만들고, keytab을 안전하게 저장한 뒤 DB system에서 Kerberos authentication을 enable하는 흐름입니다. Active Directory 환경에서는 다음처럼 `ktpass`를 사용해 `postgres/<database_fqdn>@realm` 형식의 principal을 keytab으로 생성할 수 있습니다.

```bash
ktpass /out odsp.krb5.keytab /princ postgres/<database_fqdn>@<realm> /mapuser <service_user> /crypto AES256-SHA1 +rndpass
```

## New Features in OCI Database with PostgreSQL
* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/postgresql/june16-new-features.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/june16-new-features.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Stopping and Starting a Database System](https://docs.oracle.com/iaas/Content/postgresql/stop-start-db.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에 database system stop/start와 replication with warm standby가 추가되었습니다. stop/start는 사용하지 않는 시간에 system을 중지해 Compute billing을 줄이고, start 시 기존 storage와 network 설정을 유지한 채 기능을 복원합니다.

Replication with warm standby는 같은 region 또는 cross-region에 continuously updated standby database system을 유지해 RPO SLO 기반 DR 구성을 지원합니다. 장애나 region 이슈에 대비해 recovery time을 줄이고, 같은 region에서는 8-node 제한을 넘어서는 horizontal scaling 시나리오도 검토할 수 있습니다.

### 주요 변경 포인트

* 데이터 서비스의 운영, 성능 분석, 접속 방식, 가용성 옵션을 보완하는 업데이트입니다.
* 새 기능을 적용하면 성능 병목 분석, 인증 통합, 클라이언트 접근 경로, 버전 선택 같은 운영 선택지가 늘어납니다.
* 기존 cluster 또는 DB system에 적용할 때는 서비스별 prerequisites와 network/security 설정을 같이 확인해야 합니다.

### 적용 및 검증 포인트

테스트 환경에서 새 옵션을 활성화한 뒤 metric, log, client connection, failover 또는 stop/start 동작을 확인하는 것이 좋습니다. 운영 반영 시에는 지원 region과 version, endpoint 접근 정책, 백업/복구 계획을 함께 점검해야 합니다.

## Public connectivity for Kafka clusters
* **Services:** Kafka
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/kafka/public-connectivity.htm](https://docs.oracle.com/iaas/releasenotes/kafka/public-connectivity.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Using Add-ons with Kafka Clusters](https://docs.oracle.com/iaas/Content/kafka/addons-overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Streaming with Apache Kafka cluster는 기본적으로 private connectivity로 생성되지만, 이제 public connectivity add-on을 설치해 active Kafka cluster를 public internet에서 접근 가능하게 구성할 수 있습니다. Console의 Kafka cluster details page에서 add-on을 install, update, uninstall할 수 있습니다.

활용 시나리오는 on-premises나 다른 cloud에서 Kafka cluster로 연결해야 하는 migration, hybrid integration, 외부 producer/consumer 연동입니다. 단, public endpoint는 노출 범위가 커지므로 인증, network allowlist, client certificate/credential 관리, audit를 함께 설계해야 합니다.

### 주요 변경 포인트

* 데이터 서비스의 운영, 성능 분석, 접속 방식, 가용성 옵션을 보완하는 업데이트입니다.
* 새 기능을 적용하면 성능 병목 분석, 인증 통합, 클라이언트 접근 경로, 버전 선택 같은 운영 선택지가 늘어납니다.
* 기존 cluster 또는 DB system에 적용할 때는 서비스별 prerequisites와 network/security 설정을 같이 확인해야 합니다.

### 적용 및 검증 포인트

테스트 환경에서 새 옵션을 활성화한 뒤 metric, log, client connection, failover 또는 stop/start 동작을 확인하는 것이 좋습니다. 운영 반영 시에는 지원 region과 version, endpoint 접근 정책, 백업/복구 계획을 함께 점검해야 합니다.

### 보안 조건

OCI Streaming with Apache Kafka cluster는 기본적으로 private connectivity로 생성되며, public connectivity는 add-on으로 설치합니다. public connectivity add-on을 설치하기 전에는 먼저 Apache Kafka ACL을 만들고, cluster configuration의 다음 값을 적용하는 것이 안전합니다.

```properties
allow.everyone.if.no.acl.found=false
```

Add-on 설정 시에는 SASL/SCRAM 또는 mTLS 같은 Kafka 내장 인증 방식을 유지하고, 접근을 허용할 Network CIDR range를 지정합니다. Public endpoint는 hybrid workload와 migration에 유용하지만, CIDR 제한·ACL·인증을 함께 적용하지 않으면 외부 노출면이 커지므로 운영 전 보안 검토가 필수입니다.

## Streaming with Apache Kafka support for Apache Kafka 4.0.0
* **Services:** Kafka
* **Release Date:** June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/kafka/kafka-4-0.htm](https://docs.oracle.com/iaas/releasenotes/kafka/kafka-4-0.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Supported Apache Kafka Versions](https://docs.oracle.com/iaas/Content/kafka/versions.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Streaming with Apache Kafka가 Apache Kafka 4.0.0을 지원합니다. Kafka 4.0.0부터는 supported coordination mode가 KRaft뿐이며 ZooKeeper는 지원되지 않습니다.

신규 cluster나 업그레이드 계획이 있는 고객은 ZooKeeper 기반 운영 절차, monitoring, backup/restore, client compatibility를 KRaft 기준으로 재검토해야 합니다. 적용 전에는 Kafka client library와 connector가 4.0.0 및 KRaft 환경을 지원하는지 확인하는 것이 좋습니다.

### 주요 확인 포인트

* 새 버전 또는 지원 범위가 실제 생성·업그레이드 화면에서 선택 가능한지 확인해야 합니다.
* 기존 운영 버전과의 호환성, 패치 정책, 롤백 가능성을 함께 검토하는 것이 좋습니다.
* 운영 반영 전에는 테스트 환경에서 연결, 모니터링, 백업 또는 복구 절차가 기존과 동일하게 동작하는지 확인해야 합니다.

### 적용 및 검증 포인트

버전 업데이트 성격의 항목은 기능 자체보다 적용 시점과 호환성 확인이 중요합니다. Console/API에서 대상 버전이 보이는지, 기존 클라이언트와 드라이버가 영향을 받지 않는지, 업그레이드 후 주요 metric과 log에 이상이 없는지 점검하는 방식으로 검증하면 좋습니다.
