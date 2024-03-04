---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "8월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 8월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - Aug-2023
  - Infrastructure
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


## IPSec over FastConnect is now available
* **Services:** Networking
* **Release Date:** Aug. 30, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/2beaf017-5fa9-4e9a-923f-45c466fafe2f/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/2beaf017-5fa9-4e9a-923f-45c466fafe2f/){:target="_blank" rel="noopener"}

### 릴리즈 내용

오라클 클라우드 인프라스트럭처FastConnect를 사용하면 데이터 센터와 오라클 클라우드 인프라스트럭처 간의 트래픽을 암호화하는 두 가지 주요 방법을 사용할 수 있습니다: FastConnect를 통한 IPSec 및 MACsec 암호화입니다.

공용 인터넷이 아닌 FastConnect 가상 회로를 통해 사이트 간 VPN을 프로비저닝할 수 있습니다. IPSec over FastConnect를 사용하면 FastConnect 가상 회로에 보안 IPSec 터널을 사용하여 사이트 간 VPN을 설정할 수 있으므로 이미 개인 연결에 보안을 강화할 수 있습니다. 이러한 IPSec 터널은 레이어 3에서 네트워크 간 연결을 보호합니다.

> 애쉬번과 상 파올로 지역에서는 아직 이 기능을 사용할 수 없습니다. 


## MACSEC on FastConnect now allows Fail Open mode
* **Services:** Networking
* **Release Date:** Aug. 30, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/5042e1a4-dde5-4e43-bf23-adff56ee6061/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/5042e1a4-dde5-4e43-bf23-adff56ee6061/){:target="_blank" rel="noopener"}

### 릴리즈 내용

FastConnect용 MACSEC에서 페일오픈 모드가 허용됩니다. 이 모드를 사용하면 MACSEC 세션이 중단될 때 암호화되지 않은 트래픽이 FastConnect 가상 회로에 흐를 수 있습니다. 

MACsec(Media Access Control Security)은 이더넷 링크에서 점대점(point-to-point) 보안을 제공합니다. MACsec은 IEEE 표준 802.1AE로 정의됩니다. IP Security(IPsec) 및 SSL(Secure Sockets Layer)과 같은 다른 보안 프로토콜과 함께 MACsec을 사용하여 엔드투엔드 네트워크 보안을 제공할 수 있습니다.

MACsec은 서비스 거부, 침입, 중간자, 가장, 수동적 도청, 재생 공격 등 대부분의 보안 위협을 식별하고 예방할 수 있습니다. MACsec은 LLDP(Link Layer Discovery Protocol), LACP(Link Aggregation Control Protocol), DHCP(Dynamic Host Configuration Protocol), ARP(Address Resolution Protocol) 및 기타 보안 솔루션과의 제한으로 인해 일반적으로 이더넷 링크에서 보호되지 않는 기타 프로토콜을 비롯한 거의 모든 트래픽에 대한 이더넷 링크를 보호합니다.

* Fail Open : 고장 시 열림. 장애 발생 시 특정 요소(트래픽, 권한, 서비스 등)를 허용하는 정책
* Fail Close : 고장 시 닫힘. 장애 발생 시 특정 요소(트래픽, 권한, 서비스 등)를 차단하는 정책
