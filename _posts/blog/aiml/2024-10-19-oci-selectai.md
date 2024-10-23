---
layout: page-fullwidth
#
# Content
#
subheadline: "Oracle 23ai"
title: "Oracle Database 23ai Select AI 소개 및 실습"
teaser: "Oracle Database 23ai Select AI에 대한 소개와 간단한 실습을 통해 경험해봅니다."
author: dankim
breadcrumb: true
categories:
  - aiml
tags:
  - [oci, 23ai, selectai]
#published: false

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

# -------------- 내용 필독 -------------------
# 작성할 내용은 아래부터 작성
# 작성 방법
# 각 챕터별 제목은 "###"로 시작한다.
# 하위 제목은 "####"로 시작한다.
# 이미지는 images 폴더안에 Category(getting-started, infrastructure, platform, database, aiml)에 넣고 사용 시 "../../images/카테고리명/이미지" 형태로 참조한다.
# Bold는 **글자**
# Bold + Italic은 ***글자***
# ------------------------------------------
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## Oracle 23ai Select AI 소개
Select AI는 Oracle Database에서 자연어를 사용하여 데이터를 쿼리할 수 있는 기능으로 Oracle SQL과 LLM을 결합하여 동작합니다. 일반적으로 LLM이 SQL 생성을 능숙하게 할 수는 있지만, 생성한 SQL을 데이터베이스에서 실행할 수 있는 것은 또 다른 문제입니다. Oracle 23ai Select AI는 오라클 데이터베이스에서 실행되는 SQL을 생성할 수 있도록 도와줍니다. 자연어를 통해서 SQL을 생성하므로 전문적인 SQL 지식 없이도 빠르게 쿼리 작성을 할 수 있으며, 효과적인 SQL 쿼리 패턴을 학습함으로써 효율적인 쿼리를 생성하여 더 나은 성능을 낼 수 있습니다.

## Select AI 테스트 환경 구성
### Oracle Autonomous Database (ADB) 23ai 프로비저닝
OCI에 로그인한 후 메뉴 > Oracle Database > Autonomous Databases 로 이동한 후 **Create Autonomous Database** 버튼을 클릭하여 Oracle ADB를 생성합니다. 테스트를 진행한 구성은 다음과 같습니다.

* **Display name:** MyATP23ai
* **Database name:** MyATP23ai
* **Workload type:** Transaction Processing
* **Deployment type:** Serverless
* **Database version:** 23ai
* **ECPU count:** 2
* **Storage (TB):** 1
* **Access type:** Secure access from everywhere

### Oracle Autonomous Database (ADB) 23ai 접속
본 실습에서는 Oracle SQL Developer extension for VS Code에서 진행합니다. Oracle SQL Developer extension for VS Code에 대한 소개와 설치 방법은 아래 영상 참고합니다. VS Code가 설치되어 있다면 간단히 VS Code Extensions에서 **Oracle SQL Developer** 검색하여 설치할 수 있습니다.
[https://www.youtube.com/watch?v=e-yqkI0t6dQ](https://www.youtube.com/watch?v=e-yqkI0t6dQ)

Connection 생성전에 우선 설치한 ADB 상세 화면에서 Wallet을 다운로드 받습니다.
![](/assets/img/aiml/2024/oci-selectai-1.png " ")

이제 VS Code SQL Developer Connection을 추가해서 다음과 같이 입력합니다.
* **Connection Name:** MyATP23ai
* **User Info - Username:** ADMIN
* **User Info - Password:** DB 생성시에 입력한 패스워드
* **Connection Type:** Cloud Wallet
* **Configuration File:** 다운로드 받은 Wallet Zip 파일
* **Service:** MYATP23AI_MEDIUM

ADB Predefined Service Name에는 LOW, MEDIUM, HIGH, TP, TPURGENT 가 있습니다. 이는 ADB의 성능이나 동시성 특성을 가진 미리 정의된 데이터베이스 서비스로 자세한 내용은 아래 링크에서 확인합니다.  
[Database Service Names for Autonomous Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/predefined-database-services-names.html#GUID-6CEFC4B7-6EF8-4237-A004-C88F570A480B)

연결되면 생성한 Connection 오른쪽 마우스 클릭 후 **Open SQL Worksheet**를 클릭하여 SQL Worksheet를 오픈합니다.

## Credential 및 Profile 생성
### Credential 생성 또는 Resource Princiapl 설정
ADB에서 OCI 서비스(GenAI) 접근을 위한 API Key를 활용한 Credential 생성 혹은 Resource Principal 설정을 합니다. 아래는 API Key를 활용하여 Credential을 생성하는 예시 입니다.
```sql
BEGIN                                                                       
  DBMS_CLOUD.create_credential( 
    credential_name => 'GENAI_CRED', 
    user_ocid       => 'ocid1.user.oc1..wq',
    tenancy_ocid    => 'ocid1.tenancy.oc1..askfa',
    private_key     => 'MIIEvAIBADANBgkqhkiG.............==',
    fingerprint     => '8a:fd:9d:aa' 
  ); 
END; 
/
```

Resource Principal을 활용하면 별도의 Credential 생성 없이 OCI Policy 구성으로 OCI 서비스 접근이 가능합니다. 자세한 내용은 아래 링크 참고합니다.  
[About Using Resource Principal to Access Oracle Cloud Infrastructure Resources](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/resource-principal.html#GUID-3CF59CED-F7DF-46AF-B3CF-E703ED0BB3EE)

본 실습에서는 Resource Principal을 사용합니다. 다음과 같이 Resource Principal을 활성화합니다. Parameter로 username을 따로 지정하지 않을 경우 아래 프로시져는 **ADMIN** 사용자로 수행됩니다.
```sql 
BEGIN
  DBMS_CLOUD_ADMIN.ENABLE_PRINCIPAL_AUTH(provider  => 'OCI');
END;
/
```

이제 다음과 같이 Profile을 생성합니다. 생성형 AI 모델은 OCI GenAI의 Cohere, LLAMA 및 OpenAI, Google Gemini, Azure OpenAI Service, Anthropic를 사용할 수 있습니다. 본 실습에서는 생성형 AI 모델로 OCI GenAI의 Cohere 모델 중 **cohere.command-r-plus** 모델을 사용하였습니다. **SH** 스키마는 ADB 설치 시 기본적으로 포함된 스키마로 SH 스키마가 **Select AI**를 사용하기 위한 대상이 됩니다
```sql
BEGIN  
  DBMS_CLOUD_AI.CREATE_PROFILE(  
      profile_name => 'GENAI',  
      attributes   =>'{"provider":"oci", 
                       "model":"cohere.command-r-plus",
                       "credential_name": "OCI$RESOURCE_PRINCIPAL",
                       "oci_apiformat":"COHERE",
                       "object_list":     [{"owner": "SH"}]}');  
END;
/
```

## 실행
생성한 프로파일을 현재 세션에서 사용하기 위해 설정합니다. 새로운 세션마다 아래 명령어는 실행해줘야 합니다.
```sql
BEGIN
    DBMS_CLOUD_AI.SET_PROFILE('GENAI');
END;
/
```

먼저 SH.CUSTOMERS 테이블 데이터 건수를 조회해 보겠습니다.
```sql
SELECT COUNT(*) FROM SH.CUSTOMERS;

COUNT(*)
--------
   55500
```

SELECT AI를 사용해보겠습니다. 먼저 **SELECT AI NARRATE**를 사용하여 자연어로 질문 및 답변을 받아보겠습니다.
```sql
SELECT AI NARRATE How many customers exist;

RESPONSE
--------------------------------------------
There are 55,500 customers in the database.
```

**SELECT AI SHOWSQL**을 사용하면 사용된 SQL을 확인할 수 있습니다.
```sql
SELECT AI SHOWSQL How many customers exist;

RESPONSE
-------------------------------------------------------------------------
SELECT COUNT(DISTINCT "CUST_ID") AS customer_count FROM "SH"."CUSTOMERS"
```

**SELECT AI RUNSQL**을 통해서 위 SQL을 그대로 실행한 결과를 확인합니다.
```sql
SELECT AI RUNSQL How many customers exist;

CUSTOMER_COUNT
--------------
         55500
```
