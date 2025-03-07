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


---
# Data Science

---
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


---


# Generative AI

---
## Use Meta Llama 3.3 70B in all OCI Generative AI regions
* **Services:** Generative AI
* **Release Date:** Feb 7, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/llama-3-3.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/llama-3-3.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 **OCI Generative AI**에서 **Meta의 700억(70B) 매개변수 Llama 3.3 Instruct 모델**을 지원합니다.  
이 **텍스트 전용 모델(Text-Only Model)**은 **Llama 3.1 70B 및 Llama 3.2 90B보다 뛰어난 성능**을 제공합니다.  
OCI 콘솔(Chat 인터페이스), API, 전용 엔드포인트를 통해 모델을 사용할 수 있으며,  
인프라를 관리할 필요 없이 쉽게 활용할 수 있습니다.

---

#### **주요 특징 (Key Highlights)**
- **텍스트 입력 및 텍스트 출력 전용 모델**
- **Llama 3.1 70B와 동일한 프롬프트 형식 사용**
- **Llama 3.1 70B와 동일한 코드 인터프리터(Code Interpreter) 지원**
    - **128,000 토큰 컨텍스트 길이 유지**
- **Llama 3.1 70B 대비 개선된 성능**
    - **추론(Reasoning), 코딩(Coding), 수학(Math), 지시 사항 준수(Instruction-Following) 성능 향상**
    - 자세한 내용은 **[Llama 3.3 모델 카드](https://github.com/meta-llama/llama-models/blob/main/models/llama3_3/MODEL_CARD.md)** 참고
- **온디맨드 추론(On-Demand Inferencing) 및 전용 호스팅(Dedicated Hosting) 지원**

---

#### **지원 리전 (Available Regions)**
- **브라질 동부 (Sao Paulo)**
- **독일 중앙 (Frankfurt)**
- **일본 중앙 (Osaka)**
- **영국 남부 (London)**
- **미국 중서부 (Chicago)**

---

#### **중요한 안내 (Important Note)**
- 이 모델을 사용하기 전에 **Meta의 [Llama 3.3 허용 사용 정책(Acceptable Use Policy)](https://www.llama.com/llama3_3/use-policy/)**을 반드시 검토하세요.

---

#### **추가 정보**
- **[OCI Generative AI에서 제공하는 사전 학습 모델 목록](https://docs.oracle.com/iaas/Content/generative-ai/pretrained-models.htm)**
- **[OCI Generative AI 공식 문서](https://docs.oracle.com/iaas/Content/generative-ai/home.htm)**







