---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "8월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2025년 8월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2025-mds
tags:
  - oci-release-notes-2025
  - Aug-2025
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


## HeatWave: Support for Version 9.4.1
* **Services**: HeatWave
* **Release Date**: August 25, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-941.htm](https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-941.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

- `MySQL 9.4.1 버전 지원이 추가되었습니다` : 
새로운 HeatWave DB 시스템을 생성할 때 MySQL 9.4.1 버전을 선택할 수 있도록 지원이 추가되었습니다.
기존 DB 시스템의 경우, 관리자가 수동으로 업그레이드를 수행해야 합니다.


- `InnoDB 통계 캐시 기능이 도입되었습니다` :
HeatWave에서 InnoDB 통계 캐시(InnoDB statistics cache) 를 활용하여 쿼리 실행 성능을 향상시킬 수 있는 기능이 추가되었습니다.
이를 통해 쿼리 계획 수립 과정에서 더 효율적인 통계 활용이 가능해졌습니다.


- `자동 증분 로드 기능이 지원됩니다` : 
HeatWave Lakehouse 환경에서 이벤트 기반 자동 증분 로드(Automatic Incremental Load) 기능이 지원됩니다.
Object Storage에서 테이블을 로드할 때 변경된 데이터만 자동으로 반영할 수 있어, 데이터 적재 효율이 크게 개선되었습니다.


- `자연어 → SQL 변환 기능이 추가되었습니다` : 
GenAI 기능이 강화되어, 자연어 명령을 SQL 쿼리로 자동 변환하는 NL_SQL 루틴이 제공됩니다.
이를 통해 SQL 문법을 몰라도 자연어로 데이터 질의가 가능해졌습니다.

- `AutoML 기능이 고도화되었습니다` : 
AutoML에서 NL2ML 기능이 개선되어 데이터셋 간 조인 정보, 불필요한 컬럼 제거, 학습·테스트 데이터 분할 등 다양한 정보를 응답에서 확인할 수 있게 되었습니다.
새로운 TRAIN_TEST_SPLIT 프로시저도 추가되어 데이터 전처리가 간소화되었습니다.
또한 ML_PREDICT_TABLE, ML_EXPLAIN_TABLE 등의 기능에서도 병렬 처리 성능이 향상되었습니다.


- `병렬 실행 성능이 개선되었습니다` : 
GenAI 및 AutoML 기능에서 다중 세션 쿼리를 동시에 처리할 수 있는 병렬성(concurrency) 이 강화되었습니다.
이를 통해 여러 사용자가 동시에 AI/ML 작업을 수행하는 환경에서도 성능 저하 없이 안정적인 처리가 가능해졌습니다.

## HeatWave: Full Stack Disaster Recovery introduces support for MySQL DB System and provides other updates
* **Services**: Full Stack Disaster Recovery
* **Release Date**: August 26, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/disaster-recovery/aug-2025.htm](https://docs.oracle.com/en-us/iaas/releasenotes/disaster-recovery/aug-2025.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이번 릴리즈에서는 Full Stack DR(재해 복구) 서비스가 더 넓은 범위의 리소스를 지원할 수 있도록 MySQL DB System과 OKE 클러스터 네임스페이스 백업 지정 등이 새롭게 도입되었습니다.

아래는 주요 기능을 정리한 항목입니다:

- MySQL DB System을 Disaster Recovery 보호 그룹(Protection Group)에 추가할 수 있는 지원이 도입되었습니다.
    - MySQL HeatWave DB System을 DR 그룹에 포함시키는 구성 절차
    - DR 정책(Policies) 설정
    - 사전 검사(Prechecks) 로직
    - DR 계획 그룹의 기본 순서 등
    - DR 보호 그룹 멤버 및 계획 그룹(plan group) 관리 옵션이 확장되었습니다.
    - OKE (Oracle Kubernetes Engine) 클러스터의 네임스페이스(namespace) 단위로 백업 대상을 지정할 수 있는 기능이 추가되었습니다 (OKE 클러스터를 DR 그룹에 추가할 때)

* **참고 사이트:** [공식 블로그](https://docs.oracle.com/ko/learn/full-stack-dr-mysql-heatwave/index.html#introduction){:target="_blank" rel="noopener"}
