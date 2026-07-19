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
*  TOC
{:toc}
</div>

## Oracle Data Science Agent
* **Services:** Autonomous Database Serverless
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-data-science-agent.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-data-science-agent.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Science Agent는 Oracle Autonomous AI Database Serverless 26ai에서 지원됩니다. Oracle Machine Learning 안의 guided chat experience를 통해 data profiling, feature preparation, model training, result evaluation, inference SQL generation을 수행할 수 있습니다.

핵심 영향은 데이터가 있는 database 안에서 machine learning workflow를 진행할 수 있다는 점입니다. 데이터 이동을 줄이고 governance를 단순화하면서, 분석 담당자가 자연어 기반 안내를 통해 feature 준비부터 inference SQL 생성까지 이어갈 수 있습니다.

활용 시나리오는 ADB에 저장된 업무 데이터를 기반으로 빠르게 모델 후보를 만들고, 평가 결과를 확인한 뒤 SQL 기반 inference 흐름으로 운영화하는 것입니다. 적용 전에는 Autonomous AI Database Serverless 26ai 사용 여부, OML 권한, 데이터 접근 정책을 확인하고, 검증 시에는 생성된 feature/model/inference SQL이 데이터 권한과 성능 기준을 만족하는지 확인해야 합니다.
