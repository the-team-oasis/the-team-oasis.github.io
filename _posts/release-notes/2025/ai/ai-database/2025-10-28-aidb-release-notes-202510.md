---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "10월 OCI AI Database 업데이트 소식"
teaser: "2025년 10월 OCI AI Database 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-aidb
tags:
  - oci-release-notes-2025
  - Oct-2025
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

## Select AI Translate
- **Services:** Autonomous Database Serverless
- **Release Date:** October 07, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/select-ai-translate.html](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/select-ai-translate.html){:target="\_blank" rel="noopener"}

### 업데이트 내용
Select AI Translate는 Oracle Autonomous Database에서 제공하는 AI 기반 텍스트 번역 기능입니다. 사용자는 SQL 또는 PL/SQL을 통해서 텍스트를 여러 언어 간에 번역할 수 있도록 생성형 AI(Generative AI) 기반 번역 서비스를 사용할 수 있습니다.

### 사용 방법
#### Profile 생성 및 Select AI 명령어로 직접 실행
```sql
BEGIN                                                                        
DBMS_CLOUD_AI.CREATE_PROFILE(                                              
      profile_name => 'GENAI_NEW',                                                             
      attributes   => '{"provider": "oci",
        "credential_name": "GENAI_CRED",
		    "target_language": "french",
		    "object_list": [{"owner": "SH", "name": "customers"},                
                        {"owner": "SH", "name": "countries"},                
                        {"owner": "SH", "name": "supplementary_demographics"},
                        {"owner": "SH", "name": "profits"},                  
                        {"owner": "SH", "name": "promotions"},               
                        {"owner": "SH", "name": "products"}]
       }');                                                                  
END;                                                                         
/
PL/SQL procedure successfully completed.

SQL> exec DBMS_CLOUD_AI.SET_PROFILE('GENAI_NEW');
 
PL/SQL procedure successfully completed.
 
SQL> select ai translate I need to translate this;
 
RESPONSE
---------------------
Je dois traduire ceci
```

#### DBMS_CLOUD_AI.GENERATE 함수 사용
```sql
SELECT DBMS_CLOUD_AI.GENERATE(
  prompt       => 'text to be translated',
  profile_name => 'oci_translate',
  action       => 'translate',
  attributes   => '{"target_language":"fr","source_language":"en"}'
) FROM dual;
```

#### DBMS_CLOUD_AI.TRANSLATE 함수를 직접 사용
```sql
BEGIN
  output_text := DBMS_CLOUD_AI.TRANSLATE(
    profile_name    => 'GENAI_NEW',
    text            => 'text to be translated',
    source_language => 'English',
    target_language => 'French'
  );
END;
/
```

#### 지원 언어
지원 언어는 **AI_TRANSLATION_LANGUAGES** View를 통해서 확인할 수 있습니다.
```sql
SELECT* FROM AI_TRANSLATION_LANGUAGES;

LANGUAGE_NAME        LANGUAGE_CODE        PROVIDER
-------------------- -------------------- ---------------
ARABIC               ar                   OCI
CROATIAN             hr                   OCI
CZECH                cs                   OCI
DANISH               da                   OCI
GERMAN               de                   OCI
GREEK                el                   OCI
ENGLISH              en                   OCI
SPANISH              es                   OCI
FINNISH              fi                   OCI
FRENCH               fr                   OCI
FRENCH CANADA        fr-CA                OCI
HEBREW               he                   OCI
HUNGARIAN            hu                   OCI
ITALIAN              it                   OCI
```

## Select AI Agent (autonomous agent framework)
- **Services:** Autonomous Database Serverless
- **Release Date:** October 07, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/select-ai-agent.html](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/select-ai-agent.html){:target="\_blank" rel="noopener"}

### 업데이트 내용
Select AI Agent는 **Autonomous AI Database 내부에서 실행되는 Autonomous AI Agent Framework”**입니다. 이 기능을 이용하면 AI 모델이 단순히 질문에 답하는 것을 넘어, 지능적으로 문제를 분석하고 계획을 세우며 여러 도구를 활용해 작업을 수행할 수 있습니다.

### 특징
* Select AI Agent는 **Short-term**과 **Long-term** Memory를 유지하여, 한 번의 상호작용을 넘어서 연속적인 대화나 맥락을 기억하면서 작업을 진행할 수 있습니다.
* Database와 긴밀히 통합됨으로서 보안/감사 정책과 통합되고, 데이터 이동이 최소화되며 기존 데이터 및 로직과 긴밀하게 결합된 AI 워크플로우를 구축할 수 있습니다.

### 지원 도구
* RAG (검색 기반 응답)
* NL2SQL (자연어 → SQL 변환)
* Custom PL/SQL Procedure
* 외부 REST API 호출

### Select AI Agent의 4가지 Layer 구조
1. Planning (계획)
→ 요청을 해석하고 실행 단계 설계
2. Tool Use (도구 실행)
→ 필요한 도구 호출 및 실행
3. Reflection (반영)
→ 결과 평가 및 다음 행동 결정
4. Memory Management (기억 관리)
→ 대화/작업 상태 및 이력 저장