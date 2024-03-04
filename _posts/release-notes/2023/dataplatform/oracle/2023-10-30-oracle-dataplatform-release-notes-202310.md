---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "10월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2023년 10월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2023-dataplatform
tags:
  - oci-release-notes-2023
  - Aug-2023
  - DATAPLATFORM, DATABASE, BIGDATA, DATAFLOW, SPARK, ORACLE, GOLDENGATE
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

## GoldenGate now supports IAM with Identity Domains 
* **Services:** GoldenGate
* **Release Date:** Oct. 3, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/25347051-3cbe-4f37-98a0-98c6cfd1fb7f/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/25347051-3cbe-4f37-98a0-98c6cfd1fb7f/){:target="_blank" rel="noopener"}

### 릴리즈 내용
GoldenGate는 이제 ID 도메인을 통해 ID 액세스 관리(IAM)를 지원합니다. 새로운 OCI GoldenGate 배포를 생성하기 전에 적절한 정책을 추가하고 Vault를 생성해야 합니다.

- OCI GoldenGate Credential Store
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_gg_credential.png)


## Operations Insights Full Autonomous Database Support
* **Services:** GoldenGate
* **Release Date:** Oct. 6, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/02919997-4465-465b-8afb-71a5e9006abe/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/02919997-4465-465b-8afb-71a5e9006abe/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Operations Insights 전체 기능을 모든 ADB(Autonomous Database) 유형에 사용할 수 있습니다. 전체 기능 컬렉션에는 모든 ADB 서버리스 및 ADB 전용 데이터베이스를 위한 SQL 탐색기 및 ADDM Spotlight가 포함됩니다.

- Opertation Insight ADB support
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_operation_insight_adb_support.png)

- ADDM (Automatic Database Diagnostic Monitor) 화면 예
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_operation_insight_addm_01.png)

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_operation_insight_addm_02.png)


## Set Up Alarm Definitions in Database Management
* **Services:** Database Management
* **Release Date:** Oct. 10, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/55bfcae8-116a-4d16-83a4-bb78fccab368/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/55bfcae8-116a-4d16-83a4-bb78fccab368/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Database Management 에서 Alarm 정의를 설정하여 경보 생성 및 관리 프로세스를 단순화할 수 있습니다.

경보 정의 기능을 사용하면 다음을 수행할 수 있습니다.

- 사전 구성된 규칙 및 임계값 세트를 사용하여 데이터베이스의 일반적인 운영 시나리오에 대한 Oracle 권장 Alarm 을 신속하게 생성할 수 있습니다. Alarm 생성에 사용할 수 있는 전체 Option 세트를 사용하려면 Oracle Cloud Infrastructure 모니터링 서비스로 이동하여 사용자 정의 Alarm 을 생성할 수 있습니다.
- 이전에 구성된 Alarm 값을 편집하여 특정 요구 사항에 맞게 Alarm 을 사용자 정의합니다.
- 여러 데이터베이스에 걸쳐 모니터링 설정을 표준화하기 위해 Alarm 을 복제합니다.

- Alarm Definition
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_mgmt_predefined_alarm.png)

## New release for Data Integration
* **Services:** Data Integration, Oracle Cloud Infrastructure
* **Release Date:** Oct. 11, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/695ee996-bc57-4b4d-9853-5e57da5d4610/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/695ee996-bc57-4b4d-9853-5e57da5d4610/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 다음을 수행할 수 있습니다.

- 프로젝트와 해당 콘텐츠, 개별 폴더, 작업, 데이터 흐름 및 파이프라인을 내보내고 가져옵니다.
- 함수 라이브러리와 해당 사용자 정의 함수, 개별 함수를 내보내고 가져옵니다.
 OCI 데이터 흐름 작업에서 유연한 드라이버 및 실행기 형태를 사용할 때 할당된 OCPU 수와 메모리 양을 사용자 정의하고 매개변수화합니다.
- 작업 실행이 수동으로 시작되거나 작업 일정에 따라 시작되는 경우 작업의 동시 실행을 비활성화합니다. 이 기능은 그래픽 사용자 인터페이스에서만 사용할 수 있습니다.
- 모니터링 작업 영역 페이지에서 모든 작업 실행 통계를 확인할 수 있습니다.
- OCI 로깅 검색 페이지를 사용하여 통합, 데이터 로더, REST, SQL 및 파이프라인 작업 실행에 대한 데이터 통합 로그를 검색합니다.

## Base Database: Enhancements to Pluggable Database (PDB) management
* **Services:** Database
* **Release Date:** Oct. 11, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/44e0303a-6812-495e-af9e-ce7de130d3f3/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/44e0303a-6812-495e-af9e-ce7de130d3f3/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 플러그형 데이터베이스를 Restore, Relocate 및 Refresh 할 수 있습니다.

- PDB Clone 을 통한 Restore, Relocate 및 Refresh 기능
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_mgmt_pdb_clone.png)


## Database Migration introduces GoldenGate Service Integration for replication
* **Services:** Database Migration, Oracle Cloud Infrastructure
* **Release Date:** Oct. 17, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/9cd07bac-08ab-43a5-bd0f-094d9efa8c96/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/9cd07bac-08ab-43a5-bd0f-094d9efa8c96/){:target="_blank" rel="noopener"}

### 릴리즈 내용

Online Migration 의 경우 이제 GoldenGate Marketplace 스택을 생성할 필요가 없습니다.
Migration 을 생성할 때 "Use Online Replication" 옵션을 선택하기만 하면 데이터베이스 마이그레이션 서비스가 추가 설정이나 비용 없이 Online Migration 을 위한 Managed GoldenGate 인스턴스를 원활하게 생성 및 설정합니다.

## Delayed Deletion of Protected Database Resources and Database Backups
* **Services:** Oracle Cloud Infrastructure, Oracle Database Autonomous Recovery Service
* **Release Date:** Oct. 18, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/e64e477d-7d24-4ca8-954e-ff6465644e04/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/e64e477d-7d24-4ca8-954e-ff6465644e04/){:target="_blank" rel="noopener"}

### 릴리즈 내용

이제 Protect 된 데이터베이스에는 삭제 예약이라는 새로운 수명 주기 상태가 생겼습니다.

소스 데이터베이스를 종료하거나 자동 백업을 비활성화한 후 보호된 데이터베이스 리소스는 Delayed Deletion 상태로 전환됩니다. 복구 서비스는 Protected 데이터베이스 리소스 및 데이터베이스 백업의 삭제를 72시간 동안 또는 백업 보존 기간이 끝날 때까지 Delay 합니다. 이 기능은 데이터베이스를 종료한 후에도 데이터를 복구할 수 있는 기회를 제공합니다.

## Create a Protected Database in a Dry-Run Mode
* **Services:** Oracle Cloud Infrastructure, Oracle Database Autonomous Recovery Service
* **Release Date:** Oct. 18, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/a4603149-8eb5-403a-98c2-ebb31e1aff84/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/a4603149-8eb5-403a-98c2-ebb31e1aff84/){:target="_blank" rel="noopener"}

### 릴리즈 내용

CreateProtectedDatabase API의 시험 실행을 수행하여 보호된 데이터베이스를 생성하기 전에 모든 전제 조건을 충족하는지 확인할 수 있습니다. 테스트 실행 요청 (Dry-Run Request)은 누락된 요구 사항을 식별하는 오류 메시지를 반환하고 각 요구 사항을 충족하기 위한 권장 작업도 나타냅니다.

- Autonomous Recovery Service 생성 시 요구되는 사전 요구 사항 체크 오류 메시지 (Dry-Run API  제공)
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_autonomous_recovery_svc.png)

- 사전 설정 필요 Policy
  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_db_backup_recovery_svc_policy.png)

## GoldenGate adds support for new connection types
* **Services:** GoldenGate
* **Release Date:** Oct. 24, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/8f44460a-fd34-4f78-8afc-8d2d9313cadf/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/8f44460a-fd34-4f78-8afc-8d2d9313cadf/){:target="_blank" rel="noopener"}

### 릴리즈 내용

OCI GoldenGate는 9가지 새로운 연결 유형에 대한 지원을 추가했습니다.
이제 배포 버전 _841 이상에서 다음 연결 유형에 대한 지원을 사용할 수 있습니다.
- Google BigQuery
- Google Cloud Storage
- Redis
- Amazon Redshift
- Amazon Kinesis
- Elasticsearch
- SQL Server용 Google Cloud SQL
- SingleStoreDB
- SingleStoreDB Cloud

- Deployment 생성 화면

  ![OCI OCI GoldenGate](/assets/img/dataplatform/2023/release_note/202309/oci_goldengate_add_connections.png)




---
