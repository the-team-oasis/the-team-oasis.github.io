---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Generative AI Agents"
title: "OCI GenAI Agent: RAG를 위한 Object Storage Bucket 구성"
teaser: "GenAI Agent에 RAG(knowledge base)를 연결하기 위해 Object Storage Bucket과 Knowledge Base, Agent를 단계별로 구성합니다."
author: yhcho
breadcrumb: true
categories:
  - aiml
tags:
  - [oci, genai, agents, rag, object storage]
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
# 이미지는 assets 폴더의 경로를 사용하며 "/assets/img/aiml/2025/aiml/genai-agent-rag-bucket" 하위 파일을 참조한다.
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

## 개요

이 문서는 OCI Generative AI Agents 서비스에서 RAG(Retrieval-Augmented Generation) 기반 검색을 수행하기 위해 필요한 Object Storage Bucket, Knowledge Base, Agent를 순서대로 생성·연결하는 방법을 설명합니다.

### 사전 준비

- **Region**: 현재 GenAI Agents는 Chicago, Ashburn, Phoenix, Frankfurt, London, Osaka 리전에서 제공됩니다.
- **권한**: Policies/Dynamic Group을 생성할 수 있는 권한 또는 관리자 권한.

### 용어

- **Knowledge Base(KB)**: RAG 도구가 참조할 문서 인덱스. 데이터 소스는 Object Storage Bucket.
- **Agent**: RAG Tool을 포함하여 질의에 응답하는 실행 엔진.
- **Routing Instructions**: Agent가 여러 도구 중 어떤 도구를 언제 사용할지 결정하도록 안내하는 최상위 지침. 질문 유형에 따라 적절한 도구로 라우팅하는 규칙을 정의.
- **Agent Tool's Description**: Agent Tool이 보유한 지식의 범위와 종류를 설명하는 필드. Agent가 "이 도구를 호출해야 하는가?"를 판단할 때 참조하는 메타데이터.
- **Agent Tool's Custom Instructions**: Agent Tool 호출 후 Agent의 응답 방식을 제어하는 세부 지침. 답변 언어, 형식, 어조, 예외 처리 방법 등을 정의.

### 참고 흐름

1. Object Storage Bucket 생성 → 2. 문서 업로드 → 3. Knowledge Base 생성(데이터 소스=Bucket) → 4. Agent 생성 및 RAG Tool로 KB 연결 → 5. Endpoint/Playground에서 테스트

---

### Task 1: Region 구독 확인

GenAI Agents는 ASIA 지역에서는 Osaka 리전에서 사용 가능합니다. 콘솔 우상단 Regions 메뉴에서 구독 여부를 확인합니다.

![regions list](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/policies/regions-list.png)

필요 시 Manage Regions 화면에서 원하는 리전(예: Osaka, Chicago 등)을 구독합니다.

![infrastructure regions](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/policies/infrastructure-regions.png)

### Task 2: Access Policies 생성

서비스(Agents)와 Object Storage를 사용할 수 있도록 Dynamic Group과 Policy를 만듭니다.

#### Dynamic Group 생성 하기

Identity & Security 메뉴에서 Domain을 클릭 후 "Default" 도메인을 선택하면 Dynamic Group 탭을 확인할 수 있습니다.
Dynamic Group 탭으로 이동 후 "Create Dynamic Group" 버튼을 클릭합니다.

![dynamic group](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/policies/dynamic-group.png)

Dynamic Group의 Matching Rule 예시:

```text
all {resource.type='genaiagent'}
```

![dynamic group](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/policies/dynamic-group-create.png)

#### 동적 그룹에 대한 Policy 작성하기

루트 컴파트먼트에서 정책을 수동 편집 모드로 아래와 같이 구성합니다.

**Policy 자동 생성기를 사용하여 필요한 Policy를 쉽게 생성할 수 있습니다:**

{% capture rag_bucket_policy %}
{% raw %}{
"title": "GenAI Agent RAG Bucket Policy 생성기",
"description": "그룹과 Dynamic Group 정보를 입력하면 필요한 Policy를 자동으로 생성합니다.",
"fields": [
{
"id": "dynamicGroup",
"label": "Dynamic Group 이름",
"placeholder": "예: genai-agent-dg"
},
{
"id": "objectComp",
"label": "Object Storage의 구획(Compartment)",
"placeholder": "예: object-compartment"
},
{
"id": "genaiComp",
"label": "OCI GenAI 서비스를 사용할 구획(Compartment)",
"placeholder": "예: genai-compartment"
}
],
"policies": [
"전체 테넌시에 정책을 적용하는 경우 (Root 구획에 작성)",
"Allow dynamic-group {{dynamicGroup}} to manage object-family in tenancy",
"Allow dynamic-group {{dynamicGroup}} to manage genai-agent-family in tenancy",
"특정 구획에 정책을 적용하는 경우 (해당 구획에 작성)",
"Allow dynamic-group {{dynamicGroup}} to manage object-family in compartment {{objectComp}}",
"Allow dynamic-group {{dynamicGroup}} to manage genai-agent-family in compartment {{genaiComp}}"
]
}{% endraw %}
{% endcapture %}
{% include oci-policy-generator.html config=rag_bucket_policy id="rag-bucket" %}

**또는 수동으로 작성할 경우 다음 Policy 템플릿을 참고하세요:**

```text
Allow dynamic-group <dynamic-group-name> to manage object-family in tenancy
Allow dynamic-group <dynamic-group-name> to manage genai-agent-family in tenancy

Allow dynamic-group <dynamic-group-name> to manage object-family in compartment <object-compartment>
Allow dynamic-group <dynamic-group-name> to manage genai-agent-family in tenancy <genai-agent-compartment>
```

![create policy](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/policies/create-new-policy-manual.png)
![create policy](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/policies/create-new-policy.png)

### Task 3: 서비스 접근 확인

메뉴에서 Analytics & AI → Generative AI Agents로 이동하여 서비스 접근을 확인합니다.

![agents service navigation](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/policies/agents-service-navigation.png)

### Task 4: Object Storage Bucket 생성

RAG 도구에서 참조할 문서를 저장할 Bucket을 생성합니다. 가시성은 Private로 유지합니다.

![object storage navigation](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/os_nav.png)
![bucket create](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/os_bucket_create-1.png)
![bucket create](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/os_bucket_create-2.png)

### Task 5: 문서 업로드

생성한 Bucket으로 이동하여 Objects → Upload에서 문서를 업로드합니다.

**지원 포맷**: PDF, TXT, HTML, JSON, MD

**샘플 PDF**: 테스트용으로 [SPRI AI Brief](https://spri.kr/posts/view/23915?code=AI-Brief&s_year=&data_page=1)를 다운로드하여 사용할 수 있습니다.

![select files](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/os_file_select.png)
![upload files](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/os_upload-1.png)
![upload files](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/os_upload-2.png)
![upload files](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/os_upload-3.png)
![upload files](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/os_upload-4.png)

### Task 6: Knowledge Base 생성

메뉴에서 Agents → Knowledge Bases → Create knowledge base로 이동합니다.
데이터 소스로 Object Storage를 선택하고, 앞서 만든 Bucket 전체를 선택합니다.

![kb nav](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/kb_nav.png)
![kb wizard](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/kb_wizard.png)
![kb data source](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/kb_data_source.png)
![kb active](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/kb/kb_active.png)

### Task 7: GenAI Agent 생성 및 RAG Tool 연결

메뉴에서 Agents → Create agent로 이동하여 Agent를 생성하고, RAG Tool을 추가합니다.
생성 후 Endpoints 화면에서 OCID를 확인하고, Chat Playground에서 질의 테스트를 수행합니다.

#### Agent 생성 메뉴로 이동

![agent nav](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_nav.png)

![create agent](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_create-1.png)

#### OCI GenAI Agent를 생성하기 위해 기본 정보 입력

아래 Routing Instructions는 Agent가 등록된 도구를 언제 사용할지 결정하도록 안내하는 최상위 지침입니다.
본 실습에서는 RAG Tool만 등록하기 때문에 아래와 같이 작성합니다.

> 아래는 본 실습에서 사용할 GenAI Agent의 Routing Instructions 입니다.

```text
You are a helpful assistant specializing in AI-related policies and news. **Always respond to users in Korean (한글).**

When a user asks a question:

1. First, always use the RAG tool to search for relevant information in your knowledge base, which contains AI-related policies, news, and publications.
2. If the RAG tool returns relevant documents or information, use that information to answer the user's question comprehensively in Korean.
3. If the RAG tool does not return any relevant information, respond in Korean with: "관련된 자료를 찾지 못했습니다." (I could not find relevant information regarding your question.)
4. Do not attempt to answer questions about AI policies or news using your general knowledge if the RAG tool did not find relevant information. Always rely on the RAG tool for AI-related policy and news queries.
5. For general greetings or non-AI-related questions, you may respond naturally in Korean without using tools.

Remember: All responses must be in Korean regardless of the language used in the user's question.
```

![create agent](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_create-2.png)

#### OCI GenAI Agent에 도구 추가 (RAG 도구)

RAG Tool 생성 시 두 가지 주요 설정 항목이 있습니다. Description과 Custom Instructions 차이를 간략하게 알아보겠습니다.

##### Description (도구 설명)

- Agent가 이 도구를 **언제 사용할지** 판단하는 기준
- 예: "고객 지원 문서를 검색합니다" → Agent는 고객 지원 관련 질문에만 이 도구 사용
- 여러 도구가 있을 때 적절한 도구를 선택하도록 돕는 역할

> 아래는 본 실습에서 사용할 RAG Tool의 Description 입니다.

```text
This tool provides access to a comprehensive knowledge base of AI-related policies, news, and official publications. The knowledge base includes government AI regulations, industry guidelines, policy announcements, recent AI developments, research reports, and periodical publications focusing on artificial intelligence trends and governance. Use this tool when users inquire about AI policies, regulations, news, industry updates, or any AI-related official documentation.
```

##### Custom Instructions (사용자 지정 지침)

- 도구가 선택된 **후** 검색 동작을 제어하는 세부 규칙
- 예: "최신 3개 문서만 참조", "기술 문서 우선 검색"
- 검색 결과의 품질과 범위를 조정

간단히 말하면, **Description**은 "이 도구를 쓸까?"를 결정하고, **Custom Instructions**는 "어떻게 쓸까?"를 결정합니다. RAG Tool 하나만 사용하는 경우 Description은 간단히 작성하고, Custom Instructions로 검색 품질을 세밀하게 조정하는 것이 효과적입니다.

> 아래는 본 실습에서 사용할 RAG Tool의 Custom Instructions 입니다.

```text
When using this RAG tool to respond to users:

1. Always answer in Korean (한글), regardless of the language used in the user's question.
2. If relevant information is found, provide a comprehensive answer based on the retrieved documents. Include specific details, dates, and sources when available.
3. If no relevant information is found in the knowledge base, respond with: "관련된 자료를 찾지 못했습니다." Do not attempt to answer using general knowledge.
4. When citing information, maintain a professional and informative tone appropriate for discussing policies and official news.
5. If the retrieved information is partially relevant, clearly indicate which aspects of the question you can answer and which aspects lack information in the knowledge base.
```

![create agent](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_create-3.png)

앞 단계에서 생성한 Knowledge Base를 선택하여 "Add Tool" 버튼을 클릭합니다.

![create agent](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_create-4.png)

#### OCI GenAI Agent Endpoint 설정

이 단계에서는 Agent Endpoint에 설정할 수 있는 Guardrails 옵션을 설정합니다.
본 실습에서는 기본값인 Disable로 지정하여 진행하겠습니다.

![create agent](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_create-5.png)
![create agent](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_create-6.png)
![create agent](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_create-7.png)

#### Llama 3 모델 사용약관 동의

OCI GenAI Agent에서는 내부적으로 Meta의 Llama 모델을 사용하고 있기 때문에 사용약관 동의 후 이용할 수 있습니다.
내용을 읽은 후 동의 체크하여 Submit 합니다.

![create agent](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_create-8.png)

#### 생성 결과 확인

![agent detail](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_result.png)
![agent active endpoint](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_active_endpoint.png)

#### RAG Agent 테스트하기

생성된 Agent를 테스트하기 위해 Chat 메뉴로 이동합니다.

먼저 테스트할 정보에 대해서 확인해보겠습니다.
테스트는 업로드한 PDF의 내용 중 구글의 이미지 모델인 "나노 바나나"에 대한 내용입니다.

![nanobanana](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_nano_banana.png)

나노 바나나에 대해서 질문한 결과입니다.

![agent launch chat](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_launch_chat-1.png)

그냥 바나나에 대해 질문한 결과입니다.

![agent launch chat](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/agent/agent_launch_chat-2.png)

이처럼 업로드한 자료에 없는 내용은 찾을 수 없다고 하면서, 추가로 자료에 있는 비슷한 내용에 대해서 답변해주는 것을 보실 수 있습니다.

---

## 마무리

본 실습에서는 OCI GenAI Agent를 활용하여 RAG 기반 질의응답 시스템을 구축하는 전체 과정을 진행했습니다. Object Storage Bucket에 문서를 업로드하고, Knowledge Base를 생성한 후, Agent에 RAG Tool을 연결하여 실제로 동작하는 AI 어시스턴트를 만들어보았습니다.

주요 학습 내용:

- Object Storage와 Knowledge Base를 활용한 문서 관리
- Routing Instructions와 Custom Instructions의 역할과 차이점
- RAG Tool의 Description과 Custom Instructions 설정 방법
- Agent Endpoint 생성 및 테스트

이 가이드가 OCI GenAI Agents를 활용한 프로젝트에 도움이 되기를 바랍니다.

## 참고

- [Region 구독](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingregions.htm#ariaid-title7)
- [Dynamic Groups](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingdynamicgroups.htm)
