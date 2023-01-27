---
layout: page-fullwidth
#
# Content
#
subheadline: "MFA 다중인증"
title: "OCI의 MFA 이용하기"
teaser: "OCI의 MFA 방법을 설명합니다."
author: kisu.kim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, mfa]
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

#### 소개
OCI에서 MFA는 다음과 같은 세 가지 오라클 제품에서 사용할 수 있습니다
- Old OCI IAM(Just for local OCI Users)
- In IDCS. This is the recommended solution for SSO that works for IaaS,PaaS and SaaS.
- In the new Identity Domains and it can be used for SSO for IaaS,PaaS and SaaS.

<br>**사용자 추가 및 Identity Domain 관련 자세한 내용은 아래 포스팅을 참고해주세요.**

- [OCI의 로그인 옵션 살펴보기](/getting-started/sign-in-options/)
- [OCI에서 사용자,그룹,정책 관리하기](/getting-started/adding-users/)
- [OCI IAM Identity Domain에 대해 알아보기](/getting-started/oci-iam-identity-domain/)
  
#### Old OCI IAM(Just for local OCI Users)
로그인을 할때, IAM을 통해서 로그인 할 경우 아래 화면과 같으며, MFA 설정 방법에 대해서 설명합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230126-e6m.png)

1) 로그인 후  Menu → Identity&Security →Identity ->Users 이동합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230126-edb.png)

> 아래 MFA 하고자하는 사용자가 "Federated" 가 "NO" 인것을 확인해야 합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230126-eex.png)

MFA 활성화 하기 위해서 사용자의 상세정보를 확인 합니다.

> MFA 설정을 위해서 Enable Multi-Factor Authentication 클릭합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230126-egs.png)

생성된 QR 코드를 인증기 (구글 or 오라클 인증기 등) 통해서 스캔 후 발생된 키를 입력하여 validation 체크를 합니다. 이후 로그인 확인을 위해서 로그아웃 하여 다시 로그인합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230126-ei2.png)

![](/assets/img/infrastructure/2023/mfa/SCR-20230126-ejm.png)

![](/assets/img/infrastructure/2023/mfa/SCR-20230126-ekh.png)

#### In IDCS. This is the recommended solution for SSO that works for IaaS,PaaS and SaaS.
아래와 같이 로그인을 할때, 계정의 경우 Single Sign-On을 통해서 할 경우 MFA 설정 방법입니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230126-e5i.png)

1) 먼저, Menu →Identity and Security →Federation → Click on OracleIdentityCloudService 이동합니다. 

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-c69.png)

2) IDCS Admin Console Link를 클릭합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-c7k.png)


3) 왼쪽 메뉴에서 Security → MFA 클릭 후  MFA Factors 설정 후 저장합니다.  

> Mobile App Passcode , Phone Number , Email 체크합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-cbm.png)



4) MFA 사용할 그룹을 만들기 위해서 그룹에서 새로운 그룹을 생성합니다. & 생성된 그룹에 MFA 인증 할 사용자를 선택 후 저장합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-ce7.png)

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-cg0.png)



7) Security →Sign-On Policies 클릭 후 "Default Sign-On Policy"를 편집합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-chu.png)

8) "Single-On Rules" 탭에서 새로운 룰을 등록합니다. 

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-cl1.png)

13) 룰이 등록된 이후 MFA를 우선순위를 높이기 위해서 드래그 앤 드랍을 통해서 우선순위 변경을 합니다.(가장 높은 순위로 변경합니다.)

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-cn8.png)

14) 로그아웃 후 다시 로그인을 합니다:

MFA 인증 후 처음 로그인 하면, 초기 보안 설정을 위한 화면이 진행됩니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-cq0.png)

보안 설정에서 전자메일 , 모바일 어플리케이션 (OTA), 전화번호에서 "모바일 어플리케이션"을 선택합니다.
![](/assets/img/infrastructure/2023/mfa/SCR-20230127-cqc.png)

"모바일 어플리케이션" 선택 하면 QR 코드가 생성되며, 오라클 인증기 혹은 구글 인증기를 선택하여 사용 할 수 있으며, 오라클 인증기외 다른 인증기를 선택 할 경우, "오프라인 모드 또느 다른 인증앱 사용" 체크 해야합니다.

> 오라클 인증기외 다른 인증기를 선택 할 경우, "오프라인 모드 또느 다른 인증앱 사용" 체크 해야합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-cqq.png)

이후 validation 확인을 위한 인증코드 입력 후 정상적인 로그인이 진행됩니다.




#### In the new Identity Domains
새로운 도메인 기반의 로그인 정책 방식의 경우 아래와 같이 설정이 필요합니다.

아래 화면은 도메인이 보여지는 로그인 방식의 경우 예시입니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230126-e88.png)

로그인 후 Identity & Security -> Domains 클릭합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-blj.png)

MFA 적용할 도메인을 선택 합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-bo1.png)

Domains -> Security 클릭합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-bp8.png)

Security -> MFA 클릭 후 아래 화면과 같이 설정 합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-bqi.png)

MFA를 사용할 그룹을 만듭니다. Groups -> Create group 이동합니다.

> 예시에서 MFA 그룹을 "ORACLE" 로 만들었습니다. & 만들어진 그룹에 MFA 사용할 사용자를 등록해 줍니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-bro.png)

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-btc.png)

Security -> Sign-on Policies 이동 후 "Default Sign-On Policy" 클릭합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-bv4.png)

"Add Sign-on rule"을 만들고 아래와 같이 설정합니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-bxy.png)

설정 후 룰 편집을 통해서 우선순위를 MFA를 가장 높은 우선순위로 변경해 줍니다. & 이후 로그 아웃 후 재 로그인 시 MFA 그룹의 계정에 속하는 사용자의 경우 아래와 같이 QR 코드 등록 및 절차가 진행됩니다.

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-c0s.png)

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-c37.png)

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-c37.png)

![](/assets/img/infrastructure/2023/mfa/SCR-20230127-c40.png)






