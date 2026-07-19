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
* **Documentation:** [Supported MySQL Server Versions](https://docs.oracle.com/iaas/mysql-database/doc/supported-mysql-server-versions.html){:target="_blank" rel="noopener"}, [Upgrading a DB System](https://docs.oracle.com/iaas/mysql-database/doc/upgrading-db-system.html){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave가 MySQL database version 9.7.1과 8.4.10을 지원합니다. 공식 릴리스 노트에 따르면 두 릴리스는 Critical Security Patch Update입니다.

보안 패치 성격이 강하므로 신규 DB system 생성 기준 버전과 기존 운영 DB의 패치 계획을 함께 검토해야 합니다. 업그레이드 전에는 애플리케이션 호환성, maintenance window, rollback 계획을 확인하는 것이 좋습니다.

### 주요 확인 포인트

* 새 버전 또는 지원 범위가 실제 생성·업그레이드 화면에서 선택 가능한지 확인해야 합니다.
* 기존 운영 버전과의 호환성, 패치 정책, 롤백 가능성을 함께 검토하는 것이 좋습니다.
* 운영 반영 전에는 테스트 환경에서 연결, 모니터링, 백업 또는 복구 절차가 기존과 동일하게 동작하는지 확인해야 합니다.

### 적용 및 검증 포인트

버전 업데이트 성격의 항목은 기능 자체보다 적용 시점과 호환성 확인이 중요합니다. Console/API에서 대상 버전이 보이는지, 기존 클라이언트와 드라이버가 영향을 받지 않는지, 업그레이드 후 주요 metric과 log에 이상이 없는지 점검하는 방식으로 검증하면 좋습니다.

## HeatWave: Near-Zero Downtime Maintenance Available for All Eligible DB Systems
* **Services:** MySQL HeatWave
* **Release Date:** June 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-near-zero-downtime-maintenance.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-near-zero-downtime-maintenance.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Maintenance of a Standalone DB System](https://docs.oracle.com/iaas/mysql-database/doc/maintenance-standalone-db-system.html){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave의 near-zero downtime maintenance가 eligible standalone DB system 전체로 확대되었습니다. 유지보수 중 서비스 중단 시간을 줄일 수 있어 운영 DB의 정기 패치 부담을 낮추는 데 도움이 됩니다.

적용 전에는 대상 DB system이 eligible 상태인지 확인하고, maintenance window와 애플리케이션 connection retry 정책을 함께 점검해야 합니다. 실제 운영에서는 패치 전후 복제/백업 상태와 애플리케이션 에러율을 비교해 near-zero downtime 효과를 확인하는 것이 좋습니다.

### 주요 변경 포인트

* 공식 릴리즈 노트 기준으로 서비스의 사용 방식 또는 운영 옵션이 확장되었습니다.
* 기존 운영 절차와 자동화 스크립트에 영향을 줄 수 있는 설정 항목을 먼저 확인하는 것이 좋습니다.
* Console, API, CLI 중 실제 운영에서 사용하는 경로 기준으로 적용 가능 여부를 검증해야 합니다.

### 적용 및 검증 포인트

운영 반영 전에는 테스트 환경에서 생성·수정·조회·삭제 흐름을 확인하고, 관련 IAM policy, network path, logging/monitoring 지표를 함께 점검하는 것이 좋습니다.

### 공식 문서 기반 제약 조건

공식 문서에 따르면 near-zero downtime maintenance는 MySQL server를 중지하지 않고 새 system으로 data를 replicate한 뒤, 마지막 전환 시점에 짧은 downtime을 두는 방식입니다. 반면 offline maintenance는 MySQL server를 중지하고 storage clone으로 일관성을 확보하므로 read/write 불가 시간이 더 길 수 있습니다.

Near-zero downtime maintenance는 모든 경우에 적용되는 것은 아닙니다. 요청한 MySQL upgrade가 major version upgrade가 아니어야 하고, DB system에 HeatWave cluster, Read Replica, Read Endpoint가 없어야 하며, binary log 보존 설정 등 prerequisites를 만족해야 합니다. 오류가 발생하면 maintenance process는 중단되고 old DB system으로 rollback된 뒤 connection이 재개됩니다.

## HeatWave: IPv6 Support
* **Services:** MySQL HeatWave
* **Release Date:** June 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-ipv6-support.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-ipv6-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Advanced Option: Connections](https://docs.oracle.com/iaas/mysql-database/doc/advanced-options.html#GUID-D8DB0BF6-CC45-499A-81F4-006A11C18703){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave DB system을 IPv6 address로 생성할 수 있게 되었습니다. IPv6 기반 VCN 설계나 dual-stack 네트워크 전략을 사용하는 환경에서 HeatWave 연결 옵션이 넓어집니다.

적용 시에는 subnet, security list/NSG, client driver, DNS, 방화벽 정책이 IPv6 경로를 지원하는지 확인해야 합니다. 신규 DB system 생성 옵션이므로 기존 IPv4 기반 접속 경로와 병행 검증하는 것이 안전합니다.

### 주요 변경 포인트

* 공식 릴리즈 노트 기준으로 서비스의 사용 방식 또는 운영 옵션이 확장되었습니다.
* 기존 운영 절차와 자동화 스크립트에 영향을 줄 수 있는 설정 항목을 먼저 확인하는 것이 좋습니다.
* Console, API, CLI 중 실제 운영에서 사용하는 경로 기준으로 적용 가능 여부를 검증해야 합니다.

### 적용 및 검증 포인트

운영 반영 전에는 테스트 환경에서 생성·수정·조회·삭제 흐름을 확인하고, 관련 IAM policy, network path, logging/monitoring 지표를 함께 점검하는 것이 좋습니다.

### 공식 문서 기반 설정 위치

IPv6 관련 연결 설정은 HeatWave DB system 생성·clone·edit·restore 화면의 Advanced options 중 **Connections** 영역에서 확인하는 흐름입니다. 이 영역은 DB system의 endpoint와 접속 방식을 정하는 설정이므로, IPv6를 사용할 때는 VCN/subnet의 IPv6 구성과 client 접근 경로를 함께 확인해야 합니다.

운영 검증은 IPv4 client와 IPv6 client의 접속 테스트를 분리해 수행하는 것이 좋습니다. 보안 목록, NSG, route rule, DNS 이름 해석이 IPv6 경로에서도 동일하게 맞는지 확인하지 않으면 DB system은 지원하더라도 실제 애플리케이션 연결이 실패할 수 있습니다.
