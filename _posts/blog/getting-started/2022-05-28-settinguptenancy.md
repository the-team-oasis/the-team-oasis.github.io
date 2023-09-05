---
layout: page-fullwidth
#
# Content
#
subheadline: "CONCEPTS"
title: "OCI 모범사례를 통해 테넌시 설정 알아보기"
teaser: "OCI 테넌시 기본 설정을 위한 계획 수립 방법, 계획을 수립하기 위해 알아야 할 기본 개념에 대해 알아봅니다."
author: yhcho
date: 2022-05-28 00:00:00
breadcrumb: true
categories:
- getting-started
tags:
- [oci, tenancy, best practices, setting, compartment, policy, sandbox, 테넌시, 기본설정, 설정, 계정설정, 구획]
#published: false

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

# -------------- 내용 필독 -------------------
# 작성할 내용은 아래부터 작성
# 작성 방법
# 각 챕터별 제목은 "###"로 시작한다.
# 하위 제목은 "####"로 시작한다.
# 이미지는 images 폴더안에 Category(getting-started, infrastructure, platform, database, aiml)에 넣고 사용 시 "../../images/카테고리명/이미지" 형태로 참조한다.
# Bold는 **글자**
# Bold + Italic은 ***글자***
# ------------------------------------------
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>


### OCI 테넌시 설정을 위한 모범사례 알아보기
Oracle Cloud Infrastructure 에서 테넌시를 생성한 후 관리자는 몇 가지 설정 작업을 진행하여 클라우드 리소스 및 사용자에 대한 계획을 수립해야 합니다.
이번 포스팅에서는 테넌시 Best Practices 사례를 통해 기본 설정을 위한 내용을 다뤄볼 예정입니다.

### 클라우드 사용 계획 수립하기
클라우드 계정에 사용자 또는 리소스를 추가하기 전에 테넌시 사용에 대한 계획을 만들어야 합니다.
클라우드 사용 계획 수립을 위해서는 먼저 OCI의 IAM 서비스의 구성요소에 대한 이해가 필요합니다. [OCI Identity and Access Management 둘러보기](https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/overview.htm){:target="_blank" rel="noopener"}

클라우드 사용 계획에는 리소스를 구성하기 위한 구획(Compartment) 계층 구조와 각 구획의 리소스에 엑세스해야 하는 사용자 그룹에 대한 정의가 포함됩니다. 
또한 이 2가지 개념은 엑세스(Access)를 관리하는 정책(Policy)을 작성하는 방법에 영향이 있기 때문에 사전에 함께 고려해야 합니다.

#### 1. 구획(Compartment)에 대한 이해
구획(Compartment)은 클라우드 리소스를 구성하는 데 사용하는 기본 빌딩 블록입니다. 구획을 사용하여 리소스를 구성하고 격리하여 보다 쉽게 관리하고 리소스에 대한 액세스를 보호할 수 있습니다.

테넌시가 프로비저닝되면 루트 구획이 생성됩니다(루트 구획은 테넌시와 같은 개념 입니다). 파일 시스템의 루트 폴더와 같이 클라우드 계정의 모든 구획의 리소스는 루트 구획 하위에 위치한다고 이해하면 좋습니다.
콘솔 에 처음 로그인 하고 서비스를 선택하면 하나의 루트 구획이 표시됩니다. (자동으로 선택되지 않는 경우 아래 사진과 같이 좌측 하단의 Compartment 에서 선택할 수 있습니다.)
![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2022/set-tenancy/account-provisioned-ko.png)

루트 구획 아래에 하위 구획을 생성하여 리소스 관리 계획에 맞는 방식으로 클라우드 리소스를 구성할 수 있습니다. 
또한 구획을 생성할 때 사용자 그룹이 해당 구획의 리소스에 대해 수행할 수 있는 작업을 지정하는 정책을 생성하여 구획에 대한 액세스를 제어할 수 있습니다.

구획을 작성할 때 아래 사항에 유의하여 작성해야 합니다.
- 리소스(예: 인스턴스, 블록 스토리지 볼륨, VCN, 서브넷)를 생성할 때 배치할 구획을 결정해야 합니다.
- 구획은 물리적 구획이 아니라 논리적 구획이므로 관련 리소스 구성 요소를 다른 구획에 배치할 수 있습니다. 예를 들어 인터넷 게이트웨이에 대한 액세스 권한이 있는 클라우드 네트워크 서브넷은 동일한 클라우드 네트워크의 다른 서브넷과 별도 구획에서 보호할 수 있습니다.
- 테넌시(루트 구획) 아래에 <mark>최대 6개의 구획까지</mark> 구획 계층 구조를 생성할 수 있습니다.
- 사용자 그룹에게 리소스에 대한 액세스 권한을 부여하는 정책 규칙을 작성할 때 항상 액세스 규칙을 적용할 구획을 지정합니다. 따라서 구획 간에 리소스를 배포하도록 선택한 경우 해당 리소스에 액세스해야 하는 사용자의 각 구획에 대해 적절한 권한을 제공해야 합니다.
- 콘솔 에서 구획은 리소스를 보기 위한 필터처럼 작동합니다. 구획을 선택하면 선택한 구획에 있는 리소스만 표시됩니다. 다른 구획의 리소스를 보려면 먼저 해당 구획을 선택해야 합니다. 검색 기능을 사용하여 여러 구획에서 리소스 목록을 가져올 수 있습니다. 검색 개요 를 참조하십시오 .
- 테넌시 탐색기를 사용하여 특정 구획에 있는 모든 리소스(지역 간)의 전체 보기를 얻을 수 있습니다. 아래 사진의 예시를 참고하세요. <br>(메뉴 위치: **거버넌스 & 관리(Governance * Administration) > 테넌시 관리(Tenancy Management) > 테넌시 탐색기(Tenancy Explorer)** )
  ![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2022/set-tenancy/compartmentexplorer.png)
- 구획을 삭제하려면 먼저 구획의 모든 리소스를 삭제해야 합니다.
- 마지막으로 구획을 계획할 때 사용량 및 감사 데이터를 집계하는 방법을 고려해야 합니다.

#### 2. 누가 어떤 리소스에 엑세스해야 하는지 고려하기
테넌시 설정을 계획할 때 또 다른 주요 고려 사항은 누가 어떤 리소스에 액세스해야 하는지입니다. 
서로 다른 사용자 그룹이 리소스에 액세스해야 하는 방법을 정의하면 리소스를 가장 효율적으로 구성하는 방법을 계획하는 데 도움이 되며 액세스 정책을 더 쉽게 작성하고 유지 관리할 수 있습니다.

예를 들어 다음과 같은 요구 사항이 있는 사용자 그룹 또는 사용자가 있을 수 있습니다.
- OCI 콘솔을 보지만 리소스를 편집하거나 생성할 수 없습니다.
- 여러 구획에서 특정 리소스 생성 및 업데이트(예: 클라우드 네트워크 및 서브넷을 관리해야 하는 네트워크 관리자)해야 합니다.
- 인스턴스 및 블록 볼륨을 생성 및 관리하지만 클라우드 네트워크에 액세스할 수 없습니다.
- 모든 리소스에 대한 전체 권한이 있지만 특정 구획에서만 가능합니다.
- 다른 사용자의 권한 및 자격 증명 관리합니다.

관련하여 몇 가지 샘플 정책은 [공통 정책](https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/commonpolicies.htm#top){:target="_blank" rel="noopener"} 을 참고하여 작성할 수 있습니다.

### 테넌시 설정을 위한 접근 방식 예시

#### 1. 모든 리소스를 루트 구획(테넌시)에 생성한다.
조직이 작거나 아직 Oracle Cloud Infrastructure를 평가하는 개념 증명 단계에 있는 경우 모든 리소스를 루트 구획(테넌시)에 배치하는 것을 고려할 수 있습니다. 이 접근 방식을 사용하면 모든 리소스를 쉽고 빠르게 보고 관리할 수 있습니다. 
여전히 정책을 작성하고 그룹을 생성하여 액세스가 필요한 사용자에게만 특정 리소스에 대한 권한을 제한할 수 있습니다.

단일 구획 접근 방식을 위한 설정 작업 예시
1. Sandbox 구획을 만듭니다. 계획은 루트 구획에서 리소스를 유지 관리하는 것이지만 Oracle 공식 문서에서는 Sandbox 구획을 설정하여 사용자에게 기능을 시험해 볼 수 있는 전용 공간을 제공할 수 있도록 샌드박스 구획을 설정할 것을 권장합니. 이러한 구성을 통해 Sandbox 샌드박스 구획에서 테넌시(루트) 구획의 리소스에 대해 더 엄격한 권한을 유지하면서 사용자에게 리소스를 만들고 관리할 수 있는 권한을 부여할 수 있습니다. [샌드박스 구획 만들기](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/addingusers.htm#Create) 를 참조하십시오.
2. 그룹 및 정책을 작성합니다. [그룹 생성하기](/getting-started/adding-users/#idcs에서-그룹-생성){:target="_blank" rel="noopener"} 내용을 참고 하세요.
3. 사용자를 생성하고 사용자를 그룹에 추가 합니다. [사용자 생성하기](/getting-started/adding-users/#idcs에-사용자-추가){:target="_blank" rel="noopener"} 내용을 참고 하세요.

#### 2. 회사 프로젝트에 맞게 구획을 생성한다.
회사에 별도로 관리하려는 여러 부서가 있거나 회사에 개별적으로 관리하기 쉬운 여러 개별 프로젝트가 있는 경우 이 접근 방식을 고려하십시오.

이 접근 방식에서는 해당 프로젝트에 대한 액세스 정책을 설정할 수 있는 각 구획(프로젝트)에 대한 전용 관리자 그룹을 추가할 수 있습니다. (사용자 및 그룹은 여전히 테넌시 수준에서 추가되어야 합니다.) 
루트 구획 또는 다른 프로젝트에 대한 관리자 권한을 허용하지 않으면서 한 그룹에 모든 리소스에 대한 제어 권한을 부여할 수 있습니다. 
이러한 방식으로 회사의 여러 그룹이 자체 리소스에 대한 자체 "하위 클라우드"를 설정하고 독립적으로 관리할 수 있습니다.

다중 구획 접근 방식을 위한 설정 작업 예시
1. Sandbox 구획을 만듭니다. Oracle 공식 문서에서는 Sandbox 구획을 설정하여 사용자에게 기능을 시험해 볼 수 있는 전용 공간을 제공할 것을 권장합니다. 이러한 구성을 통해 Sandbox 구획에서 테넌시(루트) 구획의 리소스에 대해 더 엄격한 권한을 유지하면서 사용자에게 리소스를 만들고 관리할 수 있는 권한을 부여할 수 있습니다.
2. 각 프로젝트(예: ProjectA, ProjectB)에 대한 구획을 만듭니다.
3. 각 프로젝트에 대한 관리자 그룹(예: ProjectA_Admins)을 만듭니다.
4. 각 관리자 그룹에 대한 정책을 만듭니다.
  ```text
  Allow group ProjectA_Admins to manage all-resources in compartment ProjectA
  ```
5. 사용자를 생성하고 사용자를 그룹에 추가 합니다. [사용자 생성하기](/getting-started/adding-users/#idcs에-사용자-추가){:target="_blank" rel="noopener"} 내용을 참고 하세요.
6. ProjectA 및 ProjectB의 관리자가 리소스를 관리하기 위해 지정된 구획 내에 하위 구획을 만들도록 합니다.
7. ProjectA 및 ProjectB의 관리자가 해당 구획에 대한 액세스를 관리하는 정책을 생성하도록 합니다.

#### 3. 다중 구획 접근 방식 시나리오 예시
이 시나리오의 목표는 다양한 IAM 구성 요소가 함께 작동하는 방식과 정책의 기본 기능을 확인하는 것입니다.

시나리오 배경
- 이 시나리오에서 Acme Company에는 Oracle Cloud Infrastructure 리소스를 사용할 두 팀 (Project A와 Project B)이 있습니다. 실제로 회사에는 더 많은 팀이 있을 수 있습니다.
- Acme Company는 두 팀 모두에 단일 가상 클라우드 네트워크(VCN)를 사용할 계획이며 네트워크 관리자가 VCN을 관리하기를 원합니다.
- Acme Company는 또한 Project A 팀과 Project B 팀이 각각 고유한 인스턴스 세트와 블록 스토리지 볼륨을 갖기를 원합니다.
- Project A 팀과 Project B 팀은 서로의 인스턴스를 사용할 수 없어야 합니다. 또한 이 두 팀은 네트워크 관리자가 설정한 VCN에 대해 아무 것도 변경할 수 없어야 합니다. 
- Acme Company는 각 팀에 해당 팀의 리소스에 대한 관리자가 있기를 원합니다. 
- Project A 팀의 관리자는 Project A 클라우드 리소스를 사용할 수 있는 사람과 방법을 결정할 수 있습니다. 프로젝트 B 팀도 마찬가지입니다.

##### 1) OCI 처음 사용을 위한 설정 (클라우드 계정 생성)
Acme Company는 Oracle Cloud Infrastructure를 사용하기 위해 등록 하고 Wenpei라는 직원이 기본 관리자가 될 것임을 Oracle에 알립니다(계정 등록). 이에 대한 응답으로 Oracle에서는 테넌시 설정하는 단계에서 다음과 같은 절차를 자동으로 진행합니다.**(이 단계에서 계정 등록 외에 별도로 사용자가 수행하는 작업은 없습니다.)**

- Acme Company에 대한 테넌시를 생성합니다(다음 다이어그램 참조).
- 테넌시의 Wenpei에 대한 사용자 계정을 생성합니다.
- 테넌시에 관리자 그룹을 생성하고 해당 그룹에 Wenpei를 배치합니다.
- 관리자 그룹에 테넌시의 모든 리소스를 관리할 수 있는 액세스 권한을 부여하는 Acme Company의 테넌시에 정책을 생성합니다. 그 정책은 다음과 같습니다.
  ```text
  Allow group Administrators to manage all-resources in tenancy
  ```
![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2022/set-tenancy/identity_scenario_step1.jpg " ")

##### 2) 기본 관리자가 일부 그룹과 다른 관리자를 생성합니다.
기본 관리자로 지정된 사용자 Wenpei는 다음으로 여러 그룹과 사용자를 생성합니다(다음 다이어그램 참조).

- NetworkAdmins , A-Admins 및 B-Admins 라는 그룹을 생성합니다 (마지막 두 개는 회사 내 프로젝트 A 및 프로젝트 B용임).
- Alex라는 사용자를 생성하고 그를 Administrators 그룹에 넣습니다.
- 새 그룹을 비워 둡니다.

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2022/set-tenancy/identity_scenario_step2.jpg " ")

##### 3) 기본 관리자가 일부 구획 및 정책 생성 합니다.

다음으로 Wenpei는 구획을 생성하여 리소스를 함께 그룹화합니다(다음 다이어그램 참조).
- Acme Company의 VCN, 서브넷, Site-to-Site VPN 및 네트워킹 의 기타 구성 요소에 대한 액세스를 제어하기 위해 Networks 라는 구획을 생성합니다 .
- Project-A 라는 구획을 생성하여 Project A 팀의 클라우드 리소스를 구성하고 이에 대한 액세스를 제어합니다.
- Project-B 라는 구획을 생성하여 Project B 팀의 클라우드 리소스를 구성하고 이에 대한 액세스를 제어합니다.
  
그런 다음 Wenpei는 각 구획의 관리자에게 필요한 액세스 수준을 부여하는 정책을 만들고 정책을 테넌시에 연결합니다. 
테넌시의 정책은 관리할 수 있는 액세스 권한이 있는 사용자만 업데이트하거나 삭제할 수 있습니다. 이 시나리오에서는 <mark>관리자 그룹</mark>만 해당됩니다.

**정책 관련 요구 사항**

- Networks 구획에서 NetworkAdmins 그룹에 네트워크 및 인스턴스를 관리할 수 있는 액세스 권한을 부여합니다(네트워크를 쉽게 테스트하기 위해).
- A-Admins 및 B-Admins 그룹 모두에 네트워크 구획의 네트워크를 사용할 수 있는 액세스 권한을 부여합니다(그래서 네트워크에 인스턴스를 생성할 수 있음).
- A-Admins 그룹에 Project-A 구획의 모든 리소스를 관리할 수 있는 액세스 권한을 부여합니다.
- B-Admins 그룹에 프로젝트-B 구획의 모든 리소스를 관리할 수 있는 액세스 권한을 부여합니다.

**정책 예시**

```text
Allow group NetworkAdmins to manage virtual-network-family in compartment Networks
Allow group NetworkAdmins to manage instance-family in compartment Networks

Allow group A-Admins,B-Admins to use virtual-network-family in compartment Networks

Allow group A-Admins to manage all-resources in compartment Project-A

Allow group B-Admins to manage all-resources in compartment Project-B
```

> A-Admins 및 B-Admins는 Networks 구획에서 virtual-network-family를 사용할 수 있습니다. 그러나 해당 구획에서 인스턴스를 생성할 수 없습니다. Project-A 또는 Project-B 구획에서만 인스턴스를 생성할 수 있습니다. 구획은 물리적 그룹이 아닌 논리적 그룹이므로 동일한 VCN을 구성하거나 상주하는 리소스가 다른 구획에 속할 수 있습니다.

**정책 관련 요구 사항**

Acme Company는 Project-A 및 Project-B 구획의 관리자가 해당 구획의 리소스를 사용할 수 있는 사용자를 결정하도록 하려고 합니다. 
따라서 Wenpei는 A-Users와 B-Users라는 두 개의 그룹을 더 만듭니다. 
그런 다음 구획 관리자에게 해당 그룹에서 사용자를 추가 및 제거하는 데 필요한 필수 액세스 권한을 부여하는 6개의 명령문을 추가합니다.


**정책 예시**
```text
Allow group A-Admins to use users in tenancy where target.group.name='A-Users'
Allow group A-Admins to use groups in tenancy where target.group.name='A-Users'

Allow group B-Admins to use users in tenancy where target.group.name='B-Users'
Allow group B-Admins to use groups in tenancy where target.group.name='B-Users'

Allow group A-Admins,B-Admins to inspect users in tenancy
Allow group A-Admins,B-Admins to inspect groups in tenancy
```

위 정책은 프로젝트 관리자가 새 사용자를 만들 거나 사용자의 자격 증명을 관리하도록 허용하지 않습니다. 다만, 각 프로젝트 관리자는 A-Users 및 B-Users 그룹에 속할 수 있는 기존 사용자를 결정할 수 있습니다. 
마지막 두 문은 A-Admins 및 B-Admins가 모든 사용자 및 그룹을 나열하고 어떤 사용자가 어떤 그룹에 있는지 확인하는 데 필요합니다.

**다이어 그램**

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2022/set-tenancy/identity_scenario_step3.jpg " ")

**다이어 그램에 적용된 모든 정책**
```text
Allow group Administrators to manage all-resources in tenancy

Allow group NetworkAdmins to manage virtual-network-family in compartment Networks
Allow group NetworkAdmins to manage instance-family in compartment Networks

Allow group A-Admins, B-Admins to use virtual-network-family in compartment Networks
Allow group A-Admins to manage all-resources in compartment Project-A
Allow group B-Admins to manage all-resources in compartment Project-B

Allow group A-Admins to use users in tenancy where target.group.name=’A-Users’
Allow group A-Admins to use groups in tenancy where target.group.name=’A-Users’

Allow group B-Admins to use users in tenancy where target.group.name=’B-Users’
Allow group B-Admins to use groups in tenancy where target.group.name=’B-Users’

Allow group A-Admins, B-Admins to inspect users in tenancy
Allow group A-Admins, B-Admins to inspect groups in tenancy
```

##### 4) 관리자가 새 사용자를 만듭니다.
이 시점에서 Alex는 관리자 그룹에 속해 있으며 이제 새 사용자를 만들 수 있는 액세스 권한이 있습니다. 
따라서 그는 Leslie, Jorge 및 Cheri라는 이름의 사용자를 생성하고 이들을 각각 NetworkAdmins, A-Admins 및 B-Admins 그룹에 배치합니다. 
또한 Alex는 결국 프로젝트 A 및 프로젝트 B의 관리자에 의해 A-Users 및 B-Users 그룹에 추가될 다른 사용자를 생성합니다.

**다이어 그램**

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2022/set-tenancy/identity_scenario_step4.jpg " ")

**다이어 그램 적용된 모든 정책**

```text
  Allow group Administrators to manage all-resources in tenancy
  Allow group NetworkAdmins to manage virtual-network-family in compartment Networks
  Allow group NetworkAdmins to manage instance-family in compartment Networks
  
  Allow group A-Admins, B-Admins to use virtual-network-family in compartment Networks
  Allow group A-Admins to manage all-resources in compartment Project-A
  Allow group B-Admins to manage all-resources in compartment Project-B
  
  Allow group A-Admins to use users in tenancy where target.group.name=’A-Users’
  Allow group A-Admins to use groups in tenancy where target.group.name=’A-Users’
  Allow group B-Admins to use users in tenancy where target.group.name=’B-Users’
  Allow group B-Admins to use groups in tenancy where target.group.name=’B-Users’
  
  Allow group A-Admins, B-Admins to inspect users in tenancy
  Allow group A-Admins, B-Admins to inspect groups in tenancy
  ```

### 마무리하며...
이번 포스팅에서는 OCI의 테넌시 설정시 참고하실 수 있도록 모범사례를 통해 각 요구사항에 맞는 테넌시를 설정하는 방법에대해 알아보았습니다.
테넌시 설정을 고려하고 계시는 사용자에게 도움이 되셨으면 좋겠습니다.

### 참고 자료
- [Learn Best Practices for Setting Up Your Tenancy](https://docs.oracle.com/en-us/iaas/Content/GSG/Concepts/settinguptenancy.htm){:target="_blank" rel="noopener"}
- [Overview of Identity and Access Management](https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/overview.htm){:target="_blank" rel="noopener"}
- [Adding Users](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/addingusers.htm){:target="_blank" rel="noopener"}