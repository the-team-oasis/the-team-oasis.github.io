---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "4월 OCI AI/ML 업데이트 소식"
teaser: "2026년 4월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aiml
tags:
  - oci-release-notes-2026
  - Apr-2026
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

## Enterprise AI Agents are in General Availability in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** March 31, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/enterprise-ai.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/enterprise-ai.htm){:target="_blank" rel="noopener"}
- **Documentation:** [Enterprise AI Agents in OCI Generative AI](https://docs.oracle.com/en-us/iaas/Content/generative-ai/agents.htm){:target="_blank" rel="noopener"}, [OCI Responses API](https://docs.oracle.com/en-us/iaas/Content/generative-ai/responses-api.htm){:target="_blank" rel="noopener"}, [Building Agents in OCI Generative AI](https://docs.oracle.com/en-us/iaas/Content/generative-ai/building-agents.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI의 **Enterprise AI Agents**가 General Availability로 제공됩니다. 이 기능은 production-grade agentic application을 빠르게 개발하고 배포할 수 있도록 OCI Responses API, Tools, Memory, Projects, Applications, Vector Stores, NL2SQL 같은 agent 구성 요소를 통합해서 제공합니다.

핵심 구성 요소는 다음과 같습니다.

- **OCI Responses API:** OpenAI Responses API와 호환되는 통합 API입니다. 모델 호출, reasoning, tool use, memory, orchestration을 하나의 API에서 처리할 수 있습니다.
- **Tools:** File Search, Code Interpreter, Function Calling, MCP Calling 같은 도구를 OCI Responses API와 함께 사용할 수 있습니다.
- **Memory:** Conversations API, long-term memory, short-term memory context compaction을 통해 대화 상태와 장기 맥락을 관리할 수 있습니다.
- **Projects:** 대화, 파일, 컨테이너, 메모리를 workload 단위로 격리하고 retention 설정을 관리하는 리소스 모델입니다.
- **Applications:** OSS framework 또는 MCP Server 기반 agentic application을 OCI에서 hosting할 수 있도록 지원합니다.
- **Vector Stores와 NL2SQL:** 파일 ingestion, semantic search, metadata filtering, natural language to SQL workflow를 위한 구성 요소입니다.

### 활용 포인트

기존에는 agent 애플리케이션을 만들 때 모델 호출, 도구 실행, 파일 검색, 메모리, 컨테이너 실행 환경을 애플리케이션 코드에서 별도로 묶어야 했습니다. Enterprise AI Agents GA 이후에는 OCI Generative AI가 제공하는 agent building block을 조합해 RAG, NL2SQL, MCP 기반 업무 자동화, 코드 실행 기반 분석 workflow를 더 표준화된 방식으로 구현할 수 있습니다.

OCI Responses API는 OpenAI SDK와 호환되므로 기존 OpenAI Responses API 스타일의 클라이언트 코드를 OCI endpoint와 OCI 인증 방식으로 전환하기 쉽습니다. 다만 OCI에서는 Project OCID, OCI Generative AI API Key 또는 IAM 기반 인증, 지원 리전 및 모델 가용성을 함께 확인해야 합니다.

# Data Science

## New Oracle Cloud Console experience for Data Science

- **Services:** Data Science
- **Release Date:** April 21, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/console-experience.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/console-experience.htm){:target="_blank" rel="noopener"}
- **Documentation:** [New Console Experience](https://docs.oracle.com/en-us/iaas/Content/GSG/Concepts/new-console.htm){:target="_blank" rel="noopener"}, [Data Science](https://docs.oracle.com/en-us/iaas/data-science/using/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Science 서비스에 새로운 Oracle Cloud Console Experience가 적용되었습니다. 이번 업데이트는 OCI Console 전반의 사용성과 일관성을 높이기 위한 개편으로, Resource List Page, Resource Details Page, Resource Creation Workflow가 더 직관적인 형태로 변경됩니다.

![](https://docs.oracle.com/en-us/iaas/Content/GSG/images/redwood-nav.png)

### 주요 변경 포인트

새 Console Experience의 공통 변화는 다음과 같습니다.

- Service 리소스 간 이동을 위한 좌측 Navigation Pane 제공
- Resource List Page의 Search, Filter, Sort, Column 관리 기능 개선
- Resource Details Page에서 Details, Metrics, Work Requests, Tags 등 관련 정보를 Tab 기반으로 정리
- Resource 생성 흐름을 단계별 또는 Section 기반 화면으로 재구성

Data Science 사용자 입장에서는 Project, Notebook Session, Model, Model Deployment, Job, Pipeline, ML Application 같은 리소스를 더 일관된 UI에서 탐색하고 관리할 수 있습니다. 공식 릴리즈 노트에서는 새 Console Experience가 문서 업데이트보다 먼저 적용될 수 있다고 안내하므로, 일부 문서 스크린샷과 실제 Console 화면이 다를 수 있습니다.
