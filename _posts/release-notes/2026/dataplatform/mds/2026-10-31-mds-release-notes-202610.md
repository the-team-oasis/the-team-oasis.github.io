---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "10월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2026년 10월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: lim
breadcrumb: true
permalink: "release-notes-2026-dataplatform/mds-release-notes-202610/"
categories:
  - release-notes-2026-mds
tags:
  - oci-release-notes-2026
  - Oct-2026
  - MDS
  - MySQL HeatWave
#
# Styling
#
header: no
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## MySQL HeatWave: MySQL 8.0.46-u1 버그 수정 릴리스 지원

* **Services:** MySQL HeatWave
* **Release Date:** 2026년 10월 13일

### 업데이트 내용

MySQL HeatWave가 MySQL Database 8.0.46-u1 버그 수정 버전을 지원합니다. 이 버전은 운영 품질(production-grade) 릴리스이지만, 신규 DB System 생성에는 사용할 수 없고 기존 MySQL 8.0 DB System만 해당 버전으로 업그레이드할 수 있습니다.

이번 릴리스에는 Audit Log, InnoDB, JSON, Optimizer, Performance Schema, Replication, X Plugin 관련 수정이 포함됩니다. 특히 고부하 I/O 상황의 InnoDB 교착 상태 및 서버 장애 가능성, 감사 로그 필터링과 암호화 비밀번호 호출 관련 문제, 복제 적용 및 권한 검사 문제 등이 수정되었습니다.

### 참고

- Release Note: https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-8046u1.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## MySQL HeatWave: 26.10.0·9.7.4·8.4.13 버전 지원

* **Services:** MySQL HeatWave
* **Release Date:** 2026년 10월 20일

### 업데이트 내용

MySQL HeatWave가 MySQL 26.10.0, 9.7.4, 8.4.13 버전을 지원합니다. 세 버전은 보안 및 버그 수정을 포함한 운영 품질 릴리스이며, 신규 DB System은 기본적으로 9.7.4를 사용합니다. 신규 생성 시에는 26.10.0 또는 8.4.13을 선택할 수도 있습니다.

기존 DB System은 수동 업그레이드하거나 유지보수 정책을 통해 상위 버전으로 전환할 수 있습니다. Oracle은 최신 기능을 빠르게 활용해야 하는 경우 26.10.0 Innovation 버전을, 안정적인 동작이 우선인 경우 9.7.4 또는 8.4.13 LTS 버전을 선택하도록 안내합니다.

### 참고

- Release Note: https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-2610-974-8413.htm
- HeatWave 26.10.0 Release Notes: https://dev.mysql.com/doc/relnotes/heatwave/en/news-26-10-0.html
- MySQL 26.10.0 Release Notes: https://dev.mysql.com/doc/relnotes/mysql/26.10/en/news-26-10-0.html
- MySQL 9.7.4 Release Notes: https://dev.mysql.com/doc/relnotes/mysql/9.7/en/news-9-7-4.html
- MySQL 8.4.13 Release Notes: https://dev.mysql.com/doc/relnotes/mysql/8.4/en/news-8-4-13.html

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->
