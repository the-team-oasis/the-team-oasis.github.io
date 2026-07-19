---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "6월 OCI AI Database 업데이트 소식"
teaser: "2026년 6월 OCI AI Database 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
 - release-notes-2026-aidb

tags:
 - oci-release-notes-2026
 - Jun-2026
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
* TOC
{:toc}
</div>

## Oracle Data Science Agent
* **Services:** Autonomous Database Serverless
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-data-science-agent.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-data-science-agent.htm){:target="_blank" rel="noopener"}
* **Documentation:** [About Data Science Agent](https://docs.oracle.com/pls/topic/lookup?ctx=en/database/oracle/machine-learning/data-science-agent/dsaug&id=DSAUG-GUID-B12538C2-773F-4AF4-8ED2-0DC139E18A82){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Science Agent는 Oracle Autonomous AI Database Serverless 26ai에서 지원됩니다. Oracle Machine Learning 안의 guided chat experience를 통해 data profiling, feature preparation, model training, result evaluation, inference SQL generation을 수행할 수 있습니다.

핵심 영향은 데이터가 있는 database 안에서 machine learning workflow를 진행할 수 있다는 점입니다. 데이터 이동을 줄이고 governance를 단순화하면서, 분석 담당자가 자연어 기반 안내를 통해 feature 준비부터 inference SQL 생성까지 이어갈 수 있습니다.

### 주요 변경 포인트

* 서비스의 사용 방식 또는 운영 옵션이 확장되었습니다.
* 기존 운영 절차와 자동화 스크립트에 영향을 줄 수 있는 설정 항목을 먼저 확인하는 것이 좋습니다.
* Console, API, CLI 중 실제 운영에서 사용하는 경로 기준으로 적용 가능 여부를 검증해야 합니다.

### 적용 및 검증 포인트

운영 반영 전에는 테스트 환경에서 생성·수정·조회·삭제 흐름을 확인하고, 관련 IAM policy, network path, logging/monitoring 지표를 함께 점검하는 것이 좋습니다.

### 사전 조건

Data Science Agent는 Autonomous AI Database subscription에 포함된 Oracle Machine Learning UI 안의 conversational chatbot입니다. 사용자가 LLM을 제공해야 하며, 이 LLM은 third-party AI provider, OCI Generative AI Service, 또는 privately hosted model 중 하나일 수 있습니다.

이 기능은 human-in-the-loop 방식으로 동작합니다. Object association은 사용자의 승인 또는 연결이 필요하고, conversation scope는 active conversation context로 제한됩니다. 또한 사용자는 AI profile, 즉 agent를 구동할 LLM profile을 선택해야 하며, conversation 중간에 profile을 전환할 수도 있습니다. Agent가 승인되지 않은 table/view를 사용해야 하는 경우에는 conversation을 멈추고 object association 승인을 요청하므로, 운영 적용 전에는 데이터 접근 권한과 object 승인 흐름을 반드시 확인해야 합니다.
