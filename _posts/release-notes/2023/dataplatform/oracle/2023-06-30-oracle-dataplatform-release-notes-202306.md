---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "6월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 6월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Jun-2023
  - DATAPLATFORM, DATABASE, BIGDATA, DATAFLOW, SPARK, ORACLE, GOLDENGATE
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

## Big Data Service 3.0.22 has added additional features
* **Services:** Big Data
* **Release Date:** June 12, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/fed4eb15-b3a1-4505-a630-6b5f7d7c4716/](https://docs.oracle.com/iaas/releasenotes/changes/fed4eb15-b3a1-4505-a630-6b5f7d7c4716/){:target="_blank" rel="noopener"}

### 릴리즈 내용

BDS 3.0.22 릴리스에는 다음과 같은 새로운 기능이 추가되었습니다.

- Kafka 용 Cluster Profile 관리
- Big Data Service 에서 OCI 모니터링 서비스로 사용자 지정 메트릭 게시
- ODH 구성요소에서 remoteJMX 측정항목 관리
- Oozie (workflow job scheduler 엔진) 를 통해 Apache Trino 연결
- 인증서 만료일 모니터링
- Hive 성능 조정 지침
- ODH 와 BI 도구 연결 - OAC 를 Bigdata Service Cluster 와 연결

  - Cluster Profile 은 Hadoop Ecosystem 으로 추가로 설치될 Application 의 종류들이 정의된 Profile 을 의미
  - BigData Cloud Service Cluster Profile 에 추가된 Kafka profile
  ![OCI BDS Kafka]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/release_note/202305/03_oci_bigdata_kafka_cluster.png)

- OCI 에서는 Kafka 기술을 두가지 쓸 수 있게 되었습니다. 첫번째는 OCI Streaming 서비스에서 Kafka Cluster 를 Managed 서비스로 사용하실 수 있고, 두번째로 OCI BDS 에 추가된 Kafka Cluster 를 통해 Hadoop 기반의 Kafka Cluster 를 사용하실 수 있게 되었습니다.

또한 다음과 같은 버그/향상이 이루어졌습니다.

- Apache Hive 테이블 삭제 실패에 대한 수정 사항 발견
- 업데이트된 OCI 버킷 구문
- OCI HDFS 커넥터를 v3.3.4.1.0.0으로 업그레이드
- 부트스트랩 Python 스크립트 실행을 사용하여 암호 구성을 생성하기 위한 지원 활성화
- 부트스트랩 Python 스크립트 실행에서 사용자 지정 로거 도우미 기능 지원 활성화
- HBase 프로필의 비작업자 노드에서 HBase 지역 서버 시작 해결
- SSL/TLS 를 통해 통신하는 동안 취약한 암호를 비활성화하여 Trino 의 보안 문제를 수정
- 내보내기/가져오기 작업에 대한 기본이 아닌 ODH 서비스 수준 구성 분류
- SSL/TLS 를 통해 통신하는 동안 취약한 암호를 비활성화하여 Ranger 의 보안 문제를 수정
- HBase 클러스터를 개선하기 위한 통합 HBCK2 도구
- log4j 구성은 로그를 변경하여 최대 로그 크기를 100MB로 제한하고 최대 로그 인덱스를 10으로 제한 (Hive, HBase, Ambari 메트릭 수집기, Ranger 및 Kafka)
- 회전된 파일을 압축하기 위해 sys 로그에 대한 구성 변경 사항을 Logrotate 수행
- Zookeeper 키 저장소/신뢰 저장소 일반 텍스트 암호 보안 문제 해결


## Data Flow now supports Pools
* **Services:** Data Flow
* **Release Date:** June 21, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/fed4eb15-b3a1-4505-a630-6b5f7d7c4716/](https://docs.oracle.com/iaas/releasenotes/changes/fed4eb15-b3a1-4505-a630-6b5f7d7c4716/){:target="_blank" rel="noopener"}

### 릴리즈 내용

Data Flow Pool 은 더 빠른 시작 시간으로 Data Flow 기반 Spark Workload 를 실행하는 데 사용할 수 있는 사전 할당된 컴퓨팅 리소스 그룹입니다.

- 사용 사례:
  - 초 단위로 더 빠른 시작 시간이 필요한 많은 실행기가 있는 시간에 민감한 대규모 Production Workload.
  - 중요한 Production Workload 는 다른 풀에서 리소스를 할당할 수 있기 때문에 동적 개발 워크로드의 영항을 받지 않도록 구성
  - 특정 Data Flow 실행을 특정 Pool 에 제출할 수 있는 IAM 정책을 통해 개발 워크로드와 프로덕션 워크로드 간의 비용 및 사용량 분리
  - 적은 시작 시간으로 연속적으로 많은 수의 Data Flow Run 을 실행
  - Queuing Data Flow 리소스의 효율적인 사용 및 비용 제어를 위해 Pool 에서 실행
  - 일정에 따라 Pool 자동 시작 및 유휴 시간을 기준으로 자동 종료

- Data Flow Pool 화면
  ![OCI BDS Kafka]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/release_note/202305/04_oci_dataflow_pool.png)

## New Release for Database Management
* **Services:** Database Management
* **Release Date:** June 27, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/6b62b1e0-ea4c-4517-bc61-2cceba264d26/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/6b62b1e0-ea4c-4517-bc61-2cceba264d26/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 데이터베이스 관리를 위한 새 릴리스를 사용할 수 있습니다.

다음의 기능들이 강화되었습니다.

- 데이터베이스 관리에서 SPM(SQL Plan Management)을 사용하여 다음 작업을 수행할 수 있습니다.
  - SQL Plan baseline 을 관리
  - SQL Plan baseline 에 SQL 계획을 Load 하는 Job 을 제출
  - SQL Plan baseline, 자동 Plan 캡처 및 자동 SPM Evolve Advisor 작업 매개변수 활성화, 비활성화 또는 편집과 같은 구성 작업을 수행

- Query, DML 및 PL*SQL 유형 작업을 생성할 때 바인드 변수를 추가합니다. 바인드 변수가 SQL 문이 성공적으로 실행되기 위해 유효한 값으로 대체되어야 하는 자리 표시자로 사용되는 경우 이제 데이터베이스 관리에서 작업을 생성할 때 바인드 변수 값을 추가할 수 있습니다.

## Base Database: Ampere A1 flex shape
* **Services:** Database
* **Release Date:** June 28, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/da0af667-0922-43e3-949d-4360e571be5f/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/da0af667-0922-43e3-949d-4360e571be5f/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 DB 시스템에 Arm 기반 Ampere A1 Flexible Shape 을 사용할 수 있습니다. Flexible Shape 을 통해 인스턴스에 할당된 OCPU 수를 사용자 정의할 수 있습니다.

## Data Flow now Supports SQL Endpoints
* **Services:** Data Flow
* **Release Date:** June 28, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/8212e74f-e958-4646-8418-827ee03dd2f6/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/8212e74f-e958-4646-8418-827ee03dd2f6/){:target="_blank" rel="noopener"}

### 릴리즈 내용
Data Flow 에서 SQL Endpoint 를 지원합니다.

Data Flow Endpoint 는 
  - 데이터 레이크에 대해 직접 대화형 분석을 제공
  - 확장성, 구조화되지 않은 데이터의 쉬운 읽기 및 쓰기, 기존 데이터 흐름과의 상호 운용성을 위해 Spark 에 구축되었음
  - SQL을 사용하여 분석을 더 쉽게 만드는게 가능해짐
  - IAM 자격 증명으로 ODBC 또는 JDBC 연결을 사용하여 주요 비즈니스 인텔리전스(BI) 도구를 지원
  - Object Storage에 적재된 데이터를 가공용으로 사용. 데이터는 외부 데이터 소스 또는 클라우드 서비스에서 읽을 수 있음

---
