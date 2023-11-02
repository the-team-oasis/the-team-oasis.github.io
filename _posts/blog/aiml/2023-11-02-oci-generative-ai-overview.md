---
layout: page-fullwidth
#
# Content
#
subheadline: "Generative AI"
title: "OCI Generative AI 서비스 살펴보기"
teaser: ""
author: yhcho
date: 2023-11-02 00:00:00
breadcrumb: true
categories:
  - aiml
tags:
  - [oci, data science, generative ai, gen ai, 생성 ai]
#published: false

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

# -------------- 내용 필독 -------------------
# 작성할 내용은 아래부터 작성
# 작성 방법
# 각 챕터별 제목은 "###"로 시작한다.
# 하위 제목은 "####"로 시작한다.
# 이미지는 images 폴더안에 Category(getting-started, infrastructure, platform, database, aiml)에 넣고 사용 시 "../../images/카테고리명/이미지" 형태로 참조한다.
# Bold는 **글자**
# Bold + Italic은 ***글자***
# ------------------------------------------
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## OCI Generative AI 서비스 살펴보기
Oracle Cloud Infrastructure Generative AI (베타)는 텍스트 생성을 위한 광범위한 사용 사례를 포괄하는 맞춤형 최첨단 LLM(대형 언어 모델) 세트를 제공하는 완전 관리형 서비스입니다. 
플레이그라운드 를 사용하여 즉시 사용 가능한 사전 훈련된 모델을 시험해 보거나 전용 AI 클러스터의 자체 데이터를 기반으로 미세 조정된 사용자 지정 모델을 생성하고 호스팅하세요.

### OCI Generative AI의 기본 모델
OCI Generative AI 서비스 에는 다음과 같은 기본 모델이 포함되어 있습니다.

#### 생성(Generation) 모델
+ `cohere.command`
  + A highly performant generation model. Use this model when you're optimizing for accuracy such as text extraction and sentiment analysis. Use this high performant model to draft your marketing copies, emails, blog posts, product descriptions, and then review and use them.
+ `cohere.command-light`
  + A quick and light generation model. Use this model when speed and cost is important. Because this model is light, for best results give the model clear instructions. The more specific your prompt, the better this model performs. For example, instead of the prompt, "What is the tone of this product review?", write, "What is the tone of this product review? Answer with either the word positive or negative.".
+ 예시 (Examples)
  + Copy generation : Draft marketing copies, emails, blog posts, product descriptions, documents, and so on.
  + Chat : Create chatbots that can brainstorm, solve problems, and answer questions or integrate with search systems to create a grounded information retrieval.
  + Stylistic Conversion : Rewrite content in a different style or language.

#### 요약(Summarization) 모델
The `cohere.command` pretrained model is available in the playground for text summarization. This model is the same as one of the pretrained text generation models, but it has parameters that you can specify for text summarization. Use the summarization model for any text that you would like to see a summary of. Input text and get important information out of that text.

The following categories are ideal text sources for summarization:
+ News articles
+ Blogs
+ Chat transcripts
+ Scientific articles
+ Meeting notes
+ Product reviews

#### Embedding 모델
A numeric representation of a piece of text. This text can be a phrase, a sentence, or one or more paragraphs. The Generative AI embedding model transforms each phrase, sentence, or paragraph that you input, into an array with 1024 numbers. You can use these embeddings for finding similarity in your input text such as finding phrases that are similar in context or category. Embeddings are mostly used for semantic searches where the search function focuses on the meaning of the text that it's searching through rather than finding results based on keywords. The following pretrained model is available for creating text embeddings:
+ `embed-english-light-v2.0`

To visualize the outputs with embeddings, output vectors are projected into two dimensions and plotted as points in the Console. Points that are close together correspond to phrases that the model considers similar. Click **Export output** to get an array of 1024 vectors for each embedding saved in a json file.

The following categories are ideal uses cases for text embeddings.
+ Semantic search : Search over call transcripts, internal knowledge sources, and so on.
+ Text classification : Use the text embeddings for classifying intent in customer chat logs and support tickets.
+ Text clustering : Identifying salient topics in customer reviews or new data.
+ Recommendation systems : For example, represent podcast descriptions as a numerical feature to use in a recommendation model.

### OCI 콘솔 살펴보기

![](/assets/img/aiml/2023/releasenote/genai-1.png " ")

#### 사전 학습된 모델 사용하기
![](/assets/img/aiml/2023/releasenote/genai-playground.png " ")

+ 사전 학습된 모델을 사용해보려면 Playground 기능을 통해서 사용할 수 있습니다. Model을 선택할 수 있는 드롭다운 리스트를 클릭하여 사전학습된 모델 중 실습하고자 하는 모델을 선택할 수 있습니다.
  ![](/assets/img/aiml/2023/releasenote/genai-0.png " ")
+ 생성(Generation) 모델을 활용하여 이메일 초안을 작성하는 예시 입니다.
  ![](/assets/img/aiml/2023/releasenote/genai-2.png " ")
+ "View Code" 버튼을 클릭하면 Playground에서 선택한 모델과 파라미터를 기반으로 소스코드 예시를 생성해줍니다.
  ![](/assets/img/aiml/2023/releasenote/genai-3.png " ")
+ 요약(Summarization) 모델을 활용하여 블로그 포스트의 내용을 요약하는 예시 입니다.
  ![](/assets/img/aiml/2023/releasenote/genai-4.png " ")
+ Embedding 모델을 활용하여 제공된 질문들간의 연관성에 대해 확인하는 예시 입니다.
  ![](/assets/img/aiml/2023/releasenote/genai-5.png " ")
  + 파일 업로드 기능을 통해서 문장 데이터를 업로드 합니다.
    ![](/assets/img/aiml/2023/releasenote/genai-6.png " ")
  + 업로드된 질문을 살펴보면 모두 특정 나라의 수도를 물어보는 질문이지만, 한가지 질문은 미국에서 가장 작은 주가 어디인지에 대한 질문입니다.
    ![](/assets/img/aiml/2023/releasenote/genai-7.png " ")
  + "Run" 버튼을 클릭하여 실행해보면 2D 그래프로 질문들간의 연관성이 보여지며, 한가지 질문만 유독 떨어져 있는것을 확인할 수 있습니다.
    ![](/assets/img/aiml/2023/releasenote/genai-8.png " ")
### 사전 학습된 모델 미세 조정해보기
사전 학습된 모델을 미세 조정하기 위해서는 먼저 Dedicated AI Cluster가 필요합니다.

+ Deticated AI Clusters 화면에서 Fine tuning을 위한 클러스터를 생성합니다.
  ![](/assets/img/aiml/2023/releasenote/genai-9.png " ")
+ Custom models 화면에서 기본 제공되는 모델을 활용하여 미세 조정할 모델을 생성합니다.
  ![](/assets/img/aiml/2023/releasenote/genai-10.png " ")
  + 생성할 모델 이름과 버전을 입력합니다.
    ![](/assets/img/aiml/2023/releasenote/genai-11.png " ")
  + 기본이될 모델을 선택하고 튜닝에 사용할 클러스터를 지정합니다.
    ![](/assets/img/aiml/2023/releasenote/genai-12.png " ")
  + 데이터가 저장되어 있는 버킷을 선택하고 훈련에 사용될 데이터 파일을 선택하여 모델을 생성합니다.
    ![](/assets/img/aiml/2023/releasenote/genai-13.png " ")
+ 생성한 모델을 배포하기 위한 End Point를 생성합니다.
  ![](/assets/img/aiml/2023/releasenote/genai-14.png " ")
+ 배포한 모델을 Playground에서 확인해 봅니다.
  ![](/assets/img/aiml/2023/releasenote/genai-15.png " ")
  ![](/assets/img/aiml/2023/releasenote/genai-16.png " ")



