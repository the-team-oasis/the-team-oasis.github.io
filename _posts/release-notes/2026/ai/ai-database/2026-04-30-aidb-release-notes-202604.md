---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "4월 OCI AI Database 업데이트 소식"
teaser: "2026년 4월 OCI AI Database 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2026-aidb
tags:
  - oci-release-notes-2026
  - Apr-2026
  - AI Database
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

## Extend Select AI translate support to Google, AWS, and Azure

- **Services:** Autonomous Database Serverless
- **Release Date:** April 14, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-04-selectai-supportprov.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-04-selectai-supportprov.htm){:target="_blank" rel="noopener"}
- **Documentation:** [Translate](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/select-ai-translate.html){:target="_blank" rel="noopener"}, [DBMS_CLOUD_AI Package](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/dbms-cloud-ai-package.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database Serverless의 **Select AI Translate** 기능이 OCI뿐 아니라 Google, AWS, Azure provider까지 지원하도록 확장되었습니다. 이제 AI Profile에 설정한 provider를 기준으로 SQL 또는 PL/SQL에서 텍스트 번역을 수행할 수 있습니다.

지원 provider는 다음과 같습니다.

- OCI Language
- Google Cloud Translation API
- Amazon Translate
- Azure AI Translator

### 사용 방법

Select AI Translate는 세 가지 방식으로 사용할 수 있습니다.

- `select ai translate <text>` 형태의 Select AI action 사용
- `DBMS_CLOUD_AI.GENERATE` 함수에서 `action => 'translate'` 지정
- `DBMS_CLOUD_AI.TRANSLATE` 함수 직접 호출

예시는 다음과 같습니다.

```sql
SELECT DBMS_CLOUD_AI.GENERATE(
  prompt        => 'I need to translate this sentence.',
  profile_name  => 'GENAI_TRANSLATE',
  action        => 'translate',
  attributes    => '{"target_language":"fr","source_language":"en"}'
) FROM dual;
```

### 인증 및 권한

OCI provider를 사용하는 경우에는 OCI IAM 정책으로 `ai-service-language-family` 사용 권한을 부여합니다. Resource Principal credential을 사용하면 Dynamic Group에 권한을 부여하고, Private Key credential을 사용하면 User Group에 권한을 부여합니다.

외부 provider를 사용하는 경우에는 provider별 credential과 IAM 구성이 필요합니다. Google, AWS, Azure credential은 `DBMS_CLOUD.CREATE_CREDENTIAL`로 데이터베이스에 저장하고, AI Profile에서 해당 credential 이름을 참조합니다. 예를 들어 Google은 Cloud Translation API 권한, AWS는 Amazon Translate 권한, Azure는 Azure AI Translator 접근 권한을 provider 계정에 부여해야 합니다.

### 활용 포인트

Select AI Translate는 RAG와 함께 사용할 수 있습니다. 예를 들어 문서 언어가 embedding model에 적합하지 않은 경우 번역 후 vectorization을 수행하거나, `DBMS_CLOUD_AI.GENERATE` 또는 `NARRATE` 결과를 사용자가 원하는 언어로 자동 변환하는 workflow를 만들 수 있습니다.
