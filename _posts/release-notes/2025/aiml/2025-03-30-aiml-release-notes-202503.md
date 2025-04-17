---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "3월 OCI AI/ML 업데이트 소식"
teaser: "2025년 3월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Mar-2025
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

## OCI Generative AI에서 TypeScript 코드 샘플 보기

- **Services:** Generative AI
- **Release Date:** Mar 3, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/type-script.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/type-script.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

이제 **OCI Generative AI**는 **TypeScript** 코드 샘플을 **OCI Generative AI 플레이그라운드**에서 지원합니다.

**OCI Generative AI**는 **Oracle Cloud Infrastructure (OCI) SDK**와 통합되어 있습니다. 플레이그라운드에서 채팅(Chat) 또는 텍스트 임베딩(Text Embeddings)을 생성할 때, **Java**와 **Python** 프로그래밍 언어 외에도 **TypeScript** 프로그래밍 언어로 선택한 **LLM**과 입력 파라미터가 포함된 코드 샘플을 생성합니다.

이 샘플 코드는 플레이그라운드 경험을 기반으로 애플리케이션 코딩을 단순화하는 데 도움이 됩니다. TypeScript 샘플 코드를 얻는 방법에 대한 단계는 [OCI Generative AI 콘솔에서 채팅하기](https://docs.oracle.com/iaas/Content/generative-ai/use-playground-chat.htm#chat){:target="\_blank" rel="noopener"} 문서를 참고하세요.

---

## OCI Generative AI에서 Meta의 Llama 3.3 Instruct 모델 Fine-tuning하기

- **Services:** Generative AI
- **Release Date:** Mar 21, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/llama-3-3-fine-tuning.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/llama-3-3-fine-tuning.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

이제 **OCI Generative AI**는 **Meta의 사전 학습된 700억(70B) 매개변수 Llama 3.3 instruct 모델**의 **Fine-tuning**을 지원합니다. 이 **텍스트 전용 모델(Text-Only Model)**은 **Llama 3.1 70B** 및 **Llama 3.2 90B**보다 텍스트 작업에서 더 나은 성능을 제공합니다.

**Low-Rank Adaptation (LoRA)** 방법을 사용하여 자신의 데이터셋으로 **Llama 3.3 instruct 모델**을 Fine-tuning하여 AI 기능을 향상시킬 수 있습니다. Fine-tuning에 대한 자세한 내용은 [Base 모델 Fine-tuning하기](https://docs.oracle.com/iaas/Content/generative-ai/fine-tune-models.htm){:target="\_blank" rel="noopener"} 문서를 참고하세요.

#### **중요한 안내 (Important Note)**

- 이 모델을 사용하기 전에 **Meta의 [Llama 3.3 허용 사용 정책(Acceptable Use Policy)](https://www.llama.com/llama3_3/use-policy/){:target="\_blank" rel="noopener"}**을 반드시 검토하세요.

#### **추가 정보**

- **[OCI Generative AI에서 Base 모델 Fine-tuning 하기](https://docs.oracle.com/iaas/Content/generative-ai/fine-tune-models.htm){:target="\_blank" rel="noopener"}**
- **[OCI Generative AI 공식 문서](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="\_blank" rel="noopener"}**

---

# Generative AI Agents

## OCI Generative AI Agents 플랫폼 출시 (2025년 3월 26일)

- **Services:** Generative AI Agents
- **Release Date:** Mar 26, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-tools.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-tools.htm){:target="\_blank" rel="noopener"}

### 즉시 사용 가능한 SQL 도구 (Ready-to-use SQL Tool)

이 도구는 자연어를 통해 구조화된 엔터프라이즈 데이터와 상호 작용하는 방식을 혁신하여, 최소한의 노력으로 가치 있는 인사이트를 얻을 수 있도록 합니다.

#### **주요 기능 (Key Features)**

- **SQL 생성 (SQL Generation)**: 자연어 입력을 기반으로 SELECT 문을 자동으로 생성합니다.
- **SQL 설명 (SQL Explanation)**: SQL 문에 대한 직관적인 설명을 제공하여 구문과 논리를 이해하는 데 도움을 줍니다.
- **자동 수정 (Self-correction)**: 생성된 SQL 쿼리의 구문 오류를 자동으로 감지하고 수정합니다.
- **SQL 실행 (SQL Execution)**: SELECT 문을 실행하고 주요 결과와 인사이트를 반환합니다.
- **스키마 연결 (Schema Linking)**: 에이전트에 데이터베이스 스키마를 쉽게 제공할 수 있습니다.
- **컨텍스트 내 학습 예제 (In-Context Learning Examples)**: SQL 도구를 구성할 때 예제를 제공하여 응답의 정확성을 향상시킬 수 있습니다.
- **사용자 정의 지시사항 (Custom Instructions)**: 비즈니스 요구에 따라 SQL 도구의 동작과 톤을 조정할 수 있습니다.
- **테이블/열 설명 (Table/Column Descriptions)**: 스키마 컨텍스트를 풍부하게 하고 응답 품질 향상에 도움이 되는 설명을 추가할 수 있습니다.
- **모델 선택 (Model Selection)**: 지연 시간과 정확성을 최적화하기 위해 더 작거나 큰 모델 중에서 선택할 수 있습니다.
- **다중 방언 지원 (Multi-dialect Support)**: Oracle SQL에 맞춤화되어 있으며 SQLite를 포함한 여러 SQL 방언과 호환됩니다.

### 즉시 사용 가능한 RAG (Retrieval-Augmented Generation) 도구

고객 피드백을 바탕으로 개선된 기능을 갖춘 **RAG 도구**의 주요 개선 사항을 출시합니다.

#### **주요 기능 (Key Features)**

- **향상된 응답 품질 (Enhanced Response Quality)**: 생성된 답변의 컨텍스트 이해와 관련성을 개선하여 정확성을 향상시킵니다.
- **하이브리드 검색 (Hybrid Search)**: 키워드와 벡터 검색을 결합하여 매우 정확하고 효율적인 검색을 제공합니다.
- **개선된 다중 모달 파싱 (Improved Multi-Modal Parsing)**: 이미지와 차트와 같은 풍부한 콘텐츠 형식에서 인사이트를 추출합니다.
- **사용자 정의 지시사항 (Custom Instructions)**: RAG 도구의 동작과 응답 스타일을 미세 조정하기 위한 기본 설정을 정의할 수 있습니다.
- **다국어 지원 (Multi-Lingual Support)**: 프랑스어, 스페인어, 포르투갈어, 아랍어, 독일어, 이탈리아어, 일본어를 포함한 여러 언어에서 원활하게 상호 작용할 수 있습니다.
- **다중 지식 기반 (Multiple Knowledge Bases)**: 지식의 범위와 깊이를 향상시키기 위해 에이전트가 여러 지식 기반에서 정보를 검색하도록 설정할 수 있습니다.
- **메타데이터 수집 및 필터링 (Metadata Ingestion & Filtering)**: 메타데이터를 사용하여 검색을 구체화하고 콘텐츠를 더 효과적으로 분류할 수 있습니다.
- **크로스 리전 액세스 (Cross-Region Access)**: Oracle Vector Search (Database 23ai)를 사용하여 리전 간 벡터 데이터 검색을 활성화합니다.
- **단락 수준 인용 (Paragraph-Level Citations)**: 각 응답에 대한 명확한 소스 속성을 통해 투명성을 향상시킵니다.

### **사용자 정의 함수 호출 도구 (Custom Function Calling Tool)**

이제 에이전트가 수행하는 작업을 확장하기 위한 **사용자 정의 함수 호출 도구**를 제공합니다. 함수를 정의한 다음 자연어로 에이전트에게 작업을 수행하도록 요청할 수 있습니다. 에이전트는 관련 함수를 실행하고 함수가 수행하는 작업에 따라 응답할 수 있습니다.

### **기타 개선 사항 (Other Enhancements)**

- **원활한 에이전트 설정 및 배포 (Seamless Agent Setup and Deployment)**: 효율적이고 확장 가능한 에이전트 설정 및 배포를 위한 완전 관리형 클라우드 네이티브 플랫폼입니다. 맞춤화에 대한 유연성을 갖춘 현대적인 워크플로우를 지원합니다.
- **도구 오케스트레이션 (Tools Orchestration)**: 여러 도구와 서비스를 오케스트레이션하여 복잡한 워크플로우를 구축하고 대화를 자동화할 수 있습니다.
- **다중 턴 채팅 경험 (Multi-Turn Chat Experience)**: 더 인간적인 상호 작용을 위한 동적 다중 턴 대화를 지원합니다.
- **컨텍스트 보존 (Context Retention)**: 에이전트는 턴 간 대화 컨텍스트를 기억하여 개인화되고 일관된 경험을 제공합니다.
- **가드레일 (Guardrails)**: 에이전트가 콘텐츠 조정을 식별하고 적용하는 데 도움을 주며, 에이전트 엔드포인트에서 프롬프트 주입(PI)과 개인 식별 정보(PII)를 식별하고 보호하는 데 도움을 줍니다.
- **인간 개입 (Human-in-the-Loop)**: 실시간 모니터링과 인간 개입을 위한 선택적 기능입니다.
- **확장성 및 보안 (Scalability and Security)**: 강력한 보안, 안정성 및 규정 준수를 갖춘 OCI 기반의 엔터프라이즈급 인프라를 제공합니다.

서비스에 대한 자세한 내용은 [Generative AI Agents 문서](https://docs.oracle.com/iaas/Content/generative-ai-agents/home.htm){:target="\_blank" rel="noopener"}를 참고하세요.

---

## OCI Generative AI Agents, 일본 중부(오사카) 리전에서 사용 가능

- **Services:** Generative AI Agents
- **Release Date:** Mar 28, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-region-osaka.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-region-osaka.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

이제 **OCI Generative AI Agents**는 **일본 중부(오사카) 리전**에서 사용할 수 있습니다. 자세한 내용은 [Generative AI Agents가 지원하는 리전](https://docs.oracle.com/iaas/Content/generative-ai-agents/regions.htm){:target="\_blank" rel="noopener"}을 참고하세요.

서비스에 대한 자세한 내용은 [Generative AI Agents 문서](https://docs.oracle.com/iaas/Content/generative-ai-agents/home.htm){:target="\_blank" rel="noopener"}를 참고하세요.
