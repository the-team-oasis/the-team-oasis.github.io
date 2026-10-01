---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "9월 OCI Infrastructure 업데이트 소식"
teaser: "2026년 9월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2026-infrastructure
tags:
  - oci-release-notes-2026
  - Sep-2026
  - Infrastructure
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


## Management Agent Updates
* **Services:** Management Agent
* **Release Date:** September 16, 2026

### 업데이트 내용
Management Agent 9월 릴리즈에는 agent runtime과 관리 기능의 수정·개선이 포함됩니다. 운영 환경은 plugin 및 agent 버전을 확인한 뒤 정기 upgrade 절차에 반영해야 합니다.

### 참고

- [Release Note: Management Agent Updates](https://docs.oracle.com/iaas/releasenotes/management-agent/sep26-macs-updates.htm){:target="_blank" rel="noopener"}

## FastConnect Enhancements
* **Services:** Networking
* **Release Date:** September 16, 2026

### 업데이트 내용
OCI Networking의 FastConnect는 FastConnect partner, FastConnect direct, Oracle Interconnect의 모든 private virtual circuit에 traffic draining을 지원합니다. FastConnect direct cross-connect와 cross-connect group에는 minimum links, interface hold timer, Letter of Authorization(LOA) 관련 개선도 적용됩니다.

### 네트워크 연결 구성

traffic draining을 사용할 private virtual circuit과 해당 FastConnect 연결 방식을 먼저 구분합니다. direct cross-connect 또는 cross-connect group을 운영하는 경우에는 minimum links와 interface hold timer 설정이 기존 이중화·장애 전환 설계와 일치하는지 확인한 뒤 변경 창에 적용합니다.

### 동작 범위

traffic draining의 대상은 private virtual circuit이며, public virtual circuit까지 포함하는 기능으로 해석하면 안 됩니다. 이번 minimum links·hold timer·LOA 개선의 적용 범위도 FastConnect direct cross-connect와 cross-connect group으로 한정됩니다.


### 참고

- [Release Note: FastConnect Enhancements](https://docs.oracle.com/iaas/releasenotes/network/fast-connect-enhancements.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: FastConnect](https://docs.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: FastConnect overview](https://docs.oracle.com/iaas/Content/Network/Concepts/fastconnectoverview.htm){:target="_blank" rel="noopener"}

## Export Marketplace Customer Instance Reports as CSV
* **Services:** Marketplace
* **Release Date:** September 11, 2026

### 업데이트 내용
Marketplace Customer Instances report를 filter 후 background CSV export로 생성할 수 있습니다. 대규모 report는 완료 후 최신 결과를 다운로드하는 방식으로 처리합니다.

### 참고

- [Release Note: Export Marketplace Customer Instance Reports as CSV](https://docs.oracle.com/iaas/releasenotes/marketplace/customer-instance-report-csv-export.htm){:target="_blank" rel="noopener"}

## Oracle Cloud Migrations supports ARM migrations for AWS EC2 instances
* **Services:** Oracle Cloud Migrations
* **Release Date:** September 09, 2026

### 업데이트 내용
Oracle Cloud Migrations가 ARM architecture를 사용하는 지원 AWS EC2 instance의 OCI Compute migration을 지원합니다. discovery 결과와 target shape 호환성을 검증한 뒤 migration wave를 구성합니다.

### 대상 호환성

AWS EC2 ARM workload를 옮기기 전 OCI Compute shape, 운영체제 이미지, application binary의 ARM 호환성을 확인해야 합니다. migration test로 boot·network·애플리케이션 기동을 검증하고, unsupported dependency는 전환 계획에서 분리합니다.

### 참고

- [Release Note: Oracle Cloud Migrations supports ARM migrations for AWS EC2 instances](https://docs.oracle.com/iaas/releasenotes/cloud-migration/ocm_aws_ec2_instance_migration-arm.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Specifications for Using Oracle Cloud Migrations](https://docs.oracle.com/iaas/Content/cloud-migration/cloud-migration-requirements-specifications.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Compute Shapes](https://docs.oracle.com/iaas/Content/Compute/References/computeshapes.htm){:target="_blank" rel="noopener"}

## Configurable Fault Domain Host Balancing
* **Services:** Oracle Cloud VMware Solution
* **Release Date:** September 09, 2026

### 업데이트 내용
Oracle Cloud VMware Solution은 single AD SDDC와 cluster에서 fault domain host balancing을 구성할 수 있습니다. 기본 균등 배치 정책을 변경할 때 availability 영향을 검토해야 합니다.

### 적용 및 검증 포인트

Fault domain host balancing은 VMware workload의 host placement와 가용성 설계에 영향을 줍니다. 적용 전 cluster의 fault domain 정책과 workload 분산 요구사항을 확인하고, 변경 뒤 VM 배치와 장애 시 동작을 검증합니다.

### 참고

- [Release Note: Configurable Fault Domain Host Balancing](https://docs.oracle.com/iaas/releasenotes/oracle-cloud-vmware-solution/configurable-fault-domain-host-balancing.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Overview of Oracle Cloud VMware Solution](https://docs.oracle.com/iaas/Content/VMware/Concepts/ocvsoverview.htm#vmware-architecture){:target="_blank" rel="noopener"}

## Fixed issues and enhancements in OS Management Hub releases 3.7 and 3.8
* **Services:** OS Management Hub
* **Release Date:** September 09, 2026

### 업데이트 내용
OS Management Hub 3.7·3.8에는 management station·Ksplice·운영 기능의 수정과 개선이 포함됩니다. 관리 대상 환경은 agent와 service version을 확인해 업그레이드합니다.

### 참고

- [Release Note: Fixed issues and enhancements in OS Management Hub releases 3.7 and 3.8](https://docs.oracle.com/iaas/releasenotes/os-management-hub/release-3.7-3.8.htm){:target="_blank" rel="noopener"}

## OS Management Hub now supports IPv6
* **Services:** OS Management Hub
* **Release Date:** September 04, 2026

### 업데이트 내용
OS Management Hub API가 IPv4와 IPv6 연결을 지원합니다. IPv6 사용 환경은 필요한 support enablement와 access path를 확인해야 합니다.

### 적용 및 검증 포인트

OS Management Hub를 IPv6 환경에서 사용할 때는 management endpoint 접근 경로와 instance network policy가 IPv6를 허용하는지 확인해야 합니다. 관리 대상 instance에서 registration·patch·inventory 동작을 검증합니다.

### 참고

- [Release Note: OS Management Hub now supports IPv6](https://docs.oracle.com/iaas/releasenotes/os-management-hub/release-3.7_ipv6.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Overview of OS Management Hub](https://docs.oracle.com/iaas/osmh/doc/overview.htm#access){:target="_blank" rel="noopener"}
- [Oracle Documentation: OS Management Hub](https://docs.oracle.com/iaas/osmh/doc/home.htm){:target="_blank" rel="noopener"}

## IPv6 support for OCI Monitoring
* **Services:** Monitoring
* **Release Date:** September 03, 2026

### 업데이트 내용
OCI Monitoring API가 IPv4와 IPv6를 모두 처리하는 dual-stack endpoint를 지원합니다. monitoring client의 DNS·network policy를 IPv6 전환 계획과 함께 검토합니다.

### 적용 및 검증 포인트

Monitoring API의 dual-stack endpoint를 사용할 경우 metric 조회 client가 IPv6 DNS 결과와 network egress를 처리할 수 있어야 합니다. 기존 monitoring integration을 IPv4와 IPv6 경로에서 모두 시험합니다.


### 참고

- [Release Note: IPv6 support for OCI Monitoring](https://docs.oracle.com/iaas/releasenotes/monitoring/monitoring-ipv6.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Overview of Monitoring](https://docs.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#ways){:target="_blank" rel="noopener"}

## Resource Analytics - September 2026
* **Services:** Resource Analytics
* **Release Date:** September 03, 2026

### 업데이트 내용
Resource Analytics의 Compute·Networking·Bastion·GoldenGate data model이 확장되었습니다. resource analytics report와 운영 dashboard의 새 데이터 항목을 확인해야 합니다.

### 참고

- [Release Note: Resource Analytics - September 2026](https://docs.oracle.com/iaas/releasenotes/resource-analytics/resource-analytics-v2-7.htm){:target="_blank" rel="noopener"}

## Internet of Things (IoT) introduces Flow Runtime
* **Services:** Internet of Things
* **Release Date:** September 01, 2026

### 업데이트 내용
IoT Flow Runtime은 통합 Node-RED editor로 integration flow를 build·deploy·run하는 OCI managed 환경입니다. network access와 File Storage mount를 구성해 flow lifecycle을 운영할 수 있습니다.

### 흐름 운영

Flow Runtime은 Node-RED editor로 integration flow를 build·deploy·run하는 managed 환경입니다. flow가 필요한 network access와 File Storage mount를 구성한 뒤, 로그·metrics·events를 확인해 배포된 flow의 오류와 처리 상태를 운영 절차에 포함합니다.

> **Node-RED:** 이벤트 기반 흐름을 시각적으로 조합하는 오픈소스 프로그래밍 도구입니다. 이 업데이트에서는 Flow Runtime의 통합 editor로 사용됩니다. [Node-RED 공식 문서](https://nodered.org/docs/){:target="_blank" rel="noopener"}

### 참고

- [Release Note: Internet of Things (IoT) introduces Flow Runtime](https://docs.oracle.com/iaas/releasenotes/internet-of-things/update-09012026.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: IoT Flow Runtimes](https://docs.oracle.com/iaas/Content/internet-of-things/flow-runtimes.htm){:target="_blank" rel="noopener"}
- [Oracle Documentation: Using the IoT Flow Runtime Editor](https://docs.oracle.com/iaas/Content/internet-of-things/node-red.htm){:target="_blank" rel="noopener"}
