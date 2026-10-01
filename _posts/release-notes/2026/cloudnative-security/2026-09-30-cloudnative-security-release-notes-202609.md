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

### archive 준비와 적용 조건

Code-only function은 container image가 아니라 archive에서 배포합니다. 지원 managed runtime은 Go, Java, Node.js, Python이며, 선택한 runtime과 application architecture에 맞는 source·dependency archive를 먼저 준비합니다. Java·Python·Node.js는 생성 시 handler가 필요하고, Go archive에는 지정 위치의 Linux executable `func`가 있어야 하므로 별도 handler를 지정하지 않습니다. 대상 region에서 기능이 제공되고, 기존 Functions application 및 Functions resource 생성·갱신 권한이 있어야 합니다.

### Fn Project CLI 사용 흐름

아래 명령은 **새 local function directory에서**, 원하는 compartment·region으로 설정된 Fn Project CLI context를 사용해 실행합니다. `fn init` 뒤에는 runtime별 source 파일과 dependency를 해당 directory에 준비합니다. `<runtime-name>`은 `fn list runtimes`와 `fn list runtime-versions --runtime-name <runtime-name>`로 확인한 지원 runtime/version으로, `<app-name>`은 미리 만든 OCI Functions application으로 바꿉니다.

```bash
fn init --code-only --runtime-name <runtime-name> --runtime-config-type function-update
# 생성된 func.yaml 및 runtime별 source·dependency를 준비
fn build
fn deploy --app <app-name>
fn invoke <app-name> <function-name>
```

`fn build`는 local directory의 `func.yaml`과 active context를 사용해 archive를 만들고, `fn deploy --app`은 archive를 배포합니다. `fn invoke`는 개발 환경의 동기 호출 확인에 사용합니다. Oracle은 production system에서 Fn Project CLI 호출을 권장하지 않으므로 운영 호출은 OCI CLI·SDK 또는 signed invoke endpoint 방식을 사용합니다.

archive를 Object Storage에서 관리하려면 `fn build` 또는 `fn deploy` 전에 active context에 source bucket과 namespace를 지정합니다. 이 경우 application resource principal이 archive object를 읽을 IAM 권한도 필요합니다. context에 이 값이 있으면 `fn deploy`가 archive build·Object Storage upload·배포를 수행하며, `fn push`는 배포 없이 archive만 upload합니다.

```bash
fn update context object_storage_bucket_name <source-bucket-name>
fn update context object_storage_namespace <object-storage-namespace>
fn deploy --app <app-name>
```

이 흐름은 image build·registry push 기반 deployment를 대체하는 **archive 기반 code-only** 경로입니다. custom OS package 또는 container build 제어가 필요한 경우에는 기존 image-based deployment를 사용합니다.

### 참고

- [Release Note: Code-only deployment for OCI Functions is now available](https://docs.oracle.com/iaas/releasenotes/functions/functions-code-only-functions.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Creating Code-only Functions](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functions-codeonly-creating.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Invoking Functions](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionsinvokingfunctions.htm){:target="_blank" rel="noopener"}

## Client ID Metadata Document Support for OAuth Clients
* **Services:** IAM
* **Release Date:** September 23, 2026

### 업데이트 내용
IAM identity domain의 OAuth client가 안정된 HTTPS URL의 Client ID Metadata Document를 사용할 수 있습니다. 지속적인 client registration 관리 부담을 줄이는 방식입니다.

### 보안 조건

Client ID Metadata Document(CIMD)는 client가 호스팅하는 stable HTTPS URL을 OAuth `client_id`로 사용합니다. 문서에는 redirect URI, grant type, response type, token endpoint authentication method 같은 OAuth 설정을 둡니다. identity domain은 metadata location의 신뢰 여부와 retrieved metadata를 검증하지만, 보호 자원 접근 권한을 자동으로 부여하지는 않습니다. resource application의 별도 authorization, redirect URI validation, scope·token validation은 계속 적용됩니다.


### 신뢰 도메인과 resource allowlist

먼저 identity domain에서 full HTTPS client-metadata document URL을 domain allowlist에 추가하고, 보호 resource application에도 같은 full URL을 OAuth `client_id`로 allowlist에 추가합니다. domain trust만으로 resource access가 허용되지는 않습니다. `redirect_uris`는 metadata document에 선언하며 HTTPS URI는 정확히 일치해야 합니다.

```http
PATCH https://<idcs-stripe-url>/admin/v1/Settings/Settings
{
  "schemas": ["urn:ietf:params:scim:api:messages:2.0:PatchOp"],
  "Operations": [{"op":"add","path":"allowedCimdDomains","value":[{"domainUri":"https://client.example.com/oauth/client-metadata.json"}]}]
}
```

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


### 참고

- [Release Note: Cross-Region Replication for OCI Cache](https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-cross-region-replication.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: OCI Cache Cross-Region Replication](https://docs.oracle.com/iaas/Content/ocicache/cross-region-replication.htm){:target="_blank" rel="noopener"}
