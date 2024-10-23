---
layout: page-fullwidth
#
# Content
#
subheadline: "Oracle 23ai"
title: "Oracle Database 23ai Select AI with RAG and Springboot"
teaser: "Oracle Database 23ai Select AI with RAG를 Springboot로 구성하는 방법을 설명합니다."
author: dankim
breadcrumb: true
categories:
  - aiml
tags:
  - [oci, 23ai, selectai, rag, springboot]
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

![](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*tLNFSzfII4Qmo4iwHsPEvQ.png)

## Oracle 23ai Select AI RAG and Springboot
Select AI에 대한 자세한 내용은 아래 포스트를 참고하시기 바랍니다.  
[Oracle Database 23ai Select AI 소개 및 구성](https://the-team-oasis.github.io/aiml/oci-selectai)

Select AI with RAG에 대한 자세한 내용은 아래 포스트를 참고하시기 바랍니다.  
[Oracle Database 23ai Select AI with RAG 소개 및 구성](https://the-team-oasis.github.io/aiml/oci-selectai_rag)

## Select AI RAG를 위한 Springboot 설정
이번에는 앞서 진행한 Select AI RAG를 Springboot을 통해 RESTful로 호출하는 방법에 대해 설명합니다.

Springboot과 ADB 연결 구성, 실습을 위한 CloudBank 코드 작성은 [https://github.com/corradodebari/microservices-datadriven](https://github.com/corradodebari/microservices-datadriven)에 공개된 CloudBank Springboot 코드와 Oracle Livelabs의 [CloudBank - Building an App with Spring Boot, Oracle Database and Kubernetes
› Build the Account Microservice](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3607&p210_wec=&session=107120778193762)를 참고하였습니다. 

실습을 위한 코드는 아래 저장소에서 다운로드 받습니다.
```
git clone https://github.com/the-team-oasis/springboot_selectai_app
```

이제 application.yml 파일을 열어서 **/path/to/Wallet**와 **your_password** 부분을 ADB wallet 파일 압축을 해제한 디렉토리와 admin 패스워드로 대체한 후 저장합니다. 

```
$ cd springboot_selectai_app/src/resources/
$ vi application.yml
```

```yaml
spring:
  application:
    name: selelctaiapp
  jpa:
    hibernate:
      ddl-auto: validate
    properties:
      hibernate:
        dialect: org.hibernate.dialect.OracleDialect
        '[format_sql]': true
    show-sql: true
  datasource:
    url: jdbc:oracle:thin:@myatp23ai_tp?TNS_ADMIN=/path/to/Wallet
    username: admin
    password: your_password
    driver-class-name: oracle.jdbc.OracleDriver
    type: oracle.ucp.jdbc.PoolDataSource
    oracleucp:
      connection-factory-class-name: oracle.jdbc.pool.OracleDataSource
      connection-pool-name: SelectAIConnectionPool
      initial-pool-size: 15
      min-pool-size: 10
      max-pool-size: 30
```

## 소스 설명
소스 안에는 SELECT_AI_USER 스키마의 MOVIE 테이블 조회하는 부분도 포함되어 있지만, 여기서는 Select AI 실행을 위한 부분만 살펴보겠습니다. SELECT_AI_USER 스키마의 MOVIE 테이블 조회는 Oracle 23ai Synthetic Data (합성 데이터)편에서 테이블 생성하면 조회할 수 있습니다.

**SelectAIController.java**에는 **narrate**, **showsql**, **runsql**을 수행하는 함수가 작성되어 있습니다.

**narrate 함수**
```java
private String getNarrate(EntityManager entityManager, String question) {
  String sqlText = "select ai narrate " + question;
  final String[] sqlRet = new String[1];

  Session session = entityManager.unwrap(Session.class);
  session.doWork(connection -> {
    try (PreparedStatement preparedStatement = connection.prepareStatement(sqlText)) {
      try (ResultSet resultSet = preparedStatement.executeQuery()) {
        if (resultSet.next()) {
          sqlRet[0] = resultSet.getString(1);
          System.out.println(sqlRet[0]);

        } else {
          System.out.println("The result set is empty.");
        }
      }
    }
  });
  return sqlRet[0];
}
```

**showsql 함수**
```java
private String showsql(EntityManager entityManager, String question) {
  String sqlText = "select ai showsql " + question;
  final String[] sqlRet = new String[1];

  Session session = entityManager.unwrap(Session.class);
  session.doWork(connection -> {
    try (PreparedStatement preparedStatement = connection.prepareStatement(sqlText)) {
      try (ResultSet resultSet = preparedStatement.executeQuery()) {
        if (resultSet.next()) {
          sqlRet[0] = resultSet.getString(1);
          System.out.println(sqlRet[0]);

        } else {
          System.out.println("The result set is empty.");
        }
      }
    }
  });
  return sqlRet[0];

}
```

**runSQl**
```java
private String runSQl(EntityManager entityManager, String query) {
    ObjectMapper mapper = new ObjectMapper();
    Session session = entityManager.unwrap(Session.class);
    final ArrayNode resultArray = mapper.createArrayNode();

    session.doWork(connection -> {
      executeQueryAndConvertToJson(connection, query, resultArray);
    });

    return resultArray.toPrettyString();
  }
```

EnntityManager에서 제공되지 않는 Hibernate Session 객체를 통해서 직접 JDBC 연결을 위해 다음 코드가 사용되었습니다.
```java
Session session = entityManager.unwrap(Session.class);
...
session.doWork(connection -> {
```

**REST Controller**
```java
@PostMapping("/selectairag-chat/{type}")
  @Transactional
  public ResponseEntity<String> chat(@PathVariable("type") String responseType, @RequestBody String question) {
    // Set profile
    entityManager.createNativeQuery("BEGIN dbms_cloud_ai.set_profile(profile_name => 'GENAI_TEXT_TRANSFORMER'); END;")
        .executeUpdate();

    System.out.println(responseType);

    String json = "";
    String narrate = "";
    String sqlText = "";
    String plainText = "";
    question = question.replaceAll("[;?!\"\']", " ");

    try {
      // GET SQL
      sqlText = showsql(entityManager, question);
      System.out.println("sqlText: " + sqlText);
      // RUNSQL
      if ("runsql".equals(responseType)) {
        json = runSQl(entityManager, sqlText);
        plainText = convertJsonToList(json);
        return new ResponseEntity<>(plainText, HttpStatus.OK);

        // NARRATE
      } else if ("narrate".equals(responseType)) {
        narrate = getNarrate(entityManager, question);
        String jsonSingleResponse = new ObjectMapper()
            .writeValueAsString(Collections.singletonMap("answer", narrate));
        return new ResponseEntity<>(jsonSingleResponse, HttpStatus.OK);

        // SHOWSQL
      } else if ("showsql".equals(responseType)) {
        return new ResponseEntity<>("{\"answer\":\"" + sqlText + "\"}", HttpStatus.OK);

        // WRONG COMMAND
      } else {
        String error_message = "Wrong response type";
        String jsonResponse = "{\"ERROR\":\"" + error_message + "\"}";
        return new ResponseEntity<>(jsonResponse, HttpStatus.NOT_ACCEPTABLE);
      }
    } catch (Exception ex) {
      String jsonResponse = "{\"ERROR\":\"" + ex.toString() + "\"}";
      return new ResponseEntity<>(jsonResponse, HttpStatus.NOT_ACCEPTABLE);
    }
  }
```

세션마다 Profile이 필요하므로, 호출전에 Profile을 설정합니다.
```java
entityManager.createNativeQuery("BEGIN dbms_cloud_ai.set_profile(profile_name => 'GENAI_TEXT_TRANSFORMER'); END;")
        .executeUpdate();
```

## 실행
아래 명령어로 스프링부트 애플리케이션을 실행합니다.
```
$ mvn clean package -Dmaven.test.skip=true

$ mvn spring-boot:run
```

**실행 결과**
```
$ curl -X POST -d "OraBooster란 무엇인가요?" http://localhost:8080/api/v1/selectairag-chat/narrate

{"answer":"OraBooster는 차세대 우주 탐사를 지원하는 로켓 엔진입니다. 이 엔진은 높은 성능과 혁신적인 기술을 결합하여 인류의 우주 탐사를 가속화하는 것을 목표로 합니다. 핵심 기술은 '양자 다이내믹스 플라즈마 부스터'로, 양자 역학 원리를 활용하여 강력한 추력을 발생시킵니다. 또한, 엔진 외부에는 초경량, 초강도의 나노 섬유 소재가 사용되어 가혹한 우주 환경에서도 로켓을 보호합니다.\n\nSources:\n  - rocket.txt (https://objectstorage.ap-seoul-1.oraclecloud.com/n/apackrsct01/b/mybucket/o/rocket.txt)"}
```

## 참고
* https://medium.com/@corradodebari/oracle-autonomus-db-select-ai-and-spring-boot-to-talk-with-your-db-62594aaf141a
* https://github.com/corradodebari/microservices-datadriven
* https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3607&p210_wec=&session=107120778193762