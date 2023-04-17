---
layout: page-fullwidth
#
# Content
#
subheadline: "Storage"
title: "[Hands-On] OCI Storage Gateway 설치 구성 따라하기"
teaser: "On-Premise 환경에서 대용량 File 을 OCI 의 저렴한 Storage 서비스인 Object Storage 로 손쉽게 공유하고 전송하기 위한 방법 중 하나인 OCI Storage Gateway 에 대한 설치 및 구성에 대한 Hands-On 블로그입니다. 단계별로 따라하시면 손쉽게 구성하실 수 있습니다."
author: lim
date: 2023-04-13 00:00:00
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, storage-gateway, object-storage]
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

### OCI Storage Gateway 란?
Storage Gateway 는 On-Premise 의 Application 서버와 Oracle Cloud Infrastructure 와 연결할 수 있는 클라우드 Storage Gateway 입니다. NFS Target에 데이터를 쓸 수 있으며 Application 을 수정하지 않고도 Oracle Cloud Infrastructure Object Storage 에 데이터를 쓸 수 있습니다.

- Storage Gateway 활용 사례
    - 클라우드 동기화로 백업 및 보관
      - Storage Gateway의 클라우드 동기화 기능은 두 개의 NFS 서버에서 파일을 동기화할 수 있도록 지원하며 데이터 전송, 백업, 보관에 이상적입니다. 
    - 클라우드로 Data Migration
      - Storage Gateway는 데이터 마이그레이션에 이상적이며 On-Premise 데이터 센터에서 클라우드로 데이터를 이동하기 위한 효율적인 도구를 제공합니다. Storage Gateway를 통해 콜드 데이터 및 핫 데이터를 클라우드로 비동기식으로 이동하여 데이터를 계층화할 수 있습니다.

- Storage Gateway Architecture
 ![python](/assets/img/infrastructure/2023/storage_gateway/01_oci_storage_gateway_architecture.png " ")


- 주요 제약 사항 (limitations)
  - NFS protocol 만 지원 (SMB 는 향후 추가 예정)
  - 일반적인 NAS 용도로는 사용 불가 (NAS 는 OCI File Storage 서비스 사용)
  - 컨텐츠 협업 - 빈번한 파일 수정이 있는 경우 사용 불가 (문서 수정)
  - 동기식 워크로드 - 동기화가 중요한 업무에 사용 불가
  - 굉장히 큰 파일 트리의 부모 트리 이름 변경 불가
  - 전체 파일의 최대 크기 10 TB

- 주요 제약 사항은 다음의 오라클 문서에서 참조하실 수 있습니다.
  - [Storage Gateway FAQ](/https://www.oracle.com/cloud/storage/storage-gateway/faq/)
  - [Storage Gateway Overview](https://docs.oracle.com/en-us/iaas/Content/StorageGateway/Concepts/storagegatewayoverview.htm)

### 사전 준비 사항

  - 설치할 Linux Instance (On-Premise, Cloud 상관 없음) - (Oracle Linux 7, CentOS 7 버전)
  - [최소 설치 서버 스펙 체크](https://docs.oracle.com/en-us/iaas/Content/StorageGateway/Tasks/installingstoragegateway.htm)
  - 디스크 설정 권고 사항 체크 (최소 600 GB)

### STEP.1 : Block Volume 추가하기

- OCI Console 의 **Block Storage**-**Block Volumes** 메뉴에서 아래 화면과 같이 최소 600 GB 사이즈의 Block Volume 을 생성합니다. Block Volume 이름만 입력 후 **Create Block Volume** 버튼을 클릭하여 생성합니다.

 ![SGW](/assets/img/infrastructure/2023/storage_gateway/05_oci_storage_gateway_block_volume_create.png " ")

- 아래는 1,024 GB 사이즈로 생성한 Block Volume 화면입니다.

 ![SGW](/assets/img/infrastructure/2023/storage_gateway/02_oci_storage_gateway_block_volume_01.png " ")

- Block Volume Detail 화면의 하단의 **Attach to Instance** 버튼을 클릭하면 Block Volume Attach 화면이 나타나며 아래 화면과 같이 Attachment Type 과 Access Type 을 선택 후 화면 아래로 스크롤 다운 합니다.
  - Attachement Type : iSCSI
  - Access Type : Read/Write

 ![SGW](/assets/img/infrastructure/2023/storage_gateway/03_oci_storage_gateway_block_volume_attach.png " ")


- Block Volume 을 Attach 할 Instance 를 선택하고 Device Path 를 선택 후 **Attach** 버튼을 클릭합니다.
  - Instance : <Storage Gateway 설치를 위해 생성한 Instance 선택>
  - Device Path : /dev/oracleoci/oraclevdb 선택

 ![SGW](/assets/img/infrastructure/2023/storage_gateway/04_oci_storage_gateway_block_volume_attach_02.png " ")

- Attach 후 OS 에서 해줘야할 작업 명령을 알려주는 창이 나타나면 Close 버튼을 클릭하여 닫아 줍니다.

- Block Volume Detail 화면의 하단에 Attached Instances 목록에 Attach 되어 있는 서버 목록들의 제일 우측의 메뉴를 클릭하면 팝업 메뉴가 나타나면 그 중에서 **iSCSI Commands & Information** 버튼을 클릭합니다.

 ![SGW](/assets/img/infrastructure/2023/storage_gateway/06_oci_storage_gateway_block_volume_menu.png " ")

- 팝업창으로 **iSCSI Commands & Information** 이 나타나며 Attach Command 를 Copy 후 Close 버튼을 클릭합니다.

 ![SGW](/assets/img/infrastructure/2023/storage_gateway/07_oci_storage_gateway_block_volume_attach_command.png " ")

- Storage Gateway 를 설치하기 위해 미리 준비된 Instance 에 접속하여 복사한 Attach Command 를 붙여넣고 실행합니다.

```terminal
sudo iscsiadm -m node -o new -T iqn.2015-12.com.oracleiaas:fe88519b-cdfa-4601-b3b0-93f85f62dbb8 -p 169.254.2.2:3260
sudo iscsiadm -m node -o update -T iqn.2015-12.com.oracleiaas:fe88519b-cdfa-4601-b3b0-93f85f62dbb8 -n node.startup -v automatic
sudo iscsiadm -m node -T iqn.2015-12.com.oracleiaas:fe88519b-cdfa-4601-b3b0-93f85f62dbb8 -p 169.254.2.2:3260 -l
```

- fdisk 명령을 통해 /dev/sdb 에 1,024 GB 사이즈의 disk 가 설정되어 있는지 확인합니다.

```terminal
$ sudo fdisk -l
```

![SGW](/assets/img/infrastructure/2023/storage_gateway/08_oci_storage_gateway_block_volume_attach_command_02.png " ")


### STEP.2 : Storage Gateway 설치를 위한 File System 구성

- 다음의 명령으로 Volume Group 을 구성합니다.

```terminal
$ sudo vgcreate <volume_group> <device>
```
- volume_group 을 sg_vg 로 주고 device 는 앞서 attach 된 device 명인 /dev/sdb 로 주고 실행해 보도록 합니다.

```terminal
$ sudo vgcreate sg_vg /dev/sdb
```
![SGW](/assets/img/infrastructure/2023/storage_gateway/10_oci_storage_gateway_create_volume_group.png " ")

- 다음은 다음의 명령을 이용하여 logical volume 을 생성합니다.

```terminal
$ sudo lvcreate -l 100%FREE -n <logical_volume> <volume_group>
```

- 아래와 같이 logical volume 을 sg_lv 로 주고 volume group 을 앞서 생성했던 sg_vg 로 지정하여 생성해 보도록 하겠습니다.

```terminal
$ sudo lvcreate -l 100%FREE -n sg_lv sg_vg
```
![SGW](/assets/img/infrastructure/2023/storage_gateway/11_oci_storage_gateway_create_logical_volume.png " ")

- 다음은 XFS File System 을 아래의 명령을 이용하여 만들어 줍니다.

```terminal
sudo mkfs.xfs /dev/<volume_group>/<logical_volume>
```

- 아래와 같이 앞서 만들었던 logical_volume 명과 volume group 을 지정하여 만들어 보도록 하겠습니다.

```terminal
$ sudo mkfs.xfs /dev/sg_vg/sg_lv
```
![SGW](/assets/img/infrastructure/2023/storage_gateway/12_oci_storage_gateway_create_xfs_fs.png " ")

- 다음은 만든 파일 시스템을 Mount 해서 사용하게될 **/ocisg** 라는 폴더를 생성합니다. (폴더명은 다른 이름을 사용하실 수 없습니다.)

```terminal
$ sudo mkdir /ocisg
```

- 다음은 아래의 명령을 이용하여 Mount 를 실행해 줍니다.

```terminal
$ sudo mount /dev//<volume_group>/<logical_volume> /ocisg
```

- 앞서 지정했던 volume group 과 logical volume 명을 지정하여 명령을 실행 후 df -h 명령으로 확인하면 정상적으로 1TB 의 Volume 이 /ocisg 라는 폴더에 Mount 된 것을 확인하실 수 있습니다.

```terminal
$ sudo mount /dev/sg_vg/sg_lv /ocisg
$ df -h
```

![SGW](/assets/img/infrastructure/2023/storage_gateway/13_oci_storage_gateway_mount.png " ")

### STEP.3 : Storage Gateway 다운로드 및 설치

- Storage Gateway 설치 파일을 [다운로드](https://www.oracle.com/downloads/cloud/oci-storage-gateway-downloads.html) 주소에서 설치 파일을 다운로드 받습니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/14_oci_storage_gateway_download.png " ")

- 다운로드 받은 Filezilla 와 같은 FTP 프로그램을 이용하여 storage gateway 서버 instance 의 /tmp 디렉토리로 전송해 줍니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/15_oci_storage_gateway_upload.png " ")

- 아래의 command 를 이용하여 압축을 해제하여 줍니다.

```terminal
$ cd /tmp
$ sudo tar xvzf ocisg-1.4.tar.gz
```

![SGW](/assets/img/infrastructure/2023/storage_gateway/16_oci_storage_gateway_unzip.png " ")

- ocisg-1.4 폴더로 이동하여 설치 프로그램을 실행합니다.

```terminal
$ cd ocisg-1.4
$ sudo ./ocisg-install.sh
```

- 설치 과정 중에 아래와 같은 문구로 Docker Engine 도 함께 설치할 것인지 물어보게 되는데 "Y" 를 입력 후 설치를 진행합니다.

```terminal
Docker does not appear to be installed. Do you want to install docker engine with yum? [y/N] y
```

![SGW](/assets/img/infrastructure/2023/storage_gateway/17_oci_storage_gateway_install_01.png " ")

![SGW](/assets/img/infrastructure/2023/storage_gateway/18_oci_storage_gateway_install_02.png " ")

- 설치 과정 중에 NFS 사용을 Enable 할 것인지 물어보게 되는데 "Y" 를 입력 후 설치를 계속 진행합니다.

```terminal
NFS server does not appear to be enabled. Do you want to enable NFS? [y/N] y
```

- 설치 과정 중에 Storage Gateway 를 설치할 위치를 물어보면 Deafault 위치인 /opt/ocisg/ 에 설치하도록 Enter 를 입력합니다.

```terminal
Enter the install location press enter for default (/opt/ocisg/) : <Enter>
```


- 설치 과정 중에 Storage Gateway 가 사용할 Cache 위치를 묻게 되는데 Storage Gateway 가이드에서는 cahce, metadata 의 위치를 별도의 Block Volume 을 분리하여 설치를 권고하는데 편의상 앞서 Attach 한 Volume 을 함께 사용하도록 하겠습니다.

```terminal
Enter the install location press enter for default (/opt/ocisg/) : /ocisg/sg/cache
```

![SGW](/assets/img/infrastructure/2023/storage_gateway/19_oci_storage_gateway_install_03.png " ")

- metadata 의 위치도 아래와 같이 입력합니다.

```terminal
Enter the path for OCISG metadata storage : /ocisg/sg/metadata
```

- 동일한 Volume 에 metadata 와 cache 위치를 설정했다고 Warning 이 나타나는데 동일한 Volume 설정했기 때문에 "Y" 를 입력하고 설치를 진행합니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/20_oci_storage_gateway_install_04.png " ")

- log 스토리지의 위치도 아래와 같이 입력합니다.

```terminal
Enter the path for OCISG log storage : /ocisg/sg/log
```

![SGW](/assets/img/infrastructure/2023/storage_gateway/21_oci_storage_gateway_install_05.png " ")

- 마찬가지로 동일한 Volume 에 log 위치를 설정했다고 Warning 이 나타나는데 동일한 Volume 설정했기 때문에 "Y" 를 입력하고 설치를 진행합니다.

- Docker Image 를 Loading 하면서 설치가 진행됩니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/22_oci_storage_gateway_install_06.png " ")

- 설치가 완료되면 아래와 같이 Storage Gateway Management Console 주소와 Port (32770) 정보 그리고 NFS 가 사용하는 Port (32771) 정보가 나타나며 Example Mount command 정보가 나타납니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/23_oci_storage_gateway_install_07.png " ")

- Console Port (32770) 와 NFS 가 사용하는 Port (32771) 는 VCN 의 Security List 에 Open 이 되어야 합니다.

### STEP.4 : Storage Gateway Admin Console 작업

Storage Gateway 설치가 완료되면 Storage Gateway Management Console 로 로그인이 가능합니다. 추가적인 API Key 등록 등의 절차를 진행해 주어야 합니다.

- 웹브라우저에 다음의 주소를 입력하여 Storage Gateway Management Console 에 Access 합니다.
    - https://<instance_public_ip>:32770/

- 안전하지 않은 웹사이트 페이지가 나오면 중간의 **고급** 버튼을 클릭한 후 "<public_ip> (안전하지 않음)(으)로 계속하기" 버튼을 클릭하여 웹사이트로 접근을 시도합니다. 

![SGW](/assets/img/infrastructure/2023/storage_gateway/24_oci_storage_gateway_admin_01.png " ")

- Storage Gateway Management Console 의 Default 사용자는 **admin** 으로 최초 접속 시 Password Reset 을 해야합니다. 아래 화면과 같이 신규 Password 를 생성해 줍니다. 

![SGW](/assets/img/infrastructure/2023/storage_gateway/25_oci_storage_gateway_admin_02.png " ")

- 앞서 생성한 Password 를 이용하여 로그인을 해 줍니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/26_oci_storage_gateway_admin_03.png " ")

- 로그인 후엔 File System 이 아직 생성되어 있지 않기 때문에 "No File Systems are created yet." 이라는 창이 나타납니다. **Create a File System** 버튼을 클릭합니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/27_oci_storage_gateway_admin_04.png " ")

- File System 생성 화면에서 아래와 같은 창이 나타납니다. 각 항목에 맞는 이름 및 항목을 선택합니다.
  - File System Name : 파일 시스템명을 입력합니다. (추후 Object Storage Bucket 으로 생성됨)
  - Object Storage Tier : Standard 로 선택
    - Standard : 표준 Object Storage 로 자주 액세스하는 일반 Tier
    - Archive : 장기 보관이 필요한 데이터 보관 용도 (요청 후 일정 시간이 지나면 액세스 가능)
  - Object Storage API Endpoint : Object Storage 를 접근하기 위한 Region 별 Endpoint 를 말하며, 아래의 링크에서 사용할 Object Storage 의 Endpoint 를 찾아 입력
  - [API Endpoints](https://docs.oracle.com/en-us/iaas/api/#/en/objectstorage/20160918/) 

![SGW](/assets/img/infrastructure/2023/storage_gateway/28_oci_storage_gateway_admin_05.png " ")

- [API Endpoints](https://docs.oracle.com/en-us/iaas/api/#/en/objectstorage/20160918/) 를 찾아 입력하면 아래와 같이 화면이 전환됩니다. (입력 예 : 호주 Melbourne 리젼)

![SGW](/assets/img/infrastructure/2023/storage_gateway/29_oci_storage_gateway_admin_06.png " ")

- 상기 입력 화면에 각각의 항목들을 입력합니다.
  - Compartment OCID : OCI Console 의 **Identity & Security** -> **Identity** -> **Compartments** 메뉴에서 bucket 을 위치시킬 Comparment 상세 화면에서 OCID 를 찾아 복사 후 붙여넣기 합니다.
  - Tenant OCID : [Oracle Linux 이나 CentOS 에서 OCI CLI 도구 설치 및 설정하기](/getting-started/oracle-linux-ocicli-config/) 를 찾조하여 Tenant OCID 정보를 찾아 복사 후 붙여넣기 합니다.
  - User OCID : [Oracle Linux 이나 CentOS 에서 OCI CLI 도구 설치 및 설정하기](/getting-started/oracle-linux-ocicli-config/) 를 찾조하여 User OCID 정보를 찾아 복사 후 붙여넣기 합니다. 

![SGW](/assets/img/infrastructure/2023/storage_gateway/30_oci_storage_gateway_admin_07.png " ")

- 입력 화면의 Public Key's Finger Print, Private Key 항목 입력을 위해서는 Public Key 를 OCI 의 사용자 Profile 화면에서 Key 를 다운로드 받아 입력합니다. (기존 Key 파일이 있을 시 기존 Key 활용)

- OCI Console 에서 우측 상단의 사용자 아이콘을 클릭 후 **My Profile** 메뉴로 이동 후 아래로 스크롤 다운하여 좌측 Resource 메뉴 중에서 **API Keys** 를 선택 후 **Add API Key** 버튼을 클릭합니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/31_oci_storage_gateway_my_profile.png " ")

![SGW](/assets/img/infrastructure/2023/storage_gateway/32_oci_storage_gateway_add_api_key.png " ")

- "Add API Key" 창이 나타나면 **Generate API Key Pair** 를 선택 후 private key 와 public key 를 다운로드 받고 **Add** 버튼을 클릭합니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/33_oci_storage_gateway_download_key.png " ")

- API Key 가 추가되고 "Configuration file preview" 창이 나타나며 생성된 Fingerprint 정보를 Storage Gateway Management Console 의 File System 성성 화면의 Fingerprint 정보에 아래 화면과 같이 복사 후 붙여넣기를 해 줍니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/34_oci_storage_gateway_finger_print.png " ")

- 다음은 Private Key 를 입력해야 합니다. API Key 추가할 때 다운로드 받은 Private Key 를 아래 그림과 같이 메모장과 같은 편집기를 이용하여 Open 하여 내용을 선택하여 복사합니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/35_oci_storage_gateway_private_key.png " ")

- Storage Gateway Management Console 화면의 File System 생성화면의 Private Key 항목에 아래 그림처럼 붙여넣기로 입력합니다.

- Private Key Passphrase 항목은 비밀번호를 설정할 수 있으나 화면처럼 빈칸으로 두어 설정하지 않고 **Save** 버튼을 클릭하여 File System 을 생성합니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/36_oci_storage_gateway_private_key.png " ")

- 입력된 정보가 모두 올바르면 아래와 같이 File System 이 정상적으로 생성이 됩니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/37_oci_storage_gateway_file_system_create_result.png " ")

- 생성된 File System 의 **Connect** 버튼을 클릭하면 OCI 의 Object Storage 에 File System 과 동일한 Bucket 이 생성됩니다. File System 이 이상없이 연결되면 아래 그림처럼 녹색 아이콘으로 이미지가 변경됩니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/38_oci_storage_gateway_file_system_connect.png " ")

- OCI Console 의 Object Storage 로 접속하게 되면 생성한 File System 과 동일한 이름의 Bucket 이 생성된 것을 확인할 수 있습니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/39_oci_storage_gateway_object_storage.png " ")

- Object Storage 의 상세 화면을 아래로 스크롤 다운하면 아래쪽에 Object 목록이 나타나며 아직 아무것도 입력이 되지 않은 것을 볼 수 있습니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/40_oci_storage_gateway_object_storage_obj.png " ")


### STEP.5 : 다른 Host 에서 NFS 로 Mount 하여 Object Storage 에 파일 쓰기

이제 생성된 Storage Gateway 의 File System 을 다른 Host 에서 Mount 하여 사용할 수 있는 방법입니다.

- 먼저, Storage Gateway 를 통해 Mount 를 설정할 Host 로 로그인 후 root 에 Storage Gateway 와 공유할 Folder 를 생성해 줍니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/42_oci_storage_gateway_host.png " ")

- Storage Gateway Management 화면에서 File System 을 클릭하면 Mount 할 수 있는 명령이 나타납니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/41_oci_storage_gateway_mount_01.png " ")

- Mount 명령의 Example 에 환경에 맞게 수정하여 Mount 할 Host 에 접속하여 명령을 수행합니다.

```terminal
$ mount -t nfs -o vers=4,port=<nfs_mount_port> <sgw-instance-pub-ip>:/sg_bucket /<local_mount_point>
```

- 이번 테스트 환경에서는 아래의 명령으로 Mount 해 보도록 하겠습니다.

```terminal
$ sudo mount -t nfs -o vers=4,port=32771 152.70.90.133:/sg_bucket /sgw-fs
```

![SGW](/assets/img/infrastructure/2023/storage_gateway/43_oci_storage_gateway_mount.png " ")

- df 명령으로 디스크를 확인해보면 NFS 로 sg_bucket 명이 Mount 된 것을 확인할 수 있습니다.

```terminal
$ df -h
```

![SGW](/assets/img/infrastructure/2023/storage_gateway/44_oci_storage_gateway_mount_result.png " ")

- 이제 해당 파일시스템에 파일을 기록하고 저장하면 Object Storage 로 자동으로 동기화가 됩니다. 아래의 명령으로 파일을 기록해 봅니다.

```terminal
$ cd /sgw-fs
$ touch sgw-test-1
$ touch sgw-test-2
$ touch sgw-test-3
$ touch sgw-test-4
$ touch sgw-test-5
```
![SGW](/assets/img/infrastructure/2023/storage_gateway/45_oci_storage_gateway_file_write.png " ")

- Object Storage 의 Objects 목록을 확인하시면 생성한 파일들이 동기화되어 스토리지에 올라온 것을 확인하실 수 있습니다.

![SGW](/assets/img/infrastructure/2023/storage_gateway/46_oci_storage_gateway_objects.png " ")

- Object Storage Objecs 화면에서 파일을 삭제하면 동기화되어 연결되어 있는 호스트의 Mount Folder 에서도 파일이 삭제가 됩니다.

이상 Storage Gateway 를 통해 Object Storage 로의 직접 API 연결이 어려운 환경에서 유용하게 사용할 수 있는 Storage Gateway 서비스를 구성하는 방법을 알아봤습니다. Storage Gateway 서버는 500GB 정도의 캐쉬가 있어 로컬 디스크에 기록하는 것과 같이 빠른 성능으로 Object Storage 에 데이터를 기록하실 수 있습니다. 

<br>

---
