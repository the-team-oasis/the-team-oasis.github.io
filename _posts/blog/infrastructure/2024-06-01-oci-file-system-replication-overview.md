---
layout: page-fullwidth
#
# Content
#
subheadline: "Storage"
title: "OCI File Storage 서비스에 복제 (Replication)에 대해 알아보기"
teaser: "OCI에서 제공하는 네트워크 파일시스템 File Storage 서비스의 복제 (Replication) 기능에 대해 알아봅니다."
author: "yhcho"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, nfs, fss, nas, file, storage, file storage, network storage, replication]
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

## OCI File Storage Service 의 복제 (Replication) 기능 살펴보기
OCI File Storage System의 Cross-region 복제 기능은 Region 중단 상황으로 부터 데이터 손실을 보호하고 데이터 중복성 규정 준수 요구를 부합하면서 손쉬운 재해 복구를 위한 기능을 제공합니다.

## 복제 동작 방식 알아보기
- 파일 스토리지 복제를 활성화하려면, 소스 파일 시스템에 연결된 복제 리소스를 생성해야 합니다. 
- 이 복제 리소스는 복제할 대상 파일 시스템과 데이터가 얼마나 자주 복제될지를 지정합니다. 
- 대상 파일 시스템의 위치는 소스 파일 시스템과 같은 가용 도메인 내에 있을 수도 있고, 다른 가용 도메인이나 다른 지역에 있을 수도 있습니다. 
- 익스포트 경로를 한번도 생성하지 않은 파일 시스템만이 대상 파일 시스템으로 사용될 수 있습니다. 
- 복제 리소스가 생성된 후에는 대상 파일 시스템이 읽기 전용으로 설정되며, 오직 복제를 통해서만 업데이트됩니다. 
- 소스 파일 시스템에 대한 데이터 업데이트는 비동기적으로 대상 파일 시스템에 복제됩니다.

> 대상(Target) 파일 시스템에 복제된 데이터는 소스 파일 시스템과 동일한 파일 및 폴더 구조, 스냅샷, 메타데이터, 권한 설정을 가지고 있습니다. 

> 파일 잠금, 암호화 키, 태그와 같은 파일 시스템 특정 데이터는 복제되지 않습니다. 소스 파일 시스템의 클론 역시 복제되지 않으며, 대상(Target) 파일 시스템의 키와 태그는 별도로 설정해야 합니다.

### 복제 프로세스 이해하기

1. 복제(Replication) 구성을 통해 파일 시스템의 복제 리소스는 소스 파일 시스템에 특별한 복제 스냅샷을 생성합니다. 그런 다음, 이 스냅샷을 복제 대상(Target) 리소스로 전송하여 새로운 데이터를 대상 파일 시스템에 기록합니다. 
2. 마지막으로 완료된 복제 스냅샷은 다음 복제 주기까지 소스 및 대상 파일 시스템에 남아 있습니다. 
3. 다음 주기가 되면, 복제 프로세스는 자동으로 이전 복제 스냅샷을 삭제하고 새로운 스냅샷을 생성합니다. 
4. 복제 프로세스는 지정된 주기에 따라 복제가 계속되는 한 반복됩니다.

> 아래 다이어그램에서는 주 가용 도메인에 있는 파일 시스템 A가 파일 시스템 B로 복제되는 과정을 보여줍니다. 복제는 파일 시스템 A에 기록된 데이터의 변화를 복제 스냅샷으로 캡처합니다. 그런 다음, 데이터는 복제 리소스에서 복제 대상 리소스로 전송되고, 파일 시스템 B에 복사됩니다. 이 다이어그램은 일반적인 복제 설정을 나타냅니다.

![](/assets/img/infrastructure/2024/fss/replication-1.png " ")

주 가용 도메인(소스)에 장애가 발생하면, 대상 파일 시스템으로 장애 조치를 수행할 수 있습니다. 장애 조치를 수행하려면, 애플리케이션과 사용자가 접근할 수 있도록 대상 파일 시스템을 내보내십시오. 자세한 내용은 [OCI 파일 시스템 재해 복구 알아보기](){:target="_blank"}를 참조하세요.

## 복제를 구성할 때 필요한 전제조건 및 고려할 사항 알아보기

### 전제 조건
리전간 복제를 구성하기 위해서는 대상 지역에 대한 구독이 필요합니다. 지역을 추가로 구독하는 방법은 [지역 관리](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingregions.htm){:target="_blank"}를 참조하세요.

### 복제 시간 예측하기
리전간 복제를 구성하기 전에 복제 예측기를 통해 리전간 복제 예상 시간을 사전에 계산해 볼 수 있습니다.
- 파일 시스템 세부정보 화면에서 "복제" 메뉴의 "복제 예측기" 버튼을 클릭합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-2.png " ")
- 예상되는 변경률을 입력하거나 비워두고 "계산" 버튼을 누르면 현재 파일 시스템 기준으로 복사시간을 계산하여 보여줍니다.
  ![](/assets/img/infrastructure/2024/fss/replication-3.png " ")

### 그 밖의 주요 고려할 사항들
- 각 파일 시스템당 최대 3개의 복제 작업을 설정할 수 있습니다.
- 최소 복제 간격은 60분입니다.
- 온프레미스 위치에서 Oracle Cloud Infrastructure로 데이터를 마이그레이션하는 데 복제를 사용할 수 없습니다.
- 한 번도 익스포트 경로를 구성하지 않은 파일 시스템만 대상 파일 시스템으로 사용할 수 있습니다. 이전에 익스포트를 구성한 파일 시스템을 사용하려면 **먼저 해당 파일 시스템의 클론을 생성한 후 클론을 대상으로 사용해야 합니다.**
- **사용자 스냅샷을 생성하거나 삭제한 파일 시스템은 복제 대상 파일 시스템으로 사용할 수 없습니다.**
- **스냅샷 정책이 부착된 파일 시스템은 대상 파일 시스템으로 사용할 수 없습니다.**
- 복제 구성을 삭제하면, 대상(Target) 파일 시스템의 복제 스냅샷이 사용자 스냅샷으로 변환됩니다. 이러한 스냅샷을 삭제하면, 해당 파일 시스템을 향후 복제 대상 파일 시스템으로 재사용할 수 없습니다.

## Source 리전별 구성 가능한 권장 대상(Target) 리전 알아보기
권장 대상 지역은 파일 시스템의 소스 지역을 기준으로 지정됩니다. 이는 성능을 극대화하기 위해 지리적 위치를 고려하여 선정됩니다. 권장되지 않는 지역으로 복제를 설정하려면, 해당 지역에 복제 대상 파일 시스템을 수동으로 생성하거나 API 또는 CLI를 통해 설정할 수 있습니다

<table class="table vl-table-bordered vl-table-divider-col" summary="A table identifying the suggested target regions for cross-region replication."><caption></caption><colgroup><col><col></colgroup><thead class="thead">
<tr class="row">
<th class="entry" id="limitations-and-considerations__target-regions__entry__1">Source Region</th>
<th class="entry" id="limitations-and-considerations__target-regions__entry__2">Target Region</th>
</tr>
</thead><tbody class="tbody">
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Australia East (Sydney)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Australia Southeast (Melbourne)</span></p>
<p class="p"><span class="ph">Japan East (Tokyo)</span></p>
<p class="p"><span class="ph">US West (San Jose)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Australia Southeast (Melbourne)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Australia East (Sydney)</span></p>
<p class="p"><span class="ph">Singapore (Singapore)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Brazil East (Sao Paulo)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Brazil Southeast (Vinhedo)</span></p>
<p class="p"><span class="ph">Chile Central (Santiago)</span></p>
<p class="p"><span class="ph">US East (Ashburn)</span></p>
<p class="p"><span class="ph">US West (Phoenix)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Brazil Southeast (Vinhedo)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Brazil East (Sao Paulo)</span></p>
<p class="p"><span class="ph">US East (Ashburn)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Canada Southeast (Montreal)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2"><span class="ph">Canada Southeast (Toronto)</span></td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Canada Southeast (Toronto)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2"><span class="ph">Canada Southeast (Montreal)</span></td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Chile Central (Santiago)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2"><span class="ph">Brazil East (Sao Paulo)</span></td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">France Central (Paris)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">France South (Marseille)</span></p>
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
<p class="p"><span class="ph">Italy Northwest (Milan)</span></p>
<p class="p"><span class="ph">Netherlands Northwest (Amsterdam)</span></p>
<p class="p"><span class="ph">UK South (London)</span></p>
<p class="p"><span class="ph">US East (Ashburn)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">France South (Marseille)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">France Central (Paris)</span></p>
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
<p class="p"><span class="ph">Italy Northwest (Milan)</span></p>
<p class="p"><span class="ph">Spain Central (Madrid)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Germany Central (Frankfurt)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">France Central (Paris)</span></p>
<p class="p"><span class="ph">France South (Marseille)</span></p>
<p class="p"><span class="ph">Italy Northwest (Milan)</span></p>
<p class="p"><span class="ph">Israel Central (Jerusalem)</span></p>
<p class="p"><span class="ph">Japan East (Tokyo)</span></p>
<p class="p"><span class="ph">Netherlands Northwest (Amsterdam)</span></p>
<p class="p"><span class="ph">Sweden Central (Stockholm)</span></p>
<p class="p"><span class="ph">Switzerland North (Zurich)</span></p>
<p class="p"><span class="ph">UK South (London)</span></p>
<p class="p"><span class="ph">UK West (Newport)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">India South (Hyderabad)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">India West (Mumbai)</span></p>
<p class="p"><span class="ph">Singapore (Singapore)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">India West (Mumbai)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">India South (Hyderabad)</span></p>
<p class="p"><span class="ph">UK South (London)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Israel Central (Jerusalem)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">UK South (London)</span></p>
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Italy Northwest (Milan)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">France Central (Paris)</span></p>
<p class="p"><span class="ph">France South (Marseille)</span></p>
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
<p class="p"><span class="ph">Switzerland North (Zurich)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Japan Central (Osaka)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Japan East (Tokyo)</span></p>
<p class="p"><span class="ph">South Korea North (Chuncheon)</span></p>
<p class="p"><span class="ph">US West (San Jose)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Japan East (Tokyo)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Japan Central (Osaka)</span></p>
<p class="p"><span class="ph">Australia East (Sydney)</span></p>
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
<p class="p"><span class="ph">Singapore (Singapore)</span></p>
<p class="p"><span class="ph">South Korea North (Chuncheon)</span></p>
<p class="p"><span class="ph">South Korea Central (Seoul)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Mexico Central (Queretaro)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">US East (Ashburn)</span></p>
<p class="p"><span class="ph">US West (Phoenix)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Netherlands Northwest (Amsterdam)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">France Central (Paris)</span></p>
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
<p class="p"><span class="ph">Sweden Central (Stockholm)</span></p>
<p class="p"><span class="ph">UK South (London)</span></p>
<p class="p"><span class="ph">US East (Ashburn)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Saudi Arabia West (Jeddah)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2"><span class="ph">UAE East (Dubai)</span></td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Singapore (Singapore)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Japan East (Tokyo)</span></p>
<p class="p"><span class="ph">India South (Hyderabad)</span></p>
<p class="p"><span class="ph">Australia Southeast (Melbourne)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">South Africa Central (Johannesburg)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2"><span class="ph">UK South (London)</span></td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">South Korea Central (Seoul)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">South Korea North (Chuncheon)</span></p>
<p class="p"><span class="ph">Japan East (Tokyo)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">South Korea North (Chuncheon)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">South Korea Central (Seoul)</span></p>
<p class="p"><span class="ph">Japan Central (Osaka)</span></p>
<p class="p"><span class="ph">Japan East (Tokyo)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Spain Central (Madrid)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2"><span class="ph">France South (Marseille)</span></td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Sweden Central (Stockholm)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
<p class="p"><span class="ph">Netherlands Northwest (Amsterdam)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">Switzerland North (Zurich)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
<p class="p"><span class="ph">Italy Northwest (Milan)</span></p>
<p class="p"><span class="ph">UK South (London)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">UAE Central (Abu Dhabi)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2"><span class="ph">UAE East (Dubai)</span></td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">UAE East (Dubai)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">Saudi Arabia West (Jeddah)</span></p>
<p class="p"><span class="ph">UAE Central (Abu Dhabi)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">UK South (London)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">UK West (Newport)</span></p>
<p class="p"><span class="ph">France Central (Paris)</span></p>
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
<p class="p"><span class="ph">India West (Mumbai)</span></p>
<p class="p"><span class="ph">Israel Central (Jerusalem)</span></p>
<p class="p"><span class="ph">Netherlands Northwest (Amsterdam)</span></p>
<p class="p"><span class="ph">South Africa Central (Johannesburg)</span></p>
<p class="p"><span class="ph">Switzerland North (Zurich)</span></p>
<p class="p"><span class="ph">US East (Ashburn)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">UK West (Newport)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">UK South (London)</span></p>
<p class="p"><span class="ph">Germany Central (Frankfurt)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">US Midwest (Chicago)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">US East (Ashburn)</span></p>
<p class="p"><span class="ph">US West (Phoenix)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">US East (Ashburn)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">US Midwest (Chicago)</span></p>
<p class="p"><span class="ph">US West (Phoenix)</span></p>
<p class="p"><span class="ph">US West (San Jose)</span></p>
<p class="p"><span class="ph">Brazil East (Sao Paulo)</span></p>
<p class="p"><span class="ph">Brazil Southeast (Vinhedo)</span></p>
<p class="p"><span class="ph">France Central (Paris)</span></p>
<p class="p"><span class="ph">Mexico Central (Queretaro)</span></p>
<p class="p"><span class="ph">Netherlands Northwest (Amsterdam)</span></p>
<p class="p"><span class="ph">UK South (London)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">US West (Phoenix)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">US East (Ashburn)</span></p>
<p class="p"><span class="ph">US Midwest (Chicago)</span></p>
<p class="p"><span class="ph">US West (San Jose)</span></p>
<p class="p"><span class="ph">Brazil East (Sao Paulo)</span></p>
<p class="p"><span class="ph">Mexico Central (Queretaro)</span></p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="limitations-and-considerations__target-regions__entry__1"><span class="ph">US West (San Jose)</span></td>
<td class="entry" headers="limitations-and-considerations__target-regions__entry__2">
<p class="p"><span class="ph">US East (Ashburn)</span></p>
<p class="p"><span class="ph">US West (Phoenix)</span></p>
<p class="p"><span class="ph">Australia East (Sydney)</span></p>
<p class="p"><span class="ph">Japan Central (Osaka)</span></p>
</td>
</tr>
</tbody></table>

## 다음 단계...
이번 포스팅에서는 파일 시스템 복제에 대해 알아보았습니다. 실제로 OCI Console에서 복제를 구성하는 방법은 아래 포스팅을 참고하여 진행해보세요

- [OCI File Storage 서비스에 복제 (Replication) 구성하기](/infrastructure/oci-file-system-replication/){:target="_blank"}