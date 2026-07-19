---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "6월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2026년 6월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2026-cloudnative-security

tags:
  - oci-release-notes-2026
  - Jun-2026
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

## API Gateway support for login back ends
* **Services:** API Gateway
* **Release Date:** June 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/api-gateway/apigw-login-backend-static-redirect.htm](https://docs.oracle.com/iaas/releasenotes/api-gateway/apigw-login-backend-static-redirect.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Adding Login as an API Gateway Back End](https://docs.oracle.com/iaas/Content/APIGateway/Tasks/apigatewayaddingloginbackends.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

API Gateway 배포 사양에서 OAuth 2.0 토큰 인증 정책과 함께 사용할 **login back end**를 정의할 수 있게 되었습니다. 인증 검증 실패 정책에서 static login redirect path를 지정하면, IdP가 API client를 되돌려 보내는 인증 흐름의 route를 API Gateway 안에서 더 명확하게 처리할 수 있습니다.

활용 시나리오는 브라우저 기반 API client나 SPA가 API Gateway 뒤의 서비스에 접근할 때 인증 실패 후 로그인 경로로 유도해야 하는 경우입니다. 배포 전에는 API deployment specification의 route, OAuth 2.0 token authentication policy, validation failure policy가 같은 인증 흐름을 바라보는지 확인해야 합니다.

### 주요 변경 포인트

* API Gateway deployment specification에서 login back end를 별도 backend type으로 정의할 수 있습니다.
* OAuth 2.0 token authentication policy의 validation failure 동작과 login redirect route를 함께 설계할 수 있습니다.
* 브라우저 기반 client나 SPA처럼 인증 실패 시 명확한 로그인 이동 경로가 필요한 API 앞단 구성에 적합합니다.

### 설정 및 검증 포인트

배포 전에는 IdP redirect URI, API Gateway route, validation failure policy의 static login redirect path가 같은 인증 흐름을 바라보는지 확인해야 합니다. 인증되지 않은 요청, 인증 성공 후 원래 API route 접근, 잘못된 redirect path 입력 시 실패 동작을 각각 테스트하면 운영 전 검증이 더 안전합니다.

## Expanded OCI Functions support in Fn Project CLI now available
* **Services:** Functions
* **Release Date:** June 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-enhanced-fnproject-cli.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-enhanced-fnproject-cli.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Functions Overview](https://docs.oracle.com/iaas/Content/Functions/Concepts/functionsoverview.htm){:target="_blank" rel="noopener"}, [Fn Project CLI Commands](https://fnproject.io/cli/fn/){:target="_blank" rel="noopener"}

### 업데이트 내용

Fn Project CLI에서 OCI Functions 관련 작업을 더 넓게 직접 처리할 수 있게 되었습니다. 애플리케이션 subnet, resource tags, provisioned concurrency, detached invocation, timeout, request-control, list filtering/sorting, JSON input 같은 OCI-native 기능을 CLI 전환 없이 다룰 수 있습니다.

운영 관점에서는 함수 생성·수정·조회·호출 자동화 스크립트를 Fn CLI 중심으로 단순화할 수 있습니다. 또한 image policy, trace configuration, NSG, security attributes, success/failure destinations, pre-built function workflow 같은 설정도 CLI 기반 운영 표준에 포함하기 좋아졌습니다.

### 주요 변경 포인트

* Fn Project CLI에서 subnet, resource tags, provisioned concurrency, detached invocation, timeout, request-control 같은 OCI Functions 옵션을 더 직접적으로 다룰 수 있습니다.
* list filtering/sorting, JSON input, pre-built function workflow, NSG, trace configuration, success/failure destination 등 운영 자동화에 필요한 설정 범위가 넓어졌습니다.
* 기존에 OCI CLI와 Fn CLI를 섞어 쓰던 배포 스크립트를 Fn CLI 중심으로 단순화할 수 있습니다.

### 운영 시 참고 사항

기능 범위가 넓어진 만큼 배포 파이프라인에서는 환경별 기본값을 명확히 분리하는 것이 좋습니다. 특히 provisioned concurrency, timeout, detached invocation은 비용과 실행 방식에 영향을 줄 수 있으므로 개발·검증·운영 환경별로 별도 검증이 필요합니다.

## OCI Kubernetes Engine (OKE) support for Compute Host Groups and Compute Clusters
* **Services:** Kubernetes Engine
* **Release Date:** June 17, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Compute-cluster-and-HostGroup-support.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Compute-cluster-and-HostGroup-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Using Compute Host Groups to Provision Managed Nodes](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengusinghostgroups.htm){:target="_blank" rel="noopener"}, [Using Compute Clusters to Provision Managed Nodes](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengusingcomputeclusters.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE managed node pool에서 worker node 인스턴스를 배치할 때 Compute Host Group과 Compute Cluster를 사용할 수 있게 되었습니다. Compute Host Group은 bare metal shape 기반 node pool에서 dedicated host placement나 빠른 recycle 동작이 필요한 경우에 유용하고, Compute Cluster는 RDMA-capable networking이 필요한 분산 학습/HPC 성격의 workload에 적합합니다.

설정 시 Compute Host Group은 node pool placement configuration에서 선택하기 전에 미리 생성되어 있고 active 상태여야 합니다. Compute Cluster를 node pool에 지정하면 RDMA-capable networking을 활용하면서도 OKE managed node pool의 scaling, upgrade, node replacement 운영 모델을 유지할 수 있습니다.

### 주요 변경 포인트

* Managed node pool의 worker node placement에 Compute Host Group 또는 Compute Cluster를 사용할 수 있습니다.
* Compute Host Group은 bare metal 기반 전용 host 배치와 빠른 recycle이 필요한 경우에 적합합니다.
* Compute Cluster는 RDMA-capable networking이 필요한 GPU 분산 학습, HPC, AI workload에 적합합니다.

### 설정 및 검증 포인트

Compute Host Group은 node pool placement configuration에서 선택하기 전에 미리 생성되어 있고 active 상태여야 합니다. Compute Cluster를 지정한 node pool은 RDMA-capable network path와 managed node pool의 scale, upgrade, replacement 동작을 함께 확인해야 합니다.

## Document Generator pre-built function version 26.4 now available
* **Services:** Functions
* **Release Date:** June 03, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-docgen-pbf_v26-4-enhancements.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-docgen-pbf_v26-4-enhancements.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Document Generator Function](https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_pbf_catalog_document_generator.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Functions의 Document Generator pre-built function 26.4 버전이 제공됩니다. MS Word 템플릿에는 barcode tag, HTML tag, custom delimiter, loop metadata, horizontal loop 개선, 조건식을 지원하는 page break tag가 추가되었고, MS Excel 템플릿에는 sheet generation tag와 loop metadata tag가 포함됩니다.

문서 자동 생성 기능을 쓰는 업무에서는 계약서, 보고서, Excel 기반 정형 산출물 생성 템플릿을 더 유연하게 구성할 수 있습니다. 기존 템플릿을 바로 교체하기보다는 26.4에서 새 tag를 적용한 샘플 문서를 먼저 만들어 렌더링 결과와 page break, loop 처리 결과를 확인하는 것이 좋습니다.

### 주요 변경 포인트

* MS Word 템플릿에 barcode tag, HTML tag, custom delimiter, loop metadata, horizontal loop 개선, 조건식 기반 page break tag가 추가되었습니다.
* MS Excel 템플릿에는 sheet generation tag와 loop metadata tag가 포함됩니다.
* 계약서, 보고서, 정형 Excel 산출물처럼 반복 생성되는 문서 템플릿을 더 유연하게 구성할 수 있습니다.

### 적용 및 검증 포인트

기존 템플릿을 바로 교체하기보다는 26.4 tag를 적용한 샘플 문서를 먼저 만들어 렌더링 결과를 비교하는 것이 좋습니다. 특히 page break, loop, HTML rendering, barcode 출력은 실제 업무 양식에서 깨짐 여부를 확인해야 합니다.

## New Experience in Oracle Cloud Console
* **Services:** API Gateway
* **Release Date:** June 02, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/control-center/occ-redwood.htm](https://docs.oracle.com/iaas/releasenotes/control-center/occ-redwood.htm){:target="_blank" rel="noopener"}
* **Documentation:** [New Console Experience](https://docs.oracle.com/iaas/Content/GSG/Concepts/new-console.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud Console의 새 UI 경험이 적용되었습니다. resource list page, resource details page, resource creation workflow의 디자인과 사용성이 변경될 수 있습니다.

단순 UI 변경 성격이므로 기능 자체보다는 운영 문서와 스크린샷 영향이 중요합니다. 내부 가이드나 블로그 화면 캡처가 기존 Console 기준이면, 다음 실습 업데이트 때 새 화면 기준으로 경로와 버튼명을 다시 확인하는 것이 좋습니다.

### 주요 변경 포인트

* Resource list page, resource details page, resource creation workflow의 화면 구성이 새 Console Experience 기준으로 바뀔 수 있습니다.
* 기능 변경보다는 운영 문서, 실습 자료, 화면 캡처, 사용자의 작업 경로에 영향을 주는 업데이트입니다.
* 공식 문서의 스크린샷보다 Console 변경이 먼저 적용될 수 있다는 점을 고려해야 합니다.

### 운영 시 참고 사항

블로그나 내부 가이드의 Console 경로·버튼명·화면 캡처가 기존 UI 기준이면 다음 문서 업데이트 시 새 화면 기준으로 재확인하는 것이 좋습니다. 반복 운영 절차가 있는 서비스는 resource list와 detail page의 filter, column, tab 구성을 먼저 확인해 사용자 안내 문구를 보완해야 합니다.
