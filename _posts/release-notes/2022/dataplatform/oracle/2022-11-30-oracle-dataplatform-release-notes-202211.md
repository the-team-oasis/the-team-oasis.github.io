---
layout: page-fullwidth
#
# Content
#
subheadline: "Release Notes 2022"
title: "11월 OCI Oracle Data Platform 관련 업데이트 소식"
teaser: "2022년 11월 OCI Oracle Data Platform 관련 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2022-dataplatform
tags:
  - oci-release-notes-2022
  - November-2022
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


## New updates for BDS
* **Services:**  Big Data
* **Release Date:** Nov. 9, 2022
* **Documentation:**
[https://docs.oracle.com/en-us/iaas/releasenotes/changes/d1f6198a-4bf9-4e26-a612-b6022a627871/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/d1f6198a-4bf9-4e26-a612-b6022a627871/){:target="_blank" rel="noopener"}

### 서비스 소개
OCI BDS 는 OCI 가 제공하는 Big Data 를 위한 Managed Big Data Cluster 서비스입니다.

![](/assets/img/database/2022/05/05_oci_database_releasenote_bigdata_main.png)

자세한 Big Data 에 대한 서비스 소개는 아래 링크에서 자세히 소개되어 있습니다.

* [OCI Big Data 소개](/_posts/blog/dataplatform/2022-10-07-oracle-bigdata-service-overview.md)

### 신규 변경 사항

Big Data Service (BDS) 에 신규 업데이트가 반영되었습니다.

* ODH 가 2.0 으로 upgrade 되었습니다.
    * ODH 2.0 에는 다음의 서비스들이 업그레이드 되었습니다
        * Apache Hive 3.1.3
        * Apache Spark 3.2.1
        * Apache Hadoop 3.3.3
        * Trino 389
            ![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/01.oci-bigdata-01.png)
    * BDS Spark 서비스의 한 Part 로 Delta Lake 1.2.1 이 지원됨. Delta Lake는 BDS Spark 서비스용 클라우드 Object Storage 를 통해 ACID 지원 스토리지 계층을 제공합니다.

* Apache Flink 1.15.2 (스트리밍 프로세싱) 는 BDS cluster version 3.0.17 이상에서만 지원합니다.
* 기존 클러스터에 Edge 노드를 추가할 수 있습니다.

<br>

## Data Flow now Supports SCAN proxies
* **Services:**  Data Flow
* **Release Date:** Nov. 11, 2022
* **Documentation:**
[https://docs.oracle.com/iaas/releasenotes/changes/bd3fd4a0-34f4-4cd9-bb7b-f2b707d4ab0d/](https://docs.oracle.com/iaas/releasenotes/changes/bd3fd4a0-34f4-4cd9-bb7b-f2b707d4ab0d/){:target="_blank" rel="noopener"}

### 서비스 소개
OCI Data Flow는 Apache Spark ™ 애플리케이션을 실행하기 위한 완전 관리형 서비스입니다. 개발자가 애플리케이션에 집중할 수 있도록 하고 이를 실행할 수 있는 쉬운 런타임 환경을 제공합니다. 

![](/assets/img/database/2022/06/01_Data_Flow_Service_overview_1.png)

### 신규 변경 사항

Oracle DB 연결 Application 사용 시 SCAN 프록시 기능을 사용하여 Oracle RAC 환경에서 데이터베이스에 액세스할 수 있게 되었습니다.

![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/02.oci-data_flow-01.png)

<br>

## New Release for Data Integration (Security and bug fixes)
* **Services:**  Data Integration, Oracle Cloud Infrastructure
* **Release Date:** Nov. 14, 21, 2022
* **Documentation:**

    * [https://docs.oracle.com/iaas/releasenotes/changes/c92ee654-d42b-4132-ab90-c796002f847e/](https://docs.oracle.com/iaas/releasenotes/changes/c92ee654-d42b-4132-ab90-c796002f847e/){:target="_blank" rel="noopener"}

    * [https://docs.oracle.com/iaas/releasenotes/changes/264a831f-eff3-4463-869e-53da74973293/](https://docs.oracle.com/iaas/releasenotes/changes/264a831f-eff3-4463-869e-53da74973293/){:target="_blank" rel="noopener"}

### 서비스 소개
신규 버전의 Data Integration 이 출시가 되었습니다. 두번의 Security Fix 와 Bug Fix 가 반영된 신규 버전들이 출시 되었습니다.

### 신규 변경 사항
Bug Fix (Nov, 14, 2022)

- 작업 공간 생성 실패의 원인이 된 잠긴 시스템 계정 문제를 수정
- 보안 취약성 및 타사 종속성 준수와 관련된 문제를 수정
- 새 지역에 서비스를 배포할 때 내부 서비스 및 구성 요소에서 사용하는 AuthZ 버전을 업그레이드
- 일부 작업 공간에서 메타데이터 개체가 삭제되지 않는 플러그인 문제를 수정
- 스토리지 스테이징을 위해 사용자 지정 위치를 사용한 작업의 실행 실패 문제를 해결
- 다운스트림 SQL 작업이 업스트림 REST 작업의 JSON 출력 SYS.RESPONSE_PAYLOAD_JSON 및 SYS.RESPONSE_HEADERS_JSON을 사용할 때 파이프라인에서 실패한 SQL 작업 실행과 관련된 알려진 문제를 해결
- 삭제된 애플리케이션에서 작업 일정 ID를 검색할 때 오류 반환 코드를 수정
- 자율 데이터베이스 대상에서 데이터 엔터티 매개변수를 구성할 때 스테이징 위치를 설정할 수 없는 통합 작업 및 런타임 중에 문제를 수정
- 작업 공간 페이지에서 아이콘이 부적절하게 로드되는 문제를 해결
- 로드 유형이 단일 엔터티이고 소스가 BIP Fusion 애플리케이션인 경우 데이터 로더 작업에서 데이터 엔터티를 선택하고 변환 단계에서 데이터를 미리 보는 문제를 수정
- 개인 네트워크와 연결되어 있지만 VCN(가상 클라우드 네트워크) 및 서브넷 구성에 오류가 있는 작업 공간에서 워크플로 에이전트 풀을 고갈시킨 문제를 수정
- 서비스 상태 확인에 HTTP 포트를 사용하도록 되돌림
- 컨트롤 플레인 배포 실패 문제를 수정
- 여러 엔터티에서 여러 대상 엔터티로 소스 데이터를 로드할 때 데이터 로더 작업의 성능 문제를 수정
- Object Storage Parquet 데이터 자산의 데이터 엔티티에 대한 미리 보기 데이터 로드 실패와 관련된 알려진 문제를 해결

Bug Fix (Nov, 21, 2022)

- 보안을 강화하기 위한 지속적인 노력의 일환으로 스캐너에서 식별된 취약점 관련 문제를 수정
- 종속 구성 요소 및 라이브러리의 버전을 업데이트
- 식 연산자에서 구문 분석되는 계층적 데이터 유형이 있을 때 데이터 흐름 디자이너가 제대로 열리지 않는 문제를 수정
- Excel 소스 파일에서 레코드 읽기가 불완전한 문제를 수정
- 시스템에 자격 증명 파일이 누적되어 작업 영역을 시작할 때 발생하는 오류를 해결

## Data Flow Integration with Data Science is now Available
* **Services:**  Data Flow
* **Release Date:** Nov. 16, 2022
* **Documentation:**
[https://docs.oracle.com/iaas/releasenotes/changes/0f097497-c957-4f9b-a5aa-98df6a8c286a/](https://docs.oracle.com/iaas/releasenotes/changes/0f097497-c957-4f9b-a5aa-98df6a8c286a/){:target="_blank" rel="noopener"}

### 서비스 소개
OCI Data Flow 가 Data Science 를 통해서 손쉽게 클러스터를 생성하고, 쿼리할 수 있도록 연계가 되었습니다.


### 신규 변경 사항

Data Science 와 Data Flow 통합은 완전히 관리되는 Jupyter 노트북을 사용하여 데이터 과학자와 데이터 엔지니어가 데이터 엔지니어링 및 데이터 과학 애플리케이션을 생성, 시각화, 협업 및 디버그할 수 있도록 합니다. Python, Scala 및 PySpark에서 이러한 애플리케이션을 작성할 수 있습니다. Data Science 노트북 세션을 Data Flow에 연결하여 애플리케이션을 실행할 수도 있습니다. Data Flow 스튜디오 Kernal 및 애플리케이션은 Oracle Cloud Infrastructure Data Flow에서 실행됩니다.

* Data Sicence notebook - Data Flow 연계 흐름도

![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/03.oci-data_flow-data_science-integration.png)

* Data Science notebook 의 Conda Environment 세팅

![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/04.oci-data_flow-data_science-integration-2.png)

* Data Science notebook session 에서 Data Flow Spark Cluster 생성 요청

![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/05.oci-data_flow-provisioning.png)

* Data Flow 의 Data Source 인 Object Storage 의 CSV 파일을 SQL 로 쿼리

![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/06.oci-data_flow-object-storage-query.png)

<br>

## Media Flow now supports Oracle Cloud Infrastructure Logging
* **Services:** Media Flow
* **Release Date:** Nov. 23, 2022
* **Documentation:**
[(https://docs.oracle.com/iaas/releasenotes/changes/2b2a85a0-7820-4d8e-a166-d68671292d4e/]((https://docs.oracle.com/iaas/releasenotes/changes/2b2a85a0-7820-4d8e-a166-d68671292d4e/){:target="_blank" rel="noopener"}

### 서비스 소개
OCI Media Service 는 미디어(비디오) 소스 콘텐츠를 처리하기 위한 완전 관리형 서비스입니다.
Media Flow 는 OCI Object Storage 서비스의 Object Storage 버킷을 input source 로 사용하고 지정된 트랜스코딩 작업을 수행하여 객체 스토리지 버킷에 ABR 패키지를 생성합니다. OCI Media Streams 를 사용하여 스트리밍된 VOD(주문형 비디오)로 OCI Media Flow 의 output 을 전달할 수 있습니다.

![](/assets/img/database/2022/07/01_architecturediagram_medserv_1.png)


### 신규 변경 사항

Media Flow를 사용하면 Oracle Cloud Infrastructure Logging을 사용하여 Media Workflow 작업에 대한 실행 로그를 제공할 수 있습니다. 

![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/07.oci-media_flow-log.png)

<br>

---
