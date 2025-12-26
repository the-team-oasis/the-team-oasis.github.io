---
layout: page-fullwidth
#
# Content
#
subheadline: "Networking"
title: "Cross-Region Oracle Heatwave MySQL Disaster Recovery (Part.2)"
teaser: "Cross-Region Oracle Heatwave MySQL Disaster Recovery 설정하는 방법 소개합니다."
author: "kisukim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, mds, heatwave]
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

## Oracle HeatWave MySQL Cross-Region DR (Part 2) 

Part.1에서 시스템의 구성에 대해서 설명해 드렸으며, 이번에는 이미 구성된 부분에서 CRUD 구성이 어떻게 변경이 되는지 몇 가지 테스트를 진행하였습니다.

![](/assets/img/infrastructure/2025/heatwave_part2_1.png " ")

1. 서울과 싱가포르 동일 테이블의 경우, 싱가포르에서 업데이트 하는 경우는 실제 서울에는 적용되지 않습니다. 이는 양방향이 아닌 단방향 동기화이기 때문입니다. 그러나 싱가포르에서 테이블의 생성등은 가능하나, 서울에는 동기화 되지 않습니다. 
    ![](/assets/img/infrastructure/2025/heatwave_part2_2.png " ")

    ![](/assets/img/infrastructure/2025/heatwave_part2_3.png " ")

2. <strong style="color: red;">DR 지역인 싱가포르의 경우, Standalone 으로 초기 구성하였습니다. 나중에 Standalone을 HA로 구성하는 경우 아래와 같은 방법으로 구성할 수 있습니다. (싱가포르가 나중에 Primary로 가기는 경우 서울은 복제 대상에서 제외가 되어야 하기 때문에 복제 채널 삭제를 해야합니다.)</strong> Stnadalone 에서 HA 변경시 공식 문서상세어는 No downtime 이라고 명시되어 있으며 반대의 경우 HA에서 Standadlone 변경의 경우 down time이 발생 할 수 있습니다.


    ![](/assets/img/infrastructure/2025/heatwave_part2_4.png " ")

    ![](/assets/img/infrastructure/2025/heatwave_part2_5.png " ")

3. 추가적으로 Heatwave 기능으로 백업을 다른 리전으로 복제할 수 있습니다. 이 기능은 Heatwave에 존재하는 리전에 기본 백업이 이뤄지며 이후 사용자가 선택한 리전으로 백업데이터를 복제해 줍니다. 이 경우 DB를 생성하지 않고 백업 데이터만 가지고 있으므로 비용적인면에서 저렴하게 접근할 수 있으나 실제 문제가 생기는 경우 백업데이터를 기준으로 DB를 새로 생성해야하는 부분이 존재합니다. 물론 네트워크 구성도 미리 되어 있어야 어플리케이션에서 접속이 가능합니다. 

     ![](/assets/img/infrastructure/2025/heatwave_part2_6.png " ")

     ![](/assets/img/infrastructure/2025/heatwave_part2_7.png " ")
