---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "7월 OCI AI/ML 업데이트 소식"
teaser: "2024년 7월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-aiml
tags:
  - oci-release-notes-2024
  - July-2024
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

## Fine-tune the Cohere Command R model in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** July 17, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/545be91d-23e5-47ce-8979-72006d0ec410/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/545be91d-23e5-47ce-8979-72006d0ec410/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI 생성 AI는 이제 사전 학습된 Cohere Command R 모델의 파인튜닝을 지원합니다. Command R은 코드 생성, 검색 기반 생성(RAG), 도구 사용, 에이전트와 같은 복잡한 워크플로를 처리하는 지시를 따르는 대화형 모델입니다.
T-Few 방법을 사용하여 사용자 고유의 데이터셋으로 Command R 모델을 파인튜닝하여 AI 기능을 향상시킬 수 있습니다. 파인튜닝에 대한 자세한 내용은 [fine-tuning the base models](https://docs.oracle.com/iaas/Content/generative-ai/fine-tune-models.htm)을 참조하세요.

![](/assets/img/aiml/2024/release/202407-genai-finetune-r.png " ")