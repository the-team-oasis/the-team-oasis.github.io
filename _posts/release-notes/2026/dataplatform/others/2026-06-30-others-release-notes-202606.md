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

### 업데이트 내용

OCI Search with OpenSearch가 OpenSearch 3.6을 지원합니다. OpenSearch는 검색, 로그 분석, 관측성 분석에 사용되는 오픈소스 검색·분석 엔진입니다.

새 버전 지원은 신규 클러스터 생성이나 기존 클러스터 업그레이드 선택지를 넓힙니다. 업그레이드 전에는 플러그인 호환성, 인덱스 포맷, 클라이언트 라이브러리 버전을 확인해야 합니다.

## Dedicated Coordinator Nodes for OCI Search with OpenSearch
* **Services:** Search with OpenSearch
* **Release Date:** June 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/search-opensearch/coordinator-nodes.htm](https://docs.oracle.com/iaas/releasenotes/search-opensearch/coordinator-nodes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Search with OpenSearch에서 dedicated coordinator node를 사용할 수 있게 되었습니다. Coordinator node는 검색 요청 분산, 집계, 결과 조합 같은 조정 작업을 담당해 데이터 노드의 부담을 줄입니다.

검색 트래픽이 많거나 집계 쿼리가 많은 클러스터에서는 coordinator node를 분리해 안정성과 확장성을 높일 수 있습니다. 성능 병목이 데이터 저장 노드인지 요청 조정 계층인지 구분하는 데도 도움이 됩니다.

## Use Query Insights to Understand OCI Database with PostgreSQL Performance
* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/postgresql/query-insights.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/query-insights.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 Query Insights를 사용해 쿼리 성능을 분석할 수 있습니다. Query Insights는 느린 쿼리, 리소스 사용량, 실행 패턴을 파악해 성능 튜닝과 용량 계획에 도움을 줍니다.

PostgreSQL 운영자는 문제 SQL을 더 빠르게 찾고 인덱스, 쿼리 구조, 리소스 구성을 조정할 수 있습니다. 애플리케이션 성능 저하 원인이 DB인지 확인하는 데도 유용합니다.

## Kerberos Authentication
* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/postgresql/kerberos-authentication.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/kerberos-authentication.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 Kerberos 인증을 활성화하고 관리할 수 있습니다. Kerberos는 티켓 기반 인증 프로토콜로, 사용자의 비밀번호를 서비스에 직접 전달하지 않고 인증 서버가 발급한 티켓으로 접근을 검증합니다.

엔터프라이즈 환경에서는 중앙 인증 체계와 PostgreSQL 접근 제어를 연계할 수 있다는 점이 중요합니다. 보안팀은 키탭, KDC, 사용자 매핑, 접속 정책을 함께 검토해야 합니다.

## New Features in OCI Database with PostgreSQL
* **Services:** OCI Database with PostgreSQL
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/postgresql/june16-new-features.htm](https://docs.oracle.com/iaas/releasenotes/postgresql/june16-new-features.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에 DB system 중지/시작 등 신규 기능이 추가되었습니다. 관리형 PostgreSQL에서 운영자가 유지보수나 비용 최적화 목적으로 시스템 수명주기를 더 유연하게 제어할 수 있습니다.

개발·테스트 환경에서는 사용하지 않는 시간에 시스템을 중지해 비용을 절감할 수 있습니다. 운영 환경에서는 중지/시작 절차가 애플리케이션 연결과 모니터링에 미치는 영향을 사전에 확인해야 합니다.

## Public connectivity for Kafka clusters
* **Services:** Kafka
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/kafka/public-connectivity.htm](https://docs.oracle.com/iaas/releasenotes/kafka/public-connectivity.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Kafka 클러스터에 public connectivity 옵션이 추가되었습니다. 기본적으로 Kafka 클러스터는 VCN 내부 private connectivity로 생성되지만, 이제 요구사항에 따라 공용 연결을 구성할 수 있습니다.

Apache Kafka는 이벤트 스트리밍 플랫폼으로, 애플리케이션 간 이벤트 전달과 로그성 데이터 파이프라인에 널리 사용됩니다. Public connectivity를 사용할 때는 접근 제어, TLS, 인증, 네트워크 보안 정책을 반드시 함께 검토해야 합니다.

## Streaming with Apache Kafka support for Apache Kafka 4.0.0
* **Services:** Kafka
* **Release Date:** June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/kafka/kafka-4-0.htm](https://docs.oracle.com/iaas/releasenotes/kafka/kafka-4-0.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Streaming with Apache Kafka가 Apache Kafka 4.0.0을 지원합니다. Kafka 4.0.0부터는 ZooKeeper 없는 KRaft 기반 운영이 중심이 되는 등 운영 모델 변화가 있습니다.

스트리밍 플랫폼을 운영하는 팀은 클라이언트 호환성, 브로커 버전, 운영 도구 지원 여부를 검토해야 합니다. 신규 버전 지원은 장기적으로 Kafka 운영 단순화와 성능 개선 선택지를 제공합니다.
