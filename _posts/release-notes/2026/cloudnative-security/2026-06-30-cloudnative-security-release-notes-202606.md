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

### 업데이트 내용

API Gateway 배포 사양에서 OAuth 2.0 인증 코드 흐름에 사용할 login back end를 정의할 수 있게 되었습니다. API Gateway는 API 요청의 수신, 라우팅, 인증, 정책 적용을 담당하는 관리형 게이트웨이 서비스입니다.

이번 업데이트는 API 인증 흐름을 API Gateway 수준에서 더 명확히 구성할 수 있게 해줍니다. OAuth 2.0은 사용자가 비밀번호를 직접 애플리케이션에 제공하지 않고 토큰 기반으로 권한을 위임하는 표준 인증/인가 방식입니다.

## Expanded OCI Functions support in Fn Project CLI now available
* **Services:** Functions
* **Release Date:** June 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-enhanced-fnproject-cli.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-enhanced-fnproject-cli.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Fn Project CLI에서 OCI Functions 워크플로 지원 범위가 확대되었습니다. Fn Project는 컨테이너 기반 서버리스 함수를 개발·배포하기 위한 오픈소스 프로젝트이며, OCI Functions는 이를 기반으로 한 관리형 서버리스 서비스입니다.

개발자는 콘솔이나 별도 CLI 호출을 줄이고 Fn CLI 중심으로 함수 개발·배포 흐름을 더 단순하게 운영할 수 있습니다. 서버리스 배포 자동화나 CI/CD 스크립트 구성에도 도움이 됩니다.

## OCI Kubernetes Engine (OKE) support for Compute Host Groups and Compute Clusters
* **Services:** Kubernetes Engine
* **Release Date:** June 17, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Compute-cluster-and-HostGroup-support.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Compute-cluster-and-HostGroup-support.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Kubernetes Engine(OKE)에서 워커 노드가 사용할 Compute Host Group과 Compute Cluster를 선택할 수 있게 되었습니다. OKE는 Kubernetes 클러스터를 OCI에서 관리형으로 운영하는 서비스입니다.

Compute Host Group과 Compute Cluster를 활용하면 워크로드 배치, 용량 격리, 성능 특성을 더 세밀하게 설계할 수 있습니다. 대규모 클러스터나 특정 하드웨어 배치 요구사항이 있는 환경에서 유용합니다.

## Document Generator pre-built function version 26.4 now available
* **Services:** Functions
* **Release Date:** June 03, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-docgen-pbf_v26-4-enhancements.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-docgen-pbf_v26-4-enhancements.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Document Generator pre-built function 26.4 버전이 제공됩니다. Pre-built function은 자주 쓰이는 기능을 미리 구현해 제공하는 함수 템플릿으로, 개발자는 이를 기반으로 문서 생성 자동화를 빠르게 구성할 수 있습니다.

이번 업데이트는 수정 사항과 개선 사항을 포함하므로 문서 생성 워크플로를 OCI Functions로 운영하는 팀은 버전 변경 내용을 확인하고 테스트 환경에서 먼저 검증하는 것이 좋습니다.

## New Experience in Oracle Cloud Console
* **Services:** API Gateway
* **Release Date:** June 02, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/api-gateway/apigw-Redwood.htm](https://docs.oracle.com/iaas/releasenotes/api-gateway/apigw-Redwood.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

API Gateway에 새로운 Oracle Cloud Console 경험이 적용되었습니다. Redwood 기반 디자인은 서비스 화면의 탐색성과 작업 흐름을 개선합니다.

API Gateway 운영팀은 배포, 라우트, 인증 정책을 확인하는 화면 흐름이 바뀔 수 있으므로 내부 운영 문서와 교육 자료를 최신 UI 기준으로 갱신하는 것이 좋습니다.
