---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "8월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2025년 8월 OCI Oracle Data Platform 업데이트 소식입니다."
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

## URL substitution variables in Oracle Cloud Infrastructure URIs
* **Services:**  Autonomous Database Serverless
* **Release Date:** August 05, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-08-url-substitution-variables-in-oci-uris.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-08-url-substitution-variables-in-oci-uris.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

대체 변수(Substituion Variables)는 Autonomous Database 의 런타임 컨텍스트에 따라 해당 실제 값으로 확인 및 대체되는 미리 정의된 자리 표시자입니다.
이를 통해 Oracle Cloud Infrastructure URL에 하드 코딩되지 않은 테넌시 OCID 또는 네임스페이스와 같은 환경별 값을 포함할 수 있으므로 SQL 코드를 동적으로 생성하고 여러 리전으로 이식할 수 있습니다.

- 대체 변수 사용 예
  ```text
  SELECT TO_CLOB(DBMS_CLOUD.GET_OBJECT (
      credential_name => credential_name,
      object_uri      => 'https://objectstorage.my$region.my$cloud_domain/n/my$namespace/b/bucket_name/o/file_name'))
  FROM DUAL;
  ```
- 대체 변수 목록
  - <mark>my$home_region</mark>
  - <mark>my$region</mark>  
  - <mark>my$cloud_domain</mark>
  - <mark>my$namespace</mark>
  - <mark>my$compartment</mark>
  - <mark>my$tenancy</mark>

- 대체 변수를 사용하기 위해서는 OCI API Signing Key, OCI Resource principal, Auth Token/Swift credential 만 지원

## View or copy connection code samples
* **Services:**  Autonomous Database Serverless
* **Release Date:** August 05, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-08-view-copy-connection-code-samples.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-08-view-copy-connection-code-samples.htmm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database 의 다양한 연결 옵션에 대한 연결 코드 샘플을 보거나 복사할 수 있습니다.

- 빠른 개발을 도울 수 있는 Connection Code 예제 (Java/Python/JavaScript) 복사 기능
  ![ADBDS](/assets/img/dataplatform/2025/release_note/202510/oci_adb_connection_example_code.png)

## External table cache
* **Services:**  Autonomous Database Serverless
* **Release Date:** August 12, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-08-external-table-cache.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-08-external-table-cache.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database 의 External Cache 를 사용하면 데이터베이스의 외부 테이블에서 자주 액세스하는 데이터를 캐시할 수 있습니다.
이를 통해 자주 액세스하는 외부 데이터에 대한 쿼리 실행 속도가 훨씬 빨라져 성능이 향상될 수 있습니다.

- External Table cache 를 지원하는 파일 타입
  - Parquet
  - ORC
  - AVRO
  - Iceberg Tables

- External Table Cache 사용 예
  ```text
  BEGIN
    DBMS_EXT_TABLE_CACHE.ADD_FILE (
      owner        => 'SALES', 
      table_name   => 'STORE_SALES',
      file_url     => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/your_namespace/your_bucket/salesdata.parquet'
  );
  END;
  /
  ```

## GoldenGate now supports Oracle Database@AWS - Autonomous Database
* **Services:**  GoldenGate
* **Release Date:** August 15, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/goldengate/r8connections.htm](https://docs.oracle.com/iaas/releasenotes/goldengate/r8connections.htm){:target="_blank" rel="noopener"}

GoldenGate는 Oracle Database@AWS - Autonomous Database 에 대한 연결 유형 지원을 추가하고 기존 연결 변경 사항도 추가되었습니다.

- 추가된 GoldenGate 접속 설정
  ![OGG-Multicloud](/assets/img/dataplatform/2025/release_note/202510/oci_goldengate_aws_adb.png)


## Mixed license support in GoldenGate
* **Services:**  GoldenGate
* **Release Date:** August 28, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/goldengate/mixedlicense.htm](https://docs.oracle.com/iaas/releasenotes/goldengate/mixedlicense.htm){:target="_blank" rel="noopener"}


OCI GoldenGate 의 Licensing 에서 Auto Scaling 을 Enable 하는 경우 이제 BYOL(Bring Your Own License)로 적용되는 OCPU 수를 제어하기 위해 OCPU Limit 을 적용할 수 있습니다. BYOL 의 갯수를 넘어가면 License Included 기반의 금액으로 추가 청구되는 Mixed 형태의 Licensing 을 지원합니다. 모든 배포 유형에 적용되고, 이 새로운 옵션은 배포를 생성하거나 편집할 때 나타납니다.

- OCI GoldenGate Mixed License 설정
  ![OGGMIXEDLicense](/assets/img/dataplatform/2025/release_note/202510/oci_goldengate_mix_license.png)


---