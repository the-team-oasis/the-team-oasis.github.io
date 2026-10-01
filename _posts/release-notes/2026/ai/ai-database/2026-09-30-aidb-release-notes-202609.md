---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "9월 OCI AI Database 업데이트 소식"
teaser: "2026년 9월 OCI AI Database 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aidb
tags:
  - oci-release-notes-2026
  - Sep-2026
  - AI Database
  - Autonomous Database
  - Exadata
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

## Share and Run the Select AI Agent Framework teams Across Schemas
* **Services:** Autonomous Database Serverless
* **Release Date:** September 22, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-share-run-select-ai.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-share-run-select-ai.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-agent-package.html](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-agent-package.html){:target="_blank" rel="noopener"}
### 기능 변경과 적용 범위
Select AI Agent Framework team을 schema 간에 공유하고 실행할 수 있습니다. team 공유 범위와 실행 권한을 분리해 multi-schema database 환경에서 agent asset을 운영할 수 있습니다.

### 권한 조건

공유 schema에서 team을 실행하려면 team이 참조하는 AI profile·tool·function과 대상 data에 대한 권한을 함께 점검해야 합니다. 공유 후에는 실행 사용자로 team을 호출해 tool 접근과 결과가 의도한 범위에 머무르는지 검증합니다.

## Select AI for Java
* **Services:** Autonomous Database Serverless
* **Release Date:** September 22, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-select-ai-java.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-select-ai-java.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/select-ai.html](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/select-ai.html){:target="_blank" rel="noopener"}
### 기능 변경과 적용 범위
Select AI for Java는 Java application에서 AI profile, credential, conversation, vector index, NL2SQL, RAG 등을 사용하는 SDK를 제공합니다. Java 기반 database application의 Select AI 통합 경로가 추가되었습니다.

### 적용 시점

Java 애플리케이션에서 Select AI를 호출할 때는 database 연결과 AI profile 구성을 분리해 관리하는 것이 좋습니다. 개발 환경에서 profile·사용자 권한·호출 결과를 확인한 뒤 애플리케이션 workload에 적용합니다.

## Additional Profile Attributes for the DBMS_CLOUD_AI Package
* **Services:** Autonomous Database on Dedicated Exadata Infrastructure , Autonomous Database on Exadata Cloud@Customer
* **Release Date:** September 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-dbms-cloud-ai-updates.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-dbms-cloud-ai-updates.htm){:target="_blank" rel="noopener"}

### 기능 변경과 적용 범위
Dedicated Exadata Infrastructure 및 Exadata Cloud@Customer의 DBMS_CLOUD_AI package에 추가 profile attribute가 제공됩니다. Exadata 기반 Select AI profile의 설정 가능 범위를 확인해 적용합니다.

## Update Multiple Credential Attributes with DBMS_CLOUD.UPDATE_CREDENTIAL
* **Services:** Autonomous Database Serverless
* **Release Date:** September 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-update-multiple-credential.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-update-multiple-credential.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-subprograms.html](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-subprograms.html){:target="_blank" rel="noopener"}
### Credential 속성 갱신
DBMS_CLOUD.UPDATE_CREDENTIAL이 JSON object로 여러 credential attribute를 한 번에 갱신할 수 있습니다. OCI signing key와 fingerprint처럼 함께 변경하는 값을 일관되게 교체할 수 있습니다.

### 적용 범위와 검증

여러 attribute를 바꿀 때는 변경 대상 credential의 사용처와 JSON attribute 이름을 먼저 확인합니다. key와 fingerprint처럼 함께 바뀌는 값은 갱신 후 외부 서비스 연결을 시험하고, 기존 작업이 새 credential으로 정상 실행되는지 검증합니다.

OCI signing-key credential에서 관련 값을 함께 바꾸는 경우에만 `attributes` JSON object 형태를 사용합니다. 아래 값은 **placeholder**이며, 실제 private key·fingerprint나 비밀 값은 코드와 저장소에 넣지 않습니다.

```sql
BEGIN
  DBMS_CLOUD.UPDATE_CREDENTIAL(
    credential_name => 'OCI_CRED',
    attributes      => JSON_OBJECT(
      'private_key' VALUE '<new-private-key>',
      'fingerprint' VALUE '<new-fingerprint>'
    )
  );
END;
/
```

적용 후에는 해당 credential을 사용하는 최소 범위의 작업을 실행해 인증 성공 여부를 확인합니다.
