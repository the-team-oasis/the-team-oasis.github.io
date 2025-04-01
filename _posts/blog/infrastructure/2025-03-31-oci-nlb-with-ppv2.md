---
layout: page-fullwidth
#
# Content
#
subheadline: "Networking"
title: "OCI Network Load Balancer에서 Proxy Protocol v2 사용하기"
teaser: "OCI Network Load Balancer에서 Proxy Protocal v2(PPv2)를 사용하여 클라이언트의 Real IP를 백엔드로 전달하는 방법에 대해서 소개합니다."
author: "dankim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, nlb, ppv2]
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


### Proxy Protocol v2란
**Proxy Protocol v2**는 Proxy Server나 Load Balancer가 Client의 실제 IP 주소와 포트 정보를 전달할 수 있도록 하기 위한 표준 프로토콜입니다. 이 프로토콜은 Load Balancer 뒤에 위치한 서버들이 Client의 실제 IP와 연결 정보를 확인할 수 있도록 해줍니다. 

### 배경
OCI Network Load Balancer에는 BackendSet 설정 시 **Preserve source IP**라는 옵션이 있습니다. 이 옵션을 사용하면 Client의 실제 IP 주소를 Backend Server로 전달이 가능합니다. 하지만, 이 옵션은 로컬 네트워크 트래픽에서만 유효하여, 동일한 VCN내 혹은 Local Peering(VCN간 라우팅 변경 없이 직접 전달하여 로컬 네트워크 트래픽처럼 처리)으로 연결된 VCN간에만 실제 IP 주소를 Backend Server로 전달할 수 있습니다. 만약 IPSec이나 Remote Peering등을 위해 DRG(Dynamic Routing Gateway)를 사용하고 있는 환경에서 Clinet 실제 IP를 다른 VCN내의 Backend Server로 전달하려면 Local Peering Gateway를 추가로 사용하여야 합니다.

PPv2는 DRG를 사용하는 환경(동일 리전에 여러개의 VCN을 DRG로 연결, 다른 리전 VCN과 Remote Peering으로 연결)에서도 DRG 연결을 통해 VCN 간 트래픽이 소스 IP를 보존하면서 전달될 수 있습니다. PPv2는 VCN 간에 프라이빗 연결을 제공합니다. 이 경우, 트래픽은 소스 IP를 유지한 채 다른 VCN으로 전달됩니다. 이는 Local Peering과 유사하게 작동하지만, DRG를 통한 프라이빗 연결을 사용할 수 있는 장점이 있습니다.

이번 포스팅에서는 OCI Network Load Balancer에서 PPv2를 구성하는 방법에 대해서 설명합니다.

### 구성도
전체 구성도는 다음과 같습니다.
![](/assets/img/infrastructure/2025/oci-nlb-with-ppv2-3.png " ")

### VCN 및 VM 인스턴스 생성
서울 리전에 필요한 VCN과 VM 인스턴스를 생성합니다. Public IP와 Private IP는 동적으로 할당되므로 다르게 여기서의 구성과 다를 수 있습니다. VCN과 VM 인스턴스 생성 가이드는 다음 포스트를 참고 합니다.

[OCI에서 VCN Wizard를 활용하여 빠르게 VCN 생성하기](https://the-team-oasis.github.io/getting-started/create-vcn/)

[OCI에서 리눅스 인스턴스 생성 튜토리얼](https://the-team-oasis.github.io/getting-started/launching-linux-instance/)

**Virtual Cloud Network (VCN)**
<table class="table vl-table-bordered vl-table-divider-col" summary="This table summarizes basic information about each region"><caption></caption><colgroup><col><col><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1">Name</th>
      <th class="entry" id="About__entry__2">CIDR</th>
      <th class="entry" id="About__entry__3">Subnet</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__2"><span class="ph">VCN-SEOUL-HUB</span>
      </td>
      <td class="entry" headers="About__entry__3"><span class="ph">172.16.0.0/16</span>
      </td>
      <td class="entry" headers="About__entry__4">172.16.0.0/24 (Public), 172.16.1.0/24 (Private)</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__2"><span class="ph">VCN-SEOUL-SPOKE-1</span>
      </td>
      <td class="entry" headers="About__entry__3"><span class="ph">172.17.0.0/16</span>
      </td>
      <td class="entry" headers="About__entry__4">172.17.0.0/24 (Public), 172.17.1.0/24 (Private)</td>
      </tr>
      </tbody>
</table>

**VM 인스턴스**  
> HAProxy 인스턴스를 Public Subnet에 생성한 이유는 HAProxy 구성 및 백엔드 WebServer 구성을 위한 Bastion 용도로도 사용하기 위함입니다.
<table class="table vl-table-bordered vl-table-divider-col" summary="This table summarizes basic information about each region"><caption></caption><colgroup><col><col><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1">Name</th>
      <th class="entry" id="About__entry__2">VCN</th>
      <th class="entry" id="About__entry__3">Subnet</th>
      <th class="entry" id="About__entry__4">Public IP</th>
      <th class="entry" id="About__entry__5">Private IP</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">HAProxy</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">VCN-SEOUL-HUB</span>
      </td>
      <td class="entry" headers="About__entry__3">172.17.0.0/24(Public)</td>
      <td class="entry" headers="About__entry__4"><span class="ph">129.154.215.53</span>
      </td>
      <td class="entry" headers="About__entry__5"><span class="ph">172.17.0.237</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">webserver-1</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">VCN-SEOUL-SPOKE-1</span>
      </td>
      <td class="entry" headers="About__entry__3"><span class="ph">172.17.1.0/24(Private)</span>
      </td>
      <td class="entry" headers="About__entry__4"></td>
      <td class="entry" headers="About__entry__5"><span class="ph">172.17.1.82</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">webserver-2</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">VCN-SEOUL-SPOKE-1</span>
      </td>
      <td class="entry" headers="About__entry__3"><span class="ph">172.17.1.0/24(Private)</span>
      </td>
      <td class="entry" headers="About__entry__4"></td>
      <td class="entry" headers="About__entry__5"><span class="ph">172.17.1.210</span>
      </td>
      </tr>
      </tbody>
</table>

### DRG 및 VCN Attachments 생성
이제 두 VCN을 DRG로 연결합니다. ***OCI Console 메뉴 > Networking > Customer connectivity > Dynamic routing gateways***로 이동한 후 **Create dynamic routing gateway** 버튼을 클릭하고 **DRG-SEOUL-1** 이라는 이름으로 생성합니다.

DRG에 앞서 생성한 두 개의 VCN을 붙입니다. 생성한 DRG를 클릭하면 왼쪽 **VCN attachments**라는 Resources를 볼 수 있습니다. **VCN attachments**를 선택한 후 **Create virtual cloud network attachment** 버튼을 클릭한 후 다음과 같이 두 개의 VCN Attachment를 생성합니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="This table summarizes basic information about each region"><caption></caption><colgroup><col><col><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1">Attachment name</th>
      <th class="entry" id="About__entry__2">Virtual cloud network</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">VCN-SEOUL-HUB-DRG-ATT</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">VCN-SEOUL-HUB</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">VCN-SEOUL-SPOKE-1-DRG-ATT</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">VCN-SEOUL-SPOKE-1</span>
      </td>
      </tr>
      </tbody>
</table>

두 개의 VCN Attachment가 추가되었습니다.
![](/assets/img/infrastructure/2025/oci-nlb-with-ppv2-4.png " ")

### Route Table에 Rule 추가
이제 각 VCN에서 사용하는 Route Table에서 Target을 DRG로 지정합니다. 우선 **VCN-SEOUL-HUB** VCN을 선택한 후 Route Table에서 **Default Route Table for VCN-SEOUL-HUB**을 선택합니다. VCN-SEOUL-SPOKE-1으로 Routing을 위한 Rule을 추가합니다.

> 본 구성에서는 DRG를 직접 사용하는 Subnet은 Network Load Balancer가 위치한 VCN-SEOUL-HUB의 Public Subnet과 HAProxy가 위치한 VCN-SEOUL-SPOKE-1의 Public Subnet입니다. 따라서 두 Subnet에 대해서만 Target Type을 DRG로 지정합니다.

* **Target Type:** Dynamic Routing Gateway
* **Target Dynamic Routing Gateway:** DRG-SEOUL-1
* **Destination CIDR Block:** 172.17.0.0/24
![](/assets/img/infrastructure/2025/oci-nlb-with-ppv2-5.png " ")

마찬가지로 **VCN-SEOUL-SPOKE-1** VCN을 선택한 후 Route Table에서 **default route table for VCN-SEOUL-SPOKE-1**을 선택합니다. VCN-SEOUL-HUB로 Routing을 위한 Rule을 추가합니다.

* **Target Type:** Dynamic Routing Gateway
* **Target Dynamic Routing Gateway:** DRG-SEOUL-1
* **Destination CIDR Block:** 172.16.0.0/24
![](/assets/img/infrastructure/2025/oci-nlb-with-ppv2-6.png " ")


### Security List 구성
마지막으로 각 VCN의 Subnet에 대한 Security List 구성을 합니다. **VCN-SEOUL-HUB** VCN을 선택한 후 **Security Lists**에서 **Default Security List for VCN-SEOUL-HUB**를 선택합니다. **Ingress Rules**에 다음과 같이 Rule을 추가합니다. VCN-SEOUL-HUB에는 Network Load Balancer만 구성할 것이고, 80 포트만 Listening 합니다. 

* **Source CIDR:** 0.0.0.0/0
* **IP Protocol:** TCP
* **Destination Port Range:** 80

마찬가지로 **VCN-SEOUL-SPOKE-1** VCN을 선택한 후 **Security Lists**에서 **Default Security List for VCN-SEOUL-SPOKE-1**를 선택합니다. HAProxy가 Network Load Balancer로 부터 트래픽이 들어오므로, **Ingress Rules**에 다음과 같이 Rule을 추가합니다.

* **Source CIDR:** 172.16.0.0/24
* **IP Protocol:** TCP
* **Destination Port Range:** 80

마지막으로 백엔드 WebServer가 위치한 Subnet에 대한 Security List를 설정합니다. **Security Lists**에서 **security list for private subnet-VCN-SEOUL-SPOKE-1**을 선택합니다. **VCN-SEOUL-SPOKE-1** VCN의 Public Subnet으로 부터 트래픽이 들어오므로, **Ingress Rules**에 다음과 같이 Rule을 추가합니다.

* **Source CIDR:** 172.17.0.0/24
* **IP Protocol:** TCP
* **Destination Port Range:** 80

### 백엔드 WebServer 설치
두 대의 백엔드 WebServer를 설치합니다. 먼저 HAProxy서버에 접속한 후 각 WebServer로 다시 접속하여 설치를 진행합니다.

HAProxy 서버에 접속합니다.
```
$ ssh -i ~/.ssh/id_rsa opc@129.154.215.53
```

> Private ssh키는 HAProxy서버에 복사한 후 각 백엔드 WebServer 접속을 위해 사용합니다.

HAProxy서버에서 webserver-1 서버로 접속합니다.
```
$ [opc@haproxy ~] ssh -i ~/.ssh/id_rsa opc@172.17.1.82
```

httpd 서버를 설치합니다.
```
$ [opc@webserver-1 ~] sudo yum install httpd -y
```

httpd 서버를 시작합니다.
```
$ [opc@webserver-1 ~] sudo systemctl start httpd
```

OS 방화벽에 80 포트를 추가합니다.
```
$ [opc@webserver-1 ~] sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
$ [opc@webserver-1 ~] sudo firewall-cmd --reload
```

동일하게 **webserver-2**도 설치 및 구성합니다.

### HAProxy설치 및 구성
다시 HAProxy 서버에 접속합니다.
```
$ ssh -i ~/.ssh/id_rsa opc@129.154.215.53
```

HAProxy를 설치합니다.
```
$ [opc@haproxy ~] sudo dnf install -y haproxy
```

HAProxy 설정을 합니다.
```
$ [opc@haproxy ~] sudo vi /etc/haproxy/haproxy.cfg
```

주요 설정 내용은 다음과 같습니다.
```
log         127.0.0.1 local0

frontend main
    bind *:5000 accept-proxy
    bind *:80 accept-proxy

backend app
    balance     roundrobin
    server  app1 172.17.1.82:80 check
    server  app2 172.17.1.210:80 check
```

로그 설정을 위해 syslog facility로 local0를 사용합니다. 5000포트(기본)와 80포트(추가)를 바인드하고, 각각 accept-proxy를 추가하여 Proxy Protocol V2 프로토콜을 허용합니다. Backend App으로 앞서 설치한 백엔드 WebServer를 추가합니다.

이제 rsyslog를 haproxy로 전달하기 위해 다음과 같이 설정합니다.
```
$ [opc@haproxy ~] sudo vi /etc/rsyslog.d/haproxy.conf
```

**haproxy.conf**
```
# Provides UDP syslog reception
$ModLoad imudp
$UDPServerRun 514
$template Haproxy, "%msg%\n"
local0.* /var/log/haproxy.log
```

rsyslog과 haproxy를 재시작합니다. (중지된 상태면 시작(start)합니다.)
```
$ [opc@haproxy ~] sudo systemctl restart rsyslog
```

```
$ [opc@haproxy ~] sudo systemctl restart haproxy
```

이제 haproxy.log파일이 정상적으로 생성되었는지 확인합니다.
```
$ [opc@haproxy ~] ls -l /var/log/haproxy.log
-rw-------. 1 root root 228189 Mar 31 12:20 /var/log/haproxy.log
```

마지막으로 HAProxy서버에서 OS 방화벽에 80 포트를 추가합니다.
```
$ [opc@webserver-1 ~] sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
$ [opc@webserver-1 ~] sudo firewall-cmd --reload
```

### Network Load Balancer 생성
Network Load Balancer 생성을 위해 ***OCI Console 메뉴 > Networking > Load balancers > Network load balancer***로 이동합니다. **Create network load balancer** 버튼을 클릭한 후 다음과 같이 설정합니다.

**Add details**
* **Load balancer name:** NLB_FOR_PPv2
* **Choose visibility type:** Public
* **Virtual cloud network:** VCN-SEOUL-HUB
* **Subnet:** Public Subnet-VCN-SEOUL-HUB

**Configure Listener**
* **Listener name:** 자동 생성된 이름 사용
* **Specify the type of traffic your listener handles:** TCP
* **Specify the port:** 80
* **Enable proxy protocol V2:** 체크

**Choose backends**
* **Backend set name:** 자동 생성된 이름 사용
* **Select backends:** HAProxy 선택

**Specify health check policy**
* **Protocol:** TCP
* **Port:** 22

마지막으로 **Create network load balancer**버튼을 클릭하여 Network Load Balancer를 생성합니다.
![](/assets/img/infrastructure/2025/oci-nlb-with-ppv2-7.png " ")

### 테스트
두 가지 시나리오로 테스트를 해보겠습니다.

#### HAProxy access log with PPv2 enabled
현재 Network Load Balancer Listner에 PPv2가 Enable된 상태입니다. 바로 Network Load Balancer Public IP로 접속해봅니다.

**http://132.226.175.83/**

HAProxy 로그를 확인합니다.
```
$ [opc@haproxy ~] sudo tail -f /var/log/haproxy.log

Mar 31 12:48:13 localhost haproxy[102136]: 211.207.67.71:41366 [31/Mar/2025:12:48:13.965] main app/app1 0/0/0/1/1 403 3823 - - ---- 2/2/0/0/0 0/0 "GET / HTTP/1.1"
Mar 31 12:48:13 localhost haproxy[102136]: 211.207.67.71:41366 [31/Mar/2025:12:48:13.965] main app/app1 0/0/0/1/1 403 3823 - - ---- 2/2/0/0/0 0/0 "GET / HTTP/1.1"
Mar 31 12:48:13 localhost haproxy[102136]: 211.207.67.71:41366 [31/Mar/2025:12:48:13.984] main static/<NOSRV> 0/-1/-1/-1/0 503 212 - - SC-- 2/2/0/0/0 0/0 "GET /icons/apache_pb2.gif HTTP/1.1"
Mar 31 12:48:13 localhost haproxy[102136]: 211.207.67.71:41366 [31/Mar/2025:12:48:13.984] main static/<NOSRV> 0/-1/-1/-1/0 503 212 - - SC-- 2/2/0/0/0 0/0 "GET /icons/apache_pb2.gif HTTP/1.1"
```

Client 실제 IP (211.207.67.71)가 확인됩니다.

#### HAProxy access log without PPv2 enabled
이제 Network Load Balancer Listner에서 PPv2를 Diable 합니다. 생성한 **NLB_FOR_PPv2**를 클릭한 후 **Listeners**에서 생성한 Listner를 Edit합니다. 그리고 **Enable proxy protocol V2**은 체크해제한 후 저장합니다.
![](/assets/img/infrastructure/2025/oci-nlb-with-ppv2-8.png " ")

haproxy.cfg에서 **accept-proxy**를 제거하여 HAProxy에서 PPv2를 다시 허용하지 않도록 합니다.
> HAProxy에서 80 포트에 대해 PPv2가 Enable(accept-proxy)되어 있을 경우, HAProxy에서 Proxy Protocol을 기대하는 상황에서 실제로 받은 데이터가 Proxy Protocol 헤더 형식이 아니므로, "Received something which does not look like a PROXY protocol header" 메시지와 함께 정상적으로 접속이 안됩니다.

```
$ [opc@haproxy ~] sudo vi /etc/haproxy/haproxy.cfg

frontend main
    bind *:5000
    bind *:80
```

HAProxy를 다시 시작합니다.
```
$ [opc@haproxy ~] sudo systemctl restart haproxy
```

다시 Network Load Balancer Public IP로 접속해봅니다.
HAProxy 로그를 확인합니다.
```
$ [opc@haproxy ~] sudo tail -f /var/log/haproxy.log

Mar 31 13:04:16 localhost haproxy[118722]: 172.16.0.230:21411 [31/Mar/2025:13:04:16.698] main app/app1 0/0/0/1/1 403 3823 - - ---- 1/1/0/0/0 0/0 "GET / HTTP/1.1"
Mar 31 13:04:16 localhost haproxy[118722]: 172.16.0.230:21411 [31/Mar/2025:13:04:16.698] main app/app1 0/0/0/1/1 403 3823 - - ---- 1/1/0/0/0 0/0 "GET / HTTP/1.1"
Mar 31 13:04:16 localhost haproxy[118722]: 172.16.0.230:21411 [31/Mar/2025:13:04:16.726] main static/<NOSRV> 0/-1/-1/-1/0 503 212 - - SC-- 2/2/0/0/0 0/0 "GET /icons/apache_pb2.gif HTTP/1.1"
Mar 31 13:04:16 localhost haproxy[118722]: 172.16.0.230:21411 [31/Mar/2025:13:04:16.726] main static/<NOSRV> 0/-1/-1/-1/0 503 212 - - SC-- 2/2/0/0/0 0/0 "GET /icons/apache_pb2.gif HTTP/1.1"
```

Client 실제 IP (211.207.67.71)가 아닌 Network Load Balancer의 Private IP(172.16.0.230)가 출력되는 것을 확인할 수 있습니다.

#### HAProxy access log without PPv2 enabled and with Preserve source IP
이번에는 PPv2를 사용하지 않고 Network Load Balancer의 Backend sets에서 **Preserve source IP**옵션을 활성화 해보도록 하겠습니다. 생성한 **NLB_FOR_PPv2**를 클릭한 후 **Listeners**에서 생성한 Backend sets를 Edit합니다. 그리고 **Preserve source IP**은 체크한 후 저장합니다.
![](/assets/img/infrastructure/2025/oci-nlb-with-ppv2-9.png " ")

다시 Network Load Balancer Public IP로 접속해봅니다. 연결이 안되는 것을 확인할 수 있고, HAProxy에도 어떤 Access 로그도 남지 않는 것을 확인할 수 있습니다. **Local Peering Gateway**를 사용하는 환경이라면 전달이 되겠지만, DRG를 사용할 경우 패킷이 DRG를 거쳐 Backend까지 도달되지 않는 문제가 생기게 되며, 이로 인해 HAProxy에 연결이 되지 않는 현상이 발생합니다.

#### Cross-region HAProxy access logs with PPv2 over Remote Peering
다른 리전과 Remote Peering으로 구성한 경우에도 PPv2 Header가 다른 리전의 HAProxy로 전달이 되는지도 확인해보았습니다. 구성도는 다음과 같습니다.

![](/assets/img/infrastructure/2025/oci-nlb-with-ppv2-10.png " ")

마찬가지로 Network Load Balancer Public IP로 접속해보고, 도쿄 리전에 있는 HAProxy 로그를 확인합니다.
```
$ [opc@haproxy ~] sudo tail -f /var/log/haproxy.log

Apr  1 06:23:30 localhost haproxy[75798]: 211.207.67.71:5442 [01/Apr/2025:06:23:30.809] main app/app2 0/0/0/1/1 403 3823 - - ---- 1/1/0/0/0 0/0 "GET / HTTP/1.1"
Apr  1 06:23:30 localhost haproxy[75798]: 211.207.67.71:5442 [01/Apr/2025:06:23:30.866] main static/<NOSRV> 0/-1/-1/-1/0 503 212 - - SC-- 2/2/0/0/0 0/0 "GET /icons/apache_pb2.gif HTTP/1.1"
Apr  1 06:23:30 localhost haproxy[75798]: 211.207.67.71:6083 [01/Apr/2025:06:23:30.950] main app/app2 0/0/0/1/1 404 389 - - ---- 1/1/0/0/0 0/0 "GET /favicon.ico HTTP/1.1"
Apr  1 06:31:17 localhost haproxy[75798]: 80.82.77.202:60000 [01/Apr/2025:06:31:15.084] main/2: Received something which does not look like a PROXY protocol header
```

Remote Peering을 통해서 다른 리전에 있는 HAProxy 서버에서도 Client 실제 IP (211.207.67.71)가 출력되는 것을 확인할 수 있습니다.

### 참고
* [Network Load Balancer Management](https://docs.oracle.com/en-us/iaas/Content/NetworkLoadBalancer/NetworkLoadBalancers/network-load-balancer-management.htm)
* [OCI Load Balancers - Logging the real source IP](https://www.ateam-oracle.com/post/oci-load-balancers-logging-the-real-source-ip)