---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "9월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2026년 9월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2026-cloudnative-security
tags:
  - oci-release-notes-2026
  - Sep-2026
  - cloudnative
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

## OCI Cache Supports Dual-Stack Endpoints for IPv6
* **Services:** OCI Cache
* **Release Date:** September 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-ipv6-support.htm](https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-ipv6-support.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/ocicache/ipv6-support.htm](https://docs.oracle.com/iaas/Content/ocicache/ipv6-support.htm){:target="_blank" rel="noopener"}
### IPv6 연결 지원
OCI Cache API와 cache cluster에 IPv6와 IPv4를 함께 지원하는 dual-stack endpoint가 추가되었습니다. IPv6 네트워크의 client는 기존 IPv4 호환성을 유지하면서 연결 경로를 전환할 수 있습니다.

### 적용 및 검증 포인트

Dual-stack endpoint는 IPv4와 IPv6 주소로 해석될 수 있는 API endpoint입니다. IPv6 네트워크에서 OCI Cache를 호출하려면 client DNS·egress·보안 정책이 IPv6 경로를 허용하는지 확인하고, IPv4/IPv6 모두에서 연결을 시험합니다.

## Code-only deployment for OCI Functions is now available
* **Services:** Functions
* **Release Date:** September 24, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-code-only-functions.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-code-only-functions.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_creating-code-only.htm](https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_creating-code-only.htm){:target="_blank" rel="noopener"}
### 지원 범위와 적용 대상
Go·Java·Node.js·Python managed runtime에서 container image를 직접 만들지 않는 code-only deployment를 지원합니다. ZIP archive 또는 지원되는 Java uber JAR 배포 흐름을 선택할 수 있습니다.

### 배포 방식 선택

Code-only deployment는 지원되는 managed runtime에서 container image를 직접 만들지 않고 ZIP archive 또는 Java uber JAR로 배포하는 방식입니다. runtime과 artifact 형식을 확인한 뒤 함수 실행·의존성 로딩·로그를 검증하고, image 기반 배포가 필요한 dependency는 기존 방식을 유지합니다.

## Client ID Metadata Document Support for OAuth Clients
* **Services:** IAM
* **Release Date:** September 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/identity/client-id-metadata-documents.htm](https://docs.oracle.com/iaas/releasenotes/identity/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/Identity/applications/client-id-metadata-documents.htm](https://docs.oracle.com/iaas/Content/Identity/applications/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}
### 기능 변경과 적용 범위
IAM identity domain의 OAuth client가 안정된 HTTPS URL의 Client ID Metadata Document를 사용할 수 있습니다. 지속적인 client registration 관리 부담을 줄이는 방식입니다.

### 보안 조건

Client ID Metadata Document는 안정된 HTTPS URL에서 제공되어야 하므로, 문서 URL의 가용성·TLS 인증서·내용 변경 통제를 client 등록 절차에 포함해야 합니다. 적용 후에는 identity domain이 metadata를 읽고 OAuth client 설정이 예상대로 유지되는지 확인합니다.

## Cross-Region Replication for OCI Cache
* **Services:** OCI Cache
* **Release Date:** September 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-cross-region-replication.htm](https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-cross-region-replication.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/ocicache/cross-region-replication.htm](https://docs.oracle.com/iaas/Content/ocicache/cross-region-replication.htm){:target="_blank" rel="noopener"}
### 복제 구성과 데이터 보호
OCI Cache가 primary cache cluster에서 다른 region의 secondary cluster로 비동기 cross-region replication을 지원합니다. DR 및 글로벌 read 전략에 replication lag와 failover 절차를 포함해야 합니다.

### DR 설계

Primary와 secondary cache cluster의 역할, 비동기 replication lag, failover 책임을 DR runbook에 명시해야 합니다. 복제 설정 후에는 secondary의 데이터 동기화와 장애 전환 절차를 비운영 환경에서 시험합니다.

## 용어 주석

- **Code-only deployment**: OCI Functions의 managed runtime에서 container image를 직접 만들지 않고 ZIP archive 또는 Java uber JAR로 배포하는 방식입니다. [Creating Functions from Archives](https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_creating-code-only.htm){:target="_blank" rel="noopener"}
- **OAuth client**: OAuth 흐름에서 client identifier와 redirect·metadata 설정을 사용하는 애플리케이션 등록 단위입니다. [Client ID Metadata Documents](https://docs.oracle.com/iaas/Content/Identity/applications/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}
- **Cross-region replication**: primary cache cluster의 데이터를 다른 리전 secondary cluster로 복제하는 OCI Cache 기능입니다. [OCI Cache Cross-Region Replication](https://docs.oracle.com/iaas/Content/ocicache/cross-region-replication.htm){:target="_blank" rel="noopener"}
