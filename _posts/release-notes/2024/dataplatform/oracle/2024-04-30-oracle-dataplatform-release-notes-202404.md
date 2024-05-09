---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "4월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2024년 4월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2024-dataplatform
tags:
  - oci-release-notes-2024
  - Mar-2024
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

## Base Database: Restore a backup to create a database across regions
* **Services:** Database
* **Release Date:** April. 3, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/563b64a5-eacd-4641-969d-02f3ce839208/](https://docs.oracle.com/iaas/releasenotes/changes/563b64a5-eacd-4641-969d-02f3ce839208/){:target="_blank" rel="noopener"}

### 업데이트 내용

기존 백업, Object Storage 또는 Autonomous Recovery Service로 생성된 백업을 사용하여 동일한 Region 또는 다른 Region 의 가용성 도메인에 걸쳐 데이터베이스(out-of-place restore) 를 생성할 수 있습니다.

Host-based Wallet(local wallets) 또는 OCI Vault를 사용하여 구성된 데이터베이스에서 수행된 백업을 복원할 수도 있습니다.


## Additional OCI Events for Audit Trails in Data Safe 
* **Services:** Data Safe
* **Release Date:** April. 17, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/e43bed78-60a1-4d0a-ba6f-28067406143e/](hhttps://docs.oracle.com/iaas/releasenotes/changes/e43bed78-60a1-4d0a-ba6f-28067406143e/){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Safe에는 보안 평가, 사용자 평가, 경고, 활동 감사, 데이터 검색, 데이터 마스킹, SQL 방화벽, Oracle Data Safe 온프레미스 커넥터, Oracle Data Safe End Point 및 대상 데이터베이스에 대한 이벤트 유형이 있습니다.

Audit Trails 상태가 변경되는 시기를 더 쉽게 알 수 있도록 Audit Trails 에 대한 추가 OCI Event 가 추가되었습니다.

- Notification Text for a Create Target Database - End Event Type

  ```txt
  {
  "eventType": "com.oraclecloud.datasafe.createtargetdatabase.end",
  "cloudEventsVersion": "0.1",
  "eventTypeVersion": "2.0",
  "source": "DataSafe",
  "eventTime": "2021-02-23T19:15:20.264Z",
  "contentType": "application/json",
  "data": {
    "compartmentId": "ocid1.tenancy.oc1..unique_ID",
    "compartmentName": "example-compartment",
    "resourceName": "targetDatabase",
    "resourceId": "ocid1.coreservicesworkrequest.oc1..unique_ID",
    "availabilityDomain": "<availability-domain>"
  },
  "eventID": "unique_ID",
  "extensions": {
    "compartmentId": "ocid1.tenancy.oc1..unique_ID"
  },
  "serviceName": "Data Safe", 
  "displayName": "Create Target Database - End",
  "additionalDetails": [
    {"name": "targetId", "type": "string"},
    {"name": "targetType", "type": "string"}
    ],
  "timeCreated": "2021-02-23T19:15:20.264Z",
  "activationTime": "2021-03-15T00:00:00.000Z"
  }
  ```

## Data Safe Now Includes Additional Filters in Report History 
* **Services:** Data Safe
* **Release Date:** April. 17, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/7f42d554-0338-4c3d-9cf8-98049f682861/](hhttps://docs.oracle.com/iaas/releasenotes/changes/7f42d554-0338-4c3d-9cf8-98049f682861/){:target="_blank" rel="noopener"}

### 업데이트 내용

SQL Firewall 은 권한이 부여된 SQL 문/접속으로만 데이터베이스 액세스를 제한하여 일반적인 데이터베이스 공격으로부터 실시간 보호를 제공하는 Oracle Database 23c 의 새로운 기능입니다.

- Data Safe 에서는 SQL Firewall 기능에서 보다 쉬운 사용을 위해 Audit, Alert 및 SQL 방화벽 위반에 대한 report history 페이지가 추가 필터로 향상되었습니다.

- Data Safe 의 Violation Report History 페이지에는 Shcedule 에 따라 자동으로 생성되거나 사용자의 요청에 따라 생성되는 모든 PDF/XLS 위반 보고서가 나열됩니다. 


- SQL Firewall in Oracle Database 23c

  ![OCIGGSA](/assets/img/dataplatform/2024/release_note/202404/14_oci_data_safe_sql_firewall_01.png)

- Data Safe 의 SQL Firewall 감사 및 보고 기능

  ![OCIGGSA](/assets/img/dataplatform/2024/release_note/202404/15_oci_data_safe_sql_firewall_02.png)

- Violation Report History 페이지 - 추가 필터로 향상됨

  ![OCIGGSA](/assets/img/dataplatform/2024/release_note/202404/15_oci_data_safe_sql_firewall_03.png)


---