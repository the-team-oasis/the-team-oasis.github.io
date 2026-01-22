---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "10월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2025년 10월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2025-dataplatform
tags:
  - oci-release-notes-2025
  - October-2025
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

## Oracle Autonomous AI Database
* **Services:**  Autonomous Database Serverless
* **Release Date:** October 14, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-oracle-autonomous-ai-database.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-10-oracle-autonomous-ai-database.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle은 2025년 Oracle AI World에서 최신 데이터베이스 릴리스인 Oracle AI Database 26ai를 발표했습니다. 본 버전은 기존 Oracle Database 23ai를 대체하는 장기 지원(Long-Term Support) 버전으로, AI 기능을 데이터베이스 코어에 깊숙이 통합해 AI-for-Data 혁신을 실현하는 데 초점을 맞췄습니다.

### 핵심 업데이트 포인트

* AI를 코어로 내장한 데이터베이스: AI 기능이 단순한 애드온이 아닌 데이터 관리 코어에 설계됨.
* Oracle Database 23ai 대체: 23ai에서 쉽게 전환 가능하며 별도의 업그레이드나 애플리케이션 재인증이 필요 없음.
* AI 기능 포함 비용 없음: AI Vector Search 등 주요 AI 기능이 추가 비용 없이 제공됨.
* 멀티클라우드 & 온프레미스 지원: Oracle Cloud, AWS, Azure, Google Cloud 및 온프레미스 환경에서 사용 가능.

### 주요 기능

1. AI-for-Data 통합 플랫폼
    * AI Vector Search: 벡터 기반 검색을 통합해 구조화/비구조화 데이터를 넘나드는 검색 및 분석 지원.
    * Agentic AI 내장: 사전 구성된 AI 에이전트 및 노코드 시각 플랫폼 제공으로 AI 워크플로우 구축과 자동화가 쉬움.
    * AI 워크플로우: 데이터베이스 내에서 프라이빗 데이터 + 공개 정보 결합 AI 분석 가능.
    * 고급 보안: NIST 표준의 양자 내성 암호화로 데이터 보호를 강화.

2. Enterprise Level 확장 기능
    * Oracle Autonomous AI Lakehouse: Apache Iceberg 기반 데이터 레이크 + 분석을 결합, 대규모 AI/분석 워크로드 실행.
    * 하이브리드 벡터 검색: 텍스트, 이미지, 구조화 데이터 등 다양한 데이터 유형을 결합한 AI 검색.
    * 데이터 프라이버시 및 거버넌스: 데이터 접근 정책, 마스킹, 셀 수준 보호 등 프라이버시 기능 포함.

3. 애플리케이션 및 개발자 생산성 기능
    * 데이터 주석(Annotations): AI가 데이터 의미를 이해하도록 돕는 메타데이터 추가 지원.
    * 통합 데이터 모델: 관계형, JSON, 그래프 모델을 단일 플랫폼에서 다룸.
    * Select AI Agent / APEX AI Application Generator: 애플리케이션 개발 가속 및 자연어 기반 앱 생성 도구 제공.

4. 성능 및 운영 혁신
    * Exadata for AI: Exadata 플랫폼을 통한 AI 쿼리 가속 및 고성능 실행.
    * AI-Accelerated Workloads: NVIDIA 통합 지원으로 RAG 및 벡터 처리 가속화.
    * Zero-ETL + 글로벌 분산: 데이터 이동 없이 AI 적용, 다중 지역/다중 환경에서 동작.

Oracle AI Database 26ai는 AI와 데이터가 완전히 결합된 차세대 데이터베이스입니다.
기존 Oracle Database의 안정성과 성능을 유지하면서, AI 기능을 데이터베이스 코어에 통합하여 AI 분석, 에이전트 자동화, 멀티클라우드 운영, 데이터 거버넌스까지 아우르는 AI-for-Data 플랫폼으로 진화했습니다.

이번 릴리스는 단순 기능 추가가 아닌, <mark> AI를 데이터 관리의 중심에 놓는 Oracle의 전략적 전환점으로 평가됩니다.</mark>

---

## Automatic caching for external tables
* **Services:**  Autonomous Database Serverless
* **Release Date:** October 21, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-10-automatic-caching-for-external-tables.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-10-automatic-caching-for-external-tables.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database 의 외부 테이블 캐시를 사용하면 데이터베이스의 외부 테이블에서 자주 액세스하는 데이터를 캐시할 수 있습니다.

외부 테이블 캐싱에는 정책 기반 또는 자동 캐싱 방식 중 하나를 선택할 수 있습니다. 정책 기반 관리를 사용하면 캐시 생성, 데이터 입력, 새로 고침 및 삭제 방식을 정의하여 캐시 내용과 수명 주기를 정밀하게 제어할 수 있습니다. 자동 캐싱을 사용하면 데이터베이스가 외부 테이블 캐시의 생성, 데이터 입력, 새로 고침 및 삭제를 포함한 전체 캐시 수명 주기를 관리합니다.

### 외부 테이블 캐시(External Table Cache)란?

Oracle Autonomous AI Database(26ai 이상)에서는 외부 테이블 캐시 기능을 통해 외부 저장소(Object Store)에 있는 데이터를 데이터베이스 내부에 캐시로 저장할 수 있습니다. 외부 테이블은 Object Store에 있는 파일을 SQL로 조회할 수 있게 해주지만, 매번 외부에서 데이터를 가져오기 때문에 성능이 느릴 수 있습니다. 이러한 반복 I/O 비용을 줄이고 쿼리 성능을 크게 향상시키기 위해 외부 테이블 캐시를 도입했습니다.

### 주요 장점

1. 쿼리 성능 향상
    * 자주 조회되는 외부 테이블 데이터를 데이터베이스 캐시에 저장함으로써, 외부 Object Store를 거치지 않고 빠르게 접근할 수 있습니다. -> 반복되는 분석(Query) 작업, 대시보드, 리포트 등에 특히 유리합니다.  ￼
2. 애플리케이션 변경 불필요
    * 기존 SQL이나 BI 도구에서 외부 테이블을 조회하는 방식을 전혀 변경할 필요가 없습니다.투명하게 캐시가 적용되어 성능 향상 효과를 얻을 수 있습니다.
3. 클라우드 비용 절감
    * 멀티 클라우드·리전 간 외부 데이터를 반복적으로 조회하는 비용(데이터 송신 비용)을 줄여줍니다. -> 데이터 접근 비용 절감 효과가 있습니다.
4. 세밀한 캐시 제어
    * 전체 파일 또는 일부만 캐시 가능
    * 가장 최신 데이터만 캐시할 수도 있음
    * 캐시 크기·할당량 제어 가능

### 캐시 생성 및 관리 방식

외부 테이블 캐시는 스키마 객체처럼 관리되며, 다음과 같은 방법으로 생성할 수 있습니다.

* Policy-based Cache : 직접 원하는 파일·대상만 선택하여 세밀하게 캐시 생성
* Automatic Cache : 데이터베이스가 자동으로 쿼리 패턴을 분석해 필요 시 캐시 생성

* 예시 : 다음은 SALES 스키마의 외부 테이블에 대해 캐시를 생성하는 코드입니다.

```sql
BEGIN
  DBMS_EXT_TABLE_CACHE.CREATE_CACHE (
    owner      => 'SALES',
    table_name => 'STORE_SALES',
    partition_type => 'PATH'
  );
END;
/
```

### 지원 파일 포맷

외부 테이블 캐시는 다음과 같은 파일 포맷을 지원합니다.

* Parquet
* ORC
* AVRO
* CSV
* Iceberg 테이블

---

## Connections with Resource Principal are Available in Database Tools (Identity)

* **Services:**  Database Tools
* **Release Date:** October 28, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/database-tools/resource-principal.htm](https://docs.oracle.com/en-us/iaas/releasenotes/database-tools/resource-principal.htm){:target="_blank" rel="noopener"}



### 업데이트 내용

Database Tools에서 생성하는 Database Connection 에 대해 이제 Resource Principal / IAM (Identity) 자격 증명으로 데이터베이스 비밀번호 및 연결 월렛 정보를 안전하게 받아올 수 있습니다.  ￼
기존에는 사용자가 OCI 로그인 자격으로 비밀번호·월렛 정보를 읽어왔지만, 이제는 연결 리소스 자체가 자격 증명을 갖고 요청을 수행하므로 보안과 자동화가 향상되었습니다.

### 주요 기능

Resource Principal 은 다음 구성 요소를 통해 작동합니다.

* Resource Principal Credential - 리소스에게 부여되는 임시 인증 토큰과 자격 증명.
* Dynamic Groups & IAM 정책 - 리소스가 어떤 OCI (예: Vault Secret) 에 접근할지 정의하는 권한 정책.

즉, Database Tools 연결 리소스를 동적 그룹에 포함시키고, 정책을 통해 Secrets 접근 권한을 승인하면,
그 연결 리소스는 자격 증명을 받아 데이터베이스 접속에 필요한 Password/Wallet 정보를 자체적으로 가져올 수 있습니다. 

Resource Principal Credential 사용 Case

* CI/CD 파이프라인 또는 자동화된 배치 작업에서 데이터베이스 연결을 안전하게 관리하고 싶을 때
* 사용자 계정이 아닌 시스템·서비스 아이덴티티로만 동작하는 서비스 연결 구축
* Vault 등의 Secret 저장소와 연동하여 최소 권한·보안 중심 구조를 만들고자 할 때

### 설정 방법

콘솔에서 Connection 만들 때 Advanced Options -> Runtime identity에서 Resource principal을 선택해야 '연결 리소스가 Secret/Wallet을 가져오는' 구조가 됩니다.

- DB Connection - Resource Principal 사용 설정 <br>
  ![Resource_Config](/assets/img/dataplatform/2025/release_note/202510/oci_db_tool_connection.png)

- DB Connection - Authenticated Principal (Identity) 사용 설정 <br>
  ![Resource_Config](/assets/img/dataplatform/2025/release_note/202510/oci_db_tool_connection_02.png)


---