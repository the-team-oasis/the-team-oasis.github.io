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
Disaster Recovery(DR)은 지진, 태풍, 홍수 같은 천재지변부터 전쟁, 해킹, 갑작스러운 시스템 오류 등 예상치 못한 재해 속에서도 서비스가 계속 운영될 수 있도록 하는 것을 말합니다. 재해 복구 목표는 Recovery Point Objective(RPO) 및 Recovery Time Objective(RTO)로 측정됩니다. RPO는 목표 복구 시점으로 "장애 발생 시 비즈니스 연속을 위해 어느 시점으로 백업할지 결정하게 될 지표"를 의미하며, RTO는 목표 복구 시간으로 "장애 발생 시 시스템을 원 상태로 복원하는데 소요되는 시간"을 의미합니다. 일반적으로 RPO와 RTO 값을 작게 가져가는 것이 좋지만, 이러한 요구사항을 충족하는데 들어가는 비용은 증가하게 됩니다.

DR 구성은 일반적으로 실 운영환경인 Primary Data Center (주 데이터센터)에 대한 DR (or Secondary, Standby) Data Center (부 데이터 센터)로 구성하며, Failover(장애 조치), Switchover(역할 전환)와 같은 프로세스를 통해서 실행합니다.

### OCI Full Stack Disaster Recovery Service란?
OCI Full Stack Disaster Recovery Service(이하 FSDR)은 OCI의 DRaaS(Disaster Recovery-as-a-Service) 서비스로서, 인프라, 미들웨어, 데이터베이스 및 애플리케이션을 포함하여 애플리케이션 스택의 모든 계층에 대한 포괄적인 재해 복구 기능을 제공하는 서비스입니다. OCI FSDR에서는 DR 작업을 위한 심플하고 일관된 인터페이스를 제공함으로써, 사용자는 장애 조치(Failover) 및 전환(Switchover)을 쉽게 구성하고 실행할 수 있습니다.

![](https://blogs.oracle.com/content/published/api/v1.1/assets/CONT4CEE0E1B6C454B19B1A4FCA9F21F012E/Medium?cb=_cache_d840&format=jpg&channelToken=c0ac9bfde37248f38e73686663696424 " ")

### FSDR을 사용하는 이유?
일반적으로 한두 개의 애플리케이션에 대한 복구의 경우 짧은 시간 내에 복구가 가능하겠지만, 수많은 애플리케이션에 대한 대규모 복구를 필요로 하는 상황이라면? 클라우드 환경에서 엔터프라이즈 기업은 미션 크리티컬, 비즈니스 크리티컬한 애플리케이션들을 운영하고 있으며, 이러한 시스템의 수가 수십 개에서 많게는 수백 개 이상으로 확장될 수 있습니다. 또한 각 애플리케이션 시스템은 개별 RPO와 RTO를 충족하기 위해 서로 다른 복구 프로세스를 갖는 서로 다른 배포 아키텍처를 가질 수 있습니다. FSDR은 여러 시스템을 동시에 복구해야 하는 경우, 이러한 작업 처리를 위한 대규모 재해 복구 워크플로우를 처리하도록 설계되었습니다. 단순한 사용자 액션으로 애플리케이션 스택의 한 부분만 복구하거나, 전체 애플리케이션 스택을 복구할 수 있습니다.

### FSDR 주요 용어 및 개념
* **Full Stack** - Business System, Application, Software Service의 모든 기능 계층을 집합적으로 지칭하는 데 사용하는 용어로, 일반적으로 Application은 Application Tier, Middleware Tier, Database Tier 및 Infrastructure Tier로 구성될 수 있는데, 이러한 전체 계층(Tier)를 Full Stack이라고 부릅니다.
* **Primary** - 일반적으로 애플리케이션 또는 서비스의 Production Version과 Production Version이 위치한 환경을 지칭합니다. OCI Full Stack DR에서도 Primary Role, Primary Version과 같은 용어와 함께 사용됩니다.
* **Standby** - Primary Version 복구를 위한 Standby(대기) Version과 Standby Version이 위치한 환경입니다. Standby는 애플리케이션이나 서비스가 복원될 지역을 나타내는 이름으로도 사용됩니다. OCI Full Stack DR에서도 Standby Role, Standby Version과 같은 용어와 함께 사용됩니다.
* **Warm Standby** - DR을 위한 Application 또는 Service의 일부 또는 전체 구성 요소가 Standby 지역에 사전 배포되어 있는 DR 모델입니다. DR 지역에 미리 배포해 놓기 때문에 운영 비용은 더 높아질 수 있지만, RTO (복구 시간)는 더 낮게 가져갈 수 있습니다.
* **Cold Standby** - DR을 위한 Application이나 Service의 구성 요소가 Standby 지역에 사전 배포되어 있지 않은 DR 모델입니다. Application 구성 요소는 DR 전환 프로세스가 동작할 때 Standby 지역에 배포됩니다. 이 모델은 운영 비용은 낮지만 RTO (복구 시간)는 Warm Standby에 비해서 더 많이 소요될 수 있습니다.
* **Role** - Application과 지역이 현재 Primary(Production) version인지 Standby(Reserved) Version인지 지정합니다. DR 전환이 이뤄지면, Application과 해당 지역의 역할은 서로 바뀌게 됩니다.
* **Resource** - Resource는 FSDR에서 관리되는 독립적인 OCI 구성 요소입니다. Resource는 OCI Resource와 FSDR Resource로 구분할 수 있습니다. 아래는 OCI Resource와 FSDR Resource의 종류입니다.
  * **OCI Resource** - DR Protection Group안에서 **Member**로도 표기됩니다. 글을 작성하는 시점에서 지원되는 OCI Resource는 ***Compute Instances, Boot and Block Volumes (Volume Groups), Oracle Exadata Database Service, Oracle Base Database Service, Oracle Autonomous Database Serverless, File Systems, Load Balancers, Network Load Balancers*** 입니다.
  * **FSDR Resource** - FSDR Resource에는 ***DR Protection Group, DR Plan 및 DR Plan Execution***이 있습니다.
* **DR Protection Group** - FSDR에서 사용되는 Resource입니다. DR Protection Group은 Application을 구성하는 여러 OCI Resource의 모음으로, 재해 복구 대상이 되는 모든 Resource들을 모아놓은 그룹을 의미합니다. DR Protection Group에 포함될 수 있는 리소스들은 Application Server(Compute Instance), 관련된 Block Storage (Volume Group으로 그룹화하여 사용), 및 데이터베이스 등이 될 수 있습니다. DR Protection Group은 Primary 지역과 Standby 지역에 각각 생성할 수 있습니다.
* **Association** - 두 개의 DR Protection Group (e.g. Primary 및 Standby)간에 연결을 Association이라고 합니다. 이 Association이라는 작업을 통해서 Primary DR Protection Group과 Standby Protection Group이 서로 연결됩니다.
* **DR Plan** - FSDR에서 사용되는 Resource입니다. DR Plan은 Association 되어있는 두 개의 DR Protection Group을 위한 DR 워크플로우로 Failover, Switchover, Drill과 같은 DR 작업 흐름(일종의 DR 프로세스)을 의미합니다. DR Plan은 순차적인 Plan Group으로 구성되며, Plan Group은 Plan Step으로 구성됩니다. DR Plan은 Standby DR Protection Group에서만 생성할 수 있습니다.
* **DR Plan Execution** - FSDR 리소스 중 하나입니다. DR Plan Execution은 DR Plan에 속한 Plan Group과 각 Plan Group 내의 각 단계(Plan Step)에 대한 실행을 의미합니다. DR Plan Execution은 Standby DR Protection Group에서만 생성(실행)될 수 있습니다.
* **Plan Group** - DR Plan에서 실행되는 Plan Step에 대한 Group입니다. DR Plan은 순차적으로 실행되는 하나 이상의 Plan Group으로 구성됩니다. Plan Group내의 Plan Step은 병렬로 실행됩니다.
  * **Failover Plan Group 예시:** Built-In Prechecks, Failover Volume Groups, Launch Compute Instances
  * **Switchover Plan Group 예시:** Built-In Prechecks, Switchover Volume Groups, Launch Compute Instances, Remove Compute Instances from DR Protection Group
* **Plan Step** - DR Plan에서의 단일 실행 단위입니다. 하나의 Plan Step은 하나의 Plan Group에 속해야 합니다.
* **Built-In Groups or Steps** - DR Plan을 생성할 때 FSDR이 기본 제공하는 Plan Group 또는 Step을 의미합니다. 
  * **Built-In Groups or Steps 예시:** Launch Compute Instance, Switchover Database 등
* **User-Defined Groups or Steps** - FSDR에 의해 DR Plan이 생성된 후 사용자가 DR Plan에 임의로 추가하는 Plan Group또는 Step을 의미합니다.
* **Precheck** - DR Plan 실행을 위한 사전 검사 세트입니다. DR Plan에 대한 Precheck은 일련의 검사를 수행하여 DR Plan이 DR Protection Group의 멤버(리소스) 및 구성을 준수하는지 확인합니다.
* **Switchover** - Primary DR Protectoin Group에서 Standby DR Protection Group으로 계획된(Planned) 서비스 전환(Switchover)을 수행하는 DR Plan 유형입니다. Switchover Plan은 Primary 지역에서 Application Stack을 종료한 후 Standby 지역에서 새로 시작하는 것과 같은 순차적 전환을 수행합니다. Switchover Plan에서는 Application stack 구성 요소와 기타 필수 OCI 서비스를 Primary와 Standby 두 지역 모두에서 사용할 수 있는 형태입니다.
* **Failover** - Standby DR Protection Group으로 불시에(Unplanned) 서비스 전환을 수행하는 DR Plan 유형입니다. Failover Plan은 Primary 지역에서 서비스를 종료하지 않고 Standby 지역으로 Application Stack을 가져와 바로 전환을 수행합니다. 따라서 Failover Plan에서는 Standby 지역에서만 OCI서비스를 사용할 수 있는 형태가 됩니다. Failover Plan은 일반적으로 Primary 지역에서 가동 중단이나 재해가 발생한 경우 즉각적인 DR 전환을 위해 사용됩니다.
* **DR Drill** - 연결된(Associated) 두 개의 DR Protection Group에 대해 DR Drill을 수행하면 Standby DR Protection Group에 Production Application Stack의 복제본이 생성됩니다. 이 복제본 Stack은 DR 프로세스의 효율성을 테스트하고 검증하는 데 사용할 수 있습니다. 일반적으로 Production 환경에 영향을 주지 않고, DR 테스트를 하는 경우 사용됩니다. Drill Plan은 Start Drill Plan과 Stop Drill Plan을 쌍으로 구성할 수 있습니다.
  * **Start DR Drill Plan:** Standby에 Production Application Stack 복제본을 생성하고, DR 워크플로우를 실행하는 Plan입니다.
  * **Stop DR Drill Plan:** Standby에 복제된 Production Application Stack 복제본을 모두 종료(Terminate)합니다. 이 Plan은 Primary 및 Standby DR Protection Group 상태가 Inactive (Drill in Progress)일 경우만 실행할 수 있습니다.

### DR Drill Plan 실행해 보기
#### DR Drill Plan에 대한 이해
DR Plan으로 Failover, Switchover, Start DR Drill, Stop DR Drill Plan이 현재 제공되고 있습니다. 이 중에서 Drill Plan을 실행해 보겠습니다. 먼저 DR Drill Plan을 실행해 보기전에 다음의 내용에 대해서 이해하고 있어야 합니다.
* DR Drill Plan은 Standby 지역에 Production Application Stack을 복제한 후 Standby 지역에서 DR 테스트를 수행하는 Plan입니다.
* Start DR Drill Plan을 실행하면, Primary 및 Standby DR Protection Group 상태는 Stop DR Drill Plan을 실행하기 전까지 Inactive (Drill in Progress) 상태로 변경됩니다.
* Start DR Drill Plan이 실행되는 동안, DR Protection Group의 내용은 변경할 수 없습니다.
* Start DR Drill Plan이 실행되는 동안, Failover 및 Switchover Plan은 실행될 수 없습니다. 기본적으로 DR Protection Group내의 모든 Plan의 상태는 Inactive 상태가 됩니다.
* Stop DR Drill Plan은 Start DR Drill Plan에서 생성된 Production Stack의 복제본을 제거하는 Plan입니다.
* Stop DR Drill Plan은 Start DR Drill Plan이 실행된 후에만 생성할 수 있으며, 이 때 Primary 및 Standby DR Protection Group 상태는 Inactive (Drill in Progress) 상태여야 합니다.
* Stop DR Drill Plan이 완료된 후에는 Primary 및 Standby DR Protection Group의 상태는 "Active" 상태가 됩니다. 또한 다른 모든 Plan의 상태가 Active 상태로 변경되어, 실행할 수 있는 상태가 됩니다.

#### Drill Plan 실행을 위한 준비
다음은 DR Drill Plan 실행을 위한 DR 토폴로지 구성 예시입니다.
![](/assets/img/infrastructure/2024/oci-fsdr-overview-1.png " ")

위 그림에서 알 수 있듯이 Primary 지역은 OCI 서울 리전, Standby 지역은 OCI 춘천 리전으로 구성하였습니다. DR 대상이 되는 리소스는 다음과 같이 준비합니다. 

> 리소스 구성에 대한 자세한 내용은 여기서 다루지 않습니다.

* 서울(Primary) 지역에 VM 2개 (instance-1, instance-2) 생성
* 서울(Primary) 지역에 각 VM Instance에 대한 Boot Volume Group 생성 및 Cross Region Replication 설정
* 서울(Primary) 지역에 OCI Autonomous Transaction Processing- Serverless 데이터베이스 생성 및 춘천(Standby) 지역에 Cross Region Autonomous Data Guard 구성

#### DR Drill Plan 구성 및 실행
Resource가 모두 준비되면 FSDR의 DR Drill Plan을 구성해보겠습니다.

##### 1. DR Protection Group 생성 및 Association, Resource Member 추가
DR Protection Group 생성을 위해 먼저 ***OCI 메뉴 > Migration & Disaster Recovery > DR Protection Group***으로 이동합니다.
![](/assets/img/infrastructure/2024/oci-fsdr-overview-2.png " ")

**Create DR protection group** 버튼 클릭 후 보이는 대화창에서 DR Protection Group 명, 구획, Object Storage (Plan 실행 로그 저장용도), Role(Primary or Standby), Member를 구성할 수 있습니다. 
![](/assets/img/infrastructure/2024/oci-fsdr-overview-3.png " ")

다음은 DR Protection 생성 및 Association 구성 과정입니다.  
* 서울(Primary) 지역에 **Drill-ICN** 이름의 DR Protection Group을 생성합니다. (참고: ICN은 서울 지역에 대한 OCI Region Code 입니다)  
* 춘천(Standby) 지역에 **Drill-YNY** 이름의 DR Protection Group을 생성합니다. (참고: YNY는 춘천 지역에 대한 OCI Region Code 입니다.)  
* **Drill-ICN** DR Protection Group을 선택한 후 **Associate** 버튼을 클릭하여 Role을 **Primary**, Peer Region을 **South Korea North (Chuncheon)**, Peer DR protection group을 **Drill-YNY**으로 선택하여 **Association**을 합니다. **Drill-YNY** DR Protection Group은 자동으로 **Standby** Role로 설정됩니다.
* **Drill-ICN** DR Protection Group을 선택한 후 왼쪽 Resources에 있는 Members를 선택, **Add member**를 클릭하여 다음의 Member Resource를 추가합니다.
  * instance-1, instance-2 (moving-instance 옵션 선택: Cold Standby 구성을 위한 옵션입니다.)
  * Volume Group
  * Primary Database
* **Drill-YNY** DR Protection Group을 선택한 후 왼쪽 Resources에 있는 Members 선택, **Add member**를 클릭하여 다음의 Member Resource를 추가합니다.
  * Standby Database (Cross Region Autonomous Data Guard를 통해서 생성된 Standby Database)

> Moving-Instance 옵션은 Cold Standby 구성으로 Standby 지역에 미리 리소스를 배포하지 않는 구성을 위한 옵션입니다. 현재 Standby 지역에는 Standby Database만 존재하므로, Standby DR Protection Group에는 Standby Database만 포함될 수 있습니다.

**서울(Primary) 지역 DR Protection Group Member 구성 내용**
![](/assets/img/infrastructure/2024/oci-fsdr-overview-4.png " ")

**춘천(Secondary) 지역 DR Protection Group Member 구성 내용**
![](/assets/img/infrastructure/2024/oci-fsdr-overview-5.png " ")

##### 2. Start DR Drill Plan 생성
Drill Plan은 Standby 지역에서 생성합니다. 
* 춘천(Standby) 지역의 **Drill-YNY** DR Protection Group을 선택한 후 왼쪽 Resources의 **Plans**를 선택하고, **Create plan** 버튼을 클릭합니다.
* 대화창에서 이름을 **Start Drill-YNY**, Plan type을 **Start drill**을 선택한 후 생성합니다. 참고로 여기서 비슷하게 Failover Plan과 Switchover Plan을 생성할 수 있습니다.

> Stop Drill Plan은 Start Drill Plan을 실행한 후에만 생성이 가능합니다.

생성된 Start drill plan을 선택하면, Plan내에 Plan Group과 각 Plan Group내의 Plan Step을 볼 수 있습니다.
![](/assets/img/infrastructure/2024/oci-fsdr-overview-6.png " ")

##### 3. Start DR Drill Plan의 Precheck 실행(Execute)
Start DR Drill Plan을 실행하기 전에 첫 번째 위치한 Plan Group인 Precheck만 먼저 실행해 볼 수 있습니다. **Start Drill-YNY** Plan을 선택한 후 **Run prechecks** 버튼을 클릭합니다. 여기서 Plan execution 이름으로 **startdrill-prechecks-yny**를 입력하고 **Run prechecks**를 클릭합니다.
![](/assets/img/infrastructure/2024/oci-fsdr-overview-7.png " ")

**Built-in Prechecks** Plan Group의 모든 Plan Step이 성공적으로 수행된 것을 확인할 수 있습니다.
![](/assets/img/infrastructure/2024/oci-fsdr-overview-8.png " ")

##### 4. Start DR Drill Plan 실행(Execute)
**Start Drill-YNY**을 선택한 후 **Execute DR plan** 을 클릭하고, **Enable prechecks** 체크해제, **Plan execution name**을 **execute-startdrill-yny**로 입력한 후 **Execute DR plan**을 클릭하여 실행합니다.
![](/assets/img/infrastructure/2024/oci-fsdr-overview-9.png " ")

**Start Drill-YNY** Plan의 모든 Plan Group과 Plan Step 실행이 정상적으로 완료된 것을 볼 수 있습니다.
![](/assets/img/infrastructure/2024/oci-fsdr-overview-9-1.png " ")

##### 5. Start Drill Plan 실행 결과
Start Drill Plan이 완료되면, 서울 지역에 있는 Production Application Stack이 춘천(Standby) 지역에 복제되고 실행됩니다. 서울(Primary) 지역에 있는 Boot Volume Group에 대한 복제본을 통해서 춘천(Standby) 지역에 VM이 생성되며, OCI Autonomous Transaction Processing- Serverless 데이터베이스에 대한 복제본이 춘천(Standby) 지역에 생성됩니다.
![](/assets/img/infrastructure/2024/oci-fsdr-overview-10.png " ")

**춘천(Standby) 지역에 생성된 Autonomous Transaction Processing- Serverless 데이터베이스 복제본**
![](/assets/img/infrastructure/2024/oci-fsdr-overview-11.png " ")

**춘천(Standby) 지역에 생성된 VM 인스턴스**
![](/assets/img/infrastructure/2024/oci-fsdr-overview-12.png " ")

##### 6. Stop Drill Plan 생성 및 실행(Execute)
Start DR Drill이 완료된 후에는 Primary와 Standby DR Protection Group의 상태는 **INACTIVE (DRILL IN PROGRESS)** 상태입니다. 위에서 언급한 것처럼 이 상태에서만 Stop Drill Plan을 생성하고 실행할 수 있습니다. 다음은 Stop Drill Plan을 생성하고 실행하는 과정입니다.
* **Drill-YNY** plan을 선택한 후 왼쪽 Resources의 Plans를 선택, **Create plan**을 클릭합니다.
* 이름을 **Stop Drill-YNY**로 입력하고, Plan type을 **Stop drill**로 선택하고 생성합니다.
* 생성된 **Stop Drill-YNY**를 선택한 후 **Execute DR plan**을 클릭합니다. 대화창에서 **Enable prechecks** 체크, **Plan execution name**을 **execute-stopdrill-yny**로 입력한 후 **Execute DR plan**을 클릭하여 Stop Drill Plan을 실행합니다.

**Stop Drill Plan 실행 완료**
![](/assets/img/infrastructure/2024/oci-fsdr-overview-12-1.png " ")

##### 7. Stop Drill Plan 실행 결과
Stop Drill Plan이 완료되면, 춘천(Standby) 지역에 복제된 VM 서울(Primary) 지역에 있는 VM 인스턴스, Boot Volume, OCI Autonomous Transaction Processing- Serverless 데이터베이스에 대한 복제본이 종료 및 삭제됩니다.
![](/assets/img/infrastructure/2024/oci-fsdr-overview-13.png " ")

또한 Primary와 Standby DR Protection Group의 상태가 모두 Active 상태로 변경되면서, 또 다른 Plan을 실행할 수 있는 준비 상태가 됩니다.

### 참고
 * [Full Stack Disaster Recovery Terminology and Concepts](https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/disaster-recovery/doc/disaster-recovery-terminology.html)
 * [OCI Full Stack Disaster Recovery Introduces DR Drills](https://blogs.oracle.com/maa/post/fullstackdr-drill-plans)