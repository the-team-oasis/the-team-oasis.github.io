---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "12월 OCI AI/ML 업데이트 소식"
teaser: "2023년 12월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-aiml
tags:
  - oci-release-notes-2023
  - Dec-2023
  - AI/ML
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

## Accelerated Data Science 2.9.1 is released

- **Services:** Data Science
- **Release Date:** Dec 6, 2023
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/687c29f0-f1fb-49e9-9607-82aefa5d32fb/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/687c29f0-f1fb-49e9-9607-82aefa5d32fb/){:target="\_blank" rel="noopener"}

### 업데이트 소개

OCI Data Science 서비스에서 제공하는 Python 라이브러리 인 ADS 2.8.8 패치에서는 아래와 같은 기능이 추가 및 개선 그리고 버그 픽스가 업데이트 되었습니다.

- LangChain 애플리케이션을 OCI 모델 배포로 배포하는 기능 추가.
- HuggingFace Evaluation을 LLM guardrail로 사용하는 기능 추가.
- 검색기로 OpenSearchVectorSearch 또는 FAISS 벡터 DB를 사용할 때 RetrievalQA 배포 지원 추가.
- `GenericModel.save()`에 재로드 매개변수를 추가하여 score.py를 재로딩하지 않는 옵션 제공.
- 고정된 단계 수 때문에 모델 배포 진행률 표시줄에 발생하는 버그 수정.
- `ads opctl build-image job-local` 명령에 발생하는 버그 수정.

### LangChain 이란?

LangChain은 대규모 언어 모델(LLMs)을 사용하여 애플리케이션을 만드는 것을 간소화하기 위해 설계된 프레임워크이며, 이 프레임워크를 사용하면 보다 간단하게 LLM을 애플리케이션에 통합할 수 있습니다. 문서 분석 및 요약, 챗봇, 코드 분석 등의 일반적인 언어 모델 사용 사례에 적용할 수 있습니다.
2022년 10월에 Harrison Chase에 의해 오픈 소스로 공개되었으며, 다양한 LLM 모델과 호환되며, 사용자 친화적인 인터페이스를 제공하여 데이터 과학자, 개발자 등이 쉽게 LLM 애플리케이션을 개발할 수 있도록 도와줍니다.

#### LangChain 프레임워크 구성도

![](/assets/img/aiml/2023/releasenote/langchain.svg " ")

#### LangChain을 활용하여 RAG LLM Application 구성 예시

![](/assets/img/aiml/2023/releasenote/langchain-2.png " ")
