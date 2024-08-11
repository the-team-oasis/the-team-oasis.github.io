---
layout: page-fullwidth
#
# Content
#
subheadline: "Image Export/Import"
title: "OCI 임포트/익스포트 사용하기"
teaser: "OCI에서 OS 이미지를 임포트/익스포트하는 방법에 대해서 실습해 보았습니다."
author: "kskim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, compute, import, export, image]
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

# 1. 소개

안녕하세요! OCI 컴퓨트를 사용하다가 보면 해당 OS를 다른 테넌시 혹은 On-prem 환경으로 마이그레이션 요건이 생기게 됩니다.

이 경우, 아래와 같은 순서대로 임포트(Import) /익스포트(Export) 할 수 있습니다. 아래 시나리오는 OCI 환경에서  마이그레이션 하는 부분입니다.

임포트(Import)/익스포트(Export)지원되는 OS 종류는 아래 링크 참고 사이트 통해서 확인 할 수 있습니다.

**임포트 이미지는 최대 400GB로 제한됩니다.**

> 출처 : [https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/imageimportexport.htm](https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/imageimportexport.htm)
>

# 2. 작업순서

## 2-1. 사용자정의 이미지 생성하기

![](/assets/img/infrastructure/2024/osimage/osimage0.png)

- 컴퓨트 상세정보에서 “**사용자정의 이미지 생성**”를 클릭하면 compute 는 중지가 됩니다. 따라서 **해당 컴퓨트는 사용자정의 이미지를 생성하는 동안 접근 및 서비스가 불가 합니다.**

![](/assets/img/infrastructure/2024/osimage/osimage1.png)

1. 컴파트먼트 생성 : 사용자정의 이미지가 저장될 구획을 선택하시면 됩니다.
2. 이름 : 생성된 사용자정의 이미지의 이름입니다.

![](/assets/img/infrastructure/2024/osimage/osimage2.png)

- **“사용자 정의 이미지 생성”** 클릭하면 컴퓨트 상세화면에서 “이미지 생성 중” 이라고 작업이 시작됩니다.

![](/assets/img/infrastructure/2024/osimage/osimage3.png)

1. 컴퓨트에서 사용자 정의 이미지를 생성하게되면 위 화면과 같이 “**컴퓨트→ 사용자정의 이미지**” 카테고리에 사용자 정의 이미지가 만들어 집니다.
2. 구획은 컴퓨트 상세화면에서 사용자정의 이미지를 생성할때 선택한 구획을 선택하시면 됩니다.

## 2-2. 사용자정의 이미지 오브젝트 스토리지로 익스포트하기

![](/assets/img/infrastructure/2024/osimage/osimage4.png)

- 사용자 정의 이미지가 완료가 되면, 기존에 컴퓨트는 터미널로 접속 할 수 있는 상태가 됩니다.
- 해당 이미지를 **“익스포트”** 클릭하면, 테넌시의 오브젝트 스토리지로 익스포트 할 수 있습니다. 단, 오브젝트 스토리지가 생성되어 있지 않는 경우 오브젝트 스토리지를 만들어 주세요.

![](/assets/img/infrastructure/2024/osimage/osimage5.png)

1. 오브젝트 스토리지가 이미 있는 경우, 위 1번과 같이 이미 만들어진 오브젝트 스토리지를 선택 하시면 됩니다.
2. 2번은 익스포트될 파일명의 이름입니다.
3. 3번은 익스포트할 이미지 형식이며, 이미지 형식은 3번과 선택 할 수 있으며, 용도에 맞게 선택하시면 됩니다. 아래 익스토프/임포트 참고 사이트 입니다.([https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/imageimportexport.htm](https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/imageimportexport.htm)) OCI에서 사용하기 위해서 기본 **“Oracle Cloud Infrastructure 파일과 QOCW2 이미지 및 OCI 메타데이터(.OCI)”** 를 선택하겠습니다.

![](/assets/img/infrastructure/2024/osimage/osimage6.png)

- 익스포트가 완료되면 위 화면과 같이 “**스토리지→오브젝트 스토리지 및 아카이브 스토리지**” 클릭하면 익스포트된 이미지를 확인 할 수 있습니다.

![](/assets/img/infrastructure/2024/osimage/osimage7.png)

- 위 화면은 오브젝트 스토리지에 익스포트된 이미지를 확인 할 수 있습니다.

![](/assets/img/infrastructure/2024/osimage/osimage8.png)

- 화면에서 파일의 오른쪽 끝에 점 세개로 된 부분을 클릭하면 위 화면과 같이 **“사전 인증된 요청 생성”** 클릭하면 파일을 받을 수 있는 URL 이 생성됩니다.

![](/assets/img/infrastructure/2024/osimage/osimage9.png)

1. 1번은 객체(파일)을 선택합니다. 이는 스토리지 전체 혹은 일부에 대해서 외부 접근에 대한 URL 생성입니다. 저는 파일만 받기 위해서 객체를 선택합니다.
2. 2번은 객체(파일)의 유형을 선택합니다. 유형은 파일 다운로드 하기 위해서 **“객체 읽기 허용”**을 선택합니다.
3. 3번은 **“만료”** 입니다. 만료는 파일을 받기 위한 URL의 유효기간 입니다.

![](/assets/img/infrastructure/2024/osimage/osimage10.png)

- 사전 인증 요청 URL이 생성되면 위 화면과 같이 URL이 생성되며, 해당 URL을 통해서 파일을 다운로드 할 수 있습니다.

## 2-3. 사용자정의 이미지 임포트 하기

- 이번 장에서는 임포트를 하기 위해서 아래와 같이 2가지 옵션으로 로컬 디스크에 받은 파일을 업로드 하는 방법과 오브젝트 스토리지에 익스포트된 이미지를 바로 임포트 할 수 있는 2가지 방법에 대해서 알아 보겟습니다. 각 스텝 마다 간단한 그림을 넣어 두었습니다.

1. 오브젝트 스토리지에 있는 사용자정의 이미지를 이용해서 다른 테넌시로 바로 임포트 하기**(옵션1)- 동일 리전 혹은 다른 리전도 가능합니다.**

   ![](/assets/img/infrastructure/2024/osimage/osimage11.png)

   - 사용자정의 이미지를 바로 다른 테넌시에 임포트 하기 위해서는 아래 그림과 같이 사용자정의 이미지를 임포트 할 수 있습니다.

   ![](/assets/img/infrastructure/2024/osimage/osimage12.png)

   - 먼저, **“컴퓨트→사용자정의 이미지” 클릭 후 “이미지 임포트” 클릭**

   ![](/assets/img/infrastructure/2024/osimage/osimage13.png)

   - 위 화면에서 1번은 임포트 할 구획을 선택합니다.
   - 2번은 임포트 할 이미지의 이름을 넣어 주시면 됩니다.
   - 3번 임포트 할 이미지의 운영체제와 맞는 OS 종류를 선택하시면 됩니다.
   - 4번은 지난 장에서 오브젝트 스토리지에서 파일 다운로드 할 때 생성된 사전 인증요청 URL 입력하시면 됩니다.
   - 5번은 이미지 유형이며, 이번 내용에서는 QCOW2를 선택 합니다.
   - 6번은 반 가상화모드를 선택 합니다.

   ![](/assets/img/infrastructure/2024/osimage/osimage14.png)

   - 정상적으로 임포트 작업이 이루어지면 위 화면과 같이 **“임포트 중”** 이라는 상태로 변경 되며 이후 완료가 됩니다.

2. 오브젝트 스토리지에 사용자정의 이미지 파일 다운 받은 후 다른 테넌시에서 이미지 업로드 후 임포트 하기**(옵션2)**

   ![](/assets/img/infrastructure/2024/osimage/osimage15.png)

- 위 같은 케이스는 파일을 직접 다운로드 하여, 다른 테넌시로 임포트 할 경우 해당 파일을 오브젝트 스토리에 업로드한 이후 임포트를 진행하게 됩니다.

  ![](/assets/img/infrastructure/2024/osimage/osimage16.png)

   - **“스토리지 → 오브젝트 스토리지”** 이동 후 로컬에서 받은 파일을 위 화면과 같이 업로드를 진행합니다.

  ![](/assets/img/infrastructure/2024/osimage/osimage17.png)

   - 파일을 업로드하게 되면 위 화면과 같이 업로드가 진행됩니다.

  ![](/assets/img/infrastructure/2024/osimage/osimage18.png)

   - 업로드가 완료되면 위 화면과 같이 파일을 확인 할 수 있습니다.

  ![](/assets/img/infrastructure/2024/osimage/osimage19.png)

   - **“컴퓨트→사용자정의 이미지”** 들어가서 “**임포트**” 클릭 합니다.
   - 1번은 업로드된 이미지의 오브젝트 스토리지를 선택 합니다.
   - 2번은 오브젝트 스토리지의 버킷을 선택 후 객체 이름에서 업로된 파일을 선택합니다. 또한 이미지 유형은 **QCOW2**를 선택합니다.
   - 이후 임포트 클릭하면 임포트가 완료 됩니다.

  ## 2-4. 임포트된 사용자정의 이미지로 컴퓨트 만들기

   - 이전 내용에서 정상적으로 임포트된 이미지의 경우 “컴퓨트→ 사용자 정의 이미지” 에서 임포트된 목록을 볼 수 있습니다.

     ![](/assets/img/infrastructure/2024/osimage/osimage20.png)

      - 임포트된 이미지중에서 원하는 이미지를 클릭하여 상세정보 화면으로 들어갑니다.

     ![](/assets/img/infrastructure/2024/osimage/osimage21.png)

      - 상세화면에서 **“인스턴스 생성”** 버튼을 클릭하면 해당 이미지로 컴퓨트를 생성 할 수 있습니다.

     ![](/assets/img/infrastructure/2024/osimage/osimage22.png)

      - 컴퓨트 생성할때 이미지 타입만 사용자가 정의된 이미지로 변경된 것을 확인 할 수 있습니다.
      - **컴퓨트 생성 중에 키값은 기존에 사용하시던 키 혹은 신규로 등록하시면 됩니다.**