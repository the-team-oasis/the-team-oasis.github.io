---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI Infrastructure 업데이트 소식"
teaser: "2026년 7월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2026-infrastructure

tags:
  - oci-release-notes-2026
  - Jul-2026
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

## New Overview page and guided setup for Resource Analytics
* **Services:** Resource Analytics
* **Release Date:** July 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-analytics/ux-wizard.htm](https://docs.oracle.com/iaas/releasenotes/resource-analytics/ux-wizard.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Creating an Instance](https://docs.oracle.com/iaas/Content/resource-analytics/create-instance.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Analytics에 새로운 Overview 페이지와 Guided Setup이 추가되었습니다. 서비스 요구사항과 필수 사전 조건을 안내하고, 인스턴스 생성 과정에서 필요한 권한을 미리 검증해 설정 문제를 빠르게 확인할 수 있습니다.

처음 서비스를 구성할 때는 분석 대상 Compartment와 IAM 권한을 먼저 정리한 뒤 Guided Setup의 검증 결과를 확인하는 것이 좋습니다. 초기 구성 후에는 Overview 페이지에서 리소스 수집 범위와 분석 데이터가 의도한 범위로 표시되는지 점검해야 합니다.

## Resource Manager adds premium jobs for higher concurrent job limits
* **Services:** Resource Manager
* **Release Date:** July 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-manager/resource-manager-premium-jobs.htm](https://docs.oracle.com/iaas/releasenotes/resource-manager/resource-manager-premium-jobs.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Enabling Premium Jobs](https://docs.oracle.com/iaas/Content/ResourceManager/Concepts/premium-jobs.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Manager에서 더 높은 동시 실행 한도가 필요한 환경을 위한 Premium Job을 지원합니다. 여러 Stack의 Terraform 또는 OpenTofu 작업을 병렬로 실행하는 조직은 Job 대기 시간을 줄이고 Infrastructure as Code 배포 처리량을 높일 수 있습니다.

동시 실행 수를 늘리기 전에는 Stack 간 의존성과 공유 리소스 변경 여부를 확인해야 합니다. 동일한 네트워크, IAM Policy, Tag Namespace를 여러 Job이 동시에 변경하지 않도록 실행 순서와 Rollback 절차를 함께 설계하는 것이 중요합니다.

## Console AI Experience Preview for Free Tier and Always Free Customers
* **Services:** Console
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-july-2026.htm](https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-july-2026.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Free Tier와 Always Free 고객도 Console AI Experience Preview를 사용할 수 있게 되었습니다. 학습과 실습 환경에서도 자연어를 사용해 OCI 리소스를 탐색하고 일반적인 작업 절차와 사용량 정보를 확인할 수 있습니다.

Console AI는 사용자의 OCI IAM 권한과 현재 Console Context를 기준으로 동작하며, 리소스 변경 작업에는 사용자의 검토와 승인이 필요합니다. Preview 기능과 서비스 가용 범위는 계정과 Region에 따라 다를 수 있으므로 실제 Tenancy에서 지원 여부를 확인해야 합니다.

## Add ZPR security attributes to Network Firewall
* **Services:** Network Firewall, Zero Trust Packet Routing
* **Release Date:** July 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/network-firewall/zpr-network-firewall-supported.htm](https://docs.oracle.com/iaas/releasenotes/network-firewall/zpr-network-firewall-supported.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Network Firewall Security Attributes](https://docs.oracle.com/iaas/Content/network-firewall/manage-security-attributes-network-firewall.htm){:target="_blank" rel="noopener"}, [Security Attributes](https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/security-attributes.htm){:target="_blank" rel="noopener"}, [ZPR Policy Overview](https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/zpr-policy-overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Network Firewall에 Zero Trust Packet Routing(ZPR) Security Attribute를 추가할 수 있게 되었습니다. Network Firewall을 속성 기반 접근 제어 정책의 대상으로 포함해 Endpoint와 Firewall 사이의 통신을 ZPR Policy로 관리할 수 있습니다.

적용 전에는 Security Attribute와 ZPR Policy뿐 아니라 기존 Route Table, NSG, Security List, Network Firewall Rule을 함께 검토해야 합니다. 테스트 환경에서 정상 트래픽과 차단 트래픽을 확인한 뒤 운영 환경에 단계적으로 적용하는 것이 안전합니다.

## Export Sunburst and Treemap widget data to CSV
* **Services:** Management Dashboards
* **Release Date:** July 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/sunburst-treemap-export-csv.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/sunburst-treemap-export-csv.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Create a Custom Dashboard](https://docs.oracle.com/iaas/management-dashboard/doc/create-custom-dashboard.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Management Dashboards에서 Sunburst와 Treemap Widget의 데이터를 CSV 파일로 내보낼 수 있게 되었습니다. 계층 구조와 비율을 시각화한 데이터를 외부 분석 도구나 운영 보고서에서 재사용하기 쉬워졌습니다.

정기 보고에 사용하는 경우 Widget의 Filter, Time Range, Group-by 기준을 고정해 결과의 일관성을 유지하는 것이 좋습니다. CSV에 Resource Name, Compartment, Tag와 같은 내부 식별 정보가 포함될 수 있으므로 외부 공유 전 데이터 검토가 필요합니다.

## Console AI Experience Preview Availability
* **Services:** Console
* **Release Date:** July 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-oc1-july-2026.htm](https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-oc1-july-2026.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Deny Policies](https://docs.oracle.com/iaas/Content/Identity/policysyntax/denypolicies.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Console AI Experience Preview는 OCI Console에서 자연어를 사용해 리소스를 탐색하고, 지원되는 작업과 문제 해결 절차, 과금 및 사용량 정보를 확인할 수 있도록 지원합니다. 사용자의 현재 IAM 권한, 선택한 Region, Compartment, Resource Context를 기준으로 응답합니다.

리소스를 변경하는 작업은 사용자의 검토와 승인을 거쳐야 하며 IAM 권한을 우회하지 않습니다. 운영 환경에서는 최소 권한 원칙을 유지하고, 민감한 Compartment에 대한 접근과 변경 작업이 기존 Policy 및 Deny Policy 기준에 맞게 제한되는지 확인해야 합니다.

## Oracle Interconnect for AWS
* **Services:** Oracle Cloud Infrastructure
* **Release Date:** July 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/interconnect-aws.htm](https://docs.oracle.com/iaas/releasenotes/console/interconnect-aws.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Interconnect for AWS](https://docs.oracle.com/iaas/Content/multicloud/interconnect-aws.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Interconnect for AWS를 사용해 OCI와 AWS 사이에 전용 멀티클라우드 연결을 구성할 수 있습니다. OCI와 AWS에 분산된 애플리케이션과 데이터베이스가 사설 연결 경로를 통해 통신하도록 설계할 수 있어 멀티클라우드 워크로드의 네트워크 구성을 단순화할 수 있습니다.

구성 전에는 OCI VCN과 AWS VPC의 CIDR 중복 여부, 양쪽 Route Table과 보안 규칙, DNS 해석 경로를 함께 검토해야 합니다. 구축 후에는 양쪽 Cloud의 Flow Log와 연결 상태를 확인하고, 예상 지연 시간과 데이터 전송 경로가 설계 기준에 맞는지 검증해야 합니다.
