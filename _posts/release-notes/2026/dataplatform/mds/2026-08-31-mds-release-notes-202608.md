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
* **Documentation:** [https://docs.oracle.com/iaas/mysql-database/doc/switching-over-blue-green-deployment.html](https://docs.oracle.com/iaas/mysql-database/doc/switching-over-blue-green-deployment.html){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave에서 standalone DB system의 upgrade와 infrastructure 변경을 위한 blue/green deployment를 지원합니다. 현재 운영 중인 blue source와 별도로 green target DB system을 준비하고 검증한 뒤 client connection을 전환하므로 변경 작업의 downtime을 줄일 수 있습니다.

### Blue/Green 전환 흐름

Green 환경에는 선택한 MySQL version, shape, configuration과 storage 설정이 적용되며, source의 변경은 replication channel을 통해 target과 동기화됩니다. Green target이 준비되면 switchover를 요청할 수 있고, 전환 전에 target을 검증해야 합니다.

### 지원 조건과 rollback

Blue/green deployment는 같은 region의 standalone DB system만 지원합니다. High availability DB system, cross-region deployment, MySQL REST Service가 활성화된 DB system, HeatWave cluster가 연결된 DB system과 Always Free DB system에는 사용할 수 없습니다. Switchover가 시작되면 source DB system은 쓰기 잠금 상태가 되며, 성공한 switchover는 자동 rollback을 지원하지 않고 replication channel은 삭제됩니다.
