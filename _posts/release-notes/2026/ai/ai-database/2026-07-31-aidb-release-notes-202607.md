---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI AI Database 업데이트 소식"
teaser: "2026년 7월 OCI AI Database 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aidb
tags:
  - oci-release-notes-2026
  - Jul-2026
  - AI Database
  - Autonomous Database
#
# Styling
#
header: no
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## Expose Select AI Agent team as agent through A2A protocol
* **Services:** Autonomous Database Serverless
* **Release Date:** July 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-expose-select-ai.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-expose-select-ai.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Expose In-database AI Agents through Agent2Agent Protocol](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/expose-database-ai-agents-agent2agent-protocol.html#GUID-D9D20AE0-728D-46FB-B688-6C9E81B2FF3F){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database가 managed Agent2Agent(A2A) server를 통해 Select AI agent team을 A2A protocol 기반 agent로 노출할 수 있습니다. 외부 A2A-compatible client agent가 standard HTTPS interface와 protocol-based communication으로 published Select AI agent team을 discover/call할 수 있습니다.

### A2A 노출 구조

Autonomous AI Database의 managed Agent2Agent(A2A) server가 Select AI agent team을 A2A protocol 기반 agent로 노출합니다. 외부 A2A-compatible client agent는 standard HTTPS interface를 통해 published Select AI agent team을 discover하고 호출할 수 있습니다.

### 연계 흐름

```text
외부 Client Agent
  -> A2A discovery endpoint 조회
  -> published Select AI Agent Team metadata 확인
  -> HTTPS 기반 task/message 호출
  -> Autonomous AI Database 내부 agent team 실행
  -> 결과 반환
```

### 적용 시나리오

데이터베이스 내부에 있는 분석 tool, business rule, SQL 기반 조회 agent를 외부 multi-agent workflow에 연결할 수 있습니다. 예를 들어 영업 지원 agent가 ADB 내부 customer intelligence agent를 호출해 최신 고객 지표를 가져오는 구조를 만들 수 있습니다.

### 보안·거버넌스

A2A 노출은 database 내부 기능을 외부 workflow에 연결하는 것이므로 입력 검증, endpoint 인증, 호출량 제한, data masking, audit trail을 반드시 설계해야 합니다. Published skill 설명에는 agent가 할 수 있는 일과 할 수 없는 일을 명확히 적어야 합니다.
## Select AI Supervisor Agent
* **Services:** Autonomous Database Serverless
* **Release Date:** July 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-select-ai-agent.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-select-ai-agent.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Multi-Agent Pattern for AI Agents](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/multi-agent-pattern-ai-agents.html#GUID-8A52B4E3-91E4-4A51-86E6-58B97243FE1B){:target="_blank" rel="noopener"}
* **Documentation:** [Supervisor Agent Pattern](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/supervisor-agent.html#GUID-C25A0633-2B01-46C1-8BC9-F8FB8FA0A42A){:target="_blank" rel="noopener"}
* **Documentation:** [How to Use Select AI Supervisor Agent Teams](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/how-to-use-select-ai-supervisor-agent-teams.html#GUID-83A250F1-55CC-45C5-AFB5-E59A8C5EB190){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database Serverless의 Select AI가 Supervisor Agent pattern을 지원합니다. Supervisor agent는 사용자 요청과 중간 결과를 바탕으로 전문 worker agent를 runtime에 선택·조율하고, worker subtask를 순차 처리한 뒤 하나의 조정된 응답을 반환합니다.

### Multi-Agent Pattern 이해

Select AI Supervisor Agent는 supervisor가 사용자 요청과 중간 결과를 보고 전문 worker agent를 runtime에 선택·조율하는 pattern입니다. worker subtask는 순차 처리되고, 최종적으로 하나의 조정된 응답을 반환합니다. 사전에 고정된 실행 순서가 아니라 요청 맥락에 따라 worker 선택이 달라질 수 있다는 점이 핵심입니다.

### 설계 예시

```text
Supervisor: 고객 문의를 분석하고 필요한 worker를 선택
- SQL Worker: 고객 계정/주문 데이터 조회
- Policy Worker: 환불/계약 정책 확인
- Summary Worker: 고객 응답 초안 작성

Guardrail:
- SQL Worker는 read-only view만 접근
- Policy Worker는 외부 정책 문서 검색만 허용
- Supervisor는 최종 응답 전 민감정보 제거
```

### 운영상 영향

Agent orchestration은 복합 업무 자동화에 유용하지만, worker agent가 가진 tool 권한과 데이터 접근 범위를 잘못 설계하면 위험합니다. Supervisor prompt에는 worker 선택 기준, 금지 작업, 민감 데이터 처리 기준을 명시해야 합니다.

### 감사와 추적

Agent 실행 로그에서 어떤 worker가 어떤 입력으로 호출됐는지 추적할 수 있어야 합니다. 고객 데이터가 포함되는 경우 database audit과 agent run log를 함께 보관하는 설계가 필요합니다.
## Select AI Agent Framework Enhancements
* **Services:** Autonomous Database Serverless
* **Release Date:** July 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-select-ai-framework.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-select-ai-framework.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Example: Describe and Run a Select AI Agent Tool](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/examples-using-select-ai-agent.html#GUID-B39D71EE-7310-49FC-AA10-231BD72A1DCD){:target="_blank" rel="noopener"}
* **Documentation:** [Example: Discover an Agent Team and Check Team State](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/examples-using-select-ai-agent.html#GUID-F66C1789-E850-4C3E-89D9-1289A7FE5BC3){:target="_blank" rel="noopener"}
* **Documentation:** [Select AI Agent Use Cases](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/select-ai-agent-use-cases.html#GUID-A431C63F-343B-4339-AB19-F70A6E958E4C){:target="_blank" rel="noopener"}

### 업데이트 내용

Select AI Agent framework의 DBMS_CLOUD_AI_AGENT package API가 향상되었습니다. tool discovery와 호출, agent team discovery, team run state 확인, agent-direct session에서의 tool 호출, short-term/long-term memory depth 설정 등을 지원합니다.

Autonomous AI Database는 managed MCP Server와 Agent2Agent(A2A) Server를 통해 database tool과 agent team을 외부 AI application 또는 agent ecosystem에 노출할 수 있습니다.

### Framework 확장 내용

DBMS_CLOUD_AI_AGENT package API가 tool discovery와 호출, agent team discovery, team run state 확인, agent-direct session에서의 tool 호출, memory depth 설정을 지원하도록 향상되었습니다. Autonomous AI Database는 managed MCP Server와 Agent2Agent(A2A) Server를 통해 database tool과 agent team을 외부 AI application 또는 agent ecosystem에 노출할 수 있습니다.

### PL/SQL 사용 흐름 예시

아래는 공식 예제를 읽을 때 이해를 돕기 위한 개념 흐름입니다. 실제 procedure/function 이름과 parameter는 문서 예제를 기준으로 확인해야 합니다.

```sql
-- 1. 사용 가능한 tool 조회
begin
  -- DBMS_CLOUD_AI_AGENT.DESCRIBE_TOOL(...)
  null;
end;
/

-- 2. agent team 검색과 상태 확인
begin
  -- DBMS_CLOUD_AI_AGENT.GET_TEAM_STATE(...)
  null;
end;
/

-- 3. memory depth 조정 후 agent-direct session에서 tool 호출
begin
  -- DBMS_CLOUD_AI_AGENT.RUN_TOOL(...)
  null;
end;
/
```

### MCP와 A2A 용어 정리

* **MCP(Model Context Protocol):** AI application이 tool과 context를 표준 방식으로 discover/call하도록 돕는 protocol입니다.
* **A2A(Agent2Agent):** agent 간 discovery와 delegation을 위한 protocol입니다.
* **Agent team:** 여러 agent와 tool을 묶어 업무 단위로 실행하는 구성입니다.

### 보안 설계

외부 AI application이 database tool을 호출할 수 있으므로 인증, tool allowlist, 호출량 제한, 감사 로그가 필수입니다. Memory depth는 편의성과 데이터 보존 위험 사이의 균형을 고려해 use case별로 다르게 설정합니다.
