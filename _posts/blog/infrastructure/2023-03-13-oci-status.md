---
layout: page-fullwidth
#
# Content
#
subheadline: "Governance"
title: "OCI에서 OCI Status 사용하기"
teaser: "OCI에서 OCI Status 관련 정보에 대해서 알아봅니다.."
author: kisu.kim
breadcrumb: true
categories:
  - Governance
tags:
  - [oci, status]
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
오라클 클라우드 인프라스트럭처 현황 서비스를 사용하면 대시보드에서 리전 내 OCI 서비스의 상태를 확인하고 프로그래밍 방식으로 서비스 상태를 확인 할 수 있습니다. 
- OCI Status는 대규모의 장애(전체 지역 또는 서비스가 중단되는 경우)에 사용되며, 사용자가 정해지지 않은 공개 채널입니다. 매우 큰 규모의 이벤트가 발생했을때만 사용되므로 전체 이벤트(장애) 증 극히 일부만 OCI Status에 게시됩니다.
- 지역의 OCI 서비스 상태를 대쉬보드로 보여줍니다.
- 서비스 상태 및 내역을 확인 할 수 있습니다.
- 프로그래밍 방식으로 서비스 상태를 조회할 수 있습니다.
- 제공된 URL에서 상태 대시보드에 액세스할 수 있습니다.

상태 대시보드에는 영역 내 각 개별 서비스의 상태가 표시됩니다. 상태 대시보드 페이지는 5분마다 자동으로 새로 고쳐집니다. 영역 그룹의 상태를 보려면 대시보드 패널 상단의 해당 탭을 클릭합니다.

![](/assets/img/infrastructure/ocistatus/SCR-20230313-oitu.png)

대시보드에 표시되는 서비스에는 다음과 같은 유형의 상태 표시기 아이콘이 표시될 수 있습니다:
- 정상성능(Normal Performance): 서비스가 정상적으로 이루지고 있으며, 해당 이벤트 로그는 존재하지 않습니다.
- 정보제공(Informational):서비스 성능에 관한 유용한 정보를 확인할 수 있습니다.
- 서비스중단(Service Disruption): 해당 서비스에 대해서 많은 수의 실패가 이루어지며, 일부는 정상적으로 제공되고 있습니다.관련 장애 보고서가 존재합니다.
- 서비스중지(Service Down) : 서비스를 사용할 수 없습니다. 관련 장애 보고서가 존재합니다.
- 대쉬(Dash -) :  해당 리전에 서비스가 제공되지 않은 경우 장애가 아닌 서비스 미제공 지역입니다.

장애에 대한 히스토리 검색이 가능하며, 서비스, 리전별 필터를 통해서 나뉠 수 있습니다.

### 장애 상세정보
장애 내용은 야래와 같은 내용을 가지고 있습니다.
- 제목(Title): 이벤트의 위치, 영향을 받는 서비스 및 참조 번호에 대한 간단한 설명입니다.
- 이벤트상태(Event Status): 현재, 장애 상태값이며 상태는 조사 중, 확인됨, 모니터링 중, 해결됨으로 구분 됩니다.
- 메시지(Message): 이벤트 및 이벤트 해결을 위해 취하고 있는 조치에 대한 오라클 클라우드 인프라스트럭처 팀의 정보 메시지입니다.
- 고객영향(Customer Impact): 이벤트의 결과로 고객이 서비스에서 영향을 끼칠 수 있는 세부사항입니다.
- 참조번호(Reference Number): 이벤트를 식별하는 고유 참조 번호입니다.
- 시작시간(Start Time): 장애를 인지한 시간부터해서 포함해서 처음 발생한 날짜와 시간으로, UTC 형식으로 표시됩니다.
- 종료시간(End Time): 장애가 해결된 날짜와 시간으로, UTC 형식으로 표시됩니다
- 다음업데이트(Next Update): 이벤트 업데이트를 예상할 수 있는 예상 시간으로, UTC 형식으로 표시됩니다.
- 장애 원인(임시적)Preliminary Root Cause: 장애에 대한 임시적인 원인 혹은 최종 원인에 대한 요약입니다.

### OCI Status 구독 방법
- RSS 구독 방법
  - https://ocistatus.oci.oc.scloud 로 이동합니다. 
  - 오른쪽 메뉴의 RSS 메뉴바를 클릭합니다. 
  - RSS URL 링크를 복사한 후, RSS Reader 를 통해서 등록합니다.
- 프로그램적으로 구현하는 방법 (JSon 방식)
  - 요약 보고서: 모든 서비스 및 지역의 현재 상태를 표시합니다.(https://ocistatus.oraclecloud.com/api/v2/components.json)
  - 상태 보고서: 모든 시스템에 대한 개괄적인 상태를 표시합니다. (https://ocistatus.oraclecloud.com/api/v2/status.json)