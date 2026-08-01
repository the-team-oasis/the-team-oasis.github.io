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


## Oracle Interconnect for AWS
* **Services:** Oracle Cloud Infrastructure
* **Release Date:** July 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/interconnect-aws.htm](https://docs.oracle.com/iaas/releasenotes/console/interconnect-aws.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Interconnect for AWS를 사용할 수 있게 되었습니다. OCI와 AWS 환경을 연결하는 멀티클라우드 네트워크 구성을 공식적으로 다룰 수 있어, 두 클라우드에 분산된 워크로드 간 통신 경로를 더 명확하게 설계할 수 있습니다.

### 운영 시 참고 사항

멀티클라우드 연결은 네트워크 경계, 라우팅, 보안 정책, 비용에 직접 영향을 줍니다. 적용 전 연결 대상 VCN/VPC, CIDR 중복, 라우팅 전파, 보안 목록 또는 NSG 정책을 함께 검토하는 것이 좋습니다.

## Console AI Experience Preview Availability
* **Services:** Console
* **Release Date:** July 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-oc1-july-2026.htm](https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-oc1-july-2026.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Console에서 자연어 기반으로 작업을 돕는 Console AI Experience Preview가 제공됩니다. 콘솔 내 작업 탐색과 운영 질문 대응을 AI 대화형 경험으로 보완할 수 있습니다.

### 운영 시 참고 사항

Preview 기능은 사용 가능 리전과 계정 조건이 제한될 수 있습니다. 운영 절차서나 고객 데모에 반영하기 전 기능 표시 여부와 응답 범위를 실제 테넌시에서 확인해야 합니다.

## Export Sunburst and Treemap widget data to CSV
* **Services:** Management Dashboards
* **Release Date:** July 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/sunburst-treemap-export-csv.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/sunburst-treemap-export-csv.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Management Dashboards의 Sunburst 및 Treemap 위젯 데이터를 CSV로 내보낼 수 있습니다. 시각화 위젯의 원천 데이터를 보고서나 후속 분석에 재사용하기 쉬워졌습니다.

### 운영 시 참고 사항

CSV 내보내기 결과가 대시보드 필터와 시간 범위를 정확히 반영하는지 확인해야 합니다. 공유 보고서에 사용할 때는 포함된 리소스명이나 태그 정보의 민감도를 점검하는 것이 좋습니다.

## Add ZPR security attributes to Network Firewall
* **Services:** Network Firewall, Zero Trust Packet Routing
* **Release Date:** July 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/network-firewall/zpr-network-firewall-supported.htm](https://docs.oracle.com/iaas/releasenotes/network-firewall/zpr-network-firewall-supported.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Network Firewall에 Zero Trust Packet Routing(ZPR) 보안 속성을 추가할 수 있습니다. 네트워크 경계와 보안 속성 기반 통제를 함께 설계할 수 있는 범위가 넓어졌습니다.

### 운영 시 참고 사항

ZPR 보안 속성은 트래픽 허용 경로에 직접 영향을 줄 수 있습니다. 기존 Firewall 정책, 라우팅, 보안 속성 할당 상태를 함께 검토하고 변경 전 영향 범위를 확인해야 합니다.

## Console AI Experience Preview for Free Tier and Always Free Customers
* **Services:** Console
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-july-2026.htm](https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-july-2026.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Free Tier 및 Always Free 고객도 Console AI Experience Preview를 사용할 수 있게 되었습니다. 초기 학습, 테스트, 데모 환경에서도 AI 기반 Console 지원 경험을 확인할 수 있습니다.

### 운영 시 참고 사항

무료 계정에서 확인한 기능이 모든 상용 환경에 동일하게 보이는 것은 아닐 수 있습니다. 고객 안내 시 계정 유형, 리전, Preview 조건을 함께 확인하는 것이 좋습니다.

## Resource Manager adds premium jobs for higher concurrent job limits
* **Services:** Resource Manager
* **Release Date:** July 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-manager/resource-manager-premium-jobs.htm](https://docs.oracle.com/iaas/releasenotes/resource-manager/resource-manager-premium-jobs.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Manager에서 더 높은 동시 실행 한도를 제공하는 Premium Job을 사용할 수 있습니다. Terraform/OpenTofu 기반 자동화 작업을 많이 실행하는 환경에서 병렬 처리 여지를 확대할 수 있습니다.

### 운영 시 참고 사항

동시 실행 수 증가는 배포 속도를 높일 수 있지만 리소스 생성·변경이 동시에 발생합니다. 비용, quota, state lock, 실패 시 롤백 절차를 먼저 확인해야 합니다.

## New Overview page and guided setup for Resource Analytics
* **Services:** Resource Analytics
* **Release Date:** July 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-analytics/ux-wizard.htm](https://docs.oracle.com/iaas/releasenotes/resource-analytics/ux-wizard.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Analytics에 새로운 Overview 페이지와 guided setup이 제공됩니다. 리소스 사용 현황을 분석하기 위한 초기 설정과 탐색 흐름이 더 직관적으로 개선되었습니다.

### 운영 시 참고 사항

운영 대시보드로 활용하려면 분석 대상 compartment, tag, 권한 범위를 명확히 해야 합니다. 고객 환경에서는 표시되는 리소스 범위가 IAM 정책과 일치하는지 먼저 검증하는 것이 좋습니다.
