---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "9월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2025년 9월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2025-dataplatform
tags:
  - oci-release-notes-2025
  - Jul-2025
  - DATAPLATFORM, DATABASE, BIGDATA, DATAFLOW, SPARK, ORACLE
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

## View Space Usage Information for Non-JSON Objects
* **Services:**  Autonomous Database Serverless
* **Release Date:** September 10, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-objectstate-consumption.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-objectstate-consumption.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database 인스턴스에서 DBA_NONJSON_OBJECTS 뷰를 쿼리하여 JSON이 아닌 객체가 차지하는 공간을 측정합니다. 이 뷰는 ADMIN 사용자만 접근할 수 있습니다. <BR>
JSON Object 로 사용하지 않는 공간을 파악하여 공간의 효율성을 위해 조치를 취할 수 있도록 합니다. 

- DBA_NONJSON_OBJECTS View
  ![ADBDS](/assets/img/dataplatform/2025/release_note/202510/oci_adb_dba_nonjson_obj_view.png)


## Data Transforms Enhancements
* **Services:**  Autonomous Database Serverless
* **Release Date:** September 16, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-data-trans-enh.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-data-trans-enh.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database 에서 제공되는 Data Transforms 에는 다음과 같은 새로운 기능과 변경 사항이 포함되어 있습니다.

- Data Flow 에서 연결된 테이블 자동 조인
  - 이제 데이터 흐름 편집기의 SQL 자동 조인 기능을 사용하여 외래 키 제약 조건이나 공통 열 이름과 같은 미리 정의된 관계를 기반으로 테이블 간에 조인을 설정할 수 있습니다. 

- 폴더 수준에서 아티팩트 내보내기 및 가져오기
  - 이제 Data Transforms 아티팩트를 한 환경에서 다른 환경으로 이동할 때 폴더를 포함할 수 있습니다.

- Google Analytics 4 지원
  - 이 릴리스에는 Google 애널리틱스 4 애플리케이션 연결 유형이 지원됩니다.

- Data Transforms 구성 예제 <br>
  ![Data Transforms](/assets/img/dataplatform/2025/release_note/202510/oci_adb_data_integrator_01.png)

- Data Transforms 지원 Connections <br>
  ![Data Transforms](/assets/img/dataplatform/2025/release_note/202510/oci_adb_data_integrator_02.png)

- 폴더 수준의 내보내기 및 가져오기 기능 <br>
  ![Data Transforms](/assets/img/dataplatform/2025/release_note/202510/oci_adb_data_transform_03.png)


## Enable Consistent View of Data across Table Hyperlinks
* **Services:**  Autonomous Database Serverless
* **Release Date:** September 16, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-data-trans-enh.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-data-trans-enh.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI 데이터베이스의 데이터에 액세스하기 위해 테이블 ​​하이퍼링크를 생성하고 관리할 수 있습니다. Table Hyperlink 를 사용하면 Table Hyperlink 외에 추가 정보를 제공하지 않고도 데이터베이스에서 데이터를 쉽게 검색할 수 있습니다. 모든 사용자는 브라우저에서 Table Hyperlink 를 제공하거나 REST 클라이언트를 사용하여 데이터베이스에 액세스할 수 있으며, 데이터베이스에서 시행하는 보안 제어가 적용됩니다. 사용자는 테이블 하이퍼링크에 쿼리 매개변수를 추가하여 브라우저에서 검색된 데이터를 표 형식으로 볼 수 있습니다.

- Table Hyperlink 생성 예제
  ```text
  DECLARE
   status CLOB;
   BEGIN
      DBMS_DATA_ACCESS.CREATE_URL(
          schema_name => 'SCOTT',
          schema_object_name    => 'TREE_DATA',
          expiration_minutes    => 360,
          result                => status);
       dbms_output.put_line(status);
    END;
  /
  ```
- Table Hyperlink Group 생성 예제
  ```text
  DECLARE
   status CLOB;
   BEGIN
      DBMS_DATA_ACCESS.CREATE_URL(
          sqls => '[{"name": "employee", "description": "employee description", "schema_name":"SCOTT", "schema_object_name":"employee"},
              {"name":"TREE", "description": "tree description", "sql_statement": "select * from admin.tree_data"}]',
          expiration_minutes   => 360,
          result               => status);
       dbms_output.put_line(status);
    END;
  /
  ```
- Table Hyperlink Group 생성 결과
  ```text
  {
    "status" : "SUCCESS",
    "id" : "P4LmrWC2-tGeHVlF6FRaQUIN2fW5nixkXa2t4ZGx6ubxxxyyyzzz-itojFFJFMooj",
    "preauth_url" : "https://dataaccess.adb.us-phoenix-1.oraclecloudapps.com/adb/p/QHD_Yvonle1eUCoxbN6bO...xyzabcFQEg/data",
    "member_ids" :
    [
      "zAhrHMBwknDwmmA7Nh4fR3-Wuva6io_3y-Vv-iZNNc8XplGDxyxabc7SXf5xLmFGY",
      "JKYigWp5fvAftcRsuoFeaZx2JqMn9yk71KtEleBMWZ8XcDWxyzabcPKGOTJRHVu"
    ],
    "expiration_ts" : "2025-08-07T00:37:00.214Z"
  }
  ```
- Table Hyperlink Access 방법
  ```text
  curl https://dataaccess.adb.us-chicago-1.oraclecloudapps.com/adb/p/K6XExample/data
  ```

- Table Hyperlink Access 결과
  ```text
  {
      "items": [],                 <-- Array of records from database
      "hasMore": true OR false,    <-- Indicates if there are more records to fetch or not
      "limit": Number,             <-- Indicates number of records in the page. Maximum allowed number is 100.
      "offset": Number,            <-- Offset indicating the start of the current page
      "count": Number,             <-- Count of records in the current page
      "links": [
          {
              "rel": "self",
              "href": "{Link to table hyperlink url for the current page}"
          },
          {
              "rel": "previous",
              "href": "{Link to table hyperlink url for the previous page}"
          },
          {
              "rel": "next",
              "href": "{Link to table hyperlink url for the next page}"
          }
      ]
  }
  ```

- Table Hyperlink Access 사용 예 (<mark>Excel or Google Sheet</mark>)
  - Autonomous Database Add-in Plugin 설치 후 사용 (최대 50,000 건까지 Load 가능)
  ![HyperLink](/assets/img/dataplatform/2025/release_note/202510/oci_adb_table_hyperlink.png)


## Use Cloud Tables to Store Logging and Diagnostic Information
* **Services:**  Autonomous Database Serverless
* **Release Date:** September 16, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-store-log-diag.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-store-log-diag.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

새로운 기능으로 Cloud Table 기능이 생겼습니다. Oracle 관리형 Cloud Storage (일반적인 Object Storage 와 다르게 Access 불가) 에 테이블 데이터가 저장되고 데이터베이스 저장소를 사용하지 않는 클라우드 테이블을 만들 수 있습니다. 이러한 테이블은 애플리케이션 로그나 진단 정보와 같이 자주 액세스하지 않는 데이터를 저장하는 데 유용합니다.

- Cloud Table 사용 예 <br>
  ![CloudTable](/assets/img/dataplatform/2025/release_note/202510/oci_adb_cloud_table.png)

## Refreshable Metadata Clones
* **Services:**  Autonomous Database Serverless
* **Release Date:** September 16, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-refr-metadata-clone.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-refr-metadata-clone.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database 는 Active 인스턴스의 전체 복제본, 메타데이터 복제본, Refreshable 복제본, 또는 Refreshable 메타데이터 복제본을 생성할 수 있는 복제 기능을 제공합니다. Refreshable 메타데이터 복제본을 사용하면 시스템은 소스 데이터베이스의 메타데이터만 포함하는 복제본을 생성하며, 소스 데이터베이스의 변경 사항을 쉽게 업데이트할 수 있습니다.

- Autonomous Database Metadata Clone 기능 <br>
  ![ADBCLONE](/assets/img/dataplatform/2025/release_note/202510/oci_adb_metadata_clone.png)

## Select AI Summarize, Feedback, Conversations
* **Services:**  Autonomous Database Serverless
* **Release Date:** September 23, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-selectai-summarize.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-selectai-summarize.htm){:target="_blank" rel="noopener"} <br>
[https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-selectai-feedback.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-selectai-feedback.htm){:target="_blank" rel="noopener"} <br>
[https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-selectai-conv.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-09-selectai-conv.htm){:target="_blank" rel="noopener"}


### 업데이트 내용

- <mark> Select AI Summarize 기능</mark> : <BR>
  Autonomous Database 의 Select AI 기능의 Action 에 Summarize, Feedback, Conversation 기능들이 추가되었습니다. 
  LLM 프롬프트로 전체 텍스트를 입력하여 대용량 문서를 요약할 수 있습니다. 하지만 LLM에는 토큰 제한이 있으므로 Select AI는 다양한 기법을 적용하여 대용량 문서를 요약합니다.

  - Select AI 에 적용된 기술
    - Iterative refinement (반복적 세분화)
    - MapReduce

  - Select AI는 주어진 LLM의 최대 토큰 크기를 기반으로 대용량 콘텐츠를 LLM 제한에 맞는 작고 처리하기 쉬운 청크로 분할할 수 있습니다. 그런 다음 Select AI는 Iterative refinement (반복적 세분화) 또는 MapReduce 기법을 사용하여 요약을 생성합니다.

  - Select AI Summarize 수행 예

    ```text
    SELECT AI SUMMARIZE
    Like countless other people around the globe, I stream music, and like more
    than six hundred million of them I mainly use Spotify. Streaming currently
    accounts for about eighty per cent of the American recording industry’s
    revenue, and in recent years Spotify’s health is often consulted as a measure
    for the health of the music business over all. Last spring, the International
    Federation of the Phonographic Industry reported global revenues of $28.6
    billion, making for the ninth straight year of growth. All of this was
    unimaginable in the two-thousands, when the major record labels appeared
    poorly equipped to deal with piracy and the so-called death of physical media.
    On the consumer side, the story looks even rosier. Adjusted for inflation, a
    
    ... (skipped 1000 rows in the middle)
    
    Pelly writes of some artists, in search of viral fame, who surreptitiously use
    social media to effectively beta test melodies and motifs, basically putting
    together songs via crowdsourcing. Artists have always fretted about the
    pressure to conform, but the data-driven, music-as-content era feels
    different. “You are a Spotify employee at that point,” Daniel Lopatin, who
    makes abstract electronic music as Oneohtrix Point Never, told Pelly. “If your
    art practice is so ingrained in the brutal reality that Spotify has outlined
    for all of us, then what is the music that you’re not making? What does the
    music you’re not making sound like?” Listeners might wonder something similar.
    What does the music we’re not hearing sound like?;
    
    
    RESPONSE
    --------------------------------------------------------------------
    The music streaming industry, led by Spotify, has revolutionized the way
    people consume music, with streaming accounting for 80% of the American
    recording industry's revenue. However, this shift has also complicated the
    lives of artists, who struggle to survive in a hyper-abundant present where
    music is often valued for its convenience rather than its artistic merit.
    Spotify's algorithms prioritize popularity and profitability over artistic
    diversity, leading to a homogenization of music and a devaluation of the
    labor that goes into creating it. Meanwhile, the company's executives reap
    enormous profits, with CEO Daniel Ek's net worth rivaling that of the
    wealthiest musicians. As music critic Liz Pelly argues, the streaming economy
    raises important questions about autonomy, creativity, and the value of art
    in a world where everything is readily available and easily accessible.
    ```

- <mark> Select AI Feedback 기능</mark> : <BR>
  또 다른 추가된 Select AI 기능은 생성된 NL2SQL 결과에 대한 피드백을 제공하여 쿼리 생성 정확도를 향상시킬 수 있는 기능이 추가되었습니다. 피드백은 SQL 명령줄뿐만 아니라 PL/SQL 프로시저를 통해서도 제공할 수 있습니다.
  - Select AI Feedback 수행 예
    ```text
    -Query mentioned with SQL_TEXT

    select ai showsql how many watch history in total;
    
    RESPONSE
    ----------------------------------------------------------------------------------
    SELECT COUNT(w."WATCH_ID") AS "Total Watch History" FROM "ADB_USER"."WATCH_HISTORY" w
    
    select ai feedback for query "select ai showsql how many watch history in total", name the column as total_watch;
    
    RESPONSE
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Based on your feedback, the SQL query for prompt "how many watch history in total" is successfully refined. The refined SQL query as following:
    SELECT COUNT(w."WATCH_ID") AS "total_watch" FROM "ADB_USER"."WATCH_HISTORY" w
    ```

- <mark> Select AI Conversations 기능</mark> : <BR>
SQL 쿼리 생성(NL2SQL) 맥락에서 Conversations 는 더욱 직관적이고 접근하기 쉬운 데이터 작업 방식을 제공하여 사용자가 SQL에 대한 심층적인 기술 지식 없이도 더 쉽게 인사이트를 도출하고 작업을 수행할 수 있도록 합니다. Conversations 는 Select AI 의 chat 및 RAG 기능과도 함께 사용할 수 있습니다.

  - Select AI Conversations 수행 예
    ```text
    --
    -- Get Profile in current session
    --
    SQL> SELECT DBMS_CLOUD_AI.get_profile() from dual;
    
    DBMS_CLOUD_AI.GET_PROFILE()
    --------------------------------------------------------------------------------
    "OPENAI"
    
    --
    -- Use AI
    --
    what are the total number of customers;
    
    CUSTOMER_COUNT
    --------------
            55500
    
    break out count of customers by country;   
    
    RESPONSE
    -----------------
    COUNTRY_NAME 			CUSTOMER_COUNT
    Italy 				7780
    Brazil 				832
    Japan 				624
    United Kingdom 			7557
    Germany 			8173
    United States of America 	18520
    France 				3833
    Canada 				2010
    Spain 				2039
    China 				712
    Singapore 			597
    New Zealand 			244
    Poland 	708
    Australia 			831
    Argentina 			403
    Denmark 			383
    South Africa 			88
    Saudi Arabia 			75
    Turkey 				91

      
    what age group is most common;
    
    RESPONSE
    --------------------------------------------------------------------------------
    AGE_GROUP 	CUSTOMER_COUNT
    65+ 		28226
    
    select ai keep the top 5 customers and their country by their purchases and include a rank in the result;
    
    RESPONSE
    --------------------------------------------------------------------------------
    RANK 	CUSTOMER_NAME 		COUNTRY 	PURCHASES
    1 	Abigail Ruddy 		Japan 		276
    2 	Abigail Ruddy 		Italy 		168
    3 	Abigail Ruddy 		Japan 		74
    3 	Abner Robbinette 	Germany 	74
    5 	Abner Everett 		France 		68

    ```

---