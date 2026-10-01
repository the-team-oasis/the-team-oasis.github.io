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

### 업데이트 내용
OCI Cache API endpoint와 cache cluster private endpoint에 IPv6 지원이 추가되었습니다. API의 dual-stack endpoint는 OC1 realm에서 사용할 수 있으며, 기존 IPv4-only endpoint는 계속 제공됩니다.

### IPv6 클러스터 네트워크 조건

새 IPv6 클러스터는 IPv6-enabled VCN과 IPv6-only 또는 dual-stack subnet에 생성해야 하며, 기존 cache cluster를 IPv6로 업그레이드할 수는 없습니다. application host에 IPv6 주소와 private network path를 제공하고, client subnet의 IPv6 CIDR에서 cache endpoint의 TCP 6379 포트로 stateful ingress·대응 egress를 허용합니다. 연결 설정에는 literal IP 대신 endpoint FQDN을 사용합니다. IPv6-enabled cluster의 primary, replica, sharded-node, discovery endpoint FQDN은 AAAA record를 게시하므로, literal IPv6 주소는 연결성 시험에만 사용합니다.

### 참고

- [Release Note: OCI Cache Supports Dual-Stack Endpoints for IPv6](https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-ipv6-support.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: IPv6 Support for OCI Cache](https://docs.oracle.com/iaas/Content/ocicache/ipv6-support.htm){:target="_blank" rel="noopener"}

## Code-only deployment for OCI Functions is now available
* **Services:** Functions
* **Release Date:** September 24, 2026

### 업데이트 내용
OCI Functions는 지원 runtime에서 container image를 직접 build·publish하지 않고 function archive로 배포하는 code-only deployment를 지원합니다. archive에는 ZIP file을 사용하며 Java의 경우 uber JAR도 지원합니다.

### 배포 방식 선택

Console 또는 API에서 지원 runtime을 선택하고 archive를 제공하는 흐름입니다. Oracle 문서는 runtime별·architecture별 packaging rule을 별도로 두므로, archive 생성 전에 handler와 dependency가 선택한 runtime의 packaging requirement를 충족하는지 확인해야 합니다. 이후 archive 교체, handler 변경, runtime setting 변경은 code-only function update 절차를 사용하며, custom OS package 또는 container build 제어가 필요한 function은 image-based deployment를 유지합니다.

### 용어 주석

- **Code-only deployment**: OCI Functions의 managed runtime에서 container image를 직접 만들지 않고 ZIP archive 또는 Java uber JAR로 배포하는 방식입니다. [Creating Functions from Archives](https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_creating-code-only.htm){:target="_blank" rel="noopener"}

### 참고

- [Release Note: Code-only deployment for OCI Functions is now available](https://docs.oracle.com/iaas/releasenotes/functions/functions-code-only-functions.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Creating Functions from Archives (Code-only Functions)](https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_creating-code-only.htm){:target="_blank" rel="noopener"}

## Client ID Metadata Document Support for OAuth Clients
* **Services:** IAM
* **Release Date:** September 23, 2026

### 업데이트 내용
IAM identity domain의 OAuth client가 안정된 HTTPS URL의 Client ID Metadata Document를 사용할 수 있습니다. 지속적인 client registration 관리 부담을 줄이는 방식입니다.

### 보안 조건

Client ID Metadata Document(CIMD)는 client가 호스팅하는 stable HTTPS URL을 OAuth `client_id`로 사용합니다. 문서에는 redirect URI, grant type, response type, token endpoint authentication method 같은 OAuth 설정을 둡니다. identity domain은 metadata location의 신뢰 여부와 retrieved metadata를 검증하지만, 보호 자원 접근 권한을 자동으로 부여하지는 않습니다. resource application의 별도 authorization, redirect URI validation, scope·token validation은 계속 적용됩니다.

### 용어 주석

- **OAuth client**: OAuth 흐름에서 client identifier와 redirect·metadata 설정을 사용하는 애플리케이션 등록 단위입니다. [Client ID Metadata Documents](https://docs.oracle.com/iaas/Content/Identity/applications/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}
- **CIMD (Client ID Metadata Document)**: stable HTTPS URL에 client metadata를 게시하고 그 URL을 OAuth `client_id`로 쓰는 방식입니다. [Client ID Metadata Documents](https://docs.oracle.com/iaas/Content/Identity/applications/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}

### 참고

- [Release Note: Client ID Metadata Document Support for OAuth Clients](https://docs.oracle.com/iaas/releasenotes/identity/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Client ID Metadata Documents](https://docs.oracle.com/iaas/Content/Identity/applications/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}

## Cross-Region Replication for OCI Cache
* **Services:** OCI Cache
* **Release Date:** September 09, 2026

### 업데이트 내용
OCI Cache가 primary cache cluster에서 다른 OCI region의 secondary cache cluster로 비동기 cross-region replication을 지원합니다. primary는 read/write를 처리하고 secondary는 read-only로 변경 사항을 지속 수신하므로, 글로벌 read와 DR에 사용할 수 있습니다.

### DR 설계

primary·secondary는 서로 다른 region에 있어야 하며, cache engine version, cluster mode, node당 memory가 일치해야 합니다. 두 cluster는 최소 8 GB/node의 non-sharded cluster여야 하고, custom configuration set의 `reserved-memory-percentage`, `maxmemory-policy`, 필요 시 `databases` 값을 맞춥니다. 설정·ACL user는 자동 복제되지 않으므로 두 region에 각각 준비합니다. planned switchover에는 두 region과 두 cluster가 모두 가용해야 하며, 시작 전 application write를 중지합니다. primary region 장애 시에는 automatic failover가 없으므로 secondary를 standalone으로 전환하고 application endpoint를 갱신하는 절차를 runbook에 둡니다.

### 용어 주석

- **Cross-region replication**: primary cache cluster의 데이터를 다른 리전 secondary cluster로 복제하는 OCI Cache 기능입니다. [OCI Cache Cross-Region Replication](https://docs.oracle.com/iaas/Content/ocicache/cross-region-replication.htm){:target="_blank" rel="noopener"}

### 참고

- [Release Note: Cross-Region Replication for OCI Cache](https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-cross-region-replication.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: OCI Cache Cross-Region Replication](https://docs.oracle.com/iaas/Content/ocicache/cross-region-replication.htm){:target="_blank" rel="noopener"}
