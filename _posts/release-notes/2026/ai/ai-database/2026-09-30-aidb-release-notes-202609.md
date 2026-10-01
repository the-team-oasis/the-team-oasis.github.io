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

### 업데이트 내용
Select AI Agent Framework team을 schema 간에 공유하고 실행할 수 있습니다. team 공유 범위와 실행 권한을 분리해 multi-schema database 환경에서 agent asset을 운영할 수 있습니다.

### 권한 조건

공유 schema에서 team을 실행하려면 team이 참조하는 AI profile·tool·function과 대상 data에 대한 권한을 함께 점검해야 합니다. 공유 후에는 실행 사용자로 team을 호출해 tool 접근과 결과가 의도한 범위에 머무르는지 검증합니다.

### 공유 권한과 실행

Team owner가 consumer user 또는 role에 팀 실행 권한을 부여한 뒤, consumer는 owner-qualified name으로 팀을 실행합니다. 이 권한은 팀 단위 실행만 허용하며 underlying agent·task·tool을 개별 변경하거나 재공유하는 권한을 주지 않습니다.

```sql
BEGIN
  DBMS_CLOUD_AI_AGENT.GRANT_TEAM_ACCESS(
    team_name         => 'SHARED_SUPPORT_TEAM',
    user_or_role_name => 'TEAM_CONSUMER');
END;
/
```

실행 전 consumer session에서 필요한 role이 활성화되어 있는지 확인하고, `TEAM_OWNER.SHARED_SUPPORT_TEAM` 형식으로 호출해 공유 범위가 의도대로 적용되는지 검증합니다.

### 참고

- [Release Note: Share and Run the Select AI Agent Framework teams Across Schemas](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-share-run-select-ai.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: DBMS_CLOUD_AI_AGENT Package](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-agent-package.html){:target="_blank" rel="noopener"}

## Select AI for Java
* **Services:** Autonomous Database Serverless
* **Release Date:** September 22, 2026

### 업데이트 내용
Select AI for Java는 Java application에서 AI profile, credential, conversation, vector index, NL2SQL, RAG 등을 사용하는 SDK를 제공합니다. Java 기반 database application의 Select AI 통합 경로가 추가되었습니다.

### 적용 시점

Java 애플리케이션에서 Select AI를 호출할 때는 database 연결과 AI profile 구성을 분리해 관리하는 것이 좋습니다. 개발 환경에서 profile·사용자 권한·호출 결과를 확인한 뒤 애플리케이션 workload에 적용합니다.

### 적용 준비

Java 애플리케이션에서 Select AI를 사용하려면 먼저 데이터베이스에서 AI profile과 필요한 credential·권한을 준비하고, 애플리케이션이 사용할 연결에서 profile과 prompt 실행 흐름을 검증합니다. Java SDK의 API 선택보다 profile의 provider·model·접근 권한이 먼저 충족되어야 합니다.

### 참고

- [Release Note: Select AI for Java](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-select-ai-java.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Use Select AI for Natural Language Interaction with your Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/select-ai.html){:target="_blank" rel="noopener"}

## Additional Profile Attributes for the DBMS_CLOUD_AI Package
* **Services:** Autonomous Database on Dedicated Exadata Infrastructure , Autonomous Database on Exadata Cloud@Customer
* **Release Date:** September 15, 2026

### 업데이트 내용
Dedicated Exadata Infrastructure 및 Exadata Cloud@Customer의 DBMS_CLOUD_AI package에 추가 profile attribute가 제공됩니다. Exadata 기반 Select AI profile의 설정 가능 범위를 확인해 적용합니다.

### 참고

- [Release Note: Additional Profile Attributes for the DBMS_CLOUD_AI Package](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-dbms-cloud-ai-updates.htm){:target="_blank" rel="noopener"}

## Update Multiple Credential Attributes with DBMS_CLOUD.UPDATE_CREDENTIAL
* **Services:** Autonomous Database Serverless
* **Release Date:** September 01, 2026

### 업데이트 내용
DBMS_CLOUD.UPDATE_CREDENTIAL이 JSON object로 하나 이상의 credential attribute를 갱신할 수 있습니다. OCI signing key와 fingerprint처럼 함께 변경하는 값을 일관되게 교체할 수 있으며, 지원되는 attribute 하나만 갱신하는 경우에도 사용할 수 있습니다.

### 적용 범위와 검증

하나 이상 attribute를 바꿀 때는 변경 대상 credential의 사용처와 JSON attribute 이름을 먼저 확인합니다. key와 fingerprint처럼 함께 바뀌는 값은 갱신 후 외부 서비스 연결을 시험하고, 기존 작업이 새 credential으로 정상 실행되는지 검증합니다.

OCI signing-key credential에서는 `user_ocid`, `tenancy_ocid`, `private_key`, `fingerprint` 중 지원되는 하나 이상을 `attributes` JSON object로 갱신할 수 있습니다. 아래 값은 **placeholder**이며, 실제 private key·fingerprint나 비밀 값은 코드와 저장소에 넣지 않습니다.

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

### 참고

- [Release Note: Update Multiple Credential Attributes with DBMS_CLOUD.UPDATE_CREDENTIAL](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-update-multiple-credential.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: DBMS_CLOUD Subprograms and REST APIs](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-subprograms.html){:target="_blank" rel="noopener"}
