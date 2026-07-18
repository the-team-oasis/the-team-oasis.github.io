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

MySQL HeatWave가 MySQL 9.7.1과 8.4.10 버전을 지원합니다. Oracle 원문은 이 릴리스가 Critical Security Patch Update임을 명시합니다.

Critical Security Patch Update는 보안 취약점 수정이 포함된 중요 패치입니다. 운영팀은 호환성 테스트 후 업그레이드 계획을 세우고, 애플리케이션 드라이버와 SQL 동작 차이를 함께 검증하는 것이 좋습니다.

## HeatWave: Near-Zero Downtime Maintenance Available for All Eligible DB Systems
* **Services:** MySQL HeatWave
* **Release Date:** June 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-near-zero-downtime-maintenance.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-near-zero-downtime-maintenance.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

모든 적격 standalone DB system에서 Near-Zero Downtime Maintenance를 사용할 수 있게 되었습니다. 이는 유지보수 중 서비스 중단 시간을 최소화하는 방식입니다.

운영 관점에서는 보안 패치와 버전 유지보수를 더 자주, 더 낮은 위험으로 수행할 수 있다는 점이 중요합니다. 다만 실제 무중단 여부는 애플리케이션 연결 방식, 장애 조치 설정, 유지보수 창에 따라 달라질 수 있으므로 사전 테스트가 필요합니다.

## HeatWave: IPv6 Support
* **Services:** MySQL HeatWave
* **Release Date:** June 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-ipv6-support.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-ipv6-support.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave DB system을 IPv6 주소로 생성할 수 있게 되었습니다. IPv6는 더 넓은 주소 공간을 제공하는 인터넷 프로토콜로, 대규모 네트워크와 최신 클라우드 네트워크 설계에서 중요성이 커지고 있습니다.

IPv6 지원은 네트워크 주소 설계, 보안 규칙, 애플리케이션 접속 문자열에 영향을 줄 수 있습니다. 신규 시스템에서는 IPv4/IPv6 정책을 함께 정의하고 방화벽·보안 목록을 점검해야 합니다.
