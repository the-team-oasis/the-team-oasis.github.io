---
layout: page-fullwidth
#
# Content
#
subheadline: "Identity & Security"
title: "OCI Identity Domain 에서 사용자, 그룹, 정책 관리하기"
teaser: "Oracle Cloud Infrastructure (OCI)에서의 사용자, 그룹, 정책을 생성하고 관리하는 방법에 대해서 알아봅니다."
author: yhcho
date: 2023-07-28 00:00:00
breadcrumb: true
categories:
  - getting-started
tags:
  - [oci, users, group, policy, domain, identity domain]
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

### OCI Identity Domain 과 IAM Policy 관련 포스팅
OCI Identity Domain에 대한 자세한 내용과 Identity Domain이 적용되기 전 IDCS 및 IAM 환경에서의 사용자, 그룹, 정책 관리에 대한 내용은 각각 아래 포스팅을 참고하여 확인이 가능합니다.
- [OCI에서 사용자, 그룹, 정책 관리하기](/getting-started/adding-users/){:target="_blank" rel="noopener"}
- [OCI IAM Identity Domain 에 대해 알아보기](/getting-started/oci-iam-identity-domain/){:target="_blank" rel="noopener"}

### OCI Identity Domain 환경 에서의 사용자(Users), 그룹(Groups), 정책(Policies)
OCI 관리자(처음 OCI 계정을 생성할 때 등록한 사용자)는 기본적으로 OCI Administrator 그룹에 속하며, 이 권한을 사용하여 추가로 OCI 사용자를 추가할 수 있습니다. 추가된 사용자는 별도 정의된 그룹의 구성원이 될 수 있으며, 해당 그룹에 대한 권한은 정책을 통해서 정의됩니다. 정책에서는 그룹의 구성원이 수행할 수 있는 작업의 범위와 어떤 구획에서 권한을 수행할 수 있는지를 정의할 수 있습니다. 이렇게 정의하면 사용자는 자신이 속한 그룹에 설정된 정책을 기반으로 작업을 수행할 수 있게됩니다.

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2022/iam-model-png.png " ")


### OCI IAM Identity Domain 에서 달라진점
OCI Native로 제공하던 IAM 서비스와 Oracle에서 PaaS 형태로 제공하던 IDCS의 기능을 통합하여 OCI Native한 새로운 IDaaS 서비스를 제공하게 되었습니다.
이로인해 기존의 OCI의 서비스 뿐만아니라 Oralce Cloud Application도 하나의 인증시스템에서 관리할 수 있게 되었습니다.

#### 기능비교
<table class="table vl-table-bordered vl-table-divider-col" summary="OCI IAM 변경사항 설명"><caption></caption><colgroup><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1" style="width:25%;">Before</th>
      <th class="entry" id="About__entry__2" style="width:25%;">After</th>
      <th class="entry" id="About__entry__3" style="width:50%;">Description</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__1">OCI IAM - <b>Local Account</b></td>
      <td class="entry" headers="About__entry__2">OCI IAM Identity Domains - <b>Default Domain</b></td>
      <td class="entry" headers="About__entry__3">기존 OCI IAM의 Local Account는 신규 OCI IAM에서 Default Doamin으로 변경되었습니다.</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1">OCI IAM - <b>External IdP</b></td>
      <td class="entry" headers="About__entry__2">OCI IAM Identity Domains - <b>External IdP</b></td>
      <td class="entry" headers="About__entry__3">기능 변경사항 없음</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1">OCI IAM - <b>IDCS Federation</b></td>
      <td class="entry" headers="About__entry__2">OCI IAM Identity Domains - <b>IDCS-Foundation</b></td>
      <td class="entry" headers="About__entry__3">기존 OCI IAM에서 IDCS 시스템과 통합하기 위한 기능인 IDCS Federation 기능이 신규 OCI IAM에서 IDCS-Foundation Type의 도메인으로 변경되었습니다.</td>
      </tr>
      </tbody>
</table>

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2022/oci-identity-domain-changes.png " ")

#### OCI Console 달라진점
새로운 기능이 추가되면서 사용자 메뉴 구성이 아래와 같이 변경 되었습니다.
![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2022/oci-iam-console-changes-1.png " ")

### 실습: Identity Domain (Default) 사용자에게 특정 구획(Compartment)에 접근할 수 있는 권한 추가
기본 도메인 (Default) 사용자에게 필요한 액세스 권한을 설정하는 방법을 이해하는데 도움이 되도록, 다음과 같은 시나리오로 구성해보도록 하겠습니다.
1. 사용자와 그룹은 기본 Domain (Deafult)에서 생성하고 관리합니다.
2. 기본 도메인 (Default)에 생성한 사용자에게 동일한 도메인에서 생성한 **SandboxGroup** 을 할당합니다.
3. OCI 정책을 생성하여 **SandboxGroup** 그룹에 특정 구획(Compartment)에만 접근할 수 있는 정책을 부여합니다.

#### 1. 구획 (Compartment) 생성
우선 OCI에 **Sandbox**라는 구획을 생성하고, 사용자에게 이 구획에만 접근 가능하도록 구성해보겠습니다. 우선 위에서 **Sandbox**라는 구획을 생성합니다. 메뉴에서 **ID & 보안 (Identity & Security) > 구획(Compartments)**를 선택합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-1.png " ")

**구획 생성** 버튼을 클릭하고, 입력창에 다음과 같이 입력합니다.
* 구획명: Sandbox
* 설명: Sandbox 사용자를 위한 구획

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-2.png " ")

#### 2. 기본 도메인 (Default Domain)에 사용자 추가
두 번째로 기본 도메인에 사용자를 추가합니다. 메뉴에서 **ID & 보안 (Identity & Security) > 도메인(Domain)**을 선택합니다. 

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-3.png " ")

이동한 화면에서 기본 도메인 (Default Domain)을 선택합니다. 만약 Default 도메인이 보이지 않은 경우 왼쪽 하단에서 루트 구획을 선택합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-4.png " ")

이동한 도메인 화면에서 **사용자** > **사용자 생성**를 클릭하여 사용자를 생성합니다.
![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-5.png " ")

**사용자 생성 대화상자**에서 다음을 입력합니다.  

* 이름: 사용자의 이름을 입력합니다.
* 성: 사용자의 성을 입력합니다.
* 사용자 이름/전자메일 : 사용자의 고유한 이름 또는 이메일 주소를 입력합니다. 테넌시내에서 고유한 값이어야 하며, 로그인 시 사용됩니다.
* 그룹: (선택) 아직 그룹이 생성되어 있지 않기 때문에 그룹은 선택하지 않습니다. _**(관리자로 추가할 경우 Administrators와 같은 그룹을 선택합니다.)**_

> 추가된 사용자는 패스워드 재설정을 위한 이메일을 전달받게 됩니다. 이메일 본문에 있는 링크를 클릭하여 패스워드를 재설정할 수 있습니다.

#### 3. 기본 도메인 (Default Domain) 에서 그룹 생성
세 번째로 기본 도메인에 그룹을 추가합니다. 메뉴에서 **ID & 보안 (Identity & Security) > 도메인(Domain)**을 선택합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-3.png " ")

이동한 화면에서 기본 도메인 (Default Domain)을 선택합니다. 만약 Default 도메인이 보이지 않은 경우 왼쪽 하단에서 루트 구획을 선택합니다. 

**그룹 생성**을 클릭하고, 다음과 같이 입력한 후 생성을 클릭합니다.
* 그룹명: SandboxGroup
* 설명: Sandbox 구획을 사용하기 위한 그룹
* 사용자: 위에서 추가한 기본 도메인 사용자

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-6.png " ")


#### 4. 기본 도메인 그룹에 정책 (Policy) 설정
이제 **Sandbox** 구획에 대한 **SandboxGroup** 그룹에 권한을 부여하기 위한 정책을 생성합니다. 메뉴에서 **ID & 보안 (Identity & Security) > 정책(Policy)**을 선택합니다. 

![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-7.png " ")

**정책 생성** 버튼을 클릭한 후 다음과 같이 입력합니다.
![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-8.png " ")

* 이름: SandboxPolicy
* 설명: 사용자에게 Sandbox 구획에 대한 모든 권한 부여
* 수동 편집기 표시 (Off) -> 직접 정책을 입력
* 정책 작성기에 다음 구문 입력
  * Allow group SandboxGroup to manage all-resources in compartment Sandbox
  * **Sandbox** 구획에 모든 리소스를 관리할 수 있는 권한을 **SandboxGroup** 그룹에 할당하는 정책 구문
  
![]({{site.urlblogimg2022_2023}}/assets/img/getting-started/2023/identity-domain/oci-identity-domain-9.png " ")

#### 5. 요약
OCI의 IDCS라는 PaaS형 IAM 서비스가 OCI 자체 IAM 서비스와 통합된 Identity Domain 서비스에서 사용자,그룹,정책을 관리하는 방법에 대해서 알아보았습니다. 이번 포스팅에서 진행한 내용을 간단히 도식하면 다음과 같습니다.

> **구획 생성** ----> **기본 도메인(Default Domain)에 사용자 추가** ----> **기본 도메인(Default Domain)에 그룹 추가 (SandboxGroup)** <--- **정책 부여 (OCI 정책)**


