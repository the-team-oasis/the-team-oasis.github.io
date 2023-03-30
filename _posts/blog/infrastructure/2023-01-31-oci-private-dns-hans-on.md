---
layout: page-fullwidth
#
# Content
#
subheadline: "Governance"
title: "OCI에서 Private DNS 사용하기"
teaser: "OCI에서 VCN간 혹은 DNS 연동하는 방법에 대해서 알아봅시다."
author: kskim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, dns, private]
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

### DNS 소개
  - DNS(Domain Name Syetem)란?
    - 웹사이트에 접속 할 때 우리는 외우기 어려운 IP 주소 대신 도메인 이름을 사용합니다..
    - 도메인 이름을 사용했을 때 입력한 도메인을 실제 네트워크상에서 사용하는 IP 주소로 바꾸고 해당 IP 주소로 접속하는 과정이 필요합니다.
    - 이러한 과정, 전체 시스템을 DNS(도메인 네임 시스템)라고 합니다.
    - 이러한 시스템은 전세계적으로 약속된 규칙을 공유합니다.
    - 상위 기관에서 인증된 기관에게 도메인을 생성하거나 IP 주소로 변경할 수 있는 ‘권한’을 부여 합니다..
    - DNS는 이처럼 상위 기관과 하위 기관과 같은 ‘계층 구조’를 가지는 분산 데이터베이스 구조를 가집니다.
  - DNS 구성요소
    - 도메인 네임 스페이스(Domain Name Space)
    - 네임 서버(Name Server) = 권한 있는 DNS 서버
    - 리졸버(Resolver) = 권한 없는 DNS 서버
  - DNS 구성 요소 : 도메인 네임 스페이스(Domain Name Space)
    - DNS는 전세계적인 거대한 분산 시스템입니다.
    - 도메인 네임 스페이스는 이러한 DNS가 저장 관리하는 계층적 구조를 가집니다.
    - 도메인 네임 스페이스는 최상위에 루트 DNS 서버가 존재하고 그 하위로 연결된 모든 노드가 연속해서 이어진 계층 구조로 되어있습니다. (폴더 구조와 비슷합니다.)

![](/assets/img/infrastructure/2023/private_dns/SCR-20230203-brw.png){:width="50%":align="center"}



- Fully Qualified Domain Name(FQDN) 전체 도메인 이름
  - 도메인의 전체 이름을 표기하는 방식을 말합니다. 
  - 일반적으로 도메인 이름은 www.hanamon.kr에서 hanamon.kr을 의미하기 때문에 이러한 용어가 나왔다고 봅니다.
  - 도메인 이름: hanamon.kr
  - 호스트 이름: www
  - FQDN : www.hanamon.kr

- DNS 동작 과정 전체 설명

![](/assets/img/infrastructure/2023/private_dns/SCR-20230203-c58.png){:width="100%":align="center"}


- DNS 동작 과정 전체 예시
  1. 웹 브라우저에 www.hanamon.kr을 입력 한다.
  2. 웹 브라우저는 이전에 방문한적 있는지 찾는다.
     - 브라우저 캐시 확인
     - OS 캐시 확인
     - 라우터 캐시 확인
     - ISP 캐시 확인 (Recursive DNS Server)
  3. ISP에서 DNS Iterative하게 쿼리를 날린다.
  4. ISP는 Authoritative DNS 서버에서 최종적으로 IP 주소를 응답받는다.
  5. ISP는 해당 IP 주소를 캐시한다.
  6. 웹 브라우저에게 응답한다.


### OCI Private DNS
- 소개 
  - Oracle 사설 DNS(도메인 이름 시스템)를 사용하면 자체 사설 DNS 도메인 이름을 사용하고 연결된 영역 및 레코드를 완전히 관리하여 온프레미스에서 VCN(가상 클라우드 네트워크) 내에서 실행 중인 애플리케이션에 대한 호스트 이름 확인을 제공할 수 있습니다.
- 개인 DNS – 구성 요소 및 OCI 기본 기능
  - 사설 DNS 영역 : 사설 DNS 영역에는 사설 IP 주소와 같이 VCN 내에서만 액세스할 수 있는 DNS 데이터가 포함되어 있습니다. 프라이빗 DNS 영역은 인터넷 DNS 영역과 유사한 기능을 가지고 있지만 VCN을 통해 도달할 수 있는 클라이언트에 대해서만 응답을 제공합니다.
  - 개인 DNS 보기 : 개인 DNS 보기는 개인 영역의 모음입니다. 확인자에서 개인 보기를 참조하여 DNS 쿼리 응답 방법을 관리할 수 있습니다. 영역은 단일 보기에만 속할 수 있습니다. 주어진 보기는 임의의 수의 확인자에서 사용할 수 있으므로 VCN 간에 개인 DNS 데이터를 공유할 수 있습니다.
  - Private DNS Resolver : Private DNS resolver는 DNS 쿼리에 대한 응답을 제공합니다. 고객이 참조한 각 보기를 순서대로 확인한 다음 기본 보기, 각 규칙을 차례로 확인한 다음 마지막으로 인터넷 DNS를 사용하여 응답을 제공합니다.
  - Private DNS 확인자 끝점 : 확인자 끝점은 두 가지 형태로 제공됩니다. 수신 엔드포인트를 사용하면 DNS 해석기가 온프레미스 시스템 및 기타 해석기와 같은 VCN 외부에서 오는 DNS 쿼리에 응답할 수 있습니다. 전달 끝점을 사용하면 DNS 확인자가 전달 규칙 에 정의된 대로 원격 DNS를 쿼리할 수 있습니다 .






      
### 테스트 케이스
- DNS Peering Between VCNs in OCI
  - CIDR 중복되지 않게 VCN을 생성합니다.
  - VCN : DNS_1 (10.0.0.0/16) 생성 후 해당 VCN 내 compute 생성
  - VCN : DNS_2 (10.2.0.0/16) 생성 후 해당 VCN 내 compute 생성


- DNS Peering With On-Prem
![](/assets/img/infrastructure/2023/private_dns/SCR-20230201-e78.png)