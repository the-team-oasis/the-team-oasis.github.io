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

### 업데이트 내용

Select AI Agent Framework team을 schema 간에 공유하고 실행할 수 있습니다. team 공유 범위와 실행 권한을 분리해 multi-schema database 환경에서 agent asset을 운영할 수 있습니다.

## Select AI for Java
* **Services:** Autonomous Database Serverless
* **Release Date:** September 22, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-select-ai-java.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-select-ai-java.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Select AI for Java는 Java application에서 AI profile, credential, conversation, vector index, NL2SQL, RAG 등을 사용하는 SDK를 제공합니다. Java 기반 database application의 Select AI 통합 경로가 추가되었습니다.

## Use Azure Key Management Service (Azure KMS) to manage Master Encryption Keys in Oracle Database@Azure
* **Services:** Autonomous Database on Dedicated Exadata Infrastructure
* **Release Date:** September 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-azure-kms-support.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-azure-kms-support.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Database@Azure의 Autonomous AI Database on Dedicated Exadata Infrastructure에서 Azure KMS로 master encryption key를 관리할 수 있습니다. Azure key 권한과 database encryption 운영 책임을 함께 검토해야 합니다.

## Additional Profile Attributes for the DBMS_CLOUD_AI Package
* **Services:** Autonomous Database on Dedicated Exadata Infrastructure , Autonomous Database on Exadata Cloud@Customer
* **Release Date:** September 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-dbms-cloud-ai-updates.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-dbms-cloud-ai-updates.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Dedicated Exadata Infrastructure 및 Exadata Cloud@Customer의 DBMS_CLOUD_AI package에 추가 profile attribute가 제공됩니다. Exadata 기반 Select AI profile의 설정 가능 범위를 확인해 적용합니다.

## Update Multiple Credential Attributes with DBMS_CLOUD.UPDATE_CREDENTIAL
* **Services:** Autonomous Database Serverless
* **Release Date:** September 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-update-multiple-credential.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-09-update-multiple-credential.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

DBMS_CLOUD.UPDATE_CREDENTIAL이 JSON object로 여러 credential attribute를 한 번에 갱신할 수 있습니다. OCI signing key와 fingerprint처럼 함께 변경하는 값을 일관되게 교체할 수 있습니다.
