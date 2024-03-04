---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "2월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 2월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Feb-2023
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

##  Media Flow now supports SRT and JSON formats for creating subtitles
* **Services:** Media Flow
* **Release Date:** Feb. 7, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/eefeb8f0-8b75-4288-96eb-04599a049522/](https://docs.oracle.com/iaas/releasenotes/changes/eefeb8f0-8b75-4288-96eb-04599a049522/){:target="_blank" rel="noopener"}

### 서비스 소개

OCI Media Flow 서비스에서 서브 타이틀을 생성할때 SRT (SubRip subtitle file) 와 JSON 포맷을 지원하게 되었습니다.

* 신규 기능

- Transcribing Video Asset 기능은 비디오 오디오에서 텍스트의 JSON 및 SRT (SubRip subtitle file) 파일을 생성할 수 있습니다. Transcribe 는 OCI Speech 서비스를 사용하는 서비스입니다.
- 지원 언어 : 영어, 포루투갈어, 스페인어

* Media Flow AI Transcribe 설정 화면

![Media Flow]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/04_oci_media_flow_01.png)

<br>

##  Manage master encryption key wallets in OCI GoldenGate
* **Services:** GoldenGate
* **Release Date:** Feb. 7, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/1fe8c825-172c-4d93-856a-19450215bf97/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/1fe8c825-172c-4d93-856a-19450215bf97/){:target="_blank" rel="noopener"}

### 서비스 소개

OCI 에서 제공하는 Data Replication 서비스인 GoldenGate 서비스에서 마스터 암호화 키를 사용할 수 있게 되었습니다.

* 신규 기능

마스터 암호화 키를 사용하여 다른 GoldenGate 배포에 배포된 트레일 파일을 암호화합니다. 그런 다음 다른 소스 및 대상 OCI GoldenGate 배포와 함께 사용할 마스터 암호화 키 지갑을 가져오고 내보낼 수 있습니다.

Oracle GoldenGate에서 마스터 키가 생성되면 GoldenGate가 트레일 파일을 생성할 때마다 트레일 콘텐츠를 암호화하는 새 암호화 키를 자동으로 생성합니다. 마스터 키는 암호화 키를 암호화합니다. 

* GoldenGate Admin 에서 Master Key 추가 기능

![GoldenGate]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/05_oci_goldengate_master_key.png)

* OCI GoldenGate Deployment 에서 Vault 로 Master Key Export

![GoldenGate]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/06_oci_goldengate_masterkey_export.png)

<br>

##  New release for Data Catalog
* **Services:** GoldenGate
* **Release Date:** Feb. 8, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/debf5d2e-409d-4393-b6f4-8d8c512d3a0e/](https://docs.oracle.com/iaas/releasenotes/changes/debf5d2e-409d-4393-b6f4-8d8c512d3a0e/){:target="_blank" rel="noopener"}

### 서비스 소개

이제 Data Catalog의 새 릴리스를 사용할 수 있습니다. 버그 수정 및 개선 사항 외에도 이제 다음을 수행할 수 있습니다.

* 신규 기능

    - SCAN(Single Client Access Name)을 사용하여 Exadata를 포함하여 Private RAC 지원 Oracle 데이터베이스용 데이터 Asset 생성
    - Object Storage에 있는 Delta Lake 테이블에 대해 Metastore에서 메타데이터 수집
    - Metastore에서 Data Catalog로 Delta Lake 테이블 수집
<br>

##  Oracle Database Autonomous Recovery Service is Now Available
* **Services:** Oracle Cloud Infrastructure, Oracle Database Autonomous Recovery Service
* **Release Date:** Feb. 15, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/2873cbbe-614e-44a5-81fe-ed439b7e4077/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/2873cbbe-614e-44a5-81fe-ed439b7e4077/){:target="_blank" rel="noopener"}

### 서비스 소개

Oracle Database Zero Data Loss Autonomous Recovery Service는 OCI 에서 실행되는 Oracle 데이터베이스를 위한 완전 관리형 데이터 보호 서비스입니다. Unique하고 자동화된 기능은 실시간으로 Oracle 데이터베이스 변경 사항을 보호하고 Production 데이터베이스의 오버헤드 없이 백업을 검증하며 모든 시점으로 빠르고 예측 가능한 복구를 가능하게 합니다. 

* Oracle Database Autonomous Recovery Service (Zero Data Loss Autonomous Recovery Service)

![ZDLA]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/07_oci_ars_zdla_01.png)

* Recovery Service Proctected Database 

![ZDLA]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/08_oci_ars_zdla_02.png)
<br>
![ZDLA]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/09_oci_ars_zdla_03.png)

<br>

##  New Release for Data Integration (fixes)
* **Services:** Data Integration, Oracle Cloud Infrastructure
* **Release Date:** Feb. 19, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/da2cc68c-c464-4585-8823-ff4571b5626f/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/da2cc68c-c464-4585-8823-ff4571b5626f/){:target="_blank" rel="noopener"}

### 서비스 소개

이번 Data Integration Release 에는 다음과 같은 Bug Fix 가 포함되어 있습니다.

- Pipeline Job 실행의 시작 시간과 Pipeline 에서 작업 실행 사이의 지연 시간이 줄어들어 전체 Pipeline 실행 성능이 향상되었습니다.
- Data Loader 작업 실행의 시작 시간이 단축되어 전체 실행 성능이 향상되었습니다.
<br>

---
