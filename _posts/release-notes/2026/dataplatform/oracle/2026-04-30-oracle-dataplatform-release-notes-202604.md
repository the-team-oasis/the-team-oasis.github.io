---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "4월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2026년 4월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-dataplatform
tags:
  - oci-release-notes-2026
  - Apr-2026
  - DATAPLATFORM
  - DATABASE
  - AUTONOMOUS DATABASE
  - GOLDENGATE
  - DATABASE MIGRATION
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

---

## Database Migration introduces support for the Assessment feature

* **Services:** Database Migration
* **Release Date:** April 07, 2026
* **Documentation:** [Database Migration introduces support for the Assessment feature](https://docs.oracle.com/en-us/iaas/releasenotes/database-migration/april-2026.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Create assessment](https://docs.oracle.com/en/cloud/paas/database-migration/dmsus/create-assessments.html){:target="_blank" rel="noopener"}, [Manage assessment](https://docs.oracle.com/en/cloud/paas/database-migration/dmsus/manage-assessments.html){:target="_blank" rel="noopener"}, [Viewing migration details for assessments](https://docs.oracle.com/en/cloud/paas/database-migration/dmsus/viewing-migration-details-assessments.html){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database Migration에 Assessment 기능이 추가되었습니다. Assessment는 소스/타겟 데이터베이스와 마이그레이션 사용자 상태를 분석해 적합한 마이그레이션 방식을 추천하고, 실제 이전 전에 위험 요소를 확인할 수 있도록 도와주는 사전 진단 기능입니다.

### 주요 기능

* 입력한 환경 정보를 기반으로 적합한 마이그레이션 경로를 추천합니다.
* 소스와 타겟 간 호환되지 않는 객체를 찾아 영향도와 조치 방향을 제공합니다.
* 데이터베이스 파라미터, 사용자 권한 등 누락된 구성 요소를 점검합니다.
* 선택적으로 테스트 테이블 마이그레이션을 수행해 실제 이전 준비 상태를 검증할 수 있습니다.
* Assessment에서 생성된 마이그레이션은 별도의 상태와 Migration history 탭을 통해 실행 이력, 로그, 단계별 진행 상황을 추적할 수 있습니다.

### 기대 효과

마이그레이션을 바로 실행하기 전에 성공 가능성과 제약 사항을 먼저 확인할 수 있으므로, 대규모 이전 프로젝트의 계획 단계에서 리스크를 줄이고 실행 중 장애를 예방하는 데 도움이 됩니다.

---

## Secret-Based Password Authentication for Autonomous AI Database Users

* **Services:** Autonomous Database Serverless
* **Release Date:** April 14, 2026
* **Documentation:** [Secret-Based Password Authentication for Autonomous AI Database Users](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-04-secret-passwd-authn.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Create and Manage Users on Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/manage-users-create.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database 사용자의 비밀번호를 데이터베이스 내부에 저장하지 않고, 외부 Vault의 Secret으로 관리하는 Secret-Based Password Authentication이 추가되었습니다. 데이터베이스 사용자는 Vault Secret Credential을 참조하도록 생성하거나 수정할 수 있으며, 로그인 시 데이터베이스가 Vault에서 비밀번호를 가져와 메모리에서만 검증 정보를 생성합니다.

### 주요 기능

* OCI Vault, Azure Key Vault, AWS Secrets Manager, GCP Secret Manager와 연계할 수 있습니다.
* `CREATE USER ... IDENTIFIED BY CREDENTIAL` 구문으로 Vault Credential 기반 사용자를 만들 수 있습니다.
* `ALTER USER ... IDENTIFIED BY CREDENTIAL` 구문으로 기존 사용자도 Secret 기반 인증으로 전환할 수 있습니다.
* `DBA_USERS`, `USER_USERS`의 `LOGON_CREDENTIAL_OWNER`, `LOGON_CREDENTIAL_NAME` 컬럼에서 연결된 Credential 정보를 확인할 수 있습니다.
* 애플리케이션 스크립트나 로그에 평문 비밀번호가 남는 위험을 줄이고, Vault 중심의 비밀번호 로테이션 운영이 쉬워집니다.

### 운영 포인트

Vault Secret을 읽을 수 있도록 클라우드 측 권한을 먼저 구성해야 합니다. OCI Vault를 사용하는 경우 Autonomous AI Database가 Secret Bundle을 읽을 수 있도록 Dynamic Group과 IAM Policy를 준비해야 합니다.

---

## Granular Permissions for Autonomous AI Database Policies

* **Services:** Autonomous Database Serverless
* **Release Date:** April 14, 2026
* **Documentation:** [Granular Permissions for Autonomous AI Database Policies](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-04-granular-permission.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [IAM Policies for Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/autonomous-database-iam-policies.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database 정책에서 `request.operation.actiontype` 변수를 사용해 생성/수정 작업의 세부 하위 작업을 더 정밀하게 제어할 수 있게 되었습니다. 기존의 넓은 권한 모델을 유지하면서도 민감한 작업은 별도 권한으로 분리할 수 있습니다.

### 주요 기능

* `adminPassword`, `scheduledOperations`, `manageEncryptionKeys`, `networkConfig`, `computeCount`, `dataStorageSize` 같은 세부 작업 단위로 IAM 조건을 만들 수 있습니다.
* 예를 들어 `adminPassword` 작업만 허용하거나, 반대로 `adminPassword`를 제외한 업데이트만 허용하는 정책을 작성할 수 있습니다.
* 운영자, 보안 관리자, 데이터베이스 관리자 간 직무 분리를 더 명확하게 적용할 수 있습니다.
* 최소 권한 원칙과 컴플라이언스 요구 사항을 만족하기 쉬워집니다.

### 활용 예시

ADMIN 비밀번호 변경, 암호화 키 관리, 네트워크 설정 변경처럼 보안 영향도가 큰 작업을 일반 DB 운영 권한과 분리해 승인 체계를 다르게 가져갈 수 있습니다.

---

## Oracle Spatial Studio

* **Services:** Autonomous Database Serverless
* **Release Date:** April 14, 2026
* **Documentation:** [Oracle Spatial Studio](https://docs.oracle.com/en-us/iaas/releasenotes/autonomous-database-serverless/2026-04-oracle-spatial-studio.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Use Oracle Spatial with Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/spatial-autonomous-database.html){:target="_blank" rel="noopener"}, [About Oracle Spatial Studio](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/oracle-spatial-studio.html){:target="_blank" rel="noopener"}

![Oracle Spatial Studio sample visualization](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/img/about_studio.png)

### 업데이트 내용

Oracle Spatial Studio가 Autonomous AI Database에 통합된 기능으로 제공됩니다. Spatial Studio는 Oracle Database의 공간 데이터 기능을 코드 없이 사용할 수 있는 웹 기반 인터페이스이며, 공간 데이터 로딩, 준비, 시각화, 분석을 지원합니다.

### 주요 기능

* Autonomous AI Database에 저장된 지리공간 데이터를 탐색하고 Spatial Dataset으로 구성할 수 있습니다.
* 지도와 테이블 기반 프로젝트를 만들어 공간 데이터를 시각화할 수 있습니다.
* 공간 분석을 실행하고 결과를 저장하거나 외부 애플리케이션에 임베드할 수 있습니다.
* Autonomous AI Database Details 페이지의 Tool Configuration 탭에서 접근할 수 있습니다.
* ECPU 모델에서만 사용할 수 있으며, Spatial Studio 사용자 권한과 역할 설정이 필요합니다.

### 활용 예시

위치 기반 고객 분석, 물류 경로 분석, 상권/지역 데이터 시각화처럼 지리공간 데이터가 포함된 분석 업무를 별도의 GIS 애플리케이션 없이 Autonomous AI Database 안에서 시작할 수 있습니다.

---

## New connection types added for GoldenGate

* **Services:** GoldenGate
* **Release Date:** April 21, 2026
* **Documentation:** [New connection types added for GoldenGate](https://docs.oracle.com/en-us/iaas/releasenotes/goldengate/r10connections.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [What's new in Oracle Cloud Infrastructure GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/wnoci/){:target="_blank" rel="noopener"}, [Connect to EDB Postgres Advanced Server](https://docs.oracle.com/en/cloud/paas/goldengate-service/wedbp/index.html){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI GoldenGate에 새로운 연결 타입이 추가되었습니다. 이번 업데이트로 GoldenGate 기반 실시간 복제와 스트리밍 파이프라인의 소스/타겟 선택지가 더 넓어졌습니다.

### 추가된 연결 타입

* Microsoft Fabric Eventstream
* EDB Postgres Advanced Server
* YugabyteDB

### 주요 기능

* Microsoft Fabric Eventstream으로 데이터를 전달하는 빅데이터/스트리밍 연계 시나리오를 구성할 수 있습니다.
* EDB Postgres Advanced Server를 GoldenGate 소스 또는 타겟으로 연결할 수 있습니다.
* YugabyteDB와 Autonomous AI Transaction Processing 간 복제 퀵스타트도 함께 제공됩니다.
* 2026년 4월 OCI GoldenGate 업데이트에는 OCI Secrets 기반 연결 전환, 신규 Quickstart, GoldenGate 버전 업데이트도 포함됩니다.

### 활용 예시

Oracle/비Oracle 데이터베이스와 Microsoft Fabric, 분산 PostgreSQL 계열 데이터베이스를 함께 운영하는 환경에서 실시간 CDC, 데이터 허브, 분석 파이프라인 구성을 더 쉽게 확장할 수 있습니다.
