---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "11월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2025년 11월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2025-dataplatform
tags:
  - oci-release-notes-2025
  - November-2025
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

## Data Lake Accelerator
* **Services:**  Autonomous Database Serverless
* **Release Date:** November 04, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/data-lake-accelerator.html](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/data-lake-accelerator.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Lake Accelerator는 Oracle Autonomous AI Database(Serverless)에서 External (Object Store) 데이터 처리 성능을 대폭 향상시키기 위해 새로이 추가된 기능입니다. 객체 저장소에 저장된 대규모 데이터를 대상으로 한 스캔·쿼리 처리 속도와 확장성을 크게 개선할 수 있도록 설계되어 있습니다. Autonomous Database는 기본적으로 SQL 기반으로 데이터를 처리하지만, 대용량 외부 데이터(Parquet, ORC, Iceberg 등) 스캔 처리 시 단일 데이터베이스 리소스만으로는 응답 시간이 오래 걸릴 수 있습니다.
Data Lake Accelerator는 클러스터 기반의 확장 리소스를 활용해 이를 보완합니다.

### 주요 기능

1. 고성능 외부 데이터 처리 가속
    * Data Lake Accelerator는 Oracle이 관리하는 VM 클러스터에서 실행되며, Autonomous AI Database와 연동하여 외부 저장소(Object Store) 데이터를 스캔·처리할 때 추가 컴퓨팅 파워를 제공합니다. 쿼리 수요에 따라 자동으로 ECPU를 동적으로 할당하여 대규모 외부 데이터 스캔 처리 성능을 크게 향상시킵니다.  ￼
        * 필터링·프로젝션·압축 해제 같은 집약적인 스캔 작업을 병렬로 처리
        * 대규모 데이터 처리 속도 향상
        * 퍼포먼스가 중요한 레이크하우스 분석 및 데이터 파이프라인 성능 개선  ￼
2. 동적 확장 및 리소스 할당
    * Data Lake Accelerator는 쿼리 실행 중 필요한 만큼만 CPU 리소스를 할당합니다.
    * 리소스가 할당된 후 쿼리가 완료되면 자동으로 리소스가 해제되므로 비용 효율적인 운영이 가능합니다.
    * 기본 Autonomous Database 인스턴스 구성과는 별도로 사용자 요구에 맞춘 확장성 확보가 가능합니다.  ￼
3. 간단한 구성/관리
    * Data Lake Accelerator는 Autonomous Database의 툴 설정 메뉴 또는 인스턴스 생성·수정 화면에서 쉽게 설정/변경할 수 있습니다. 특별한 워크플로 변경 없이도 데이터 처리 성능을 개선할 수 있도록 설계되어 있습니다.  ￼
        * 인스턴스 생성/클론 시 간단한 옵션 설정
        * 실행 중 변경 가능
        * 기본값(예: 32 ECPU) 포함 다양한 구성 선택 가능  ￼
4. 유용하게 사용되는 Case
    * Data Lake Accelerator는 다음과 같은 시나리오에서 특히 강력합니다:
        * 대규모 외부 데이터 분석
            * Object Store에 저장된 Petabyte급 데이터에 대한 스캔·집계 쿼리 등을 빠르게 처리하고자 할 때 유용합니다.  ￼
        * Apache Iceberg 또는 외부 테이블 활용 분석
            * Iceberg 등 최신 개방형 테이블 포맷과 함께 사용하면, 레이크하우스 환경에서의 쿼리 성능을 크게 개선할 수 있습니다.
        * 비용 효율적인 확장
            * 필요 시에만 리소스가 자동 할당·해제되기 때문에, 비용 대비 성능을 최적화할 수 있습니다.  ￼

* Data Lake Accelerator 설정 화면
![DLAccelerator](/assets/img/dataplatform/2025/release_note/202512/06.oci_data_accelerator_01.png)


---

## Data Transforms enhancements
* **Services:**  Autonomous Database Serverless
* **Release Date:** November 11, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-11-data-transforms-enhancements-1.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-11-data-transforms-enhancements-1.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Autonomous Database Serverless의 Data Transforms는 데이터 통합 및 변환 워크플로우를 설계하고 자동화하는 도구입니다. 이번 업데이트에서는 SQL 기반 데이터 흐름 생성과 Materialized View 연계 지원이 추가되어 데이터 파이프라인 구축이 한층 강력해졌습니다.


### 주요 업데이트 및 기능

1. SQL 쿼리를 기반으로 데이터 플로우 자동 생성
    - 이전에는 시각적 캔버스에서 직접 노드를 연결하는 방식이 주를 이루었다면, 이제 SQL 문장으로 바로 데이터 흐름(Data Flow)을 생성할 수 있습니다.￼
    - SQL을 작성하면 Data Transforms가 내부적으로 SQL 파서(SQL Parser) 를 사용해 해당 SQL을 해석 데이터 흐름 그래프(Data Flow)로 변환
    - 디자인 캔버스에 시각적으로 표시까지 자동으로 처리해 줍니다.  ￼
    - 특히 복잡한 조인·필터링·집계 로직이 포함된 SQL을 시각적 데이터 흐름으로 빠르게 전환할 수 있어 개발 생산성, 재사용성, 유지보수 편의성 모두 향상됩니다.

    * SQL 쿼리 기반 데이터 플로우 예

        ```sql 
        create table DEMO_TARGET.SUB_QUANTITY
        (
        QUANTITY_SOLD NUMBER(10,2),
        PROD_SUBCATEGORY VARCHAR2(50 CHAR)
        )

        INSERT 
        /*+  APPEND PARALLEL  */ 
        INTO DEMO_TARGET.SUB_QUANTITY
        (
            QUANTITY_SOLD ,
            PROD_SUBCATEGORY 
        ) 
        SELECT 
        (SUM(SALES.QUANTITY_SOLD)) ,
        PRODUCTS.PROD_SUBCATEGORY  
        FROM 
        SH.SALES SALES  INNER JOIN  SH.PRODUCTS PRODUCTS  
            ON  SALES.PROD_ID=PRODUCTS.PROD_ID
        GROUP BY
        PRODUCTS.PROD_SUBCATEGORY  
        ```

    * 생성된 Data Flow
        ![OML-GIT](/assets/img/dataplatform/2025/release_note/202512/05.oci_data_transform_sql_flow.png)


2. Materialized Views 활용 지원
    - Data Transforms는 이제 Materialized View(물리화된 뷰)를 데이터 흐름 내에서 활용할 수 있습니다. 
    - Materialized View를 사용하면 다음 같은 이점이 있습니다:
        - 복잡한 변환 결과를 사전 계산·저장하여 성능 개선
        - 동일한 변환 식을 여러 흐름에서 재사용
        - 변환 결과를 물리화된 형태로 보존해 비용 절감 및 응답 속도 향상
    - JetStream 데이터 허브나 Analytics 데이터 마트 등에서 자주 볼 수 있는 패턴입니다.


---

## OML notebook and GitHub integration
* **Services:**  Autonomous Database Serverless
* **Release Date:** November 18, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-11-oml-notebook-github-integration.htm](hhttps://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-11-oml-notebook-github-integration.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database Serverless의 Oracle Machine Learning UI가 한 단계 강화되어, 이제 OML Notebook과 GitHub 저장소 간의 양방향 연동이 가능한 기능을 지원합니다. 

1. 주요 업데이트 요약
    * GitHub 저장소에서 노트북 직접 가져오기
    * GitHub에 있는 OML 노트북을 클론(복제)·가져오기를 할 수 있습니다.
    * 원본 저장소와 브랜치 구조를 유지하면서, 노트북을 Autonomous Database 환경으로 로컬 복사본으로 생성할 수 있습니다.
    * 단순 파일 다운로드가 아니라 Git 브랜치 메커니즘을 활용한 통합 방식입니다.  ￼
    * 개발 중인 분석 노트북을 중앙 GitHub 저장소에 관리하면서, Autonomous Database에서도 공유·재사용·버전 관리가 쉬워졌습니다.



2. GitHub 원격 변경사항 가져오기 / 반영하기
    * 노트북 편집기에서는 GitHub 저장소와 양방향 동기화가 가능합니다.
    * Pull changes
      * 원격 저장소에서 업데이트된 노트북을 가져옵니다.
    * Push & commit
      * 로컬에서 수정한 내용을 다시 GitHub 저장소로 커밋하고 업로드합니다.
    * 노트북 버전 관리가 UI 내에서 직접 가능해졌습니다.  ￼

3. GitHub 인증 정보 관리
    * GitHub 저장소와 상호 작용하려면 별도의 GitHub 자격 증명이 필요합니다.
      * 자격 증명은 Autonomous AI Database 내부에 생성·안전 저장됩니다.
      * 이를 통해 보안 위험을 줄이면서 GitHub과의 연동을 사용할 수 있습니다.

3. 업데이트를 통한 장점
    * 코드/노트북 버전 관리의 통합 - GitHub에 저장된 노트북을 별도 저장소에서 다시 업로드할 필요 없이 OML UI에서 바로 가져오고 커밋할 수 있습니다.
    * 협업 워크플로 향상 - 팀의 노트북을 GitHub로 공유할 때 발생하는 동기화 문제를 줄이고, 공동작업을 위한 중앙 저장소를 유지할 수 있습니다.
    * 개발자 친화적 환경 - 데이터 과학 프로젝트를 진행하면서도 GitHub 기반 CI/CD 워크플로 및 코드 품질 관리를 그대로 유지할 수 있습니다.

4. 주요 화면
    * OML 메인 화면
    ![OML-GIT](/assets/img/dataplatform/2025/release_note/202512/04.oci_oml_git_integration_04.png)
    * OML-Git 연계
    ![OML-GIT](/assets/img/dataplatform/2025/release_note/202512/03.oci_oml_git_integration_03.png)


---


## Chart support in Table Hyperlinks

* **Services:**  Autonomous Database Serverless
* **Release Date:** November 25, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-11-chart-support-in-table-hyperlinks.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-11-chart-support-in-table-hyperlinks.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Autonomous Database Serverless에 Table Hyperlinks 차트 보기(Chart View) 기능이 새롭게 도입되었습니다. 이 기능은 데이터를 단순한 테이블 형식으로 보는 것을 넘어, 차트로 시각화해 분석을 더 직관적으로 수행할 수 있게 해 줍니다.

### Table Hyperlink 기능

* 생성 예제 - SQL 함수 DBMS_DATA_ACCESS.CREATE_URL 호출

```sql
-- 생성 예
DECLARE
   status CLOB;
   column_lists CLOB;
   BEGIN
      DBMS_DATA_ACCESS.CREATE_URL(
          schema_name => 'ADMIN',
          schema_object_name    => 'TICKETS',
          expiration_minutes    => 3600,
          column_lists          => '{ "order_by_columns": ["TICKETID", "CUSTOMERID"] }',
          result                => status);
       dbms_output.put_line(status);
    END;
/

```

* Output 예제

```text
{
  "status" : "SUCCESS",
  "id" : "7qTfIJHpmMwI91j-uoc9r7omMIkYbBs-2WXOUq2rsVXrNrcp0fCwSl5RUcbocoHf",
  "preauth_url" : "https://dataaccess.adb.ap-osaka-1.oraclecloudapps.com/adb/p/g1DqkVYVyQUhTDMRjV0aVbpxfcp_yuh6n7hOBPFkhdvxMBopSw-iTk5PAGK7_DdM4krT5NIAtXE/data",
  "expiration_ts" : "2026-01-23T02:01:00.832Z"
}
```
* 생성 예제 화면

![Data_Access](/assets/img/dataplatform/2025/release_note/202512/01.oci_ad%20_data_access_01.png)



### 주요 업데이트

1. 차트 뷰로 데이터 시각화
    * Table Hyperlinks를 통해 웹 브라우저에서 데이터를 열람할 때, 기존의 표(Table) 형태뿐 아니라 다양한 차트 뷰로 시각적으로 분석할 수 있습니다.
2. 다양한 차트 타입 제공
    * 차트 뷰는 다음과 같은 여러 시각화 유형을 지원합니다. 이를 통해 데이터 간 비교나 분포 파악이 더욱 직관적으로 가능합니다.
      * 막대 차트 (Bar)
      * 선 차트 (Line)
      * 산점도 (Scatter)
      * 원형 차트 (Pie)
3. 차트 설정 커스터마이즈
    * 사용자는 차트 제목, 축 설정, 시리즈 구성 등 다양한 차트 설정을 사용자 정의할 수 있습니다. 특히 그룹화 기준이나 데이터 집계를 임의로 조정해 다양한 관점의 시각 분석이 가능합니다. 
4. 유연한 뷰 전환 및 테이블 옵션
    * 차트 보기와 표 보기 사이를 즉시 전환할 수 있으며, 메뉴 옵션을 통해 열 표시/숨김, 그룹 분할/합치기 등 데이터 표시 방식도 유연하게 조절할 수 있습니다.


* Data Accss 화면

![Data_Access](/assets/img/dataplatform/2025/release_note/202512/07.oci_data_access_table_view.png)


### 유용한 Case

* 비즈니스 리포트 분석: 데이터 테이블을 차트로 바로 볼 수 있어 보고서 검토 시간이 감소됩니다.
* 공유용 데이터 제공: 다른 팀원이나 외부 파트너에게 시각적으로 이해하기 쉬운 결과를 공유해야 할 때.
* 신속한 인사이트 도출: SQL 결과를 빠르게 시각화해 변화를 직관적으로 파악할 때.

Autonomous Database Serverless의 Table Hyperlinks 차트 보기 기능을 통해, 단순 데이터 제공을 넘어 데이터 시각화까지 웹 브라우저에서 바로 수행할 수 있게 되었습니다.

---

## Enhancements to GoldenGate features

* **Services:**  GoldenGate
* **Release Date:** November 25, 2025
* **Documentation:** [hhttps://docs.oracle.com/en-us/iaas/releasenotes/goldengate/zeroetl-xrdr.htm](https://docs.oracle.com/en-us/iaas/releasenotes/goldengate/zeroetl-xrdr.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle GoldenGate는 클라우드 네이티브 실시간 데이터 복제 및 스트리밍 서비스로, 다양한 데이터 소스 간 실시간 동기화를 지원해 데이터 통합, 고가용성 구성, 분석용 데이터 파이프라인 등을 구축할 수 있는 서비스입니다.

이번 2025년 11월 업데이트에서는 특히 분산 고가용성 강화, 운영 편의성 향상, 콘솔 기반 가이드 학습 등 고객이 실전 환경에서 안정적이고 쉽게 GoldenGate를 운용할 수 있도록 하는 기능 개선들이 포함되었습니다.

### 주요 기능 개선

1. Cross-Region Disaster Recovery 지원 - Cross-Region Disaster Recovery(크로스 리전 재해 복구) 를 공식 지원합니다.
    * 다른 리전 간 Peer Deployment 생성 가능 - 기존에는 단일 리전 내에서만 GoldenGate 배포 간 재해 복구 구성이 가능했으나, 이제는 주 리전 이외의 리전에서도 동등한 레벨의 복구 배포를 만들 수 있습니다.
    * 높은 장애 내성 구축 - 리전 전체 장애 상황에서도 다른 리전이 자동으로 대응할 수 있어 서비스 연속성과 복원력이 더욱 강화되었습니다.

2. 운영 편의성 & 리소스 관리 향상
    * 이번 업데이트는 관리 포털과 운용 경험을 개선해 운영자가 GoldenGate를 더 직관적으로 관리할 수 있도록 Guided Learning 기능을 제공합니다.

3. Guided Learning (가이드 학습 기능) - OCI GoldenGate 콘솔에 Guided Learning(가이드 학습) 체험이 추가되었습니다.
    * GoldenGate 서비스 개요 페이지와 배포 상세 페이지에 교육용 안내가 포함
    * 시작 단계에서 필수 설정 또는 최적 구성에 대한 설명을 바로 확인 가능
    * 콘솔 내에서 필요한 절차를 빠르게 파악할 수 있어 러닝 커브(Learning Curve) 감소

---
