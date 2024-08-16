---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "6월 OCI AI/ML 업데이트 소식"
teaser: "2024년 6월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-aiml
tags:
  - oci-release-notes-2024
  - June-2024
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



## New chat feature in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 4, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/9b3a7e9a-9ac7-41bb-a9ab-e5596f8c511c/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/9b3a7e9a-9ac7-41bb-a9ab-e5596f8c511c/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI Generative AI가 이제 Generative AI 모델에 대한 AI 챗봇 경험을 제공하는 채팅 API를 지원합니다.
기업 애플리케이션에 쉽게 통합할 수 있도록, 채팅 API는 Cohere Command R 및 Meta Llama 3 모델과 같은 제공된 사전 훈련된 채팅 모델의 형식과 동일합니다.
또한 OCI Generative AI 플레이그라운드에서 챗봇 경험을 쉽게 시작할 수 있습니다.

![](/assets/img/aiml/2024/release/202406-genai-chat.png " ")

## OCI Generative AI is now available in Germany Central (Frankfurt)
* **Services:** Generative AI
* **Release Date:** June 4, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/91c93ecc-cc7f-43c1-9110-6f93b181aef5/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/91c93ecc-cc7f-43c1-9110-6f93b181aef5/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI Generative AI 서비스가 이제 독일의 Germany Central (Frankfurt) 리전에 출시 되었습니다. OCI Generative AI 서비스가 가능한 지역에 대한 정보는 [Regions with Generative AI](https://docs.oracle.com/iaas/Content/generative-ai/overview.htm#regions){:target="_blank" rel="noopener"} 링크를 참조하세요.


## Cohere Command R is now available in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 4, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/fc743a75-4cbb-4ffe-b9a1-d5c4af3dc4b4/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/fc743a75-4cbb-4ffe-b9a1-d5c4af3dc4b4/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI Generative AI가 이제 사전 훈련된 Cohere Command R 모델을 지원합니다. Command R은 이전 모델보다 더 높은 품질, 더 안정적이며, 더 긴 컨텍스트로 언어 작업을 수행하는 지시 따르기 대화형 모델입니다.
코드 생성, 검색 증강 생성(RAG), 도구 사용 및 에이전트와 같은 복잡한 워크플로우에 사용할 수 있습니다.

![](/assets/img/aiml/2024/release/202406-genai-cohere-r.png " ")

## Meta Llama 3 is now available in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 4, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/b3db861e-403c-4eec-a2c6-25fde783a01c/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/b3db861e-403c-4eec-a2c6-25fde783a01c/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 OCI Generative AI가 이제 Meta Llama 3 70B 모델을 지원합니다. 이 모델은 700억 개의 매개변수로 사전 훈련된 최첨단 대규모 언어 모델(LLM)입니다.
이 모델은 규모에 맞는 LLM의 새로운 기준을 제시하며, 향상된 성능 응답 다양성과 감소된 거짓 거부율을 제공합니다.

![](/assets/img/aiml/2024/release/202406-genai-llama3.png " ")

뿐만 아니라 `LoRA` 방법을 사용하여 자신만의 데이터셋으로 Meta Llama 3 70B 모델을 미세 조정함으로써 AI 기능을 한 단계 높일 수 있습니다. 자세한 내용은 [fine-tuning the base models](https://docs.oracle.com/iaas/Content/generative-ai/fine-tune-models.htm) 을 참조하세요.


## Cohere Command R + is now available in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 18, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/6f178aec-2ca1-4c54-a4b5-505e3c94f70f/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/6f178aec-2ca1-4c54-a4b5-505e3c94f70f/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI Generative AI가 이제 사전 훈련된 Cohere Command R+ 모델을 지원합니다. Command R+는 Command R 모델을 추가로 훈련 시켜 구축한 Command R 모델의 향상된 버전입니다. 언어에 대한 더 깊은 이해를 가지고 있으며, 더 미묘하고 문맥적으로 적절한 응답을 생성할 수 있습니다.
Command R+는 장문 콘텐츠 생성, 요약, 질문 답변, 특정 도메인이나 산업을 위한 언어 생성과 같이 언어에 대한 심도 있는 이해가 필요한 더 복잡하고 전문화된 사용 사례를 위해 설계 되었습니다.

![](/assets/img/aiml/2024/release/202406-genai-cohere-r+.png " ")

## Use your own Models with Data Science AI Quick Actions
* **Services:** Data Science
* **Release Date:** June 20, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/b3db846f-d95f-4e10-9d03-6159b36f1c82/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/b3db846f-d95f-4e10-9d03-6159b36f1c82/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
Data Science에서 제공하는 LLM 모델 대신 사용하고 싶은 모델이 있다면, 모델을 등록하여 Object Storage에서 AI Quick Actions로 가져올 수 있습니다. AI Quick Actions의 최신 버전을 얻으려면 노트북 세션을 비활성화했다가 다시 활성화해야 합니다.
![](/assets/img/aiml/2024/release/202406-aqua-byom1.png " ")
모델을 등록하는 방법은 두 가지 입니다.

- 검증된 모델 등록하기 : Data Science 서비스에서 사전에 검증한 리스트에 포함된 모델을 등록하기
  ![](/assets/img/aiml/2024/release/202406-aqua-byom2.png " ")
- 검증되지 않은 모델 등록하기 : Data Science 서비스에서 검증하지 않은 모델 등록, 지원되는 Inference Container 종류와 버전에 호환되는 모델을 등록하여 사용 할 수 있습니다. 
  ![](/assets/img/aiml/2024/release/202406-aqua-byom3.png " ")


## Data Science now Supports Large Models
* **Services:** Data Science
* **Release Date:** June 21, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/0ae9ba97-2b8a-4173-8757-44dd97e7ee72/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/0ae9ba97-2b8a-4173-8757-44dd97e7ee72/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 Data Science 의 Model Deployment, Model Catalog 서비스에서 Large Model을 지원합니다.
대규모 모델 아티팩트는 모델 카탈로그 서비스에 저장되어 모델 배포를 생성하는 데 사용될 수 있습니다. 엔드포인트 매핑 기능을 사용하면 Text Generation Interface(TGI)와 같은 추론 컨테이너가 `/predict`와 `/health` 엔드포인트에 대한 표준 API 계약을 준수하지 않더라도 통합할 수 있습니다.


## OCI Generative AI is now available in UK South (London)
* **Services:** Generative AI
* **Release Date:** June 28, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/3274c3ce-8bc4-4428-9bfc-012af240c1e5/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/3274c3ce-8bc4-4428-9bfc-012af240c1e5/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI Generative AI 서비스가 이제 영국의 UK South (London) 리전에 출시 되었습니다. OCI Generative AI 서비스가 가능한 지역에 대한 정보는 [Regions with Generative AI](https://docs.oracle.com/iaas/Content/generative-ai/overview.htm#regions){:target="_blank" rel="noopener"} 링크를 참조하세요.
