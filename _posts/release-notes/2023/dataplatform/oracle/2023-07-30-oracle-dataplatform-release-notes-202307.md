---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "7월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 7월 OCI Oracle Data Platform 업데이트 소식입니다."
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

## GoldenGate now supports OCI Logging
* **Services:** GoldenGate
* **Release Date:** July 10, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/20fe56fb-c049-49e0-be27-2a43b5a0fb2c/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/20fe56fb-c049-49e0-be27-2a43b5a0fb2c/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 각 OCI GoldenGate 배포에 대해 프로세스 및 오류 로그를 활성화할 수 있습니다.

- Log 를 사용하기 위해서는 OCI Logging 서비스에 Resource Log 를 활성화해야 합니다.

  ![OCI OGG Logging](/assets/img/dataplatform/2023/release_note/202306/01_oci_goldengate_log.png)

- Log Enable 시 Log Group 과 Retention 을 지정해 줍니다.

  ![OCI OGG Logging](/assets/img/dataplatform/2023/release_note/202306/02_oci_goldengate_log_enable.png)

- OCI GoldenGate 의 Deployment Detail 메뉴에서도 Log 를 Enable 할 수 있습니다.

  ![OCI OGG Logging](/assets/img/dataplatform/2023/release_note/202306/03_oci_goldengate_log_enable_03.png)

- 해당 Log 의 Explore Log 를 살펴보면 OCI GoldenGate 가 처리하면서 발생한 로그들을 확인할 수 있게 됩니다.

  ![OCI OGG Logging](/assets/img/dataplatform/2023/release_note/202306/04_oci_goldengate_process_logs.png)

## Test connections in GoldenGate
* **Services:** GoldenGate
* **Release Date:** July 19, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/20fe56fb-c049-49e0-be27-2a43b5a0fb2c/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/20fe56fb-c049-49e0-be27-2a43b5a0fb2c/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 Oracle Cloud 콘솔의 배포 및 연결 세부 정보 화면에서 소스 및 대상 DB 및 Bigdata 시스템들에 대해 연결을 테스트할 수 있습니다.

- Assigned connections 메뉴에서 해당 DB 에 대해 Test Connection 수행

  ![OCI OGG Logging](/assets/img/dataplatform/2023/release_note/202306/05_oci_goldengate_test_connection.png)


## Data Flow now supports GPU shapes
* **Services:** Data Flow
* **Release Date:** July 20, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/abefae43-a0dc-4d3d-8490-413505e21156/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/abefae43-a0dc-4d3d-8490-413505e21156/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 Data Flow를 사용하여 드라이버 및 실행기의 GPU Shape 을 선택할 수 있습니다.
Data Pipeline 구축을 위해 NVIDIA의 Spark RAPIDS 가속기는 데이터 흐름의 ETL 속도를 투명하게 높이고 가격 대비 성능을 최적화합니다. 코드 변경 없이 GPU에서 기존 Data Flow Spark 애플리케이션을 실행하여 NVIDIA RAPIDS (RAPIDS Accelerator for Apache Spark leverages GPUs) 가속의 이점을 활용할 수 있게 되었습니다.

- GPU Performance Benefit
  ![OCI Data Flow](/assets/img/dataplatform/2023/release_note/202306/06_dataflow_GPU_benefit.png)


- OCI Data Flow 지원 GPU Shape

    - The minimum Spark version to run GPU shapes on Data Flow is Spark 3.2.1.
      ![OCI Data Flow](/assets/img/dataplatform/2023/release_note/202306/07_dataflow_GPU_shapes.png)

## Exadata Database on Dedicated Infrastructure, Base Database: Restore a backup to create a database across availability domains within the same region
* **Services:** Database
* **Release Date:** July 26, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/dd5c37d9-4ed3-4770-b58d-94d9a3f51292/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/dd5c37d9-4ed3-4770-b58d-94d9a3f51292/){:target="_blank" rel="noopener"}

### 릴리즈 내용

기존의 Object Storage 에 저장된 백업 또는 Autonomous 로 생성된 백업을 사용하여 동일한 Region 내 다른 가용성 도메인에서도 새 데이터베이스를 생성(다른 위치 복원)할 수 있도록 개선되었습니다.

- Create from Backup 화면

  ![OCI OGG Logging](/assets/img/dataplatform/2023/release_note/202306/08_database_backup_restore.png)

## Copy backups in GoldenGate
* **Services:** GoldenGate
* **Release Date:** July 27, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/dd5c37d9-4ed3-4770-b58d-94d9a3f51292/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/dd5c37d9-4ed3-4770-b58d-94d9a3f51292/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 배포 백업을 Object Storage 버킷에 복사할 수 있습니다.

- 백업 복사 화면

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202306/09_oci_goldengate_copy_01.png)

- Object Storage 로 복사

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202306/10_oci_goldengate_copy_02.png)


## Big Data Service 3.0.23 has added additional features
* **Services:** Big Data
* **Release Date:** July 28, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/4cdefe62-2b36-4006-ba41-0ca8f6d8fb85/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/4cdefe62-2b36-4006-ba41-0ca8f6d8fb85/){:target="_blank" rel="noopener"}

### 릴리즈 내용

BDS 3.0.23 릴리스에는 다음과 같은 새로운 기능이 구현되었습니다.

- Trino CLI에 액세스하기 위한 명령이 업데이트 됨
- 인증서 이벤트 유형이 추가됨
- 새로운 Bootstrap 스크립트 이벤트 유형이 추가됨
- 기존 Kafka 브로커에서 새로 생성된 브로커에 데이터를 추가하기 위한 Kafka 재조정 도구가 추가됨

추가적으로 다음의 Bug 및 Enhancement 가 반영되었습니다.

- Added fix to read data from Object Storage with no job failures.
- Enabled running the HBCK addFsRegionsMissingInMeta tool from the region server.
- Fixed Kafka log lock issue that affected Kafka broker restart.
- Updated zk quorum in Kafka if ZooKeeper server is added or deleted.
- Fixed issue where Kafka service required restart when adding or removing Kafka broker.
- Fixed issue related to name node move operation.
- Optimized start/stop cluster workflow to run operations in parallel using multithreading.
- Implemented HA for Kafka.
- Updated hive.metastore.server.max.threads in Hive to 1000 as recommended for Hive 3.x.
- Updated heap dump path for Hive to /u01/debug-dumps/.
- Fixed issue where HBase used up memory resources.
- Fixed issue where ZooKeeper and Oozie failed to restart when the restart flag was enabled.
- Updated Spark summary page to show thriftserver jdbc url.
- Automated import tsv and validated in HBase.
- Shortened time taken to reshape large cluster.
- Enabled Ranger authorization through Ambari UI for Trino service.
- Automated Ranger integration into Trino.

---
