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
# image:
#     title: mediaplayer_js-title.jpg
#     thumb: mediaplayer_js-thumb.jpg
#     homepage: mediaplayer_js-home.jpg
#     caption: Photo by Corey Blaz
#     caption_url: https://blaz.photography/
# mediaplayer: true
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## New Experience in Oracle Cloud Console
* **Services:** API Gateway
* **Release Date:** June 02, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/control-center/occ-redwood.htm](https://docs.oracle.com/iaas/releasenotes/control-center/occ-redwood.htm){:target="_blank" rel="noopener"}
* **Documentation:** [New Console Experience](https://docs.oracle.com/iaas/Content/GSG/Concepts/new-console.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

API Gateway에 새로운 Console Experience가 적용되었습니다. 이번 업데이트는 OCI Console 전반의 사용성과 일관성을 높이기 위한 디자인 개편의 일부로, Resource List Page, Resource Details Page, Resource Creation Workflow가 더 직관적으로 변경되었습니다.

공식 릴리즈 노트에서는 새 Console Experience가 공식 문서 업데이트보다 먼저 적용될 수 있다고 안내하고 있습니다. 따라서 Console 화면이 기존 문서의 스크린샷과 다르게 보일 수 있습니다.

### 주요 변경 포인트

* Service별 관련 리소스를 탐색할 수 있는 좌측 Navigation Pane 제공
* Resource List Page의 Search and Filter 개선
* List Table의 Sort, Filter, Column 관리 기능 개선
* Resource Details Page의 하위 정보를 Tab 기반으로 정리
* 복잡한 Resource 생성 시 단계별 또는 Section 기반 Creation Workflow 제공

### 운영 시 참고 사항

내부 가이드나 블로그의 Console 경로, 버튼명, 화면 캡처가 기존 UI 기준이라면 새 화면에서 작업 흐름을 다시 확인해야 합니다. 반복 운영 절차가 있는 경우에는 Resource List와 Details Page의 Filter, Column, Tab 구성을 점검해 사용자 안내 문구를 보완하는 것이 좋습니다.

## Document Generator pre-built function version 26.4 now available
* **Services:** Functions
* **Release Date:** June 03, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-docgen-pbf_v26-4-enhancements.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-docgen-pbf_v26-4-enhancements.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Document Generator Function](https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_pbf_catalog_document_generator.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Functions의 Document Generator Pre-built Function Version **26.4**가 제공됩니다. MS Word 템플릿에는 Barcode Tag, HTML Tag, Custom Delimiter, Loop Metadata, Horizontal Loop 개선, 조건식을 지원하는 Page Break Tag가 추가되었습니다. MS Excel 템플릿에는 Sheet Generation Tag와 Loop Metadata Tag가 포함됩니다.

문서 자동 생성 기능을 사용하는 업무에서는 계약서, 보고서, Excel 기반 정형 산출물의 템플릿을 더 유연하게 구성할 수 있습니다.

### 주요 변경 포인트

* **MS Word:** Barcode Tag, HTML Tag, Custom Delimiter, Loop Metadata, Horizontal Loop 개선, 조건식 기반 Page Break Tag가 추가되었습니다.
* **MS Excel:** Sheet Generation Tag와 Loop Metadata Tag가 추가되었습니다.
* 반복 생성되는 계약서, 보고서, 정형 Excel 산출물의 템플릿 구성을 세분화할 수 있습니다.

### 적용 및 검증 포인트

기존 템플릿을 바로 교체하기보다는 Version 26.4의 새 Tag를 적용한 샘플 문서를 먼저 생성해 렌더링 결과를 비교하는 것이 좋습니다. 특히 Page Break, Loop, HTML Rendering, Barcode 출력은 실제 업무 양식에서 깨짐 여부를 확인해야 합니다.

## OCI Kubernetes Engine (OKE) support for Compute Host Groups and Compute Clusters
* **Services:** Kubernetes Engine
* **Release Date:** June 17, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Compute-cluster-and-HostGroup-support.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Compute-cluster-and-HostGroup-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Using Compute Host Groups to Provision Managed Nodes](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengusinghostgroups.htm){:target="_blank" rel="noopener"}, [Using Compute Clusters to Provision Managed Nodes](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengusingcomputeclusters.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE Managed Node Pool에서 Worker Node Instance를 배치할 때 **Compute Host Group**과 **Compute Cluster**를 사용할 수 있게 되었습니다. Compute Host Group은 Bare Metal Shape 기반 Node Pool에서 전용 Host 배치나 빠른 Recycle이 필요한 경우에 유용합니다. Compute Cluster는 RDMA-capable Networking이 필요한 GPU 분산 학습, HPC, AI Workload에 적합합니다.

Compute Cluster를 Node Pool에 지정하면 RDMA-capable Networking을 활용하면서도 OKE Managed Node Pool의 Scaling, Upgrade, Node Replacement 운영 모델을 유지할 수 있습니다.

### 주요 변경 포인트

* Managed Node Pool의 Worker Node 배치에 Compute Host Group 또는 Compute Cluster를 사용할 수 있습니다.
* Compute Host Group은 Bare Metal 기반 전용 Host 배치와 빠른 Recycle이 필요한 경우에 적합합니다.
* Compute Cluster는 RDMA-capable Networking이 필요한 GPU 분산 학습, HPC, AI Workload에 적합합니다.

### 사전 조건 및 운영 시 참고 사항

Compute Host Group은 Compute 서비스에서 먼저 생성·구성하고 `ACTIVE` 상태인지 확인해야 합니다. OKE는 Host Group 생성이나 Recycle Level 구성을 대신하지 않습니다. Host Group 변경은 새 Worker Node Instance에만 적용되므로, 기존 Node를 같은 배치 정책으로 옮기려면 Worker Node를 교체해 Replacement Instance가 새 Host Group에 배치되도록 해야 합니다.

Compute Cluster는 RDMA-capable Bare Metal Shape가 필요한 Workload에 사용하는 옵션입니다. OKE Enhanced Cluster가 필요하고 Compute Cluster는 `ACTIVE` 상태여야 합니다. 기존 Managed Node Pool에는 Compute Cluster를 나중에 추가·변경·제거할 수 없으므로, 다른 Compute Cluster를 사용하려면 새 Managed Node Pool을 만들어야 합니다.

## API Gateway support for login back ends
* **Services:** API Gateway
* **Release Date:** June 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/api-gateway/apigw-login-backend-static-redirect.htm](https://docs.oracle.com/iaas/releasenotes/api-gateway/apigw-login-backend-static-redirect.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Adding Login as an API Gateway Back End](https://docs.oracle.com/iaas/Content/APIGateway/Tasks/apigatewayaddingloginbackends.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

API Gateway Deployment Specification에서 OAuth 2.0 Token Authentication Policy와 함께 사용할 **Login Back End**를 정의할 수 있게 되었습니다. Validation Failure Policy에서 Static Login Redirect Path를 지정하면, IdP가 API Client를 되돌려 보내는 인증 흐름의 Route를 API Gateway 안에서 더 명확하게 처리할 수 있습니다.

이 기능은 브라우저 기반 API Client나 SPA가 API Gateway 뒤의 서비스에 접근할 때, 인증 실패 후 로그인 경로로 이동해야 하는 시나리오에 적합합니다.

### 주요 변경 포인트

* API Gateway Deployment Specification에서 Login Back End를 별도 Backend Type으로 정의할 수 있습니다.
* OAuth 2.0 Token Authentication Policy의 Validation Failure 동작과 Login Redirect Route를 함께 설계할 수 있습니다.
* 인증 실패 시 명확한 로그인 이동 경로가 필요한 브라우저 기반 API Client나 SPA 구성에 활용할 수 있습니다.

### 설정 및 검증 포인트

IdP Redirect URI, API Gateway Route, Validation Failure Policy의 Static Login Redirect Path가 같은 인증 흐름을 가리키는지 확인해야 합니다. 인증되지 않은 요청, 인증 성공 후 원래 API Route 접근, 잘못된 Redirect Path 입력 시의 실패 동작을 각각 테스트하는 것이 좋습니다.

여러 Route, Path Parameter, Wildcard Route를 가진 애플리케이션에서는 IdP에 모든 Redirect URI를 등록하기보다 `/auth/callback` 같은 단일 Callback Path를 두는 방식을 고려할 수 있습니다. 이 Path는 OAuth 2.0 Validation Failure Policy의 Static Login Redirect Path 및 API Deployment Specification의 Route Path와 일치해야 합니다.

Login Back End Route는 일반 API Client가 직접 호출하는 용도가 아니라 IdP Redirect를 받기 위한 예약 Route입니다. 이 Route는 `GET` Method를 지원하고 Path Parameter나 Wildcard가 없는 Static Path여야 하며, 직접 호출하면 `400 Bad Request`가 발생할 수 있습니다.

## Expanded OCI Functions support in Fn Project CLI now available
* **Services:** Functions
* **Release Date:** June 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-enhanced-fnproject-cli.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-enhanced-fnproject-cli.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Functions Overview](https://docs.oracle.com/iaas/Content/Functions/Concepts/functionsoverview.htm){:target="_blank" rel="noopener"}, [Fn Project CLI Commands](https://fnproject.io/cli/fn/){:target="_blank" rel="noopener"}

### 업데이트 내용

Fn Project CLI에서 OCI Functions 관련 작업을 더 폭넓게 처리할 수 있게 되었습니다. Application Subnet, Resource Tag, Provisioned Concurrency, Detached Invocation, Timeout, Request Control, 목록 Filtering 및 Sorting, JSON Input 같은 OCI 기능을 별도의 CLI로 전환하지 않고 다룰 수 있습니다.

운영 관점에서는 Function 생성, 수정, 조회, 호출 자동화 스크립트를 Fn CLI 중심으로 단순화할 수 있습니다. Image Policy, Trace Configuration, NSG, Security Attribute, Success 및 Failure Destination, Pre-built Function Workflow 같은 설정도 CLI 기반 운영 표준에 포함하기 쉬워졌습니다.

### 주요 변경 포인트

* Fn Project CLI에서 Subnet, Resource Tag, Provisioned Concurrency, Detached Invocation, Timeout, Request Control 같은 OCI Functions 옵션을 직접 다룰 수 있습니다.
* 목록 Filtering 및 Sorting, JSON Input, Pre-built Function Workflow, NSG, Trace Configuration, Success 및 Failure Destination 등 운영 자동화에 필요한 설정 범위가 넓어졌습니다.
* 기존에 OCI CLI와 Fn CLI를 함께 사용하던 배포 스크립트를 Fn CLI 중심으로 단순화할 수 있습니다.

### 운영 시 참고 사항

기능 범위가 넓어진 만큼 배포 파이프라인에서는 환경별 기본값을 명확히 분리하는 것이 좋습니다. 특히 Provisioned Concurrency, Timeout, Detached Invocation은 비용과 실행 방식에 영향을 줄 수 있으므로 개발, 검증, 운영 환경별로 확인해야 합니다.
