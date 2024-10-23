---
layout: page-fullwidth
#
# Content
#
subheadline: "Oracle 23ai"
title: "Oracle Database 23ai Select AI with RAG 소개 및 구성"
teaser: "Oracle Database 23ai Select AI with RAG에 대한 소개와 구성 방법에 대해서 소개합니다."
author: dankim
breadcrumb: true
categories:
  - aiml
tags:
  - [oci, 23ai, selectai, rag]
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

## Oracle 23ai Select AI with RAG 소개
Select AI에 대한 자세한 내용은 아래 포스트를 참고하시기 바랍니다.  
[Oracle Database 23ai Select AI 소개 및 구성](https://the-team-oasis.github.io/aiml/oci-selectai)

Oracle 23ai에서 제공되는 Select AI with RAG는 Select AI 기능을 활용하여 RAG(Retrieval-Augmented Generation: 검색증강생성)를 구현할 수 있도록 해줍니다. RAG는 일반적으로 LLM의 한계 (Hallucinations:환각, 오래된 정보 기반, 특정 도메인 지식 부족등)를 극복하기 위한 방법으로 외부의 데이터 소스를 참조하여 답변의 정확도를 높이는 방식입니다. 현재 Oracle 23ai Select AI with RAG는 외부 데이터 소스로 OCI Object Storage만 지원되며, 테스트 형태의 데이터(text, csv 등)만 지원됩니다. (2024-10-23 기준)

![](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/img/adb-obj-storage-select-ai-rag.png)

## Oracle 23ai Select AI with RAG 테스트 환경 구성
ADB는 [Oracle Database 23ai Select AI 소개 및 구성](https://the-team-oasis.github.io/aiml/oci-selectai)에서 사용한 환경을 그대로 사용합니다.

### Object Storage Bucket 및 Bucket 접근을 위한 OCI Credential 생성
OCI Object Storage Bucket을 사전에 생성하고 Bucket URL을 확인합니다. Bucket은 ***메뉴 > Storage > Object Storage & Archive Storage > Buckets*** 로 이동한 후 **Create Bucket** 버튼을 눌러 생성합니다. 생성된 Bucket 주소는 다음과 같은 포멧입니다.
```
https://objectstorage.{Region Identifier}.oraclecloud.com/n/{Object Storage Namespace}/b/{Bucket 이름}/o/
```

* Region Identifier는 아래 링크에서 확인합니다.  
  [About Regions and Availability Domains](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm)
* Object Storage Namespace는 OCI Console 로그인 후 Tenancy 상세에서 확인 가능합니다.
* Bucket 이름은 앞에서 생성한 Bucket 이름입니다.

이제 Bucket에 접근하기 위해 OCI Credential을 생성합니다. username은 OCI 로그인 아이디, Password는 OCI Profile에서 Auth Key 생성으로 얻을 수 있습니다.
```sql
BEGIN
  DBMS_CLOUD.CREATE_CREDENTIAL(
    credential_name => 'OCI_CRED',
    username => 'OCI 사용자 아이디',
    password => 'OCI Auth Key'
  );
END;
/
```

### 샘플 파일 업로드 및 연결 확인
테스트로 사용되는 데이터는 **rocket.txt**와 **sample_calllog.csv** 파일로 아래 출처에서 제공되는 데이터를 한글로 번역한 것입니다.  
출처: https://oracle-japan.github.io/ocitutorials/ai-vector-search/ai-vector108-select-ai-with-rag/

파일을 다운로드 받습니다.
* [rocket.txt](https://the-team-oasis.github.io/assets/files/aiml/rocket.txt)
* [sample_calllog.csv](https://the-team-oasis.github.io/assets/files/aiml/sample_calllog.csv)

우선 다운로드 받은 **rocket.txt** 파일만 위에서 생성한 Bucket에 업로드합니다.

아래 예시 명령어를 통해서 업로드 한 파일이 잘 조회되는지 확인합니다.
```sql
SELECT * FROM DBMS_CLOUD.LIST_OBJECTS('OCI_CRED','https://objectstorage.ap-seoul-1.oraclecloud.com/n/myobjectstoragenamespace/b/mybucket/o/');
```

### Profile 생성
Credential은 Resource Principal을 활용합니다. (참고:[Oracle Database 23ai Select AI 소개 및 구성](https://the-team-oasis.github.io/aiml/oci-selectai)에서 사용한 환경을 그대로 사용합니다.)  
사용 모델은 GenAI Cohere 모델인 **cohere.command-r-plus**를 사용하고 Vector Embedding 모델은 **cohere.embed-multilingual-v3.0**을 사용합니다.

```sql
BEGIN  
  DBMS_CLOUD_AI.CREATE_PROFILE(  
      profile_name => 'GENAI_TEXT_TRANSFORMER',  
      attributes   =>'{"provider":"oci", 
                       "credential_name": "OCI$RESOURCE_PRINCIPAL",
                       "vector_index_name": "MY_VECTOR_INDEX",
                       "model": "cohere.command-r-plus",
                       "embedding_model": "cohere.embed-multilingual-v3.0",
                       "temperature": 0,
                       "comments": true,
                       "oci_apiformat": "COHERE"}');  
END;
/
```

### Vector Index 생성
아래 명령어로 Vector Index를 생성합니다. vector_table_name을 지정하면 my_vector_table에 청크된 텍스트와 벡터를 확인할 수 있습니다.
```sql
BEGIN
  DBMS_CLOUD_AI.CREATE_VECTOR_INDEX(
    index_name  => 'MY_VECTOR_INDEX',
    attributes  => '{"vector_db_provider": "oracle",
                     "vector_table_name": "my_vector_table",
                     "object_storage_credential_name": "OCI_CRED",
                     "location": "https://objectstorage.ap-seoul-1.oraclecloud.com/n/myobjectstoragenamespace/b/mybucket/o/",
                     "profile_name": "GENAI_TEXT_TRANSFORMER",
                     "vector_dimension": 1024,
                     "vector_distance_metric": "cosine",
                     "chunk_overlap":128,
                     "chunk_size":400,
                     "refresh_rate": 1}');
END;
/
```

## 실행
### RAG 기반 답변 확인
이제 실행해 보도록 하겠습니다. rocket.txt 파일내에서 설명하는 OraBooster는 실제하지 않는 가상의 로켓 엔진입니다. 먼저 **SELECT AI CHAT** 명령어를 통해서 RAG를 사용하지 않고 LLM만을 통해서 질문을 해보도록 합니다.

```sql
SELECT AI CHAT 'OraBooster는 무엇인가요?'; -- without RAG
```

```
RESPONSE
------------------------------------------------------------------------
OraBooster는 Oracle Cloud Infrastructure(OCI)를 위한 혁신적인 클라우드 관리 플랫폼입니다. OCI 사용자에게 비용 최적화, 보안 강화, 관리 효율성 향상 등 OCI 환경을 개선하고 강화하는 데 도움이 되는 포괄적인 도트 세트를 제공하도록 설계되었습니다.

OraBooster는 OCI 사용자에게 다음과 같은 주요 이점을 제공합니다.

1. 비용 최적화: 이 플랫폼은 OCI 비용을 최적화하는 데 도움이 되는 분석 및 권장 사항을 제공합니다. 여기에는 사용되지 않은 리소스를 식별하고, 비용 효율적인 대체품을 제안하고, 예산을 초과하지 않도록 모니터링하는 기능이 포함됩니다.

2. 강화된 보안: OraBooster는 OCI 보안 태세를 강화하는 데 도움이 되는 도구를 제공합니다. 여기에는 취약성 평가, 액세스 제어 개선, 데이터 암호화 권장 사항이 포함됩니다. 이 플랫폼은 잠재적인 보안 위협을 식별하고 완화하는 데 도움이 됩니다.

3. 향상된 관리 효율성: OCI 리소스 관리를 간소화하는 포괄적인 도구 세트를 제공합니다. 여기에는 리소스 프로비저닝 및 관리를 자동화하고, 성능을 모니터링하고 최적화하며, OCI 환경 전반에 걸쳐 일관된 거버넌스 정책을 적용하는 기능이 포함됩니다.

4. 인사이트 및 분석: OraBooster는 OCI 사용에 대한 심층적인 분석과 인사이트를 제공합니다. 이를 통해 사용자는 OCI 투자를 최적화하고, 리소스 사용을 모니터링하고, 시간 경과에 따른 추세와 잠재적인 영역을 식별할 수 있습니다.

5. 사용자 친화적인 인터페이스: 플랫폼은 직관적이고 사용자 친화적인 인터페이스를 제공하여 OCI 관리를 간소화합니다. 사용자는 OCI 환경을 쉽게 탐색, 관리 및 최적화할 수 있습니다.
```
LLM이 존재하지 않는 OraBooster가 마치 존재하는 것처럼 환각(Hallucination)을 일으킵니다. 

이제 **SELECT AI NARRATE** 명령어를 사용하여 RAG를 사용하도록 해보겠습니다.
```sql
SELECT AI NARRATE 'OraBooster란 무엇인가요?'; -- with RAG
```

```
RESPONSE
------------------------------------------------------------------------
OraBooster는 차세대 우주 탐사를 지원하는 로켓 엔진입니다. 이 엔진은 높은 성능과 혁신성을 결합한 독창적인 설계로, 인류의 우주 진출을 가속화하는 혁신적인 기술입니다.

OraBooster의 핵심 기술은 '양자 다이내믹스 플라즈마 부스터'입니다. 이 부스터는 양자 역학 원리를 활용하여 강력한 추력을 발생시킵니다. 또한, 엔진에는 초경량이면서도 초강도의 나노 섬유 소재가 사용되어, 우주 공간의 가혹한 환경을 견디고 고속 비행 중 발생하는 열과 충격으로부터 로켓을 보호합니다.

또한, OraBooster에는 '하이퍼 포톤 자이로스코프'가 탑재되어 있어, 높은 정확도로 로켓의 자세를 유지하고 목표를 추적합니다. 그리고 '바이오닉 리액션 리스폰더' 시스템이 인공지능과 생체 인식 기술을 결합하여, 로켓의 비정상적인 진동이나 움직임을 감지하고 적절한 복구 기능을 활성화합니다.

종합적으로, OraBooster 로켓 엔진은 혁신적인 기술과 미래지향적인 설계로 우주 탐사의 새로운 시대를 열어갈 것입니다.

Sources:
  - rocket.txt (https://objectstorage.ap-seoul-1.oraclecloud.com/n/apackrsct01/b/mybucket/o/rocket.txt)
```

데이터 소스에 있는 데이터(rocket.txt)를 기반으로 답변을 생성하는 것을 확인할 수 있으며, 답변에 사용된 출처도 같이 알려줍니다.

### Vector Index 자동 색인
Vector Index 생성 시 **refresh_rate** 값이 1로 지정되어 있는데, 이는 1분 단위로 데이터 소스(Object Storage)의 데이터를 자동 색인합니다. 우선 다음 쿼리를 실행해 봅니다.

```sql
SELECT AI narrate '클린에어의 전력 요금은 어느 정도입니까?';
```

```
RESPONSE
------------------------------------------------------------------------
Sorry, unfortunately the response for your natural language prompt was not generated using the sources of your data. Here is some more information to help you further: 데이터에 액세스할 수 없습니다. 제공된 지식 기반에 관련 정보가 없습니다.

**Data$Sources:** ```json
[
    {
        "source": "rocket.txt",
        "url": "https://objectstorage.ap-seoul-1.oraclecloud.com/n/apackrsct01/b/mybucket/o/rocket.txt"
    }
]
```

현재 **클린에어**라는 제품에 대한 정보는 Object Storage에 추가되지 않았기 때문에 이 질문과 관련된 정보를 찾지 못하는 것을 알 수 있습니다.  
이제 위에서 다운로드 받은 sample_calllog.csv 파일을 Bucket에 업로드한 후 다시 조회해봅니다.

```sql
SELECT AI narrate '클린에어의 전력 요금은 어느 정도입니까?';
```

```
RESPONSE
------------------------------------------------------------------------
클린에어는 에너지 효율성이 뛰어나 하루 24시간 가동해도 전기 요금은 약 200원 정도입니다. 자동 온/오프 기능을 사용하면 전기를 더욱 절약할 수 있습니다.

Sources:
  - sample_calllog.csv (https://objectstorage.ap-seoul-1.oraclecloud.com/n/apackrsct01/b/mybucket/o/sample_calllog.csv)
```

업로드한 CSV 파일의 정보를 바탕으로 답변을 생성하는 것을 확인할 수 있습니다.

## 참고
* https://docs.public.content.oci.oraclecloud.com/en-us/iaas/autonomous-database-serverless/doc/examples-using-select-ai.html
* https://oracle-japan.github.io/ocitutorials/ai-vector-search/ai-vector108-select-ai-with-rag/