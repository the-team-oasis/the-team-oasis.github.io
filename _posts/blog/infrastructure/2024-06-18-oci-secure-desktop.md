---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Secure Desktops"
title: "OCI Secure Desktops 사용하기"
teaser: "OCI에서 Secure Desktops 방법에 대해서 실습해 보았습니다."
author: "kisukim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, compute, secure desktops]
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


# 1. OCI Secure Desktops 소개

안녕하세요, 오늘은 Oracle Cloud Infrastructure(OCI) Secure Desktops에 대해 소개해드리려고 합니다. 이 서비스는 안전하고 관리 가능한 가상 데스크톱 환경을 제공하여, 현대 업무 환경에서 필수적인 유연성과 보안성을 보장합니다. 주요 기능과 장점들을 하나씩 살펴보겠습니다.
1. 보안성 **:** OCI Secure Desktops는 모든 데이터를 암호화하여 보안을 강화하고, 안전한 접속 방법을 통해 접근할 수 있습니다. 사용자 인증 및 접근 제어 기능이 강화되어 있어, 중요한 데이터를 안전하게 보호할 수 있습니다. 이는 특히 민감한 데이터를 다루는 업종에서 큰 장점이 됩니다.
2. 유연성 ****이 서비스는 Windows와 Linux 등 다양한 운영체제를 지원합니다. 필요에 따라 데스크톱 리소스를 쉽게 확장하거나 축소할 수 있어, 비즈니스 요구에 맞춘 유연한 환경을 제공합니다. 이를 통해 기업은 변화하는 업무 환경에 빠르게 대응할 수 있습니다.
3. 관리 용이성 : 중앙에서 모든 가상 데스크톱을 관리하고 모니터링할 수 있는 인터페이스를 제공합니다. 자동화된 배포 및 업데이트 기능을 통해 IT 관리자의 부담을 줄여줍니다. 또한, 사용자의 요청에 따라 빠르게 새로운 데스크톱을 배포할 수 있어, 효율적인 운영이 가능합니다.
4. 비용 효율성 : OCI Secure Desktops는 사용한 만큼만 비용을 지불하는 종량제 요금제를 통해 비용 절감이 가능합니다. 물리적 하드웨어 관리 비용 및 유지보수 비용을 절감할 수 있어, IT 예산을 효율적으로 사용할 수 있습니다.
5. 협업 강화 : 다양한 위치에서 원격으로 안전하게 접속할 수 있어, 재택근무 및 글로벌 팀 간 협업이 용이합니다. 데이터가 클라우드에 저장되어 있어, 공동 작업 시 데이터의 일관성을 유지할 수 있습니다. 이를 통해 팀원 간의 원활한 협업이 가능합니다.
6. 확장성 : 사용자의 증가나 감소에 따라 유연하게 확장하거나 축소할 수 있습니다. 글로벌 인프라를 통해 전 세계 어디서든 빠르고 안정적인 성능을 제공합니다. 이는 글로벌 비즈니스를 운영하는 기업에게 큰 이점이 됩니다.

# 2. 지원되는 이미지

Secure Desktops 이미지는 리눅스와 윈도우 2가지 타입을 지원합니다. 아래는 지원하는 타입의 상세 정보입니다.

- 오라클 리눅스 7, 8
    - 사용자 정의 이미지를 사용하는 경우, Secure Desktops 사용을 위한 패키지를 사용자가 설치해야 합니다. 설정의 위한 URL은 아래와 같습니다.

      ***(출처: [https://docs.oracle.com/en-us/iaas/secure-desktops/configure-desktop-images.htm#config-linux-desktop](https://docs.oracle.com/en-us/iaas/secure-desktops/configure-desktop-images.htm#config-linux-desktop))***

    - Secure Desktops에 필요한 패키지가 이미 설정된 이미지를 사용할 경우 아래 링크를 통해서 이미지를 import 할 수 있습니다.

  | 이미지 타입 | Oracle Linux 7 | Oracle Linux 8 |
  | Object URL | **아래 출처 링크 참조** | **아래 출처 링크 참조**
  | 설치된 패키지 | Gnome, XFCE4 및 KDE | Gnome, XFCE4, and KDE |

  ***(출처 : [https://docs.oracle.com/en-us/iaas/secure-desktops/supported-images.htm#supported-images](https://docs.oracle.com/en-us/iaas/secure-desktops/supported-images.htm#supported-images))***

- 윈도우 10, 11
    - **OCI는 윈도우 10 또는 윈도우 11용 이미지나 라이센스를 제공하지 않습니다. 따라서 윈도우 이미지를 사용하려면 마이크로 소프트 라이센스 계약에 따라 다릅니다.**

# 3. 설정

1. 구획 만들기
    - 아래 “secure-desktop” 이라는 구획을 만듭니다.

   ![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-0.png)


1. 그룹 만들기
    - 아래 그룹을 두가지 추가합니다. “secure-desktop-admin”은 관리자용 그룹이며, “secure-desktop-user”는 사용자 그룹입니다. 이번 테스트에서는 제 계정을 모두 두 그룹에 추가 하였습니다.

   ![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-1.png)


1. 동적 그룹 만들기

   ![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-2.png)

    - 동적 그룹은 위 화면과 같이 “dg-secure-deskop” 생성 하였으며, 아래와 같이 규칙을 넣어 줍니다.

    ```
    All {resource.type = 'desktoppool', resource.compartment.id = '구획 OCID'}
    ```

2. 정책 만들기
    - 정책은 Secure Desktops 사용하게될 그룹과 root 구획에 정책 2가지를 입력 합니다.

   ![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-3.png)

    ```
    **//루트 구획 정책**
    Allow dynamic-group dg-secure-desktop to {DOMAIN_INSPECT} in tenancy
    Allow dynamic-group dg-secure-desktop to inspect users in tenancy
    Allow dynamic-group dg-secure-desktop to inspect compartments in tenancy
    Allow dynamic-group dg-secure-desktop to use tag-namespaces in tenancy
    Allow dynamic-group dg-secure-desktop to use virtual-network-family in compartment secure-desktop
    Allow dynamic-group dg-secure-desktop to {VCN_ATTACH, VCN_DETACH} in compartment secure-desktop
    ```

   ![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-4.png)

    ```
    **//secure-desktop 구획 정책**
    Allow dynamic-group dg-secure-desktop to manage virtual-network-family in compartment secure-desktop
    Allow dynamic-group dg-secure-desktop to read instance-images in compartment secure-desktop
    Allow dynamic-group dg-secure-desktop to manage instance-family in compartment secure-desktop
    Allow dynamic-group dg-secure-desktop to manage volume-family in compartment secure-desktop
    Allow dynamic-group dg-secure-desktop to manage dedicated-vm-hosts in compartment secure-desktop
    Allow dynamic-group dg-secure-desktop to manage orm-family in compartment secure-desktop
    Allow dynamic-group dg-secure-desktop to {VNIC_CREATE, VNIC_DELETE} in compartment secure-desktop
    Allow dynamic-group dg-secure-desktop to manage instance-configurations in compartment secure-desktop
    ```


1. 사용자 정의 이미지 설정하기
    - Secure Desktops 에 OS 이미지를 사용하기 위해서는 사용할 사용자 정의 이미지에 대해서 tag 수정이 필요합니다. 앞서 지원되는 이미지 종류에서 언급한 바와 같이 Secure Desktops 사용하기 위해서 미리 설치된 패키지를 아래와 같이 먼저 import 합니다.

   ![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-5.png)

    - 사용자 정의 이미지 클릭

   ![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-6.png)

    - ① 컴파트먼트(구획) 생성 : 이미지를 임포트 위치를 선택하게 되며, 정책에 위해서 이미지가 해당 구획에서 사용 할  수 있게 되어 있으므로 해당 구획을 확인 합니다.
    - ② 이름 : 임포트되는 이미지의 이름입니다.
    - ③ 운영체제 : Oracle Linux , AlimaLinux , CentOS , Windows 등 다양하게 선택 할 수 있으며, 테스트에서는 Oracle Linux를 선택 합니다.
    - ④ 오브젝트 스토리지 URL : 앞에서 지원되는 이미지 언급된 Object Stroage URL을 입력 합니다. 테스트에서는 Oracle Linux 7의 URL 입력 합니다.
    - ⑤ 이미지 유형 : 이미지 타입이며, 테스트에서는 QCOW2 선택 합니다.
    - ⑥ 실행 모드 : 실행 모드 선택이며, 반가상화 모드를 선택 합니다.

   위 선택 후 이미지를 임포트 클릭하면 해당 이미지 임포트를 진행하게 됩니다. 아래 임포트가 완료된 이미지는 아래와 같이 추가 Tag 입력해야 Secure Desktops 에서 사용 할 수 있습니다. 아래 Tag 중에서 **oci:desktops:is_desktop_image , oci:desktops:image_os_type** 를

   선택합니다. 해당 Tag 는  필수 값 입니다. ****


| Tag Key | Tag Value | Description |
| --- | --- | --- |
| oci:desktops:is_desktop_image | true | Enables the image to be used by Secure Desktops to provision desktops. This tag is required. |
| oci:desktops:image_os_type | Oracle Linux | Windows | Specifies the operating system type for the image. This tag is required. |
| oci:desktops:image_version | <version> | Specifies a meaningful image <version> reference. This tag is optional. |
| oci:desktops:dedicated_host_shape | <dvh-shape> | Specifies a specific <dvh-shape> to use for your image to create desktops. This tag is optional.For example, oci:desktops:dedicated_host_shape DVH.Standard2.52 specifies to use the DVH.Standard2.52 shape for the desktop pool and desktops created using this image. |
| oci:desktops:use_dedicated_host | false | Disables DVH provisioning for Windows 10/11 desktops. This is an option if your license agreement allows virtualizing Windows 10/11 desktops in a cloud environment. This tag is optional. |
| oci:desktops:is_auth | false | Enables automatic provisioning of the default desktop user account and uses it by default. This is the default value for this tag. This tag is optional. |
|  | true | Disables automatic provisioning of the default desktop user account. Instead, defer to the image's authentication scheme.Use this tag if you want to specify your own user accounts integrated with Active Directory or another directory service using LDAP. See User Accounts. This tag is optional. |

![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-7.png)

- 위 화면에서 태그 추가를 클릭 합니다.

![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-8.png)

1. Secure Desktops 만들기
- 이미지 태크 추가 완료 이후 아래와 같이 Secure Desktops 으로 이동 후 데스톱 풀 생성 클릭 합니다.

  ![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-9.png)


![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-10.png)

- ① 이름 : 저장되는 이름 입력 합니다.
- ② 설명 : 저장될 Secure Desktops의 설명 내용입니다.
- ③ 풀 시작 시간 : 풀이 처음 시작되고 액세스 가능 상태가 될 때의 시간을 설정합니다. 이 시간을 사용하여 풀을 미리 생성할 수 있습니다. 비워 둘 경우 풀이 즉시 시작됩니다.
- ④ 풀 종료 시간 : 풀이 정지되고 액세스 불가능 상태가 될 때의 시간을 설정합니다. 이 시간을 사용하여 정의된 기간 동안 풀 액세스를 제한할 수 있습니다.
- ⑤ 관리자 연락처 세부정보 : 관리자의 E-mail 을 입력할 경우, 사용자가 Secure Desktops 지원 요청시 입력된 E-mail 정보가 표시 됩니다.
- ⑥ 관리자 권한 : 사용으로 설정할 경우 데스크톱 사용자는 관리자 권한이 필요한 데스크톱 인스턴스에 대한 태스크를 수행할 수 있습니다.
- ⑦ 풀 크기 → 최대 크기 : 이 풀에 프로비전할 수 있는 최대 데스크톱 수를 설정합니다.
- ⑧ 풀 크기 → 대기 크기 : 사용할 준비가 되었지만 아직 사용자에게 할당되지 않은 데스크톱 수를 설정합니다.
- ⑨ 이미지 및 구성 → 이미지 : Secure Desktops 에서 사용할 사용자 정의 이미지를 선택하면 됩니다. **(위 태그가 설정된 이미지가 목록에 표시 됩니다.)**
- ⑩ 이미지 및 구성 → 데스크 톱 구성 : 이 풀의 데스크톱에 대한 컴퓨트 구성을 선택합니다
- ⑪ 데스크톱 스토리지 볼륨크기 (GB) : 데스크탑 스토리지 사용 체크 할 경우,  Secure Desktops 세션에 접속하는 사용자에게 고유의 스토리지를 할당하게 됩니다.
- ⑫ 백업정책 : 데스크톱 스토리지에 사용된 블록 볼륨에 적용할 볼륨 백업 정책을 선택합니다.
- ⑬ 네트워킹 : 풀이 Deploy 될 VCN 선택후 서브넷을 선택 할 수 있습니다.
- ⑭ 장치 엑세스 정책 : 로컬 시스템과 원격 데스크톱 간에 엑세스에 대한 허용 또는 제약에 대해서 선택 할 수 있습니다.
- ⑮ 정규 일정 : 풀의 데스크톱을 시작할 반복 시간 혹은 정지할 반복 시간을 설정 할 수 있습니다.

![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-11.png)

- 위 그림은 정상적으로 생성된 Secure Desktops 화면입니다.

# 4. 접속하기

- 웹 화면을 통해서 접속하기 위해서는 아래와 같이 URL 입력해야 합니다. 아래 그림과 같이 테넌시 이름 입력 후 사용자 그룹에 해당되는 사용자 계정으로 접속 하시면 됩니다.

```
https://published.desktops.<region-id>.oci.oraclecloud.com/client

//출처 : https://docs.oracle.com/en-us/iaas/secure-desktops/access-desktops-interface.htm#access-desktops-interface
```

![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-12.png)

- 접속을 하게 되면 아래와 같이 접속을 위한 클라이언트 프로그램을 다운 받고 설치한 이후에 접속 하시면 됩니다.

![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-13.png)

![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-14.png)

- 아래 그림과 같이 로딩 화면이 보여집니다.

![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-15.png)

- 아래와 같이 리눅스 접속한 화면을 확인 할 수 있습니다.

![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-16.png)

- 정상적으로 접속하면 아래와 같이 리소스 할당이 된 것을 확인 할 수 있습니다.

![](/assets/img/infrastructure/2024/securedesktops/secure-desktops-17.png)

# 마무리하며...
이렇게 Secure Desktops 관해서 알아 보았습니다. 윈도우 환경에서의 테스트는 라이센스 정책의 종류에 따라 다름을 다시 이야기 드리며, 마무리 하겠습니다.