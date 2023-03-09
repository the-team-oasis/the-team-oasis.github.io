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
- Oracle Cloud Infrastructure(OCI) 제품 및 서비스에서 개별적이고 효율적인 방식으로 운영 공지를 캡처할 수 있는 Announcement 서비스입니다.
- 필터링 된 알림을 다른 사용자 그룹에 전달하는 기능이 추가되었습니다. 이는 모든 공지사항을 테넌트 관리자에게 전달한 기존 기능에서 변경된 것입니다. 
- Notification 서비스의 통합을 통해 알림 유형, 지역, 서비스, 파티션 등의 알림 세부 정보를 기반으로 트리거되는 자동 워크플로를 정의할 수 있습니다.
- 오라클 클라우드 인프라스트럭처 콘솔에서 존재하는 "공지사항"의 내용을 알려주는 기능을 합니다. 

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
  - 리소스 OCI : 사용자가 OCI를 통해서 생성한 리소스 중에서 선택하여 공고를 받을 수 있습니다. 
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
- 표시 환결 설정 : 디스플레이되는 시간 설정

![](/assets/img/infrastructure/announcements/SCR-20230310-gbro.png)

![](/assets/img/infrastructure/announcements/SCR-20230310-gdas.png)

- 구독이 완료된 이후 구독을 위한 테스트 메일이 발송되며, 수신된 메일을 클릭하면 활성화가 이루어집니다.

![](/assets/img/infrastructure/announcements/SCR-20230310-gsiq.png)

![](/assets/img/infrastructure/announcements/SCR-20230310-gskz.png)