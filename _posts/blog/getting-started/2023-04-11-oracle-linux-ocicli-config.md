---
layout: page-fullwidth
#
# Content
#
subheadline: "Compute"
title: "Oracle Linux 이나 CentOS 에서 OCI CLI 도구 설치 및 설정하기"
teaser: "OCI CLI 도구나 SDK를 활용하여 Oracle Cloud Infrastructure (OCI)를 제어하기 위해서는 OCI API를 사용하기 위한 기본 설정을 하여야 합니다. 이번 포스팅에서는 Oracle Linux 를 포함하는 CentOS 계열의 OS 에 OCI CLI도구를 설치하여 OCI에 연동하는 방법에 대해서 설명합니다."
author: lim
date: 2023-04-11 00:00:00
breadcrumb: true
categories:
  - getting-started
tags:
  - [oci, cli]
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

### Oracle Linux 란?
Oracle Linux는 RedHat Enterprise Linux 및 CentOS Linux에 대한 100% 애플리케이션 바이너리 호환성을 가지고 있으며 하이브리드 및 멀티클라우드 환경 모두에서 지원하는 Oracle 에서 제공하는 무료 OS 입니다.
Oracle Cloud 에서 제공하는 Database 서비스를 비롯한 모든 PaaS 서비스의 기본 OS 는 Oracle Linux 기반으로 제공됩니다.
기존 사용하던 OS 가 RedHat 의 Enterprise Linux 나 CentOS 를 사용하고 있다면 오라클에서는 OCI 로 전환 시 100% 호환성을 제공하는 Oracle Linux 의 사용을 권고하고 있습니다.
OCI 에서 Oracle Linux 를 사용하게 되면 별도의 RedHat 과의 Linux 에 대한 support subscription 가입이나 계약이 없이도 Oracle support 팀을 통해 Oracle Linux 에 대한 문제 해결을 위한 기술 지원을 받으실 수 있다는 잇점을 제공하고 있기 때문입니다.

Oracle Linux 에 OCI CLI 설치를 위한 오라클사의 공식 가이드는 [https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm) 링크를 참고합니다. 해당 가이드에는 여러 운영체에에서 OCICLI를 설치하는 가이드가 포함되어 있는데 여기서는 Oracle Linux 8 버전과 Oracle Linux 7 버전을 기준으로 설명합니다.

### Python 설치 확인

아래와 같은 명령을 입력하여 python 의 버전을 확인합니다. python version 이 3.6.8 버전이면 OCI CLI 를 사용할 수 있는 환경입니다.

```terminal
$ pyshon -V
Python 3.6.8
```

 ![python](/assets/img/getting-started/2023/cli/01_oci-linux-cli-1.png " ")


- Oracle Linux 7 에서는 Python 버전이 2.7.5 버전으로 하위 버전이 기본적으로 설치되어 있습니다. 이 경우에는 yum 명령을 통해 ptyhon36 을 설치해 줍니다.

 ```terminal
$ pyshon -V
Python 2.7.5
$ sudo yum install -y python36 
```

 ![python](/assets/img/getting-started/2023/cli/02_oci-linux-cli-2.png " ")

 - Oracle Linux 7 에서 Python36 이 이미 설치되어 있지만 Python 의 기본 버전이 2.7.5 로 세팅되어 있는 경우가 있습니다. 그럴 경우 다른 환경에 영향을 주지 않기 위해 세션에 아래와 같이 alias 를 주어 현재 접속한 세션에서 Python 의 버전을 3.6 버전으로 전환하여 사용하실 수 있습니다.

 ```terminal
$ alias python='/usr/bin/python3'
$ python -V
Python 3.6.8
```
<br>

### Oracle Linux 8 환경

Oracle Linux 8 을 사용한다면 **dnf** 명령을 통해 OCI CLI 를 설치할 수 있습니다. 
 ```terminal
$ sudo dnf -y install oraclelinux-developer-release-el8
$ sudo dnf install python36-oci-cli
```
 ![python](/assets/img/getting-started/2023/cli/03_oci-linux-cli-3.png " ")

- CLI 는 다음과 같은 Python site package 들을 설치합니다.
    - /usr/lib/python3.6/site-packages/oci_cli
    - /usr/lib/python3.6/site-packages/services

- Uninstall 을 위한 명령은 아래의 명령으로 삭제를 하실 수 있습니다.

 ```terminal
$ sudo dnf remove python36-oci-cli
```

### Oracle Linux 7 환경

Oracle Linux 7 을 사용한다면 **yum** 명령을 통해 OCI CLI 를 설치할 수 있습니다. 
 ```terminal
$ sudo yum install python36-oci-cli
```
 ![python](/assets/img/getting-started/2023/cli/04_oci-linux-cli-4.png " ")

- CLI 는 다음과 같은 Python site package 들을 설치합니다.
    - /usr/lib/python3.6/site-packages/oci_cli
    - /usr/lib/python3.6/site-packages/services

- Uninstall 을 위한 명령은 아래의 명령으로 삭제를 하실 수 있습니다.

 ```terminal
$ sudo dnf remove python36-oci-cli
```

- 아래 절차는 상기 yum 이나 dnf 로 설치가 되지 않을 경우 OCI CLI 를 설치하는 방법 입니다. 
    - **(yum 이나 dnf 로 설치가 안되는 경우)** bash 명령을 통한 OCI CLI 설치 방법

       ```terminal
      $ bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)"
      ```
    - **(yum 이나 dnf 로 설치가 안되는 경우)** 설치 직후에는 변수가 반영되지 않으므로 환경을 재로드해 줍니다.

      ```terminal
      $ exec -l $SHELL
      ```

- OCI CLI 설치 후 제대로 설치가 되었는지 OCI CLI 버전을 확인합니다.

 ```terminal
$ oci -v
3.23.2
```

### OCI CLI Config 설정

CLI 를 사용하기 전에 먼저, 반드시 configuration 설정을 통해 필요한 OCI 사용을 위한 인증 정보 (credentials)를 담은 configuration 파일을 생성해야 합니다.


- OCI CLI를 구성하기 위해서는 사전에 다음과 같은 정보가 준비되어야 합니다.
    - Tenancy OCID 에 대해 copy 후 메모장에 보관
        ![](/assets/img/getting-started/2022/oci-cli-1.png " ")
    - User OCID 에 대해 copy 후 메모장에 보관
        ![](/assets/img/getting-started/2022/oci-cli-2.png " ")

<br>

- 다음 명령어을 통해 config 를 시작합니다.
```terminal
$ oci setup config

Enter a location for your config [/home/opc/.oci/config]: <Enter 입력>
Enter a user OCID: <위에서 확인한 User OCID>
Enter a tenancy OCID:: <위에서 확인한 Tenancy OCID>
Enter a region by index or name: <Region> ---> 리전 목록이 같이 보여집니다. OCICLI 접속을 위한 리전을 입력합니다. (e.g. ap-seoul-1)
Do you want to generate a new API Signing RSA key pair? (If you decline you will be asked to supply the path to an existing key.) [Y/n]: Y ---> OCI와 연동하기 위해서 필요한 PEM 키를 생성합니다.
Enter a directory for your keys to be created [/home/opc/.oci]: <Enter 입력>     
Enter a name for your key [oci_api_key]: <Enter 입력>
Public key written to: /home/opc/.oci/oci_api_key_public.pem
Enter a passphrase for your private key (empty for no passphrase): <Enter 입력>

```

### OCI 사용자에게 CLI 사용을 위한 API Key 등록

앞서 생성한 API Signing RSA key pair 는 기본적인 config 파일이 위에서 지정한 경로에 생성됩니다. (기본 위치 : /home/opc/.oci/) key pair 중에서 public key 를 OCI 의 API Key 로 등록해야 CLI 사용이 가능하게 됩니다.

- API Key 등록을 위해 사용자의 home directory 밑의 .oci 폴더 안에 oci_api_key_public.pem 파일이 있는지 확인 후 oci_api_public.pem public key 의 파일 내용을 복사해 둡니다. 복사 시 "-----BEGIN PUBLIC KEY-----" 부터 시작하여 "-----END PUBLIC KEY-----" 까지 전체의 내용을 복사하여 보관합니다.

```terminal
$ cat ~/.oci/*_public.pem
-----BEGIN PUBLIC KEY-----
TESTIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA+dleSpqDm0VOUmPHLi1c
zc7LQ9BAztnAZtTHvIponI14/HIHo9AlFJHu7hkKkgvGRtVVJwh8p/8fKc4eC0L
7ozZhsfN+O7/vqd62MboDlBuYcQ0KFyzaho2j7D5jUw9EBDBDcNF2mrVEFAEjXJZ
hwNw5kVHdGDZjipt879JUTF/ItYGB7cAko6heYM19odQ2clP4CIGt3a6ypUloYOt
vSPqZZjeSZgX1y2xQ+pE/nE5NUGOoq+BS5eUL+hdGXUSKNqP74qULn82Sk5cwujB
prkphOrxG6EyFgnvABAKbfGqzBGjEbdxfyIqxyQtTGffGUWxuCFAnm5JftxiiEv+
xQIDTEST
-----END PUBLIC KEY-----
``` 

- 생성된 PEM 공용키 등록을 위하여 오른쪽 상단의 **My Profile**을 클릭한 후 왼쪽 **API Keys > Add API Key**를 순서대로 클릭합니다. 다음 화면과 같이 생성된 PEM 공용키를 선택하고 **Add**를 클릭합니다.

![](/assets/img/getting-started/2023/cli/05_oci-linux-cli-5.png " ")

- **Add API Key** 메뉴 창에서 **Paste a public key** 메뉴를 클릭 후 복사해 두었던 public key 내용을 아래 그림처럼 붙여넣기 후 **Add** 버튼을 클릭하여 key 를 추가해 줍니다.

![](/assets/img/getting-started/2023/cli/06_oci-linux-cli-6.png " ")



### OCI CLI 실행 테스트
API Key 가 등록이 되면 이제부터 OCI CLI 를 통해 OCI Resource handling 및 Command 기반의 명령들을 수행하실 수 있습니다.

- OCI Region 목록을 가져오는 명령을 아래와 같이 실행해 봅니다.

```terminal
$ oci iam region list --output table
``` 
![](/assets/img/getting-started/2023/cli/07_oci-linux-cli-7.png " ")

OCI Region 목록이 제대로 출력이 되었다면 이제 oci cli 기반의 command 들을 수행하실 수 있습니다.
더 다양하고 자세한 oci cli 를 통한 resource handling 을 수행하고자 하실 경우 아래의 주제에서 좀 더 자세히 다루고 있으니 해당 블로그 글 참고바랍니다.
- [OCI 커맨드라인 인터페이스 시작하기](/getting-started/getting-started-with-the-cli/)

<br>

---
