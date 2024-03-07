---
layout: page-fullwidth
#
# Content
#
subheadline: "Disaster Recovery"
title: "OCI Full Stack Disaster Recovery Overview"
teaser: "인프라, 미들웨어, 데이터베이스 및 애플리케이션을 포함하는 애플리케이션 스택의 모든 계층에 대한 포괄적인 재해 복구 기능을 제공하는 OCI Full Stack Disaster Recovery 서비스를 소개합니다."
author: dankim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, dr]
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

### Disaster Recovery란?
Disaster Recovery(DR)은 지진, 태풍, 홍수 같은 천재지변부터 전쟁, 해킹, 갑작스러운 시스템 오류 등 예상치 못한 재해 속에서도 서비스가 계속 운영될 수 있도록 하는 것을 말합니다. 재해 복구 목표는 Recovery Point Objective(RPO) 및 Recovery Time Objective(RTO)로 측정됩니다. RPO는 목표 복구 시점으로 "장애 발생 시 비즈니스 연속을 위해 어느 시점으로 백업할 지 결정하게 될 지표"를 의미하며, RTO는 목표 복구 시간으로 "장애 발생 시 시스템을 원 상태로 복원하는데 소요되는 시간"을 의미합니다. 일반적으로 RPO와 RTO값을 작게 가져가는 것이 좋지만, 이러한 요구사항을 충족하는데 들어가는 비용은 증가하게 됩니다.

DR 구성은 일반적으로 실 운영환경인 Primary Data Center (주 데이터센터)에 대한 DR (or Secondary, Standby) Data Center (부 데이터 센터)로 구성하며, Failover(장애 조치), Switchover(역할 전환)와 같은 프로세스를 통해서 실행합니다.

### OCI Full Stack Disaster Recovery Service란?
OCI Full Stack Disaster Recovery Service(이하 FSDR)은 OCI의 DRaaS(Disaster Recovery-as-a-Service)서비스로서, 인프라, 미들웨어, 데이터베이스 및 애플리케이션을 포함하여 애플리케이션 스택의 모든 계층에 대한 포괄적인 재해 복구 기능을 제공하는 서비스입니다. OCI FSDR에서는 DR 작업을 위한 심플하고 일관된 인터페이스를 제공함으로서, 사용자는 장애 조치(Failover) 및 전환(Switchover)을 쉽게 구성하고 실행할 수 있습니다.

![](https://blogs.oracle.com/content/published/api/v1.1/assets/CONT4CEE0E1B6C454B19B1A4FCA9F21F012E/Medium?cb=_cache_d840&format=jpg&channelToken=c0ac9bfde37248f38e73686663696424 " ")

### FSDR을 사용하는 이유?
일반적으로 한 두개의 애플리케이션에 대한 복구의 경우 짧은 시간내에 복구가 가능하겠지만, 더 많은 애플리케이션에 대한 대규모 복구를 필요로 하는 상황이라면 어떻게 해야 할까요? 클라우드 환경에서 엔터프라이즈 기업은 미션 크리티컬 및 비즈니스 크리티컬한 애플리케이션들을 운영하고 있으며, 이러한 시스템의 수가 수십개에서 수백개 이상으로 확장될 수 있습니다. 또한 각 애플리케이션 시스템은 개별 RPO와 RTO를 충족하기 위해 서로 다른 복구 프로세스를 포함하는 서로 다른 배포 아키텍처를 가질 수 있습니다. FSDR은 여러 시스템을 동시에 복구해야 하는 경우, 이러한 작업 처리를 위한 대규모 재해 복구 워크플로우를 처리하도록 설계되었습니다. 단순한 사용자 액션으로 애플리케이션 스택의 한 부분만 복구하거나, 전체 애플리케이션 스택을 복구할 수 있습니다.

### FSDR 주요 용어 및 개념
https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/disaster-recovery/doc/disaster-recovery-terminology.html

* **Full Stack** - Business System, Application, Software Service의 모든 기능 계층을 집합적으로 지칭하는데 사용하는 용어로 일반적으로 Application은 Application Tier, Middleware Tier, Database Tier 및 Infrastructure Tier로 구성될 수 있습니다.
* **Primary** - 일반적으로 사용 중인 애플리케이션 또는 서비스의 프로덕션 버전을 의미하며, OCI Full Stack DR에서도 Primary Role, Primary Version과 같은 용어로 사용됩니다.
* **Standby** - Primary Version 복구를 위한 Standby(대기) Version입니다. Standby는 애플리케이션이나 서비스가 복원될 대체 지역을 참조하는 데에도 사용됩니다. OCI Full Stack DR에서도 Standby Role, Standby Version과 같은 용어로 사용됩니다.
* **Warm Standby** - DR 전환을 준비하기 위한 Application 또는 Service의 일부 또는 전체 구성 요소가 Standby 지역에 사전 배포되어 있는 DR 모델입니다. DR 지역에 미리 배포해 놓기 때문에 운영 비용은 더 높아질 수 있지만, RTO는 더 낮게 가져갈 수 있습니다.
* **Cold Standby** - DR 전환을 준비하기 위한 Application이나 Service의 구성 요소가 Standby 지역에 사전 배포할 필요가 없는 DR 모델입니다. Application 구성 요소는 DR 전환 프로세스가 구성될 때 Standby 지역에 배포됩니다. 이 모델은 운영 비용은 낮지만 RTO는 Warm Standby에 비해서 높아질 수 있습니다.
* **Role** - Application과 지역이 현재 Primary(Production) version인지 Standby(Reserved) Version인지 지정합니다. DR 전환이 이뤄지면, Application과 해당 지역의 역할은 서로 바뀌게 됩니다.
* **Resource** - Resource는 독립적으로 사용하고 관리할 수 있는 OCI 구성 요소입니다. OCI리소스와 FSDR 리소스로 구분할 수 있습니다.
    * **OCI Resource** - Compute Instance, Block Volume, Database, Load Balancer등
    * **FSDR Resource** - DR Protection Group, DR Plan 및 DR Plan Execution
* **DR Protection Group** - FSDR 리소스중 하나입니다. DR Protection Group은 Application을 구성하는 다양한 OCI 리소스의 모음으로, 재해 복구 대상이 되는 모든 리소스들을 모아놓은 그룹을 의미합니다. DR Protection Group에 포함될 수 있는 리소스들은 Application Server(Compute Instance), 관련된 Block Storage (Volume Group으로 그룹화하여 사용), 및 데이터베이스등이 될 수 있습니다. DR Protection Group은 Primary 지역과 Standby 지역에 각각 생성할 수 있습니다.
* **Association** - 두 개의 DR Protection Group (e.g. Primary 및 Standby)간에 연결을 Association이라고 합니다. FSDR에서 DR Protection Group은 Primary와 Standby 관계에서 연결되어야 합니다.
* **DR Plan** - FSDR 리소스중 하나입니다. DR Plan은 DR Protection Group 쌍과 연결된 DR Workflow를 나타냅니다. DR Plan은 일련의 Plan Group으로 표시가 되며, Plan Group은 Plan Step으로 구성됩니다. DR Plan은 Standby DR Protection Group에서만 생성할 수 있습니다.
* **DR Plan Execution** - FSDR 리소스중 하나입니다. DR Plan Execution은 DR Plan의 각 단계(DR Step)에 대한 실행을 의미합니다. DR Plan Execution은 Standby DR Protection Group에서만 생성(실행)될 수 있습니다.
* **Plan Group** - DR Plan의 Step Group을 의미합니다. DR Plan은 순차적으로 실행되는 하나 이상의 Plan Group으로 구성됩니다. Plan Group의 모든 단계는 병렬로 실행됩니다.
* **Plan Step** - DR Plan에서의 단일 실행 단위입니다. 하나의 Plan Step은 하나의 Plan Group에 속해야 합니다.
* **Built-In Groups or Steps** - DR Plan을 생성할 때 FSDR이 기본 제공하는 Plan Group 또는 Step의 유형입니다. Built-In Groups or Steps의 예는 Launch Compute Instance, Switchover Database 등입니다.
* **User-Defined Groups or Steps** - FSDR에 의해 DR Plan이 생성된 후 사용자가 DR Plan에 임의로 추가하는 Plan Group또는 Step의 유형입니다.
* **Precheck** - DR Plan 실행을 위한 사전 검사 세트입니다. DR Plan에 대한 Precheck은 일련의 검사를 수행하여 DR Plan이 ㅇDR Protection Group의 멤버(리소스) 및 구성을 준수하는지 확인합니다.
* **Switchover** - Primary DR Protectoin Group에서 Standby DR Protection Group으로 계획하에(Planned) 서비스 전환(Switchover)을 수행하는 DR Plan 유형입니다. Switchover Plan은 Primary 지역에서 Application Stack을 종료한 후 Standby 지역에서 시작하는 형태로 순차적 전환을 수행합니다. 따라서 Switchover Plan에서는 Application stack 구성 요소와 기타 필수 OCI 서비스를 두 지역 모두에서 사용할 수 있어야 합니다.
* **Failover** - Standby DR Protection Group으로 불시에(Unplanned) 서비스 전환을 수행하는 DR Plan 유형입니다. Failover Plan은 일반적으로 Primary 지역에서 서비스를 종료하지 않고 Standby 지역으로 Application Stack을 가져와 즉각적으로 전환을 수행합니다. 따라서 Failover Plan에서는 Standby 지역에서만 OCI서비스를 사용할 수 있어야 합니다. Failover Plan은 일반적으로 가동 중단이나 재해가 Primary 지역에 영향을 미칠 때 DR 전환을 수행하는 데 사용됩니다.
* **DR Drill** - 연결된(Associated) DR Protection Group 쌍에 대해 DR Drill을 수행하면 Standby DR Protection Group에 Application Stack의 복제본이 생성됩니다. 이 복제본 Stack은 DR 프로세스의 효율성을 테스트하고 검증하는 데 사용할 수 있습니다. Start DR Drill Plan Execution은 Standby Application Stack 복제본을 생성하고 Stop DR Drill Plan Exectuion은 이 Application Stack 복제본을 종료합니다.

내용 좀 수정해야함... 알기 쉽게...

https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/disaster-recovery/doc/disaster-recovery-terminology.html