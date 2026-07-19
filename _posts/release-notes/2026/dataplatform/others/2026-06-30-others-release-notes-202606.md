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

---

## OpenSearch Version 3.6 Support

* **Services:** Search with OpenSearch
* **Release Date:** June 23, 2026
* **Release Note:** [OpenSearch Version 3.6 Support](https://docs.oracle.com/iaas/releasenotes/search-opensearch/opensearch-v36-support.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Upgrading Search with OpenSearch Cluster Software](https://docs.oracle.com/iaas/Content/search-opensearch/Concepts/supportedversions.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Search with OpenSearch에서 OpenSearch 3.6을 지원합니다. 신규 Cluster를 생성하거나 지원 조건을 충족하는 기존 Cluster를 업그레이드해 AI 기반 검색, Observability, Pull-Based Ingestion, Vector Search 개선 기능을 사용할 수 있습니다.

### 주요 기능

* 신규 Cluster 생성 시 OpenSearch 3.6을 선택할 수 있습니다.
* 지원되는 기존 Cluster를 OpenSearch 3.6으로 업그레이드할 수 있습니다.
* Vector Search와 Query Insights 등 OpenSearch 3.6의 개선 기능을 활용할 수 있습니다.

### 적용 및 검증 포인트

기존 Cluster를 업그레이드하기 전에 Plugin 호환성, Index Format, Snapshot, 유지보수 윈도우를 확인해야 합니다. 테스트 환경에서 클라이언트 연결과 검색 결과를 검증하고, 업그레이드 전후의 주요 지표와 로그를 비교하는 것이 좋습니다.

---

## Dedicated Coordinator Nodes for OCI Search with OpenSearch

* **Services:** Search with OpenSearch
* **Release Date:** June 23, 2026
* **Release Note:** [Dedicated Coordinator Nodes for OCI Search with OpenSearch](https://docs.oracle.com/iaas/releasenotes/search-opensearch/coordinator-nodes.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Coordinator Nodes](https://docs.oracle.com/iaas/Content/search-opensearch/Tasks/creatingsearchclusters.htm#config-coord-nodes){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Search with OpenSearch Cluster에서 전용 Coordinator Node를 사용할 수 있게 되었습니다. 검색 요청 관리와 OpenSearch Dashboards Hosting 같은 조정 작업을 Data Node에서 분리할 수 있습니다.

### 주요 기능

* 검색 요청의 분배와 결과 집계 작업을 Coordinator Node가 담당합니다.
* OpenSearch Dashboards 관련 부하를 Data Node에서 분리할 수 있습니다.
* Data Node가 데이터 저장, Indexing, 검색 처리에 집중하도록 구성할 수 있습니다.

### 적용 및 검증 포인트

검색 요청이 많거나 Dashboards 사용량이 높은 환경에서 Coordinator Node 도입 전후의 Data Node CPU, Memory, 검색 지연 시간을 비교하는 것이 좋습니다. 예상 동시 요청량에 맞춰 Node 수와 Shape을 산정하고 장애 상황의 요청 분산도 함께 확인해야 합니다.

---

## Use Query Insights to Understand OCI Database with PostgreSQL Performance

* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [Use Query Insights to Understand OCI Database with PostgreSQL Performance](https://docs.oracle.com/iaas/releasenotes/postgresql/query-insights.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Understanding OCI Database with PostgreSQL](https://docs.oracle.com/iaas/Content/postgresql/query-insights.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 Query Insights를 사용해 쿼리 성능과 모니터링 정보를 확인할 수 있습니다. 장시간 실행되거나 자원을 많이 사용하는 SQL을 식별하고 Session Activity 추세를 분석해 쿼리 튜닝과 용량 계획에 활용할 수 있습니다.

### 주요 기능

* 장시간 실행되는 SQL과 CPU 또는 I/O 사용량이 높은 SQL을 식별할 수 있습니다.
* Session Activity 추세를 확인해 성능 저하 시점을 분석할 수 있습니다.
* 수집된 정보를 쿼리 튜닝, Scale 조정, 용량 예측에 활용할 수 있습니다.

### 적용 및 검증 포인트

성능 저하가 발생한 시간대와 Query Insights의 상위 SQL 및 Session Activity를 비교해 병목 원인을 확인하는 것이 좋습니다. 수집된 SQL 정보의 보존 기간과 접근 권한도 운영 정책에 맞게 점검해야 합니다.

---

## Kerberos Authentication

* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [Kerberos Authentication](https://docs.oracle.com/iaas/releasenotes/postgresql/kerberos-authentication.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Kerberos Authentication for OCI Database with PostgreSQL](https://docs.oracle.com/iaas/Content/postgresql/kerberos.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 Kerberos 인증을 구성하고 관리할 수 있게 되었습니다. PostgreSQL의 GSSAPI를 통해 Active Directory 또는 MIT Kerberos와 연동하고, 중앙 집중식 Credential 관리와 Single Sign-On을 적용할 수 있습니다.

### 주요 기능

* Kerberos 기반의 중앙 인증 체계를 PostgreSQL 접속에 적용할 수 있습니다.
* GSSAPI를 사용해 비밀번호를 직접 전송하지 않는 인증 흐름을 구성할 수 있습니다.
* Active Directory 또는 MIT Kerberos의 Principal을 PostgreSQL Role과 연결할 수 있습니다.

### 적용 및 검증 포인트

운영 반영 전에는 Realm, Principal, Keytab, DNS와 시간 동기화, PostgreSQL Role Mapping을 확인해야 합니다. 대표 사용자별 인증 성공 및 실패 시나리오와 Keytab 갱신 절차도 테스트하는 것이 좋습니다.

### 사전 조건과 절차

Kerberos 인증은 KDC 기반 중앙 인증 환경을 전제로 합니다. 운영 중인 Kerberos Infrastructure, OCI Vault 접근 권한, KDC 및 OCI 리소스 관리 권한이 필요합니다.

KDC에서 PostgreSQL Endpoint FQDN에 대한 Service Principal과 Keytab을 만들고, Keytab을 안전하게 저장한 뒤 DB System에서 Kerberos 인증을 활성화합니다. Active Directory 환경에서는 다음과 같이 `ktpass`를 사용해 `postgres/<database_fqdn>@realm` 형식의 Principal을 Keytab으로 생성할 수 있습니다.

```bash
ktpass /out odsp.krb5.keytab /princ postgres/<database_fqdn>@<realm> /mapuser <service_user> /crypto AES256-SHA1 +rndpass
```

---

## New Features in OCI Database with PostgreSQL

* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [New Features in OCI Database with PostgreSQL](https://docs.oracle.com/iaas/releasenotes/postgresql/june16-new-features.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Stopping and Starting a Database System](https://docs.oracle.com/iaas/Content/postgresql/stop-start-db.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에 DB System 중지 및 시작 기능과 Warm Standby 복제가 추가되었습니다. 사용하지 않는 시간에 DB System을 중지해 Compute 비용을 줄이고, 시작할 때 기존 Storage와 Network 구성을 유지할 수 있습니다.

Warm Standby 복제는 동일 리전 또는 다른 리전에 지속적으로 갱신되는 Standby DB System을 유지해 RPO SLO 기반의 재해 복구 구성을 지원합니다.

### 주요 기능

* 중지된 DB System은 Compute 과금이 중단되며 기존 Storage와 Network 설정은 유지됩니다.
* 동일 리전 또는 Cross-Region에 Warm Standby를 구성할 수 있습니다.
* 장애나 리전 문제 발생 시 Standby를 활용해 복구 시간을 줄일 수 있습니다.
* 동일 리전에서는 복제를 활용한 수평 확장 시나리오를 검토할 수 있습니다.

### 적용 및 검증 포인트

DB System을 중지하기 전에 애플리케이션 연결과 예약 작업을 정리하고, 재시작 후 Endpoint와 연결이 정상적으로 복원되는지 확인해야 합니다. Warm Standby는 복제 지연, RPO, 전환 절차, 전환 후 애플리케이션 연결 변경을 시험 환경에서 검증하는 것이 좋습니다.

---

## Public connectivity for Kafka clusters

* **Services:** Kafka
* **Release Date:** June 15, 2026
* **Release Note:** [Public connectivity for Kafka clusters](https://docs.oracle.com/iaas/releasenotes/kafka/public-connectivity.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Using Add-ons with Kafka Clusters](https://docs.oracle.com/iaas/Content/kafka/addons-overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Streaming with Apache Kafka Cluster에 Public Connectivity Add-On을 설치해 인터넷에서 접근할 수 있는 Endpoint를 구성할 수 있게 되었습니다. Console의 Kafka Cluster 상세 화면에서 Add-On을 설치, 수정, 제거할 수 있습니다.

### 주요 기능

* 활성 상태의 Kafka Cluster에 Public Connectivity를 Add-On 방식으로 적용할 수 있습니다.
* 접근을 허용할 Network CIDR 범위를 지정할 수 있습니다.
* 온프레미스 또는 다른 클라우드의 Producer와 Consumer를 연결하는 Hybrid 구성을 지원합니다.

### 적용 및 검증 포인트

Public Endpoint를 활성화하기 전에 Kafka ACL과 인증 방식을 먼저 구성해야 합니다. 허용 CIDR 안팎에서 접속을 각각 테스트하고, 인증 실패와 비인가 Topic 접근이 차단되는지 확인하는 것이 좋습니다.

### 보안 조건

Kafka Cluster는 기본적으로 Private Connectivity로 생성됩니다. Public Connectivity Add-On을 설치하기 전에 Apache Kafka ACL을 만들고 Cluster Configuration에 다음 값을 적용하는 것이 안전합니다.

```properties
allow.everyone.if.no.acl.found=false
```

Add-On 설정 시에는 SASL/SCRAM 또는 mTLS 같은 Kafka 인증 방식을 유지하고 접근을 허용할 Network CIDR 범위를 지정합니다. Public Endpoint는 Hybrid Workload와 마이그레이션에 유용하지만, CIDR 제한, ACL, 인증을 함께 적용하지 않으면 외부 노출 범위가 커지므로 운영 전 보안 검토가 필요합니다.

---

## Streaming with Apache Kafka support for Apache Kafka 4.0.0

* **Services:** Kafka
* **Release Date:** June 12, 2026
* **Release Note:** [Streaming with Apache Kafka support for Apache Kafka 4.0.0](https://docs.oracle.com/iaas/releasenotes/kafka/kafka-4-0.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Supported Apache Kafka Versions](https://docs.oracle.com/iaas/Content/kafka/versions.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Streaming with Apache Kafka에서 Apache Kafka 4.0.0을 지원합니다. Kafka 4.0.0은 KRaft만 Coordination Mode로 지원하며 ZooKeeper는 지원하지 않습니다.

### 주요 기능

* 신규 Kafka Cluster 생성 시 Apache Kafka 4.0.0을 선택할 수 있습니다.
* ZooKeeper 없이 KRaft 기반으로 Cluster Metadata를 관리합니다.
* Kafka 4.0.0과 호환되는 Client 및 Connector를 사용할 수 있습니다.

### 적용 및 검증 포인트

신규 Cluster 또는 업그레이드를 계획할 때 ZooKeeper 기반 운영 절차와 모니터링, 백업 및 복구 방식을 KRaft 기준으로 재검토해야 합니다. Kafka Client Library와 Connector의 4.0.0 호환성을 확인하고, 테스트 환경에서 Produce, Consume, Rebalance 동작을 검증하는 것이 좋습니다.
