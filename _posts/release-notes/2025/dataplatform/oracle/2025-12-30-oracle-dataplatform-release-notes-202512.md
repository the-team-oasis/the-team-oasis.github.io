---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "12월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2025년 12월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2025-dataplatform
tags:
  - oci-release-notes-2025
  - December-2025
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

---

## Manage workload resources using Database Resource Manager

* **Services:**  Autonomous Database Serverless
* **Release Date:** December 02, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-manage-workload-resources-using-db-resource-manager.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-manage-workload-resources-using-db-resource-manager.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database Serverless에 Database Resource Manager(DBRM) API 및 서브프로그램(cs_resource_manager)이 도입되었습니다. 이를 통해 다음과 같은 자원 제어가 가능해졌습니다

* 커스텀 소비자 그룹 생성
* 자원 사용 정책(쿼리 시간, CPU 제한 등) 정의
* 워크로드 우선순위 설정
* 세분화된 리소스 할당 규칙 적용

즉, 단순한 인스턴스 수준 리소스 관리가 아니라 쿼리/사용자/세션 단위로 세밀한 제어가 가능한 리소스 정책 설계가 가능해졌습니다.

* Database Resource Manager란?
  * Database Resource Manager(DBRM)는 Oracle Database의 내장 워크로드 리소스 제어 엔진입니다. 원래는 온프레미스나 전통적 Oracle Cloud DB에서 쿼리 우선순위, CPU/메모리 분배 정책 등을 통제하는 수단으로 쓰였습니다. Autonomous AI Database Serverless에 도입되면서 Cloud 네이티브 환경에서도 동일한 리소스 관리 패턴을 활용할 수 있게 되었습니다.
  * 이 기능은 특히 다음과 같은 상황에서 효과가 큽니다.
    * 테이블 간 대규모 데이터 스캔 작업과 사용자 쿼리 혼재
    * 비즈니스 크리티컬 vs 배치 분석 같은 우선순위가 명확히 다른 워크로드 동시 실행
    * SLA(Service Level Agreement)를 만족해야 하는 실시간 분석 시스템

### 주요 기능

1. cs_resource_manager API
    * cs_resource_manager 패키지를 통해 DBRM 정책을 생성/수정하고 활성화할 수 있습니다.
    * 예시:

        ```sql
        -- 소비자 그룹 생성
        BEGIN
        -- OLTP_HIGH
        CS_RESOURCE_MANAGER.CREATE_PLAN_DIRECTIVE(
            plan                 => 'OLTP_LH_PLAN',
            consumer_group       => 'OLTP_HIGH',
            comment              => 'OLTP high priority',
            shares               => 8,
            parallel_degree_limit=> 1
        );

        -- OLTP_LOW
        CS_RESOURCE_MANAGER.CREATE_PLAN_DIRECTIVE(
            plan                 => 'OLTP_LH_PLAN',
            consumer_group       => 'OLTP_LOW',
            comment              => 'OLTP low priority',
            shares               => 2,
            parallel_degree_limit=> 1
        );
        END;
        /

        -- Consumer Group Mapping (사용자 기반 매핑 예시)
        --  - APP_USER -> OLTP_HIGH
        --  - LH_USER  -> LH_BATCH
        BEGIN
            CS_RESOURCE_MANAGER.SET_CONSUMER_GROUP_MAPPING(
                attribute      => 'ORACLE_USER',
                value          => 'APP_USER',
                consumer_group => 'OLTP_HIGH');

            CS_RESOURCE_MANAGER.SET_CONSUMER_GROUP_MAPPING(
                attribute      => 'ORACLE_USER',
                value          => 'LH_USER',
                consumer_group => 'LH_BATCH');
        END;
        /
        ```

2. 세분화된 워크로드 제어
    * 소비자 그룹 기반 격리
        * 서로 우선순위가 다른 쿼리를 그룹으로 나눌 수 있습니다.
 * CPU/IO 할당 정책
        * 특정 그룹에 더 많은 CPU/IO 리소스를 보장하도록 정책을 구성할 수 있어, 비즈니스 크리티컬 쿼리의 성능 보장에 유리합니다.
 * 우선순위 기반 실행
        * 낮은 우선순위 작업은 리소스가 여유 있을 때만 실행되도록 조정할 수 있어, 혼잡한 시점에서도 운영 리소스가 보호됩니다.

---

## Provider Scoped Table Hyperlink

* **Services:**  Autonomous Database Serverless
* **Release Date:** December 09, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-provider-scoped-table-hyperlink.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-provider-scoped-table-hyperlink.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database Serverless 에서 제공하는 Table Hyperlink 기능은 생성자가 직접 링크를 만들어 공유하는 방식이었는데, 이제 Provider Scoped Table Hyperlink를 통해 권한 있는 주체(Provider)가 일정 범위(scope)를 선언함으로써 소비자(사용자/시스템)가 임의로 하이퍼링크를 생성할 수 있도록 허용할 수 있습니다.

즉, 수동으로 링크를 배포하지 않아도 권한이 부여된 범위(scope) 내에서 소비자가 직접 Table Hyperlink를 생성할 수 있게 되어, 협업/공유가 훨씬 간편하고 안전해졌습니다.

Provider가 다음과 같은 Scope 를 정의할 수 있습니다.

* 테넌시(Tenancy) 수준
* 컴파트먼트(Compartment) 수준
* 스키마(Schema) 수준
* 객체(Object) 수준

### 기능 사용 방법

1. Table HyperLink 권한 부여 방법

    ```sql
    GRANT EXECUTE ON DBMS_DATA_ACCESS_SCOPE TO DATA_OWNER;
    ```

2. Scope 등록

* 여러 Table Object 를 한번에 등록 예 (테넌시-MY$TENANCY, 컴파트먼트-MY$COMPARTMENT)

    ```sql
    BEGIN
    DBMS_DATA_ACCESS_SCOPE.REGISTER_CREATION_SCOPE(
        schema_name        => 'DATA_OWNER',
        schema_object_list => '["SALES_DATA","CUSTOMER_DATA","PRODUCT_DATA"]',
        scope              => 'MY$COMPARTMENT'
    );
    END;
    /
    ```

---

## Autonomous AI Database API for DynamoDB

* **Services:**  Autonomous Database Serverless
* **Release Date:** December 09, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-provider-scoped-table-hyperlink.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-provider-scoped-table-hyperlink.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database는 이제 DynamoDB API를 네이티브로 지원합니다.
즉, AWS DynamoDB용 클라이언트 코드, 도구, SDK를 활용해서 Autonomous Database Serverless에 데이터를 저장·조회·수정·삭제하는 것이 가능합니다. 이를 통해 기존 AWS DynamoDB 어플리케이션의 마이그레이션 비용 감소 및 기존 개발 패턴을 유지할 수 있는 장점이 있습니다.

### 주요 기능

1. 표준 DynamoDB API 지원 - 일반 DynamoDB 작업을 Autonomous AI Database에서 그대로 처리할 수 있습니다.
지원되는 주요 API/SDK 패턴 예시는 다음과 같습니다.
    * CreateTable — 테이블 생성
    * DeleteTable — 테이블 삭제
    * GetItem — 항목 조회
    * PutItem — 항목 저장
    * DeleteItem — 항목 삭제
    * Query / Scan — 데이터 검색

2. NoSQL 모델인 Key-Value 모델을 ADB 기능에 통합이 가능하게 되었습니다.

* Python 프로그램 예제

* Client 생성 (Endpoint 설정)
    
    ```python
    import boto3
    from botocore.config import Config

    OCI_REGION = "us-phoenix-1"
    DB_OCID = "ocid1.autonomousdatabase.oc1.phx.<...>"
    ACCESS_KEY_ID = "ak_<...>"
    SECRET_ACCESS_KEY = "<...>"
    
    ENDPOINT = f"https://dataaccess.adb.{OCI_REGION}.oraclecloudapps.com/adb/keyvaluestore/v1/{DB_OCID}"

    dynamodb = boto3.client(
        "dynamodb",
        region_name=OCI_REGION,
        endpoint_url=ENDPOINT,
        aws_access_key_id=ACCESS_KEY_ID,
        aws_secret_access_key=SECRET_ACCESS_KEY,
        config=Config(signature_version="v4"),
    )

    ```

* 테이블 생성 (CreateTable)
    ```python
    table_name = "customers"

    resp = dynamodb.create_table(
        TableName=table_name,
        AttributeDefinitions=[
            {"AttributeName": "pk", "AttributeType": "S"},
            {"AttributeName": "sk", "AttributeType": "S"},
        ],
        KeySchema=[
            {"AttributeName": "pk", "KeyType": "HASH"},
            {"AttributeName": "sk", "KeyType": "RANGE"},
        ],
        BillingMode="PAY_PER_REQUEST",
    )

    print(resp["TableDescription"]["TableStatus"])
    ```
* PutItem / GetItem
    ```python
    # PutItem
    dynamodb.put_item(
        TableName=table_name,
        Item={
            "pk": {"S": "CUST#1001"},
            "sk": {"S": "PROFILE"},
            "name": {"S": "Kim"},
            "tier": {"S": "gold"},
        },
    )

    # GetItem
    resp = dynamodb.get_item(
        TableName=table_name,
        Key={"pk": {"S": "CUST#1001"}, "sk": {"S": "PROFILE"}},
    )
    print(resp.get("Item"))
    ```

---

## Support for transportable tablespaces

* **Services:**  Autonomous Database Serverless
* **Release Date:** December 16, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-support-for-transportable-tablespaces.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-support-for-transportable-tablespaces.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
Autonomous AI Database Serverless는 이제 Transportable Tablespaces 기능을 통해 온프레미스 Oracle 데이터베이스나 OCI Oracle Base Database 에서 Autonomous AI Database 로 데이터와 메타데이터를 효율적으로 이동할 수 있게 되었습니다. 이 기능은 대량 데이터 이관 과정에서 다운타임 최소화와 운영 효율 향상을 목표로 합니다.

Transportable Tablespaces는 Oracle Database의 전통적인 기능으로, 전체 테이블스페이스를 통째로 이동할 수 있는 구조입니다.
이를 통해 대량 데이터를 빠르고 효율적으로 마이그레이션할 수 있습니다. 기존에는 Oracle DB 및 DBCS 환경에서 사용되던 기능이었지만, 이제 Autonomous Database Serverless 환경에서도 이를 지원합니다.

### TTS 적용 방법

* 전체 흐름 요약
    * Source DB(온프레/DBCS)
	    * self-contained 체크 (DBMS_TTS.TRANSPORT_SET_CHECK)
        * (최종) tablespace READ ONLY
        * Oracle 제공 Python 백업 유틸리티 실행 -> Data Pump로 메타데이터 export + RMAN tablespace 백업 + (필요 시 TDE wallet 포함) -> Object Storage에 metadata bundle(.tar) 업로드
    * Target ADB(Serverless)
        * 신규 ADB 프로비저닝 시 Transportable Tablespace metadata bundle URL(Object Storage URI) 입력하여 import
        * (Incremental인 경우: level 0는 프로비저닝 때만 적용, 이후 level 1은 “Migrate Data” 화면에서 순서대로 적용)

    * 제약 사항 : Target ADB로 TTS 반입은 신규 ADB 프로비저닝 시에만 지원


---

## Data Transforms enhancements

* **Services:**  Autonomous Database Serverless
* **Release Date:** December 23, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-data-transforms-enhancements-1.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-12-data-transforms-enhancements-1.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이번 업데이트를 통해 Data Transforms 도구의 운영·관리 기능을 강화했습니다. 특히 의존성 확인과 안전한 객체 삭제, Financials Cloud 커넥터 확장, 그리고 환경 간 디자인 객체 이동(Design Migration) 지원을 추가함으로써 데이터 통합·변환 워크플로우 관리 경험을 한층 개선했습니다.

### 주요 기능

1. 의존성 보기 및 안전한 객체 삭제 - Data Transforms에서 객체를 삭제하기 전, 해당 객체가 지금까지 어디에 사용되고 있는지를 사전에 파악할 수 있습니다.

    * Connections(연결) - 이 연결에 연계된 모든 데이터 엔티티도 함께 파악/삭제 가능
	* Schemas(스키마) - 해당 스키마와 연계된 모든 엔티티 일괄 처리
	* Data Loads - 로드 구성과 관련된 워크플로우 단계도 함께 삭제
	* Data Entities / Data Flows / Workflows - 참조 관계 기반 영향 객체 식별 및 삭제 -> 데이터 변환 설계 중 불필요 객체를 안전하게 제거하고, 의도치 않은 영향 발생을 예방할 수 있습니다.
    * 기존에는 객체 삭제 시 종속성 확인이 어렵고 오류가 발생하기도 했는데, 삭제 대상의 의존성과 영향 범위를 미리 확인해 주는 기능이 도입된 것입니다.
2. Oracle Financials Cloud 커넥터 확장
    * REST 기반 Financials Cloud API 방식 추가 -> Financials Cloud 연계 데이터 파이프라인 구축 시 보다 유연하고 표준화된 연결 옵션을 활용할 수 있습니다.
3. Design Migration 간소화
    * Data Transforms는 이제 다른 플랫폼(Data Transforms Marketplace) 에서 만든 디자인 객체 (예: Project / Data Flow / Workflow )를 Autonomous Database 기반 Data Transforms 인스턴스로 가져오는 기능을 지원합니다.
    * 이를 통해 여러 개발/테스트/운영 환경 간 설계 재사용이 쉬워졌습니다.
    * 객체를 수동으로 재작성할 필요가 줄어듦

---
