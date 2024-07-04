---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Object Storage"
title: "s3fs 이용한 OCI Object Storage Mount 방법"
teaser: "OCI에서 Object Storage를 오픈소스를 통해 VM에 마운트해 보도록 하겠습니다."
author: "kisukim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, compute, Object Storage]
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

OCI Object Storage를 지원하는 Fuse 모듈을 리눅스 운영체제에 설치하면, OCI Object Storage 버킷을 파일 시스템의 디렉터리로 마운트할 수 있습니다. 

이중 s3fs-fuse 이용한 마운트 방법에 대해서 소개 하고자 합니다.

s3fs-fuse 는 아래와 같은 한계를 가지고 있습니다.

- Hard Link를 만들 수 없습니다.
- 하나의 파일에 대한 동시에 여러 클라이언트의 동시 접근을 방지하지 못합니다.

# 2. s3fs 이용한 OCI Object Storage Mount 방법

OCI 에서 s3fs-fuse 테스트를 하기 위해서 하나의 인스터를 생성하고 생성된 인스턴스에 s3fs-fuse 설치하고 OCI Object Storage 마운트 하는 방법에 대해서 설명 하고자 합니다. 테스트 환경은 오라클 리눅스 최신 버전을 사용 하였습니다. 

## 2-1. 준비사항 

- 신규 혹은 기존에 만들어진 테넌시에서 OCI Object Storage 생성되어 있어야 합니다. (아래 출처 및 정보 URL 참고 하시면 됩니다.) 
- Object Storage 마운트 할 수 있도록 인스턴스가 있어야 합니다. (아래 출처 및 정보 URL 참고 하시면 됩니다.)


## 2-2. s3fs 패키지 설치

인스턴스에 터미널로 접속하여 패키지를 설치하도록 합니다. 아래는 Oracle Linux 7, 8 에 맞는 패키지 설치 명령어 입니다.  

```bash
## Oracle Linux 8
sudo su -
cd /etc/yum.repos.d/
ls
cat oracle-epel-ol8.repo 
yum install --enablerepo=* s3fs-fuse
yum install --enablerepo=ol8_developer_EPEL s3fs-fuse

## Oracle Linux 7
yum install https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/s/s3fs-fuse-1.85- 1.el7.x86_64.rpm
sudo yum update
sudo yum install s3fs-fuse
```

- 설치가 정상적으로 이루어지면 아래와 같은 화면이 출력되며, 정상적으로 설치가 이루어집니다. 

![](/assets/img/infrastructure/2024/obsmount/objectstorage-mount-2.png)

## 2-2. s3fs-fuse 환경 설정을 위한 OCI 정보 확인
앞에서 인스턴스에 정상적으로 설치가 이루어지면 s3fs-fuse 셋팅을 위한 정보가 필요합니다. 아래는 필요한 정보를 확인하고 설정하는 방법에 대해서 확인 하도록 하겠습니다.

- 아래 화면에서 “**내프로파일**” 클릭하여 s3fs 설치 후 접속을 위한 키 등록을 위하여 아래와 같이 접근 합니다.
    ![](/assets/img/infrastructure/2024/obsmount/objectstorage-mount-3.png)

- **내프로파일** 이동하여 왼쪽 아래 리소스에 "**고객 암호 키**" 클릭 합니다.
    ![](/assets/img/infrastructure/2024/obsmount/objectstorage-mount-4.png)

- 고객 암호 키를 생성 합니다. (**한번 생성된 암호키는 추후 화인이 불가하므로 따로 보관해 두도록 합니다!**)
    ![](/assets/img/infrastructure/2024/obsmount/objectstorage-mount-5.png)

## 2-3. 인스턴스 내 s3fs 셋팅
s3fs 패키지 설치 및 환경 셋팅을 위한 정보를 앞에서 확인 하였습니다. 확인된 정보를 가지고 인스턴스에서 셋팅하기 위한 방법에 대해서 확인해 보도록 하겠습니다.

- 아래와 같이 s3fs 사용할 키 등록을 위한 정보를 아래의 경로에 만들어 줍니다. (테스트에서는 root 권한으로 테스트 하였습니다.) 또한 파일의 권한을 설정 하였습니다.

    ```bash
    echo Access_key:Secret_key > ${HOME}/.passwd-s3fs chmod 600 .passwd-s3fs
    ```

- 생성된 passwd-s3fs 파일을 열어 OCI 확인한 **ACCESS_KEY** 와 **SECRET_KEY** 을 아래와 같이 수정하고 파일을 저장합니다. 

    ```bash
    ##ACCESS_KEY:SECRET_KEY 이렇게 입력해야 합니다.
    d50db9932d2e9c9f7f4aaab8e5daae94741427af2ab:I2/In5SdddddzUUnJESJkshZVUU40NCkZYqt2QpZx8/hS+M=
    ```

- 마운트할 디렉토리를 생성합니다. 아래의 경우 /mnt/objectstorage 경로에 만들도록 합니다.
    ```bash
    mkdir /mnt/objectstorage
    ```

- passwd-s3fs 키 정보 , 마운트 할 디렉토리까지 완료가 되면 아래 명령어를 통해서 마운트를 진행하게 됩니다. 
    
    ```bash
    s3fs <BUCKET_NAME> <MOUNT_POINT> -o url=https://<NAMESPACE_NAME>.compat.objectstorage.<REGION>.oraclecloud.com -o nomultipart -o use_path_request_style -o endpoint=<REGION_CODE>
    ```
  
  
  1. <**_BUCK_NAME_**> : 생성된 오브젝트 스토리지 혹은 사용하고 계시는 오브젝트 스토리지 이름입니다.
  2. <**_MOUNT_POINT_**> : 앞서 마운트 할 디렉토리 경로입니다.
  3. <**_NAMESPACE_NAME_**> : 테넌시 정보에서의 네임 스페이스 이름이며, 고유 값입니다.
  4. <**_REGION_CODE_**> : 리전 코드는 아래 링크에서 해당 되는 아래 링크 통해서 확인 할 수 있습니다.


## 2-4. 마운트 확인
앞에서 마운트 명령어를 실행하고 정상적으로 마운트된 경우라면 아래와 같이 df 명령어를 통해서 마운트가 정상인 것을 확인 할 수 있습니다.

![](/assets/img/infrastructure/2024/obsmount/objectstorage-mount-8.png)

마운트된 디렉토리를 unmount 하기 위해서는 아래 명령어를 실행 하시면 됩니다.
```bash
#unmount 명령어
fusermount -u /mnt/objectstorage
```

# 출처 및 정보 URL
- **리전코드** : [https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm){:target="_blank" rel="noopener"}
- **인스턴스 만들기** : [https://the-team-oasis.github.io/learning-library/oci-library/oci-basic-compute/livelabs/index.html?lab=create-compute-instance](https://the-team-oasis.github.io/learning-library/oci-library/oci-basic-compute/livelabs/index.html?lab=create-compute-instance){:target="_blank" rel="noopener"} 
- **Object Storage 공식 문서** : [https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/objectstorageoverview.htm](https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/objectstorageoverview.htm){:target="_blank" rel="noopener"}
- **Object Storage 생성 참고** : [https://the-team-oasis.github.io/infrastructure/oci-sdk-objectstorage-java/#2-object-storage-%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0](https://the-team-oasis.github.io/infrastructure/oci-sdk-objectstorage-java/#2-object-storage-%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0){:target="_blank" rel="noopener"}

