---
layout: page-fullwidth
#
# Content
#
subheadline: "Migration"
title: "2세대 Shape 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하기 Part1: Compute Instance"
teaser: "2세대 Shape 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하는 방법을 설명합니다."
author: "dankim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, compute, migration]
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

### 배경
OCI의 2세대 Shape (Standard2.x, Standard.E2.x)에서는 주로 Oracle Linux 7.6~7.8 버전을 사용하였습니다. 현재 3세대 Shape(Standard3.Flex, Standard.E3.Flex +) 이상에서는 Oracle Linux 7.9(최신 패치) 이상만 호환되기 때문에, 2세대 Shape을 3세대 Shape으로 변경이 바로 되지 않습니다. 이 포스팅을 통해서 기존 2세대 Shape 인스턴스를 다른 리전에 3세대 이상 Shape 인스턴스로 마이그레이션 하는 방법을 설명합니다.

### 시나리오
서울 리전에 있는 2세대 Shape을 가지는 인스턴스 (Oracle Linux 7.7)를 춘천 리전으로 이전하되, 3세대 Shape을 가지는 인스턴스로 마이그레이션 합니다. 마이그레이션 방식은 Custom Image를 활용합니다.

#### 서울 리전 (소스 리전)
* Shape: VM.Standard2.1
* OS: Oracle Linux 7.7 (Image: Oracle-Linux-7.7-2020.01.28-0)

#### 춘천 리전 (대상 리전)
* Shape: VM.Standard3.Flex
* OS: Oracle Linux 7.7 (Image: Oracle-Linux-7.7-2020.01.28-0)

<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-1.png" width="50%" height="50%">

### 서울 리전 준비 (소스)
서울 리전에 다음과 같이 인스턴스를 생성합니다.

1. Image는 My Images를 선택한 후 다음의 Image OCID를 입력합니다.
```
ocid1.image.oc1.ap-seoul-1.aaaaaaaai233ko3wxveyibsjf5oew4njzhmk34e42maetaynhbljbvkzyqqa
```
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-2.png" width="70%" height="70%">

2. Shape은 호환되는 Shape인 VM.Standard2.x 가 자동으로 선택됩니다. 
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-2-1.png" width="70%" height="70%">

3. 인스턴스를 생성합니다.

4. Nginx를 설치합니다. (선택)  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-3.png" width="70%" height="70%">

### Custom Image 생성
생성한 인스턴스 상세화면에서 **More actions**를 선택한 후 **Create custom image**를 선택하여, Custom Image를 생성합니다.
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-4.png" width="70%" height="70%">

### 춘천 리전 준비 (대상)
1. Object Storage Bucket 생성 및 Pre-Authenticated Request 생성
춘천 리전에서는 Custom Image를 전달 받기 위한 Object Storage Bucket을 생성하고, 서울 리전에서 생성한 Custom Image를 직접 전달 받기 위한 Pre-Authenticated Request를 생성합니다.  
Pre-Authenticated Request 옵션은 다음과 같습니다. 
* Name과 Object Name은 자유롭게 입력합니다.
* Pre-Authenticated Request Target: Object
* Access Type: Perform object writes  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-5.png" width="70%" height="70%">  
Pre-Authenticated Request URL을 복사합니다.  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-6.png" width="70%" height="70%">

2. 서울 리전에 생성한 Custom Image Export
서울 리전에 생성한 Custom Image 상세 화면에서 Export Image를 선택한 후 Object Storage URL로 앞에서 복사한 Pre-Authenticated Request URL을 입력한 후, Export Image를 실행합니다.
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-7.png" width="70%" height="70%">

3. Bucket에 Export Image 확인  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-8.png" width="70%" height="70%">

4. Import Custom Image
***메뉴 > Compute > Custom Images*** 로 이동한 후 **Import Image**를 클릭합니다. Bucket에 있는 Image를 선택하여 Custom Image를 Import합니다. Image Type은 OCI를 추천합니다.  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-9.png" width="70%" height="70%">

5. Image 호환성에 3세대 Shape (Standard3.Flex)를 추가
기본적으로 해당 이미지 상세에서 **Compatible shapes** 탭을 클릭해 보면, 최신 Shape은 제외되어 있습니다. **Edit details**를 클릭한 후 최신 Shape을 추가할 수 있습니다. 여기서는 Standard3.Flex Shape을 추가합니다.
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-10.png" width="70%" height="70%">

6. 인스턴스 생성  
이제 Custom Image로 인스턴스를 생성합니다. Image 선택 시 Import 한 Custom Image를 선택합니다.  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-11.png" width="70%" height="70%">  
이제 Standard3.Flex Shape을 선택할 수 있습니다.  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-12.png" width="70%" height="70%">

7. 인스턴스 생성 확인  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-13.png" width="70%" height="70%">

8. 인스턴스 접속 및 Shape 확인

    ```
    ssh -i ~/.ssh/id_rsa opc@158.180.80.253

    [opc@oracle-linux-7-7-2020-01-28-0 ~]$ curl -s http://169.254.169.254/opc/v1/instance/ | grep shape
    "shape": "VM.Standard3.Flex",
    "shapeConfig": {
    ```

9. Nginx 서비스 확인  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part1-14.png" width="70%" height="70%">








