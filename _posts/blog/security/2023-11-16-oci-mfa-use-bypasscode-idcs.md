---
layout: page-fullwidth
#
# Content
#
subheadline: "Security"
title: "OCI MFA 우회코드 사용하기"
teaser: "OCI 클라우드 계정에 MFA 인증이 적용된 이후 휴대폰을 분실하였거나, 인증기가 설치된 PC에 접근할 수 없는 경우 사용가능한 우회코드 기능에 대해 알아봅니다."
author: yhcho
breadcrumb: true
categories:
  - security
tags:
  - [oci, security, mfa, bypass code, oci authenticator, 우회코드]
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

### 우회코드 (bypass code) 란?
우회코드는 MFA가 설정된 IDCS 사용자 계정이 임시로 OCI Console 에 로그인할 수 있는 코드 입니다.
사용자는 우회 코드를 생성하여 나중에 사용하기 위해 저장할 수도 있고, 관리자에게 사용자를 위한 우회 코드 생성을 요청할 수도 있습니다. 
예를 들어 사용자가 휴대폰을 잃어버렸거나, 인증기가 설치된 컴퓨터에 액세스할 수 없는 경우 2단계 인증 페이지에서 사용자는 헬프 데스크에 문의하여 관리자가 바이패스 코드를 생성하도록 요청할 수 있습니다.
이번 포스팅에서는 관리자가 사용자를 위한 우회 코드를 생성하는 방법에 대해 알아보도록 하겠습니다.

### 전제조건
> 우회코드를 생성하기 위해서는 해당 사용자 계정에 MFA에 적용되어 있어야 합니다.

### 우회코드 생성하기
1. Identity Cloud Service 콘솔에서 전체 메뉴를 클릭 후 “ID – 도메인 – Default 도메인 (다른 도메인을 사용하는 경우 해당 도메인) – 사용자” 메뉴로 이동합니다.
2. 우회 코드를 생성하려는 사용자 계정을 클릭합니다.
   ![](/assets/img/cloudnative-security/2023/bypasscode/bypasscode-1.png " ")
3. 작업 메뉴를 클릭한 다음 우회 코드 생성 을 선택합니다.
   ![](/assets/img/cloudnative-security/2023/bypasscode/bypasscode-2.png " ")
4. 우회 코드 생성 창의 바이패스 코드 만료 후 영역 에서 우회 코드가 만료되는 시점을 설정합니다.
   * 우회 코드가 만료되는 시간(일, 시간, 분)을 설정합니다. 이 시간이 지나면 사용자는 우회 코드를 사용할 수 없습니다.
   * 우회 코드가 만료되는 것을 원하지 않으면 "만료 안됨" 을 클릭하세요.
   
   ![](/assets/img/cloudnative-security/2023/bypasscode/bypasscode-7.png " "){: width="50%"}
5. 우회 코드 생성 창의 우회 코드 사용 가능 영역 에서 우회 코드를 사용할 수 있는 빈도를 지정합니다.
   * 우회 코드를 한 번만 사용할 수 있는 경우 한 번 을 클릭합니다.
   * 우회 코드를 제한된 횟수만큼 사용할 수 있는 경우 텍스트 상자 왼쪽에 있는 버튼을 클릭합니다. 우회 코드를 사용할 수 있는 횟수를 나타내는 숫자를 텍스트 상자에 입력합니다.
   * 우회 코드를 무제한으로 사용할 수 있는 경우 무제한을 클릭합니다.
   
   ![](/assets/img/cloudnative-security/2023/bypasscode/bypasscode-6.png " "){: width="50%"}
6. "생성" 버튼을 클릭합니다.
   ![](/assets/img/cloudnative-security/2023/bypasscode/bypasscode-3.png " ")
7. 우회 코드 창 에서 "전자메일 전송"을 클릭하면 생성된 우회 코드가 사용자에게 전송됩니다. 이 메일에는 사용자가 Oracle Identity Cloud Service 에 로그인하기 위한 일회성 2단계 확인 방법으로 사용하는 우회 코드가 포함되어 있습니다.
   ![](/assets/img/cloudnative-security/2023/bypasscode/bypasscode-4.png " ")
   ![](/assets/img/cloudnative-security/2023/bypasscode/bypasscode-5.png " ")

### 우회코드로 로그인하기
1. OCI Console 로그인 시 2단계 인증 단계에서 "대체 로그인 표시" 버튼을 클릭하여 "우회 코드" 방법을 선택합니다.
   ![](/assets/img/cloudnative-security/2023/bypasscode/bypasscode-login-1.png " ")
2. 메일 또는 관리자에게 전달 받은 우회코드를 입력 후 OCI Console에 로그인합니다.
   ![](/assets/img/cloudnative-security/2023/bypasscode/bypasscode-login-2.png " ")

### 참고 
* [우회 코드 생성](https://docs.oracle.com/en-us/iaas/Content/Identity/usersettings/generate-bypass-code.htm){:target="_blank" rel="noopener"}
* [사용자 계정에 대한 우회 코드 생성](https://docs.oracle.com/en/cloud/paas/identity-cloud/uaids/generate-bypass-codes-user-accounts.html#GUID-DC1CDE1E-0A3F-41FB-ADD0-1AA1FC19F3C5){:target="_blank" rel="noopener"}
