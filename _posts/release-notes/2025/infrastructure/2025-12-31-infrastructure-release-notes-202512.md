---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "12월 OCI Infrastructure 업데이트 소식"
teaser: "2025년 12월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2025-infrastructure
tags:
   - oci-release-notes-2025
   - Dec-2025
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


## NoSQL Database Cloud : New features
* **Services**: NoSQL Database Cloud
* **Release Date**: December 31, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/nosql-database-cloud/nosql-rnlatest-dec25.htm](https://docs.oracle.com/iaas/releasenotes/nosql-database-cloud/nosql-rnlatest-dec25.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle NoSQL Database Cloud에 다음 기능이 추가되었습니다:

- **NoSQL Database Migrator 1.8.0 릴리스:**
    - 필터 조건과 일치하는 테이블 행만 내보내기 위한 쿼리 조건식 지원.
- **Oracle NoSQL Database용 IntelliJ 플러그인:**
    - 세션 토큰 기반 인증 지원.
    - 연결 생성 시 최신 Oracle NoSQL Java SDK 자동 다운로드 및 경로 설정.
    - **Advanced DDL input** 옵션을 사용하여 행을 업데이트하는 동안 JSON 데이터의 트리 구조 표시.
    - SQL 문 생성.
    - 테이블의 키워드와 열 이름을 자동 완성하여 SQL 문 자동 완성.
    - SQL 구문 하이라이트 및 예쁘게 인쇄(pretty printing).
    - JSON 경로 탐색을 포함한 결과 탐색.

<!--
## HeatWave: Support for Version 9.5.2
* **Services**: MySQL HeatWave
* **Release Date**: December 23, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40862-heatwave-952.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/TC-40862-heatwave-952.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

HeatWave가 MySQL 데이터베이스 9.5.2를 지원합니다. 이는 최신 Innovation 릴리스이며, 보안 및 버그 수정 사항을 제공합니다.

## MCP Server for Autonomous AI Database
* **Services**: Autonomous Database Serverless
* **Release Date**: December 23, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-mcp-server-for-autonomous-ai-database.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-mcp-server-for-autonomous-ai-database.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에 내장 MCP Server가 포함되어 Serverless Exadata Infrastructure(26ai 및 19c)에서 Oracle Autonomous AI Database용 관리형 데이터베이스별 MCP 서버를 제공합니다.

## Data Transforms enhancements
* **Services**: Autonomous Database Serverless
* **Release Date**: December 23, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-data-transforms-enhancements-1.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-data-transforms-enhancements-1.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Transforms에 새로운 기능과 변경사항이 포함되었습니다.

## Management Agent Updates
* **Services**: Management Agent
* **Release Date**: December 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/management-agent/dec25-cve-security-fix.htm](https://docs.oracle.com/iaas/releasenotes/management-agent/dec25-cve-security-fix.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Management Agent의 새로운 릴리스에는 Apache Tika의 Critical XXE 취약점(CVE-2025-66516) 수정을 포함한 중요한 보안 수정사항이 포함되어 있습니다.

## France Central (Paris) region availability
* **Services**: File Storage with Lustre
* **Release Date**: December 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/lustre/paris-region.htm](https://docs.oracle.com/iaas/releasenotes/lustre/paris-region.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

File Storage with Lustre가 France Central (Paris) 리전(eu-paris-1)에서 사용 가능합니다.

## Big Data Service 3.3.0 new features and updates
* **Services**: Big Data
* **Release Date**: December 17, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/big-data/Dec2025-3-3-0.htm](https://docs.oracle.com/iaas/releasenotes/big-data/Dec2025-3-3-0.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Big Data Service 3.3.0의 새로운 기능과 업데이트가 제공됩니다. 이 릴리스의 ODH, JDK, OS, Linux 버전을 보려면 [Big Data Service Release and Patch](https://docs.oracle.com/iaas/Content/bigdata/overview.htm#bds-versions)를 참조하세요.

## Kubernetes Engine support for a cluster-level default backend NSG for load balancers and network load balancers
* **Services**: Kubernetes Engine
* **Release Date**: December 17, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NSG-at-Cluster-level-Release-Note.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NSG-at-Cluster-level-Release-Note.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 로드 밸런서 및 네트워크 로드 밸런서를 위한 클러스터 레벨 기본 백엔드 네트워크 보안 그룹(NSG)을 선택적으로 클러스터 속성으로 지정할 수 있습니다.
-->

## Full Stack Disaster Recovery introduces support for Integration instances, is available in new regions, and provides other updates
* **Services**: Full Stack Disaster Recovery
* **Release Date**: December 17, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/disaster-recovery/dec-2025.htm](https://docs.oracle.com/iaas/releasenotes/disaster-recovery/dec-2025.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Full Stack Disaster Recovery가 Integration 인스턴스 지원을 도입하고, 새로운 리전에서 사용 가능하며, 기타 업데이트를 제공합니다.

Full Stack Disaster Recovery는 다음 리전에서 사용 가능합니다:

- Indonesia North (Batam)
- Spain Central (Madrid)

## Oracle Cloud Infrastructure Batch is now available
* **Services**: Batch
* **Release Date**: December 17, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/batch/batch-service-launch.htm](https://docs.oracle.com/iaas/releasenotes/batch/batch-service-launch.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud Infrastructure (OCI) Batch는 컴퓨팅 집약적인 배치 워크로드를 오케스트레이션하기 위해 구축된 멀티테넌트 클라우드 네이티브 서비스로, 이제 사용 가능합니다.

<!--
## Optimize costs with dedicated elastic pools in Autonomous AI Database
* **Services**: Autonomous Database Serverless
* **Release Date**: December 16, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-optimize-costs-with-dedicated-elastic-pools-in-adb.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-optimize-costs-with-dedicated-elastic-pools-in-adb.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 전용 엘라스틱 풀을 생성할 수 있으며, 풀 리더와 모든 멤버가 동일한 인프라에 상주합니다. 이를 통해 비용을 최적화할 수 있습니다.

## Support for transportable tablespaces
* **Services**: Autonomous Database Serverless
* **Release Date**: December 16, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-support-for-transportable-tablespaces.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-support-for-transportable-tablespaces.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 Transportable Tablespace 기능을 사용하여 온프레미스 Oracle 데이터베이스 또는 Oracle Database Cloud Service (DBCS) 데이터베이스에서 Autonomous AI Database로 데이터와 메타데이터를 효율적으로 마이그레이션할 수 있습니다.

## Wallet rotation with a grace period
* **Services**: Autonomous Database Serverless
* **Release Date**: December 16, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-wallet-rotation-with-grace-period.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-wallet-rotation-with-grace-period.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database는 1시간부터 72시간까지의 유예 기간과 함께 Autonomous AI Database 인스턴스 또는 리전에서 클라우드 계정이 소유한 모든 인스턴스에 대해 지갑을 회전할 수 있도록 합니다.

## Autonomous AI Database API for DynamoDB
* **Services**: Autonomous Database Serverless
* **Release Date**: December 09, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-autonomous-ai-database-api-for-dynamodb.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-autonomous-ai-database-api-for-dynamodb.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database API for DynamoDB를 사용하여 기존 DynamoDB 도구 및 SDK를 사용하여 Autonomous AI Database와 원활하게 작업할 수 있습니다.

## Provider Scoped Table Hyperlink
* **Services**: Autonomous Database Serverless
* **Release Date**: December 09, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-provider-scoped-table-hyperlink.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-provider-scoped-table-hyperlink.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

제공자는 범위(테넌시, 구획, 스키마 또는 객체 레벨)를 정의하여 특정 소비자가 수동 공유 없이 Table Hyperlink를 생성할 수 있도록 권한을 부여합니다.

## API Gateway support for IPv6 and Reserved Public IPs
* **Services**: API Gateway
* **Release Date**: December 03, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/api-gateway/apigw-IPv6-release-note.htm](https://docs.oracle.com/iaas/releasenotes/api-gateway/apigw-IPv6-release-note.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

이제 API Gateway를 사용하여 다음을 생성할 수 있습니다:

- IPv6가 활성화된 공용 및 사설 IPv4 단일 스택 API 게이트웨이
- IPv4/IPv6 듀얼 스택 API 게이트웨이
- 예약된 공용 IP 주소를 사용하는 API 게이트웨이

## Use Customer-managed keys in cross tenancy clones and cross tenancy Autonomous Data Guard
* **Services**: Autonomous Database Serverless
* **Release Date**: December 02, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-use-customer-managed-keys-in-cross-tenancy-clones-and-adg.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-use-customer-managed-keys-in-cross-tenancy-clones-and-adg.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

소스 데이터베이스가 고객 관리 암호화 키를 사용하는 경우, 크로스 테넌시 클론 및 크로스 테넌시 Autonomous Data Guard에 대한 암호화 키 유형과 위치를 지정하는 여러 옵션이 있습니다.

## Manage workload resources using Database Resource Manager
* **Services**: Autonomous Database Serverless
* **Release Date**: December 02, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-manage-workload-resources-using-db-resource-manager.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2025-12-manage-workload-resources-using-db-resource-manager.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database에서 `cs_resource_manager` 서브프로그램을 사용하여 Database Resource Manager 플랜을 정의하고 관리할 수 있습니다.
-->