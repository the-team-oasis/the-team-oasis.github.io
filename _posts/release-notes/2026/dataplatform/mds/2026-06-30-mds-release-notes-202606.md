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

---

## HeatWave: Support for Versions 9.7.1 and 8.4.10

* **Services:** MySQL HeatWave
* **Release Date:** June 16, 2026
* **Release Note:** [HeatWave: Support for Versions 9.7.1 and 8.4.10](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-971-8410.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Supported MySQL Server Versions](https://docs.oracle.com/iaas/mysql-database/doc/supported-mysql-server-versions.html){:target="_blank" rel="noopener"}, [Upgrading a DB System](https://docs.oracle.com/iaas/mysql-database/doc/upgrading-db-system.html){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave에서 MySQL 데이터베이스 버전 9.7.1과 8.4.10을 지원합니다. 두 버전 모두 중요 보안 패치를 포함하므로 신규 DB System의 버전 선택과 기존 운영 환경의 업그레이드 계획을 함께 검토해야 합니다.

### 주요 기능

* 신규 DB System을 생성할 때 지원 버전으로 9.7.1 또는 8.4.10을 선택할 수 있습니다.
* 기존 DB System은 지원되는 업그레이드 경로와 유지보수 정책에 따라 신규 버전으로 전환할 수 있습니다.
* 업그레이드 전에는 애플리케이션과 드라이버 호환성, 유지보수 윈도우, 백업 및 복구 절차를 확인하는 것이 좋습니다.

### 적용 및 검증 포인트

테스트 환경에서 대상 버전으로 업그레이드한 뒤 연결과 주요 쿼리를 점검하고, 업그레이드 전후의 지표와 로그를 비교하는 방식으로 검증할 수 있습니다. 운영 반영 시에는 롤백 가능 여부와 패치 적용 시간을 포함한 변경 계획을 준비하는 것이 좋습니다.

---

## HeatWave: Near-Zero Downtime Maintenance Available for All Eligible DB Systems

* **Services:** MySQL HeatWave
* **Release Date:** June 10, 2026
* **Release Note:** [HeatWave: Near-Zero Downtime Maintenance Available for All Eligible DB Systems](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-near-zero-downtime-maintenance.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Maintenance of a Standalone DB System](https://docs.oracle.com/iaas/mysql-database/doc/maintenance-standalone-db-system.html){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave의 Near-Zero Downtime Maintenance가 지원 조건을 충족하는 모든 Standalone DB System으로 확대되었습니다. 유지보수 과정에서 새 DB System으로 데이터를 복제한 뒤 짧은 전환 구간만 서비스가 중단되므로 정기 패치에 따른 운영 부담을 줄일 수 있습니다.

### 주요 기능

* MySQL Server를 계속 실행한 상태에서 새 DB System으로 데이터를 복제합니다.
* 데이터 동기화가 완료되면 마지막 전환 시점에만 짧은 중단이 발생합니다.
* 유지보수 중 오류가 발생하면 기존 DB System으로 롤백한 뒤 연결을 재개합니다.

### 적용 및 검증 포인트

적용 전에는 DB System의 지원 여부와 유지보수 윈도우를 확인하고 애플리케이션의 연결 재시도 정책을 점검해야 합니다. 유지보수 전후의 복제 및 백업 상태, 연결 오류율, 주요 지표를 비교하면 중단 시간을 확인하는 데 도움이 됩니다.

### 제약 조건

요청한 MySQL 업그레이드가 메이저 버전 업그레이드가 아니어야 합니다. 또한 DB System에 HeatWave Cluster, Read Replica, Read Endpoint가 없어야 하며 Binary Log 보존 설정 등의 사전 조건을 충족해야 합니다. 조건을 충족하지 못하면 MySQL Server를 중지하고 Storage Clone을 사용하는 Offline Maintenance가 적용되어 읽기와 쓰기가 불가능한 시간이 더 길어질 수 있습니다.

---

## HeatWave: IPv6 Support

* **Services:** MySQL HeatWave
* **Release Date:** June 09, 2026
* **Release Note:** [HeatWave: IPv6 Support](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-ipv6-support.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Advanced Option: Connections](https://docs.oracle.com/iaas/mysql-database/doc/advanced-options.html#GUID-D8DB0BF6-CC45-499A-81F4-006A11C18703){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave DB System을 IPv6 주소로 생성할 수 있게 되었습니다. IPv6 기반 VCN이나 Dual-Stack 네트워크를 사용하는 환경에서 HeatWave의 연결 옵션을 확장할 수 있습니다.

### 주요 기능

* DB System의 생성, 복제, 수정, 복원 과정에서 IPv6 연결을 구성할 수 있습니다.
* Advanced Options의 Connections 영역에서 Endpoint와 연결 방식을 설정합니다.
* IPv4 접속 경로와 함께 검증해 Dual-Stack 환경으로 구성할 수 있습니다.

### 적용 및 검증 포인트

Subnet, Security List 또는 NSG, Route Rule, DNS, 방화벽 정책이 IPv6 경로를 지원하는지 먼저 확인해야 합니다. 클라이언트 드라이버와 애플리케이션도 IPv6 Endpoint에 정상적으로 연결되는지 테스트하는 것이 좋습니다.

### 설정 위치

IPv4와 IPv6 클라이언트의 접속 테스트를 분리해 수행하고, 각 경로에서 DNS 이름 해석과 보안 규칙이 의도대로 적용되는지 확인해야 합니다. DB System이 IPv6를 지원하더라도 네트워크 구성이나 클라이언트 지원이 누락되면 애플리케이션 연결이 실패할 수 있습니다.
