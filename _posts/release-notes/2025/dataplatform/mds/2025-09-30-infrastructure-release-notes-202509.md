---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "9월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2025년 9월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2025-mds
tags:
  - oci-release-notes-2025
  - Sep-2025
  - MDS
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


## HeatWave: Support for Version 9.4.2
* **Services**: HeatWave
* **Release Date**: September 23, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-942.htm](https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-942.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

- 고급 카디널리티 예측 모델 자동 주기적 갱신 (ACE 모델 리프레시)
HeatWave에서 로드된 테이블에 대해 ACE 모델(Advanced Cardinality Estimation 모델) 을 자동으로, 주기적으로 갱신하는 기능이 추가되었습니다. 이는 개발자가 수동으로 갱신할 필요를 줄이며, 쿼리 최적화 정확도를 유지하는 데 도움이 됩니다.

- GenAI 기능 강화 — PDF 문서 파싱 지원
HeatWave의 GenAI 기능이 PDF 파일 문서 파싱을 OCI Generative AI 서비스의 Vision Language Models (VLMs) 을 이용해 강화하도록 확장되었습니다. 이로 인해 표나 복잡한 문서 구조 등도 더 정확히 인식할 수 있어, RAG (Retrieval Augmented Generation) 및 벡터 검색 쿼리의 품질이 향상됩니다. 

| **항목**         | **이전 버전 (9.4.2 이전)**       | **9.4.2 이후 개선된 부분** |
|----------------------|-------------|---------------------------------|
| **PDF 파싱 방식** | 일반적인 텍스트 추출 또는 기본 OCR / 단순 구조 기반 파싱 방식   | OCI Generative AI의 Vision Language Model (VLM)을 활용한 향상된 파싱|
| **복잡 구조 처리** | 표(table), 복합 구조(머리말/각주/열 병합 등)를 잘 인식하지 못함| 표와 같은 복잡 구조도 인식 가능하도록 개선됨|
| **RAG / 벡터 검색 품질** | 텍스트 중심의 단순 문장 기반 임베딩에 국한|파싱 품질 개선 → 더 나은 문맥 및 구조 정보 반영 → RAG/벡터 검색 결과 정확도 향상 가능성 증가 |
| **사용 방식** | PDF 파일을 벡터 스토어로 ingest 시 제약이 있었거나 품질이 낮음|Auto Parallel Load 경로로 PDF ingest 시 강화된 파싱 기능 제공  |
| **모델 기반 처리** | 비전-언어 모델(VLM)을 쓸 수 없었거나 제한적 | VLM 기반 처리를 도입하여 이미지 + 텍스트 혼합 구조 해석 가능|

`9.4.2 이전에는 PDF 파일을 ingest할 때 구조가 복잡한 부분(예: 표, 멀티컬럼, 레이아웃 등)을 잘 해석하지 못하던 제한이 있었고, 단순 텍스트 중심으로만 처리되었으나. 9.4.2부터는 OCI의 Vision Language Models (VLMs)을 이용해 PDF 내부의 복잡한 구조까지 인식하면서, 그 결과를 RAG와 벡터 검색에 반영되었습니다.`  

** ACE 통계(모델) 은 HeatWave가 쿼리 최적화를 할 때 쓰는 고급 통계입니다. 기존 컬럼 히스토그램보다 더 강력하며, HeatWave(세컨더리 엔진)의 플래너가 선택도/결합 크기를 더 정확히 예측하도록 도와줍니다.

** 테이블이 HeatWave에 로드되어 있고 ANALYZE TABLE 을 실행하면 ACE 모델이 갱신됩니다.

## HeatWave: Backup Validation
* **Services**: HeatWave
* **Release Date**: September 04, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-TC-35567-backup-validation.htm](https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-TC-35567-backup-validation.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle MySQL HeatWave에서는 생성한 백업이 정상적으로 복원 가능한 상태인지 미리 검증(Validation) 할 수 있습니다. 이를 통해 손상된 백업을 조기에 발견하고, 실제 복원 전에 문제가 없는지 확인할 수 있습니다.
	
  •	Validation 기능 목적: 백업 데이터의 무결성 및 복원 가능성 사전 점검
	
  •	효과: 장애 상황에서 복구 시간 단축, 백업 손상 시 사전 대응 가능
	
  •	추가 기능: 검증 과정에서 복원 준비 단계(prepare)까지 수행하여 복구 성능을 향상