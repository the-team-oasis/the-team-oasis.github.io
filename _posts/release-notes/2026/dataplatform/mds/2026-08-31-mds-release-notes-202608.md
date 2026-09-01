---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "8월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2026년 8월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-mds
tags:
  - oci-release-notes-2026
  - Aug-2026
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

## HeatWave: Blue/Green Deployment
* **Services:** MySQL HeatWave
* **Release Date:** August 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-blue-green-deployments.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-blue-green-deployments.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/mysql-database/doc/blue-green-deployments.html](https://docs.oracle.com/iaas/mysql-database/doc/blue-green-deployments.html){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave에서 standalone DB system의 upgrade와 infrastructure 변경을 위한 blue/green deployment를 지원합니다. 현재 운영 중인 blue source와 별도로 green target DB system을 준비하고 검증한 뒤 client connection을 전환하므로 변경 작업의 downtime을 줄일 수 있습니다.

### 전환 준비와 영향

Green 환경에서 대상 MySQL version, shape와 infrastructure 변경을 적용한 뒤 application connection, schema와 대표 query를 검증하고 switchover 시점을 계획합니다. 전환 전에는 source와 target의 상태, replication 동기화, client connection endpoint 변경, 쓰기 중단 구간과 rollback 기준을 운영 절차에 포함해야 합니다.

### 지원 제약 및 검증

Blue/green deployment는 같은 region의 standalone DB system만 지원합니다. High availability DB system, cross-region deployment, MySQL REST Service가 활성화된 DB system, HeatWave cluster가 연결된 DB system과 Always Free DB system에는 사용할 수 없습니다. 사전 검증에서는 green system의 데이터 정합성, application read/write, 사용자와 권한, 성능을 확인하고, switchover 후에는 client가 target으로 연결되는지와 핵심 transaction이 정상 처리되는지 점검합니다.
