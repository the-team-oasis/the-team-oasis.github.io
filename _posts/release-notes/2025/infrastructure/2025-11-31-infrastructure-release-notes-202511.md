---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "11월 OCI Infrastructure 업데이트 소식"
teaser: "2025년 11월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2025-infrastructure
tags:
   - oci-release-notes-2025
   - Sep-2025
   - Infrastructure
#
# Styling
#
header: no
# image:
#     title: mediaplayer_js-title.jpg
#     thumb: mediaplayer_js-thumb.jpg
#     homepage: mediaplayer_js-home.jpg
#     caption: Photo by Corey Blaz
#     caption_url: https://blaz.photography/
# mediaplayer: true
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>


<!--
## Enhancements to GoldenGate features
* **Services**: GoldenGate
* **Release Date**: November 25, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/goldengate/zeroetl-xrdr.htm](https://docs.oracle.com/iaas/releasenotes/goldengate/zeroetl-xrdr.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

GoldenGate가 기존 기능에 대한 향상을 추가했습니다:

- **ZeroETL 파이프라인:** Oracle AI Database에 대한 더 광범위한 연결 지원.
- **고가용성:** 크로스 리전 피어 지원.

## Use Multicloud Hub to select products
* **Services**: Multicloud
* **Release Date**: November 25, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/multicloud/multicloud-hub-launch.htm](https://docs.oracle.com/iaas/releasenotes/multicloud/multicloud-hub-launch.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Multicloud Hub를 사용하여 Multicloud 구독, 네트워킹 인프라, 리전 매핑 및 배포된 Oracle 데이터베이스 리소스를 탐색할 수 있습니다.

## Chart support in Table Hyperlinks
* **Services**: Autonomous Database Serverless
* **Release Date**: November 25, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-chart-support-in-table-hyperlinks.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-chart-support-in-table-hyperlinks.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Table Hyperlinks의 Chart View를 사용하여 표 형식 보기와 차트 보기 사이를 전환하여 더 나은 분석 경험을 제공합니다.

## Data Studio enhancements: New REST API functions for the Catalog tool
* **Services**: Autonomous Database Serverless
* **Release Date**: November 25, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-data-studio-enhancements-new-api-for-catalog.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-data-studio-enhancements-new-api-for-catalog.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Studio Suite의 Catalog 도구는 `DBMS_CATALOG` 패키지를 사용하여 카탈로그를 관리하는 PL/SQL API를 제공합니다.

## Private Cloud Appliance introduces new features
* **Services**: Private Cloud Appliance
* **Release Date**: November 24, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/private-cloud-appliance/release-note-2025-11-24.htm](https://docs.oracle.com/iaas/releasenotes/private-cloud-appliance/release-note-2025-11-24.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Private Cloud Appliance의 새로운 릴리스가 다음 새로운 기능과 함께 제공됩니다:

**기능 업데이트 및 향상사항이 포함되어 있습니다.**
-->

<!--
## New visualization options
* **Services**: Management Dashboard
* **Release Date**: November 19, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/new-visualization-options.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/new-visualization-options.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

쿼리 기반 위젯 빌더에서 여러 차트 유형에 걸쳐 새로운 시각화 옵션이 제공됩니다. 이러한 옵션은 더 큰 유연성과 사용자 정의 기능을 제공합니다.
-->

## Generate reports for dashboards
* **Services**: Management Dashboard
* **Release Date**: November 19, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/generate-reports.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/generate-reports.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

대시보드의 현재 화면(View Mode)을 PDF 보고서로 자동 생성하여 다운로드할 수 있습니다. 위젯별 데이터, 필터 상태, 시간 범위 등 현재 대시보드 구성이 보고서에 반영됩니다.

- **주요 변경 사항**: 대시보드 화면을 PDF로 자동 생성하며, 전체 위젯의 데이터·레이아웃·필터 상태를 포함합니다.
- **실행 위치**: Dashboard View Mode → Actions(⋮) → Generate report

보고서에는 다음 내용이 포함됩니다.

- 현재 시간 범위(Time Range)
- 대시보드에 배치된 모든 위젯의 데이터 스냅샷
- 적용된 글로벌 필터 상태
- 위젯 배치(레이아웃)

다음 사항에 유의하세요.

- **브라우저 제한**: Firefox 및 Safari는 미지원이며, Chrome/Edge/Opera를 지원합니다.
- **기능 구분**: Export to CSV는 위젯 단위, Generate Report는 대시보드 전체 PDF입니다.
- **필터 영향**: 시간 범위나 컴파트먼트 필터 변경 시 PDF 결과가 달라집니다.

추천 활용 시나리오:

- 고객 PoC 결과 보고서 전달(HeatWave/OKE/APM 대시보드 PDF)
- 운영 점검 보고(Ops Review)용 KPI 대시보드 제출
- 내부 CE KPI 보고용 월간 리포트 첨부
- 장애 분석 공유(NOC/CE와 특정 시간대 필터 PDF 공유)


| --- | --- |
| ![](/assets/img/infrastructure/2024/November-19-2025-1.png) | ![](/assets/img/infrastructure/2024/November-19-2025-2.png) |

<!--
## New Oracle-defined widget: Metric single value
* **Services**: Management Dashboard
* **Release Date**: November 19, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/metric-single-value.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/metric-single-value.htm){:target="_blank" rel="noopener"}


### 업데이트 내용

새로운 Oracle 정의 위젯인 **Metric single value**가 제공됩니다. **Metric single value** 위젯을 사용하면 단일 메트릭 값을 표시할 수 있습니다.

## Interactive widget input
* **Services**: Management Dashboard
* **Release Date**: November 19, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/interactive-widget-input.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/interactive-widget-input.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

대시보드 필터에 연결되지 않은 위젯 입력을 구성할 때 **Is editable** 옵션을 선택하여 사용자가 위젯 입력을 편집할 수 있도록 할 수 있습니다.


## Add ZPR security attributes to Bastions
* **Services**: Bastion, Zero Trust Packet Routing
* **Release Date**: November 19, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/zero-trust-packet-routing/bastion-supported.htm](https://docs.oracle.com/iaas/releasenotes/zero-trust-packet-routing/bastion-supported.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Zero Trust Packet Routing (ZPR) 보안 속성을 이제 bastion에 추가할 수 있습니다. 자세한 내용은 [보안 속성 관리](https://docs.oracle.com/iaas/Content/Bastion/Tasks/manage-security-attributes.htm)를 참조하세요.


## New Experience in Oracle Cloud Console
* **Services**: Big Data, Cloud Advisor, Data Catalog, File Storage, Language, Media Services, Oracle Cloud Infrastructure, Oracle Cloud Migrations, Search with OpenSearch
* **Release Date**: November 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/multiple/nov18-cloud-console.htm](https://docs.oracle.com/iaas/releasenotes/multiple/nov18-cloud-console.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

여러 서비스에 대한 Oracle Cloud Console의 주요 업데이트를 시작했습니다. 새로운 경험에는 직관적인 디자인과 향상된 사용자 경험이 포함됩니다.


## Access OpenAI gpt-oss models in OCI Generative AI
* **Services**: Generative AI
* **Release Date**: November 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/openai-gpt-oss.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/openai-gpt-oss.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI는 추론 및 에이전트 작업을 위해 설계된 사전 훈련된 OpenAI gpt-oss 모델을 지원합니다. 복잡하고 고리소스 작업의 경우 `openai.gpt-oss-120b`를 선택하세요.

## HeatWave: Support for Version 9.5.1
* **Services**: MySQL HeatWave
* **Release Date**: November 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40732-heatwave-951.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40732-heatwave-951.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

HeatWave가 MySQL 데이터베이스 9.5.1을 지원합니다. 이는 최신 Innovation 릴리스이며, 보안 및 버그 수정 사항을 제공합니다.
-->

## Service Catalog merged with Marketplace
* **Services**: Marketplace
* **Release Date**: November 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/marketplace/service-catalog-marketplace.htm](https://docs.oracle.com/iaas/releasenotes/marketplace/service-catalog-marketplace.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Service Catalog 기능이 OCI Marketplace에 통합되어 Marketplace의 Service Catalog Policies에서 중앙 관리됩니다.

- 승인된 Golden Image와 Terraform Stack만 배포할 수 있습니다.
- 승인된 Marketplace 오퍼링만 사용자에게 노출됩니다.
- 테넌시·조직별 표준 배포 정책을 중앙에서 관리합니다.
- 표준 배포 템플릿 강제 적용으로 운영 리스크를 줄입니다.
- ISMS-P, 금융 규제, 내부 보안 규정 준수에 유리합니다.

고객 관점에서의 효과는 다음과 같습니다.

- **보안 사고 예방**: 승인되지 않은 외부 이미지나 서드파티 SW 배포를 차단합니다.
- **운영 효율성 및 표준화**: 모든 배포가 동일한 기준으로 구성되며 Golden Image 라이프사이클 관리가 쉬워집니다.
- **Governance 강화**: 멀티팀/멀티프로젝트 환경에서도 중앙 정책화를 유지합니다.


자세한 내용은 [Service Catalog Policies](https://docs.oracle.com/iaas/Content/Marketplace/service-catalog-policies.htm) 및 [Service Catalog Overview](https://docs.oracle.com/iaas/Content/Marketplace/overview_of_service_catalog.htm)를 참조하세요.

<!--
## OML notebook and GitHub integration
* **Services**: Autonomous Database Serverless
* **Release Date**: November 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-oml-notebook-github-integration.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-oml-notebook-github-integration.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Machine Learning UI가 향상되어 OML Notebook과 외부 GitHub 저장소 간의 직접 상호 작용을 지원합니다.

## Use REST APIs for Oracle Data transforms
* **Services**: Autonomous Database Serverless
* **Release Date**: November 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-use-rest-apis-for-data-transforms.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-use-rest-apis-for-data-transforms.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

외부 시스템 및 개발자는 Data Transforms REST API를 사용하여 프로젝트, 연결, 데이터 로드, 데이터 흐름, 워크플로우, 일정 및 변수와 같은 Data Transforms에 대한 정보를 검색할 수 있습니다.

## Internet of Things (IoT) is available in new regions
* **Services**: Internet of Things
* **Release Date**: November 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/internet-of-things/update-11182025.htm](https://docs.oracle.com/iaas/releasenotes/internet-of-things/update-11182025.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Internet of Things 서비스가 다음 리전에서 사용 가능합니다:

- Japan Central (Osaka) 리전: `ap-osaka-1`
- Japan East (Tokyo) 리전: `ap-tokyo-1`

## Log Analytics: Support to ingest logs from OCI Compute Cloud@Customer
* **Services**: Log Analytics
* **Release Date**: November 14, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/log-analytics/nov25-oob-oci-ccc.htm](https://docs.oracle.com/iaas/releasenotes/log-analytics/nov25-oob-oci-ccc.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Log Analytics는 이제 OCI Logging을 통해 Service Connector를 사용하여 OCI Compute Cloud@Customer에서 로그를 수집하는 것을 지원합니다.

## Support for using image URI to get image details
* **Services**: Container Registry
* **Release Date**: November 14, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/registry/OCIR-look-up-image-by-URI.htm](https://docs.oracle.com/iaas/releasenotes/registry/OCIR-look-up-image-by-URI.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Container Registry CLI 및 API를 사용하여 이미지에 대한 정보를 가져올 때 이제 이미지 URI를 사용하여 이미지를 식별할 수 있습니다.

## Data Science AI Quick Actions v 2.0
* **Services**: Data Science
* **Release Date**: November 12, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/data-science/ai-quick-actions-20.htm](https://docs.oracle.com/iaas/releasenotes/data-science/ai-quick-actions-20.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Science AI Quick Actions v 2.0에는 다음이 포함됩니다:

- **OpenAI Endpoint Model Deployment 지원:** OpenAI 엔드포인트에 모델 배포 지원
- 기타 향상된 기능 및 개선사항

## Import Your Own Models into OCI Generative AI
* **Services**: Generative AI
* **Release Date**: November 12, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 Hugging Face 및 OCI Object Storage 버킷(Hugging Face 형식)에서 대규모 언어 모델을 OCI Generative AI로 가져올 수 있습니다.

## New Experience for OCI Generative AI in Oracle Cloud Console
* **Services**: Generative AI
* **Release Date**: November 12, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/new-console-experience.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/new-console-experience.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI를 위한 Oracle Cloud Console의 주요 업데이트를 시작했습니다. 새로운 경험에는 직관적인 디자인과 향상된 사용자 경험이 포함됩니다.

## New Features and Enhancements in Fleet Application Management
* **Services**: Compute, Fleet Application Management, Oracle Cloud Infrastructure
* **Release Date**: November 12, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/fleet-management/nov2025-new-features-enhancements.htm](https://docs.oracle.com/iaas/releasenotes/fleet-management/nov2025-new-features-enhancements.htm){:target="_blank" rel="noopener"}
- **API Versions Affected:** 20250228

### 업데이트 내용

이 릴리스는 Fleet Application Management에 새로운 기능과 향상을 도입했습니다. 이러한 업데이트는 자동화, 유연성 및 운영 감독을 개선합니다.

## New Region in Turin, Italy
* **Services**: Oracle Cloud Infrastructure
* **Release Date**: November 11, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/oci/new-region-turin-1.htm](https://docs.oracle.com/iaas/releasenotes/oci/new-region-turin-1.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Italy North (Turin) 리전이 제공됩니다. 리전 식별자는 `eu-turin-1`이고 리전 키는 NRQ입니다.

## New critical and informational events for Autonomous Exadata VM Cluster, Autonomous Container Database, and Autonomous AI Database
* **Services**: Autonomous Database on Dedicated Exadata Infrastructure, Autonomous Database on Exadata Cloud@Customer
* **Release Date**: November 11, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-new-events.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-new-events.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Dedicated Exadata Infrastructure 배포에서 Autonomous AI Database를 사용하면 데이터베이스 서비스 및 노드와 관련된 중요한 정보 이벤트 발생 시 알림을 받을 수 있습니다.

## Autonomous Data Guard support for JSON and APEX workloads
* **Services**: Autonomous Database Serverless
* **Release Date**: November 11, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-adg-support-for-json-apex-workloads.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-adg-support-for-json-apex-workloads.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

JSON 및 APEX 워크로드를 가진 Autonomous AI Database에서 로컬 및 크로스 리전 대기 데이터베이스 모두에 대해 Autonomous Data Guard를 활성화할 수 있습니다.

## Data Transforms enhancements
* **Services**: Autonomous Database Serverless
* **Release Date**: November 11, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-data-transforms-enhancements-1.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-data-transforms-enhancements-1.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Transforms에 새로운 기능과 변경사항이 포함되었습니다.

## Oracle Interconnect for Google Cloud is now available in the US West (Phoenix) region
* **Services**: Networking
* **Release Date**: November 07, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/network/GCP-Phoenix.htm](https://docs.oracle.com/iaas/releasenotes/network/GCP-Phoenix.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud Infrastructure와 Google Cloud Platform 간의 크로스 클라우드 연결이 OCI US West (Phoenix) 리전으로 확장되었습니다.
-->

## Virtual Cloud Network (VCN) IP Enhancements
* **Services**: Networking
* **Release Date**: November 07, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/network/vcn-ip-enhancements.htm](https://docs.oracle.com/iaas/releasenotes/network/vcn-ip-enhancements.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Virtual Cloud Network(VCN)의 CIDR 확장성, IPv4/IPv6 동시 운영, Subnet 확장 기능이 강화되어 IP 설계 제약을 완화했습니다. 특히 멀티 테넌트 SaaS, DR 구성, 대규모 스케일아웃 환경에서 더 높은 유연성과 관리 편의성을 제공합니다.

- **Flexible IPv4 CIDR Addressing**: /16, /20, /22, /28 등 다양한 사용자 정의 IPv4 CIDR 마스크를 지원하며 Console/API/CLI/SDK 전반에 적용됩니다. IPv4/IPv6 Dual-Stack 구성도 지원이 강화되었습니다. (예: /16, /20, /22, /28 등의 다양한 마스크 지원)
- **Expanded Service Limits**: VCN은 IPv4 CIDR Block과 IPv6 Prefix를 각각 최대 16개까지 추가할 수 있으며, Subnet도 IPv4 CIDR Block과 IPv6 Prefix를 각각 최대 16개까지 구성할 수 있습니다.
- **운영 편의성**: 운영 중 VCN/Subnet의 IP 고갈을 예방하고, 리소스 재배치 없이 CIDR 확장이 가능해집니다. 장기적인 IPv6 기반 운영 전략에도 유리합니다.

<!--
## Document Generator pre-built function version 25.6 now available
* **Services**: Functions
* **Release Date**: November 07, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/functions/functions-docgen-pbf_v25-6-enhancements.htm](https://docs.oracle.com/iaas/releasenotes/functions/functions-docgen-pbf_v25-6-enhancements.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Document Generator 사전 구축 함수 버전 25.6이 OCI Functions에서 사용 가능합니다.

이 버전에는 다양한 수정사항과 향상된 기능이 포함되어 있습니다.

## Kubernetes Engine support for clusters containing both managed node pools and virtual node pools
* **Services**: Kubernetes Engine
* **Release Date**: November 06, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Mixed-node-clusters-support-Release-Note.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Mixed-node-clusters-support-Release-Note.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 Kubernetes Engine을 사용하여 관리형 노드 풀과 가상 노드 풀을 모두 포함하는 클러스터를 생성할 수 있습니다.

## Use OpenAI Compatible SDKs with OCI Generative AI Models
* **Services**: Generative AI
* **Release Date**: November 05, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/oci-openai.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/oci-openai.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI OpenAI 패키지는 OCI에서 호스팅되는 모델을 호출하기 위해 OpenAI 호환 SDK를 사용할 수 있게 해주는 Python 라이브러리입니다.

## HeatWave: New Shape, MySQL.96
* **Services**: MySQL HeatWave
* **Release Date**: November 05, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40271-heatwave-mysql96-new-shape.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40271-heatwave-mysql96-new-shape.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

다음 사양을 가진 새로운 셰이프 MySQL.96이 추가되었습니다:

- ECPU 수: 96
- RAM: 768 GB

## Data Science now Supports JupyterLab 4.4.6
* **Services**: Data Science
* **Release Date**: November 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/data-science/juptyerlab446.htm](https://docs.oracle.com/iaas/releasenotes/data-science/juptyerlab446.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Science가 JupyterLab 4.4.6을 지원합니다. 새로운 노트북은 JupyterLab 4.4.6을 사용합니다. 기존 노트북은 비활성화 후 재활성화해야 JupyterLab 4.4.6을 사용할 수 있습니다.
-->


<!--
## New Experience for Log Analytics in Oracle Cloud Console
* **Services**: Log Analytics
* **Release Date**: November 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/log-analytics/nov25-console-update.htm](https://docs.oracle.com/iaas/releasenotes/log-analytics/nov25-console-update.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Log Analytics를 위한 Oracle Cloud Console의 주요 업데이트를 시작했습니다. 새로운 경험에는 직관적인 디자인과 향상된 사용자 경험이 포함됩니다.

## Use Select AI to Generate Synthetic Data
* **Services**: Autonomous Database on Dedicated Exadata Infrastructure, Autonomous Database on Exadata Cloud@Customer
* **Release Date**: November 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-selectai-syntheticdata.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-selectai-syntheticdata.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Dedicated Exadata Infrastructure의 Autonomous AI Database는 Select AI를 사용하여 LLM을 사용하여 특정 스키마나 패턴을 준수하는 합성 데이터를 생성할 수 있습니다.

## Use In-database Transformer Model with Select AI RAG
* **Services**: Autonomous Database on Dedicated Exadata Infrastructure, Autonomous Database on Exadata Cloud@Customer
* **Release Date**: November 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-selectai-rag.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-selectai-rag.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Dedicated Exadata Infrastructure의 Autonomous AI Database는 데이터베이스에 가져온 인-데이터베이스 트랜스포머(임베딩 모델이라고도 함)를 Select AI RAG와 함께 사용할 수 있도록 지원합니다.

## DBMS_CLOUD_FUNCTION Package Support
* **Services**: Autonomous Database on Dedicated Exadata Infrastructure, Autonomous Database on Exadata Cloud@Customer
* **Release Date**: November 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-dbms-cloud-function.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-dbms-cloud-function.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Dedicated Exadata Infrastructure 배포에서 Autonomous AI Database를 사용하면 DBMS_CLOUD_FUNCTION 패키지를 사용하여 OCI 및 외부 함수를 호출할 수 있습니다.

## New critical events for Autonomous Container Database and Autonomous AI Database.
* **Services**: Autonomous Database on Dedicated Exadata Infrastructure, Autonomous Database on Exadata Cloud@Customer
* **Release Date**: November 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-acd-events.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-dedicated/adbd-acd-events.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Dedicated Exadata Infrastructure 배포에서 Autonomous AI Database를 사용하면 Database Vault (DV)와 관련된 중요한 이벤트 발생 시 알림을 받을 수 있습니다.

## Data Lake Accelerator
* **Services**: Autonomous Database Serverless
* **Release Date**: November 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-data-lake-accelerator.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-11-data-lake-accelerator.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database 26ai 인스턴스와 함께 Data Lake Accelerator를 사용하여 외부 데이터 처리를 지원할 수 있습니다.

## Internet of Things (IoT) is available in Brazil East (Sao Paulo)
* **Services**: Internet of Things
* **Release Date**: November 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/internet-of-things/update11.4.2025.htm](https://docs.oracle.com/iaas/releasenotes/internet-of-things/update11.4.2025.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Internet of Things 서비스가 Brazil East (Sao Paulo) 리전(`sa-saopaulo-1`)에서 사용 가능합니다.
-->