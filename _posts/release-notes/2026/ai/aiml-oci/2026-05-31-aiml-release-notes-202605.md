---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "5월 OCI AI/ML 업데이트 소식"
teaser: "2026년 5월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aiml
tags:
  - oci-release-notes-2026
  - May-2026
  - AI/ML
  - Gen AI
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

---

# Generative AI

## Use xAI Grok 4.3 in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** May 01, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xAI-grok-4-3.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xAI-grok-4-3.htm){:target="_blank" rel="noopener"}
- **Documentation:** [xAI Grok 4.3](https://docs.oracle.com/en-us/iaas/Content/generative-ai/xai-grok-4-3.htm){:target="_blank" rel="noopener"}, [Generative AI Models by Region](https://docs.oracle.com/en-us/iaas/Content/generative-ai/pretrained-models.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 xAI의 reasoning model인 **Grok 4.3**을 사용할 수 있게 되었습니다. OCI에서 호출할 때 사용하는 모델 이름은 `xai.grok-4.3`입니다.

Grok 4.3은 복잡한 논리, 수학, 과학 분석, multi-step investigation, chat, coding use case에 맞춰 설계된 모델입니다. 공식 문서 기준으로 1 million token context window, reasoning support, function calling, structured outputs, cached input tokens를 지원합니다. 입력은 text와 image를 사용할 수 있고, 출력은 text입니다.

### 활용 포인트

Grok 4.3은 긴 컨텍스트가 필요한 문서 분석, 멀티스텝 추론, 코드 분석, 이미지와 텍스트를 함께 해석하는 멀티모달 질의에 적합합니다. Playground와 API에서 사용할 수 있으며, 온디맨드 모델이므로 사용 전 지원 리전과 token limit을 확인해야 합니다.

## Use Text and Image Together in Cohere Embed 4

- **Services:** Generative AI
- **Release Date:** May 09, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/cohere-embed-4-new-features.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/cohere-embed-4-new-features.htm){:target="_blank" rel="noopener"}
- **Documentation:** [Cohere Embed 4](https://docs.oracle.com/en-us/iaas/Content/generative-ai/cohere-embed-4.htm){:target="_blank" rel="noopener"}, [Embed Text API](https://docs.oracle.com/en-us/iaas/api/#/en/generative-ai-inference/latest/){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 **Cohere Embed 4**의 신규 기능을 지원합니다. 이제 EmbedText API에서 text only, image only, text와 image를 함께 포함한 입력을 embedding으로 변환할 수 있습니다.

주요 기능은 다음과 같습니다.

- **Matryoshka embeddings:** 256, 512, 1024, 1536 차원 중 출력 embedding dimension을 선택할 수 있습니다.
- **Multimodal input:** 텍스트만, 이미지 하나만, 또는 텍스트와 이미지 하나를 같은 payload에 넣어 embedding을 생성할 수 있습니다.
- **API-based image input:** 이미지는 base64 encoding으로 API payload에 포함합니다.
- **`embedContents` array:** Embed 4 모델에서만 지원되는 새 request body 구조로, text 또는 image content를 포함할 수 있습니다.

### 활용 포인트

이 기능은 상품 이미지와 설명, 차트와 해설, 문서 이미지와 주변 텍스트처럼 시각 정보와 텍스트 맥락을 함께 벡터화해야 하는 RAG, semantic search, recommendation workflow에 유용합니다. 다만 한 payload에는 이미지 하나만 포함할 수 있으므로, 여러 이미지를 다루는 경우에는 payload 설계를 나누어야 합니다.

## Use Cohere Rerank 4 in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** May 09, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/cohere-rerank-4.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/cohere-rerank-4.htm){:target="_blank" rel="noopener"}
- **Documentation:** [Cohere Rerank 4](https://docs.oracle.com/en-us/iaas/Content/generative-ai/cohere-rerank-4.htm){:target="_blank" rel="noopener"}, [Rerank Text API](https://docs.oracle.com/en-us/iaas/api/#/en/generative-ai-inference/latest/){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 **Cohere Rerank 4**를 사용해 document reranking을 수행할 수 있게 되었습니다. Rerank 4는 enterprise retrieval workflow를 위해 더 큰 context window, 개선된 reranking 품질, self-learning support, multilingual support를 제공합니다.

지원 모델 이름은 다음과 같습니다.

- `cohere.rerank-v4.0-pro`
- `cohere.rerank-v4.0-fast`

주요 특징은 다음과 같습니다.

- 32,000 token context window 지원
- 비즈니스, 금융, 기술 문서 등 enterprise retrieval 결과 정렬 품질 개선
- English와 non-English content를 포함해 100개 이상 언어 지원
- JSON, table, code-like content 같은 semi-structured data 지원
- Pro와 Fast 두 가지 variant 제공

### 활용 포인트

RAG 시스템에서 첫 번째 retrieval 단계가 많은 후보 문서를 가져온 뒤, Rerank 4를 사용해 질문과 가장 관련성이 높은 문서를 상위에 재정렬할 수 있습니다. Rerank 4는 API로만 접근하며, `RerankText` API 호출 시 `servingMode`에서 on-demand 또는 dedicated endpoint를 지정해야 합니다.

## Import New Compatible Models in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** May 11, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/compatible-imported-models-may-11-2026.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/compatible-imported-models-may-11-2026.htm){:target="_blank" rel="noopener"}
- **Documentation:** [Compatible Models for Import](https://docs.oracle.com/en-us/iaas/Content/generative-ai/compatible-models.htm){:target="_blank" rel="noopener"}, [Managing Imported Models](https://docs.oracle.com/en-us/iaas/Content/generative-ai/manage-imported-models.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 import할 수 있는 compatible model 목록에 신규 모델이 추가되었습니다. 이번 릴리즈에서 추가된 모델은 다음과 같습니다.

- **Alibaba Qwen**
  - `Qwen/Qwen3.6-35B-A3B`
  - `Qwen/Qwen3.5-9B`
- **Google Gemma**
  - `google/gemma-4-31B-it`

Imported Model 기능을 사용하면 사용자가 가져온 compatible model을 OCI Generative AI에 등록하고, endpoint를 생성해 inference에 사용할 수 있습니다.

### 활용 포인트

조직에서 특정 open model family를 표준으로 사용하거나, fine-tuned model을 OCI 내에서 운영하려는 경우 Imported Model을 통해 OCI 리소스, IAM, endpoint lifecycle, dedicated AI cluster 운영 흐름에 맞춰 관리할 수 있습니다. 모델별 지원 hardware와 deployment step은 Compatible Models for Import와 Managing Imported Models 문서를 함께 확인해야 합니다.

## Convert Text to Speech with xAI Voice in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** May 15, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xai-grok-voice.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xai-grok-voice.htm){:target="_blank" rel="noopener"}
- **Documentation:** [xAI Voice (Text to Speech)](https://docs.oracle.com/en-us/iaas/Content/generative-ai/xai-grok-tts.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 xAI Voice를 사용한 **Text to Speech** 기능을 지원합니다. 지원 모델은 `xai.grok-tts`이며, 텍스트 입력을 음성 오디오로 변환할 수 있습니다.

지원 방식은 두 가지입니다.

- **OCI OpenAI-compatible Audio Speech API:** 단일 요청으로 text를 보내고 audio file을 받는 방식입니다.
- **WebSocket streaming:** text input과 audio output을 WebSocket으로 streaming하는 방식입니다.

지원 voice는 다음과 같습니다.

- `ara`: warm and conversational
- `eve`: energetic and upbeat
- `leo`: authoritative and strong
- `rex`: clear and professional
- `sal`: smooth and balanced

### 활용 포인트

OpenAI-compatible Audio Speech API는 batch-style 음성 생성이나 파일 응답이 필요한 워크로드에 적합하고, WebSocket streaming은 점진적으로 생성되는 text를 낮은 지연으로 음성 재생해야 하는 워크로드에 적합합니다. 두 방식 모두 text를 audio로 변환하는 Text to Speech 기능이며, 언어, audio format, sample rate, bit rate 같은 출력 옵션은 API 방식에 맞게 설정합니다.

## Pin a Guardrails Version in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** May 26, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/ai-guardrails-versions.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/ai-guardrails-versions.htm){:target="_blank" rel="noopener"}
- **Documentation:** [Guardrails for OCI Generative AI](https://docs.oracle.com/en-us/iaas/Content/generative-ai/guardrails.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 `ApplyGuardrails` API를 사용할 때 특정 **Guardrails Version**을 선택할 수 있게 되었습니다. Guardrails는 foundation model 자체를 변경하는 기능이 아니라, model에 전달할 input이나 생성된 output을 content moderation, prompt injection, personally identifiable information detection 관점에서 별도로 평가하는 safety and compliance layer입니다.

Guardrails version은 `1.0.0` 같은 semantic versioning 형식으로 관리됩니다. 각 version은 Oracle이 제공하는 보호 기능과 내부 model, prompt, threshold 설정의 조합을 나타냅니다. 사용자는 Oracle이 제공하는 version과 적용할 보호 기능을 선택할 수 있지만, guardrail의 내부 system prompt나 탐지 model, threshold를 직접 정의하는 방식은 아닙니다.

새 기능은 다음과 같습니다.

- `ListGuardrailVersions` API로 사용 가능한 version과 lifecycle state를 확인
- `ApplyGuardrailsDetails` 요청에 `guardrailVersionConfig` 추가
- version을 지정하지 않으면 기본 guardrails version 사용
- production 환경에서는 특정 version pinning으로 guardrail behavior를 안정적으로 유지 가능

예시는 다음과 같습니다.

```json
{
  "guardrailVersionConfig": {
    "guardrailVersion": "1.0.1"
  }
}
```

### 활용 포인트

On-demand model에서는 guardrail이 기본으로 자동 적용되지 않으므로, application이 inference 전후에 `ApplyGuardrails` API를 호출하고 반환된 탐지 결과에 따라 logging, warning, blocking 같은 동작을 결정합니다. 지원되는 dedicated AI cluster endpoint에서는 guardrail을 endpoint에 연결하고 Inform 또는 Block mode로 적용할 수도 있습니다.

Guardrails의 내부 model, prompt, threshold는 Oracle이 version별로 관리하고 개선합니다. 운영 환경에서는 `ListGuardrailVersions`로 사용 가능한 version을 확인하고 특정 version을 pinning한 뒤, 변경 내용을 검토하여 새 version으로 전환하는 방식으로 동작의 일관성을 유지할 수 있습니다.

## Add xAI Tools to OCI Responses API

- **Services:** Generative AI
- **Release Date:** May 29, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xai-tools.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xai-tools.htm){:target="_blank" rel="noopener"}
- **Documentation:** [OCI Responses API](https://docs.oracle.com/en-us/iaas/Content/generative-ai/responses-api.htm){:target="_blank" rel="noopener"}, [QuickStart for OCI Generative AI Agents](https://docs.oracle.com/en-us/iaas/Content/generative-ai/get-started-agents.htm){:target="_blank" rel="noopener"}, [Tools](https://docs.oracle.com/en-us/iaas/Content/generative-ai/tool-support.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Responses API에서 xAI 모델과 함께 xAI-compatible tools를 사용할 수 있게 되었습니다. OCI Responses API는 OpenAI Responses API와 호환되지만, 이번에 추가된 도구는 xAI에서 제공하는 tool 설정과 limit을 사용합니다.

지원 도구는 다음과 같습니다.

- **Web Search (`web_search`):** 실시간 web search와 web page 정보 추출
- **X Search (`x_search`):** X의 posts, users, threads 검색
- **Code Execution (`code_interpreter`):** 계산, 데이터 분석, 코드 실행

### 주요 기능

- Web과 social data를 실시간으로 조회하고 분석
- Web Search와 X Search 결과에 대해 citation URL 반환 가능
- allowed 또는 excluded domain, X handle filter 지원
- image understanding, video understanding 옵션 지원
- Code Execution을 통해 분석, 계산, 시나리오 비교 같은 작업 수행 가능

### 활용 포인트

xAI Tools는 최신 정보 검색, 시장/경쟁사 모니터링, X 기반 sentiment 분석, 금융/비즈니스 계산처럼 실시간 데이터와 계산이 섞인 agent workflow에 적합합니다. OCI Responses API를 통해 호출하지만 tool별 option과 limit은 xAI 방식을 따르므로, OpenAI tool 설정을 그대로 복사하기보다 xAI-compatible tool 문서를 기준으로 payload를 구성해야 합니다.
