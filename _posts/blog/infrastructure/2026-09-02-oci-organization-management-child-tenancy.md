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

개발·검증·운영 환경 또는 조직·프로젝트별로 OCI Tenancy를 분리하면 보안 경계와 비용 책임을 명확히 할 수 있습니다. 이때 **OCI Organization Management**는 여러 Tenancy를 Parent–Child 구조로 묶어 비용, Subscription, 공통 거버넌스 기준을 중앙에서 관리하는 기능입니다.

다만 다음 경계를 먼저 이해해야 합니다.

> Organization에 Child를 연결했다고 해서 Parent 관리자가 Child Console에 자동으로 로그인하거나 Child의 모든 리소스를 관리할 수 있는 것은 아닙니다. 비용·Subscription·Governance는 중앙화할 수 있지만, Child의 Identity Domain, IAM, VCN, Vault, 워크로드 권한은 Child 보안 경계에서 별도로 설계해야 합니다.

이 글은 Obsidian 원문을 바탕으로 Parent/Child의 관리 경계, Console 메뉴 경로, Governance Rule, Subscription Mapping, Cross-tenancy IAM, 그리고 보안 통제를 처음 도입하는 운영자 관점에서 정리합니다.

### Parent Tenancy와 Child Tenancy의 역할

Organization은 단일 계층의 Parent–Child 구조입니다. Child는 Organization에 소속되더라도 독립된 OCI Tenancy로 유지됩니다.

![OCI Organization Management의 Parent와 Child Tenancy 구조](/assets/img/infrastructure/2026/oci-organization-management-child-tenancy/iam-orgmgt-tenancies.svg "OCI Organization Management의 Parent와 Child Tenancy 구조")

| 구분 | Parent Tenancy에서 중앙 관리하는 항목 | Child Tenancy에서 별도 관리하는 항목 |
|---|---|---|
| Organization | Child 목록, 초대·연결, Subscription Mapping | Child의 자체 운영 책임 |
| 비용 | Organization 단위 비용·사용량 분석 | 워크로드별 태그, 예산, 리소스 사용 책임 |
| Governance | Allowed Regions, Quota Policies, Tags Rule 생성·attach | Rule이 아닌 일반 리소스·IAM 운영 |
| Identity / IAM | Organization 관리 권한 | Identity Domain, 사용자, 그룹, 일반 리소스 정책 |
| Network | 중앙 표준 수립 | VCN, DRG, Route Table, NSG, Security List, OS Firewall |
| Vault / Audit | 공통 통제와 검토 기준 | Child별 Key·Secret·Audit 보존과 접근 권한 |

따라서 기본 원칙은 **비용과 guardrail은 Parent에서 중앙화하고, workload 권한·identity·network는 Child에서 명시적으로 연결**하는 것입니다.

### 1. Organization 관리 권한과 역할 분리

Organization 자체를 관리하는 Parent 그룹에는 `organizations-family` 권한이 필요합니다.

```text
# Parent Tenancy: Organization, Child, Subscription, Governance 관리
Allow group org-admins to manage organizations-family in tenancy
```

이 정책은 Organization 및 Governance 작업을 위한 권한입니다. Child의 Compute, VCN, Object Storage, Vault 권한을 자동 부여하지는 않습니다.

권장하는 역할 분리는 다음과 같습니다.

```text
org-admins
  - Organization, Child 연결, Subscription Mapping, Governance Rule 담당

parent-platform-operators
  - 승인된 Child의 특정 서비스/Compartment에만 Cross-tenancy 접근

child-local-admins
  - Child의 Identity, IAM, Network, Vault 및 workload 운영 담당
```

Child 생성 시 Parent의 사용자·그룹·Identity Domain·IdP federation이 자동 복제되지 않습니다. 각 Child마다 local administrator, MFA, 필요 시 federation/provisioning을 별도로 구성해야 합니다.

### 2. Child Tenancy 생성과 연결 화면 찾기

Child 생성 전 아래 항목을 결정합니다.

| 확인 항목 | 예시 |
|---|---|
| Child 목적 | `production`, `non-production`, `sandbox`, 조직/프로젝트 분리 |
| Child 관리자 | local administrator, break-glass administrator, MFA 책임자 |
| Region | Seoul/Tokyo, DR·backup·서비스 제공 Region |
| 비용 기준 | CostCenter, Application, Environment 태그 값 |
| 중앙 접근 범위 | 대상 서비스, Compartment, 방향, 만료일, Child 승인자 |
| Subscription | default subscription 사용 여부 또는 특정 Oracle Universal Credits subscription |

#### Console 메뉴: Child Tenancy 생성

Parent Tenancy로 로그인한 후 다음 화면으로 이동합니다.

```text
Navigation menu → Governance & Administration
→ Organization Management → Tenancies
→ Create new tenancy
```

생성 마법사는 다음 순서로 진행합니다.

```text
1. Tenancy details
   - Tenancy name 및 관리자 정보를 입력

2. Subscription mapping
   - 기본 Subscription을 사용하거나
   - 표시되는 Oracle Universal Credits Subscription 중 하나를 선택

3. Governance rules
   - 적용할 Rule을 선택하거나, 나중에 attach하도록 건너뜀

4. Review summary
   - 설정을 확인한 뒤 생성
```

새 Child는 Organization의 default subscription을 사용합니다. 생성 과정에서 다른 Oracle Universal Credits subscription을 선택하면 그 subscription에 매핑됩니다. Governance Rule은 이 단계에서 선택할 수 있지만, 영향 검증이 필요한 환경이라면 Child 생성 후 Canary 대상으로 attach하는 편이 안전합니다.

#### 기존 Tenancy를 Child로 연결할 때의 주의점

기존 standalone tenancy를 초대하여 Child로 연결하는 방식과 Parent에서 새로 만든 Child는 삭제·종료 절차가 다를 수 있습니다. Tenancy 유형, 계약 및 subscription 상태를 먼저 확인하고, 생성된 Child와 초대된 Child의 종료 절차를 동일하게 가정하지 않아야 합니다.

#### Console 메뉴: Child Tenancy 삭제·종료

**Parent Tenancy의 Organization Management 화면은 Child 목록과 연결 상태를 관리하는 화면**입니다. 실제 self-service 삭제 요청은 지원 조건을 충족하는 경우 **삭제할 Child Tenancy 자체에 administrator로 로그인**하여 수행합니다.

```text
Child Tenancy로 로그인
→ Navigation menu → Governance & Administration
→ Tenancy Details
→ Request tenancy deletion
→ Child tenancy 이름을 입력하여 확인
→ Request tenancy deletion
```

삭제는 tenancy와 연결된 cloud account 및 리소스에 영향을 주는 비가역 작업입니다. OCI 공식 문서는 생성된 Child와 초대된 Child의 절차가 다를 수 있음을 안내합니다. 특히 home region, 하위 Child 존재 여부, Oracle Universal Credits subscription 및 계약 조건을 먼저 확인해야 합니다. 요청 후에는 **Tenancy Details → Work requests**에서 `Tenancy deletion requested` 작업의 진행 상태를 확인합니다.

### 3. Subscription Mapping과 비용 관리

Subscription Mapping은 Child가 어느 subscription을 소비하는지 Parent에서 관리하는 기능입니다. Parent는 Organization 전체 비용·사용량을 Cost Analysis와 Reports에서 분석할 수 있지만, 이는 Child의 리소스 데이터나 secret을 공유하는 기능이 아닙니다.

#### Console 메뉴: Subscription Mapping 목록과 기본 Subscription 변경

```text
Parent Tenancy
→ Navigation menu → Governance & Administration
→ Organization Management → Subscription Mapping
```

Subscription Mapping 목록에서 subscription 이름을 선택하면 **Mapped tenancies**에서 해당 subscription에 연결된 Child와 매핑 날짜를 확인할 수 있습니다.

여러 Oracle Universal Credits subscription이 있을 때 기본 subscription을 바꾸려면 다음을 수행합니다.

```text
Navigation menu → Governance & Administration
→ Organization Management → Subscription Mapping
→ 변경할 subscription 선택
→ Make default subscription
→ 확인
```

기본 subscription을 바꾸면 이후 초대되거나 새로 생성되는 Child는 기본적으로 새 default subscription에 매핑됩니다. 기존 Child의 매핑 변경은 Subscription Mapping 상세 화면에서 현재 매핑과 영향 범위를 먼저 확인하고 수행해야 합니다.

#### Subscription Mapping 운영 확인 항목

```text
- Child 생성 전: default subscription, rate card, 비용 담당자 확인
- 생성 중: Subscription mapping 단계에서 선택값 확인
- 생성 후: Subscription Mapping → Mapped tenancies에서 결과 확인
- 월별: Cost Analysis/Reports에서 Child별 태그와 Subscription 기준 비용 검토
```

### 4. Governance Rule 생성·적용·수정·해제

Organization Governance는 Parent에서 Rule을 만들고 Child에 attach하는 방식입니다. Rule을 attach하면 Child에 대응 리소스가 생성되고 lock됩니다. Child는 Rule 정보를 볼 수 있지만 설정을 변경할 수 없습니다.

#### Console 메뉴: Governance Rule 목록과 생성

```text
Parent Tenancy
→ Navigation menu → Governance & Administration
→ Organization Management → Governance Rules
→ Create governance rule
```

Rule 생성 화면에서 이름, Rule 유형, 대상과 설정을 선택합니다. attach 방식은 다음 두 가지입니다.

```text
Attach to specific tenancies
  - Canary/Test Child부터 제한적으로 검증할 때 사용

Attach to entire organization
  - 현재 Child와 향후 Organization Governance에 참여하는 Child에 적용
```

생성 후 Governance Rules 목록에서 Rule을 열면 대상 Child의 상태, attachment method, Work Request를 확인할 수 있습니다. Attach가 실패하면 해당 tenancy의 **Actions (⋮) → Retry attaching**을 사용하고 Work Request 오류를 먼저 확인합니다.

#### Console 메뉴: Rule 수정

```text
Navigation menu → Governance & Administration
→ Organization Management → Governance Rules
→ 수정할 Rule 선택
→ Edit rule configuration
→ 설정 변경
→ Update
```

Rule 설정 변경은 이미 적용 중인 Child의 제어에 영향을 줄 수 있습니다. 특히 Region, quota, tag namespace 충돌과 기존 리소스 영향을 검토해야 합니다.

#### Console 메뉴: Rule을 특정 Child에서 해제(detach)

```text
Navigation menu → Governance & Administration
→ Organization Management → Governance Rules
→ 대상 Rule 선택
→ Tenancies 탭 또는 섹션
→ 대상 Child 선택
→ Detach tenancies
→ Detach rule
```

Detach하면 해당 Child에서 Rule이 더 이상 적용되지 않고, 그 Rule이 Child에 생성한 관련 리소스는 삭제됩니다. 작업은 비동기로 실행되므로 Rule 상세 화면에서 **Actions (⋮) → View work requests**를 열어 완료 여부를 확인합니다. 완료 후 Rule status는 `Detached`가 됩니다.

> **중요:** 특정 Rule의 detach와 Organization Governance의 opt-out은 다릅니다. Detach는 선택한 Rule만 해제합니다. Parent가 Child를 Organization Governance에서 opt-out하면 전체 Governance 사용 상태에 영향을 주므로, 이후 Rule을 다시 attach하려면 opt-in 절차가 필요할 수 있습니다.

### 5. Allowed Regions, Quota Policies, Tag Defaults 설정

Allowed Regions, Quota Policies, Tags Rule은 모두 같은 **Governance Rules** 화면에서 Rule 유형을 선택해 만듭니다.

```text
Navigation menu → Governance & Administration
→ Organization Management → Governance Rules
→ Create governance rule
→ Rule type 선택
```

#### 5-1. Allowed Regions

**용도:** Child가 새로 구독할 수 있는 Region을 allow-list로 제한합니다.

```text
Rule name: allow-prod-regions
Allowed regions:
  - ap-seoul-1
  - ap-tokyo-1
Attach target: Production Canary Child
```

Allowed Regions Rule은 **새로운 Region 구독을 제한**합니다. 이미 구독했거나 리소스가 존재하는 Region을 자동으로 해지·삭제하는 rollback 도구는 아닙니다.

화면에서 Rule을 만든 뒤, 특정 Child에 attach하고 Child Console에서 비허용 Region 구독 시도가 차단되는지 확인합니다. detach가 완료되면 해당 제한은 해제됩니다.

#### 5-2. Quota Policies

**용도:** Child tenancy 전체에서 특정 서비스 생성 금지 또는 quota 상한을 강제합니다.

```text
# Non-production Child에서 GPU Compute 생성 금지
zero gpu-core quotas in tenancy

# Child tenancy 전체의 Compute Core 상한
set compute-core quota to 40 in tenancy

# 고비용 Autonomous Database 생성 제한 예시
zero autonomous-database quotas in tenancy
```

Quota statement 문법이 잘못되어도 Rule 생성은 될 수 있지만 attach 단계에서 실패할 수 있습니다. 생성 후 반드시 Child별 Work Request 오류와 실제 리소스 생성 결과를 확인합니다.

같은 Child에 같은 목적의 Quota Rule을 여러 개 겹쳐 적용하면 더 엄격한 결과가 의도치 않게 적용될 수 있습니다. 서비스·목적당 authoritative Rule 하나를 정하고 Rule name, owner, 변경 기록을 관리하는 것이 좋습니다.

#### 5-3. Tags Rule과 Tag Defaults

**용도:** Parent root compartment의 Tag Namespace를 Child에 clone하고 Default Tag를 적용하여 비용 귀속과 인벤토리 기준을 표준화합니다.

```text
Rule name: required-finops-tags
Tag namespace: Operations

Default tags:
  Operations.CostCenter = "CC-4100"
  Operations.Application = user-applied value
  Operations.Environment = "prod"
```

고정 default value는 지정값으로 적용하고, `user-applied value`는 리소스 생성자가 값을 입력하도록 합니다. Child에 같은 이름의 Tag Namespace가 이미 있으면 attach가 실패할 수 있습니다. 또한 Parent의 Tag Namespace를 변경한 뒤 Governance Rule을 update하지 않으면 Child에 자동 반영되지 않습니다.

Tag는 비용 분석뿐 아니라 access control에도 사용될 수 있습니다. Tag namespace 관리자와 tag 적용 권한을 분리하여, tag 적용이 의도치 않게 access를 확장하지 않도록 설계합니다.

### 6. Parent 관리자가 Child 리소스에 접근해야 할 때

Parent administrator는 Organization membership만으로 Child Console에 로그인하거나 Child administrator가 되지 않습니다. Parent의 기존 사용자 또는 그룹이 Child 리소스에 접근해야 한다면 **양쪽 Tenancy가 모두 동의하는 Cross-tenancy IAM 정책**이 필요합니다.

* **Parent**: 어떤 Parent 그룹이 어느 Child에 어떤 권한을 요청하는지 `Endorse`
* **Child**: 어떤 Parent 그룹을 어느 Compartment에 허용할지 `Admit`

다음 예시는 Parent의 `Parent-Platform-Operators` 그룹이 Child의 `Shared-Operations` Compartment에서 Object Storage만 관리하도록 제한한 형태입니다. 실제 OCID와 Identity Domain 이름으로 교체해야 합니다.

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

핵심은 다음과 같습니다.

1. 한쪽 정책만으로는 접근 권한이 생기지 않습니다.
2. `manage all-resources in tenancy`와 `any-tenancy` 대신 서비스·Compartment·방향을 제한합니다.
3. Parent 사용자는 Parent 자격 증명으로 API/CLI를 호출합니다. Child에 사용자를 복제하는 방식이 아닙니다.
4. 서비스별 Cross-tenancy 요구사항과 양쪽 Region 구독 여부를 함께 확인합니다.
5. Child → Parent, Child A → Child B 접근도 각 방향에 맞는 `Endorse`/`Admit` 정책 쌍을 별도로 구성합니다.

#### Console 메뉴: Cross-tenancy IAM 정책 작성 위치

Cross-tenancy 정책은 Governance Rules 화면이 아니라 **각 Tenancy의 IAM Policy 화면**에서 작성합니다.

```text
Parent Tenancy
→ Navigation menu → Identity & Security
→ Domains → <Identity Domain> → Groups   # 그룹 확인
→ Identity & Security → Policies         # Endorse 정책 생성

Child Tenancy
→ Navigation menu → Identity & Security
→ Policies                               # Define + Admit 정책 생성
```

Console 메뉴 명칭은 Identity Domain 구성에 따라 일부 다르게 표시될 수 있습니다. 정책은 source Parent와 destination Child에 각각 만들어야 합니다.

### 7. IAM, 네트워크, Vault, Audit의 독립 경계

Cross-tenancy IAM을 만들었다고 VCN 통신이 자동으로 열리지는 않습니다. 반대로 VCN Peering 또는 DRG 연결만 만들었다고 리소스 API 접근 권한이 생기지도 않습니다.

```text
[Identity / API 접근]
- Parent Endorse 정책
- Child Admit 정책
- 서비스별 IAM 정책과 Compartment 범위

[Network 통신]
- VCN Peering 또는 DRG
- 양쪽 Route Table
- NSG 또는 Security List
- Instance OS Firewall
```

VCN peering을 구성한 뒤에도 양쪽 route table, NSG/security list, OS firewall을 모두 확인해야 합니다. Peering 자체를 끊지 않고 route 또는 security rule을 제거하여 traffic을 차단할 수도 있습니다.

Object Storage 공유는 tenancy 전체가 아니라 전용 `Shared-Operations` Compartment와 전용 bucket으로 범위를 줄입니다. Vault는 Child별 Vault/Key를 유지하고, Key 관리 권한과 workload 권한을 분리합니다. Audit도 각 tenancy의 IAM 경계에서 관리되므로 Parent의 Organization 변경과 각 Child의 IAM·network·Vault·Object 작업을 별도 검토·보존해야 합니다.

### 8. Parent Admin 침해 시 영향 범위와 방어

Parent의 `organizations-family` 관리자가 탈취되면 Subscription Mapping, invitation/link, Organization 비용 가시성, Governance Rule attach/detach/opt-out까지 영향이 확장될 수 있습니다. 그러나 membership만으로 Child workload 리소스 권한이 자동으로 생기지는 않습니다.

| 방어 통제 | 실행 기준 |
|---|---|
| 관리자 분리 | `org-admins`와 `parent-platform-operators`를 분리하고 공용 계정을 사용하지 않음 |
| MFA / sign-on | Parent와 모든 Child privileged user에 MFA·restrictive sign-on policy 적용 |
| Break-glass | Child별 별도 비상 관리자, 2인 승인, 사용 후 credential rotation |
| 최소 권한 | `manage all-resources`, `any-tenancy`, tenancy 전체 Admit 대신 서비스·Compartment·방향 단위 정책 |
| 변경 통제 | Rule 생성·edit·detach·opt-out 시 Work Request, peer review, change record 확인 |
| 탐지 | Parent/Child Audit에서 policy, user/group, key, network, Object Storage 변경을 검토 |
| 정기 검토 | Cross-tenancy `Define`/`Endorse`/`Admit`, Parent admin group, Child local admin, API key/token을 owner·만료일 기준으로 검토 |

OCI는 default domain administrator를 일상 업무에 사용하지 않고 super administrator membership을 주기적으로 확인하도록 권고합니다. 이 통제는 Parent와 모든 Child에 각각 적용해야 합니다.

### 마무리

OCI Organization Management는 여러 Tenancy의 비용·Subscription·거버넌스를 중앙화하는 데 효과적입니다. 하지만 Child는 독립 보안 경계이므로 Parent의 Organization 관리 권한을 workload 관리자 권한으로 확대 해석해서는 안 됩니다.

핵심은 다음 세 가지입니다.

1. **Governance Rule은 specific Child에서 먼저 검증하고 Work Request로 결과를 확인합니다.**
2. **Parent → Child 접근은 Cross-tenancy IAM의 Endorse와 Admit를 모두 구성합니다.**
3. **Subscription, IAM, Network, Vault, Audit 경계를 Child별로 분리하고 최소 권한을 유지합니다.**

### 참고

* [OCI Organization Management Overview](https://docs.oracle.com/en-us/iaas/Content/General/organization/organization_management_overview.htm){:target="_blank" rel="noopener"}
* [Creating and Attaching Governance Rules](https://docs.oracle.com/en-us/iaas/Content/General/organization/add-governance-createattachrule.htm){:target="_blank" rel="noopener"}
* [Updating a Governance Rule](https://docs.oracle.com/en-us/iaas/Content/General/organization/add-governance-editrule.htm){:target="_blank" rel="noopener"}
* [Detaching a Governance Rule](https://docs.oracle.com/en-us/iaas/Content/General/organization/add-governance-detachrule.htm){:target="_blank" rel="noopener"}
* [Planning an Organization](https://docs.oracle.com/en-us/iaas/Content/General/organization/organization_planning.htm){:target="_blank" rel="noopener"}
* [Creating a Child Tenancy](https://docs.oracle.com/en-us/iaas/Content/General/organization/child-tenancy-create.htm){:target="_blank" rel="noopener"}
* [Deleting a Tenancy](https://docs.oracle.com/en-us/iaas/Content/General/Tasks/deleting_tenancy.htm){:target="_blank" rel="noopener"}
* [Listing Subscription Mappings](https://docs.oracle.com/en-us/iaas/Content/General/organization/subscription-mapping-list.htm){:target="_blank" rel="noopener"}
* [Setting the Default Subscription](https://docs.oracle.com/en-us/iaas/Content/General/organization/subscription-setdefault.htm){:target="_blank" rel="noopener"}
* [Cross-Tenancy Access Policies](https://docs.oracle.com/en-us/iaas/Content/Identity/policieshow/iam-cross-domain.htm){:target="_blank" rel="noopener"}
* [Accessing Object Storage Resources Across Tenancies](https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/accessingresourcesacrosstenancies.htm){:target="_blank" rel="noopener"}
* [OCI VCN Peering](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/VCNpeering.htm){:target="_blank" rel="noopener"}
