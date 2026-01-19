---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "1월 OCI AI/ML 업데이트 소식"
teaser: "2025년 1월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Jan-2025
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

# Data Science

---

## Data Science now Supports Text Embeddings Inference (TEI) Framework
* **Services:** Data Science
* **Release Date:** January 10, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/aqua-105.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/aqua-105.htm){:target="_blank" rel="noopener"}
 
### 업데이트 내용

#### 데이터 사이언스 AI 퀵 액션(Quick Actions) 기능 업데이트

1. TEI (Text Embeddings Inference) 프레임워크 지원
데이터 사이언스 AI 퀵 액션에서 **TEI (Text Embeddings Inference) 프레임워크**를 지원합니다.  
BYOC(Bring Your Own Container) 방식으로 TEI를 사용할 수 있습니다:

- 컨테이너 이미지를 **OCIR(Oracle Cloud Infrastructure Registry)**에 푸시
- 추론(Inference) 컨테이너로 **TEI 선택**
- 모델 등록 시 **이미지 URI 지정**
  ![](/assets/img/aiml/2025/release/202501-ds-tei.png " ")
2. 서비스 검증 모델 추가
- **[e5-mistral-7b-instruct](https://huggingface.co/intfloat/e5-mistral-7b-instruct/tree/main){:target="_blank" rel="noopener"}** 모델이 **서비스 검증 모델**로 추가되었습니다.

3. 환경 탐색기(Environment Explorer) 개선
- **탭 수가 두 개로 단순화**되었습니다:
    - **기본 모델(Base models)**
    - **미세 조정된 모델(Fine-tuned models)**

  - **기본 모델(Base models) 탭**에서는 다음을 확인할 수 있습니다:
      - 서비스에서 **캐시된 모델**
      - **서비스 검증 모델**, 등록 후 AI Quick Actions에서 사용 가능
      - 사용자가 직접 등록한 **맞춤형 모델**

  - 각각의 모델에는 **"Ready to Deploy"(배포 준비 완료)**, **"Ready to Register"(등록 준비 완료)** 등의 태그가 포함된 **모델 카드**가 있어 쉽게 구분할 수 있습니다.

![](/assets/img/aiml/2025/release/202501-ds-ui-1.png " ")
![](/assets/img/aiml/2025/release/202501-ds-ui.png " ")

---

## Data Science AI Quick Actions v 1.0.6a
* **Services:** Data Science
* **Release Date:** January 30, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/aqua-106-a.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/aqua-106-a.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
#### 데이터 사이언스 AI 퀵 액션 v1.0.6a 업데이트 사항

1. 다중 추론 엔드포인트 지원 확대 (Expanded Multiple Inference Endpoint Support)
- 이제 **추론 플레이그라운드 (Inference Playground)**에서 **채팅 완성 (Chat Completion) 엔드포인트**를 사용할 수 있습니다.
- **`Copy payload`** 기능을 선택하면,
  - **모델 엔드포인트 (Model Endpoint) 정보**를 확인할 수 있으며,
  - **완성 (Completion) 또는 채팅 완성 (Chat Completion) 추론 형식에 맞는 CLI 호출 코드 샘플**을 얻을 수 있습니다.

2. 모델 등록 시 특정 파일 제외 기능 추가 (Exclusion of Files During Model Registration)
- 모델 등록 과정에서 **파일 형식(File Format)**에 따라 특정 파일을 제외할 수 있습니다.
- 예를 들어, **Hugging Face에서 AI 퀵 액션 (AI Quick Actions)**으로 모델을 가져올 때,
  - `.txt` 및 `.pdf` 같은 특정 파일을 다운로드하지 않도록 설정할 수 있습니다.

3. 모델 상세 페이지에서 모델 OCID 복사 기능 추가 (Addition of Copy Model OCID Feature in Model Details Page)
- 모델 등록 후, **콘솔(Console)**을 직접 이동하지 않아도,
  - **모델 상세 페이지 (Model Details Page)**에서 **모델 OCID**를 확인하고 복사할 수 있습니다.

4. 모델 상세 페이지 UI 변경 (Model Details Actions Button UI Changes)
- 모델 상세 페이지의 **작업 버튼 UI(User Interface)**가 개선되었습니다.

5. 툴 콜링 지원 (Tool Calling Support)
- **AI 퀵 액션 (AI Quick Actions)**는 이제 **툴 콜링 (Tool Calling) 기능을 지원하는 vLLM 컨테이너**를 제공합니다.
- **툴 콜링 (Tool Calling)** 기능을 활용하면,
  - 모델이 **추론(Inference) 과정에서 외부 함수(External Functions)**를 호출할 수 있어,
  - **더 정확하고 컨텍스트(Context)에 맞는 응답**을 제공할 수 있습니다.


---

# Generative AI

---
## Use Meta Llama 3.2 90B Vision and 11B Vision in all OCI Generative AI regions
* **Services:** Generative AI
* **Release Date:** Jan 2, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/scheduler.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/scheduler.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
2025년 1월 2일부터 Meta Llama 3.2 90B Vision 및 11B Vision 모델이 모든 OCI Generative AI 리전에서 사용 가능해 졌습니다.

#### **추가 정보**
- **[OCI Generative AI에서 제공하는 사전 학습 모델 목록](https://docs.oracle.com/iaas/Content/generative-ai/pretrained-models.htm){:target="_blank" rel="noopener"}**
- **[OCI Generative AI 공식 문서](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}**


---
## Use the seed parameter in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** Jan 30, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/seed-parameter.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/seed-parameter.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 **OCI 생성형 AI (OCI Generative AI)**는 **시드(Seed) 파라미터**를  
**OCI 생성형 AI 플레이그라운드(Playground), CLI, API**에서 지원합니다.

#### **시드(Seed) 파라미터란?**
- **시드 파라미터를 설정하면, 모델이 가능한 한 동일한 토큰을 결정론적으로 샘플링**합니다.
- 동일한 **시드 값과 동일한 요청 파라미터**를 사용할 경우,
  - 모델이 **일관된 결과**를 반환하도록 동작합니다.

#### **지원 모델**
이 기능은 **OCI 생성형 AI 서비스에서 지원하는 모든 Meta Llama 및 Cohere Command 모델**에서 사용 가능합니다.

#### **시드 파라미터 사용 방법**
- **API에서 사용하기**
  - **Cohere 모델**의 경우: [CohereChatRequest](https://docs.oracle.com/iaas/api/#/en/generative-ai-inference/latest/datatypes/CohereChatRequest){:target="_blank" rel="noopener"}
  - **Meta Llama 모델**의 경우: [GenericChatRequest](https://docs.oracle.com/iaas/api/#/en/generative-ai-inference/latest/datatypes/GenericChatRequest){:target="_blank" rel="noopener"}

- **플레이그라운드에서 사용하기**
  - 자세한 내용은 [콘솔에서 채팅 사용하기](https://docs.oracle.com/iaas/Content/generative-ai/use-playground-chat.htm#chat){:target="_blank" rel="noopener"} 문서를 참고하세요.

#### **추가 정보**
- **[시드(Seed) 파라미터 정의](https://docs.oracle.com/iaas/Content/generative-ai/chat-models.htm#parameters-chat){:target="_blank" rel="noopener"}**
- **[OCI 생성형 AI에서 지원하는 사전 학습 모델](https://docs.oracle.com/iaas/Content/generative-ai/pretrained-models.htm){:target="_blank" rel="noopener"}**
- **[OCI Generative AI 공식 문서](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}**  

![](/assets/img/aiml/2025/release/202501-genai-seed-param.png " ")


---

## View code samples for LangChain and LlamaIndex in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** Jan 30, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/view-code.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/view-code.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 **OCI 생성형 AI (OCI Generative AI)**는 **LangChain** 및 **LlamaIndex** 코드 샘플을  
**OCI 생성형 AI 플레이그라운드 (OCI Generative AI Playground)**에서 지원합니다.

#### **LangChain 및 LlamaIndex 통합**
**OCI 생성형 AI**는 **대형 언어 모델(LLMs, Large Language Models)**을 제공하는 플랫폼으로,  
**LangChain** 및 **LlamaIndex**와의 **통합(Integration)**을 지원합니다.

- **플레이그라운드에서 채팅(Chat) 또는 텍스트 임베딩(Text Embeddings)을 생성할 때**,
  - **OCI 생성형 AI**가 **LangChain 및 LlamaIndex용 코드 샘플**을 자동으로 생성합니다.
  - 생성된 코드 샘플에는 **사용자의 프롬프트 및 임베딩 정보**가 포함됩니다.
- 이를 활용하여 **자신의 애플리케이션(Application)**에서 직접 실행할 수 있습니다.

#### **추가 정보**
OCI 생성형 AI의 **LangChain 및 LlamaIndex 통합**에 대한 자세한 내용은 아래 문서를 참고하세요:

- [**LangChain 통합 가이드**](https://docs.oracle.com/iaas/Content/generative-ai/langchain.htm){:target="_blank" rel="noopener"}
- [**LlamaIndex 통합 가이드**](https://docs.oracle.com/iaas/Content/generative-ai/llama-index.htm#llama-index){:target="_blank" rel="noopener"}

![](/assets/img/aiml/2025/release/202501-genai-code.png " ")

