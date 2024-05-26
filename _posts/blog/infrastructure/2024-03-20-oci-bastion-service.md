---
layout: page-fullwidth
#
# Content
#
subheadline: "Compute"
title: "OCI Bastion Service 사용하기"
teaser: "Private 환경에 배포된 Compute Instance에 별도의 점프 호스트 없이 한시적으로 SSH 접속을 할 수 있도록 지원해주는 Bastion Service에 대해서 알아봅니다."
author: dankim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, bastion]
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

### OCI Bastion Service란?
OCI Bastion Service는 Public Endpoint를 가지지 않는 리소스에 일시적으로 접속할 수 있는 액세스를 제공합니다. Bastion을 사용하면 권한 있는 사용자가 SSH(Secure Shell) 세션을 사용하여 특정 IP 주소에서 대상 리소스로 연결할 수 있습니다. 연결되면 사용자는 SSH에서 지원하는 소프트웨어나 프로토콜을 사용하여 대상 리소스와 상호 작용할 수 있습니다. 예를 들어 RDP(원격 데스크톱 프로토콜)를 사용하여 Windows 호스트에 연결하거나 Oracle Net Services를 사용하여 데이터베이스에 연결할 수 있습니다.  
지원되는 연결 대상은 다음과 같습니다 
* Compute Instance
* OCI Oracle DB System or MySQL DB System
* Autonomous Database for Transaction Processing and Mixed Workloads databases

**Bastion Concepts**  
![](https://docs.oracle.com/en-us/iaas/Content/Bastion/images/bastion-overview-diagram.png " ")

#### Bastion Session
Bastion Session을 사용하면 SSH 키 쌍의 개인 키를 소유한 권한 있는 사용자가 미리 지정된 시간 동안 대상 리소스에 연결할 수 있습니다. Session을 생성할 때는 SSH 키 쌍의 공개키를 제공해야 하고, Session에 연결할 때에는 개인키를 제공해야 합니다. 또한 허용되는 범위내의 IP 주소에서 연결을 시도해야 합니다. 

#### Basion Session Types
Bastion Session은 3가지 유형을 지원합니다.
1) Managed SSH Session  
Managed SSH Session은 OCI Compute Instance에 직접 접속을 위한 세션입니다. 기본적으로 다음 요건을 만족해야 합니다.
* linux platform image로 실행한 인스턴스 (Windows는 지원 안함)
* Open SSH 서버가 실행중이어야 함.
* Oracle Cloud Agent가 실행되어야 함.
* Oracle Cloud Agent에 Bastion plugin이 활성화 되어 있어야 함.

> Session은 대상 인스턴스의 IP와 22번 포트를 통해서 연결합니다. (대상 Subnet Security List의 Ingress Rule 추가 필요)

2) SSH 포트 포워딩(PORT FORWARDING) SESSION  
포트 포워딩(PORT FORWARDING) (또는 SSH 터널링)은 클라이언트의 특정포트와 대상 리소스의 특정 포트가 서로 보안 연결을 생성해 주며, 이 연결을 통해서 다른 형태의 프로토콜을 중재할 수 있습니다. SSH를 통해서 아래 프로토콜을 포함하여 대부분의 TCP 서비스를 터널링합니다.
* Remote Desktop Protocol (RDP)
* Oracle Net Services
* MySQL

> Session은 linux 인스턴스의 경우 22번 포트, Windows의 RDP의 경우 3389번 포트, Oracle DB System은 1521번 포트, MySQL DB System은 3306번 포트를 사용합니다. (대상 Subnet Security List의 Ingress Rule 추가 필요)

예를 들어 Oracle SQL Developer를 사용하여 Autonomous Database for Transaction Processing 이나 Mixed Workloads database의 Private Endpoint에 접속할 수 있습니다. 또한 SSH를 통해 기본 암호화되므로, VNC(Virtual Network Computing)과 같은 암호화되지 않은 프로토콜을 사용하는 정보를 전송하는 경우에도 유용할 수 있습니다.

3) 동적 포트 전달(DYNAMIC PORT FORWARDING) (SOCKS5) SESSION  
동적 포트 전달(SOCKS5) 세션은 SSH 포트 포워딩 세션과 동일한 이점을 갖지만 Private Subnet의 모든 대상 리소스에 동적으로 연결할 수 있습니다. 특정 대상 리소스(IP 주소 또는 DNS 이름)에 연결하도록 구성하는 다른 세션 유형과 달리 동적 포트 전달(SOCKS5) 세션을 사용하면 대상 서브넷에 대한 터널을 생성하고 클라이언트에서 연결할 리소스와 포트를 결정할 수 있습니다.

### Managed SSH 세션을 통해서 Private Compute Instance 접속
1) 대상 인스턴스의 Cloud Agent Bastion Plugin을 활성화 합니다. 우선 해당 인스턴스를 선택하고 상세 페이지의 Oracle Cloud Agent를 클릭합니다.  
![](/assets/img/infrastructure/2024/oci-bastion-service-0.png " ")

2) Bastion Plugin을 Enable 합니다. **Running** 상태가 되어야 합니다. (대략 10분정도 걸림)  
![](/assets/img/infrastructure/2024/oci-bastion-service-0-1.png " ")

3) OCI Menu > Identity & Security > Bastion 으로 이동한 후 **Create Bastion** 버튼을 클릭합니다.  
![](/assets/img/infrastructure/2024/oci-bastion-service-1.png " ")

4) 다음과 같이 입력한 후 마지막으로 **Create Basion** 버튼을 클릭합니다.
* **Bastion name :** Bastion 이름을 지정합니다.
* **Target virtual cloud network :** Bastion을 배포할 VCN을 선택합니다.
* **Target subnet :** Bastion을 배포할 Subnet을 선택합니다. (연결할 대상 Subnet의 Security List Ingress Rule에 22번 포트 추가)
* **Enable FQDN Support and SOCKS5 :** 동적 포트 전달(SOCKS5) 또는 FQDN을 통해서 접속할 수 있도록 설정 시 체크합니다.
* **CIDR block allowlist :** 클라이언트의 접속 범위 설정 (모든 인터넷 네트워크에서 접속 허용하도록 여기서는 0.0.0.0/0 지정)
![](/assets/img/infrastructure/2024/oci-bastion-service-2.png " ")

5) Session 생성  
Bastion 상세 화면에서 **Create Session**버튼을 클릭한 후 다음과 같이 입력/선택한 후 **Create Session**을 클릭합니다.
* **Session type :** Managed SSH Session
* **Session name :** Session 이름 설정
* **Username :** OCI에서 제공하는 대부분의 OS Plaform Username은 **opc** 입니다.
* **Compute instance :** 연결한 Compute Instance를 선택합니다.
* **Select SSH key options :** SSH 공개키를 제공합니다. (개인적으로 가지고 있는 키를 활용하거나 새로 생성하여 제공할 수 있습니다.)
* **Advanced Options :**
  * **Maximum session time-to-live :** 세션 유지 시간입니다. (기본 180분, 최대 3시간)
  * **Target compute instance port :** 대상 인스턴스에 연결할 포트입니다. (기본 22번)
  * **Target compute instance IP address :** 대상 인스턴스의 IP를 직접 지정할 수 있습니다.  

![](/assets/img/infrastructure/2024/oci-bastion-service-3.png " ")
![](/assets/img/infrastructure/2024/oci-bastion-service-4.png " ")

6) 인스턴스 접속  
생성한 세션 우측 아이콘클릭 후 **Copy SSH command**를 클릭합니다. 
![](/assets/img/infrastructure/2024/oci-bastion-service-5.png " ")

다음과 같은 명령어가 복사됩니다. 
```
ssh -i <privateKey> -o ProxyCommand="ssh -i <privateKey> -W %h:%p -p 22 ocid1.bastionsession.oc1.ap-seoul-1.amaaaaaakv6tzsaa6hgqj2dtvpuzczfuiywe32zo3fqqpu5fvyo6l4n5fxiq@host.bastion.ap-seoul-1.oci.oraclecloud.com" -p 22 opc@10.0.1.252
```

이제 <privateKey> 부분에 개인키 위치를 지정한 후 명령어를 실행합니다.
```
ssh -i id_rsa -o ProxyCommand="ssh -i id_rsa -W %h:%p -p 22 ocid1.bastionsession.oc1.ap-seoul-1.amaaaaaakv6tzsaa6hgqj2dtvpuzczfuiywe32zo3fqqpu5fvyo6l4n5fxiq@host.bastion.ap-seoul-1.oci.oraclecloud.com" -p 22 opc@10.0.1.252
The authenticity of host 'host.bastion.ap-seoul-1.oci.oraclecloud.com (192.29.26.85)' can't be established.
ED25519 key fingerprint is SHA256:I5vDR3ZJW956EFdxWd3iavCmUOKGTdSvVftlrOG74pY.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'host.bastion.ap-seoul-1.oci.oraclecloud.com' (ED25519) to the list of known hosts.
The authenticity of host '10.0.1.252 (<no hostip for proxy command>)' can't be established.
ED25519 key fingerprint is SHA256:D0M5MG4NXSC5p+zM25HMR9njCkZPfrAuhS8zvAWjVJ8.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.0.1.252' (ED25519) to the list of known hosts.

[opc @privatevm ~]$
```

### SSH 포트 포워딩 세션을 통해서 Oracle DB System 접속
이번에는 Bastion을 통해서 Oracle Database Cloud Service (Base Database Service)에 SQL Developer로 접속을 해보도록 합니다.

> Oracle Base Database (19c)는 사전에 Private Subnet에 프로비저닝을 한 상태에서 진행합니다. Bastion이 있는 Subnet에서 Oracle Base Database가 있는 Subnet으로 1521 포트 접근이 가능하도록 Security List Ingress Rule도 사전에 추가합니다.

사전에 프로비저닝한 DB의 정보는 다음과 같습니다.
* **IP :** 10.0.1.250
* **Port :** 1521
* **Service ID :** DB0526_2kq_icn.sub03220956021.myvcn.oraclevcn.com

1) 먼저 Bastion 상세 화면에서 포트 포워딩 세션을 생성합니다.  
* **Session type :** SSH Port forwarding session
* **Session name :** 세션 이름을 입력합니다.
* **Connect to the target host by using :** IP로 직접 접속을 하기 위해 **IP address** 선택합니다.
* **IP address :** Database의 IP를 입력합니다. (e.g. 10.0.1.250)
* **Port :** Database의 Port를 입력합니다. (e.g. 1521)
* **Select SSH key options :** SSH 공개키를 제공합니다. (개인적으로 가지고 있는 키를 활용하거나 새로 생성하여 제공할 수 있습니다.)

**Create Session** 버튼을 클릭하여 세션을 생성합니다.

![](/assets/img/infrastructure/2024/oci-bastion-service-6.png " ")

2) 생성한 세션 우측 아이콘을 클릭한 후 **Copy SSH Command**를 선택합니다.  
![](/assets/img/infrastructure/2024/oci-bastion-service-7.png " ")

다음과 같은 명령어가 복사됩니다. 
```
ssh -i <privateKey> -N -L <localPort>:10.0.1.250:1521 -p 22 ocid1.bastionsession.oc1.ap-seoul-1.amaaaaaakv6tzsaa6ia63pbstvrvh2tkdbsqxgruk4b2zgsupexg4ucpty7q@host.bastion.ap-seoul-1.oci.oraclecloud.com -v
```

이제 다음과 같이 <privateKey> 부분에 개인키 위치를 지정하고, <LocalPort> 부분에 클라이언트에서 사용할 포트(e.g. 1521)를 지정한 후 실행합니다. **-v** 옵션을 사용하면 디버깅이 가능합니다.
```
ssh -i id_rsa -N -L 1521:10.0.1.250:1521 -p 22 ocid1.bastionsession.oc1.ap-seoul-1.amaaaaaakv6tzsaa6ia63pbstvrvh2tkdbsqxgruk4b2zgsupexg4ucpty7q@host.bastion.ap-seoul-1.oci.oraclecloud.com -v
```

디버깅 로그 마지막 라인에 <mark>debug1: pledge: id</mark>가 보이면 성공입니다.

3) 이제 SQL Developer에서 접속해보도록 합니다.  
![](/assets/img/infrastructure/2024/oci-bastion-service-8.png " ")

### 동적 포트 전달(SOCKS5) 세션을 통해서 Private Compute Instance 접속
마지막으로 동적 포트 전달(SOCKS5) 세션을 생성해서 Private VM에 접속해 보도록 합니다.

1) Bastion 상세 화면에서 **Create Session**을 클릭한 후 다음과 같이 입력 후 생성합니다.
* **Session type :** Dynamic Port Forwading (SOCKS5) Session
* **Session name :** 세션 이름을 입력합니다.
* **Select SSH key options :** SSH 공개키를 제공합니다. (개인적으로 가지고 있는 키를 활용하거나 새로 생성하여 제공할 수 있습니다.)

**Create Session** 버튼을 클릭하여 세션을 생성합니다.
![](/assets/img/infrastructure/2024/oci-bastion-service-9.png " ")

생성된 세션의 우측 아이콘을 클릭한 후 **Copy SSH command**를 클릭하면 다음과 같은 명령어를 얻을 수 있습니다. <privateKey>와 <localPort>를 지정한 후 실행합니다.

```
ssh -i <privateKey> -N -D 127.0.0.1:<localPort> -p 22 ocid1.bastionsession.oc1.ap-seoul-1.amaaaaaakv6tzsaa77ecydvmmere4svjfknax2kau4gvwgie7wmkmq74u4ha@host.bastion.ap-seoul-1.oci.oraclecloud.com
```

2) SOCKS5 접속
SOCKS5 접속을 위해서는 SOCKS5 지원 클라이언트를 사용하여야 합니다. Putty 및 다양한 웹 브라우저가 SOCKS5 프로토콜을 지원합니다.  
SOCKS5 연결은 아래 포스팅을 참고하시기 바랍니다. (Firefox 및 Putty)  
[New SOCKS support for Bastion Service](https://www.ateam-oracle.com/post/new-socks-support-for-bastion-service)