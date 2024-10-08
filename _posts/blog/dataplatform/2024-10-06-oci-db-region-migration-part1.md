---
layout: page-fullwidth
#
# Content
#
subheadline: "Migration"
title: "Data Gaurd를 사용하여 2세대 Shape 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하기 Part1: Oracle Database 19.17 이하"
teaser: "Data Gaurd를 사용하여 2세대 Shape Oracle Database 19.17 이하버전을 다른 리전에 3세대 Shape으로 마이그레이션하는 방법을 설명합니다."
author: "dankim"
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, database, migration]
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

### 배경
이 전 포스팅에서는 구세대 Shape의 인스턴스(일반 VM, WebLogic for OCI)를 다른 리전에 최신 세대 Shape의 인스턴스로 마이그레이션 하는 방법을 살펴 보았습니다.

[2세대 Shape 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하기 Part1: Compute Instance](https://the-team-oasis.github.io/infrastructure/oci-region-migration-part1/)

[2세대 Shape 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하기 Part2: WebLogic for OCI](https://the-team-oasis.github.io/infrastructure/oci-region-migration-part2/)

이번 포스팅에서는 구세대 Shape에 구성된 Oracle Database 19.17 이하 버전을 다른 리전에 최신 세대 Shape으로 마이그레이션 하는 방법을 설명합니다. 여기서는 Data Guard를 활용하는 방법과 Oracle Golden Gate를 활용하는 방법 두 가지를 Part1, Part2로 나누어 설명 드립니다.

Compute 인스턴스와 유사하게 Oracle Database도 최선 Shape으로 변경할 때 다음과 같은 제약이 있습니다.  
참고: [https://docs.oracle.com/en-us/iaas/base-database/doc/virtual-machine-db-systems.html](https://docs.oracle.com/en-us/iaas/base-database/doc/virtual-machine-db-systems.html)
* Arm-based Ampere A1 shape is available for Oracle Database version 19c with the 19.19.0.0 and later release updates (RU) only.
* AMD E5 shape is available for Oracle Database versions 23ai, 21c, and 19c.
* AMD E4 shape is available for Oracle Database versions 23ai, 21c, and 19c with the 23.4.0.24.05, 21.6.0.0, 19.15.0.0, and later release updates (RU) only.
* Intel X9 shape is available for Oracle Database versions 23ai, 21c, and 19c with the 23.4.0.24.05, 21.8.0.0, 19.17.0.0, and later release updates (RU) only.
* Multi-node RAC DB systems require a minimum of two OCPUs per node.

위 내용처럼 만약 구세대(Standard2.x) Shape에서 19.17버전 이하를 사용하고 있다면, 바로 Shape 변경이 되지 않습니다. 따라서 Data Guard를 활용하여 다른 리전에 최신 Shape으로 마이그레이션을 하려면, 19.17버전 이상으로 업그레이를 한 후에 진행하여야 합니다.

### Primary Database 준비
여기서는 서울 리전을 Primary, 싱가폴 리전을 Standby로 설정하고 진행합니다. 우선 Primary Database를 다음과 같이 Extreme Performance RAC 2 노드로 준비합니다.
> 현재 19.17 이하 버전은 OCI에서 제공되고 있지 않은 관계로 가장 낮은 버전인 19.21에 Standard2.x Shape 기반으로 테스트를 진행하였습니다.

<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-1.png" width="50%" height="50%">

<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-2.png" width="50%" height="50%">

최신 버전으로 업그레이드 하기전에 우선 백업을 위한 용도로 Custom Image를 생성합니다. 
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-3.png" width="50%" height="50%">

### 버전 업그레이드
현재 버전은 19.21.0.0.0 버전이며, 19.24.0.0.0 버전으로 업그레이드를 진행합니다. 업그레이드 가능 버전을 우선 확인합니다.
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-4.png" width="50%" height="50%">
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-5.png" width="50%" height="50%">

#### DB system 및 Database Patch 
DB system Patch 원하는 버전 선택 후 Run Precheck 진행합니다. 성공하면 Apply를 합니다. (약 1시간 소요)
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-6.png" width="50%" height="50%">

Database Patch 원하는 버전 선택 후 Run Precheck 진행합니다. 성공하면 Apply를 합니다. (약 1시간 30분 소요)
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-7.png" width="50%" height="50%">

### Remote Peering 구성
다른 리전에 Standby DB를 구성하기 위해서는 리전 간 네트워크 연결을 위한 Remote Peering을 구성하여야 합니다. Remote Peering 구성은 다음 포스팅을 참고합니다.

[OCI Remote Peering - 서로 다른 리전간의 VCN 연결하기](https://the-team-oasis.github.io/infrastructure/oci-remote-peering/)

### Data Guard 구성
#### Data Guard 구성을 위한 요건 확인
* 두 DB 시스템은 같은 구획에 있어야 합니다.
* 데이터베이스 버전과 에디션은 동일해야 합니다.
* Data Guard는 Oracle Database Standard Edition을 지원하지 않습니다. (Active Data Guard에는 Enterprise Edition Extreme Performance가 필요합니다.)
* Data Guard 연관의 각 데이터베이스는 Data Guard 연관을 수용하는 DB 시스템의 다른 데이터베이스에서 사용되지 않는 고유한 이름(DB_UNIQUE_NAMEDB_NAME) 값을 가져야 합니다. 그러나 Primary 및 Standby 데이터베이스는 동일한 데이터베이스 이름 값을 사용할 수 있습니다.
* Primary 및 Standby 데이터베이스가 동일한 지역에 있는 경우, 둘 다 동일한 가상 클라우드 네트워크(VCN)를 사용해야 합니다.
* Primary 및 Standby 데이터베이스가 다른 지역에 있는 경우 각 데이터베이스에 대한 가상 클라우드 네트워크(VCN)를 피어링해야 합니다
* Primary 데이터베이스와 Standby 데이터베이스는 다른 지역에 있을 수 있지만 동일한 영역에 있어야 합니다.
* Primary 및 Standby 데이터베이스의 비밀번호 SYS와 TDE 지갑 비밀번호는 모두 동일해야 합니다.
* Primary 데이터베이스와 Standby 데이터베이스는 서로 1521로 통신이 가능해야 합니다.

#### Primary Database 데이터 확인
Data Guard 구성 전에 우선 Primary Database내의 데이터를 확인합니다.

```
[oracle@srcdb1 ~]$ sqlplus / as sysdba

SQL*plus: Release 19.0.0.0.0 - Production on Wed Oct 2 10:53:33 2024
Version 19.21.0.0.0

Copyright (c) 1982, 2022, Oracle. All rights reserved.

Connected to:
Oracle Database 19c EE Extreme Perf Release 19.0.0.0.0 - Production
Version 19.21.0.0.0

SQL> show pdb names;
SP2-0158: unknown SHOW option "pdb_names"
SOL> show pab
SP2-0158: unknown SHOW option "pdb"
SQL> show pabs;
CON ID CON NAME                             OPEN MODE  RESTRICTED
------ ------------------------------------ ---------  ----------
     2 POB$SEED                             READ ONLY  NO
     3 SRCPDB                               READ WRITE NO
SQL> alter session set container = SRCPDB;
Session altered.
SOL> show con name;
CON NAME
SRCPDB

SOL> select count(*) from sample t;
COUNT (* )
----------
10000
```

#### Data Guard 활성화
***Oracle Base Database → DB Systems → DB System Details → Database Details → Data Guard Associations***로 이동 후 다음 옵션과 함께 Data Guard를 활성화 합니다.

* **Display name:** srcDG
* **Region:** Singapore
* **Configure shape:** VM.Standard3.Flex (2 OCPU, 32 GB Memory)
* **Total node count:** 2 (Primary와 동일하게 2 노드 RAC로 구성)

* **Virtual cloud network:** Standby DB가 구성될 VCN 선택
* **Subnet:** Standby DB가 구성될 Subnet 선택
* **Hostname prefix:** srcDG
* **Data Guard type:** Data Guard
* **Protection mode:** Maximum Performance (Cross Region Data Guard 연결의 경우 Maximum performance만 지원)
* **Database password:** 기존 DB의 sys Password

**구성 완료**  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-9.png" width="50%" height="50%">

### Failover 및 Switchover 수행
Switchover는 Primary 데이터베이스와 Standby 데이터베이스의 역할을 서로 바꾸는 과정입니다. 이 과정에서는 데이터 손실이 없으며, 주 데이터베이스에서 계획된 유지보수를 하기 전에 사용할 수 있습니다. 대기 데이터베이스를 주 데이터베이스로 바꾸고 유지보수를 수행한 후 다시 역할을 원래대로 되돌립니다.

Failover는 Primary 데이터베이스가 고장 나거나 접근할 수 없게 되었을 때, Standby 데이터베이스를 Primary 데이터베이스 역할로 전환하는 것입니다. 이 경우, 최대 성능 보호 모드를 사용할 때 약간의 데이터 손실이 발생할 수 있습니다.

#### Failover 수행 및 확인
Failover는 Primary DB에 장애가 발생했다는 가정하에 수행하는 절차이므로, Standby DB에서 수행합니다.
Standby DB가 있는 Singapore 리전에서 ***Oracle Base Database → DB Systems → DB System Details → Database Details → Data Guard Associations*** 이동한 후 오른쪽 메뉴 아이큰 클릭하여 Failover를 클릭합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-10.png" width="50%" height="50%">

Failover가 완료되면 기존 Primary DB는 Disabled Standy 상태로 Role이 변경되며, 기존 Standby DB가 Primary Role을 갖게 됩니다.
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-11.png" width="50%" height="50%">

이제 Primary로 전환된 DB로 접속하여 데이터를 확인합니다.

```
[oracle@srcdg1 ~]$ sqlplus / as sysdba

SQL *plus: Release 19.0.0.0.0 - Production on Fri Oct 4 13:43:46 2024
Version 19.24.0.0.0

Copyright (c) 1982, 2024, Oracle. All rights reserved.

Connected to:
Oracle Database 19c EE Extreme Perf Release 19.0.0.0.0 - Production
Version 19.24.0.0.
SQL> show parameter db name
NAME                   TYPE              VALUE
---------------------- ----------------- -----------
db _name               string            sredb

SQL> select instance_name, status from v$instance;
INSTANCE NAME         STATUS
--------------------- ----------
srcdb1                OPEN

SQL> select database_role, open_ mode from v$database;
DATABASE_ ROLE         OPEN MODE
---------------------- -----------
PRIMARY                READ WRITE

CON ID CON NAME                             OPEN MODE  RESTRICTED
------ ------------------------------------ ---------  ----------
     2 POB$SEED                             READ ONLY  NO
     3 SRCPDB                               READ WRITE NO

SQL> alter session set container = SRCPDB;
Session altered.
SOL> show con name;
CON NAME
SRCPDB

SOL> select count(*) from sample t;
COUNT (* )
----------
10000
```

여기까지 수행하면, 다른 리전으로 최신세대 Shape 기반의 DB를 마이그레이션하는 과정이 완료됩니다. 다음 Switchover 내용은 기존 Primary DB로 원복할 경우를 가정할 때 사용할 수 있습니다.

#### Switchover 수행 및 확인
먼저 Primary Role로 변경된 Singapore 리전 Database에 10만건의 데이터를 추가하였습니다.

```
SOL> select count(*) from sample t;
COUNT (* )
----------
110000
```

Singpore 리전에서 ***Oracle Base Database → DB Systems → DB System Details → Database Details → Data Guard Associations*** 이동한 후 오른쪽 메뉴 아이큰 클릭하여 Reinstate를 클릭합니다. 이 과정은 기존 Primary DB와 끊어진 Data Guard를 다시 연결하고, Disabled Standby Role을 Standby Role로 변경하는 과정을 수행합니다. Reinstate가 완료되면 Switchover를 수행하여, 다시 Role Change를 합니다.

**Reinstate**  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-12.png" width="50%" height="50%">

**Switchover**  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part1-13.png" width="50%" height="50%">

마지막으로 다시 서울 리전에 Primary Role로 복구된 DB에 접속하여 확인합니다.
```
[oracle@srcdb1 ~]$ sqlplus / as sysdba

SQL *plus: Release 19.0.0.0.0 - Production on Fri Oct 4 13:43:46 2024
Version 19.24.0.0.0

Copyright (c) 1982, 2024, Oracle. All rights reserved.

Connected to:
Oracle Database 19c EE Extreme Perf Release 19.0.0.0.0 - Production
Version 19.24.0.0.
SQL> show parameter db name
NAME                   TYPE              VALUE
---------------------- ----------------- -----------
db _name               string            sredb

SQL> select instance_name, status from v$instance;
INSTANCE NAME         STATUS
--------------------- ----------
srcdb1                OPEN

SQL> select database_role, open_ mode from v$database;
DATABASE_ ROLE         OPEN MODE
---------------------- -----------
PRIMARY                READ WRITE

CON ID CON NAME                             OPEN MODE  RESTRICTED
------ ------------------------------------ ---------  ----------
     2 POB$SEED                             READ ONLY  NO
     3 SRCPDB                               READ WRITE NO

SQL> alter session set container = SRCPDB;
Session altered.
SOL> show con name;
CON NAME
SRCPDB

SOL> select count(*) from sample t;
COUNT (* )
----------
110000
```