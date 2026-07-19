---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "6월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2026년 6월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-mds

tags:
  - oci-release-notes-2026
  - Jun-2026
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

## HeatWave: Support for Versions 9.7.1 and 8.4.10
* **Services:** MySQL HeatWave
* **Release Date:** June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-971-8410.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-971-8410.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave가 MySQL database version 9.7.1과 8.4.10을 지원합니다. 공식 릴리스 노트에 따르면 두 릴리스는 Critical Security Patch Update입니다.

보안 패치 성격이 강하므로 신규 DB system 생성 기준 버전과 기존 운영 DB의 패치 계획을 함께 검토해야 합니다. 업그레이드 전에는 애플리케이션 호환성, maintenance window, rollback 계획을 확인하는 것이 좋습니다.

## HeatWave: Near-Zero Downtime Maintenance Available for All Eligible DB Systems
* **Services:** MySQL HeatWave
* **Release Date:** June 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-near-zero-downtime-maintenance.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-near-zero-downtime-maintenance.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave의 near-zero downtime maintenance가 eligible standalone DB system 전체로 확대되었습니다. 유지보수 중 서비스 중단 시간을 줄일 수 있어 운영 DB의 정기 패치 부담을 낮추는 데 도움이 됩니다.

적용 전에는 대상 DB system이 eligible 상태인지 확인하고, maintenance window와 애플리케이션 connection retry 정책을 함께 점검해야 합니다. 실제 운영에서는 패치 전후 복제/백업 상태와 애플리케이션 에러율을 비교해 near-zero downtime 효과를 확인하는 것이 좋습니다.

## HeatWave: IPv6 Support
* **Services:** MySQL HeatWave
* **Release Date:** June 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-ipv6-support.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-ipv6-support.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave DB system을 IPv6 address로 생성할 수 있게 되었습니다. IPv6 기반 VCN 설계나 dual-stack 네트워크 전략을 사용하는 환경에서 HeatWave 연결 옵션이 넓어집니다.

적용 시에는 subnet, security list/NSG, client driver, DNS, 방화벽 정책이 IPv6 경로를 지원하는지 확인해야 합니다. 신규 DB system 생성 옵션이므로 기존 IPv4 기반 접속 경로와 병행 검증하는 것이 안전합니다.
