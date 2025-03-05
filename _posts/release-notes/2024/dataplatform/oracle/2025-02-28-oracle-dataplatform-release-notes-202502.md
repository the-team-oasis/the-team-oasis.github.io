---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "2월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2025년 2월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2025-dataplatform
tags:
  - oci-release-notes-2025
  - Feburary-2025
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

## New features in GoldenGate
* **Services:** GoldenGate
* **Release Date:** October 16, 2024
* **Release Date:** November 13, 2024
* **Release Date:** February 11, 2025

* **Documentation:** [https://docs.oracle.com/en/cloud/paas/goldengate-service/wnoci/](https://docs.oracle.com/en/cloud/paas/goldengate-service/wnoci/){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle GoldenGate는 최신 Long Support Release 인 GoldenGate 23ai를 발표하고 On-Premise 와 OCI GoldenGate 내에서 사용할 수 있게 되었습니다. Oracle GoldenGate 는 실시간 이기종 데이터 통합 ​​및 글로벌 트랜잭션 데이터 패브릭 구축을 위한 기술입니다. 여러 새로운 기능 중에서 이제 Generative AI 와 LLM 모델의 정확도를 개선하기 위해 엔터프라이즈급 Vector 임베딩에 대한 실시간 복제를 지원합니다. <br>
GoldenGate 23ai는 사용성, 성능, 보안, 거버넌스 및 개발자 API를 개선하는 GoldenGate 포트폴리오에 대한 100개 이상의 업데이트 외에도 새로운 Oracle Database 23ai 기능을 지원합니다.

- GoldenGate 23ai New Features
  ![OCIGG23AI](/assets/img/dataplatform/2024/release_note/202502/oci_goldengate_23ai_new_01.png)

- 주요 새로운 기능
  - AI Vector 및 Vector Database 를 위한 데이터 복제
  - AsyncAPI를 통한 데이터베이스 이벤트에 대한 Pub/Sub 액세스를 위한 데이터 스트림
  - Graphic User Interface 의 개선
  - 개선된 Observability 와 Diagnostics 기능
  - Oracle Database 23ai 의 새로운 기능 지원
  - 보안 및 사용자 권한 기능 강화

- RAG 구축을 위한 Vector DB 복제 지원
  - Oracle Database 23ai Vector 데이터 유형에 대한 복제 지원을 추가하여 엔터프라이즈 RAG(Retrieval Augmented Generation)를 구동하고 분산 벡터 및 데이터를 실시간 GenAI 애플리케이션 경험을 위한 벡터 허브로 통합할 수 있습니다.
  - Oracle Database 23ai, MySQL Heatwave 벡터, PostgreSQL(pgvector), GCP AlloyDB AI, AWS Aurora(pgvector), AWS RDS PostgreSQL(pgvector), Azure PostgreSQL(pgvector), ElasticSearch 벡터, OpenSearch 벡터, AWS OpenSearch 벡터 및 OCI OpenSearch Neural을 포함하여 새로운 벡터 데이터베이스를 Connection Portfolio 에 추가했습니다.

- GoldenGate 23ai Connection Portfolio
  ![OCIGG23AICON](/assets/img/dataplatform/2024/release_note/202502/oci_goldengate_23ai_connection_02.png)

- GoldenGate 23ai Vector DB Replication Case
  ![OCIGG23AICON](/assets/img/dataplatform/2024/release_note/202502/oci_goldengate_vector_replication.png)

- 편리한 Database Connection 설정
  - OCI 의 Developer 서비스에서 Database 의 손쉬운 Connection 설정 및 SQL Worksheet 기능을 제공함에 따라 OCI GoldenGate 에 대한 설정도 손쉽게 수행할 수 있게 되었습니다.

  ![OCIGG23AICON](/assets/img/dataplatform/2024/release_note/202502/06_oci_goldengate_connection.png)

- Database Procedure 설정 변화
  - Oracle Database 23ai 버전에서 GRANT_ADMIN_PRIVILEGE Procedure 가 Disable 됨
  - GRANT 명령으로 대체되어 OGG_CAPTURE, OGG_APPLY 권한에 대해 아래와 같은 명령으로 Grant 해 주는 것으로 변경되었습니다.

  ![OCIGG23AICON](/assets/img/dataplatform/2024/release_note/202502/05_oci_goldengate_procedure_sr_.png)

- 새로운 GUI Interface
  - 보다 생산적인 사용자 경험을 제공하기 위해 GoldenGate 23ai 는 구성, 관리 및 문제 해결을 위해 GUI 가 개선되었습니다.
  - 과거 버전 GUI
  ![OCIGG23AICON](/assets/img/dataplatform/2024/release_note/202502/07_oci_goldengate_old_ui.png)
  - 신규 버전 GUI
  ![OCIGG23AICON](/assets/img/dataplatform/2024/release_note/202502/08_oci_goldengate_new_ui.png)
 

---