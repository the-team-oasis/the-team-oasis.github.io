---
layout: page-fullwidth
#
# Content
#
subheadline: "Oracle 23ai"
title: "Oracle Database 23ai Synthetic Data(합성 데이터) 생성"
teaser: "Oracle Database 23ai Synthetic Data(합성 데이터) 생성에 대해 소개 및 실습을 합니다."
author: dankim
breadcrumb: true
categories:
  - aiml
tags:
  - [oci, 23ai, synthetic data]
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

## 합성 데이터(Synthetic Data()란?
합성 데이터(Synthetic Data)란 실제로 측정된 데이터(Real Data)를 생성하는 모형이 존재한다고 가정하고, 통계적 방법이나 기계학습 방법 등을 이용해 추정된 모형에서 새롭게 생성한 모의데이터(Simulated Data)를 의미합니다. 다시 말하면, 합성 데이터는 실제 환경에서 수집되거나 측정되는 것이 아니라 디지털 환경에서 생성되는 가상의 데이터라고 볼 수 있습니다. 


## Oracle 23ai에서 합성 데이터 생성
Oracle 23ai 에서는 합성 데이터를 생성할 수 있는 기능을 제공하고 있습니다. 지금부터 Oracle ADB 23ai에서 합성 데이터를 생성하는 방법에 대해 알아보겠습니다.

### 환경 준비
ADB 프로비저닝은 아래 포스트를 참고합니다. 여기서는 Oracle Autonomous Database 23ai를 사용합니다.  
[Oracle Database 23ai Select AI 소개 및 구성](https://the-team-oasis.github.io/aiml/oci-selectai)

먼저 합성 데이터를 생성할 사용자 생성 및 권한을 부여합니다.
```sql
CREATE USER SELECT_AI_USER;
GRANT EXECUTE ON DBMS_CLOUD_AI TO SELECT_AI_USER;
GRANT UNLIMITED TABLESPACE TO SELECT_AI_USER;
```

### OCI GenAI를 위한 Credential 및 Profile 생성
생성형 AI 접근을 위한 Credential을 생성합니다. 본 실습에서는 OCI GenAI 모델을 활용할 것으로, Credential은 Resource Principal을 활용합니다. 자세한 내용은 아래 포스트를 참고합니다.  
[Oracle Database 23ai Select AI 소개 및 구성](https://the-team-oasis.github.io/aiml/oci-selectai)

Resource Principal을 활성화 합니다.
```sql
BEGIN
  DBMS_CLOUD_ADMIN.ENABLE_PRINCIPAL_AUTH(provider => 'OCI');
END;
/
```

Profile을 생성합니다.
```sql
BEGIN  
  DBMS_CLOUD_AI.CREATE_PROFILE(  
      profile_name => 'GENAI',  
      attributes   =>'{"provider":"oci", 
                       "model":"cohere.command-r-plus",
                       "credential_name": "OCI$RESOURCE_PRINCIPAL",
                       "oci_apiformat":"COHERE",
                       "object_list":     [{"owner": "SELECT_AI_USER"}]}');  
END;
/
```

Profile을 사용하도록 설정합니다.
```sql
BEGIN
    DBMS_CLOUD_AI.SET_PROFILE('GENAI');
END;
/
```

### OpenAI Credential 및 Profile 생성 (옵션)
만약 OpenAI Credential 및 Profile을 활용하려면 다음과 같이 진행합니다.

먼저 ADB에서 OpenAI API 접근을 위해 ACL을 추가합니다.
```sql
BEGIN  
    DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
         host => 'api.openai.com',
         ace  => xs$ace_type(privilege_list => xs$name_list('http'),
                             principal_name => 'ADMIN',
                             principal_type => xs_acl.ptype_db)
    );
END;
/
```

다음과 같이 OpenAI를 위한 Credential을 생성합니다.
```sql
BEGIN
    DBMS_CLOUD.CREATE_CREDENTIAL('OPENAI_CRED', 'OPENAI', 'your_api_token');
END;
/
```

Profile을 생성합니다.
```sql
BEGIN                                                                        
    DBMS_CLOUD_AI.CREATE_PROFILE(                                              
    'OPENAI',                                                             
    '{
        "provider": "openai",
        "model":"gpt-4o",
        "credential_name": "OPENAI_CRED",
        "object_list": [{"owner": "SELECT_AI_USER"}],
        "conversation": "true"
    }');
END;
/
```

Profile을 사용하도록 설정합니다.
```
BEGIN
    DBMS_CLOUD_AI.SET_PROFILE('OPENAI');
END;
/
```

### 합성 데이터 생성 1: 단일 테이블
우선 합성 데이터를 담을 테이블을 준비합니다.
```sql
-- 테이블 준비
CREATE TABLE SELECT_AI_USER.Director (
    director_id     INT PRIMARY KEY,
    name            VARCHAR(100)
);
CREATE TABLE SELECT_AI_USER.Movie (
    movie_id        INT PRIMARY KEY,
    title           VARCHAR(100),
    release_date    DATE,
    genre           VARCHAR(50),
    director_id     INT,
    FOREIGN KEY (director_id) REFERENCES SELECT_AI_USER.Director(director_id)
);
CREATE TABLE SELECT_AI_USER.Actor (
    actor_id        INT PRIMARY KEY,
    name            VARCHAR(100)
);
CREATE TABLE SELECT_AI_USER.Movie_Actor (
    movie_id        INT,
    actor_id        INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES SELECT_AI_USER.Movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES SELECT_AI_USER.Actor(actor_id)
);

COMMENT ON COLUMN SELECT_AI_USER.MOVIE.TITLE IS 'Movie title in Korean';
COMMENT ON COLUMN SELECT_AI_USER.MOVIE.GENRE IS 'Movie genre in Korean';
COMMENT ON COLUMN SELECT_AI_USER.ACTOR.NAME IS 'Actor name in Korean';
COMMENT ON COLUMN SELECT_AI_USER.DIRECTOR.NAME IS 'Director name in Korean';
```

우선 간단하게 단일 테이블에 대한 합성 데이터를 생성해보겠습니다. params로 comments 값을 true하면, 컬럼에 설정된 comment를 참고해서 가상의 데이터를 생성합니다.
```sql
BEGIN
    DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
        profile_name => 'GENAI',
        object_name  => 'Director',
        owner_name   => 'ADB_USER',
        record_count => 5,
        params       => '{"comments":true}'
    );
END;
/
```

```sql
SQL> SELECT * FROM SELECT_AI_USER.Director;
 
DIRECTOR_ID NAME
----------- ----------------------------------------------------------------------------------------------------
          1 임순남
          2 한정현
          3 조영호
          4 박민수
          5 이은정
```

### 합성 데이터 생성 2: 여러 테이블
이번에는 여러 연관된 테이블에 데이터를 동시에 생성해 보겠습니다. user_prompt를 사용하면 LLM에 데이터 생성에 대한 추가 규칙이나 요구 사항을 전달할 수 있습니다. 여기서는 2024년에 개봉한 영화 및 영화별로 여러명의 배우(Actor)를 생성하도록 지시합니다.

user_prompt 인수를 사용하면 데이터 생성에 대한 추가 규칙이나 요구 사항을 지정할 수 있습니다. 이는 단일 테이블에 적용하거나 여러 테이블에 대한 object_list 인수의 일부로 적용할 수 있습니다. 예를 들어, DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA에 대한 다음 호출에서 prompt는 AI에게 2009년에 개봉된 영화에 대한 합성 데이터를 생성하도록 지시합니다.

```sql
TRUNCATE TABLE SELECT_AI_USER.Movie_Actor;
TRUNCATE TABLE SELECT_AI_USER.Actor;
TRUNCATE TABLE SELECT_AI_USER.Movie;
TRUNCATE TABLE SELECT_AI_USER.Director;

BEGIN
DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
  profile_name => 'GENAI',
  object_list => '[{"owner": "SELECT_AI_USER", "name": "DIRECTOR","record_count":5},
                    {"owner": "SELECT_AI_USER", "name": "MOVIE_ACTOR","record_count":20, "user_prompt":"Each movie has several actors"},
                    {"owner": "SELECT_AI_USER", "name": "ACTOR","record_count":10},
                    {"owner": "SELECT_AI_USER", "name": "MOVIE","record_count":5,"user_prompt":"all movies released in 2024"}]',
  params => '{"comments":"TRUE"}');
END;
/
```

```sql
SQL> SELECT * FROM SELECT_AI_USER.Movie;

MOVIE_ID    TITLE               RELEASE_D        GENRE        DIRECTOR_ID	
----------- ------------------- ---------------- ------------ -----------
          1 어메이징 비스트         2024-06-23T00:00 판타지                   2
          2 문라이트 섀도우         2024-02-14T00:00 드라마                   5
          3 더 서치               2024-05-30T00:00 스릴러                   3
          4 스타더스트             2024-08-18T00:00 로맨스                   1
          5 미드나잇 선            2024-11-02T00:00 공포                    4

```

### 합성 데이터 생성 3: 샘플 데이터를 참고하여 생성
제공되는 샘플 데이터를 참고해서 합성 데이터를 생성할 수 있습니다. 먼저 테이블을 하나 준비합니다.

```sql
CREATE TABLE SELECT_AI_USER.TRANSACTION_RECORD (
    transaction_id VARCHAR2(50) PRIMARY KEY,
    customer_id VARCHAR2(50) NOT NULL,
    transaction_amount NUMBER(10, 2) NOT NULL,
    transaction_date VARCHAR2(50) NOT NULL,
    transaction_date TIMESTAMP(6) NOT NULL,
    payment_method VARCHAR2(30) NOT NULL,
    product_category VARCHAR2(50) NOT NULL,
    quantity NUMBER(10) NOT NULL,
    customer_age NUMBER(3) NOT NULL,
    customer_location VARCHAR2(100),
    device_used VARCHAR2(50),
    ip_address VARCHAR2(50),
    shipping_address VARCHAR2(200),
    billing_address VARCHAR2(200),
    is_fraudulent NUMBER(1) CHECK (is_fraudulent IN (0, 1)) NOT NULL,
    account_age_days NUMBER(10),
    transaction_hour NUMBER(2) CHECK (transaction_hour BETWEEN 0 AND 23) NOT NULL
);
```

3건의 샘플 데이터를 추가합니다.
```sql
SQL> INSERT INTO select_ai_user.transaction_record (
    transaction_id, customer_id, transaction_amount, transaction_date, 
    payment_method, product_category, quantity, customer_age, customer_location, 
    device_used, ip_address, shipping_address, billing_address, is_fraudulent, 
    account_age_days, transaction_hour
) VALUES (
    '44e09e24-74b9-4041-9894-8734ad525faa', '379', 10.01, 
    '2024-10-01 20:08', 
    'debit card', 'home && garden', 4, 37, 'Christopherland', 
    'desktop', '211.189.218.190', 
    '471 Mary Courts Apt. 872, Maryhaven, KS 16126', 
    '471 Mary Courts Apt. 872, Maryhaven, KS 16126', 
    1, 30, 20
);

-- 두 번째 레코드
SQL> INSERT INTO select_ai_user.transaction_record (
    transaction_id, customer_id, transaction_amount, transaction_date, 
    payment_method, product_category, quantity, customer_age, customer_location, 
    device_used, ip_address, shipping_address, billing_address, is_fraudulent, 
    account_age_days, transaction_hour
) VALUES (
    'aa81b9ff-034d-4d8e-bec6-ed29b8ae5d54', '19', 25.50, 
    '2024-11-02 16:54', 
    'bank transfer', 'clothing', 32, 35, 'Marymouth', 
    'mobile', '126.224.150.175', 
    '68763 Bryant Points Suite 057, Guzmanfort, ME 02932', 
    '139 Lopez Neck, Carterview, DE 85571', 
    0, 16, 16
);

-- 세 번째 레코드
SQL> INSERT INTO select_ai_user.transaction_record (
    transaction_id, customer_id, transaction_amount, transaction_date, 
    payment_method, product_category, quantity, customer_age, customer_location, 
    device_used, ip_address, shipping_address, billing_address, is_fraudulent, 
    account_age_days, transaction_hour
) VALUES (
    '7ac1febd-3e94-457e-bfe4-acf081dc8da0', '104', 100.75, 
    '2024-07-01 15:41', 
    'PayPal', 'electronics', 43, 28, 'Paynefurt', 
    'tablet', '195.31.145.184', 
    'Unit 5864 Box 9572, DPO AE 69746', 
    'Unit 5864 Box 9572, DPO AE 69746', 
    0, 15, 15
);
```

sample_rows 값을 3으로 설정하여 제공된 3건의 데이터를 참고하여 10건의 합성 데이터를 생성하도록 합니다. user_prompt에 transaction_date 값을 'YYYY-MM-DD HH24:MI' 포멧으로 생성하도록 LLM에 지시합니다.
```sql
BEGIN
  DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
    profile_name      => 'GENAI',
    object_name       => 'TRANSACTION_RECORD',
    owner_name        => 'SELECT_AI_USER',
    record_count      => 10,
    user_prompt       => 'Using varchar2 type for tansaction_date and the string format is ''YYYY-MM-DD HH24:MI'' (e.g., ''2024-10-01 20:08'')',
    params            => '{"sample_rows":3}'
  );
END;
/
```

TRANSACTION_RECORD 테이블을 조회해 보면 10건의 합성 데이터가 생성된 것을 확인할 수 있습니다.
```sql
SQL> SELECT * FROM SELECT_AI_USER.TRANSACTION_RECORD;

TRANSACTION_ID                       CUSTOMER_ID TRANSACTION_AMOUNT TRANSACTION_DATE    PAYMENT_METHOD PRODUCT_CATEGORY   QUANTITY CUSTOMER_AGE  CUSTOMER_LOCATION DEVICE_USED IP_ADDRESS      SHIPPING_ADDRESS                                     BILLING_ADDRESS                                     IS_FRAUDULENT ACCOUNT_AGE_DAYS TRANSACTION_HOUR
------------------------------------ ----------- ------------------ ------------------- -------------- ------------------ -------- ------------- ----------------- ----------- --------------- ---------------------------------------------------- --------------------------------------------------- ------------- ---------------- ----------------
44e09e24-74b9-4041-9894-8734ad525faa         379              10.01 2024-10-01 20:08    debit card     home && garden            4            37 Christopherland   desktop     211.189.218.190 471 Mary Courts Apt. 872, Maryhaven, KS 16126        471 Mary Courts Apt. 872, Maryhaven, KS 16126                   1               30               20
aa81b9ff-034d-4d8e-bec6-ed29b8ae5d54          19               25.5 2024-11-02 16:54    bank transfer  clothing                 32            35 Marymouth         mobile      126.224.150.175 68763 Bryant Points Suite 057, Guzmanfort, ME 02932  139 Lopez Neck, Carterview, DE 85571                            0               16               16
7ac1febd-3e94-457e-bfe4-acf081dc8da0         104             100.75 2024-07-01 15:41    PayPal         electronics              43            28 Paynefurt         tablet      195.31.145.184  Unit 5864 Box 9572, DPO AE 69746                     Unit 5864 Box 9572, DPO AE 69746                                0               15               15
ba574433-9b08-4622-992a-06446060863e          20              18.25 2024-08-17 09:31    credit card    toys                     15            26 Lakeview          laptop      162.45.23.48    34511 Gina Stravenue, Port Nicole, NE 10521          34511 Gina Stravenue, Port Nicole, NE 10521                     1               45                9
c5f3928c-4066-432a-9484-14266444646f          21              98.01 2024-09-29 14:12    PayPal         electronics               1            47 Donaldborough     tablet      179.165.144.161 23931 Gina Plaza Apt. 241, South Nicole, VT 07463    23931 Gina Plaza Apt. 241, South Nicole, VT 07463               0               22               14
0a966248-204c-442a-8182-16466444646f          22             155.75 2024-10-15 22:05    debit card     home & garden            43            37 Paynemouth        desktop     10.11.12.13     45678 Taylor Road, Johnsonview, CA 98765             45678 Taylor Road, Johnsonview, CA 98765                        0               18               22
1b966248-204c-442a-8182-16466444646f          23              30.75 2024-11-03 10:14    bank transfer  clothing                  2            23 Donaldside        mobile      192.168.1.1     67890 Taylor Avenue, Carterborough, NY 12345         67890 Taylor Avenue, Carterborough, NY 12345                    1               12               10
2c966248-204c-442a-8182-16466444646f          24               65.5 2024-11-17 15:36    credit card    toys                     18            31 Lakeview          laptop      172.16.254.1    12345 Taylor Street, Johnsonville, TX 54321          12345 Taylor Street, Johnsonville, TX 54321                     0               36               15
2c966248-204d-442a-8182-164664446470          25               92.3 2024-08-05 10:12    PayPal         electronics               2            22 Riverview         mobile      192.168.0.1     6789 Oak Avenue, Greenville, NY 12345                6789 Oak Avenue, Greenville, NY 12345                           1               18               10
2c966248-204e-442a-8182-164664446471          26              15.75 2024-10-23 14:55    debit card     clothing                  5            30 Hillcrest         tablet      10.0.0.1        4567 Pine Road, Phoenix, AZ 67890                    4567 Pine Road, Phoenix, AZ 67890                               0               45               14
2c966248-204f-442a-8182-164664446472          27               30.5 2024-07-11 08:43    bank transfer  home & garden            12            25 Valleyview        desktop     8.8.8.8         8910 Maple Lane, Seattle, WA 98101                   8910 Maple Lane, Seattle, WA 98101                              1               23                8
2c966248-2050-442a-8182-164664446473          28               8.25 2024-09-19 18:27    credit card    electronics               1            19 Brookside         laptop      198.51.100.22   1122 Elm Street, Denver, CO 80201                    1122 Elm Street, Denver, CO 80201                               0               12               18
2c966248-2051-442a-8182-164664446474          29               46.1 2024-11-04 12:06    PayPal         toys                      3            33 Riverside         mobile      172.16.254.2    5678 Oak Avenue, Greenville, NY 12345                5678 Oak Avenue, Greenville, NY 12345                           1               54               12
```

### 합성 데이터 생성 4: table_statistics 파라미터 사용
table_statistics 파라미터는 테이블 통계를 사용할지 여부를 결정하는 옵션입니다. 예를 들어 위 TRANSACTION_RECORD 테이블에 있는 PAYMENT_METHOD에 기본 샘플 데이터로 'debit card',  'bank transfer', 'PayPal'의 고유의 값들이 있다고 가정하면, table_statistics 값이 true일 경우 합성 데이터 생성 시 이 고유의 값을 그대로 사용하겠다는 의미가 됩니다. 만약 table_statistics 값을 false로 지정한다면 고유 값이나 데이터 분포와는 상관없이 무작위로 데이터를 생성할 수 있습니다. 이 경우 PAYMENT_METHOD에 'debit card',  'bank transfer', 'PayPal' 값이 아닌 다른 값이 생성될 수 있습니다. table_statistics의 기본값은 true 입니다.

**table_statistics 값이 false인 경우**
```sql
BEGIN
  DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
    profile_name      => 'GENAI',
    object_name       => 'TRANSACTION_RECORD',
    owner_name        => 'SELECT_AI_USER',
    record_count      => 10,
    user_prompt       => 'Using varchar2 type for tansaction_date and the string format is ''YYYY-MM-DD HH24:MI'' (e.g., ''2024-10-01 20:08'')',
    params            => '{"sample_rows":3, ,"table_statistics":false}'
  );
END;
/
```

TRANSACTION_RECORD 테이블의 TRANSACTION_METHOD 값을 조회해 보면, 기존의 'debit card',  'bank transfer', 'PayPal' 값 외에도 다른 값(Apple Pay, cash, credit card)이 나오는 것을 확인할 수 있습니다.
```sql
SQL> SELECT TRANSACTION_METHOD FROM SELECT_AI_USER.TRANSACTION_RECORD;

TRANSACTION_METHOD
------------------
debit card
bank transfer
PayPal
credit card
bank transfer
Apple Pay
PayPal
credit card
cash
debit card
PayPal
bank transfer
cash
```


## 참고
* https://blogs.oracle.com/database/post/announcing-select-ai-for-synthetic-data-generation
* https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/select-ai-examples.html#GUID-9990ACE7-BCEF-4597-8FA6-CFD6D834B510