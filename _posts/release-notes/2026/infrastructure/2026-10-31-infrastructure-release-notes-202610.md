---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "10월 OCI Infrastructure 업데이트 소식"
teaser: "2026년 10월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2026-infrastructure
tags:
  - oci-release-notes-2026
  - Oct-2026
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

## Network Address Translation (NAT) Now Available for Dynamic Routing Gateway (DRG)

* **Services:** Networking
* **Release Date:** 2026년 10월 1일
**분류:** Infrastructure

### 업데이트 내용

OCI Dynamic Routing Gateway(DRG)가 IPv4 Network Address Translation(NAT)을 지원합니다. DRG attachment에 source NAT, destination NAT 또는 양쪽 모두에 대한 NAT 정책을 구성할 수 있으며, VCN·리전·OCI와 원격 위치 사이의 IP 주소 중복 환경에서 1:1 IPv4 주소 변환을 지원합니다.

주소 대역이 겹치는 네트워크를 연결하는 설계에서는 NAT 정책을 DRG attachment 단위로 관리할 수 있습니다. 도입 전에는 연결 경로별 원본·대상 주소 변환 규칙과 중복 CIDR 범위를 명확히 정리하고, 변환 후 라우팅·보안 규칙이 의도대로 동작하는지 검증해야 합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/network/nat-drg.htm
- DRG NAT 관리: https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/nat-drg-home.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Console AI Availability: 지원 리전 확대

* **Services:** Console
* **Release Date:** 2026년 10월 6일
**분류:** Infrastructure

### 업데이트 내용

Console AI는 Ashburn, Phoenix, London, Chicago, Sao Paulo, Osaka, Hyderabad, Riyadh 중 하나를 홈 리전으로 사용하거나 구독하고, Console AI에 대한 기본 접근 권한(native access)이 있는 상용 OCI 고객에게 제공됩니다. 테넌시 홈 리전에서 Console AI를 사용할 수 없는 경우 지원되는 리전을 구독해 사용할 수 있습니다. 가용 범위는 순차적으로 확대될 예정입니다.

### 참고

- [Release Note: Console AI Availability](https://docs.oracle.com/iaas/releasenotes/console/consoleai-availability-oct-2026.htm)
- [Documentation: Console AI](https://docs.oracle.com/iaas/Content/GSG/Concepts/consoleai-overview.htm)

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Resource Analytics - October 2026

* **Services:** Resource Analytics
* **Release Date:** 2026년 10월 9일
**분류:** Infrastructure

### 업데이트 내용

Resource Analytics 2.8은 ADW 리소스 데이터 범위에 Announcements, FastConnect, File Storage, Java Management, Management Agent, Rover, Zero Trust Packet Routing(ZPR) 등 7개 서비스를 추가했습니다. Block Volume에는 볼륨 백업 정책 할당 세부 정보도 추가되었습니다.

### 분석 범위

OAC Subject Area에서는 FastConnect의 cross-connect·virtual circuit 상태와 대역폭 관련 속성, File Storage의 export·mount target·복제 관계, Java Management의 fleet 및 JMS 플러그인, Management Agent의 가용성·버전·호스트 연결, Rover 인벤토리, ZPR 구성 및 정책을 분석할 수 있습니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/resource-analytics/resource-analytics-v2-8.htm
- Resource Analytics 개요 및 릴리스 정보: https://docs.oracle.com/en-us/iaas/Content/resource-analytics/overview.htm#releases-about

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Introducing the Public Safety and Security Service and Oracle Radio

* **Services:** Oracle Cloud Infrastructure, Public Safety and Security
* **Release Date:** 2026년 10월 14일
**분류:** Infrastructure

### 업데이트 내용

Oracle Public Safety and Security 서비스와 Oracle Radio가 미국 동부(Ashburn, `us-ashburn-1`) 및 미국 서부(Phoenix, `us-phoenix-1`) 리전에서 일반 제공됩니다. 이 서비스는 승인된 팀이 Oracle Radio 모바일·브라우저 애플리케이션을 사용해 격리된 환경에서 통신하도록 지원하며, 채널 기반 PTT(push-to-talk) 음성 및 텍스트 메시징을 제공합니다.

### 운영 시작 절차

관리자는 OCI Identity Domain을 인증에 사용하도록 Public Safety and Security 인스턴스를 생성하고 접근을 구성한 후 Radio 사용자·그룹·권한·채널을 관리합니다. 인스턴스 생성 전에는 고객 소유 compartment, 연결할 Identity Domain, 활성화된 초기 관리자 사용자, 그리고 Public Safety and Security 서비스가 해당 도메인의 애플리케이션 서비스와 사용자를 조회할 수 있도록 하는 tenancy 정책을 준비해야 합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/public-safety-security/service-launch.htm
- Public Safety and Security 시작하기: https://docs.oracle.com/en-us/iaas/public-safety-security/get-started.htm

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Self-service continuous consumption discount commitments are now available

* **Services:** Billing
* **Release Date:** 2026년 10월 19일
**분류:** Infrastructure

### 업데이트 내용

Oracle Cloud Console, CLI, API를 사용해 적격 pricing offer를 검토하고 CCD(Continuous Consumption Discount) commitment를 생성할 수 있습니다. CCD는 정해진 조건에 따라 적격 리소스 사용량 또는 용량을 약정하면 할인 가격을 적용합니다.

Console의 **Billing & Cost Management > Continuous Consumption Discounts**에서 적격 offer를 찾고, 약정 조건을 검토하며, 기존 commitment를 추적할 수 있습니다. Offer는 대상 제품·사용량 측정 항목·수량 규칙·가격·지역 범위·기간 등의 조건을 정의하고, commitment는 선택한 구독·수량·적용 제품·가격 규칙·시작 및 종료 조건을 기록합니다.

CCD 가격 약정 자체가 리소스 용량을 예약하는 것은 아닙니다. 가용 용량은 별도 예약·할당·제공 조건이 결정하므로, 비용 절감 약정과 실제 용량 확보 계획을 분리해 검토해야 합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/billing/continuous-consumption-discounts.htm
- Continuous Consumption Discounts 가이드: https://docs.oracle.com/en-us/iaas/Content/Billing/Concepts/pricing-offers-and-commitments.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Log Analytics: VCN Flow 대시보드 추가

* **Services:** Log Analytics
* **Release Date:** 2026년 10월 19일

### 업데이트 내용

OCI Log Analytics에 Oracle 제공 **VCN Flow** 대시보드가 추가되었습니다. OCI VCN Flow Logs를 사용해 네트워크 트래픽을 모니터링하고 연결성 및 보안 조사에 활용할 수 있습니다.

Overview 탭에서는 기록된 활동과 수집 상태를 확인하고, Traffic Analysis에서는 출발지·목적지·포트·프로토콜·서브넷 활동을 분석할 수 있습니다. Security Analysis는 추가 조사가 필요한 활동을 식별하며, 대시보드 위젯 결과는 Log Explorer에서 관련 레코드와 함께 상세 확인할 수 있습니다.

### 참고

- Release Note: https://docs.oracle.com/iaas/releasenotes/log-analytics/oct26-vcn-flow-dashboard.htm
- Oracle 문서 — Oracle-defined Dashboards for Log Analytics: https://docs.oracle.com/iaas/log-analytics/doc/oracle-defined-dashboards-logging-analytics.html

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Full Stack Disaster Recovery introduces support for PostgreSQL DB System and enhancements to moving compute instances

* **Services:** Full Stack Disaster Recovery
* **Release Date:** 2026년 10월 20일
**분류:** Infrastructure

### 업데이트 내용

Full Stack Disaster Recovery(FSDR)는 PostgreSQL DB System을 DR Protection Group에 추가하고, OCI 리전 간 primary와 warm standby DB System 사이의 switchover 및 failover를 오케스트레이션할 수 있도록 지원합니다.

### PostgreSQL DB System 보호 그룹 구성

PostgreSQL DB System을 보호 그룹에 추가하기 전에 primary와 warm standby를 구성하고 복제가 정상인지 확인해야 합니다. Primary DR Protection Group에는 primary DB System과 warm standby peer를, standby DR Protection Group에는 warm standby와 primary peer를 각각 선택한 뒤 구성 변경 사항을 publish합니다.

### Moving Instance 네트워크 구성 개선

Moving Instance에는 대상 standby 리전 subnet에서 private IP 주소와 hostname label을 예약하는 **Destination reserved private IP**를 구성할 수 있습니다. 기존 DR Protection Group은 이전의 destination primary private IP address 및 hostname label 필드를 계속 사용할 수 있습니다.

또한 drill 전용 VNIC mapping을 구성해 drill 동안 격리된 DR 환경에서 standby 인스턴스를 시작하거나 기존 VNIC mapping을 재사용할 수 있습니다. 모든 VNIC에 대한 mapping을 제공하지 않으면 DR Plan 생성 시 오류가 발생할 수 있습니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/disaster-recovery/oct-2026.htm
- PostgreSQL DB System을 DR Protection Group에 추가: https://docs.oracle.com/en/cloud/iaas/disaster-recovery/cssgm/manage-disaster-recovery-protection-groups/add-a-postgresql-db-system-to-a-disaster-recovery-protection-group.html
- Moving Instance를 DR Protection Group에 추가: https://docs.oracle.com/en/cloud/iaas/disaster-recovery/cssgm/manage-disaster-recovery-protection-groups/add-a-moving-instance-to-a-disaster-recovery-protection-group.html

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Validate GPU cluster health with Cluster Health Checks

* **Services:** Compute
* **Release Date:** 2026년 10월 22일
**분류:** Infrastructure

### 업데이트 내용

OCI가 AI 및 HPC 워크로드 실행 전 GPU 클러스터의 준비 상태를 검증하고 비정상 GPU 노드를 식별할 수 있는 Cluster Health Checks(CHC)를 제공합니다. CHC는 GPU, 드라이버, 네트워크 상태를 확인하는 passive check와, 부하 상태에서 GPU·데이터 전송·노드 간 통신을 평가하는 선택적 active test를 제공합니다.

### 운영 모델

Passive check는 지원되는 GPU 인스턴스에서 Oracle Cloud Agent를 통해 실행하며 Slurm 또는 Kubernetes 애드온이 필요하지 않습니다. Active check는 Slurm용 CHC 애드온, Kubernetes용 CHC Helm chart 또는 지원되는 OCI HPC stack 통합을 사용해 실행할 수 있습니다.

OKE GPU Host Repair를 사용하는 지원 대상 OKE 클러스터에서는 GPU Health Monitoring 통합 및 복구 정책과 함께 CHC health signal을 복구 자동화에 사용할 수 있습니다. 다만 CHC는 애플리케이션 워크로드를 스케줄링하거나 향후 작업 성공을 보장하거나 OCI 하드웨어 유지보수 워크플로를 대체하지는 않습니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/compute/cluster-health-checks.htm
- Cluster Health Checks 개요: https://docs.oracle.com/en-us/iaas/Content/Compute/Concepts/chc-overview.htm

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->
