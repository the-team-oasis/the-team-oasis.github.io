---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "5월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 5월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - May-2023
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


## Media Streams now supports Monitoring
* **Services:** Media Streams
* **Release Date:** May 9, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/5912c874-22a8-4e42-9256-887b53e3751b/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/5912c874-22a8-4e42-9256-887b53e3751b/){:target="_blank" rel="noopener"}

### 릴리즈 내용

Oracle Cloud Infrastructure Media Streams 리소스는 이제 메트릭을 Monitoring으로 내보낼 수 있게 되었습니다.

- Media Streams Monitoring Matrics
  - Media Playlist Requests
  - Total Playlist Egress Data
  - Media Edge Requests
  - Total Edge Egress Data
  - Media Origin Requests
  - Total Origin Egress Data

    - Matrics 화면

    ![OCI GoldenGate]({{site.urlblogimg2023}}/assets/img/dataplatform/2023/release_note/202305/01_oci_media_streams_metrics.png)


## Big Data Service 3.0.21 has added additional features
* **Services:** Big Data
* **Release Date:** May 16, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/db44ed3f-3e13-40d5-bb7a-9d502fc58361/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/db44ed3f-3e13-40d5-bb7a-9d502fc58361/){:target="_blank" rel="noopener"}

### 릴리즈 내용

BDS 3.0.21 릴리스에는 다음과 같은 새로운 기능이 추가되었습니다.

- 클라이언트 간에 메타데이터 정보를 저장하고 교환하는 포괄적인 방법을 제공하는 Oracle Distributed Hadoop 에 포함된 Schema Registry
- Ambari 구성을 업데이트하기 위한 Python 스크립트 기반 Bootstrap Helper 기능 포함
- Presto (Trino) 를 BI 도구에 연결
- dcli 구문 옵션 -C 호스트 파일 이름 업데이트
- 오브젝트 스토리지 통합
- BDS Cluster 에서 Hive ACID 속성 활성화

  - Ambari 에서 Presto (Trino) 연결 화면
  ![OCI Bigdata]({{site.urlblogimg2023}}/assets/img/dataplatform/2023/release_note/202305/05_oci_bigdata_trino.png)  
  - Presto (Trino) 화면
  ![OCI Bigdata]({{site.urlblogimg2023}}/assets/img/dataplatform/2023/release_note/202305/06_oci_bigdata_presto_trino.png)  

또한 다음과 같은 버그/향상이 이루어졌습니다.

- 모든 서비스를 ODH 1.0에 추가할 때 Flink 확인 실패 문제 수정
- HMaster 로그가 비어 있는 문제가 수정됨 (두 HMaster가 모두 대기 상태에 있는 경우 포함)
- NameNode HA와 함께 작동하도록 Hue를 지원 (기본적으로 Hadoop HttpFs 구성)
- 기본적으로 Spark 동적 할당을 활성화하도록 수정됨
- Hue Metastore Manager 및 Hive Editor 에서 사용자에게 권한이 없는 테이블을 표시
- Big Data Service 클러스터를 생성할 때 안정성 개선
- 동일한 Active Directory를 가리키는 Big Data Service 클러스터를 생성하는 동안 Principal 이름 충돌을 방지하기 위해 수정됨
- 인증서 common 이름에 많은 수의 호스트를 허용하도록 Ranger DB 스키마를 수정
- Ambari mpack SPARK3 서비스 추천자 개선
- 노드당 디스크 수로 구성된 기본 Yarn 애플리케이션의 Localized 된 파일 디렉터리
- Oozie를 통해 Trino 작업을 제출하는 기능
- JupyterHub 에서 Trino 쿼리를 실행하려면 Python 3.6 이상에서 Trino 패키지를 설치


## Base Database: Enhanced controls to configure automatic full (L0) and incremental (L1) backups
* **Services:** Database
* **Release Date:** May 17, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/407c1d76-a3c1-4350-94f7-a4b6ce6de2f8/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/407c1d76-a3c1-4350-94f7-a4b6ce6de2f8/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 데이터베이스 Backup 에 향상된 Control 을 사용할 수 있습니다. 향상된 Control 을 사용하여 다음을 수행할 수 있습니다.

- 초기 L0 백업을 즉시 시작할지 아니면 일정에 따라 시작할지 지정
- 향후 전체 백업을 시작할 기간을 선택
- 증분 백업을 시작할 Time Window 를 선택. 이 Time Window 는 L0 백업의 Time Window 와 다를 수 있음.
- Time Window 는 2시간 일정 Window 와 기본 6 시간 Window 로 동일하게 유지
  - DBCS 자동 백업 구성 화면
    ![Database backup]({{site.urlblogimg2023}}/assets/img/dataplatform/2023/release_note/202305/02_oci_database_backup.png)

## New Release for Data Integration
* **Services:** Database
* **Release Date:** May 30, 2023
* **Documentation:** [hhttps://docs.oracle.com/en-us/iaas/releasenotes/changes/e57c8966-8ff2-4246-8d16-6c9b0797c58c/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/e57c8966-8ff2-4246-8d16-6c9b0797c58c/){:target="_blank" rel="noopener"}

### 릴리즈 내용

Data Integration 의 새로운 Release 를 사용할 수 있습니다.

- BICC 소스에서 점진적으로 로드할 때 사용자 정의 마지막 추출 날짜 또는 데이터 통합 관리 날짜 중에서 선택 가능하게 됨
- Data Loader Task 에서 Source 및 Target 에 대한 다음과 같은 매개변수 사용 가능
  - Data asset, Connections, Schema 또는 Bucket 을 매개변수화
  - 로드 유형이 단일 엔터티인 경우 데이터 엔터티를 매개 변수화
  - Target 에서 동일한 유형의 리소스에 대한 매개변수로 Source 매개변수를 재사용
  - Source 에서 동일한 유형의 리소스에 대한 매개변수로 Target 매개변수를 재사용
- 로드 유형이 여러 엔터티인 경우 Data Loader Task 에서 오브젝트 스토리지 Target 에 대한 단일 파일로 출력을 생성
- 기본 Data Flow 의 Target 데이터 엔터티가 매개 변수화되고 병합이 통합 전략으로 설정된 경우 디자인 타임 및 런타임에 통합 작업에서 병합 키 선택을 변경. 이후에도 다음 단계에서 병합 키 업데이트 가능
  - Pipeline 에서 통합 작업을 사용하는 Pipeline 디자인 타임과 파이프라인 작업을 실행하는 Runtime 에 업데이트 가능.
  - 통합 및 Pipeline 작업에 대해 생성된 작업 일정에서 업데이트 가능.
- 게시된 작업 외에 디자인 타임 작업을 Pipeline에 추가 가능
- 애플리케이션에 작업을 게시할 때 Data Asset 연결의 유효성 검사를 건너뛰도록 선택 가능.
- 푸시다운을 지원하는 관계형 데이터 시스템과 관련된 작업 실행의 성능 향상을 확인하십시오.

---
