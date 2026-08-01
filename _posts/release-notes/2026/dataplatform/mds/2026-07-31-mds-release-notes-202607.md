---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2026년 7월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-mds
tags:
  - oci-release-notes-2026
  - Jul-2026
  - MDS
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


## HeatWave: Multi-Source Replication
* **Services:** MySQL HeatWave
* **Release Date:** July 08, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-multi-source-replication.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-multi-source-replication.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave에서 Multi-Source Replication을 지원합니다. 여러 소스의 변경 데이터를 하나의 HeatWave 환경으로 복제해 통합 분석이나 마이그레이션 흐름을 구성할 수 있습니다.

### 운영 시 참고 사항

다중 소스 복제는 충돌, 지연, 장애 복구 설계가 중요합니다. source별 GTID, network latency, 권한, 데이터 중복 가능성을 사전에 점검해야 합니다.
