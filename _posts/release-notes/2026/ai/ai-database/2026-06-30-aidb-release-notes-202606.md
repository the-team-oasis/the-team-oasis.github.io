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

# AI Database

## Oracle Data Science Agent

- **Services:** Autonomous Database Serverless
- **Release Date:** June 30, 2026
- **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-data-science-agent.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-data-science-agent.htm){:target="_blank" rel="noopener"}
- **Documentation:** [About Data Science Agent](https://docs.oracle.com/pls/topic/lookup?ctx=en/database/oracle/machine-learning/data-science-agent/dsaug&id=DSAUG-GUID-B12538C2-773F-4AF4-8ED2-0DC139E18A82){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Autonomous AI Database Serverless 26ai에서 **Oracle Data Science Agent**를 사용할 수 있게 되었습니다. Oracle Machine Learning의 guided chat experience를 통해 data profiling, feature preparation, model training, result evaluation, inference SQL generation을 수행할 수 있습니다.

핵심 영향은 데이터가 있는 database 안에서 machine learning workflow를 진행할 수 있다는 점입니다. 데이터 이동을 줄이고 governance를 단순화하면서, 분석 담당자가 자연어 기반 안내를 통해 feature 준비부터 inference SQL 생성까지 이어갈 수 있습니다.

### 사전 조건

Data Science Agent는 Autonomous AI Database subscription에 포함된 Oracle Machine Learning UI 안의 conversational chatbot입니다. 사용자가 LLM을 제공해야 하며, 이 LLM은 third-party AI provider, OCI Generative AI Service, 또는 privately hosted model 중 하나일 수 있습니다.

이 기능은 human-in-the-loop 방식으로 동작합니다. Object association은 사용자의 승인 또는 연결이 필요하고, conversation scope는 active conversation context로 제한됩니다. 또한 사용자는 agent를 구동할 LLM의 AI profile을 선택해야 하며, conversation 중간에 profile을 전환할 수도 있습니다.

Agent가 승인되지 않은 table이나 view를 사용해야 하는 경우에는 conversation을 멈추고 object association 승인을 요청합니다. 따라서 운영 적용 전에는 대상 데이터의 접근 권한과 object 승인 흐름을 확인해야 합니다.
