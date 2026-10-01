---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "9월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2026년 9월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-dataplatform
tags:
  - oci-release-notes-2026
  - Sep-2026
  - DATAPLATFORM
  - DATABASE
  - ORACLE
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

## Simplify linking widgets to dashboard filters
* **Services:** Management Dashboards
* **Release Date:** September 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/linking-widgets-dashboard-filters.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/linking-widgets-dashboard-filters.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Management Dashboards에서 dashboard filter와 widget의 연결 관계를 더 쉽게 구성할 수 있습니다. 여러 widget을 포함한 운영 dashboard의 filter 설계와 유지보수가 단순해집니다.

## Highlight linked widgets and filters
* **Services:** Management Dashboards
* **Release Date:** September 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/highlight-linked-widgets-filters.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/highlight-linked-widgets-filters.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Dashboard view mode에서 filter와 연결된 widget 관계를 식별할 수 있습니다. 운영자는 filter 변경이 영향을 주는 widget 범위를 빠르게 확인할 수 있습니다.

## Add all widget inputs as local filters
* **Services:** Management Dashboards
* **Release Date:** September 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/widget-inputs-as-local-filters.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/widget-inputs-as-local-filters.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Widget control panel의 All inputs 옵션으로 eligible input을 local filter로 추가할 수 있습니다. 개별 widget에 필요한 입력값을 빠르게 노출하는 데 사용할 수 있습니다.

## Configure dashboard filters as local filters
* **Services:** Management Dashboards
* **Release Date:** September 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/dashboard-filters-as-local-filters.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/dashboard-filters-as-local-filters.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

기존 dashboard filter를 특정 widget에만 적용되는 local filter로 구성할 수 있습니다. 공용 filter와 widget별 filter의 적용 범위를 분리해 dashboard를 설계할 수 있습니다.

## Oracle JDK 27 - Released September 15, 2026
* **Services:** Java Management
* **Release Date:** September 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/java-management/jdk-27-release-note.htm](https://docs.oracle.com/iaas/releasenotes/java-management/jdk-27-release-note.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Java Management Service가 JDK 27을 제공합니다. 관리 대상 Java runtime의 지원 범위와 application 호환성 검증 계획을 수립해야 합니다.

## Enhanced Rack Visualization and Component Details in Exadata Insights
* **Services:** Ops Insights
* **Release Date:** September 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/operations-insights/exadata-rack-components.htm](https://docs.oracle.com/iaas/releasenotes/operations-insights/exadata-rack-components.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/operations-insights/doc/exadata-insights.html](https://docs.oracle.com/iaas/operations-insights/doc/exadata-insights.html){:target="_blank" rel="noopener"}
### 업데이트 내용

Exadata Insights의 Rack and key metrics tab이 interactive rack visualization과 component-level 정보를 제공합니다. Exadata 운영자는 rack 구성과 component 상태를 더 세밀하게 확인할 수 있습니다.

### 운영 활용

Rack visualization은 Exadata rack 구성과 component-level 정보를 함께 보려는 운영자에게 유용합니다. component 상태를 확인할 때는 해당 대상이 Insights에 정상 등록·수집되고 있는지 먼저 점검하고, 이상 징후는 기존 incident 절차와 연결합니다.

## Monitor and Manage Scheduler Jobs
* **Services:** Database Management
* **Release Date:** September 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-management/scheduler-jobs.htm](https://docs.oracle.com/iaas/releasenotes/database-management/scheduler-jobs.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Management에서 Managed Database scheduler job을 모니터링하고 관리할 수 있습니다. job 상태와 실행 이력을 database 운영 dashboard에서 확인할 수 있습니다.

## Manage SQL Profiles
* **Services:** Database Management
* **Release Date:** September 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-management/sql-profiles.htm](https://docs.oracle.com/iaas/releasenotes/database-management/sql-profiles.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Management에서 Managed Database의 SQL profile을 조회하고 enable·disable·drop 작업을 할 수 있습니다. 변경 전후 SQL performance 영향을 검증해야 합니다.

## Monitor SQL Firewall
* **Services:** Database Management
* **Release Date:** September 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-management/sql-firewall.htm](https://docs.oracle.com/iaas/releasenotes/database-management/sql-firewall.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Management Security 영역에 SQL Firewall tab이 추가되었습니다. SQL Firewall의 정책과 활동 가시성을 운영 monitoring 흐름에 포함할 수 있습니다.

## New Autonomous AI Database Activity Overview Dashboard
* **Services:** Database Management , Management Dashboards
* **Release Date:** September 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-management/adb-activity-overview-dashboard.htm](https://docs.oracle.com/iaas/releasenotes/database-management/adb-activity-overview-dashboard.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/database-management/doc/autonomous-ai-database-activity-overview.html](https://docs.oracle.com/iaas/database-management/doc/autonomous-ai-database-activity-overview.html){:target="_blank" rel="noopener"}
### 업데이트 내용

Autonomous AI Database activity overview dashboard는 단일 database의 activity·workload·resource utilization을 통합해서 보여 줍니다. 요약 지표 확인 후 Performance Hub로 심층 분석을 연결할 수 있습니다.

### 확인 흐름

Database Management의 managed database details에서 Dashboard를 열어 Activity Overview를 확인할 수 있습니다. activity·workload·resource utilization의 이상 징후를 확인한 뒤 Performance Hub 분석으로 연결하고, 기본 시간 범위가 운영 조사 목적에 맞는지 조정합니다.

## Support for Autonomous AI Databases and Autonomous VM Clusters in Exadata Insights
* **Services:** Ops Insights
* **Release Date:** September 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/operations-insights/adb-avmc-exadata-insights.htm](https://docs.oracle.com/iaas/releasenotes/operations-insights/adb-avmc-exadata-insights.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/operations-insights/doc/exadata-insights.html](https://docs.oracle.com/iaas/operations-insights/doc/exadata-insights.html){:target="_blank" rel="noopener"}
### 업데이트 내용

Ops Insights Exadata Insights가 Autonomous AI Database와 Autonomous VM Cluster를 지원합니다. Exadata 기반 Autonomous workload를 Insights 분석 범위에 포함할 수 있습니다.

### 등록 전 확인

Autonomous AI Database와 Autonomous VM Cluster를 Exadata Insights 분석 범위에 넣기 전 telemetry와 대상 등록 상태를 확인해야 합니다. 등록 후에는 예상 resource가 dashboard에 나타나는지와 metric 수집 시점을 검증합니다.

## Support for Autonomous AI Databases Through Enterprise Manager Telemetry
* **Services:** Ops Insights
* **Release Date:** September 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/operations-insights/adb-em-telemetry.htm](https://docs.oracle.com/iaas/releasenotes/operations-insights/adb-em-telemetry.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/operations-insights/doc/enable-operations-insights.html](https://docs.oracle.com/iaas/operations-insights/doc/enable-operations-insights.html){:target="_blank" rel="noopener"}
### 업데이트 내용

Ops Insights가 Enterprise Manager telemetry를 통한 Autonomous AI Database 지원을 제공합니다. telemetry 준비와 enablement 절차를 확인한 뒤 분석 대상으로 등록해야 합니다.

### Telemetry 검증

Enterprise Manager telemetry를 사용하려면 관리 대상과 telemetry 수집 경로가 준비되어야 합니다. enablement 후 Autonomous AI Database가 Insights에서 식별되고 metric이 갱신되는지 확인합니다.
