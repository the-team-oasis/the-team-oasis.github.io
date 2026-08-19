---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "6월 OCI Infrastructure 업데이트 소식"
teaser: "2026년 6월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2026-infrastructure
tags:
   - oci-release-notes-2026
   - Jun-2026
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

## Object Storage Supports Bucket Level Encryption
* **Services**: Object Storage
* **Release Date**: June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/objectstorage/objectstorage-bek.htm](https://docs.oracle.com/iaas/releasenotes/objectstorage/objectstorage-bek.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Updating an Object Storage Bucket to Use an SSE-KMS Bucket Key](https://docs.oracle.com/iaas/Content/Object/Tasks/managingbuckets_topic-To_update_a_bucket_to_use_sse_kms_bucket_key.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Object Storage에서 customer-managed Vault(KMS) key를 사용할 때 bucket level encryption을 활성화할 수 있게 되었습니다. bucket-scoped intermediate encryption key를 고객 KMS key로 보호하는 방식이며, Oracle 공식 릴리스 노트는 SSE-KMS 사용 시 Bucket Key encryption setting 활성화를 권장합니다.

운영 영향은 KMS 호출 감소입니다. Object Storage와 KMS 사이의 호출이 줄어 PUT/GET latency를 낮추고 KMS throttling 가능성을 줄일 수 있으므로, 대량 object ingest나 빈번한 read/write bucket에서 효과를 기대할 수 있습니다.

### 주요 변경 포인트

* Object Storage bucket에서 SSE-KMS bucket key를 사용하도록 설정할 수 있습니다.
* Bucket level encryption을 사용하면 객체별 암복호화 과정에서 KMS 호출 빈도를 줄여 latency와 KMS throttling 가능성을 낮출 수 있습니다.
* KMS key는 여전히 암호화 체계의 기준이므로 key 권한과 rotation 정책을 함께 관리해야 합니다.

### 적용 및 검증 포인트

기존 bucket에 적용할 때는 사용하는 Vault/KMS key, bucket 접근 정책, 애플리케이션의 upload/download 경로를 함께 확인해야 합니다. 적용 후에는 신규 객체 업로드, 기존 객체 접근, KMS audit/logging, 성능 지표를 기준으로 기대한 효과가 있는지 검증하는 것이 좋습니다.

### 설정 방법

bucket key는 기본적으로 disabled 상태입니다. Console에서는 Bucket list에서 대상 bucket의 Actions 메뉴를 통해 **Use Bucket Key**를 enable/disable할 수 있고, CLI에서는 다음 형태로 설정합니다.

```bash
oci os bucket update \
 --name <bucket_name> \
 --is-bucket-key-enabled true \
 --kms-key-id <kms_key_ocid>
```

중요한 제약은 이 설정이 enable 이후 새로 쓰는 object에 적용된다는 점입니다. 기존 object는 이전 wrapping 상태로 남기 때문에, 기존 object까지 같은 bucket key 방식으로 맞추려면 bucket re-encryption을 별도로 수행해야 합니다. 이미 bucket에 KMS key가 연결되어 있다면 key를 바꾸려는 경우가 아니라면 `--kms-key-id`를 다시 전달하지 않아도 됩니다.

## Bitbucket Cloud API token authentication now supported
* **Services**: Resource Manager
* **Release Date**: June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-manager/bitbucket-api-tokens-support.htm](https://docs.oracle.com/iaas/releasenotes/resource-manager/bitbucket-api-tokens-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Configuration Source Providers](https://docs.oracle.com/iaas/Content/ResourceManager/Tasks/managingconfigurationsourceproviders.htm){:target="_blank" rel="noopener"}, [Creating Stacks from Source Control](https://docs.oracle.com/iaas/Content/ResourceManager/Tasks/create-stack-source-control.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Manager가 Bitbucket Cloud REST API 인증에 Atlassian account email address와 API token 방식을 지원합니다. Atlassian이 2026년 7월 28일 Bitbucket Cloud app password를 영구 비활성화할 예정이므로, Bitbucket Cloud 연동 stack을 사용하는 고객은 인증 방식을 전환해야 합니다.

적용 범위는 Bitbucket Cloud 저장소를 소스로 사용하는 Resource Manager configuration입니다. 기존 app password 기반 구성이 남아 있으면 Terraform stack plan/apply 단계에서 source 접근이 실패할 수 있으므로, 전환 후 repository 접근과 stack 작업을 미리 검증하는 것이 좋습니다.

### 전환 및 검증 포인트

Configuration Source Provider에서 Bitbucket Cloud 인증 정보를 API Token 방식으로 갱신해야 합니다. Atlassian Account Email과 API Token을 준비하고, 해당 Provider를 참조하는 Stack에서 Configuration 가져오기와 Plan 작업이 정상적으로 수행되는지 확인하는 것이 좋습니다.

API Token은 App Password와 별도로 발급·폐기되므로 Secret 보관 위치와 교체 절차도 함께 갱신해야 합니다. 전환 전에는 영향받는 Configuration Source Provider와 Stack을 식별하고, 전환 후에는 Repository 접근 권한과 Workspace 실행 결과를 확인합니다.

## Resource Analytics - June 2026
* **Services**: Resource Analytics
* **Release Date**: June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-analytics/resource-analytics-v2-6.htm](https://docs.oracle.com/iaas/releasenotes/resource-analytics/resource-analytics-v2-6.htm){:target="_blank" rel="noopener"}
* **Documentation:** [About Resource Analytics Releases](https://docs.oracle.com/iaas/Content/resource-analytics/overview.htm#releases-about){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Analytics 2026년 6월 업데이트에는 신규 서비스 데이터와 Identity, Load Balancer view 확장이 포함됩니다. ADW에는 Access Governance, Data Safe, Data Science, Generative AI, Marketplace Publisher, Multicloud, Secure Desktops 관련 resource 데이터가 추가되었습니다.

운영 활용 관점에서는 tenancy-wide inventory와 거버넌스 리포트 범위가 넓어졌습니다. Identity resource도 auth token, customer secret key, domain, dynamic group, MFA TOTP device, policy, provider, SMTP credential 등 더 많은 세부 항목을 다룰 수 있어 보안 점검 리포트에 유용합니다.

### 주요 변경 포인트

* ADW에 Access Governance, Data Safe, Data Science, Generative AI, Marketplace Publisher, Multicloud, Secure Desktops 관련 Resource 데이터가 추가되었습니다.
* Identity View에서 Auth Token, Customer Secret Key, Domain, Dynamic Group, MFA TOTP Device, Policy, Provider, SMTP Credential을 분석할 수 있습니다.
* Load Balancer 관련 View가 확장되어 Tenancy 전반의 Resource Inventory와 Governance Report 범위가 넓어졌습니다.

### 활용 포인트

업데이트 후에는 새 Resource 유형이 ADW Table과 View에 반영되었는지 확인하고, 기존 Report나 Query에서 Column 추가로 인한 영향이 없는지 점검하는 것이 좋습니다. Identity Credential과 Policy 데이터를 함께 분석하면 장기 미사용 Credential이나 정책 구성 현황을 점검하는 데 활용할 수 있습니다.

## Unified Monitoring Agent 0.1.49 released
* **Services**: Logging, Monitoring
* **Release Date**: June 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/logging/uma0149.htm](https://docs.oracle.com/iaas/releasenotes/logging/uma0149.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Unified Monitoring Agent](https://docs.oracle.com/iaas/Content/Logging/Concepts/unified_agent.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Unified Monitoring Agent 0.1.49가 릴리스되었습니다. 주요 변경은 Ruby 3.3.11 업그레이드, Red Hat Enterprise Linux 10 지원, OpenSSL 3.5.6 업그레이드입니다.

단순 agent 버전 업데이트이지만 OS/보안 라이브러리 영향이 있으므로 RHEL 10 도입 예정 환경이나 OpenSSL 정책을 관리하는 환경에서는 업데이트 일정을 확인하는 것이 좋습니다. 새 UMA 버전은 realm/region별 rollout 시간이 다를 수 있으므로 Console이나 패키지 저장소에서 보이지 않으면 지역 배포 상태를 먼저 확인해야 합니다.

### 주요 변경 포인트

* Agent Runtime이 Ruby 3.3.11로 업데이트되었습니다.
* Red Hat Enterprise Linux 10 지원이 추가되었습니다.
* OpenSSL 3.5.6을 사용하도록 보안 구성요소가 업데이트되었습니다.

### 적용 및 검증 포인트

운영 반영 전에는 사용 중인 OS와 Agent Plugin의 호환성을 확인하고, 테스트 Agent에서 Log 수집과 Metric 전송이 정상적으로 동작하는지 점검하는 것이 좋습니다. 업그레이드 후에는 Agent 상태, 수집 지연, 전송 오류를 확인하고, 문제가 발생할 경우를 대비해 기존 버전의 배포 및 복구 절차도 함께 준비합니다.

## Zero Trust Packet Routing Visualizer
* **Services**: Zero Trust Packet Routing
* **Release Date**: June 24, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/zero-trust-packet-routing/zpr-visualizer.htm](https://docs.oracle.com/iaas/releasenotes/zero-trust-packet-routing/zpr-visualizer.htm){:target="_blank" rel="noopener"}
* **Documentation:** [ZPR Visualizer](https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/zpr-visualizer.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Zero Trust Packet Routing(ZPR) Visualizer를 사용해 ZPR security attributes, protected resources, policies 간 관계를 tenancy 단위로 시각적으로 확인할 수 있게 되었습니다. ZPR 정책이 실제로 어떤 리소스 간 통신을 허용하거나 차단하는지 이해하는 데 도움이 됩니다.

운영 시나리오는 ZPR 도입 전 영향도 분석, 정책 변경 후 검증, 예기치 않은 차단/허용 경로 troubleshooting입니다. 특히 unprotected resources 식별과 policy enforcement 검증을 지원하므로, 네트워크 보안 리뷰에서 시각 자료로 활용하기 좋습니다.

### 주요 변경 포인트

* ZPR Visualizer로 protected resource, security attribute, ZPR policy의 연결 관계를 시각적으로 확인할 수 있습니다.
* 정책 작성 전후에 의도한 resource 간 통신 경로가 허용 또는 차단되는지 검토하기 쉬워졌습니다.
* 네트워크 보안 정책을 텍스트만으로 검토할 때 놓치기 쉬운 attribute mismatch를 줄일 수 있습니다.

### 운영 활용 포인트

ZPR 적용 전에는 Visualizer로 예상 경로를 확인하고, 적용 후에는 실제 private endpoint 또는 protected resource 접근 테스트와 함께 결과를 비교하는 것이 좋습니다. 보안 속성 변경은 서비스 영향이 클 수 있으므로 운영 반영 전 dev/test compartment에서 먼저 검증하는 흐름이 안전합니다.

### 권한 조건

ZPR Visualizer는 tenancy/region 안의 security attribute, protected resource, ZPR policy 관계를 읽어 시각화합니다. 이를 위해 `zpr-tools` service가 resource를 읽을 수 있도록 다음과 같은 read policy를 추가하고, topology 접근에 대해 global access 또는 dynamic group 기반 restricted access 정책을 구성합니다.

```text
Allow service zpr-tools to read all-resources in tenancy
```

운영 환경에서는 먼저 read-only 성격의 권한 범위를 검토해야 합니다. Visualizer는 정책 적용 결과를 이해하고 allowed/blocked communication을 진단하는 데 도움을 주지만, 실제 허용 여부는 ZPR policy, security attribute, NSG/security list가 함께 결정하므로 시각화 결과와 실제 통신 테스트를 같이 봐야 합니다.

## vSphere 8.0 Software Bundle Updates
* **Services**: Oracle Cloud VMware Solution
* **Release Date**: June 16, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/oracle-cloud-vmware-solution/artifact-versions-vsphere8.htm](https://docs.oracle.com/iaas/releasenotes/oracle-cloud-vmware-solution/artifact-versions-vsphere8.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Overview of Oracle Cloud VMware Solution](https://docs.oracle.com/iaas/Content/VMware/Concepts/ocvsoverview.htm#about-vmware){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud VMware Solution의 vSphere 8.0 software bundle 버전이 업데이트되었습니다. 포함 버전은 ESXi 8.0 Update 3j, vCenter Server 8.0 Update 3j, NSX-T Data Center 4.2.4.0, HCX Cloud/Connector 4.11.5.0입니다.

업그레이드 성격의 변경이므로 기존 SDDC 운영 환경에서는 VMware 호환성, 백업/롤백 계획, 유지보수 창을 먼저 검토해야 합니다. 새 번들을 적용할 때는 OCVS 문서의 software bundle 구성과 현재 SDDC 버전 차이를 확인하고, HCX/NSX 의존성이 있는 migration 또는 DR 구성을 함께 점검하는 것이 좋습니다.

### Software Bundle 구성

* ESXi 8.0 Update 3j
* vCenter Server 8.0 Update 3j
* NSX-T Data Center 4.2.4.0
* HCX Cloud 및 Connector 4.11.5.0

### 적용 및 검증 포인트

업그레이드 전에는 현재 SDDC의 Software Bundle 버전과 대상 버전의 차이를 확인하고, VMware 구성요소 간 호환성과 유지보수 창을 검토해야 합니다. 업그레이드 후에는 vCenter와 NSX Manager 상태, ESXi Host 연결, HCX Service Mesh와 Migration 경로를 순서대로 확인하는 것이 좋습니다.

## Events for Management Agent
* **Services**: Events, Management Agent
* **Release Date**: June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-agent/jun26-macs-events.htm](https://docs.oracle.com/iaas/releasenotes/management-agent/jun26-macs-events.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Overview of Events](https://docs.oracle.com/iaas/Content/Events/Concepts/eventsoverview.htm){:target="_blank" rel="noopener"}, [Managing Rules for Events](https://docs.oracle.com/iaas/Content/Events/Task/managingrules.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Management Agent 리소스 변경을 OCI Events로 모니터링하고 Notifications, Streams, Functions 같은 후속 동작을 트리거할 수 있게 되었습니다. 이벤트 예시는 예정된 agent deletion, upgrade success/failure, 새 agent version availability, agent availability status change입니다.

설정 방법은 Management Agent 이벤트 유형을 기준으로 Events rule을 만들고, 대상 action을 Notifications topic, Streaming, Functions 등 운영 프로세스에 맞게 연결하는 방식입니다. agent upgrade 실패나 availability 변화는 운영 장애로 이어질 수 있으므로, 알림 규칙을 먼저 구성하는 것이 좋습니다.

### 주요 변경 포인트

* Management Agent 상태 변화를 OCI Events 기반으로 감지하고 규칙을 만들 수 있습니다.
* Agent availability, lifecycle, 관리 이벤트를 Notification, Functions, Streaming 등 후속 처리와 연결하기 쉬워졌습니다.
* 대규모 agent fleet에서는 수동 점검보다 event-driven 운영 모델을 적용하기 좋습니다.

### 설정 및 검증 포인트

Events rule을 만들 때는 event type, compartment scope, condition filter를 좁게 정의해야 불필요한 알림을 줄일 수 있습니다. 규칙 생성 후에는 agent 중지/시작 또는 상태 변화 시나리오를 테스트해 실제 notification 또는 automation target으로 이벤트가 전달되는지 확인해야 합니다.

### 설정 방법

Management Agent event rule은 Console에서 **Observability & Management > Events Service > Rules**로 이동해 생성합니다. Rule condition에서 `Event Type`을 선택하고 Service Name을 `Management Agent`로 지정한 뒤, upcoming agent deletion, successful/failed agent upgrade, new agent version availability, agent availability status changes 같은 이벤트 유형을 선택할 수 있습니다.

사전 조건으로는 Events 권한과 rule action target이 필요합니다. Notifications topic/subscription, Streaming, Functions 중 하나를 action resource로 지정할 수 있습니다. 운영에서는 attribute filter를 추가해 agent OCID, compartment, event type 범위를 좁히면 불필요한 알림을 줄일 수 있습니다.

## New Experience in Oracle Cloud Console
* **Services**: OCI Control Center
* **Release Date**: June 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/control-center/occ-redwood.htm](https://docs.oracle.com/iaas/releasenotes/control-center/occ-redwood.htm){:target="_blank" rel="noopener"}
* **Documentation:** [New Console Experience](https://docs.oracle.com/iaas/Content/GSG/Concepts/new-console.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud Console의 새 UI 경험이 적용되었습니다. resource list page, resource details page, resource creation workflow의 디자인과 사용성이 변경될 수 있습니다.

단순 UI 변경 성격이므로 기능 자체보다는 운영 문서와 스크린샷 영향이 중요합니다. 내부 가이드나 블로그 화면 캡처가 기존 Console 기준이면, 다음 실습 업데이트 때 새 화면 기준으로 경로와 버튼명을 다시 확인하는 것이 좋습니다.

### 주요 변경 포인트

* Resource list page, resource details page, resource creation workflow의 화면 구성이 새 Console Experience 기준으로 바뀔 수 있습니다.
* 기능 변경보다는 운영 문서, 실습 자료, 화면 캡처, 사용자의 작업 경로에 영향을 주는 업데이트입니다.
* 스크린샷보다 Console 변경이 먼저 적용될 수 있다는 점을 고려해야 합니다.

### 운영 시 참고 사항

블로그나 내부 가이드의 Console 경로·버튼명·화면 캡처가 기존 UI 기준이면 다음 문서 업데이트 시 새 화면 기준으로 재확인하는 것이 좋습니다. 반복 운영 절차가 있는 서비스는 resource list와 detail page의 filter, column, tab 구성을 먼저 확인해 사용자 안내 문구를 보완해야 합니다.

## Add ZPR Security Attributes to Database Management Private Endpoints
* **Services**: Database Management
* **Release Date**: June 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-management/zpr-dbm-pe.htm](https://docs.oracle.com/iaas/releasenotes/database-management/zpr-dbm-pe.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Manage Security Attributes for Private Endpoints](https://docs.oracle.com/iaas/database-management/doc/create-database-management-private-endpoint.html#DBMGM-GUID-99066B7A-1499-44EE-BCEF-EB540946671F){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Management private endpoint에 ZPR security attributes를 추가할 수 있게 되었습니다. private endpoint 생성 시 또는 생성 후 details page에서 security attributes를 붙여 ZPR 정책 기반 접근 제어에 포함할 수 있습니다.

운영적으로는 DB 관리 트래픽을 단순 network boundary가 아니라 security attribute 기반 정책으로 더 세밀하게 통제할 수 있습니다. 적용 전에는 private endpoint가 연결되는 VCN/subnet, 대상 database, ZPR policy가 참조하는 attribute naming convention을 먼저 정리해야 합니다.

### 주요 변경 포인트

* Private endpoint 또는 protected resource에 security attributes를 연결해 ZPR 정책과 함께 사용할 수 있는 범위가 확대되었습니다.
* 네트워크 경로만이 아니라 resource attribute 기반으로 접근 경계를 더 세밀하게 설계할 수 있습니다.
* 기존 private endpoint를 운영 중인 환경에서는 attribute 추가가 접근 정책에 미치는 영향을 먼저 검토해야 합니다.

### 적용 및 검증 포인트

적용 전에는 security attribute namespace, key/value, ZPR policy 조건, 대상 private endpoint의 compartment를 함께 확인해야 합니다. 적용 후에는 허용되어야 하는 client와 차단되어야 하는 client를 나누어 실제 접근 테스트를 수행하는 것이 좋습니다.

## Add ZPR Security Attributes to Ops Insights Private Endpoints
* **Services**: Ops Insights
* **Release Date**: June 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/operations-insights/zpr-opsi-pe.htm](https://docs.oracle.com/iaas/releasenotes/operations-insights/zpr-opsi-pe.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Manage Security Attributes for Private Endpoints](https://docs.oracle.com/iaas/operations-insights/doc/create-private-endpoint.html#OOPSI-GUID-99066B7A-1499-44EE-BCEF-EB540946671F){:target="_blank" rel="noopener"}

### 업데이트 내용

Ops Insights private endpoint에 ZPR security attributes를 추가할 수 있게 되었습니다. 생성 단계 또는 private endpoint details page에서 보안 속성을 지정해 ZPR 정책과 연동할 수 있습니다.

Fleet analysis나 SQL Insights처럼 여러 database telemetry를 다루는 서비스는 접근 경로 통제가 중요합니다. ZPR security attribute를 적용한 뒤에는 Ops Insights 수집/분석 경로가 정상 동작하는지, 허용되지 않은 endpoint에서 접근이 차단되는지 함께 검증하는 것이 좋습니다.

### 주요 변경 포인트

* Private endpoint 또는 protected resource에 security attributes를 연결해 ZPR 정책과 함께 사용할 수 있는 범위가 확대되었습니다.
* 네트워크 경로만이 아니라 resource attribute 기반으로 접근 경계를 더 세밀하게 설계할 수 있습니다.
* 기존 private endpoint를 운영 중인 환경에서는 attribute 추가가 접근 정책에 미치는 영향을 먼저 검토해야 합니다.

### 적용 및 검증 포인트

적용 전에는 security attribute namespace, key/value, ZPR policy 조건, 대상 private endpoint의 compartment를 함께 확인해야 합니다. 적용 후에는 허용되어야 하는 client와 차단되어야 하는 client를 나누어 실제 접근 테스트를 수행하는 것이 좋습니다.

## Add ZPR security attributes to Object Storage private endpoints
* **Services**: Object Storage, Zero Trust Packet Routing
* **Release Date**: June 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/objectstorage/objectstorage-zpr-enhancement.htm](https://docs.oracle.com/iaas/releasenotes/objectstorage/objectstorage-zpr-enhancement.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Adding Security Attributes to a Private Endpoint](https://docs.oracle.com/iaas/Content/Object/Concepts/objectstorage-usingzpr.htm){:target="_blank" rel="noopener"}, [ZPR Policy Overview](https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/zpr-policy-overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Object Storage private endpoint에 ZPR security attributes를 추가할 수 있게 되었습니다. security attributes는 ZPR policy가 참조하는 label이며, 같은 정책 조건을 만족하는 client endpoint와 service endpoint 간 접근을 network level에서 enforcement합니다.

활용 시나리오는 Object Storage bucket 접근을 VCN private endpoint와 ZPR 정책으로 묶어 데이터 유출 경로를 줄이는 구성입니다. 적용 전에는 private endpoint별 attribute 설계, object 접근 workload, 기존 IAM policy와 ZPR policy의 역할 분리를 함께 검토해야 합니다.

### 주요 변경 포인트

* Private endpoint 또는 protected resource에 security attributes를 연결해 ZPR 정책과 함께 사용할 수 있는 범위가 확대되었습니다.
* 네트워크 경로만이 아니라 resource attribute 기반으로 접근 경계를 더 세밀하게 설계할 수 있습니다.
* 기존 private endpoint를 운영 중인 환경에서는 attribute 추가가 접근 정책에 미치는 영향을 먼저 검토해야 합니다.

### 적용 및 검증 포인트

적용 전에는 security attribute namespace, key/value, ZPR policy 조건, 대상 private endpoint의 compartment를 함께 확인해야 합니다. 적용 후에는 허용되어야 하는 client와 차단되어야 하는 client를 나누어 실제 접근 테스트를 수행하는 것이 좋습니다.

### 운영 시 주의사항

Object Storage private endpoint에 ZPR security attribute를 추가하려면 security attribute namespace/key/value와 ZPR policy가 먼저 준비되어 있어야 합니다. private endpoint 생성 화면의 Security attributes 섹션에서 최대 3개의 security attribute를 추가할 수 있습니다.

가장 중요한 주의사항은 기존 NSG만으로 접근을 허용하던 endpoint에 security attribute를 추가하면, 이후 traffic은 ZPR policy와 NSG/security list 규칙을 모두 만족해야 한다는 점입니다. security attribute를 추가한 뒤 명시적인 ZPR policy가 없으면 endpoint로 향하는 traffic이 차단될 수 있다고 안내하므로, 운영 반영 전 허용 정책을 먼저 만들어 두어야 합니다.

## Internet of Things introduces new regions and an Oracle Developer Tools connection
* **Services**: Internet of Things
* **Release Date**: June 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/internet-of-things/update-06092026.htm](https://docs.oracle.com/iaas/releasenotes/internet-of-things/update-06092026.htm){:target="_blank" rel="noopener"}
* **Documentation:** [IoT Domain Database Schema](https://docs.oracle.com/iaas/Content/internet-of-things/iot-domain-database-schema.htm){:target="_blank" rel="noopener"}, [Database Tools](https://docs.oracle.com/iaas/database-tools/home.htm){:target="_blank" rel="noopener"}, [Scenario: Connect to IoT Data with Database Tools](https://docs.oracle.com/iaas/Content/internet-of-things/query-iot-database-with-database-tools.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Internet of Things 서비스가 Singapore West, Spain Central, Morocco West, Italy North, Malaysia West 2 리전에 추가되었습니다. 또한 IoT domain에 active digital twin resource가 있으면 먼저 관련 digital twin instance를 삭제한 뒤 domain을 삭제해야 합니다.

운영적으로 중요한 변화는 IoT database를 Oracle Database Tools Service로 연결할 수 있게 된 점입니다. IoT 데이터를 Database Tools에서 조회하는 시나리오를 구성하면, 운영자가 별도 애플리케이션을 만들지 않고도 IoT 데이터 확인과 진단을 더 쉽게 수행할 수 있습니다.

### 주요 변경 포인트

* IoT 서비스 사용 가능 region이 확대되고 Oracle Developer Tools 연결 시나리오가 추가되었습니다.
* IoT domain database schema와 Database Tools 연계를 통해 IoT 데이터를 조회하거나 운영 진단에 활용하기 쉬워졌습니다.
* 신규 region 확장은 data residency나 현장 가까운 수집 경로가 필요한 IoT 프로젝트에 의미가 있습니다.

### 적용 및 검증 포인트

신규 region을 사용할 때는 IoT domain, digital twin, database 접근 경로가 대상 region에서 모두 지원되는지 확인해야 합니다. Database Tools 연결은 인증, 네트워크 접근, schema 권한을 점검한 뒤 샘플 query로 데이터 조회 흐름을 검증하는 것이 좋습니다.

### 연결 흐름

IoT 데이터를 Database Tools로 조회할 때는 private, token-authenticated Database Tools connection을 만드는 방식이 적합합니다. 이 연결은 IoT domain database connection string, private endpoint가 있는 allowlisted subnet, IAM token authentication, IoT domain workspace의 proxy client user를 사용합니다.

사전 조건으로는 IoT domain group/domain OCID, database token scope, IoT domain short ID, Database Tools family 사용 권한, IoT direct data access 관련 권한이 필요합니다. 연결 후에는 Database Tools에서 connection validation을 수행하고 SQL Worksheet나 지원되는 OCI 서비스에서 해당 reusable connection을 사용하는 흐름으로 검증합니다.

## Health Status, Certificate Rotation, Security Attributes, and Session Metrics Updates for Network Firewall
* **Services**: Network Firewall
* **Release Date**: June 03, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/network-firewall/release-notes-2026-02-20.htm](https://docs.oracle.com/iaas/releasenotes/network-firewall/release-notes-2026-02-20.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Network Firewall Overview](https://docs.oracle.com/iaas/Content/network-firewall/overview.htm){:target="_blank" rel="noopener"}, [Network Firewall Metrics](https://docs.oracle.com/iaas/Content/network-firewall/metrics.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Network Firewall에 API 중심의 운영 기능이 여러 가지 추가되었습니다. GetNetworkFirewallHealthStatus API는 OK, WARNING, CRITICAL, UNKNOWN 상태를 제공하고, decryption rule은 overlapping validity certificate를 지원해 ingress traffic decryption 인증서를 무중단에 가깝게 교체할 수 있습니다.

또한 firewall 생성/수정 시 security attributes를 추가하거나 제거할 수 있어 ZPR 연계 보안 제어에 활용할 수 있습니다. Session metrics는 firewall에서 열린 session 수를 보여주므로 트래픽 부하와 사용 패턴을 모니터링하는 데 유용합니다.

### 주요 변경 포인트

* Network Firewall에서 health status, certificate rotation, ZPR security attributes, session metrics 관련 기능이 함께 개선되었습니다.
* 방화벽 정책 변경이나 인증서 교체 시 가용성과 세션 상태를 더 세밀하게 관찰할 수 있습니다.
* ZPR security attributes를 함께 쓰는 환경에서는 네트워크 보안 경계와 identity-aware 접근 통제를 함께 설계할 수 있습니다.

### 운영 및 검증 포인트

인증서 교체는 트래픽 영향이 없는 시간대에 절차를 검증하고, session metrics와 firewall health를 기준으로 정상 동작을 확인하는 것이 좋습니다. ZPR 속성을 적용하는 경우에는 관련 protected resource의 attribute와 firewall 정책이 일치하는지 사전에 확인해야 합니다.

## Log Analytics: Enhancement in REST API source creation workflow
* **Services**: Log Analytics
* **Release Date**: June 02, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/log-analytics/jun26-rest-api-source-enh.htm](https://docs.oracle.com/iaas/releasenotes/log-analytics/jun26-rest-api-source-enh.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Set Up REST API Log Collection](https://docs.oracle.com/iaas/log-analytics/doc/rest-api-log-collection.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Log Analytics의 REST API type log source 생성 UI가 개선되었습니다. Add log endpoint에서 Log와 Initialization endpoint를 구분해 설정할 수 있고, Initialization endpoint에서 얻은 session token 같은 값을 이후 endpoint에서 사용할 수 있습니다.

여러 log list endpoint를 추가하거나, Initialization endpoint를 필요한 endpoint보다 앞에 배치할 수 있어 인증형 REST API 로그 수집 구성이 쉬워졌습니다. HTTP cookie 전달도 지원되므로 session 기반 API에서 로그 수집 workflow를 더 안정적으로 구성할 수 있습니다.

### 주요 변경 포인트

* Log Endpoint와 Initialization Endpoint를 구분해 구성할 수 있습니다.
* 여러 Log List Endpoint를 추가하고 실행 순서를 조정할 수 있습니다.
* Initialization Endpoint에서 받은 Session Token과 HTTP Cookie를 후속 Endpoint 요청에 사용할 수 있습니다.

### 적용 및 검증 포인트

인증이 필요한 REST API에서는 Initialization Endpoint가 Log Endpoint보다 먼저 실행되는지 확인해야 합니다. 구성 후에는 Session Token과 Cookie가 후속 요청에 전달되는지, Pagination과 수집 시간 범위가 의도대로 처리되는지, Parser가 Response에서 Log Record를 정확히 분리하는지 점검하는 것이 좋습니다.

### 수집 흐름

REST API 기반 log collection은 endpoint URL이 지정한 시간 범위의 log message를 반환하는 경우에 적합합니다. 전체 흐름은 Management Agent 설치, agent credential store에 API credential 등록, log-emitting resource를 나타내는 entity 생성, parser 생성, REST API source 정의 순서로 진행합니다.

REST API source에는 log 수집 시작 시간, page offset 반복, collection window/time frame을 표현하기 위한 macro를 사용할 수 있습니다. 운영에서는 endpoint가 pagination과 시간 범위를 안정적으로 처리하는지, parser가 response payload에서 실제 log record를 정확히 분리하는지 먼저 확인해야 합니다.

## Log Analytics: Use SOAP API to collect logs
* **Services**: Log Analytics
* **Release Date**: June 02, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/log-analytics/jun26-soap-api-ingestion.htm](https://docs.oracle.com/iaas/releasenotes/log-analytics/jun26-soap-api-ingestion.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Set Up REST API Log Collection](https://docs.oracle.com/iaas/log-analytics/doc/rest-api-log-collection.html){:target="_blank" rel="noopener"}, [USERNAME and PASSWORD Macros](https://docs.oracle.com/iaas/log-analytics/doc/rest-api-log-collection.html#LOGAN-GUID-23EE09FB-B55D-497C-99B3-CB61F6AE3BA9){:target="_blank" rel="noopener"}

### 업데이트 내용

Log Analytics에서 REST API source를 사용해 HTTP/HTTPS 기반 SOAP API 로그를 수집할 수 있게 되었습니다. SOAP envelope 형식의 XML payload를 endpoint에 구성하고, XML parser 또는 sub-parser setting으로 SOAP response 안의 log record를 추출할 수 있습니다.

또한 USERNAME/PASSWORD macro와 credential name을 함께 사용해 SOAP envelope에 인증 값을 주입할 수 있습니다. 기존 SOAP 기반 legacy 시스템 로그를 OCI Log Analytics로 가져와야 하는 경우 별도 변환 proxy 없이 수집 경로를 단순화할 수 있습니다.

### 주요 변경 포인트

* REST API Source에서 SOAP API의 POST Endpoint와 XML Payload를 구성할 수 있습니다.
* XML Parser와 Sub-parser를 사용해 SOAP Response 내부의 Log Record를 추출할 수 있습니다.
* Agent Credential Store의 인증 정보를 `USERNAME`, `PASSWORD` Macro로 SOAP Envelope에 전달할 수 있습니다.

### 적용 및 검증 포인트

운영 반영 전에는 SOAP Action, Content Type, 인증 방식과 Response 구조를 확인해야 합니다. Credential은 Source 정의에 직접 입력하지 않고 Agent Credential Store에서 관리하며, 수집 테스트에서는 XML Parsing 결과와 Base64 Decode 또는 압축 해제 결과까지 확인하는 것이 좋습니다.

### SOAP 수집 포인트

REST API source는 SOAP API over HTTP/HTTPS 수집에도 사용할 수 있습니다. SOAP API의 경우 POST endpoint, SOAP XML payload, `application/xml` 또는 API가 요구하는 content type을 지정하고, XML parser 또는 sub-parser로 SOAP response 안의 log record를 추출합니다.

SOAP response에 BI Publisher `reportBytes`처럼 encoded/zipped content가 들어 있는 경우에는 XML field를 mapping한 뒤 Base64 decode 또는 Base64 decode and unzip 같은 sub-parser action을 적용해야 합니다. 인증 정보는 agent credential store에 넣고 `USERNAME`, `PASSWORD` macro를 사용하는 방식이 안전합니다.

## BYOL Capability Enhancements
* **Services**: Oracle Cloud VMware Solution
* **Release Date**: June 02, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/oracle-cloud-vmware-solution/byol-update.htm](https://docs.oracle.com/iaas/releasenotes/oracle-cloud-vmware-solution/byol-update.htm){:target="_blank" rel="noopener"}
* **Documentation:** [VMware Solution License Management](https://docs.oracle.com/iaas/Content/VMware/Concepts/managing-licenses.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCVS의 BYOL 경험이 개선되어 license management와 visibility가 강화되었습니다. BYOL registration 시 Site ID를 제공할 수 있고, ESXi host 교체 또는 업그레이드 때 VCF BYOL Allocation ID를 지정할 수 있습니다.

또한 OCVS Console에서 VMware Cloud Foundation add-ons 관련 reporting을 제공해 BYOL resource와 allocation 투명성이 높아졌습니다. 기존 VMware 라이선스를 OCI에서 운영하는 고객은 host 교체/업그레이드 절차와 license allocation 기록이 감사 요구사항을 충족하는지 확인하는 것이 좋습니다.

### 주요 변경 포인트

* BYOL 등록 시 Site ID를 제공할 수 있습니다.
* ESXi Host 교체 또는 업그레이드 시 VCF BYOL Allocation ID를 지정할 수 있습니다.
* Console에서 VMware Cloud Foundation Add-on 관련 Reporting을 확인할 수 있습니다.

### 적용 및 검증 포인트

기존 BYOL 환경에서는 Site ID와 Allocation ID가 내부 License Inventory와 일치하는지 확인해야 합니다. Host 교체나 업그레이드 전에는 대상 Allocation을 기록하고, 작업 후 Console Reporting과 VMware License 관리 정보가 동일한지 검증하는 것이 좋습니다.
