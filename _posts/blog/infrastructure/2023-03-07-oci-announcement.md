---
layout: page-fullwidth
#
# Content
#
subheadline: "Governance"
title: "OCI에서 Announcemnet 사용하기"
teaser: "OCI에서 Announcemnet 관련 정보에 대해서 알아봅니다.."
author: kisu.kim
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

### OCI Announcements 소개

AS(Announcemnet Service)는 특정 테넌트에 대상으로 공지를 보내며(특정 장애에 대해서 고객의 테넌시가 영향을 받을 수 있는 부분), 
고객은 콘솔에서 볼수 있을뿐 아니라 이메일/SMS/기타 채널을 통해서 전달 받을 수 있습니다. 
OCI Status의 경우, 리전 및 서비스 레벨의 큰 장에 대해서 공개된 채널에 공지를 합니다. 그러나 AS는 유비보수, 정보 및 기타 여러 유형을 공지를 해줍니다.

- 원래 모든 공지사항은 테넌트 관리자에게 e-mail등으로 전달이 되었으나, AS를 통해서 다른 사용자 그룹등에 대해서 공지하는 기능이 생겼습니다. 
- 필터를 통해서 특정 리소스, 구획(compartment) 등에 대해서 따로 공지를 받을 수 있습니다. 
- 고객과 관련된 중단은 콘솔 알림을 통해 고객에게 전달됩니다. (고객이 사용하고 테넌트의 사용중인 서비스레벨에서 관계된 공고입니다.)

AS의 알람 유형은 아래와 같습니다.
- 필수 조치(Required action): 사용 중인 환경에서 구체적인 조치를 취해야 합니다.
- 긴급 변경(Emergency change): 사용자 환경과 관련하여 계획되지 않았지만 긴급한 변경이 발생하는 기간이 있습니다.
- 긴급 유지 보수 연장(Emergency maintenance extended): 긴급 유지 보수 기간은 이전에 연락한 기간보다 연장되었습니다.
- 긴급 유지 보수 일정 변경(Emergency maintenance rescheduled): 비상 유지 관리 기간이 이후 날짜로 연기되었습니다.
- 권장 조치(Recommended action): 사용자 환경 내에서 수행할 특정 작업이 있지만 작업이 필요하지 않습니다.
- 계획적 변경(Planned change): 환경과 연관된 계획된 변경이 발생하는 기간이 있습니다.
- 계획적 변경 연장(Planned change extended): 예약된 변경 기간은 이전에 연락한 기간보다 연장되었습니다.
- 계획적 변경 일정 변경(Planned change rescheduled): 환경에 대해 계획된 변경사항은 늦은 시간 또는 날짜로 연기되었습니다.
- 이벤트 알림(Event notification): 환경에 영향을 미치는 변경이 최근에 발생했거나 현재 진행 중입니다.
- 스케줄 된 유지 보수(Scheduled maintenance): 고객의 환경에서 계획된 유지보수 작업이 수행되는 기간이 있습니다.유지보수 작업에는 서비스 재시작 또는 이와 유사한 영향을 미치는 다른 작업이 포함될 수 있습니다
- 긴급 유지 보수 완료(Emergency maintenance completed): 환경에 영향을 주는 긴급 유지보수가 완료되어 정기적인 작업이 재개되었습니다.
- 계획적 변경 완료(Planned change completed): 계획된 환경 변경이 완료되고 정기적인 작업이 재개되었습니다.
- 정보(Information): 유용하다고 생각되는 정보가 있지만 긴급하지 않으며 사용자의 조치가 필요하지 않습니다.


Oracle Cloud Infrastructure Compute 인스턴스에 영향을 미치는 알림은 14일 전에 알림을 받을 수 있습니다. 
공지사항에 설명된 조치를 지연해야 하는 경우 지원팀에 문의하여 공지사항에 나열된 대체 날짜 중 하나를 요청할 수 있습니다.
일부 공지사항에서는 최대 2주 후의 날짜로 다시 예약할 수 있습니다. 심각한 취약점은 지연의 대상이 아닐 수 있습니다.

![](/assets/img/infrastructure/announcements/oci_announcement_arch.png)

아래와 같이 우측 상단 "Announcements" "공고" 를 클릭합니다.

![](/assets/img/infrastructure/announcements/SCR-20230308-ngjg.png)


### 공고 (대쉬보드)
  ![](/assets/img/infrastructure/announcements/SCR-20230308-nhfr.png)

아래와 같이 공고늘 총 3가지의 카테고리고 구분되어 있습니다.

- Announcements 개요 : 대시보드에는 필요한 조치와 향후 유지보수 태스크에 대한 개요가 표시됩니다.
- 공고 : 목록 보기는 날짜, 서비스, 상태 및 플랫폼에서 필터링된 모든 알림을 표시합니다.
- 구독 : 이 섹션에서는 필터 용량으로 진행되는 발표에 대한 구독을 만들 수 있습니다. 구독된 공지는 Notifications 서비스에서 선택한 주제로 전달됩니다. 메일, PagerDuty, Slack, Functions 및 HTTPS 엔드포인트에 이러한 공지사항을 전달하기 위해 이러한 주제를 구독할 수 있습니다.

### 공고
- 공고는 OCI에서 발생하는 모든 작업 / 필요한 작업 / 권장작업 / 일정이 잡힌 유지보수 / 기타 등으로 나뉘며, 각 작업에 따라서 영향을 받는 리소스와 정보를 확인 할 수 있습니다.

![](/assets/img/infrastructure/announcements/SCR-20230310-gdgx.png)


- 세부정보를 클릭하면, 아래와 같이 공고의 세부내용이 보여지며, 영향 받은 지역, 영향을 받는 리소스 등에 대해서 상세히 보여집니다.
- 세부정보는 읽음 표시를 클릭하지 않으면 안 읽음으로 계속 볼드채로 유지하며, 해당 이슈와 비슷한 공고가 있을 경우 따로 구독할 수 있게 보여집니다.

![](/assets/img/infrastructure/announcements/SCR-20230310-gerr.png)


### 구독
- 구독은 앞에서 언급된 공고에 대해서 구독을 할 수 있게 설정해주는 부분으로 아래와 같이 공고에는 모든공고 / 선택한 공고만 이렇게 2가지로 나뉩니다. 
- 모든 공고:  테넌시 기준으로 영향을 끼치는 모든 공고에 대해서 구독합니다. 
- 선택한 공고: 필터를 두어 유형에 따라서 아래와 같습니다. 
  - 공고 유형 : 권장되는 작업 , 필요한 작업, 긴급 변경, 긴급 유지보수, 긴급 유지보수 완료, 긴급 유지보수 연장됨, 긴급 유지보수 일정이 조율됨, 정보 
  - 구획 : 구획의 경우 테넌시에서 만들어진 구획 (compartments) 선택 할 수 있습니다.
  - 플랫폼 : OCI 기준으로 IaaS, SaaS 이렇게 2가지로 서비스로 나뉘어 선택 할 수 있습니다.
  - 지역 : 테넌시를 구독하고 있는 Region 기준으로 공고를 받을 수 있습니다. 
  - 리소스 OCID : 사용자가 OCI를 통해서 생성한 리소스 중에서 선택하여 공고를 받을 수 있습니다. 
  - 서비스 : OCI 서비스 기준으로 나뉘었으며, 종류는 아래와 같습니다. 
    - Java Managemnet Service
    - Oracle Analytics Cloud
    - Oracle Application Performance Monitoring
    - Oracle Autonomous Data Warehouse
    - Oracle Autonomous Database
    - Oracle Autonomous JSON Database
    - Oracle Autonomous Transaction Processing
    - Oracle Big Data Service
    - Oracle Blockchanin Platform
    - Oracle Cloud Guard
    - Oracle Cloud Infrastructure
    - Oracle Cloud Infrastructure Anormaly Detection
    - Oracle Cloud Infrastructure API Gateway
    - Oracle Cloud Infrastructure Archive Storage
    - Oracle Cloud Infrastructure Registry
    - Oracle Cloud Infrastructure Audit
    - Oracle Cloud Infrastructure Bastion 
    - Oracle Cloud Infrastructure Block Volumes
    - Oracle Cloud Infrastructure Compliance Documents
    - Oracle Cloud Infrastructure Compute
    - Oracle Cloud Infrastructure Console
    - Oracle Cloud Infrastructure Container Engine for Kubernetes
    - Oracle Cloud Infrastructure Data Catalog
    - Oracle Cloud Infrastructure Data Flow
    - Oracle Cloud Infrastructure Data Integration
    - Oracle Cloud Infrastructure Data Labeling
    - Oracle Cloud Infrastructure Data Science
    - Oracle Cloud Infrastructure Data Transfer Service
    - Oracle Cloud Infrastructure Database Cloud Service
    - Oracle Cloud Infrastructure Database Management
    - Oracle Cloud Infrastructure Database Migration
    - Oracle Cloud Infrastructure Developer Tools
    - Oracle Cloud Infrastructure DevOps
    - Oracle Cloud Infrastructure DNS
    - Oracle Cloud Infrastructure Email Delivery
    - Oracle Cloud Infrastructure Events
    - Oracle Cloud Infrastructure Exadata Cloud Service
    - Oracle Cloud Infrastructure FastConnect
    - Oracle Cloud Infrastructure File Storage
    - Oracle Cloud Infrastructure GoldenGate
    - Oracle Cloud Infrastructure Identity and Access Management
    - Oracle Cloud Infrastructure Language
    - Oracle Cloud Infrastructure Load Balancing
    - Oracle Cloud Infrastructure Logging
    - Oracle Cloud Infrastructure Logging Analytics
    - Oracle Cloud Infrastructure Monitoring
    - Oracle Cloud Infrastructure Notifications
    - Oracle Cloud Infrastructure Object Storage
    - Oracle Cloud Infrastructure Operations Insights
    - Oracle Cloud Infrastructure Registry
    - Oracle Cloud Infrastructure Resource Manager
    - Oracle Cloud Infrastructure Storage Gateway
    - Oracle Cloud Infrastructure Streaming
    - Oracle Cloud Infrastructure Tagging
    - Oracle Cloud Infrastructure to Microsoft AZure Interconnect
    - Oracle Cloud Infrastructure Traffic Managemnet
    - Oracle Cloud Infrastructure Vault
    - Oracle Cloud Infrastructure Virtual Cloud Network
    - Oracle Cloud Infrastructure Vulnerability Scanning Service
    - Oracle Cloud Marketplace
    - Oracle Cloud Network Infrastructure
    - Oracle Cloud VMwares Solution
    - Oracle Content and Experience
    - Oracle Data Safe
    - Oracle Digital Assistant
    - Oracle Exadata Cloud at Customer
    - Oracle Functions
    - Oracle Fusion Applications
    - Oracle Health Checks
    - Oracle Identity Cloud
    - Oracle Integration
    - Oracle Java Cloud Service
    - Oracle Management Agent Cloud Service
    - Oracle MySQL Database Service
    - Oracle NoSQL Database Cloud Service
- 표시 환경 설정 : 디스플레이되는 시간 설정

![](/assets/img/infrastructure/announcements/SCR-20230310-gbro.png)

구독의 경우, 통지 토픽을 기존에 사용중이라면 기존 토픽을 사용하거나 새로 만들 수 있습니다.

![](/assets/img/infrastructure/announcements/SCR-20230310-gdas.png)

신규 토픽 생성의 경우 아래와 같습니다. 
- 신규 토픽의 경우, 아래의 정보를 입력합니다. 
- 토픽 생성성할 구획 선택
- 이름, 설명 입력 
- 구독 프로토콜의 종류는 아래와 같습니다.
  - 전자메일 
  - HTTS 사용자정의 URL 
  - Pagerduty
  - Slack
  - Function
  - SMS

![](/assets/img/infrastructure/announcements/SCR-20230310-nfai.png)

기존 토픽 선택할 경우 아래와 같습니다. 
- 기존 선택할 토픽에 맞는 구획을 선택하여 토픽을 선택합니다.

![](/assets/img/infrastructure/announcements/SCR-20230310-ngst.png)

구독이 완료되면 아래와 같이 활성화 상태가 나타납니다. 

![](/assets/img/infrastructure/announcements/SCR-20230310-nhfr.png)

구독이 완료된 이후 구독을 위한 validation 메일이 발송되며, 수신된 메일을 클릭하면 활성화가 이루어집니다.

![](/assets/img/infrastructure/announcements/SCR-20230310-gsiq.png)

![](/assets/img/infrastructure/announcements/SCR-20230310-gskz.png)