---
layout: page-fullwidth
#
# Content
#
subheadline: "Storage"
title: "[Hands-On] NAT 컴퓨트 구성하여 트래픽 제어하기"
teaser: "NAT 인스턴스를 통해서 NAT Gateways 역할을 대신 할 수 있습니다. "
author: kisu.kim
date: 2023-06-15 00:00:00
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, compute,nate-instacne]
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


### NAT Instance 란?
네트워크 환경 구성 시, 대부분 Public subnet 과 Private subnet으로 구성됩니다. Public Subnet에 있는 리소스의 경우 Public ip를 가지고 있기에 IGW (Internet Gateway)를 통해서 외부망과 연결이 이루어집니다.
그러나 Private subnet의 경우 NAT를 통해서 Private Subnet에 있는 리소스들이 외부와 연결될 수 있도록 해줍니다.
Private Subnet에 속해 있는 리소스의 경우 외부에서 내부로 traffic이 들어오지는 못하지만 반대로 outbound 트래픽은 가능하여, yum 등으로 compute에 필요한 패키지를 설치할 수 있습니다.
강력한 보안을 위해서는 외부와의 통신을 끊기 위해서 NAT를 사용하지 않기도 합니다.

아래 구성은 private subnet을 2개 구성하여 NAT instance를 만들어서 1개의 VNICs 에서부터 VNICs 2개까지 구성하여 네트워크 트래픽을 제어하는 방법을 설명하고자 합니다. 

  


### 아키텍처#1 
 - 하나의 VNICs을 사용해서 (in-bound, out-bound) 흐름 제어하기

![](/assets/img/infrastructure/2023/SCR-20230619-kian.png " ")

두 개의 Private Subnet에서 하나의 Private Subnet에서 다른 Private Subnet에 있는 compute를 통해서 외부 인터넷에 접속할 수 있도록 하는 방법입니다. 

1) 서로 다른 서브넷에 compuete(Private inatnsce, NAT instance)를 구성합니다. 

2) NAT instance의 VNIC 설정에서 "Skip source/destination check" 을 체크합니다.(라우팅시 NAT instance로 라우팅하기 위한 설정입니다.)

3) NAT instance의 터미미널에 접속하여 아래와 같이 "/etc/sysctl.conf" 설정을 변경합니다. (패킹 포워딩을 위한 파리미터 등록 (/etc/sysctl.conf) 수정해서 아래 2개 등록)
   ```terminal 
   net.ipv4.ip_forward = 1
   net.ipv4.conf.all.rp_filter = 0
   ```
4) sudo sysctl -p 실행하여 반영 
<br>


### 아키텍처#2
- NAT Instance에 2개의 VNICs 사용하여 out-bound 트래픽은 NAT Instance의 VNIC#1, in-oubound는 NAT Instance의 VNIC#2

![](/assets/img/infrastructure/2023/SCR-20230619-ktlg.png " ")

두 개의 Private Subnet에서 하나의 Private Subnet에서 다른 Private Subnet에 있는 compute를 통해서 외부 인터넷에 접속할 수 있도록 하는 방법입니다.

1) NAT Gateway에 Route Rule 추가 (추가된 Secondary VCNI의 Private IP 주소를 Target으로 설정)

2) sysctl.conf 설정 추가
   패킹 포워딩을 위한 파리미터 등록 (/etc/sysctl.conf) 수정해서 아래 2개 등록
   ```terminal
   net.ipv4.ip_forward = 1
   net.ipv4.conf.all.rp_filter = 0
   ```
   
3) sudo sysctl -p 실행하여 반영

4)  NAT Instance에 접속하여 Secondary VNIC Device(ens5)로 들어온 트래픽이 백엔드 서브넷 CIDR로 전달되도록 Route Rule 추가
    sudo route add -net {백엔드 서브넷 CIDR) gw {VNIC이 속한 Gateway} dev ens5
   ```terminal
    예시: sudo route add -net 10.0.1.0/24 gw 10.0.20.1 metric 0 dev ens5
   ```
   
### 아키텍처#3 
- NAT Instance에 2개의 VNICs 사용하여 out-bound 트래픽은 NAT Instance의 VNIC#1, in-oubound는 NAT Instance의 VNIC#2- 단 VNIC#2는 NAT Instance와 다른 Subnet에 있습니다.


![](/assets/img/infrastructure/2023/SCR-20230619-khxq.png " ")

두 개의 Private Subnet에서 하나의 Private Subnet에서 다른 Private Subnet에 있는 compute를 통해서 외부 인터넷에 접속할 수 있도록 하는 방법입니다. 그러나 VNIC을 다른 서브넷에 구성하여
in-bound 트래픽과 out-bound 트래픽을 분리하는 방식입니다.


1) NAT Gateway에 Route Rule 추가 (추가된 Secondary VCNI의 Private IP 주소를 Target으로 설정)

2) sysctl.conf 설정 추가
   패킹 포워딩을 위한 파리미터 등록 (/etc/sysctl.conf) 수정해서 아래 2개 등록
   ```terminal
      net.ipv4.ip_forward = 1
      net.ipv4.conf.all.rp_filter = 0
   ```

3) sudo sysctl -p 실행하여 반영

4) NAT Instance에 접속하여 Secondary VNIC Device(ens5)로 들어온 트래픽이 백엔드 서브넷 CIDR로 전달되도록 Route Rule 추가
   sudo route add -net {백엔드 서브넷 CIDR) gw {VNIC이 속한 Gateway} metric 0 dev ens5
   ```terminal
   예시: sudo route add -net 10.0.1.0/24 gw 10.0.40.1 metric 0 dev ens5
   ``` 


### 참고
아래 링크에 secondary VNIC 추가하는 방법이 있습니다. (스크립트 다운로드 후 실행 )
<br>
[Add secondary VNICs](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingVNICs.htm)


