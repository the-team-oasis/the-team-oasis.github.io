---
layout: page-fullwidth
#
# Content
#
subheadline: "Scheduler"
title: "OCI 리소스 스케줄러 이용하기"
teaser: "OCI에서 리소스 스케줄러를 이용해서 리소스의 시작/중지를 자동화하기 위한 포스트입니다.."
author: "kisukim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, compute, resource scheduler]
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


## 1. 리소스 스케줄러(Resource Scheduler)? 

안녕하세요! OCI 새로 출시된 리소스 스케줄러에 대해서 알아 보고자 합니다.

리소스 스케줄러는 2024년 5월에 출시된 신규 기능으로 리소스의 효율적인 관리 및 비용의 최적화를 이뤄 줍니다.

리소스 스케줄러는 아래의 특징을 가지고 있습니다.

- 비용 절감 : Compute, 자동화DB , DBCS 에 대해서 일시 중지 기능을 제공함으로써 비용의 절감 할 수 있습니다.
- 효율적인 리소스 관리 : 스케줄러에 등록된 리소스에 대해서 사용자가 등록한 시간에 자동으로 시작 중지가 가능합니다.

## 2. 리소스 스케줄러(Resource Scheduler) 정책 등록하기

먼저, 리소스 스케줄러를 사용하기 위해서는 아래와 같이 테넌시에 정책 추가가 필요합니다.(관리자 권한의 정책 추가가 필요합니다.)

([https://docs.oracle.com/en-us/iaas/Content/resource-scheduler/references/resource-scheduler-policies.htm](https://docs.oracle.com/en-us/iaas/Content/resource-scheduler/references/resource-scheduler-policies.htm))

```bash
Allow group ResourceScheduleAdmins to manage resource-schedule in tenancy	
Allow group ResourceScheduleAdmins to manage resource-schedule-family in tenancy

Allow any-user to manage instance in tenancy where all{request.principal.type='resourceschedule', request.principal.id='ocid1.resourceschedule.oc1.ap-seoul-1.amaaaaaaw7dtmeiay55qxigfw7gguo2no4rgpnkcpzmcwniuhopw3tmm25ya'}
```

위에 Tenancy 정책중에서 먼저, 테넌시 레벨의 등록/수정을 위한 정책이 필요합니다.

```bash
Allow group [사용자 그룹] to manage resource-schedule in tenancy	
Allow group [사용자 그룹] to manage resource-schedule-family in tenancy
```

등록된 스케줄러를 실행하기 위한 실행 정책을 따로 등록해야합니다.

```bash
allow any-user to manage <resource_type> in <target_compartment> where all {request.principal.type='resourceschedule', request.principal.id='[리소스 스케줄러 OCID]'}
```

- Compute, Autonomous DB , DBCS 의 리소스 타입을 넣습니다.
- rquest.principal.id : 사용자가 등록한 스케줄의 OCID 입니다.

## 3. 리소스 스케줄러(Resource Scheduler) 등록하기

위 정책을 모두 등록하면 스케줄러를 사용하기 위한 정책은 모두 등록된 것입니다. 아래 화면에 따라서 스케줄러를 등록합니다.

1. 스케줄러 생성(스케줄러 등록/수정을 위한 권한을 등록한 이후 스케줄러 등록 가능합니다.) 아래 그림에서 자원 스케줄러는 “커버넌스&관리→자원스케줄러” 에서 확인 할 수 있습니다.

   ![](/assets/img/infrastructure/2024/scheduler/resource_schduler_0.png)
2. 스케줄러 등록합니다.

   ![](/assets/img/infrastructure/2024/scheduler/resource_schduler_1.png)

    - 새로운 일정을 생성합니다.

   ![](/assets/img/infrastructure/2024/scheduler/resource_schduler_2.png)

    - 일정 생성시에는 일정 이름, 일정 설명,
    - 실행할 작업 : 리소스 **실행 or 중지**
    - 태그 네임스페이스 : None (free-form tag) , Oracle-Tags

   ![](/assets/img/infrastructure/2024/scheduler/resource_schduler_3.png)

    - 1번에서 리소스 선택은 정적과 동적 리소스 선택 가능합니다. 정적 리소소는 2번 화면에서 보여지는 특정 리소스를 체크 박스로 선택하는 방법이며, 정적 리소스는 “검색 및 필터”를 통해서 검색된 리소스에 한정해서 선택됩니다. 정적 리소스는 특정 조건에 해당되는 리소스에 한해서 정적은 사용자가 선택한 임의의 리소스에만 적용 됩니다.

   ![](/assets/img/infrastructure/2024/scheduler/resource_schduler_4.png)

    - 일정 지정 수단은 폼 인터페이스 방식으로 사용자가 해당되는 스케줄에 하나씩 조건에 맞는 부분을 선택하는 방식과 Cron 형식으로 지정 가능합니다.
    - 간격 : 1번은 한번 , 매일,  매주, 매월 이렇게 선택 가능합니다. 매주의 경우 월,화,수 .. 일 요일 선택 가능하며, 매월은 1~ 31일까지 선택 가능합니다.
    - 반복 간격 : 폼 인터페이스 방식일 경우에만 표현되는 방식으로 횟수에 해당됩니다.
    - 시간 : **4번 시간은 UTC 시간으로 표현되며, 한국시간으로 -9시간이 UTC 의 한국시간 입니다. 시간은 (HH:MM:SS) 형식으로 입력 하시면 됩니다.**
    - 시작 날짜 : 5번 해당 스케줄러가 시작될 날짜입니다.  6번 종료 짜는 스케줄러가 종료 날짜이며, 옵션 사항입니다.

   ![](/assets/img/infrastructure/2024/scheduler/resource_schduler_5.png)

    - 위 화면은 Cron 표현 방식이며, 리눅에서 사용되는 Cron 표현 방식에 따릅니다.

   ![](/assets/img/infrastructure/2024/scheduler/resource_schduler_6.png)

    - 일정 생성이 모두 끝나면 해당 일정의 내용에 대해서 리뷰 검토하고 해당 내용에 대해서 확인 후 “일정 생성” 하시면 됩니다.

   ![](/assets/img/infrastructure/2024/scheduler/resource_schduler_7.png)

    - 생성된 스케줄러 상세화면을 보면 1번과 같이 일정의 기본 내용 및 연관된 리소스가 보여집니다.
    - 작업요청 2번은 실행된 결과 및 스케줄러의 변경사항에 대해서 작업 요청에 따른 성공여부를 보여 줍니다.