---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "9월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 9월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Aug-2023
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

## New release for Data Catalog 
* **Services:** Data Catalog
* **Release Date:** Sept. 6, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/72b4d374-a7a1-4efb-90a5-ec415f43cab5/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/72b4d374-a7a1-4efb-90a5-ec415f43cab5/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 Data Catalog의 새 릴리스를 사용할 수 있습니다. 버그 수정 및 개선 외에도 이제 다음을 수행할 수 있습니다.

- OCI 데이터 통합 애플리케이션에서 처리된 데이터에 대한 데이터 계보(Lineage) 를 확인합니다.
- 비동기 내보내기 작업을 통해 대규모 용어집을 Excel 파일로 내보냅니다. 

### Data Catalog 의 필요성

아래와 같은 경우 Data Catalog 를 구축하면 많은 도움이 됩니다.
- 분석을 위해 올바른 데이터를 찾을 수 없을 경우
- Data Lake 의 데이터를 이해하기 어려운 경우
- Data 에 대한 Governance 가 필요한 경우

### 간단한 Data Catalog Build 방법
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_data_catalog_build_step.png)

1. Data Catalog Harvest 화면
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_data_catalog_harvest.png)

2. Data Catalog Enrich 화면
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_data_catalog_enrich.png)

3. Data Catalog Search 화면
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_data_catalog_search.png)

* Data Catalog Lineage 화면
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_data_catalog_lineage.png)

## New release for Data Integration 
* **Services:** Data Integration, Oracle Cloud Infrastructure
* **Release Date:** Sept. 11, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/6c5bc145-a1c6-4bd7-a21d-4aff1f57c73e/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/6c5bc145-a1c6-4bd7-a21d-4aff1f57c73e/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 데이터 통합 애플리케이션에서 처리되는 데이터 엔터티에 대한 계보 (Lineage) 정보를 생성한 다음 Data Catalog 서비스를 사용하여 생성된 메타데이터를 볼 수 있습니다.

## Manage SQL Tuning Sets in Database Management
* **Services:** Database Management
* **Release Date:** Sept. 12, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/f135f949-09c5-472b-b609-055224a2ac1a/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/f135f949-09c5-472b-b609-055224a2ac1a/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 데이터베이스 관리에서 SQL 튜닝 세트를 관리하고 다음과 같은 작업을 수행할 수 있습니다.
- SQL 튜닝 세트 생성
- SQL 튜닝 세트에 SQL 문장 로드
- SQL 튜닝 세트 세부 정보 모니터링
- SQL 튜닝 세트 삭제

- SQL Tuning Set
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_mgmt_sql_tuning_set.png)

## Manage AWR snapshot collection for your database using Performance Hub
* **Services:** Database, Database Management
* **Release Date:** Sept. 12, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/d7fdd58b-d92d-4ea8-8d85-1ef1abe740ea/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/d7fdd58b-d92d-4ea8-8d85-1ef1abe740ea/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 OCI의 Performance Hub 애플리케이션을 사용하여 AWR 스냅샷 수집 설정을 사용자 정의할 수 있습니다. 이 기능은 스냅샷 간격과 보존 기간을 구성하는 데 도움이 됩니다. 

- AWR Snapshot Setting
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_mgmt_awr_setting.png)


## Instance level details in AWR Reports from Performance Hub
* **Services:** Database, Database Management
* **Release Date:** Sept. 12, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/99e22df4-d97c-492d-9810-8df6d93e46fc/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/99e22df4-d97c-492d-9810-8df6d93e46fc/){:target="_blank" rel="noopener"}

### 릴리즈 내용
Performance Hub의 AWR(자동 작업 부하 저장소) 보고서에는 인스턴스 수준 보고서에 대한 추가 옵션이 있습니다. 이제 특정 인스턴스를 선택하고 AWR 보고서에서 자세한 내용을 확인할 수 있습니다. 현재 이 기능은 기본 데이터베이스 서비스 및 외부 데이터베이스에 대해 지원됩니다.

- AWR Snapshot Setting
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_mgmt_perf_hub_instance_level_awr.png)


## Base Database: Oracle Database 23c on Base Database Service 
* **Services:** Database
* **Release Date:** Sept. 19, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/bd01179b-e109-496f-af7f-8329997070c7/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/bd01179b-e109-496f-af7f-8329997070c7/){:target="_blank" rel="noopener"}

### 릴리즈 내용
Oracle Database 23c는 Oracle Database의 차기 long term support 릴리스이며 이제 Base Database Service에서 사용할 수 있습니다.
- Oracle Database Roadmap
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_database_23c_roadmap.png)

- Oracle Database 23c Release
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_database_23c_new_features.png)

- 23c 버전부터는 non-CDB DB 를 지원하지 않아 반드시 CDB, PDB 형태의 DB 로 데이터베이스를 생성하거나 기존 데이터베이스 업그레이드 시 CDB 로 생성되지 않은 DB 는 CDB 로 변환해야 합니다.

---
