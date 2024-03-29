---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "11월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 11월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Nov-2023
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

## Automatic Workload Repository (AWR) Hub 
* **Services:** Operations Insights
* **Release Date:** Nov. 21, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/d96df03a-80c5-4428-822e-6ec75c4ed736/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/d96df03a-80c5-4428-822e-6ec75c4ed736/){:target="_blank" rel="noopener"}

### 릴리즈 내용
AWR Hub를 사용하면 중요한 Oracle Autonomous Database 의 자동 작업 로드 저장소에서 자세한 Performance 데이터를 통합하고 저장할 수 있습니다. 새로운 AWR Hub 기능을 통해 AWR Hub 를 루트가 아닌 다른 Compartment 에 배치할 수 있으며 이제 하위 Compartment 에 정책을 생성할 수 있습니다.

- AWR 은 Oracle Database 의 성능 분석을 위해 중요하고 유용한 정보의 소스입니다.
  - top wait events 분석
  - top SQL query 분석
  - CPU, Memory, Instance
  - 성능 권고 사항 (ADDM) 등의 정보

- AWR Hub 란?
  - AWR Hub는 Oracle "Autonomous Database" AWR 스냅샷을 저장하는 중앙 저장소입니다. 오프라인으로 데이터베이스 성능 분석을 수행할 수 있는 기능을 제공합니다. AWR Hub는 AWR 데이터를 25개월 동안 저장합니다.

- AWR Hub - Data Flow
  ![AWR Hub](/assets/img/dataplatform/2023/release_note/202312/01_oci_awr_hub_data_flow.png)


---
