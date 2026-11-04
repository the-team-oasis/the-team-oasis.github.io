---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "10월 OCI AI Database 업데이트 소식"
teaser: "2026년 10월 OCI AI Database 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aidb
tags:
  - oci-release-notes-2026
  - Oct-2026
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

## Select AI Support for Gemini Enterprise Agent Platform

- **Services:** Autonomous Database Serverless
- **Release Date:** October 13, 2026

### 업데이트 내용

Select AI에서 Gemini Enterprise Agent Platform을 AI 제공자로 사용할 수 있습니다. AI 프로필을 구성하면 자연어-대-SQL 생성, 채팅, `showsql`, `explainsql`, 임베딩 등 기존 Select AI 인터페이스에서 Google Cloud 프로젝트와 리전에 제공되는 모델을 활용할 수 있습니다.

### 사전 조건

Select AI를 사용하려면 Autonomous AI Database 인스턴스, 지원되는 AI 제공자의 유료 API 계정, 제공자 접근용 자격 증명 및 외부 제공자에 접근하기 위한 네트워크 ACL 권한이 필요합니다. OCI Generative AI를 제외한 외부 제공자에는 네트워크 ACL 권한이 요구됩니다.

### 구성 방법

AI 프로필은 `DBMS_CLOUD_AI.CREATE_PROFILE` 및 `DBMS_CLOUD_AI.SET_PROFILE`로 생성·구성합니다. Gemini Enterprise Agent Platform을 사용하는 경우 Google Cloud 인증을 구성하고, Select AI를 사용할 사용자에게 필요한 `DBMS_CLOUD_AI` 실행 권한을 부여해야 합니다.

### 참고

- [Release Note: Select AI Support for Gemini Enterprise Agent Platform](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-10-select-ai-gemini.htm)
- [Documentation: Manage AI Profiles](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/select-ai-manage-profiles.html#GUID-F502FB67-976D-4772-AE63-62DA7B58001D)

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->
