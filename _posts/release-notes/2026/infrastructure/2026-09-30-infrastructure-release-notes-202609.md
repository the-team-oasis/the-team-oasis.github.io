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

## OCI Cache Supports Dual-Stack Endpoints for IPv6
* **Services:** OCI Cache
* **Release Date:** September 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-ipv6-support.htm](https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-ipv6-support.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/ocicache/ipv6-support.htm](https://docs.oracle.com/iaas/Content/ocicache/ipv6-support.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

OCI Cache API와 cache cluster에 IPv6와 IPv4를 함께 지원하는 dual-stack endpoint가 추가되었습니다. IPv6 네트워크의 client는 기존 IPv4 호환성을 유지하면서 연결 경로를 전환할 수 있습니다.

### 적용 및 검증 포인트

Dual-stack endpoint는 IPv4와 IPv6 주소로 해석될 수 있는 API endpoint입니다. IPv6 네트워크에서 OCI Cache를 호출하려면 client DNS·egress·보안 정책이 IPv6 경로를 허용하는지 확인하고, IPv4/IPv6 모두에서 연결을 시험합니다.

## Code-only deployment for OCI Functions is now available
* **Services:** Functions
* **Release Date:** September 24, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-code-only-functions.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-code-only-functions.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_creating-code-only.htm](https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_creating-code-only.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

Go·Java·Node.js·Python managed runtime에서 container image를 직접 만들지 않는 code-only deployment를 지원합니다. ZIP archive 또는 지원되는 Java uber JAR 배포 흐름을 선택할 수 있습니다.

### 배포 방식 선택

Code-only deployment는 지원되는 managed runtime에서 container image를 직접 만들지 않고 ZIP archive 또는 Java uber JAR로 배포하는 방식입니다. runtime과 artifact 형식을 확인한 뒤 함수 실행·의존성 로딩·로그를 검증하고, image 기반 배포가 필요한 dependency는 기존 방식을 유지합니다.

## Client ID Metadata Document Support for OAuth Clients
* **Services:** IAM
* **Release Date:** September 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/identity/client-id-metadata-documents.htm](https://docs.oracle.com/iaas/releasenotes/identity/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/Identity/applications/client-id-metadata-documents.htm](https://docs.oracle.com/iaas/Content/Identity/applications/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

IAM identity domain의 OAuth client가 안정된 HTTPS URL의 Client ID Metadata Document를 사용할 수 있습니다. 지속적인 client registration 관리 부담을 줄이는 방식입니다.

### 보안 조건

Client ID Metadata Document는 안정된 HTTPS URL에서 제공되어야 하므로, 문서 URL의 가용성·TLS 인증서·내용 변경 통제를 client 등록 절차에 포함해야 합니다. 적용 후에는 identity domain이 metadata를 읽고 OAuth client 설정이 예상대로 유지되는지 확인합니다.

## Management Agent Updates
* **Services:** Management Agent
* **Release Date:** September 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-agent/sep26-macs-updates.htm](https://docs.oracle.com/iaas/releasenotes/management-agent/sep26-macs-updates.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Management Agent 9월 릴리즈에는 agent runtime과 관리 기능의 수정·개선이 포함됩니다. 운영 환경은 plugin 및 agent 버전을 확인한 뒤 정기 upgrade 절차에 반영해야 합니다.

## FastConnect Enhancements
* **Services:** Networking
* **Release Date:** September 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/network/fast-connect-enhancements.htm](https://docs.oracle.com/iaas/releasenotes/network/fast-connect-enhancements.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm](https://docs.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

FastConnect private virtual circuit에서 traffic draining을 지원하고 minimum link·hold timer·BGP MD5 관련 기능이 개선됩니다. 회선 변경과 failover 절차는 새 동작을 반영해 검토해야 합니다.

### 적용 및 검증 포인트

FastConnect 변경은 on-premises 또는 멀티클라우드 연결의 routing·redundancy 설계에 영향을 줄 수 있습니다. 적용 전 연결 topology와 BGP 운영 기준을 검토하고, 변경 뒤에는 경로·상태·장애 전환을 점검합니다.

## Export Marketplace Customer Instance Reports as CSV
* **Services:** Marketplace
* **Release Date:** September 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/marketplace/customer-instance-report-csv-export.htm](https://docs.oracle.com/iaas/releasenotes/marketplace/customer-instance-report-csv-export.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Marketplace Customer Instances report를 filter 후 background CSV export로 생성할 수 있습니다. 대규모 report는 완료 후 최신 결과를 다운로드하는 방식으로 처리합니다.

## Cross-Region Replication for OCI Cache
* **Services:** OCI Cache
* **Release Date:** September 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-cross-region-replication.htm](https://docs.oracle.com/iaas/releasenotes/oci-cache/sep2026-cross-region-replication.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/ocicache/cross-region-replication.htm](https://docs.oracle.com/iaas/Content/ocicache/cross-region-replication.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

OCI Cache가 primary cache cluster에서 다른 region의 secondary cluster로 비동기 cross-region replication을 지원합니다. DR 및 글로벌 read 전략에 replication lag와 failover 절차를 포함해야 합니다.

### DR 설계

Primary와 secondary cache cluster의 역할, 비동기 replication lag, failover 책임을 DR runbook에 명시해야 합니다. 복제 설정 후에는 secondary의 데이터 동기화와 장애 전환 절차를 비운영 환경에서 시험합니다.

## Oracle Cloud Migrations supports ARM migrations for AWS EC2 instances
* **Services:** Oracle Cloud Migrations
* **Release Date:** September 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/cloud-migration/ocm_aws_ec2_instance_migration-arm.htm](https://docs.oracle.com/iaas/releasenotes/cloud-migration/ocm_aws_ec2_instance_migration-arm.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/cloud-migration/cloud-migration-requirements-specifications.htm](https://docs.oracle.com/iaas/Content/cloud-migration/cloud-migration-requirements-specifications.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/Compute/References/computeshapes.htm](https://docs.oracle.com/iaas/Content/Compute/References/computeshapes.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

Oracle Cloud Migrations가 ARM architecture를 사용하는 지원 AWS EC2 instance의 OCI Compute migration을 지원합니다. discovery 결과와 target shape 호환성을 검증한 뒤 migration wave를 구성합니다.

### 대상 호환성

AWS EC2 ARM workload를 옮기기 전 OCI Compute shape, 운영체제 이미지, application binary의 ARM 호환성을 확인해야 합니다. migration test로 boot·network·애플리케이션 기동을 검증하고, unsupported dependency는 전환 계획에서 분리합니다.

### 적용 및 검증 포인트

AWS EC2 ARM workload는 OCI Compute shape와 OS image, application binary가 ARM을 지원하는지 확인해야 합니다. migration test에서 boot, network, application 기동을 검증하고 호환되지 않는 dependency는 별도 전환 계획으로 분리합니다.

## Configurable Fault Domain Host Balancing
* **Services:** Oracle Cloud VMware Solution
* **Release Date:** September 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/oracle-cloud-vmware-solution/configurable-fault-domain-host-balancing.htm](https://docs.oracle.com/iaas/releasenotes/oracle-cloud-vmware-solution/configurable-fault-domain-host-balancing.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/VMware/Concepts/ocvsoverview.htm#vmware-architecture](https://docs.oracle.com/iaas/Content/VMware/Concepts/ocvsoverview.htm#vmware-architecture){:target="_blank" rel="noopener"}
### 업데이트 내용

Oracle Cloud VMware Solution은 single AD SDDC와 cluster에서 fault domain host balancing을 구성할 수 있습니다. 기본 균등 배치 정책을 변경할 때 availability 영향을 검토해야 합니다.

### 적용 및 검증 포인트

Fault domain host balancing은 VMware workload의 host placement와 가용성 설계에 영향을 줍니다. 적용 전 cluster의 fault domain 정책과 workload 분산 요구사항을 확인하고, 변경 뒤 VM 배치와 장애 시 동작을 검증합니다.

## Fixed issues and enhancements in OS Management Hub releases 3.7 and 3.8
* **Services:** OS Management Hub
* **Release Date:** September 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/os-management-hub/release-3.7-3.8.htm](https://docs.oracle.com/iaas/releasenotes/os-management-hub/release-3.7-3.8.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OS Management Hub 3.7·3.8에는 management station·Ksplice·운영 기능의 수정과 개선이 포함됩니다. 관리 대상 환경은 agent와 service version을 확인해 업그레이드합니다.

## OS Management Hub now supports IPv6
* **Services:** OS Management Hub
* **Release Date:** September 04, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/os-management-hub/release-3.7_ipv6.htm](https://docs.oracle.com/iaas/releasenotes/os-management-hub/release-3.7_ipv6.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/osmh/doc/overview.htm#access](https://docs.oracle.com/iaas/osmh/doc/overview.htm#access){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/osmh/doc/home.htm](https://docs.oracle.com/iaas/osmh/doc/home.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

OS Management Hub API가 IPv4와 IPv6 연결을 지원합니다. IPv6 사용 환경은 필요한 support enablement와 access path를 확인해야 합니다.

### 적용 및 검증 포인트

OS Management Hub를 IPv6 환경에서 사용할 때는 management endpoint 접근 경로와 instance network policy가 IPv6를 허용하는지 확인해야 합니다. 관리 대상 instance에서 registration·patch·inventory 동작을 검증합니다.

## IPv6 support for OCI Monitoring
* **Services:** Monitoring
* **Release Date:** September 03, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/monitoring/monitoring-ipv6.htm](https://docs.oracle.com/iaas/releasenotes/monitoring/monitoring-ipv6.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#ways](https://docs.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#ways){:target="_blank" rel="noopener"}
### 업데이트 내용

OCI Monitoring API가 IPv4와 IPv6를 모두 처리하는 dual-stack endpoint를 지원합니다. monitoring client의 DNS·network policy를 IPv6 전환 계획과 함께 검토합니다.

### 적용 및 검증 포인트

Monitoring API의 dual-stack endpoint를 사용할 경우 metric 조회 client가 IPv6 DNS 결과와 network egress를 처리할 수 있어야 합니다. 기존 monitoring integration을 IPv4와 IPv6 경로에서 모두 시험합니다.

## Resource Analytics - September 2026
* **Services:** Resource Analytics
* **Release Date:** September 03, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-analytics/resource-analytics-v2-7.htm](https://docs.oracle.com/iaas/releasenotes/resource-analytics/resource-analytics-v2-7.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Analytics의 Compute·Networking·Bastion·GoldenGate data model이 확장되었습니다. resource analytics report와 운영 dashboard의 새 데이터 항목을 확인해야 합니다.

## Internet of Things (IoT) introduces Flow Runtime
* **Services:** Internet of Things
* **Release Date:** September 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/internet-of-things/update-09012026.htm](https://docs.oracle.com/iaas/releasenotes/internet-of-things/update-09012026.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/internet-of-things/flow-runtimes.htm](https://docs.oracle.com/iaas/Content/internet-of-things/flow-runtimes.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/internet-of-things/node-red.htm](https://docs.oracle.com/iaas/Content/internet-of-things/node-red.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

IoT Flow Runtime은 통합 Node-RED editor로 integration flow를 build·deploy·run하는 OCI managed 환경입니다. network access와 File Storage mount를 구성해 flow lifecycle을 운영할 수 있습니다.

### 흐름 운영

Flow Runtime은 Node-RED editor로 integration flow를 build·deploy·run하는 managed 환경입니다. flow가 필요한 network access와 File Storage mount를 구성한 뒤, 로그·metrics·events를 확인해 배포된 flow의 오류와 처리 상태를 운영 절차에 포함합니다.
