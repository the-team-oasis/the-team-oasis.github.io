---
layout: page-fullwidth
subheadline: "Governance"
title: "OCI Organization Management로 Child Tenancy 운영하기"
teaser: "OCI Organization Management에서 Parent와 Child Tenancy의 관리 경계를 이해하고, Governance Rule과 Cross-tenancy IAM을 안전하게 운영하는 방법을 알아봅니다."
author: dankim
date: 2026-09-02 00:00:00
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, organization-management, child-tenancy, governance, iam, finops]
header: no
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

### 소개

여러 OCI Tenancy를 운영하다 보면 개발·검증·운영 환경을 분리하면서도 비용, 구독(Subscription), 공통 거버넌스 기준은 중앙에서 관리하고 싶습니다. **OCI Organization Management**는 이 목적을 위해 Parent Tenancy와 여러 Child Tenancy를 하나의 Organization으로 관리하는 기능입니다.

다만 가장 먼저 구분해야 할 점이 있습니다.

> Organization에 Child를 연결했다고 해서 Parent 관리자가 Child의 모든 리소스에 자동으로 로그인하거나 관리할 수 있는 것은 아닙니다. 비용·구독·Governance는 중앙화할 수 있지만, Child의 IAM, 네트워크, Vault, 워크로드 권한은 Child 경계에서 별도로 설계해야 합니다.

이 글에서는 처음 Organization Management를 도입하는 운영자를 위해 Parent/Child의 역할, Governance Rule 적용, Parent에서 Child 리소스에 최소 권한으로 접근하는 Cross-tenancy IAM 예시, 그리고 운영 확인 항목을 정리합니다.

### Parent Tenancy와 Child Tenancy의 역할

Organization은 단일 계층의 Parent–Child 구조입니다. Child는 Organization에 소속되더라도 독립된 OCI Tenancy로 유지됩니다.

![OCI Organization Management의 Parent와 Child Tenancy 구조](/assets/img/infrastructure/2026/oci-organization-management-child-tenancy/iam-orgmgt-tenancies.svg "OCI Organization Management의 Parent와 Child Tenancy 구조")

| 구분 | Parent Tenancy에서 중앙 관리하는 항목 | Child Tenancy에서 별도 관리하는 항목 |
|---|---|---|
| Organization | Child 목록, 초대 및 연결 관리 | Child의 자체 운영 책임 |
| 비용·구독 | Organization 단위 비용 분석, Subscription Mapping | Child 워크로드별 비용 태깅과 예산 운영 |
| Governance | Allowed Regions, Quota Policies, Tags Rule attach | Rule이 아닌 일반 IAM·리소스 운영 |
| Identity / IAM | Organization 관리 권한 | Identity Domain, 사용자, 그룹, 일반 리소스 정책 |
| Network / Security | 중앙 표준 수립 | VCN, DRG, Route Table, NSG, Security List, OS Firewall |
| Secrets / Keys | 운영 기준 수립 | Child별 Vault, Key, Secret 권한과 수명 주기 |

즉, **중앙에서 표준과 비용을 관리하고, Child에서는 실제 워크로드 접근 권한을 통제**하는 모델로 이해하면 좋습니다.

### 1. Child Tenancy 생성 또는 연결 전 준비

Child를 생성하거나 기존 Tenancy를 Organization에 연결하기 전에 다음 항목을 먼저 결정합니다.

| 확인 항목 | 예시 |
|---|---|
| Child의 목적 | `production`, `non-production`, `sandbox`, 자회사 또는 프로젝트별 분리 |
| Child 관리자 | Child별 local administrator와 비상용(break-glass) 관리자 지정 |
| 기본 Region | Seoul, Tokyo 등 서비스와 DR 요구사항에 맞는 Region |
| 비용 기준 | Cost Center, Application, Environment 태그 값 |
| 중앙 접근 범위 | Parent 운영자가 접근할 서비스·Compartment·기간 |
| Governance 적용 순서 | Test/Canary Child → Production Child → 전체 Organization |

Child Tenancy는 Parent의 사용자나 Identity Domain을 자동으로 복제하지 않습니다. 따라서 Child마다 관리자 활성화, MFA, Identity Domain 또는 IdP federation 구성을 확인해야 합니다.

### 2. Organization 관리 권한의 기본 개념

Organization 자체를 관리하는 Parent 사용자에게는 `organizations-family`에 대한 권한이 필요합니다. 아래 정책은 **Parent Tenancy**에서 Organization 관리 그룹에 부여하는 예시입니다.

```text
Allow group org-admins to manage organizations-family in tenancy
```

이 권한은 Organization, Child 연결, Subscription Mapping, Organization Governance 관리에 사용합니다. 하지만 이 정책만으로 Child의 Compute, VCN, Object Storage, Vault에 대한 권한이 생기지는 않습니다.

운영 역할은 다음처럼 분리하는 것을 권장합니다.

```text
org-admins
  - Organization, Child 연결, Subscription, Governance Rule 담당

parent-platform-operators
  - 승인된 Child의 특정 서비스/Compartment에만 Cross-tenancy 접근

child-local-admins
  - Child의 Identity, IAM, Network, Vault 및 workload 운영 담당
```

### 3. Governance Rule로 Child에 공통 기준 적용하기

Organization Governance는 Parent에서 Rule을 만들고 대상 Child에 연결(attach)하는 방식입니다. Child 사용자는 적용된 Rule 정보를 확인할 수 있지만 Rule 설정을 수정하지는 않습니다.

처음부터 모든 Child에 적용하지 말고, 테스트용 또는 Canary Child에 먼저 적용한 뒤 Work Request와 실제 동작을 확인하는 방식이 안전합니다.

#### 3-1. Allowed Regions

Allowed Regions Rule은 Child가 **새로 구독할 수 있는 Region**을 제한합니다. 이미 구독한 Region을 해지하거나 기존 리소스를 삭제하는 기능은 아닙니다.

```text
Rule name: allow-prod-regions
Allowed regions:
  - ap-seoul-1
  - ap-tokyo-1
Attach target: Production Canary Child
```

운영 적용 전에는 다음을 확인합니다.

* 현재 Child가 구독한 Region
* DR, 백업, 복제에 필요한 Region
* 필요한 OCI 서비스의 Region별 제공 여부
* Rule 적용 후 비허용 Region 구독이 차단되는지 여부

#### 3-2. Quota Policies

Quota Rule은 Child tenancy 전체에 서비스 생성 제한 또는 상한을 적용하는 데 사용할 수 있습니다. 예를 들어 Non-production Child에서 GPU 생성 자체를 막거나, Compute Core 상한을 둘 수 있습니다.

```text
# Non-production Child에서 GPU Compute 생성 제한
zero gpu-core quotas in tenancy

# Child tenancy의 Compute Core 상한 설정
set compute-core quota to 40 in tenancy

# Autonomous Database 생성 제한 예시
zero autonomous-database quotas in tenancy
```

Quota 문법이 잘못된 경우 Rule 생성은 되어도 attach 단계에서 실패할 수 있습니다. 반드시 Canary Child에서 attach하고 Work Request의 오류와 로그를 확인한 뒤 확장합니다.

#### 3-3. Tags Rule과 비용 기준 표준화

Tags Rule은 Parent root compartment의 Tag Namespace를 Child에 복제하고, 기본 태그(Default Tag)를 적용합니다. 비용 분석과 리소스 인벤토리에 일관된 기준을 만들 때 유용합니다.

```text
Rule name: required-finops-tags
Tag namespace: Operations

Default tags:
  Operations.CostCenter = "CC-4100"
  Operations.Application = user-applied value
  Operations.Environment = "prod"
```

고정 값은 자동으로 적용하고, `user-applied value`는 리소스 생성자가 값을 입력하도록 구성할 수 있습니다. Child에 같은 이름의 Tag Namespace가 이미 있으면 Rule attach가 실패할 수 있으므로 사전 점검이 필요합니다.

### 4. Parent 관리자가 Child 리소스에 접근해야 할 때

Parent 관리자라고 해서 Child Console에 자동 로그인하거나 Child의 Administrator가 되지는 않습니다. Parent의 기존 사용자 또는 그룹이 Child 리소스에 접근해야 한다면 **양쪽 Tenancy가 모두 동의하는 Cross-tenancy IAM 정책**이 필요합니다.

* **Parent**: 어떤 Parent 그룹이 어느 Child에 어떤 권한을 요청하는지 `Endorse`
* **Child**: 어떤 Parent 그룹을 어느 Compartment에 허용할지 `Admit`

다음은 Parent의 `Parent-Platform-Operators` 그룹이 Child의 `Shared-Operations` Compartment에서 Object Storage를 관리하는 최소 권한 예시입니다. 실제 OCID와 Identity Domain 이름으로 교체해야 합니다.

```text
# Parent Tenancy 정책
Define tenancy ChildProd as ocid1.tenancy.oc1..<child_tenancy_ocid>

Endorse group '<parent_identity_domain>'/'Parent-Platform-Operators' \
  to manage object-family in tenancy ChildProd
```

```text
# Child Tenancy 정책
Define tenancy Parent as ocid1.tenancy.oc1..<parent_tenancy_ocid>
Define group '<parent_identity_domain>'/'Parent-Platform-Operators' \
  as ocid1.group.oc1..<parent_group_ocid>

Admit group '<parent_identity_domain>'/'Parent-Platform-Operators' \
  of tenancy Parent to manage object-family in compartment Shared-Operations
```

위 예시의 핵심은 다음과 같습니다.

1. 한쪽 정책만으로는 접근 권한이 생기지 않습니다.
2. `manage all-resources in tenancy`나 `any-tenancy` 대신 서비스와 Compartment를 제한합니다.
3. Parent의 사용자는 Parent의 자격 증명으로 API/CLI를 호출합니다. Child에 사용자를 복제하는 방식이 아닙니다.
4. 서비스별 Cross-tenancy 요구사항과 양쪽 Region 구독 여부를 함께 확인합니다.

Child A와 Child B 간 접근도 같은 원칙입니다. 각 방향에 맞는 `Endorse`와 `Admit` 정책을 별도로 만들고, 필요한 경우 네트워크 연결까지 구성해야 합니다.

### 5. IAM 권한과 네트워크 연결은 별개입니다

Cross-tenancy IAM 정책을 만들었다고 VCN 통신이 자동으로 열리지는 않습니다. 반대로 VCN Peering 또는 DRG 연결만 만들었다고 리소스 API 접근 권한이 생기지도 않습니다.

애플리케이션 통신이 필요한 경우 아래 항목을 모두 점검합니다.

```text
[Identity / API 접근]
- Parent Endorse 정책
- Child Admit 정책
- 서비스별 IAM 정책과 Compartment 범위

[Network 통신]
- VCN Peering 또는 DRG 연결
- 양쪽 Route Table
- NSG 또는 Security List
- Instance OS Firewall
```

Object Storage의 데이터 공유, Vault의 Key/Secret 사용, Audit 조회도 각각의 IAM 경계에서 최소 권한으로 설계해야 합니다. 특히 Vault와 Key에 대한 `manage` 권한을 workload 운영 권한과 한 번에 묶지 않으면 침해 시 영향 범위를 줄일 수 있습니다.

### 6. 권장 운영 절차

#### 적용 전

* [ ] Child별 local administrator와 MFA를 확인합니다.
* [ ] default subscription, 비용 담당자, Region, DR 요구사항을 기록합니다.
* [ ] Tag Namespace 충돌과 기존 리소스 영향을 점검합니다.
* [ ] Parent 접근이 필요하다면 대상 서비스, Compartment, 방향, 만료일, Child 승인자를 정합니다.
* [ ] Governance Rule은 특정 Canary Child에 먼저 attach하도록 준비합니다.

#### 적용 및 검증

```text
1. Parent에서 Governance Rule 생성
2. Canary Child에 Rule attach
3. Organization Governance Work Request 상태와 오류 확인
4. Child Console에서 Region/Quota/Tag 동작 테스트
5. 검증 결과와 rollback 담당자를 변경 기록에 남김
6. 승인 후 Production Child 또는 전체 Organization으로 확대
```

#### 변경 후

* [ ] `Allowed Regions`, Quota, Default Tag가 Child에서 의도대로 동작하는지 확인합니다.
* [ ] Cross-tenancy 정책은 Parent의 `Endorse`와 Child의 `Admit`가 모두 최소 권한인지 검토합니다.
* [ ] `any-tenancy` 또는 tenancy 전체 `manage`가 없는지 확인합니다.
* [ ] Parent와 각 Child의 Audit에서 policy, user/group, key, network, Object Storage 변경을 검토합니다.
* [ ] Rule detach와 Organization Governance opt-out을 구분해 rollback 절차를 운영합니다.

### 마무리

OCI Organization Management는 여러 Tenancy의 비용·구독·거버넌스를 중앙화하는 데 효과적입니다. 하지만 Child는 독립된 보안 경계이므로 Parent의 Organization 관리 권한을 workload 관리자 권한으로 확대 해석해서는 안 됩니다.

운영의 핵심은 다음 세 가지입니다.

1. **Governance Rule은 Canary Child부터 검증한다.**
2. **Parent → Child 접근은 Cross-tenancy IAM의 Endorse와 Admit를 모두 구성한다.**
3. **IAM, 네트워크, Vault, Audit 경계를 Child별로 분리하고 최소 권한을 유지한다.**

### 참고

* [OCI Organization Management Overview](https://docs.oracle.com/en-us/iaas/Content/General/organization/organization_management_overview.htm){:target="_blank" rel="noopener"}
* [Creating and Attaching Governance Rules](https://docs.oracle.com/en-us/iaas/Content/General/organization/add-governance-createattachrule.htm){:target="_blank" rel="noopener"}
* [Planning an Organization](https://docs.oracle.com/en-us/iaas/Content/General/organization/organization_planning.htm){:target="_blank" rel="noopener"}
* [Creating a Child Tenancy](https://docs.oracle.com/en-us/iaas/Content/General/organization/child-tenancy-create.htm){:target="_blank" rel="noopener"}
* [Cross-Tenancy Access Policies](https://docs.oracle.com/en-us/iaas/Content/Identity/policieshow/iam-cross-domain.htm){:target="_blank" rel="noopener"}
* [Accessing Object Storage Resources Across Tenancies](https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/accessingresourcesacrosstenancies.htm){:target="_blank" rel="noopener"}
* [OCI VCN Peering](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/VCNpeering.htm){:target="_blank" rel="noopener"}
