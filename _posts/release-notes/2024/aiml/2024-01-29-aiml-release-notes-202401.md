---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "1월 OCI AI/ML 업데이트 소식"
teaser: "2024년 1월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-aiml
tags:
  - oci-release-notes-2024
  - Jan-2024
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

## Generative AI is now in General Availability
* **Services:** Generative AI
* **Release Date:** Jan 24, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/e7a3be2e-67c6-4619-938b-a74f257253bf/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/e7a3be2e-67c6-4619-938b-a74f257253bf/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 OCI Generative AI 서비스가 미국 시카고 리전에 General Availability로 출시되었습니다.
Generative AI 서비스는 AI(Artificial Intelligence) 기술을 활용하여 이미지, 텍스트, 음성 등의 다양한 형태의 콘텐츠를 생성할 수 있는 서비스입니다.
Generative AI 서비스를 사용하여 다양한 형태의 콘텐츠를 생성하고, 이를 활용하여 다양한 분야에서 창의적인 활용이 가능합니다.

OCI Generative AI 서비스는 완전관리형으로 제공되며, 사용자는 AI 모델을 학습하거나 관리할 필요 없이 간단한 API 호출만으로 콘텐츠 생성이 가능합니다.

서비스에서 제공하는 주요 기능은 다음과 같습니다.

#### 주요 기능
- 사전 학습된 Base Model을 즉시 사용,테스트 해볼 수 있는 Playground 제공
- 자체 데이터를 기반으로 Base Model을 Fine-tuning하여 사용자의 도메인에 맞는 모델을 생성 가능한 Dedicated Cluster 제공
- 커스텀 모델 또는 Fine-tuning된 모델을 호스팅하기 위한 Dedicated Cluster 제공

#### 제공 모델 (생성형)
1. Cohere의 모델
   - Command XL (52B)
   - Command Light (6B)
2. Meta의 모델
   - Llama2 (70B) Chat

#### 제공 모델 (임베딩)
1. Cohere의 모델
   - Embed English v3.0
   - Embed English Light v3.0
   - Embed Multilingual v3.0
   - Embed Multilingual Light v3.0
   - Embed English Light v2.0

#### 제약사항
현제 Fine-tuning 기능은 Cohere사의 Command 모델에 대해서만 제공되며, Meta사의 Llama2 모델에 대해서는 제공되지 않습니다.

자세한 내용은 [OCI Generative AI 공식문서](https://docs.oracle.com/en-us/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}를 참조하시기 바랍니다.




## Generative AI Agents is now in Beta
* **Services:** Generative AI Agents
* **Release Date:** Jan 24, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/a4bc6a73-4c61-4eef-8c37-2296a2984da1/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/a4bc6a73-4c61-4eef-8c37-2296a2984da1/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 미국 시카고 지역에서 OCI Generative AI Agents 서비스의 베타 릴리스를 사용할 수 있게 되었습니다.
이 베타 릴리스에는 이 서비스의 첫 번째 에이전트인 Retrieval-Augmented Generation (RAG) 에이전트가 포함되어 있습니다.
RAG 에이전트는 고객들이 자연어 챗봇 인터페이스를 통해 데이터와 대화할 수 있도록 합니다. 
에이전트는 Cohere와 Meta에서 호스팅되는 대규모 언어 모델(Large Language Models, LLMs)과 Cohere Rerank + Embedding 모델을 활용합니다.
Generative AI Agents (베타)는 완전히 관리되므로 Generative AI 서비스에서 모델을 프로비저닝할 필요가 없으며 OCI Search with OpenSearch 클러스터에 저장된 데이터와 함께 최적화되어 작동합니다.

#### AI Agent 사용을 위한 사전 준비
OCI AI Agent 서비스를 사용하려면 아래와 같이 사전에 준비해야 할 리소스가 존재합니다.

1. OCI Search with OpenSearch 클러스터 : Agent에서 필요한 데이터를 색인하기 위해 필요한 데이터 저장소 (인덱스 기반으로 데이터를 저장하고 검색할 수 있는 서비스
2. OCI Cache with Redis 클러스터 : 사용자와 Agent 간의 대화 기록을 Memory에 저장하기 위한 데이터 저장소
3. Identity Domain 에 관리자 권한을 보유한 사용자 계정

사전 준비사항 관련 자세한 내용은 [OCI Generative AI Agents 공식문서](https://docs.oracle.com/en-us/iaas/Content/generative-ai-agents/getting-started.htm#get-started){:target="_blank" rel="noopener"}를 참조하시기 바랍니다.

#### AI Agent 생성 절차
1. Private Endpoint 생성 : 사전 준비 단계에서 생성한 OCI Search with OpenSearch 클러스터, OCI Cache with Redis 클러스터에 접근하기 위한 Private Endpoint 생성
2. Data Source 생성 : Agent에서 사용할 데이터를 저장하기 위한 Data Source 생성 (사전 준비단계에서 생성한 OCI Search with OpenSearch 클러스터를 연결)
3. Cache Store 생성 : Agent와 사용자 간의 대화 기록을 저장하기 위한 Cache Store 생성 (사전 준비단계에서 생성한 OCI Cache with Redis 클러스터를 연결)
4. Agent 생성 : Agent 생성을 통해 RAG 에이전트를 생성하고, 생성된 에이전트를 통해 사용자와 대화를 할 수 있습니다.

자세한 내용은 [OCI Generative AI Agents 공식문서](https://docs.oracle.com/en-us/iaas/Content/generative-ai-agents/home.htm){:target="_blank" rel="noopener"}를 참조하시기 바랍니다.