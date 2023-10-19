---
layout: page-fullwidth
#
# Content
#
subheadline: "Administration"
title: "OCI Cloud Account (Tenancy) 삭제 요청하기"
teaser: "더이상 사용하지 않는 OCI Cloud Account를 삭제하는 방법에 대해 알아봅니다."
author: yhcho
breadcrumb: true
categories:
  - getting-started
tags:
  - [oci, delete, tenancy, termination]
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

### OCI 클라우드 계정 및 테넌시 삭제
OCI 클라우드 계정을 더이상 사용하지 않는 경우 해당 계정(테넌시)을 삭제하여 추가적으로 비용이 발생하지 않도록 예방할 수 있습니다.
이번 포스팅에서는 OCI 클라우드 계정을 삭제하는 방법에 대하여 알아보도록 하겠습니다.

> 테넌시를 삭제하면 테넌시와 연결된 클라우드 계정 및 모든 해당 리소스가 영구적으로 삭제됩니다. 또한 테넌시 및 클라우드 계정 삭제는 되돌릴 수 없으며 실행 취소할 수 없습니다.

### 사용중인 리소스 정리하기
OCI 클라우드 계정을 삭제하기 전에 먼저 추가 비용이 발생하지 않도록 사용중인 리소스를 정리해야 합니다.
사용중인 리소스를 정리하기 위해서는 "테넌시 탐색기" 메뉴를 통해서 전체 테넌시에 생성된 리소스를 확인 및 삭제할 수 있습니다.

1. 전체메뉴에서 "거버넌스 & 관리" - "테넌시 관리" - "테넌시 탐색기" 메뉴를 클릭합니다.
   ![](/assets/img/getting-started/2023/delete-account-1.png " ")
2. 리소스 유형별 필터링 기능을 통해 특정 조건으로 리소스를 검색할 수 있습니다.
   ![](/assets/img/getting-started/2023/delete-account-2.png " ")
3. "하위 구획 리소스 표시" 체크박스를 선택하여 모든 구획의 리소스를 검색할 수 있습니다.
   ![](/assets/img/getting-started/2023/delete-account-4.png " ")
4. 검색된 리소스 우측 "Action Button"을 클릭하여 해당 리소스를 종료 또는 삭제할 수 있습니다. (일부 리소스는 테넌시 탐색기에서 직접 삭제가 불가합니다.)
   ![](/assets/img/getting-started/2023/delete-account-3.png " ")

### 테넌시(클라우드 계정) 삭제하기
1. OCI 관리자로 로그인한 상태에서 OCI Console 메인페이지에서 사용자 프로파일 아이콘을 클릭, 테넌시 명을 클릭하여 세부정보 화면으로 이동합니다.
   ![](/assets/img/getting-started/2023/delete-account-5.png " ")
2. "테넌시 삭제 요청" 버튼을 클릭합니다. (_캡처의 경우 이미 삭제요청된 상태라 활성화 되어있지 않습니다._)
   ![](/assets/img/getting-started/2023/delete-account-6.png " ")
3. 삭제할 테넌시 명을 입력하여 테넌시 삭제 요청을 확인합니다.
4. "테넌시 삭제 요청"을 클릭하여 테넌시를 삭제 요청합니다.

> 테넌시 삭제는 즉시 이루어지지 않으며 다소 시간이 걸릴 수 있습니다. 테넌시를 삭제하면 모든 리소스가 일시 중지되고 30일 후에 테넌시가 영구적으로 삭제됩니다. 테넌시가 영구적으로 삭제되면 귀하와 다른 사용자 모두 삭제된 테넌시에 로그인할 수 없습니다

### 참고자료
[테넌시 및 클라우드 계정 삭제](https://docs.oracle.com/en-us/iaas/Content/General/Tasks/deleting_tenancy.htm){:target="_blank" rel="noopener"}