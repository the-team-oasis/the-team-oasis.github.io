---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "4월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2025년 7월 OCI Oracle Data Platform 업데이트 소식입니다."
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

## Data Studio enhancements
* **Services:**  Autonomous Database Serverless
* **Release Date:** July 15, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-07-data-studio-enhancements-1.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-07-data-studio-enhancements-1.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database 의 Data Studio 가 새로운 기능과 변경 사항으로 업데이트되었습니다.

- Autonomous Database Data Studio 작업 기능
  ![ADBDS](/assets/img/dataplatform/2025/release_note/202510/oci_adb_data_studio.png)

- Data Studio 의 작업 기능을 사용하면 작업을 자동화하여 실행할 수 있습니다. 정해진 일정에 따라 프로세스를 실행하거나 특정 이벤트에 따라 프로세스를 트리거할 수 있습니다.

- 작업 기능을 사용하면 다음을 포함한 다양한 필수 작업을 자동화할 수 있습니다.
  - 데이터 로드: 데이터 로드 도구를 사용하여 데이터 세트를 가져오고 업데이트합니다.
  - 데이터 증강: Table AI Assist 도구를 사용하여 AI 기반 인사이트로 데이터를 강화합니다.
  - 데이터베이스 작업: PL/SQL 프로시저를 실행하여 백엔드에서 데이터를 유지합니다.
  - API 통합: REST 호출을 실행하여 외부 시스템에 연결하고 다양한 데이터 소스를 통합합니다.

- Data Load BICC Support
  - Data Studio 의 데이터 로드 Tool은 BICC(Business Intelligence Cloud Connector) 데이터를 지원합니다. BICC 콘텐츠를 Object Storage 로 내보내고 이 데이터를 자율 운영 데이터베이스에 손쉽게 로드하고 통합할 수 있습니다.

- Data Load Bulk Edit Wizard
  - 매핑 테이블의 대량 편집 설정을 사용하여 여러 열을 한 번에 업데이트할 수 있습니다. 특정 열을 빠르게 검색하고 창에서 선택한 모든 결과에 변경 사항을 적용할 수 있습니다. 대량 편집을 사용하면 다음과 같은 작업을 수행할 수 있습니다.
    - 전체 필드 그룹의 값 업데이트
    - 찾기 및 바꾸기 작업 수행
    - 대상 열 이름에 접두사 또는 접미사 추가
    - 대상 테이블에 데이터를 로드할 열을 쉽게 포함 또는 제외

- Table AI Assistant 개선 사항
  - 대화형 AI 기술이 적용된 Table AI Assist 도구를 사용하여 데이터와 상호 작용할 수 있습니다. 자연어 대화를 통해 데이터베이스를 손쉽게 쿼리하고 분석할 수 있습니다. 이 도구는 맥락을 이해하고 사용자의 질문에 맞춰 조정하며 정확하고 관련성 있는 답변을 제공합니다.

## Big Data Service 3.1.1 has added additional features
* **Services:**  Big Data
* **Release Date:** July 16, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/big-data/july2025-3-1-1.htm](hhttps://docs.oracle.com/iaas/releasenotes/big-data/july2025-3-1-1.htm){:target="_blank" rel="noopener"}

### Hadoop Ecosystem

Open Source Hadoop 은 Hadoop HDFS 및 관리를 위한 Open Source 진영의 다양한 Ecosystem 들이 있습니다. Ecosystem 을 이루고 있는 Tool 들을 역할에 맞는 솔루션을 사용함으로써 완전한 Big Data 시스템을 완성하게 됩니다.

  ![BDECO](/assets/img/dataplatform/2025/release_note/202510/oci_bigdata_hadoop_eco.png)

보다 자세한 내용은 아래 참조 불로그 글을 참조 바랍니다.
  - 참조 : [OCI Bigdata 소개](https://the-team-oasis.github.io/dataplatform/oracle-bigdata-service-overview/)

### 업데이트 내용

Big Data Service 3.1.1에는 다음과 같은 새로운 기능과 업데이트가 있습니다.

- 이제 자동 업데이트 알림을 구독하면 사용 가능한 Big Data Service 업데이트 알림을 자동으로 받을 수 있습니다. 알림 구독 및 필터를 생성할 수도 있습니다.
- 이제 Big Data Service BDS_CAPACITY_REPORT_CREATE API 명령 및 매개변수를 사용하여 용량 보고서를 생성할 수 있습니다.
- 이제 클러스터 세부 정보 페이지에서 Big Data Service 업데이트를 관리할 수 있습니다.
- OS 패치 API에 새로운 매개변수(isDryRun)가 추가되었습니다.
- Spark JDBC 드라이버가 버전 2.6.18.2058로 업그레이드되었습니다.
- Sqoop, Hadoop, HBase, Hive, Oozie, Livy, Flume 및 Spark 구성 요소에 대한 - Avro가 1.11.4로 업그레이드되었습니다.
- org.apache.hadoop.log.metrics.EventCounter는 Hadoop 3.4.1에서 제거되었으므로 hdfs-log4j에서도 제거되었습니다.
- Zookeeper 3.8.4는 log4j에서 logback으로 이동했습니다.
- 환경 템플릿 구성(예: *-env)은 더 이상 Ambari의 다음 구성 요소의 구성 페이지에 표시되지 않습니다. Ambari Metrics, Flink, Flume, HBase, Hive, Kafka, MapReduce, Oozie, Ranger, Spark, Sqoop, Tez, YARN, Zookeeper 서비스 환경을 관리하기 위한 새로운 전용 구성 속성으로 대체되었습니다.
  - 전용 구성 속성 예
  ![AMBARI-PROP](/assets/img/dataplatform/2025/release_note/202510/oci_bigdata_environment_prop.png)


## Resource Utilization Warning event
* **Services:**  Autonomous Database Serverless
* **Release Date:** July 29, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-07-resource-utilization-warning-event.htm](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2025-07-resource-utilization-warning-event.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database 에 ResourceUtilizationWarning 이벤트가 추가 되었습니다. ResourceUtilizationWarning 이벤트는 특정 임계값을 초과할 때 컴퓨팅 사용량, 스토리지 사용량 및 세션 수에 대한 경고로 생성됩니다. 이 이벤트는 ECPU 컴퓨팅 모델을 사용하는 자율 데이터베이스에 대해서만 생성됩니다.

- CPU : Autonomous AI 데이터베이스의 대기 세션 수가 컴퓨팅 할당량의 20%를 초과할 때.
- Storage : 데이터베이스의 스토리지 자동 확장이 비활성화되고 할당된 스토리지가 프로비저닝된 스토리지의 80%를 초과할 때.
- 데이터베이스의 스토리지 자동 확장이 활성화되고 할당된 스토리지가 프로비저닝된 스토리지의 80%를 초과할 때(기본 스토리지의 최대 3배).
- Session : Autonomous AI 데이터베이스의 동시 세션 수가 세션 한도의 80%를 초과할 때.
- CPU 및 Session Metric 의 경우, 이벤트는 Auto Scaling 이 활성화되어 있고 ECPU 수가 4보다 큰 경우 혹은 Auto Scaling 이 비활성화되어 있고 ECPU 수가 2보다 크거나 같은 경우.

위 조건이 충족되는 경우, ResourceUtilizationWarning 이벤트가 1시간에 한 번씩 생성됩니다.


---