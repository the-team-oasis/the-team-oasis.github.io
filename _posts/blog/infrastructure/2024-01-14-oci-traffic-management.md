---
layout: page-fullwidth
#
# Content
#
subheadline: "Network"
title: "OCI Traffic Management 소개"
teaser: "OCI Traffic Management의 기능 중 지리적 위치 기반 트래픽 분산에 대해서 알아봅니다."
author: kskim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, Traffic Management]
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


### Traffic Management란?
트래픽 관리는 엔드 포인트 상태 및 DNS 요청의 지리적 출처를 비롯한 다양한 조건을 기반으로 트래픽을 엔드 포인트로 안내하는 데 도움이 됩니다.

### Traffic Management 제공하는 기능

* 장애 조치 : 장애 조치 정책을 사용하면 정책에서 응답하는 서비스의 순서에 따라서 (예: 기본 및 보조)의 우선순위를 지정할 수 있습니다. Oracle Cloud Infrastructure Health Checks 모니터와 온디맨드 프로브는 정책의 답변 상태를 평가하는 데 활용됩니다. 기본 답변이 비정상이면 DNS 트래픽이 자동으로 보조 답변으로 조정됩니다.
* 로드 밸런서 : 로드 밸런서 정책은 트래픽을 여러 엔드포인트에 분산시킵니다. 엔드포인트에 동일한 가중치를 할당하여 트래픽을 엔드포인트 전체에 고르게 분산하거나 비율 로드 밸런싱을 위해 사용자 지정 가중치를 할당할 수 있습니다. Oracle Cloud Infrastructure Health Checks 모니터와 온디맨드 프로브는 엔드포인트의 상태를 평가하는 데 활용됩니다. 엔드포인트가 비정상이면 DNS 트래픽이 자동으로 다른 엔드포인트로 분산됩니다.
* 지리적 위치 조향 :지리적 위치 조정 정책은 최종 사용자의 위치에 따라 DNS 트래픽을 다양한 엔드포인트로 분산합니다. 
고객은 원래 대륙, 국가 또는 시/도(북미)로 구성된 지리적 지역을 정의하고 각 지역에 대해 별도의 엔드포인트 또는 엔드포인트 집합을 정의할 수 있습니다.
* ASN 스티어링 : ASN 조정 정책을 사용하면 ASN(자율 시스템 번호)을 기반으로 DNS 트래픽을 조정할 수 있습니다. 
특정 ASN 또는 ASN 집합에서 시작되는 DNS 쿼리는 지정된 엔드포인트로 조정될 수 있습니다.
* IP 접두사 스티어링 : IP 접두사 조정 정책을 통해 고객은 원래 쿼리의 IP 접두사를 기반으로 DNS 트래픽을 조정할 수 있습니다.


### 지리적 위치 조향
이번 내용에서는 지리적 위치 조향으로 외부에서 들어오는 사용자의 IP에 따라서 인접 리전에 위치한 서버와 통신을 해주는 서비스입니다. 

예) 서울, 도쿄 리전에 httpd 서비스를 활성화하고, 도메인 A에 접근하는 사용자의 IP 위치에 따라서 사용자의 IP가 도쿄 인 경우 도쿄 리전에 있는 httpd 서비스에 접근하고 서울에 위치한 사용자의 경우, 서울 리전에 위치한 httpd 서비스에 접근할 수 있습니다.
도쿄에 있는 사용자가 도쿄리전의 서비스에 접근하지만 서비스 장애일 경우 차선책으로 서울 리전에 접근할 수 있도록 할 수 있습니다.

### 지리적 위치 조향 화면 
#### 트래픽 관리 조정 정책 화면 접근
"네트워킹 -> DNS관리 -> 트래픽 관리 조정 정책" 클릭 합니다.
![](/images/infrastructure/tf-01.png " ")

트래픽 관리를 위한 정책 선택 (지리적 위치 조정 선택)
아래와 같은 트래픽 조정 정책을 선택할 수 있습니다. 이번에는 지리적 위치 조정을 선택합니다.

* 정책 유형 : 지리적 위치 조정 선택
* 정책 이름 : 정책의 이름
* 정책  TTL : 정책의 Time To Live 이며, 초 분 시간 일 로 선택이 가능합니다.
* 최대 응답수 : 고정 1
* 응답풀 : 응답풀은 지리적 위치에 따른 응답 서버를 선택 할 수 있게 풀을 생성하는 것 입니다.

예) 테스트에서는 서울 리전 및 도쿄 리전 각각 응답 서버를 설정하였습니다.

* 지리적 위치 조정 규칙 : 대륙, 국가 지역으로 선택이 가능합니다. 다중 선택이 가능합니다.
* 풀의 우선순위: 지리적으로 요청한 트래픽에 대해서 우선순위를 정하여 우선순위에 따른 트래픽 처리를 할 수 있습니다. 우선순위가 1이 가장 높은 우선순위입니다.

예) 서울에서 요청한 트래픽은 서울 리전에서 처리하고 일본에서 요청한 트래픽은 도쿄에서 응답할 수 있도록 세팅합니다.

* 건정성 검사 연결 : 풀에 대해서 건정성을 검사합니다. (http, ping) 두 가지 유형이 선택이 가능합니다.

예) 아파치 서버의 경우 http이므로 해당 부분을 http로 설정하여 건정성 검사하여 트래픽 가용성을 제공합니다.

* 연결 도메인 : 도메인의 하위 도메인을 선택하는 경우 옵션으로 제공합니다.

** Catch-all 이란 : 지리적으로 트래픽 흐름을 제어한 나머지 지역 선택되지 않은 지역에 대한 트래픽 처리를 어디로 할 건지에 대한 부분입니다.
![](/images/infrastructure/tf-04.png " ")

* 위 세팅이 완료되면 아래와 같이 정책 내용 및 건전성에 대한 유효 여부를 확인이 가능합니다.
  아래는 대한민국에서 요청된 트래픽은 서울 리전에서 먼저 처리하고 문제가 있을 경우 하위 도쿄에서 처리할 수 있도록 합니다.
  또한 일본에서 요청된 트래픽은 일본 도쿄리전에서 우선적으로 처리하고 문제가 있을 경우 하위 도메인인 서울에서 처리될 수 있도록 정책이 되어 있습니다.
![](/images/infrastructure/tf-05.png " ")


위 과정이 셋팅된 이후 브라우저에서 콜할 경우 윈도우 혹은 맥의 경우 DNS 캐시가 발생 할 수 있어 각 리전 (한국, 일본) 에 서버 nslookup 할 수 있도록 서버를 위치하여 호출 하였습니다.
- 하나의 도메인을 기준으로 도쿄와 서울 리전을 나뉘어 end-user가 접속할 경우 지리적 위치 조정에 맞는 도메인이 호출되는지 확인하였습니다.
- 같은 도메인 라도 end-user의 위치에 따라서 일본과 서울에 트래픽을 분산하여 줍니다.


![](/images/infrastructure/tf-06.png " ")
![](/images/infrastructure/tf-07.png " ")


