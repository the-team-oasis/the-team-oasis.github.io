---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "8월 OCI AI Database 업데이트 소식"
teaser: "2026년 8월 OCI AI Database 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aidb
tags:
  - oci-release-notes-2026
  - Aug-2026
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

## GET_DEFINITION Functions for DBMS_CLOUD Packages
* **Services:** Autonomous Database Serverless
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-get-definition-function.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-get-definition-function.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-package.html#GUID-2F4B6A91-6D3E-4B85-A0F2-8C5D1E7B9A63](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-package.html#GUID-2F4B6A91-6D3E-4B85-A0F2-8C5D1E7B9A63){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-agent-package.html#GUID-C1E7A94D-5B26-4F80-9D38-6A2E7C0B1F45](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-agent-package.html#GUID-C1E7A94D-5B26-4F80-9D38-6A2E7C0B1F45){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database Serverless에서 `DBMS_CLOUD_AI`, `DBMS_CLOUD_AI_AGENT`, `DBMS_CLOUD_PIPELINE`, `DBMS_CLOUD`로 만든 지원 object의 실행 가능한 PL/SQL 정의를 `GET_DEFINITION` 함수로 반환할 수 있습니다. 정의를 조회·비교·내보내고 다른 환경에서 object를 재생성하는 절차에 활용할 수 있습니다.

### 설정 및 사용 범위

`DBMS_CLOUD_AI.GET_DEFINITION`은 현재 호출자가 소유한 Select AI profile 또는 vector index를 대상으로 하며 결과를 CLOB 형태의 canonical PL/SQL block으로 반환합니다. `DBMS_CLOUD_AI_AGENT.GET_DEFINITION`은 agent·task·tool·team을 지원하고, team과 연관 object까지 포함하려면 `params`의 `dependent_objects`를 `true`로 지정합니다. 다른 두 package는 각 package 문서에 정의된 지원 object type과 이름을 사용해야 합니다.

### 영향과 제약

생성 API를 다시 호출할 수 있는 형태의 정의를 얻으므로 환경 간 비교와 재생성이 쉬워집니다. 다만 현재 호출자 소유 object만 반환하고 cross-schema·grant·shared object는 포함하지 않으며, 기본값은 요청한 object만 반환하므로 dependency가 자동으로 모두 포함된다고 가정하면 안 됩니다. 공개 credential 이름은 포함될 수 있지만 secret value는 반환되지 않습니다.

### 검증 항목

원본 환경에서 반환된 CLOB이 예상 object type과 이름을 가리키는지 확인하고, agent team은 dependency 포함 여부를 목적에 맞게 선택합니다. 대상 환경에 적용하기 전 object 이름과 환경별 값, 필요한 dependent object가 모두 준비됐는지 검토한 후 별도 검증 환경에서 반환된 PL/SQL을 실행해 재생성 결과를 비교합니다.

## Import and Export Select AI Agent Teams
* **Services:** Autonomous Database Serverless
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-import-export-select-ai.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-import-export-select-ai.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/examples-using-select-ai-agent.html#GUID-79B6EAB0-78A5-4C2A-B6A9-5D6AA4424818](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/examples-using-select-ai-agent.html#GUID-79B6EAB0-78A5-4C2A-B6A9-5D6AA4424818){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-agent-package.html#GUID-35AC1151-9C49-4925-B2D1-A74C4534F7CB](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-agent-package.html#GUID-35AC1151-9C49-4925-B2D1-A74C4534F7CB){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-agent-package.html#GUID-5F998FB4-B247-483E-A030-DF5C44F68ECC](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-agent-package.html#GUID-5F998FB4-B247-483E-A030-DF5C44F68ECC){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database Serverless의 Select AI Agent team 정의를 `DBMS_CLOUD_AI_AGENT.IMPORT_TEAM`과 `EXPORT_TEAM` API로 가져오고 내보낼 수 있습니다. Agent team 구성을 migration·backup·version control·환경 간 공유에 사용할 수 있는 공식 인터페이스가 제공됩니다.

### 설정 방법

`IMPORT_TEAM`은 JSON specification을 직접 전달하거나 Object Storage file 또는 database directory file을 입력으로 사용할 수 있습니다. `EXPORT_TEAM` function은 정의를 CLOB으로 반환하며, procedure는 Object Storage URI 또는 directory file로 기록할 수 있습니다. Import할 때는 대상 AI profile 이름과 team 이름을 지정하고, Object Storage를 사용할 경우 해당 credential과 object URI를 준비합니다.

### 영향과 제약

Team 정의를 파일이나 CLOB으로 다룰 수 있어 동일한 구성을 다른 Autonomous Database Serverless 환경으로 옮기고 변경 이력을 관리하기 쉬워집니다. 다만 team이 참조하는 user-created function, AI profile, credential과 같은 환경별 dependency는 대상 환경에 별도로 준비해야 하며, export 결과를 그대로 적용하기 전에 이름과 연결 정보를 검토해야 합니다.

### 검증 항목

Export 결과를 보관한 뒤 대상 환경에서 필요한 profile과 user-created function이 존재하는지 확인합니다. Import 후에는 team metadata와 구성 요소가 예상대로 생성됐는지 확인하고, Select AI Agent team을 실행해 tool 연결과 응답이 정상인지 검증합니다.
