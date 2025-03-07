---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "2월 OCI AI/ML 업데이트 소식"
teaser: "2025년 2월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Feb-2025
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

## Data Science now Supports Scheduling
* **Services:** Data Science
* **Release Date:** Feb 26, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/scheduler.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/scheduler.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

#### 데이터 사이언스 스케줄러 기능 추가

이제 **데이터 사이언스 (Data Science)**에 **스케줄러 (Scheduler)** 기능이 포함되었습니다.  
이를 활용하여 **ML 작업 (ML Jobs), ML 파이프라인 (ML Pipelines), ML 모니터링 (ML Monitoring)** 등  
다른 데이터 사이언스 리소스를 **주기적으로 실행**할 수 있습니다.

**활용 예시**
- **모델 학습 파이프라인 (Model Training Pipeline)**을 **매주 자동 실행**
- **ML 모니터링 작업 (ML Monitoring Job)**을 **매일 실행**
- **배치 추론 작업 (Batch Inference Job)**을 **4시간마다 실행**

**추가 정보**
더 자세한 정보는 다음 문서를 참고하세요:
- [**Jobs**](#)
- [**Pipelines**](#)


# Generative AI

## Use Meta Llama 3.2 90B Vision and 11B Vision in all OCI Generative AI regions
* **Services:** Generative AI
* **Release Date:** Feb 26, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/scheduler.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/scheduler.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
2025년 1월 2일부터 Meta Llama 3.2 90B Vision 및 11B Vision 모델이 모든 OCI Generative AI 리전에서 사용 가능해졌습니다.

아래는 현재 지원하는 모델에 대한 간략한 요약 내용입니다.

#### Meta Llama 3.1

| 모델 이름 | 파라미터 개수 | 주요 특징 | 릴리즈 일자 | 사용가능한 OCI Region |
|-----------|---------------|-----------|-------------|------------------------|
| Meta Llama 3.1 70B | 70B | -  8개 언어 지원<br>-  128,000 토큰 컨텍스트 길이<br>-  콘텐츠 생성, 대화형 AI, 기업 애플리케이션에 적합<br>-  텍스트 요약, 재작성, 분류 기능<br>-  감정 분석 및 언어 모델링 기능<br>-  대화 시스템 및 코드 생성 지원 | 2024년 9월 19일 | -  Brazil East (Sao Paulo)<br>-  Germany Central (Frankfurt)<br>-  UK South (London)<br>-  US Midwest (Chicago) |
| Meta Llama 3.1 405B | 405B | -  8개 언어 지원<br>-  128,000 토큰 컨텍스트 길이<br>-  고성능 기업 수준 애플리케이션 및 연구에 적합<br>-  일반 지식, 합성 데이터 생성, 고급 추론, 맥락 이해 분야에서 고품질 응답 제공<br>-  장문 텍스트 생성, 다국어 번역, 코딩, 수학, 도구 사용 지원 | 2024년 9월 19일 | -  US Midwest (Chicago)<br>-  다른 지역은 전용 AI 클러스터 필요 |

#### Cohere Command

| 모델 이름 | 파라미터 개수 | 주요 특징 | 릴리즈 일자 | 사용가능한 OCI Region |
|-----------|---------------|-----------|-------------|------------------------|
| Cohere Command R 08-2024 | 미공개 | -  128,000 토큰 컨텍스트 길이<br>-  수학, 코딩, 추론 능력 향상<br>-  LoRA 및 T-Few 방식의 파인튜닝 지원<br>-  다국어 RAG 기능 강화<br>-  구조화된 데이터 분석 개선<br>-  사용자 정의 JSON 생성 기능 | 2024년 11월 14일 | -  US Midwest (Chicago)<br>-  Germany Central (Frankfurt)<br>-  UK South (London)<br>-  Brazil East (Sao Paulo) |
| Cohere Command R+ 08-2024 | 미공개 | -  128,000 토큰 컨텍스트 길이<br>-  지연 시간 및 처리량 개선<br>-  다국어 RAG 기능 강화<br>-  구조화된 데이터 분석 개선<br>-  사용자 정의 JSON 생성 기능 | 2024년 11월 14일 | -  US Midwest (Chicago)<br>-  Germany Central (Frankfurt)<br>-  UK South (London)<br>-  Brazil East (Sao Paulo) |

#### Meta Llama 3.2 Vision

| 모델 이름 | 파라미터 개수 | 주요 특징 | 릴리즈 일자 | 사용가능한 OCI Region |
|-----------|---------------|-----------|-------------|------------------------|
| Meta Llama 3.2 90B Vision | 90B | -  멀티모달 AI 기능 (이미지 및 텍스트 이해)<br>-  128,000 토큰 컨텍스트 길이<br>-  Llama 3.1 70B의 텍스트 기반 기능 포함<br>-  온디맨드 추론 및 전용 호스팅 지원<br>-  8개 언어 지원 (텍스트 쿼리만) | 2024년 11월 14일 | -  Brazil East (Sao Paulo)<br>-  UK South (London)<br>-  Japan Central (Osaka)<br>-  US Midwest (Chicago) |
| Meta Llama 3.2 11B Vision | 11B | -  멀티모달 AI 기능 (이미지 및 텍스트 이해)<br>-  128,000 토큰 컨텍스트 길이<br>-  컴팩트한 형태로 강력한 멀티모달 기능 제공<br>-  전용 호스팅 지원<br>-  8개 언어 지원 (텍스트 쿼리만) | 2024년 11월 14일 | -  Brazil East (Sao Paulo)<br>-  UK South (London)<br>-  Japan Central (Osaka)<br>-  US Midwest (Chicago) |



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

- [**LangChain 통합 가이드**](https://docs.oracle.com/iaas/Content/generative-ai/langchain.htm)
- [**LlamaIndex 통합 가이드**](https://docs.oracle.com/iaas/Content/generative-ai/llama-index.htm#llama-index)

![](/assets/img/aiml/2025/release/202501-genai-code.png " ")








![](/assets/img/aiml/2024/release/202407-genai-finetune-r.png " ")
