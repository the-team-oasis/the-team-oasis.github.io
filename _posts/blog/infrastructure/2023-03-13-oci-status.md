---
layout: page-fullwidth
#
# Content
#
subheadline: "Governance"
title: "OCI Status 사용하기"
teaser: "OCI 인프라와 서비스들에 대한 실시간 상태 정보를 확인할 수 있는 OCI Status에 대해서 알아봅니다."
author: kskim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, infrastructure, status]
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

### OCI Status 소개
OCI Status는 OCI 서비스의 상태와 가용성에 대한 실시간 정보를 제공하는 공개된 서비스입니다. 사용자는 웹 브라우저를 통해서 [https://ocistatus.oraclecloud.com/](https://ocistatus.oraclecloud.com/)로 접속하여 확인할 수 있습니다.

OCI 사용자는 OCI 서비스의 상태를 대시보드를 통해서 확인할 수 있으며, 성능과 관련된 최신 정보를 얻을 수 있습니다. 대시보드는 페이지는 5분마다 자동으로 새로 고쳐집니다. 각 지역별 상태를 확인하기 위해서는 상단의 지역 그룹을 선택합니다.
![](/assets/img/infrastructure/ocistatus/SCR-20230313-oitu.png)

대시보드에 표시되는 서비스에는 다음과 같은 유형의 상태 표시기 아이콘이 표시될 수 있습니다:
- 정상 성능(Normal Performance): 서비스가 정상적으로 작동합니다. 이 상태에서는 관련된 이벤트 보고서는 제공되지 않습니다.
- 정보(Informational): 서비스 성능에 관한 유용한 정보를 확인할 수 있습니다.
- 서비스 지장(Service Disruption): 해당 서비스에 대해서 많은 수의 요청 실패가 보고되고 있는 상태로 서비스가 완전히 정상적으로 제공되고 있지 않은 상태입니다. 관련 이벤트 보고서가 제공됩니다.
- 서비스 중지(Service Down): 서비스를 사용할 수 없습니다. 관련 이벤트 보고서가 존재합니다.
- 대쉬(Dash -): 해당 리전에서 서비스가 제공되고 있지 않습니다.

> 서비스 지장(Disruption) 및 중지(Down) 상태인 경우 해당 아이콘을 클릭하면 연결된 이벤트 보고서를 확인할 수 있습니다.

### 이벤트 보고서
이벤트 보고서는 대시보드의 관련 상태 아이콘을 클릭하여 확인할 수 있습니다. 또한 우측 상단의 **History**를 통해서 이전 이벤트 보고서를 모두 확인할 수 있습니다. **History**에서는 성능 저하, 부분 또는 전체 중단이 발생한 각 서비스에 대한 자세한 이벤트 보고서를 제공합니다. 서비스 및 지역별로 이벤트를 필터링할 수 있으며, 날짜별로 필터링이 가능하여 지난 이벤트 보고서도 조회하여 볼 수 있습니다.

이벤트 보고서에는 아래와 같은 내용을 포함하고 있습니다.
- 제목(Title): 이벤트가 발생한 위치, 영향을 받는 서비스 및 참조 번호에 대한 간단한 설명입니다.
- 이벤트 상태(Event Status): 현재 이벤트에 대한 상태 값이며 상태는 조사 중(Investigating), 확인됨(Identified), 모니터링 중(Monitoring), 해결됨(Resolved)으로 구분됩니다.
- 메시지(Message): 이벤트 및 이벤트 해결을 위해 OCI 팀에서 취하고 있는 조치에 대한 내용입니다.
- 고객 영향(Customer Impact): 이벤트 발생의 영향으로 고객이 사용 중인 서비스가 어떤 영향을 받을 수 있는지에 대한 상세 내용입니다.
- 참조 번호(Reference Number): 이벤트를 식별하는 고유 참조 번호입니다.
- 시작 시간(Start Time): 이벤트가 처음 발생한 날짜와 시간으로 UTC 형식으로 표시됩니다. (예: 2021년 1월 17일 17:35 UTC)
- 종료 시간(End Time): 이벤트가 해결된 날짜와 시간으로 UTC 형식으로 표시됩니다 (예: 2021년 1월 18일 05:29 UTC)
- 다음 업데이트(Next Update): 이벤트 업데이트를 예상할 수 시간으로 UTC 형식으로 표시됩니다. (예: 2021년 1월 18일 10:30 UTC)
- 예비 근본 원인(Preliminary Root Cause): (확인된 경우) 이벤트에 대한 예비 원인 혹은 최종 원인에 대한 요약입니다. (예. Oracle 엔지니어는 IDCS 서비스를 지원하는 인프라의 하위 집합에서 상태 확인 문제가 발생하여 사용할 수 없게 되었음을 확인했습니다. 이 문제로 인해 인증을 지원하는 IDCS 서비스 리소스의 용량이 줄어들어 일부 새로운 인증 요청이 적시에 처리되지 못했습니다.)

### OCI Status 구독 방법
- RSS 구독 방법 
  - RSS 구독은 3-Party RSS Reader기를 활용하거나 3-Party E-mail 알림 서비스를 사용하여 구독할 수 있습니다. OCI에서는 기본적으로 OCI Status를 위한 RSS URL을 제공하고 있습니다. RSS Url은 [https://ocistatus.oraclecloud.com](https://ocistatus.oraclecloud.com)로 이동 후 오른쪽 상단에 **RSS** 버튼을 클릭하여 확인할 수 있습니다.
- 모바일(아이폰,안드로이드)에서는 일반적으로 다음과 같은 3-Party RSS Feeds 앱을 사용하여 구독할 수 있습니다.
  - (Feedly, NewsBlur, Inoreader 등)
- 다음과 같은 3-Party 서비스를 통해서 RSS Feed를 이메일을 통해서 알림으로 받을 수 있습니다.
  - (https://blogtrottr.com , https://feedrabbit.com 등)  

- 프로그램적으로 구현하는 방법 (JSon 방식)
  - 요약 보고서: 모든 서비스 및 지역의 현재 상태를 표시합니다.
    - (https://ocistatus.oraclecloud.com/api/v2/components.json)
  - 상태 보고서: 모든 시스템에 대한 개괄적인 상태를 표시합니다.
    - (https://ocistatus.oraclecloud.com/api/v2/status.json)