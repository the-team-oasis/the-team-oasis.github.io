---
layout: page-fullwidth
#
# Content
#
subheadline: "Release Notes 2022"
title: "12월 OCI Oracle Data Platform 관련 업데이트 소식"
teaser: "2022년 12월 OCI Oracle Data Platform 관련 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2022-dataplatform
tags:
  - oci-release-notes-2022
  - December-2022
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


## Native Support for Exadata Cloud Service
* **Services:**  Operations Insights
* **Release Date:** Dec. 6, 2022
* **Documentation:**
[https://docs.oracle.com/iaas/releasenotes/changes/f098f8b9-d830-4a42-9bc0-b0a92325fba0/](https://docs.oracle.com/iaas/releasenotes/changes/f098f8b9-d830-4a42-9bc0-b0a92325fba0/){:target="_blank" rel="noopener"}

### 서비스 소개
Operations Insights는 이제 Exadata Cloud Service에 대한 OCI 기본 지원(개인 끝점을 통해)을 제공하여 더 이상 추가 에이전트가 필요하지 않으므로 Exadata Insights 기능 사용에 대한 어려움을 낮추게 되었습니다. Exadata Insights는 공유 Exadata 시스템에서 실행되는 중요 워크로드의 성능에 대한 가시성을 제공합니다.


### 신규 변경 사항

Exadata Cloud Service 에 대한 자원을 Operation Insights 에서 가시성 확보를 위해서는 추가적인 에이전트 설치가 필요했으나, 신규 변경 사항으로 Private Endpoint 를 정의할 수 있게 되면서 Exadata Fleet Administrator 페이지에서 Exadata 시스템을 추가할 수 있게 되었습니다.

* Fleet Administrator 에서 Exadata 추가

![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/12/01.oci_release_note_12_operation_insights_change_exa_support_01.png)

* Exadata System Detail 화면에서 Operation Insights member 추가

![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/12/02.oci_release_note_12_operation_insights_change_exa_support_02.png)

<br>

## New release for GoldenGate
* **Services:**  GoldenGate, Oracle Cloud Infrastructure
* **Release Date:** Dec. 7, 2022
* **Documentation:**
[https://docs.oracle.com/iaas/releasenotes/changes/9b7ffab5-229f-4423-aa55-8d7709e5209c//](https://docs.oracle.com/iaas/releasenotes/changes/9b7ffab5-229f-4423-aa55-8d7709e5209c/){:target="_blank" rel="noopener"}

### 서비스 소개
GoldenGate의 새로운 Release 가 반영되었습니다. 

### 신규 변경 사항

Collect diagnostics : 이번 Release 에는 deployment 진단 수집에 대한 support가 포함되어 있습니다.

* 진단 수집 설정 메뉴

    ![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/12/03.oci_release_note_12_goldengate_diagnostic_01.png)

* 진단 수집 설정

    ![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/12/04.oci_release_note_12_goldengate_diagnostic_02.png)

<br>

## New connection types available in GoldenGate
* **Services:**  GoldenGate, Oracle Cloud Infrastructure
* **Release Date:** Dec. 14, 2022
* **Documentation:**
[https://docs.oracle.com/iaas/releasenotes/changes/ee347d56-5e1d-4a63-aa9e-3cfe43d36483/](https://docs.oracle.com/iaas/releasenotes/changes/ee347d56-5e1d-4a63-aa9e-3cfe43d36483/){:target="_blank" rel="noopener"}

### 서비스 소개
GoldenGate의 새로운 Release 가 반영되었습니다. 

### 신규 변경 사항

PostgreSQL 에 대한 신규 Deployment 가 추가되었고, 그에 맞는 Connection Type 이 추가되었습니다.

* PostgreSQL Deployment Type

    ![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/12/05.oci_release_note_12_goldengate_new_db_01.png)

* PostgreSQL Connections Type

    ![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/12/06.oci_release_note_12_goldengate_new_db_conn_01.png)

* PostgreSQL Connections Setting

    ![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/12/07.oci_release_note_12_goldengate_new_db_conn_02.png)

<br>

## New release for Big Data Service 3.0.18
* **Services:**  Big Data
* **Release Date:** Dec. 19, 2022
* **Documentation:**
[https://docs.oracle.com/iaas/releasenotes/changes/69074096-b614-4d7d-8264-8e97b9be7268/](https://docs.oracle.com/iaas/releasenotes/changes/69074096-b614-4d7d-8264-8e97b9be7268/){:target="_blank" rel="noopener"}

### 서비스 소개
Bigdata 를 위한 Open Source Hadoop 은 Hadoop HDFS 및 관리를 위한 Open Source 진영의 다양한 Ecosystem 들이 있습니다. Ecosystem 을 이루고 있는 Tool 들을 역할에 맞는 솔루션을 사용함으로써 완전한 Big Data 시스템을 완성하게 됩니다.

![](/assets/img/database/2022/05/06_oci_database_releasenote_bigdata_hadoop_echosystem.png)

자세한 Big Data 에 대한 서비스 소개는 아래 링크에서 자세히 소개되어 있습니다.

* [OCI Big Data 소개](/_posts/blog/dataplatform/2022-10-07-oracle-bigdata-service-overview.md)

OCI 에 Big Data 의 새로운 Release 가 반영되었습니다. 

### 신규 변경 사항

* Oracle Distribution Hadoop (ODH) 버전 2.0 또는 ODH 1.0 클러스터를 생성할 때 클러스터 Profile 을 추가할 수 있습니다. 사용 가능한 클러스터 Profile 은 다음과 같습니다.
    * Hadoop_Extended
    * Hadoop
    * Hive
    * Spark
    * HBase
    * Trino
        ![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/12/08.oci_release_note_12_bigdata_cluster_profile_01.png)

      * Hadoop Profile
         ![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/12/09.oci_release_note_12_bigdata_cluster_profile_02.png)     

* 필요한 만큼만 사용할 수 있도록 Cluster 를 중지하고 시작할 수 있도록 변경되었습니다.


<br>

---
