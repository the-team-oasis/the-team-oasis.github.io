---
layout: page-fullwidth
#
# Content
#
subheadline: "Governance"
title: "OCI Announcemnets 사용하기"
teaser: "OCI Announcemnets는 OCI 테넌시에서 사 용중인 서비스와 관련된 중요한 정보(사용자 필수 조치 사항, 사전 및 사후 유지보수 작업 일정, 신규 기능/패치/업그레이드 정보 등)를 공지하고, 이를 구독할 수 있는 서비스입니다. OCI Announcemnets를 사용하는 방법에 대해서 설명합니다."
author: kskim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, announcements]
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

### OCI 공고(Announcements) 소개
OCI Announcemnets Service(이하 AS)는 사용자의 테넌시와 관련된 중요한 정보를 적시에 전달하고 이를 구독할 수 있는 서비스입니다. 사용자는 콘솔에서 공지를 확인할 수 있을 뿐 아니라 이메일/SMS/기타 채널을 구독하여 전달받을 수 있습니다. 

기본적으로 테넌시 관리자만 OCI AS를 통해서 공지를 받지만, 구독 기능을 활용하면 공지를 받는 사용자를 별도로 지정하여 공지할 수 있습니다. 또한 필터를 통해서 특정 리소스나 구획 등에 대해서만 따로 공지를 받을 수 있습니다. 공지를 이메일, SMS와 같은 채널을 통해서 구독을 하는 경우에는 OCI Notification과 연동하여야 합니다. 자세한 내용은 [구독](http://localhost:4000//infrastructure/oci-announcement/#%EA%B5%AC%EB%8F%85)에서 자세히 설명합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/oci_announcement_arch.png)

OCI Compute Instance에 영향을 미치는 라이브 마이그레이션과 같은 작업이 예정되어 있는 경우에는 14일 전에 사전 공고를 받게 됩니다. 만일 사용자가 해당 일자에 예정된 작업을 연기해야 하는 경우가 있다면 OCI Service Request 통해서 최대 2주까지 연장이 가능합니다.

[OCI Status](https://the-team-oasis.github.io/infrastructure/oci-status/)와 OCI AS의 차이는 다음과 같습니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="스케쥴 태그 설명"><caption></caption><colgroup><col><col><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__0" style="width:100px">구분</th>
      <th class="entry" id="About__entry__1" style="width:300px">OCI Status</th>
      <th class="entry" id="About__entry__2" style="width:300px">OCI Announcements</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__0"><span class="ph">공지 내용</span></td>
      <td class="entry" headers="About__entry__1"><span class="ph">각 리전별 인프라 혹은 서비스의 현재 상태와 전체 혹은 부분적 장애 이력</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">사전/사후 유지보수, 정책 변경, 패치 혹은 업그레이드, 신규 기능, 변경된 보안 정책, 기타 사용자에게 필요한 각종 정보</span></td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">공지 방법</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">공개된 웹사이트</span></td>
      <td class="entry" headers="About__entry__3"><span class="ph">사용자 테넌시내의 Announcements</span></td>
      </tr>
      </tbody>
</table>

### AS 유형
AS를 통해 공고하는 유형은 다음과 같습니다.
- 필수 조치(Required action): 사용 중인 환경에서 사용자가 구체적인 조치를 취해야 합니다.
- 긴급 변경(Emergency change): 계획되지 않은 긴급한 변경이 발생하게 될 기간을 공지합니다.
- 긴급 유지 보수 연장(Emergency maintenance extended): 긴급 유지 보수 기간이 이전에 공지한 기간보다 늘어난 경우입니다.
- 긴급 유지 보수 일정 변경(Emergency maintenance rescheduled): 긴급 유지 보수 기간이 변경된 경우입니다.
- 권장 조치(Recommended action): 사용자가 꼭 수행해야 하는 작업은 아니지만, 권고하는 작업이 있는 경우입니다.
- 계획적 변경(Planned change): 계획된 유지보수 기간이 변경된 경우입니다.
- 계획적 변경 연장(Planned change extended): 계획된 유지보수 기간이 이전에 공지한 기간보다 늘어난 경우입니다.
- 계획적 변경 일정 변경(Planned change rescheduled): 계획적 변경(Planned change)이 특정 일자로 연기된 경우입니다.
- 이벤트 알림(Event notification): 최근에 영향을 줬거나 혹은 현재 영향을 주고 있는 환경 변경이 있는 경우입니다.
- 스케줄 된 유지 보수(Scheduled maintenance): 사용자 환경에서 계획된 유지보수 작업이 수행되는 기간을 공지합니다. 일반적으로 해당 유지보수 작업에는 서비스 재시작 또는 이와 유사한 작업들이 수행될 수 있습니다. 일반적으로 14일 이전에 공지되며, 사용자는 예정된 일정을 OCI Service Request를 통해서 최대 2주까지 연장할 수 있습니다.
- 긴급 유지 보수 완료(Emergency maintenance completed): 환경에 영향을 주는 긴급 유지보수가 완료되고 모든 서비스가 재개된 경우입니다.
- 계획적 변경 완료(Planned change completed): 계획된 환경 변경에 대한 작업이 완료되고 정기적인 작업이 재개된 경우입니다.
- 정보(Information): 사용자의 별다른 조치가 필요할 만큼 긴급하지는 않지만, 사용자에게 유용하다고 판단되는 정보를 공지받게 된 경우입니다.

### AS 대시보드
1) 아래와 같이 우측 상단 "공고(Announcements)"를 클릭합니다.
  ![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230308-ngjg.png)

2) 다음과 같이 기본적인 대시보드를 확인할 수 있습니다.
  ![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230308-nhfr.png)

AS 대시보드에서는 총 3개의 메뉴를 확인할 수 있습니다.
- 개요: 대시보드 화면을 볼 수 있으며, 필요한 조치와 향후 유지보수 작업에 대한 개요가 표시됩니다.
- 공고: 날짜, 서비스, 상태 및 플랫폼등으로 필터링된 모든 공지 목록을 볼 수 있습니다.
- 구독: 테넌시 관리자외에 제공되는 다양한 채널을 통해서 특정 사용자가 공고를 구독할 수 있도록 설정할 수 있습니다.

### 공고
공고는 **모든 작업 / 필요한 작업 / 권장작업 / 일정이 잡힌 유지보수 / 기타**로 분류되며, 각 공고별로 영향을 받는 리소스와 정보를 확인 할 수 있습니다.

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230310-gdgx.png)

세부정보를 클릭하면, 아래와 같이 공고의 세부내용이 보여지며, 영향 받은 지역, 영향을 받는 리소스 등에 대해서 상세히 확인할 수 있습니다. 세부정보는 읽음 표시를 클릭하지 않으면 안 읽음으로 계속 볼드채로 유지되며, 해당 공고와 비슷한 유형의 공고가 있을 경우 별도로 구독을 생성하여 구독할 수 있습니다.

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230310-gerr.png)

### 구독
구독은 앞에서 언급된 공고에 대해서 구독을 할 수 있게 설정해 주는 부분으로 아래와 같이 공고에는 **모든공고 / 선택한 공고만** 이렇게 2가지 옵션이 제공됩니다.
- 모든 공고:  테넌시와 관련된 모든 공고에 대해서 구독합니다. 
- 선택한 공고: 다음과 같은 필터를 적용하여 필터링 된 공고에 대해서만 구독합니다.
  - 공고 유형 : 권장되는 작업 , 필요한 작업, 긴급 변경, 긴급 유지보수, 긴급 유지보수 완료, 긴급 유지보수 연장됨, 긴급 유지보수 일정이 조율됨, 정보 
  - 구획 : 특정 구획에 있는 리소스에 대한 공고에 대해서만 구독합니다.
  - 플랫폼 : IaaS, SaaS로 필터링하여 구독합니다.
  - 지역 : 특정 리전과 관련된 공고만 받을 경우에 지역으로 필터링합니다.
  - 리소스 OCID : 사용자가 생성한 리소스를 특정하여 해당 리소스와 관련된 공고에 대해서만 받을 경우 사용합니다.
  - 서비스 : 특정 OCI 서비스로 필터링하여 공고를 받을 경우 사용합니다.
- 표시 환경 설정 : 공고에 표기되는 시간대를 설정합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230310-gbro.png)

앞서 언급한바와같이 Notification 서비스를 사용하여 구독할 수 있습니다.

신규로 Notification Topic을 생성하는 경우 다음과 같이 **새 토픽 생성**을 선택한 후 다음 정보를 선택 혹은 입력합니다.
- Topic을 생성할 구획 선택
- Topic 이름및 설명 입력 
- 구독 프로토콜 선택
  - 전자메일 
  - HTTS 사용자정의 URL 
  - Pagerduty
  - Slack
  - Function
  - SMS

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230310-nfai.png)

기존에 이미 생성한 Notification Topic이 있는 경우 다음과 같이 Topic이 생성된 구획을 선택한 후 기 생성된 Topic을 선택합니다.
![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230310-ngst.png)

구독이 완료되면 아래와 같이 활성화 상태가 나타납니다.
![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230310-nhfr.png)

구독 채널로 **전자메일**을 선택한 경우로 구독이 완료된 이후 validation 메일이 발송되며, **Confirm subscription** 클릭하면 검증이 완료됩니다.
![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230310-gsiq.png)
![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/announcements/SCR-20230310-gskz.png)

이제 테넌시 관리자를 포함하여 구독한 사용자에게도 공고 정보를 구독한 채널을 통해서 수신할 수 있습니다.