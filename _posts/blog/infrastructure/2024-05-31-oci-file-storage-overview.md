---
layout: page-fullwidth
#
# Content
#
subheadline: "Storage"
title: "OCI File Storage 서비스에 대해 알아보기"
teaser: "OCI에서 제공하는 네트워크 파일시스템 File Storage 서비스에 대해 알아보기 위한 포스팅 입니다."
author: "yhcho"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, nfs, fss, nas, file, storage, file storage, network storage]
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

## OCI File Storage Service 살펴보기
Oracle Cloud Infrastructure(OCI) File Storage는 고객의 네트워크 파일 시스템 워크로드를 클라우드로 마이그레이션할 수 있도록 클라우드용으로 구축된 완전 관리형 탄력적 파일 시스템입니다.
File Storage는 용량을 미리 프로비저닝할 필요가 없고, 고객이 사용한 용량에 대해서만 비용을 지불하면 됩니다. 또한 모든 파일 시스템은 최대 8엑사 바이트(8,388,608 TB)의 증가량을 수용할 수 있도록 자동으로 확장됩니다. 
뿐만 아니라 OCI File Storage는 백업을 위한, 스냅샷, Clone 등의 기능과 재해 복구를 위한 리전 간 비동기식 복제 기능을 제공하기 때문에 편리하게 엔터프라이즈 애플리케이션의 비즈니스 연속성 확보할 수 있습니다.

## OCI File Storage Service 사용하기
이번 포스팅에서는 OCI 파일 스토리지의 파일시스템의 기능과 사용방법을 순서대로 확인하려고 합니다. 
다만 이번 포스팅에서는 Linux 및 Windows VM을 생성하는 방법을 다루지 않을 예정입니다. VM 생성 방법은 아래 포스팅을 참고 부탁 드리겠습니다.

- [OCI에서 리눅스 인스턴스 생성 튜토리얼](/getting-started/launching-linux-instance/){:target="_blank"}
- [OCI에서 윈도우즈 인스턴스 생성 튜토리얼](/getting-started/launching-windows-instance/){:target="_blank"}

### 1. 실습에서 사용할 VCN 생성하기
FSS(File Storage Service)를 생성하기 앞서, 먼저 FSS 를 배치할 VCN 환경을 준비해야 합니다.
이번 실습에서는 VCN 마법사을 사용하여 간단하게 VCN을 생성하고, FSS 배치할 서브넷, 보안목록을 추가로 생성하도록 하겠습니다.

#### 1-1. VCN 마법사를 사용하여 VCN 준비하기

- `네트워킹 - 가상 클라우드 네트워크` 메뉴에서 `VCN 마법사 시작` 버튼을 클릭하여 VCN 마법사를 실행합니다.
- 각자 원하는 VCN 이름을 입력합니다. 필자는 `vcn-fss-demo` 라고 입력하였습니다.
  ![](/assets/img/infrastructure/2024/fss/fss-1.png " ")
- 나머지 설정은 기본값으로 두고 VCN 생성을 완료합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-2.png " ")
  ![](/assets/img/infrastructure/2024/fss/fss-3.png " ")

#### 1-2. FSS 를 배치할 서브넷(Subnet) 생성하기

- 생성된 VCN 세부정보 화면에서 `서브넷 생성(Create Subnet)` 버튼을 클릭합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-4.png " ")
- 서브넷 생성화면에서 아래와 같이 입력 & 선택합니다.
  - 이름 : `public-subnet-fss`
  - 서브넷 유형 : `REGIONAL` 
    - REGIONAL: 선택한 Region에 모든 AD를 활용하는 방식, 동일 Region 내 다른 AD로 FailOver시에도 IP를 그대로 사용가능한 이점이 있기 때문에 추천하는 유형 입니다. 
    - AVAILABILITY DOMAIN-SPECIFIC: Region 내 특정 AD 내에 만들어지는 서브넷 유형
  - IPv4 CIDR : `10.0.2.0/24`
  - Subnet Access : `Public Subnet`
  - 그 외 설정은 기본 값 설정 : 라우트 테이블, 보안목록은 VCN에서 자동으로 생성된 Public Subnet의 리소스를 지정합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-5.png " ")
  ![](/assets/img/infrastructure/2024/fss/fss-6.png " ")

#### 1-3. FSS 서브넷을 위한 보안 목록 작성하기
이번 실습에서는 10.0.0.0/24 의 CIDR 대역을 가진 Public Subnet 리소스(Source)에서 FSS Subnet (10.0.2.0/24)(Target) 으로 접근하도록 규칙을 작성할 예정입니다.
실제 사용시에는 FSS 리소스의 Subnet 대역을 기준으로 해당 서비스에 접근하고자 하는 Subnet 대역을 잘 확인 하여 업무에 적용해야 합니다.

- VCN 세부정보 화면의 우측 패널에서 `보안 목록(Security List)` 메뉴를 클릭 후 보안 목록 생성 (Create Security List) 버튼을 클릭하여 아래와 같이 입력합니다.
  - Name : `security-list-fss`
  - Ingress Rule 
    <table><thead><tr><th style="text-align:left">Stateless</th><th style="text-align:left">Source</th><th style="text-align:left">IP Protocol</th><th style="text-align:left">Source Port Range</th><th style="text-align:left">Destination Port Range</th></tr></thead><tbody><tr><td style="text-align:left">No</td><td style="text-align:left">10.0.0.0/24</td><td style="text-align:left"><strong>TCP</strong></td><td style="text-align:left">All</td><td style="text-align:left">2048-2050</td></tr><tr><td style="text-align:left">No</td><td style="text-align:left">10.0.0.0/24</td><td style="text-align:left"><strong>TCP</strong></td><td style="text-align:left">All</td><td style="text-align:left">111</td></tr><tr><td style="text-align:left">No</td><td style="text-align:left">10.0.0.0/24</td><td style="text-align:left"><strong>UDP</strong></td><td style="text-align:left">All</td><td style="text-align:left">2048</td></tr><tr><td style="text-align:left">No</td><td style="text-align:left">10.0.0.0/24</td><td style="text-align:left"><strong>UDP</strong></td><td style="text-align:left">All</td><td style="text-align:left">111</td></tr></tbody></table>
  ![](/assets/img/infrastructure/2024/fss/fss-7.png " ")
  ![](/assets/img/infrastructure/2024/fss/fss-8.png " ")
- 생성 결과 예시
  ![](/assets/img/infrastructure/2024/fss/fss-9.png " ")

#### 1-4. FSS 서브넷에 보안 목록 적용하기
- FSS 서브넷 세부정보 화면에서 `보안 목록 추가(Add Security List)` 버튼을 클릭 후 1-3 단계에서 생성한 보안목록을 선택하여 추가합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-10.png " ")
- 추가 완료시 아래와 같이 보안목록이 하나 더 적용됩니다.
  ![](/assets/img/infrastructure/2024/fss/fss-11.png " ")

### 2. File Storage 생성하기
- `스토리지 - 파일 스토리지` 메뉴를 클릭하여 파일 스토리지 서비스 화면으로 이동합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-12.png " ")
- 파일 시스템 생성 버튼을 클릭하여 아래와 같이 입력 & 선택하여 파일 시스템을 생성합니다.
  - 파일시스템 유형 : `NFS용 파일 시스템`
  - 이름 : `fss-chuncheon` **(각자 원하는 파일 시스템 이름을 입력하시면 됩니다. 필자는 춘천리전에서 테스트하고 있기 때문에 fss-chuncheon으로 입력하였습니다.)**
    ![](/assets/img/infrastructure/2024/fss/fss-13.png " ")
  - 마운트 대상(Mount target) 정보
    - 새 마운트 대상 생성
    - 이름 : `fss-mount-target`
    - 가상 클라우드 네트워크 : 앞서 생성한 VCN 선택 (`vcn-fss-demo`)
    - 서브넷 : 앞서 생성한 서브넷 선택 (`public-subnet-fss`)
      ![](/assets/img/infrastructure/2024/fss/fss-14.png " ")
  - 입력 정보 확인
    ![](/assets/img/infrastructure/2024/fss/fss-15.png " ")

### 3. Linux VM 에서 파일 시스템을 연결하기
이번 단계에서는 앞서 생성한 파일 시스템를 Linux VM에서 연결하는 방법에 대해 알아보려고 합니다. Linux OS 이미지는 Oracle Linux를 기준으로 진행 예정이며, 이 외에도 Ubuntu, Debian, CentOS, Red Hat Linux 등의 이미지에서 마운트 명령 예시를 제공합니다.

#### 3-1. 마운트 명령 확인하기
- 마운트 명령 확인을 위해 `파일 스토리지 - 파일 시스템` 메뉴로 이동합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-16-0.png " ")
- 앞서 생성한 `파일 시스템`을 클릭하여 세부정보 화면으로 이동합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-16.png " ")
- 이동한 화면에서 아래와 같이 `익스포트 경로` 를 클릭합니다
  ![](/assets/img/infrastructure/2024/fss/fss-17.png " ")
- 이동된 화면 상단의 `마운트 명령` 버튼을 클릭하여 마운트 명령을 확인 합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-18.png " ")

#### 3-2. Linux VM에서 마운트 명령 실행하기
앞서 확인한 명령어를 Linux VM에서 단계별로 실행해서 결과를 확인합니다. 

> 아래 예시는 필자의 FSS를 기준으로 작성되어 있기 때문에 각자 시스템에서 생성된 명령어를 확인 후 진행하셔야 합니다!

- 필요한 NFS Client 패키지를 설치합니다.
  ```ssh
  sudo yum install nfs-utils
  ```
- 마운트를 위한 로컬 디렉토리를 생성합니다.
  ```ssh
  sudo mkdir -p /mnt/fss-chuncheon
  ```
- 파일 시스템 마운트 명령을 입력합니다.
  ```ssh
  sudo mount 10.0.2.125:/fss-chuncheon /mnt/fss-chuncheon
  ```
- 마운트 결과를 확인 합니다.
  ```ssh
  df -h
  ```
- 현재 사용자가 파일 시스템 사용할 수 있도록 권한을 변경합니다.
  ```ssh
  sudo chmod 777 /mnt/fss-chuncheon
  ```
- 아래 명령어를 통해 Text 파일 생성 결과를 확인합니다.
  ```ssh
  echo 'OCI File Storage' > /mnt/fss-chuncheon/fss3.txt
  ls -la /mnt/fss-chuncheon/
  ```
![](/assets/img/infrastructure/2024/fss/fss-19.png " ")

#### 3-3. 마운트 정보 확인하기
- 아래 명령어를 통해 Text 파일 생성 결과를 확인합니다.
  ```ssh
  findmnt /mnt/fss-chuncheon/
  ```
![](/assets/img/infrastructure/2024/fss/fss-20.png " ")

#### 3-4. fstab에 파일 시스템 마운트 정보 입력하기
OS 재부팅 후에도 자동으로 파일시스템이 마운트 될 수 있도록 아래와 같이 fstab 파일에 내용을 입력합니다. 
**다만, 아래 정보에서 파일 시스템의 IP 정보와 로컬 마운트 경로는 각자 상황에 맞게 수정하여야 합니다.**
- fstab 파일 수정 명령어를 입력합니다.
  ```ssh
  sudo vi /etc/fstab
  ```
- fstab의 하단에 아래 정보를 입력합니다.
  ```ssh
  10.0.2.125:/fss-chuncheon /mnt/fss-chuncheon nfs defaults,nofail,nosuid,resvport 0 0
  ```


### 4. Winodws VM 에서 파일 시스템 연결하기
이번 단계에서는 윈도우 서버 OS에서 OCI 파일 시스템을 사용하는 방법에 대해 알아보도록 하겠습니다. 
윈도우 서버 VM 역시 FSS를 생성한 VCN과 동일한 VCN의 Public Subnet (10.0.0.0/24) 에 생성되었습니다.
본문의 내용은 [OCI 공식 문서](https://docs.oracle.com/en-us/iaas/Content/File/Tasks/mountingwindowsos.htm){:target="_blank"}의 내용을 참고하여 작성하였습니다.

#### 4-1. 관리자 권한으로 Winodws PowerShell 실행하기
- 윈도우 시작 버튼을 클릭하여 "Winodws PowerShell" 아이콘을 클릭합니다.
  ![](/assets/img/infrastructure/2024/fss/win-1.png " ")
- PowerShell 이 실행되면 아래 명령어를 입력하여 관리자 권한으로 Windows PowerShell을 실행합니다. (권한을 묻는 팝업에서 "예"를 클릭합니다)
  ```ssh
  Start-Process powershell -Verb runAs
  ```

  ![](/assets/img/infrastructure/2024/fss/win-2.png " ")
  ![](/assets/img/infrastructure/2024/fss/win-3.png " ")

#### 4-2. PowerShell에서 NFS-Client 설치하기
- 관리자 권한으로 실행된 PowerShell 에서 아래 명령어를 입력하여 NFS-Client 기능을 설치합니다.
  ```ssh
  Install-WindowsFeature -Name NFS-Client
  Set-ItemProperty HKLM:\SOFTWARE\Microsoft\ClientForNFS\CurrentVersion\Default -Name AnonymousUid -Value 0
  Set-ItemProperty HKLM:\SOFTWARE\Microsoft\ClientForNFS\CurrentVersion\Default -Name AnonymousGid -Value 0
  Stop-Service -Name NfsClnt
  Restart-Service -Name NfsRdr
  Start-Service -Name NfsClnt
  ```

  ![](/assets/img/infrastructure/2024/fss/win-4.png " ")

#### 4-3. Windows Command Line (CMD)에서 마운트 명령어 실행하기
CMD를 관리자 모드로 실행하여 Mount할 경우 기본 관리자로 로그인할 경우에만 파일탐색기에 마운트된 네트워크 드라이브가 표시됩니다.
이번 포스팅에서는 일반 권한으로 Mount하도록 하겠습니다.
- 작업표시줄 검색창에 Command Prompt를 실행합니다.
  ![](/assets/img/infrastructure/2024/fss/win-10.png " ")
- 명령어 작성 정보 확인
  - 파일스토리지의 Private IP 확인
  - 파일스토리지의 Mount Target의 "익스포트 경로" 확인
  ![](/assets/img/infrastructure/2024/fss/win-5.png " ")
- 명령어 작성 예시
  ```ssh
  # 구조
  mount -o sec=sys [private IP address]:/[export path] [Drive 지정 문자]:
  
  # 샘플
  mount -o sec=sys 10.0.2.125:/fss-chuncheon D:
  ```
  
- 실행된 Command Prompt에서 앞서 작성한 명령어를 입력합니다.
  ![](/assets/img/infrastructure/2024/fss/win-9.png " ")

- 아래 명령어를 입력하여 마운트 결과를 확인합니다.
  ```ssh
  D:
  
  dir
  ```
![](/assets/img/infrastructure/2024/fss/win-8.png " ")

### 5. Export Option 사용하기 (접근제어)
파일 스토리지 서비스의 Export Option 기능을 사용하여 원하는 네트워크 대역에서 읽기 전용 또는 읽기/쓰기 권한을 부여할 수 있습니다.
처음 파일 스토리지 시스템을 생성할 경우 기본적으로 모든 대역에 읽기/쓰기 권한이 열려있기 때문에, 이번 단계에서는 10.0.0.0/24 대역에 읽기 전용 권한을 부여한 후 파일생성이 되는지 확인해 보도록 하겠습니다.

#### 5-1. 읽기 전용 권한 설정 후 파일 쓰기 권한 테스트 하기
- 파일 시스템의 마운트 대상 세부정보 화면에서 "익스포트 경로" 링크를 클릭하여 Export Option 화면으로 이동합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-22-0.png " ")
- "편집 옵션" 버튼을 클릭하여 `+ 다른 옵션` 버튼을 클릭하여 아래와 같이 입력, 선택 후 "위로 이동" 버튼을 클릭하여 옵션 순서를 변경해줍니다.
  - 소스 : `10.0.0.0/24`
  - 액세스 : `읽기 전용`
    ![](/assets/img/infrastructure/2024/fss/fss-22.png " ")
    ![](/assets/img/infrastructure/2024/fss/fss-23.png " ")
    ![](/assets/img/infrastructure/2024/fss/fss-24.png " ")
- 설정된 내용을 확인 합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-25.png " ")
- Linux VM에서 아래와 같이 명령어를 입력하여 파일 생성을 시도하여 결과를 확인합니다.
  ```ssh
  echo 'OCI File Storage' > /mnt/fss-chuncheon/fss2.txt
  ```

- Read Only 파일 시스템이라는 오류가 발생함을 확인합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-25-1.png " ")

#### 5-2. 읽기 전용 옵션 삭제 후 파일 쓰기 권한 테스트 하기
- Export Option 화면으로 이동 후 앞서 생성한 옵션을 삭제합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-26.png " ")
  ![](/assets/img/infrastructure/2024/fss/fss-27.png " ")
- 다시 한번 파일 쓰기 권한을 확인 합니다.
- 파일이 정상 생성 되었습니다.
  ![](/assets/img/infrastructure/2024/fss/fss-27-1.png " ")

### 6. Snapshot 사용하기 (백업)
이번에는 파일 스토리지 시스템의 백업 기능인 스냅샷 기능을 확인해 보도록 하겠습니다.
파일 스토리지 시스템 스냅샷은 생성된 시점에 저장되어있는 파일들을 Read Only 형태로 저장해주는 기능입니다. 아래 내용에서는 각기 다른 시점에서 스냅샷을 생성하고, 생성된 스냅샷 디렉토리의 내용을 확인해보도록 하겠습니다.

#### 6-1. Snapshot 생성하기
- 먼저 파일 스토리지 시스템 세부정보 스냅샷 메뉴에서 "스냅샷 생성" 버튼을 클릭합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-28.png " ")
- 생성된 스냅샷 내용을 확인합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-29.png " ")
- fss3.txt 파일을 생성하고 스냅샷을 하나 더 생성합니다.
- 생성된 두번째 스냅샷 내용을 확인합니다.
  ![](/assets/img/infrastructure/2024/fss/fss-30.png " ")
- 스냅샷 내부의 파일 삭제를 시도해보면 Read-Only 파일 시스템이라 삭제 불가능한 것을 확인할 수 있습니다.
  ![](/assets/img/infrastructure/2024/fss/fss-32.png " ")

#### 6-2. 윈도우 서버 이미지에서 스냅샷 확인하기
- 윈도우 서버에서 .snapshot 폴더로 이동합니다.
  ![](/assets/img/infrastructure/2024/fss/win-12.png " ")
- 생성되어있는 2개 스냅샷을 비교합니다.
  ![](/assets/img/infrastructure/2024/fss/win-13.png " ")