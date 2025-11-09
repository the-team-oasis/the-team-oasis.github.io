---
layout: page-fullwidth
#
# Content
#
subheadline: "Support"
title: "새로운 MOS(My Oracle Support) 에서 Support Request 생성하는 방법"
teaser: "새로운 MOS에서 지원 요청을 생성하는 방법을 설명합니다."
author: yhcho
date: 2025-11-09 00:00:02
breadcrumb: true
categories:
  - getting-started
tags:
  - [oci, support, mos, SR]
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
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

### 새로운 MOS Portal에서 서비스 요청 생성하기

#### 새로운 MOS Portal 로그인 하기

- MOS ([https://support.oracle.com/](https://support.oracle.com/)) 접속 후 아래와 같이 화면에 테넌시 Administrator의 E-mail 정보 주소 입력 후 아래 그림과 같이 진행하시면 됩니다.

![](/assets/img/getting-started/2025/mos_new_image.png " ")

- 위 화면에서 “전자메일” 입력 화면에 Cloud Account(Tenancy)에 생성되어 있는 사용자 계정 정보를 입력 합니다.

![](/assets/img/getting-started/2025/mos_new_image1.png " ")

- 사용자 계정을 입력 한 이후에 위 화면과 같이 사인인을 위한 옵션이 나타 보여집니다. “**상업용 클라우드 계정으로 사인인**” 을 선택 합니다.

![](/assets/img/getting-started/2025/mos-new/mos-new-login-1.png " ")

- 이후 테넌시 정보를 입력한 후 클라우드 계정에 로그인을 진행합니다.

![](/assets/img/getting-started/2025/mos-new/mos-new-login-2.png " ")

- 해당 클라우드 계정으로 처음 로그인하는 경우 계정 연관을 위해 이메일로 일회용 확인코드를 전송해 줍니다. 일회용 확인 코드를 수신할 이메일 주소를 확인하고 "코드 전송"을 클릭합니다.

![](/assets/img/getting-started/2025/mos-new/mos-new-login-3.png " ")

- 수신된 코드를 확인하고 입력합니다.

![](/assets/img/getting-started/2025/mos-new/mos-new-login-4.png " ")
![](/assets/img/getting-started/2025/mos-new/mos-new-login-5.png " ")

- 정상적으로 인증이 되고 MOS Portal로 이동하기 버튼을 클릭합니다.

![](/assets/img/getting-started/2025/mos-new/mos-new-login-6.png " ")

#### 새로운 MOS Portal에서 서비스 요청 생성하기

- MOS Portal에서 "서비스 요청 생성" 버튼을 클릭합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-1.png " ")

- 서비스 요청 생성을 시작하면 먼저 발생한 문제 유형을 선택해야 합니다. 선택한 문제 유형에 따라 SR의 등급이 정해지기 때문에, 현재 발생한 이슈 유형에 따라 선택합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-2.png " ")

- 발생한 문제가 사용자 비즈니스에 미치는 영향에 대해서 선택합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-3.png " ")

- 만약 여러 클라우드 계정에 권한을 보유하고 있는 경우, 문제가 발생한 계정을 선택합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-4.png " ")
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-5.png " ")

- 문제가 발생한 서비스 유형을 선택합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-6.png " ")

- 문제가 발생한 테넌시의 OCID를 입력합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-7.png " ")

- 문제가 발생한 고객 환경의 유형을 선택합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-8.png " ")

- 서비스 요청의 제목을 입력합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-9.png " ")

- 서비스 요청에 사용할 언어를 선택합니다. 한글로 작성해도 처리가 진행되지만, 빠른 대응이 필요한 서비스 요청의 경우 영어로 작성하는게 좋습니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-9-1.png " ")

- 문제에 대한 자세한 정보를 입력합니다. 서비스 요청 엔지니어가 문제 파악에 도움이 될 수 있는 정보를 최대한 작성하는 게 좋습니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-9-2.png " ")

- 문제가 발생한 범주를 선택합니다. 정확히 일치하는 항목이 없는 경우 최대한 유사한 항목을 선택합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-9-3.png " ")

- 장애 이슈의 경우 최초 장애를 인지한 시각에 대한 정보를 입력합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-10.png " ")

> 심각한 장애에 대한 서비스 요청의 경우 몇 가지 추가로 입력할 정보가 있습니다.

- 24시간 이내 해결될 중요 장애의 경우 업무시간 외 시간에 연락을 받을 지 여부 선택
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-11.png " ")

- "서비스 요청 제출" 버튼을 클릭하여 서비스 요청을 생성합니다.
  ![](/assets/img/getting-started/2025/mos-new/mos-create-sr-12.png " ")

#### OCI Console에서 지원 계정 링크하기

MOS 계정과 OCI 사용자 계정을 연동하기 위해 먼저 동일한 브라우저에서 MOS Portal, OCI Console에 접속되어 있어야 합니다.

- OCI 콘솔의 우측 상단 프로필 아이콘을 클릭하여 사용자 프로파일 상세정보 화면으로 이동합니다.
  ![](/assets/img/getting-started/2025/mos-new/oci-limk-mos-account-1.png " ")

- 우측 작업 버튼에서 "지원 계정 링크" 버튼을 클릭합니다.
  ![](/assets/img/getting-started/2025/mos-new/oci-limk-mos-account-2.png " ")

- 프로필 하단의 My Oracle Support 계정에 링크된 계정 정보를 확인합니다.
  ![](/assets/img/getting-started/2025/mos-new/oci-limk-mos-account-3.png " ")

#### OCI Console에서 서비스 요청 생성하기

> OCI Console에서 서비스 요청(지원 요청)을 생성하기 위해서는 먼저 MOS 계정이 OCI 계정에 연동 되어 있어야 합니다. 위 단계를 확인해서 먼저 MOS 설정, OCI 계정 연동을 설정한 후 진행하세요

- 서비스 요청 (지원 요청)을 통해 확인이 필요한 서비스 화면에서 우측 상단 도움말 아이콘을 클릭하여 "지원 요청 생성" 메뉴를 클릭합니다.
  ![](/assets/img/getting-started/2025/mos-new/oci-create-sr-2.png " ")

- 자동으로 생성된 채팅 지원 세션에 간단히 도움이 필요한 정보를 입력한 후 "Support Request" 버튼을 클릭합니다.
  ![](/assets/img/getting-started/2025/mos-new/oci-create-sr-3.png " ")

- 생성하고자 하는 서비스 요청 유형을 선택합니다. 이 가이드에서는 기술지원에 대한 내용을 작성하기 위해 "Technical Support"를 클릭합니다.
  ![](/assets/img/getting-started/2025/mos-new/oci-create-sr-4.png " ")

- 채팅 세션 왼쪽에 지원 요청을 생성하기 위한 패널이 생성됩니다. 문제 요약, 설명, 문제유형, 서비스 카테고리 등의 정보를 입력 및 선택 하여 "지원 요청 생성" 버튼을 클릭하면 서비스 요청을 생성할 수 있습니다.
  ![](/assets/img/getting-started/2025/mos-new/oci-create-sr-5.png " ")
  ![](/assets/img/getting-started/2025/mos-new/oci-create-sr-6.png " ")
