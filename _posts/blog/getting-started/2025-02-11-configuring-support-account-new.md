---
layout: page-fullwidth
#
# Content
#
subheadline: "Support"
title: "OCI와 MOS(My Oracle Support) 계정 연동, OCI의 일반 사용자에게 지원 요청(SR) 권한 할당 방법 (NEW)"
teaser: "OCI를 유료로 구독하는 경우 최초 관리자(Cloud Account Admin 권한을 갖는 사용자)는 OCI Console에서 지원 요청 티켓을 생성하여 오라클로부터 다양한 지원을 받을 수 있습니다. 이번 글에서는 관리자의 OCI 계정을 MOS(My Oracle Support) 계정과 연동하는 방법과, OCI 일반 사용자에게 지원 요청(SR)을 생성할 수 있는 권한을 부여하는 방법에 대해서 설명합니다.(NEW)"
author: kisukim
date: 2025-02-11 00:00:02
breadcrumb: true
categories:
  - getting-started
tags:
  - [oci, support]
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

# 신규 사용자 MOS 등록 절차

- MOS ([https://support.oracle.com/](https://support.oracle.com/)) 접속 후 아래와 같이 화면에 테넌시 Administrator의 E-mail 정보 주소 입력 후 아래 그림과 같이 진행하시면 됩니다.

![](/assets/img/getting-started/2025/mos_new_image.png " ")

- 위 화면에서 “전자메일” 입력 화면에 **Tenant** 사용자 계정을 입력 합니다.

![](/assets/img/getting-started/2025/mos_new_image1.png " ")

- 사용자 계정을 입력 한 이후에 위 화면과 같이 사인인을 위한 옵션이 나타 보여집니다. “**상업용 클라우드 계정으로 사인인**” 을 선택 합니다.

![](/assets/img/getting-started/2025/mos_new_image2.png " ")

- 사인인을 하면 해당 입력한 계정 정보를 기준으로 확인된 테넌시 이름 , ID 도메인 , 클라우드 계정 사용자 이름의 정보를 확인 할 수 있습니다. 전자메일 validation을 위해서 위 **“지원 전자메일”** 에 정보를 입력합니다. 입력 후 코드전송을 클릭 합니다. 입력된 E-mail로 전자 메일이 시스템으로 부터 발송되며, 발송된 메일의 코드를 확인 합니다.

![](/assets/img/getting-started/2025/mos_new_image3.png " ")

![](/assets/img/getting-started/2025/mos_new_image4.png " ")

- E-mail 로 전달 받은 코드를 입력 후 확인 클릭 후 다음 버튼을 클릭 합니다.

![](/assets/img/getting-started/2025/mos_new_image5.png " ")

- 사용자 약관에 대한 내용에 대한 “이용약관을 검토” 체크 후 계속 클릭 합니다.

![](/assets/img/getting-started/2025/mos_new_image6.png " ")

- 현재, 로그인 사용자의 개인 정보를 현행화 합니다. 국가, 이름, 전화번호, 시간대 등을 확인 후 저장 합니다.

![](/assets/img/getting-started/2025/mos_new_image7.png " ")

- 개인 정보 현행화 이후 위 화면과 같이 SR을 생성 할 수 있는 화면이 보여집니다. 이후 사용자가 원하는 SR을 생성하면 됩니다.

# My Oracle Support의 사용자 그룹에 대한 접근 요청 (상업용 클라우드 계정 사용)

상업용 클라우드 계정을 사용하기 위해서는 먼저 OCI Console에서 사용자를 추가해야 합니다.
아래와 같이 신규 사용자를 추가하고 해당 사용자를 MOS에 등록하는 절차는 [신규 사용자 MOS 등록 절차](#신규-사용자-mos-등록-절차)와 같습니다.

![](/assets/img/getting-started/2025/mos_new_image8.png " ")

- 신규 사용자를 생성하고 MOS 등록 절차를 이전과 같이 동일하게 진행하면 SR 생성이 가능합니다.

# My Oracle Support의 사용자 그룹에 대한 접근 요청 (오라클 계정 사용)

오라클 계정으로 MOS에 로그인한 사용자가 특정 사용자 그룹(테넌시)에 권한을 신청하는 방법입니다.

- 로그인 후 우측 상단 "계정" 메뉴에서 "환경설정" 메뉴를 클릭합니다
  ![](/assets/img/getting-started/2025/mos_new_adduser-1.png " ")

- 이동한 화면에서 "사용자 그룹" 탭을 클릭 후 "사용자 그룹에 대한 접근 요청" 을 클릭합니다.
  ![](/assets/img/getting-started/2025/mos_new_adduser-2.png " ")

- 요청하고자 하는 그룹의 사용자 그룹 ID와 테넌시 명을 입력합니다. (해당 정보는 테넌시 관리자를 통해 확인 할 수 있습니다.)
  ![](/assets/img/getting-started/2025/mos_new_adduser-3.png " ")
  ![](/assets/img/getting-started/2025/mos_new_adduser-4.png " ")

# My Oracle Support의 사용자 그룹에 대한 접근 요청 관리하기

사용자 그룹의 관리자인 경우 다른 사용자가 요청한 접근 요청을 승인하거나 거절, 관리할 수 있습니다.

- My Oracle Support 포털에 로그인된 상태에서 우측 상단의 "계정" 메뉴에서 "관리" 메뉴를 클릭합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-1.png " ")

- 이동한 화면에서 "사용자 그룹" 탭을 클릭하면 관리자 권한을 가지고 있는 사용자 그룹 List가 보여집니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-2.png " ")

- 만약 아직 처리하지 않은 접근 요청이 있다면 아래와 같이 보여집니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-3.png " ")

## 접근 요청 승인하기

- 접근 요청을 신청한 사용자를 선택한 후 "승인(Approve)"를 클릭합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-4.png " ")

- 접근 요청을 승인하면서 사용자에게 어떤 권한을 부여할 지 선택할 수 있습니다. (User / Admin)
  ![](/assets/img/getting-started/2025/mos_new_manageuser-5.png " ")
  ![](/assets/img/getting-started/2025/mos_new_manageuser-6.png " ")

- Admin 권한으로 접근 요청을 승인한 결과는 아래와 같이 확인하실 수 있습니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-7.png " ")

## 접근 요청 거절하기

- 접근 요청을 신청한 사용자를 선택한 후 "거절(Deny)"을 클릭합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-15.png " ")

- 접근 요청이 거절되었는지 확인합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-16.png " ")

## 사용자 권한 수정하기

MOS 사용자 그룹의 사용자 권한을 수정하는 방법입니다.

- 권한을 수정하고자 하는 사용자를 선택하고 "권한 수정(Edit Privileges)"을 클릭합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-8.png " ")

- 권한 수정 화면에서 수정하고자 하는 Fields를 선택합니다
  ![](/assets/img/getting-started/2025/mos_new_manageuser-9.png " ")

- 기존 Admin 권한을 User 권한으로 수정합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-10.png " ")

- 수정된 권한을 확인합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-11.png " ")

## 사용자 그룹에서 사용자 삭제하기

MOS 사용자 그룹의 사용자를 삭제하는 방법입니다

- 삭제하고자 하는 사용자를 선택하고 "삭제(Remove)"를 클릭합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-12.png " ")

- 삭제 확인 팝업이 뜨면 "확인(Confirm)"을 클릭합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-13.png " ")

- 사용자가 삭제되었는지 확인합니다.
  ![](/assets/img/getting-started/2025/mos_new_manageuser-14.png " ")
