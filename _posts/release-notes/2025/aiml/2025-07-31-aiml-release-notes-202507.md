---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "7월 OCI AI/ML 업데이트 소식"
teaser: "2025년 7월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Jul-2025
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

## OCI Generative AI now supports xAI Grok 4

- **Services:** Generative AI
- **Release Date:** July 23, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/grok-4.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/grok-4.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI의 xAI 플랫폼에서 사전 학습된 Grok 4 모델을 공식적으로 지원합니다. Grok 4는 자연어, 수학, 추론에서 높은 성능을 제공하며, 네이티브 툴 사용과 기업용 활용(데이터 추출, 코딩, 요약 등)에 강점을 보입니다.

핵심 포인트:

- 고성능 추론과 수학 능력
- 네이티브 툴 사용(툴 콜링) 지원
- 기업 데이터 처리·요약·코딩 시나리오에 적합

제공 모델과 리전: [사전 학습 기반 모델](https://docs.oracle.com/iaas/Content/generative-ai/pretrained-models.htm){:target="\_blank" rel="noopener"}

## Use model aliases in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** July 10, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/model-alias.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/model-alias.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

온디맨드 서빙 모드 모델에 대해 최신 버전으로 자동 라우팅되는 **모델 별칭**을 지원합니다. 실험/테스트에 유용하며, 클라이언트 코드 변경 없이 최신 버전을 사용할 수 있어 운영 부담을 줄입니다.

**제공 별칭 예시**

- `cohere.command-latest` → `cohere.command-r-08-2024`
- `cohere.command-plus-latest` → `cohere.command-r-plus-08-2024`

**사용 방법**

- Playground: `-latest` 접미사가 있는 모델 선택
- API/CLI/SDK: 모델 ID 대신 별칭 전달 (예: CLI `model_id = "cohere.command-latest"`)

**사용 가능 리전** (대상 모델의 온디맨드 모드가 제공되는 리전)

- Brazil East (Sao Paulo)
- Germany Central (Frankfurt)
- Japan Central (Osaka)
- UK South (London)
- US Midwest (Chicago)

## Get notified about model retirement dates in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** July 10, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/retire-announcements.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/retire-announcements.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

콘솔 경고, API 응답 헤더(`model-retirement-info`) 및 OCI 공지 구독을 통해 모델 폐기/retirement 일정을 안내합니다. 상세 일정은 `GetModel` API로 확인 가능하며, 다음 속성을 제공합니다: `timeDeprecated`, `timeOnDemandRetired`, `timeDedicatedRetired`.

**공지 구독 권장**: 온디맨드 14/7일 전, 전용 모드 90/60/30/7일 전에 안내됩니다.

## OCI Generative AI now supports Cohere Embed 4

- **Services:** Generative AI
- **Release Date:** July 03, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/cohere-embed-4.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/cohere-embed-4.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

텍스트 또는 이미지를 단일 페이로드로 입력해 임베딩을 생성합니다(동시 입력 불가). 콘솔 입력은 512 토큰 미만, 실행당 최대 96개 입력을 권장하며, API/SDK에서는 실행당 총 128,000 토큰까지 처리할 수 있습니다. 출력 벡터 크기는 1,536차원입니다.

## Generative AI is now available in LangChain4j

- **Services:** Generative AI
- **Release Date:** July 02, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/langchain4j.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/langchain4j.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

자바용 LangChain인 **LangChain4j**에서 OCI Generative AI 모델을 지원합니다.

**관련 자료**

- LangChain4j 통합: [문서](https://docs.langchain4j.dev/integrations/language-models/oci-genai){:target="\_blank" rel="noopener"} · [GitHub](https://github.com/langchain4j/langchain4j-community/tree/main/models/langchain4j-community-oci-genai){:target="\_blank" rel="noopener"}

### 사용 방법 요약 (LangChain4j Community – OCI Generative AI)

- 의존성 추가: 프로젝트에 OCI Generative AI용 LangChain4j 커뮤니티 모듈을 추가합니다. 정확한 Maven/Gradle 좌표와 최신 버전은 저장소 README를 참고하세요. [GitHub README](https://github.com/langchain4j/langchain4j-community/tree/main/models/langchain4j-community-oci-genai){:target="\_blank" rel="noopener"}
- 모델 선택: `modelId`에 사용할 사전 학습 모델(예: Cohere Command 계열, xAI Grok 계열 등)을 지정합니다.
- 엔드포인트/리전: 사용 리전의 Generative AI 엔드포인트를 지정합니다(예: Chicago/Ashburn/Phoenix 등 서비스 제공 리전).
- 인증: 로컬은 `~/.oci/config`(프로파일) 또는 환경 변수, OCI 환경은 인스턴스 기반 인증/리소스 기반 인증을 활용합니다.

예시 코드(개념적):

```java
// Gradle/Maven 의존성은 README 참고
// GitHub: https://github.com/langchain4j/langchain4j-community/tree/main/models/langchain4j-community-oci-genai

import dev.langchain4j.model.chat.ChatLanguageModel;

// 실제 클래스/빌더 명은 README의 최신 예제를 참고하세요
ChatLanguageModel model = OciGenerativeAiChatModel.builder()
    .endpoint("https://inference.generativeai.us-chicago-1.oci.oraclecloud.com")
    .compartmentId("ocid1.compartment.oc1......")
    .modelId("cohere.command-r-08-2024") // 또는 xAI Grok 계열 등 사용 모델 ID
    .temperature(0.3)
    .maxTokens(1024)
    .build();

String answer = model.generate("제품 A의 요약을 작성해 주세요.");
```

설정 팁:

- 프로덕션에서는 전용 VCN/프라이빗 엔드포인트 또는 허용 목록 기반의 보안을 권장합니다.
- 모델 교체가 잦다면 모델 별칭(`-latest`)을 사용해 클라이언트 재배포 없이 최신 버전으로 전환할 수 있습니다.
- 리전별 제공 모델/서빙 모드(온디맨드/디디케이티드)는 사전 확인이 필요합니다.

## OCI Generative AI is available in the US West (Phoenix) region

- **Services:** Generative AI
- **Release Date:** July 28, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/new-region-phoenix.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/new-region-phoenix.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI가 **US West (Phoenix)** 리전에서 제공됩니다.

---

# Generative AI Agents

## New Tools and Features in OCI Generative AI Agents

- **Services:** Generative AI Agents
- **Release Date:** July 23, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/features-2025-july.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/features-2025-july.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

- API 엔드포인트 호출 도구: 다양한 API 유형을 적절한 인증과 함께 호출
- Agent 도구: 다수의 전문 에이전트를 오케스트레이션하여 협업 수행
- HeatWave MySQL: BYO 임베딩을 RAG 도구와 연계
- 데이터 수집: JSON/HTML/MD 파일 지원 및 수집 결과 통계/로그 제공

---

# Speech

## Speech has added new languages for Text to Speech

- **Services:** Speech
- **Release Date:** July 31, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/speech/july-25-tts-multilingual-support.htm](https://docs.oracle.com/en-us/iaas/releasenotes/speech/july-25-tts-multilingual-support.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

Natural TTS 모델이 다음 9개 언어를 지원합니다: 영어(미국/영국), 스페인어, 포르투갈어(브라질), 프랑스어, 이탈리아어, 힌디어, 일본어, 중국어(표준어). 서비스는 **US West (Phoenix)** 상용 리전에서 제공됩니다. 자세한 리전은 [문서](https://docs.oracle.com/iaas/Content/speech/using/speech.htm#regions){:target="\_blank" rel="noopener"}를 참고하세요.
