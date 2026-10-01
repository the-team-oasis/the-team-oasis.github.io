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

### 업데이트 내용

OCI Cache API와 cache cluster에 IPv6와 IPv4를 함께 지원하는 dual-stack endpoint가 추가되었습니다. IPv6 네트워크의 client는 기존 IPv4 호환성을 유지하면서 연결 경로를 전환할 수 있습니다.

## Code-only deployment for OCI Functions is now available
* **Services:** Functions
* **Release Date:** September 24, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-code-only-functions.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-code-only-functions.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Go·Java·Node.js·Python managed runtime에서 container image를 직접 만들지 않는 code-only deployment를 지원합니다. ZIP archive 또는 지원되는 Java uber JAR 배포 흐름을 선택할 수 있습니다.

## Client ID Metadata Document Support for OAuth Clients
* **Services:** IAM
* **Release Date:** September 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/identity/client-id-metadata-documents.htm](https://docs.oracle.com/iaas/releasenotes/identity/client-id-metadata-documents.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

IAM identity domain의 OAuth client가 안정된 HTTPS URL의 Client ID Metadata Document를 사용할 수 있습니다. 지속적인 client registration 관리 부담을 줄이는 방식입니다.

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

### 업데이트 내용

FastConnect private virtual circuit에서 traffic draining을 지원하고 minimum link·hold timer·BGP MD5 관련 기능이 개선됩니다. 회선 변경과 failover 절차는 새 동작을 반영해 검토해야 합니다.

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

### 업데이트 내용

OCI Cache가 primary cache cluster에서 다른 region의 secondary cluster로 비동기 cross-region replication을 지원합니다. DR 및 글로벌 read 전략에 replication lag와 failover 절차를 포함해야 합니다.

## Oracle Cloud Migrations supports ARM migrations for AWS EC2 instances
* **Services:** Oracle Cloud Migrations
* **Release Date:** September 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/cloud-migration/ocm_aws_ec2_instance_migration-arm.htm](https://docs.oracle.com/iaas/releasenotes/cloud-migration/ocm_aws_ec2_instance_migration-arm.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud Migrations가 ARM architecture를 사용하는 지원 AWS EC2 instance의 OCI Compute migration을 지원합니다. discovery 결과와 target shape 호환성을 검증한 뒤 migration wave를 구성합니다.

## Configurable Fault Domain Host Balancing
* **Services:** Oracle Cloud VMware Solution
* **Release Date:** September 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/oracle-cloud-vmware-solution/configurable-fault-domain-host-balancing.htm](https://docs.oracle.com/iaas/releasenotes/oracle-cloud-vmware-solution/configurable-fault-domain-host-balancing.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud VMware Solution은 single AD SDDC와 cluster에서 fault domain host balancing을 구성할 수 있습니다. 기본 균등 배치 정책을 변경할 때 availability 영향을 검토해야 합니다.

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

### 업데이트 내용

OS Management Hub API가 IPv4와 IPv6 연결을 지원합니다. IPv6 사용 환경은 필요한 support enablement와 access path를 확인해야 합니다.

## IPv6 support for OCI Monitoring
* **Services:** Monitoring
* **Release Date:** September 03, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/monitoring/monitoring-ipv6.htm](https://docs.oracle.com/iaas/releasenotes/monitoring/monitoring-ipv6.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Monitoring API가 IPv4와 IPv6를 모두 처리하는 dual-stack endpoint를 지원합니다. monitoring client의 DNS·network policy를 IPv6 전환 계획과 함께 검토합니다.

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

### 업데이트 내용

IoT Flow Runtime은 통합 Node-RED editor로 integration flow를 build·deploy·run하는 OCI managed 환경입니다. network access와 File Storage mount를 구성해 flow lifecycle을 운영할 수 있습니다.
