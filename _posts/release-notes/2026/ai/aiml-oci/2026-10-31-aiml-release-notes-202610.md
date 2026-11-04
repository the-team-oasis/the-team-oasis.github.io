---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "10월 OCI AI/ML 업데이트 소식"
teaser: "2026년 10월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aiml
tags:
  - oci-release-notes-2026
  - Oct-2026
  - AI/ML
  - Gen AI
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

## Use identity domain browser session authentication for hosted applications in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 07, 2026

### 업데이트 내용

OCI Generative AI 호스팅 애플리케이션에서 Identity Domain browser session 인증을 일반 제공(GA)으로 사용할 수 있습니다. OAuth 2.1 Authorization Code 흐름과 PKCE를 사용하며, 브라우저 사용자는 OCI Identity Domain 로그인으로 리디렉션되고 서비스가 액세스 토큰과 세션 쿠키를 처리합니다.

### 구성 방법

애플리케이션 생성 또는 세부 정보 페이지의 편집 화면에서 인증 유형으로 **Identity domain browser session**을 선택합니다. 호스팅 배포는 연결된 애플리케이션의 인증 설정을 상속합니다. 기존 Identity Domain bearer token 및 OCI IAM 인증도 계속 지원됩니다.

### 참고

- [Release Note: Use identity domain browser session authentication for hosted applications](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/hosted-deployments-oauth.htm)
- [Documentation: Authentication](https://docs.oracle.com/en-us/iaas/Content/generative-ai/aurthentication.htm)
- [Documentation: Creating an Application](https://docs.oracle.com/en-us/iaas/Content/generative-ai/create-application.htm)

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Sign and verify model artifact signatures

- **Services:** Data Science
- **Release Date:** October 13, 2026

### 업데이트 내용

OCI Data Science에서 OCI Vault 키로 모델 아티팩트 서명을 만들고 모델 배포에 연결할 수 있습니다. 모델 배포 생성 과정에서 선택한 서명을 기준으로 아티팩트 무결성이 자동 검증되어, 배포 대상이 서명된 아티팩트와 일치하는지 확인할 수 있습니다.

### 사전 조건

서명할 모델 아티팩트와 RSA-PSS 서명에 적합한 OCI Vault 키를 준비해야 합니다. 서명 생성 주체는 모델과 아티팩트 서명 하위 리소스를 관리할 권한이 필요하며, 배포 검증에는 모델 배포 resource principal이 해당 Vault 키를 사용할 수 있는 IAM 권한이 필요합니다.

아티팩트가 최종 확정된 뒤 서명해야 하며, 아티팩트가 변경되면 새 서명이 필요합니다. 서명 작업은 비동기식이므로 배포 전에 서명 상태가 `AVAILABLE`인지 확인해야 합니다. 키를 순환해도 기존 서명과 배포는 무효화되지 않으며, 검증은 서명에 기록된 키와 키 버전 메타데이터를 사용합니다.

### 참고

- [Release Note: Sign and verify model artifact signatures](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/artifact-signature.htm)
- [Documentation: Model Artifact Integrity with Signature and Verification](https://docs.oracle.com/en-us/iaas/Content/data-science/using/signing-verifying-model-artifacts.htm)

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## New tutorial: Route Model Requests Across OCI Regions

- **Services:** Generative AI
- **Release Date:** October 14, 2026

### 업데이트 내용

온디맨드 모델 요청을 OCI 리전 간에 전달하는 라우팅 프로필 튜토리얼이 추가되었습니다. 하나의 프로필에 모델과 대상 리전을 정의하고 Chat Completions 또는 Responses API 요청에서 라우팅 프로필 OCID를 모델 값으로 사용합니다.

### 동작과 지원 범위

라우팅 프로필은 같은 realm 안에서 사용할 수 있는 온디맨드 모델 하나와 하나 이상의 대상 리전을 지정합니다. 여러 대상 리전을 추가해도 라운드 로빈 또는 고정 우선순위 라우팅을 의미하지 않습니다. 두 API에서 같은 프로필을 사용하려면 선택한 모델이 두 API를 모두 지원해야 합니다.

### 검증 방법

응답의 `x-genai-selected-region` 헤더를 확인해 요청을 처리한 리전을 검증할 수 있습니다. 라우팅 프로필 생성 및 추론 사용 권한, 대상 리전에서의 모델 가용성, API 키를 사전에 확인해야 합니다.

### 참고

- [Release Note: New tutorial: Route Model Requests Across OCI Regions](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/routing-profile-tutorial.htm)
- [Documentation: Route Model Requests Across OCI Regions](https://docs.oracle.com/en-us/iaas/Content/generative-ai/routing-profile-tutorial.htm)

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Priority processing is now available for Grok 4.20 and Grok 4.3

- **Services:** Generative AI
- **Release Date:** October 14, 2026

### 업데이트 내용

OCI Generative AI에서 xAI Grok 4.20 Reasoning, Non-Reasoning, Multi-Agent 및 Grok 4.3 모델의 priority processing을 사용할 수 있습니다. 해당 모델은 온디맨드 모드로 제공되며, 실제 사용 전 모델별 지원 리전과 API 접근 가능 여부를 확인해야 합니다.

### 참고

- [Release Note: Priority processing is now available for Grok 4.20 and Grok 4.3](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xai-grok-priority-processing.htm)

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Expanded hardware support for imported models in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 15, 2026

### 업데이트 내용

OCI Generative AI 모델 가져오기에 대한 하드웨어 지원이 확대되었습니다. Qwen3.8-Flash-Next는 기존 H100_X8 및 H200_X4 외에 A100_80G_X8을 지원하며, 여러 Qwen·NVIDIA·Z.ai·OpenAI 모델에 대한 하드웨어 계열별 최소 unit shape가 추가·정리되었습니다.

### 지원 범위

동일 날짜의 Qwen3.8-Flash-Next import 공지는 모델을 처음 가져올 때 필요한 최소 shape로 H100_X8 또는 H200_X4를 제시합니다. 이번 hardware 확대 공지는 여기에 A100_80G_X8을 추가합니다. 실제 배포 전에는 선택 리전에서 해당 unit shape를 사용할 수 있는지와 최신 모델별 최소 shape를 함께 확인해야 합니다.

### 참고

- [Release Note: Expanded hardware support for imported models in OCI Generative AI](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/expanded-hardware-support-imported-models.htm)

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Import Alibaba Qwen3.8-Flash-Next into OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 15, 2026

### 업데이트 내용

`Qwen/Qwen3.8-Flash-Next` 모델을 OCI Generative AI로 가져와 엔드포인트를 만들고 사용할 수 있습니다. 이 모델은 `IMAGE_TEXT_TO_TEXT` 기능을 제공하며 최소 `H100_X8` 또는 `H200_X4` Dedicated AI Cluster unit shape가 필요합니다.

### 참고

- [Release Note: Import Alibaba Qwen3.8-Flash-Next into OCI Generative AI](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/alibaba-qwen-3-8-flash-next.htm)

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Import NVIDIA Nemotron 3 Ultra FP8 into OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 15, 2026

### 업데이트 내용

`RedHatAI/NVIDIA-Nemotron-3-Ultra-550B-A55B-FP8-dynamic` 모델을 OCI Generative AI로 가져와 엔드포인트에서 사용할 수 있습니다. 모델 capability는 `TEXT_TO_TEXT`이며 최소 `H100_X8` 또는 `H200_X4` unit shape가 필요합니다.

### 참고

- [Release Note: Import NVIDIA Nemotron 3 Ultra FP8 into OCI Generative AI](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/nvidia-nemotron-3-ultra-fp8.htm)

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Import Xiaomi MiMo V2.6 Pro RL into OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 15, 2026

### 업데이트 내용

`XiaomiMiMo/MiMo-V2.6-Pro-RL` 모델을 OCI Generative AI로 가져와 엔드포인트에서 사용할 수 있습니다. `IMAGE_TEXT_TO_TEXT` 모델이며 최소 `H200_X8` Dedicated AI Cluster unit shape가 필요합니다.

### 참고

- [Release Note: Import Xiaomi MiMo V2.6 Pro RL into OCI Generative AI](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xiaomi-mimo-v2-6-pro-rl.htm)

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Global Generative AI availability

- **Services:** Generative AI
- **Release Date:** October 20, 2026

### 업데이트 내용

OCI Generative AI에서 라우팅 프로필을 통해 30개 OC1 상용 리전의 온디맨드 모델에 접근할 수 있습니다. 선택한 모델이 지원하는 경우 Playground, Chat API, OCI Chat Completions API 및 OCI Responses API에서 다른 리전에서 처리되는 모델을 호출할 수 있습니다.

### 구성 방법

라우팅 프로필에는 지원되는 온디맨드 모델 하나와 해당 모델이 제공되는 하나 이상의 동일 realm 대상 리전을 지정합니다. 현재 사용하는 리전에서 프로필을 만들고 Playground에서 선택하거나 API 요청에 프로필을 참조하면 됩니다.

### 제약 조건

라우팅 프로필 기반 추론은 온디맨드 모드에서만 지원됩니다. 대상 리전은 선택한 모델이 제공되는 리전이어야 하며, API별 지원 여부는 모델 capability에 따라 달라집니다.

### 참고

- [Release Note: Global Generative AI availability](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/expanded-on-demand-model-access.htm)
- [Documentation: Regions with no Local Model Processing](https://docs.oracle.com/en-us/iaas/Content/generative-ai/regions-without-local-on-demand-model-hosting.htm)
- [Documentation: Creating a Routing Profile](https://docs.oracle.com/en-us/iaas/Content/generative-ai/create-routing-profile.htm)

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Import Alibaba Qwen3.6-35B-A3B-FP8 into OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 20, 2026

### 업데이트 내용

`Qwen/Qwen3.6-35B-A3B-FP8` 모델을 가져와 이미지 및 텍스트 이해용 엔드포인트로 사용할 수 있습니다. 최소 지원 unit shape는 `A100_40G_X2`, `A100_80G_X1`, `H100_X1`, `H200_X1`입니다.

### 참고

- [Release Note: Import Alibaba Qwen3.6-35B-A3B-FP8 into OCI Generative AI](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/alibaba-qwen-3-6-35b-a3b-fp8.htm)

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Import NVIDIA Nemotron 3.5 Super VL NVFP4 into OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 20, 2026

### 업데이트 내용

`nvidia/NVIDIA-Nemotron-3.5-Super-VL-120B-A12B-NVFP4` 모델을 OCI Generative AI로 가져와 이미지 및 텍스트 이해용으로 배포할 수 있습니다. 최소 `H100_X2` 또는 `H200_X2` Dedicated AI Cluster unit shape가 필요합니다.

### 참고

- [Release Note: Import NVIDIA Nemotron 3.5 Super VL NVFP4 into OCI Generative AI](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/nvidia-nemotron-3-5-super-vl-120b-a12b-nvfp4.htm)

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Use Sandboxes in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 20, 2026

### 업데이트 내용

OCI Generative AI에서 코드와 셸 명령을 실행할 수 있는 관리형 임시 Linux 워크스페이스인 Sandbox를 사용할 수 있습니다. 각 Sandbox는 독립된 파일 시스템, 네트워크 네임스페이스 및 프로세스 공간을 가지며, 파일 업로드·명령 실행·출력 스트리밍·스냅샷·수명 주기 관리 기능을 제공합니다.

### 사전 조건

Sandbox를 사용하려면 Sandbox를 활성화한 Generative AI 프로젝트, 지원 리전, 필요한 API 권한 및 Sandbox 명령 그룹을 포함한 OCI CLI 또는 SDK가 필요합니다. 프로젝트의 아웃바운드 네트워크 구성도 작업 요구사항에 맞게 선택해야 합니다.

Sandbox가 `RUNNING` 상태가 된 뒤 파일과 명령을 사용할 수 있습니다. 만료 또는 중지 전에 필요한 결과를 다운로드하거나 파일 시스템 스냅샷을 만들어야 합니다. 스냅샷은 파일을 보존하지만 실행 중인 프로세스나 메모리는 보존하지 않습니다.

### 참고

- [Release Note: Use Sandboxes in OCI Generative AI](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/sandboxes.htm)
- [Documentation: Sandboxes in OCI Generative AI](https://docs.oracle.com/en-us/iaas/Content/generative-ai/sandboxes.htm)
- [Documentation: Creating and Using a Sandbox](https://docs.oracle.com/en-us/iaas/Content/generative-ai/create-sandbox.htm)

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Add file storage to Generative AI applications

- **Services:** Generative AI
- **Release Date:** October 21, 2026

### 업데이트 내용

OCI Generative AI 호스팅 애플리케이션에서 재시작과 재배포 이후에도 유지되는 영구 파일 스토리지를 사용할 수 있습니다. 모델 아티팩트, 중간 결과, 체크포인트 및 애플리케이션 상태를 지정한 컨테이너 경로에 유지할 수 있습니다.

### 구성 방법

애플리케이션 생성 시 Persistent file storage를 활성화하고 절대 경로의 마운트 경로를 지정합니다. 마운트 경로는 생성 후 변경할 수 없으며, 경로 밖에 쓴 파일은 영구 저장되지 않습니다.

### 제약 조건

현재 영구 파일 스토리지는 애플리케이션당 하나의 마운트와 고정 50GB 할당량을 지원합니다. 단일 replica만 지원하므로 최소 및 최대 replica 수를 모두 `1`로 설정해야 합니다.

### 참고

- [Release Note: Add file storage to Generative AI applications](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/hosted-applications-persistent-file-storage.htm)
- [Documentation: Persistent File Storage for Hosted Applications](https://docs.oracle.com/en-us/iaas/Content/generative-ai/persistent-file-storage.htm)
- [Documentation: Creating an Application](https://docs.oracle.com/en-us/iaas/Content/generative-ai/create-application.htm)

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Create Generative AI applications for public content

- **Services:** Generative AI
- **Release Date:** October 21, 2026

### 업데이트 내용

OCI Generative AI 호스팅 애플리케이션을 만들 때 **No authentication**을 선택할 수 있습니다. 공개 콘텐츠를 제공하거나 애플리케이션 자체 인증을 사용하는 경우에 적합하며, 엔드포인트에 도달할 수 있는 사용자는 플랫폼 인증 없이 요청을 보낼 수 있습니다.

### 보안 조건

접근을 제한해야 한다면 애플리케이션에서 인증과 권한 부여를 구현해야 합니다. 네트워크 설정은 엔드포인트에 도달할 수 있는 클라이언트를 결정하며, 애플리케이션 관리 및 다른 OCI 서비스 접근에는 OCI IAM 권한이 계속 필요합니다.

### 참고

- [Release Note: Create Generative AI applications for public content](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/hosted-applications-no-authentication.htm)
- [Documentation: Authentication](https://docs.oracle.com/en-us/iaas/Content/generative-ai/aurthentication.htm)

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Manage conversation context with compaction in the OCI Responses API

- **Services:** Generative AI
- **Release Date:** October 27, 2026

### 업데이트 내용

OCI Responses API에서 장기 대화와 에이전트 워크플로의 대화 이력을 더 작은 표현으로 줄이는 context compaction을 지원합니다. 애플리케이션이 `POST /responses/compact`를 호출하는 명시적 방식과 `POST /responses`에서 토큰 임계값을 지정하는 자동 방식이 제공됩니다.

### 동작과 지원 범위

모든 OCI Responses API 지원 모델(지원되는 imported model 포함)에서 명시적·자동 compaction을 사용할 수 있습니다. 기능은 Enterprise AI 리전에서 모델별 리전·호스팅 가용성에 따라 온디맨드 추론과 dedicated hosting에 제공되며, Generative AI 프로젝트 OCID가 필요합니다.

Compaction 결과 항목은 불투명하고 암호화된 컨텍스트이므로 내용을 읽거나 편집하거나 텍스트 요약으로 바꾸지 말고, 직렬화된 필드와 순서를 보존해야 합니다. Compaction은 토큰을 소비하고 세부 정보를 잃을 수 있으므로 모델 컨텍스트 한계에 도달하기 전에 수행하고 후속 응답을 위한 여유를 남겨야 합니다.

### 참고

- [Release Note: Manage conversation context with compaction in the OCI Responses API](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/responses-api-compaction.htm)
- [Documentation: OCI Responses API Compaction Tutorial](https://docs.oracle.com/en-us/iaas/Content/generative-ai/responses-api-compaction-tutorial.htm)
- [Documentation: OCI Responses API](https://docs.oracle.com/en-us/iaas/Content/generative-ai/responses-api.htm#compaction)
- [Documentation: Agentic Models and Region Availability](https://docs.oracle.com/en-us/iaas/Content/generative-ai/agentic-regions.htm#commercial-regions)

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Oracle Cost Advisor for AI in Limited Availability

- **Services:** Generative AI
- **Release Date:** October 27, 2026

### 업데이트 내용

Oracle Cost Advisor for AI가 US East (Ashburn)에서 Limited Availability로 제공됩니다. OCI Generative AI, OpenAI 및 Anthropic의 비용을 통합해 팀·비용 센터·모델별 사용량을 비교하고, 유사 품질의 저비용 모델 추천과 예상 절감액을 검토할 수 있습니다.

현재 Pre-GA 기능이므로 Oracle의 제공·변경 정책을 고려해 생산 도입 또는 구매 의사결정의 근거로 사용하지 않아야 합니다.

### 참고

- [Release Note: Oracle Cost Advisor for AI in Limited Availability](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/cost-advisor-limited-availability.htm)
- [Documentation: Oracle Cost Advisor for AI](https://docs.oracle.com/en-us/iaas/Content/generative-ai/cost-advisor.htm)

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->
