---
layout: page-fullwidth
#
# Content
#
subheadline: "Cloud Console"
title: "OCI 콘솔에서 리소스 구획 이동하기"
teaser: "OCI 콘솔에서 리소스의 구획을 이동하는 방법에 대해 알아봅니다."
author: yhcho
date: 2023-05-19 00:00:00
breadcrumb: true
categories:
  - getting-started
tags:
  - [oci, move resources, compartment, 구획, 구획이동, 리소스 이동]
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

### OCI 콘솔에서 구획을 이동 하는 방법
OCI 콘솔에서 생성된 리소스는 구획 단위로 확인이 가능합니다. 만약 이미 생성한 리소스의 구획을 이동해야 하는 경우 OCI 콘솔에서 간단하게 이동할 수 있습니다.
지금부터 OCI의 Compute Instance, Virtual Cloud Network(VCN), Load Balancer(LB), Certification(인증서), MySQL Database System(MDS) 리소스를 이동하는 방법에 대해 알아 보도록 하겠습니다.

### 리소스를 이동할 구획 생성하기
먼저 리소스를 이동할 구획을 생성해야 합니다.
구획을 생성하고 관리하는 방법은 [구획 생성 방법](/getting-started/launching-linux-instance/#%EA%B5%AC%ED%9A%8D-compartment-%EC%83%9D%EC%84%B1){:target="_blank" rel="noopener"}을 참고하세요.
만약 이미 구획이 생성되어 있는 경우 이 단계는 건너띄고 다음 단계로 바로 진행하셔도 됩니다.

### Compute Instance 구획 이동하기
Compute Instance를 이동하려면 Compute Instance에 연결된 리소스도 함께 이동해야 합니다.
일반적으로 Compute Instance에 연결되는 Storage 리소스는 사용자가 직접 이동해야 하며, Network 리소스 (VNIC)의 경우 VCN의 서브넷이 이동되면 자동적으로 이동됩니다.
아래 절차를 따라 순서대로 Compute Instance 관련 리소스를 이동하는 방법을 알아보겠습니다.

#### #1. 연결된 스토리지 리소스 구획 이동하기
인스턴스 세부정보 화면으로 이동하여 우측 리소스 메뉴에서 **"부트볼륨"**, **"연결된 블록볼륨"** 리소스에서 인스턴스에 연결되어 있는 스토리지 리소스를 이동합니다.  

1. 왼쪽 리소스 메뉴에서 **"부트볼륨"** 메뉴를 클릭하여 연결된 부트볼륨 세부정보 화면으로 이동합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-1.png " ")
2. 상단의 **"리소스 이동"** 버튼을 클릭합니다
   ![](/assets/img/getting-started/2023/move-resources/move-resources-2.png " ")
3. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭하여 리소스를 이동합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-3.png " ")
4. 연결된 블록볼륨이 있는 경우 우측 메뉴에서 **"연결된 블록볼륨"** 메뉴를 클릭 후 동일하게 진행합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-4.png " ")

#### #2. Compute Instance 리소스 구획 이동하기
1. 인스턴스 세부정보 화면에서 **"추가 작업"** 드롭다운 리스트를 클릭하여 **"리소스 이동"** 메뉴를 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-5.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭하여 리소스를 이동합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-6.png " ")

#### #3. Network 리소스 이동 (VNIC)
네트워크 리소스는 해당 VNIC이 생성된 서브넷이 이동되면 자동으로 함께 이동됩니다.
![](/assets/img/getting-started/2023/move-resources/move-resources-7.png " ")

### Virtual Cloud Network (VCN) 이동하기
VCN 리소스를 이동하기 위해서 VCN 하위에 생성되어 있는 리소스를 먼저 이동해야 합니다.
이번 실습에서는 VCN 생성 마법사로 생성된 리소스를 기준으로 안내하고 있지만, 실제 생성된 리소스가 추가로 있는 경우 모두 이동해주어야 합니다.
아래 절차를 따라 순서대로 VCN 관련 리소스를 이동하는 방법을 알아보겠습니다.

#### #1. 서비스 게이트웨이(Service Gateway) 구획 이동하기
1. 왼쪽 리소스 메뉴에서 **"서비스 게이트웨이"** 메뉴 클릭 후 조회된 서비스 게이트웨이의 우측 Action Button을 클릭하여 **"리소스 이동"**을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-8.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-9.png " ")

#### #2. NAT 게이트웨이(NAT Gateway) 구획 이동하기
1. 우측 리소스 메뉴에서 **"NAT 게이트웨이"** 메뉴 클릭 후 조회된 NAT 게이트웨이의 우측 Action Button을 클릭하여 **"리소스 이동"**을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-10.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-11.png " ")

#### #3. DHCP 옵션 (DHCP Option) 구획 이동하기
1. 우측 리소스 메뉴에서 **"DHCP 옵션"** 메뉴 클릭 후 조회된 DHCP 옵션 우측 Action Button을 클릭하여 **"리소스 이동"**을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-12.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-13.png " ")

#### #4. 보안 목록 (Security List) 구획 이동하기
1. 우측 리소스 메뉴에서 **"보안 목록"** 메뉴 클릭 후 조회된 보안 목록의 우측 Action Button을 클릭하여 **"리소스 이동"**을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-14.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-15.png " ")
3. 남은 리소스도 동일하게 진행하여 리소스를 이동합니다.


#### #5. 인터넷 게이트웨이 (Internet Gateway) 구획 이동하기
1. 우측 리소스 메뉴에서 **"인터넷 게이트웨이"** 메뉴 클릭 후 조회된 인터넷 게이트웨이의 우측 Action Button을 클릭하여 **"리소스 이동"**을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-16.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-17.png " ")

#### #6. 경로 테이블 (Route Table) 구획 이동하기
1. 우측 리소스 메뉴에서 **"경로 테이블"** 메뉴 클릭 후 조회된 경로 테이블의 우측 Action Button을 클릭하여 **"리소스 이동"**을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-18.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-19.png " ")
3. 남은 리소스도 동일하게 진행하여 리소스를 이동합니다.

#### #7. 서브넷 (Subnet) 구획 이동하기
1. 우측 리소스 메뉴에서 **"서브넷"** 메뉴 클릭 후 조회된 서브넷의 우측 Action Button을 클릭하여 **"리소스 이동"**을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-20.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-21.png " ")
3. 남은 리소스도 동일하게 진행하여 리소스를 이동합니다.

#### #8. 전용 DNS 분석기 (Private DNS Resolver) 구획 이동하기
1. VCN 세부정보 화면에서 DNS 분석기를 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-22.png " ")
2. 이동된 화면에서 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-23.png " ")
3. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-24.png " ")

#### #9. VCN (Virtual Cloud Network) 구획 이동하기
1. VCN 세부정보 화면에서 **"리소스 이동"** 버튼을 클릭합니다
   ![](/assets/img/getting-started/2023/move-resources/move-resources-25.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-26.png " ")

### 로드 밸런서 (Load Balancer) 구획 이동하기
1. 로드 밸런서 세부정보 화면에서 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-27.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-28.png " ")

### 인증서 (Certification) 구획 이동하기
1. 인증서 세부정보 화면에서 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-29.png " ")
2. 이동할 구획을 선택하고 **"리소스 이동"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-30.png " ")

### MDS (MySQL Database System) 구획 이동하기
OCI의 MDS에서는 리소스 구획 이동 기능을 기본적으로 제공하지 않습니다.
따라서 MDS 리소스를 구획 이동하려면 **"백업 생성 - 새로운 DB시스템 생성"** 을 순차적으로 수행하여 이동할 구획에 새로운 MDS 리소스를 생성해야 합니다.
이동할 때 기존 시스템을 삭제하고 이동하면 새로운 시스템을 생성할 때 기존 IP를 지정하여 생성할 수 있지만, 새로운 DB 시스템 생성 후 검증이 필요하기 때문에 가급적 기존 시스템을 유지한 상태에서 새로운 시스템을 생성하는게 좋을 것 같습니다.

#### MDS 구획 이동
1. MDS 세부정보 화면에서 **"추가 작업"** 드롭다운 리스트를 클릭하여 **"수동 백업 생성"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-31.png " ")
2. 생성 화면에서 아래와 같이 기본값을 이용하여 백업을 생성합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-32.png " ")
3. MDS 세부정보 화면에서 **"추가 작업"** 드롭다운 리스트를 클릭하여 **"새 DB 시스템으로 복원"** 버튼을 클릭합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-33.png " ")
4. 백업 선택단계에서 복원할 백업 (조금전 생성한 백업)을 선택합니다.
5. **"구획에 생성"** 섹션에서 이동할 구획을 선택하고, 새로운 시스템의 이름을 지정합니다
   ![](/assets/img/getting-started/2023/move-resources/move-resources-34.png " ")
6. 네트워킹 구성에서 **"구획 변경"**을 클릭하여 이동할 구획을 선택하여 앞서 이동한 VCN을 선택합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-35.png " ")
7. 기타 배치구성, 하드웨어 구성, 스토리지를 원하는 사양으로 조정합니다.
   ![](/assets/img/getting-started/2023/move-resources/move-resources-36.png " ")
8. 기존 시스템을 삭제하고 생성하는 경우 **"고급 옵션 표시 - 네트워킹"** 섹션에서 기존 IP 주소를 지정하여 생성할 수 있습니다. (기존 DB 시스템을 삭제하고 생성하는 경우 기존에 생성도어 있는 백업에서 **"새 DB 시스템으로 복원"** 버튼을 클릭하여 복원할 수 있습니다.)
   ![](/assets/img/getting-started/2023/move-resources/move-resources-37.png " ")


