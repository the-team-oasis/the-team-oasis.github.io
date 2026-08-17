---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI AI/ML 업데이트 소식"
teaser: "2026년 7월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aiml
tags:
  - oci-release-notes-2026
  - Jul-2026
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

## Expanded On-Demand Model Availability in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** July 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/expanded-on-demand-model-availability.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/expanded-on-demand-model-availability.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Models by Region](https://docs.oracle.com/iaas/Content/generative-ai/model-endpoint-regions.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI의 on-demand model 가용 region이 확대되었습니다. Cohere Embed 4는 Frankfurt, Sao Paulo, Hyderabad, London에서, Meta Llama 4 Scout는 London, Sao Paulo, Osaka에서 on-demand로 제공됩니다.

### Region별 모델 가용성

OCI Generative AI의 on-demand model availability가 확대되었습니다. Cohere Embed 4는 Frankfurt, Sao Paulo, Hyderabad, London에서, Meta Llama 4 Scout는 London, Sao Paulo, Osaka에서 on-demand로 제공됩니다. 별도 dedicated capacity 없이 해당 region에서 모델을 호출할 수 있는 선택지가 늘어난 것입니다.

### 적용 판단 기준

On-demand는 빠르게 시작하기 좋지만 quota와 regional availability에 영향을 받습니다. RAG embedding처럼 region proximity와 data residency가 중요한 workload는 모델이 제공되는 region과 데이터 저장 region을 함께 확인해야 합니다.

```text
선택 기준 예시
- Embedding/RAG: 데이터 저장 region과 embedding model region 근접성
- Chat/Agent: 사용자 latency와 model capability
- 운영 안정성: quota, fallback region, dedicated serving 전환 가능성
```

### 운영 영향

모델 region이 늘어나면 multi-region application 설계가 쉬워지지만, 같은 model이라도 region별 quota와 latency가 다를 수 있습니다. 배포 전 region별 smoke test를 수행하고 fallback 정책을 문서화합니다.
## H100 Multi-Node Serving Now Available for Model Import in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** July 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/h100-multinode-imported-models.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/h100-multinode-imported-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Dedicated AI Cluster Unit Sizes for Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#unit-sizes){:target="_blank" rel="noopener"}
* **Documentation:** [Compatible Models for Import](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI의 imported model에서 H100 multi-node serving을 사용할 수 있습니다. 공식 Release Note는 deepseek-ai/DeepSeek-V4-Pro와 zai-org/GLM-5.2-FP8을 H100_X16 shape로 배포할 수 있다고 설명합니다. H100_X16은 두 node에 걸친 16개의 H100 GPU, 즉 node당 8 GPU 구성을 제공합니다.

### Multi-Node Serving 의미

OCI Generative AI의 imported model에서 H100 multi-node serving을 사용할 수 있습니다. Release Note는 DeepSeek-V4-Pro와 GLM-5.2-FP8을 H100_X16 shape로 배포할 수 있다고 설명합니다. H100_X16은 2개 node에 16개 H100 GPU, 즉 node당 8 GPU를 사용하는 구성입니다.

### 배포 전 확인할 것

Imported model은 model artifact 호환성, GPU memory, tensor/pipeline parallelism, model load time, network bandwidth가 모두 중요합니다. Dedicated AI Cluster Unit Size 문서와 Compatible Models for Import 문서를 확인해 model별 지원 shape와 deployment step을 맞춥니다.

```text
성능 검증 항목
- cold start / model load time
- first token latency
- tokens per second
- concurrent request 처리량
- GPU memory utilization
- multi-node communication overhead
```

### 비용·Capacity 제약

H100 multi-node serving은 capacity 확보와 비용 영향이 큽니다. PoC는 제한된 traffic으로 시작하고, 운영 전에는 quota, budget alert, scaling policy를 함께 검토해야 합니다.
## Use OCI IAM Authentication for Hosted Application Endpoints in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** July 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/hosted-applications-iam.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/hosted-applications-iam.htm){:target="_blank" rel="noopener"}
* **Documentation:** [CreateHostedApplicationIam API](https://docs.oracle.com/iaas/api/#/en/generative-ai/latest/HostedApplicationIam/CreateHostedApplicationIam){:target="_blank" rel="noopener"}
* **Documentation:** [Hosted Applications and Deployments](https://docs.oracle.com/iaas/Content/generative-ai/applications-deployments.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Creating an application](https://docs.oracle.com/iaas/Content/generative-ai/create-application.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI hosted application endpoint가 OCI IAM authentication을 지원합니다. 애플리케이션 endpoint 요청을 표준 OCI request-signature 방식으로 서명하고, OCI IAM policy로 authorize할 수 있습니다. 기존 identity domain bearer token 인증과 병행되는 선택지입니다.

### 인증 방식 선택

OCI Generative AI hosted application endpoint에서 OCI IAM authentication을 사용할 수 있습니다. IAM 인증 방식은 표준 OCI request-signature로 요청을 서명하고 IAM policy로 authorize합니다. 기존 identity domain bearer token 방식은 `CreateHostedApplication` API와 `InboundAuthConfig`로 계속 사용할 수 있고, IAM 인증 방식은 `CreateHostedApplicationIam` API를 사용합니다.

### IAM Policy 예시

아래는 hosted application 호출 주체를 특정 dynamic group 또는 group으로 제한하는 설계 예시입니다. 실제 resource type과 verb는 Generative AI IAM 문서와 tenancy policy model에 맞춰 조정해야 합니다.

```text
Allow dynamic-group genai-app-clients to use generative-ai-family in compartment ai-prod
Allow group genai-operators to manage generative-ai-family in compartment ai-prod
```

### API 사용 흐름

```bash
# OCI request signing을 사용하는 client/SDK에서 hosted endpoint 호출
oci raw-request \
  --http-method POST \
  --target-uri "$HOSTED_APPLICATION_ENDPOINT" \
  --request-body file://payload.json
```

### 보안 영향

IAM 인증은 OCI SDK/CLI 기반 client와 잘 맞고 audit 추적이 쉽습니다. 다만 policy가 넓으면 endpoint 접근 범위도 넓어지므로 compartment와 principal을 최소화해야 합니다.
## New Experience in Oracle Cloud Console
* **Services:** Speech
* **Release Date:** July 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/speech/console-experience.htm](https://docs.oracle.com/iaas/releasenotes/speech/console-experience.htm){:target="_blank" rel="noopener"}
* **Documentation:** [New Console experience](https://docs.oracle.com/iaas/Content/GSG/Concepts/new-console.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Speech 서비스에 새로운 Oracle Cloud Console experience가 적용되었습니다. Resource list page, resource detail page, resource creation workflow가 최신 OCI Console 디자인에 맞춰 개선됩니다.

### 화면 변화의 의미

OCI Speech 서비스의 Console experience가 resource list, detail, creation workflow 중심으로 새 디자인에 맞춰 개선되었습니다. API 기능 변화라기보다 운영자와 사용자가 Speech resource를 찾고 생성하는 화면 흐름이 바뀌는 업데이트입니다.

### 문서·교육 자료 영향

Console UI가 바뀌면 고객 가이드, 내부 runbook, 교육 스크린샷의 메뉴 경로와 버튼명이 달라질 수 있습니다. 특히 Speech transcription job 생성, dataset 또는 resource 상세 확인 절차가 문서화돼 있다면 최신 Console 화면으로 갱신해야 합니다.

### 확인 방법

```text
검증 항목
- Speech service landing/resource list 화면
- 기존 resource detail 화면의 tab/metric/log 위치
- 신규 resource creation wizard의 필수 입력값
- 기존 교육 자료의 screenshot과 실제 화면 차이
```

### 자동화 영향

Console DOM이나 화면 selector에 의존하는 테스트 자동화가 있다면 깨질 수 있습니다. 가능하면 API/CLI 기반 검증으로 전환하고, UI 자동화는 smoke test 수준으로 유지하는 것이 좋습니다.
## Background Mode Available for the OCI Responses API
* **Services:** Generative AI
* **Release Date:** July 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/responses-api-background-mode.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/responses-api-background-mode.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Run a Response in the Background](https://docs.oracle.com/iaas/Content/generative-ai/responses-api.htm#background-mode){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Responses API에서 background mode를 지원합니다. 오래 걸리는 response 요청을 비동기로 계속 처리하고, response ID로 상태와 결과를 조회할 수 있습니다.

background=true와 stream=true를 함께 사용하면 streaming 중 연결이 끊겨도 이후 event 이후부터 재연결해 이어 받을 수 있는 resumable streaming 흐름을 설계할 수 있습니다.

### 비동기 처리 모델

OCI Responses API background mode는 오래 걸리는 요청을 원래 HTTP connection에 묶어두지 않고 비동기로 계속 처리합니다. 요청 생성 시 `background=true`를 설정하고, 반환된 response ID로 queued, in_progress, completed, failed 같은 상태와 결과를 조회합니다. 완료 전 cancel도 고려할 수 있습니다.

### API 호출 예시

```bash
# 생성 예시: endpoint와 payload 필드는 실제 Responses API 문서에 맞춰 조정
curl -X POST "$OCI_GENAI_ENDPOINT/responses" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "model": "cohere.command-a-03-2025",
    "input": "월간 장애 보고서를 요약해줘",
    "background": true
  }'

# 상태 조회 예시
curl -X GET "$OCI_GENAI_ENDPOINT/responses/$RESPONSE_ID" \
  -H "Authorization: Bearer $TOKEN"
```

### 애플리케이션 설계

Background job table에 response ID, user request ID, status, retry count, expiration time을 저장합니다. stream=true와 함께 사용할 때는 끊긴 stream을 resume할 수 있도록 마지막 event ID 또는 cursor를 저장합니다.

### 장애 처리

Timeout, 중복 submit, cancel, 완료 후 결과 보관 기간을 명확히 정의해야 합니다. 사용자 화면에는 “처리 중” 상태와 재조회 방법을 제공하는 것이 좋습니다.
## New Hardware Unit Shapes Available for Cohere and Meta Models in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** July 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/cohere-meta-hardware-shapes.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/cohere-meta-hardware-shapes.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Dedicated AI Cluster model documentation](https://docs.oracle.com/iaas/Content/generative-ai/model-endpoint-regions.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 Cohere와 Meta model hosting을 위한 새로운 hardware unit shape가 제공됩니다. 새 unit shape 이름은 Cohere_ 또는 Meta_ prefix로 시작하며, underlying hardware와 필요한 hardware unit 수를 식별합니다.

Cohere Command A 계열, Cohere Embed/Rerank, Meta Llama 4/3.3 계열 등 dedicated AI cluster 설계 시 모델별 shape 선택지가 더 명확해졌습니다.

### Shape 선택 기준

OCI Generative AI에서 Cohere와 Meta 모델용 dedicated AI cluster hardware unit shape가 추가되었습니다. 새 shape 이름은 Cohere_ 또는 Meta_ prefix로 시작하고, underlying hardware와 필요한 hardware unit 수를 식별합니다. 모델별 serving 구성에서 generic shape 대신 모델 특화 shape를 선택할 수 있게 된 점이 중요합니다.

### 모델·Region 확인 흐름

```bash
# OCI CLI 사용 가능 환경에서 region별 모델/endpoint 정보를 확인하는 흐름 예시
oci generative-ai model list \
  --compartment-id "$COMPARTMENT_OCID" \
  --region ap-seoul-1
```

실제 command와 응답 필드는 OCI CLI version과 service API에 따라 달라질 수 있으므로, Models by Region 문서와 CLI help를 함께 확인합니다.

### 비용·성능 영향

Dedicated AI Cluster는 on-demand 호출보다 capacity control이 좋지만 비용 약정과 quota 영향이 큽니다. 모델별 token throughput, latency, concurrency, 예상 traffic을 기준으로 shape를 고르고 load test를 수행해야 합니다.
