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


## Select AI Supervisor Agent
* **Services:** Autonomous Database Serverless
* **Release Date:** July 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-select-ai-agent.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-select-ai-agent.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database Serverless의 Select AI에서 Supervisor Agent 패턴을 지원합니다. Supervisor Agent가 요청과 중간 결과를 기반으로 전문 worker agent를 선택하고 조율해 복합 작업을 처리할 수 있습니다.

### 운영 시 참고 사항

Agent 기반 흐름은 권한, tool 호출 범위, 실행 로그 추적이 중요합니다. 데이터베이스 내부 데이터 접근 범위와 외부 연계 도구를 최소 권한으로 제한해야 합니다.

## Select AI Agent Framework Enhancements
* **Services:** Autonomous Database Serverless
* **Release Date:** July 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-select-ai-framework.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-select-ai-framework.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Select AI Agent framework의 DBMS_CLOUD_AI_AGENT package API가 향상되었습니다. tool discovery, agent team discovery, team run state 확인, agent-direct session에서 tool 호출, memory depth 구성 등을 지원합니다.

### 운영 시 참고 사항

Agent framework 확장은 애플리케이션 통합 지점을 늘립니다. MCP Server와 A2A Server 연계 시 인증, 감사, 호출 제한, 민감 데이터 노출 여부를 함께 검토해야 합니다.

## Expose Select AI Agent team as agent through A2A protocol
* **Services:** Autonomous Database Serverless
* **Release Date:** July 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-expose-select-ai.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-expose-select-ai.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Select AI Agent team을 A2A protocol을 통해 agent로 노출할 수 있습니다. 외부 agent 생태계와 Autonomous Database 내부 Select AI Agent team을 연결하는 통합 시나리오가 가능해집니다.

### 운영 시 참고 사항

A2A 연계는 데이터베이스 내부 기능이 외부 agent 호출 흐름에 포함될 수 있음을 의미합니다. 노출 범위, 인증, 입력 검증, 감사 로그를 엄격히 설계해야 합니다.
