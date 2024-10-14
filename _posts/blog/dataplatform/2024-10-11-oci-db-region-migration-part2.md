---
layout: page-fullwidth
#
# Content
#
subheadline: "Migration"
title: "Oracle Golden Gate를 사용하여 2세대 Shape 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하기 Part2: Oracle Database 19.17 이하"
teaser: "Oracle Golden를 사용하여 2세대 Shape Oracle Database 19.17 이하버전을 다른 리전에 3세대 Shape으로 마이그레이션하는 방법을 설명합니다."
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
이 전 포스팅에서는 구세대 Shape의 Oracle Database 19.17 이하버전 인스턴스를 다른 리전에 최신 세대 Shape의 인스턴스로 마이그레이션 하는 방법을 살펴 보았습니다.

[Data Gaurd를 사용하여 2세대 Shape 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하기 Part1: Oracle Database 19.17 이하](https://the-team-oasis.github.io/dataplatform/oci-db-region-migration-part1/)

이번 포스팅에서는 구세대 Shape에 구성된 Oracle Database 19.17 이하 버전을 다른 리전에 최신 세대 Shape으로 마이그레이션 하는 방법을 설명합니다. 여기서는 Oracle Golden Gate를 활용하여 마이그레이션 하는 방법에 대해서 설명합니다.

Compute 인스턴스와 유사하게 Oracle Database도 최선 Shape으로 변경할 때 다음과 같은 제약이 있습니다.  
참고: [https://docs.oracle.com/en-us/iaas/base-database/doc/virtual-machine-db-systems.html](https://docs.oracle.com/en-us/iaas/base-database/doc/virtual-machine-db-systems.html)
* Arm-based Ampere A1 shape is available for Oracle Database version 19c with the 19.19.0.0 and later release updates (RU) only.
* AMD E5 shape is available for Oracle Database versions 23ai, 21c, and 19c.
* AMD E4 shape is available for Oracle Database versions 23ai, 21c, and 19c with the 23.4.0.24.05, 21.6.0.0, 19.15.0.0, and later release updates (RU) only.
* Intel X9 shape is available for Oracle Database versions 23ai, 21c, and 19c with the 23.4.0.24.05, 21.8.0.0, 19.17.0.0, and later release updates (RU) only.
* Multi-node RAC DB systems require a minimum of two OCPUs per node.

위 내용처럼 만약 구세대(Standard2.x) Shape에서 19.17버전 이하를 사용하고 있다면, 바로 Shape 변경이 되지 않습니다. 따라서 Oracle Golden Gate를 활용하여 다른 리전에 최신 Shape으로 마이그레이션을 진행합니다.

### Source 및 Target Database 준비
여기서는 서울 리전을 Source, 싱가폴 리전을 Target으로 설정합니다. 또한 Source DB 버전은 19.21.0.0.0 버전이며, Target DB 버전은 19.24.0.0.0이고, 모두 Extreme Performance RAC 2 노드로 구성하였습니다.

우선 두 데이터베이스에 다음과 같이 사전 작업을 진행합니다.
```
[oracle@srcdb1 ~]$ sqlplus / as sysdba

SQL*Plus: Release 19.0.0.0.0 - Production on Tue Oct 8 15:01:46 2024
Version 19.24.0.0.0

Copyright (c) 1982, 2024, Oracle. All rights reserved.

Connected to:
Oracle Database 19c EE Extreme Perf Release 19.0.0.0.0 - Production
Version 19.24.0.0.0
```

**Supplemental log 활성화 및 확인**
```
SQL> ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;
SQL> SELECT SUPPLEMENTAL_LOG_DATA_MIN FROM V$DATABASE;

SUPPLEME
--------
YES
```

**Archive log 활성화 확인**
```
SOL> ARCHIVE LOG LIST
Database log mode             Archive Mode
Automatic archival            Enabled
Archive destination           USE DB RECOVERY FILE DEST
Oldest online log sequence    4
Next log sequence to archive  5
Current loq sequence          5
```

**GG파라미터 변경 및 확인**
```
SOL> ALTER SYSTEM SET ENABLE_GOLDENGATE _REPLICATION=TRUE;

System altered.

SOL> show parameter enable goldengate replication;

NAME                            TYPE                VALUE
------------------------------- ------------------- ----------------------
enable_ goldengate_replication  boolean             TRUE
```

**CDB user 생성하고, 모든 Container에 대한 권한을 부여**
```
SQL> CREATE USER c##ggadm in IDENTIFIED BY KoreaPassport2024##;

User created.

SQL> GRANT CONNECT, RESOURCE, DBA TO c##ggadmin container=all;

Grant succeeded.

SQL> ALTER USER c##ggadmin QUOTA 100M ON USERS;

User altered.

SQL> GRANT SELECT ANY DICTIONARY TO c##ggadmin container=all;

Grant succeeded.

SQL> GRANT CREATE VIEW TO c##ggadmin container=all;

Grant succeeded.

SQL> GRANT EXECUTE ON dbms_lock TO c##ggadm in container=all;

Grant succeeded.

SOL> EXEC dbms_goldengate_auth.GRANT_ADMIN_ PRIVILEGE ('c##ggadmin' , container=›'all');
PL/SOL procedure successfully completed.
```

**pdb로 세션 변경 후 pdb용 user 생성**
```
SOL> show pabs;
CON_ID CON_NAME                 OPEN MODE  RESTRICTED
------ ------------------------ ---------- ----------
     2 PDB$SEED                 READ ONLY  NO
     3 SRCPDB                   READ WRITE NO

SOL> alter session set container=srcpdb;

Session altered.

SOL> create user src_ogg identified by KoreaPassport2024##;

User created.

SOLs arant connect, resource, dba to "SRC_OGG";

Grant succeeded.
```

동일하게 Target DB에도 **tg_ogg**라는 유저를 생성합니다.

### Vault Key 생성
***OCI 메뉴 > Identity & Security > Vault***로 이동한 후 Vault Master Encryption Key 및 Secret을 생성합니다.  
**Vault 생성**  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-1.png" width="50%" height="50%">

**Master Encryption Key 생성**  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-2.png" width="50%" height="50%">

**Secret 생성**  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-3.png" width="50%" height="50%">

### OGG Deployment 생성
***OCI 메뉴 > Oracle Database > GoldenGate***로 이동한 후 **Create Deployment**를 클릭하여 다음과 같이 OGG Deployment를 생성합니다.

* Name과 원하는 spec에 따라 OCPU수를 지정합니다.
* OGG가 생성될 Private Subnet 선택 및 Public Access 허용 체크
* 배포 형태는 임시 테스트이므로 Development or testing으로 선택
* Licence Type은 가지고 있는 OGG 라이선스를 활용하는 경우 BYOL, 아니면 License included로 선택합니다.

<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-4.png" width="50%" height="50%">

Data replication 선택 및 Goldengate instance name과 administrator username 추가 후 생성한 secret을 선택합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-5.png" width="50%" height="50%">

만약 **Public Access 허용 체크**를 하지 않은 경우라면, Edit을 클릭한 후 Public 접근이 가능하도록 체크해줍니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-6.png" width="50%" height="50%">

배포가 완료되어 ACTIVE 상태가 되면 Launch Console 버튼을 눌러 OGG Web에 접속합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-7.png" width="50%" height="50%">

Deployment를 생성할 때 지정한 user로 접속합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-8.png" width="50%" height="50%">

OGG가 정상적으로 작동되는 것을 확인합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-9.png" width="50%" height="50%">

### OCI OGG에 Source 및 Target DB 접속 생성
Golden Gate Connections로 이동한 후 **Create connection**을 클릭합니다. 그리고 다음과 같이 Source Database를 등록합니다. 본 가이드에서는 Database가 모두 DBCS를 사용하므로 Type을 Oracle Database로 설정합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-10.png" width="50%" height="50%">

Select database를 선택한 후 Source DB를 선택하면 관련 정보들이 자동으로 들어 갑니다. 사전 작업했던 CDB User와 Password를 입력합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-11.png" width="50%" height="50%">

이제 Target DB 연결 생성을 진행합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-12.png" width="50%" height="50%">

Target DB는 다른 리전(싱가폴)에 Database가 존재하므로 **Enter database information**을 클릭하고 다음과 같이 설정합니다.

**참고) 다른 리전과 연결을 위해서는 Remote Peering이 사전에 구성되어 있어야 합니다. Remote Peering 구성 방법은 아래 링크를 참고합니다.**  
[OCI Remote Peering - 서로 다른 리전간의 VCN 연결하기](https://the-team-oasis.github.io/infrastructure/oci-remote-peering/)

* **Database connection string:** Target DB Connection 설정 ({Private IP}:1521/{Service Name})
* **Database username:** CDB Admin
* **Database user password:** CDB Admin Password
* **Network connectivity-Traffic routing method:** Shared endpoint
* **Network connectivity-Session mode:** Direct

<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-13.png" width="50%" height="50%">

이제 생성한 Database Connection이 모두 Active인지 확인합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-14.png" width="50%" height="50%">

다음과 같이 정상적으로 연결이 되었는지 연결 테스트를 할 수 있습니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-15.png" width="50%" height="50%">

### OGG에서 DB 연결 확인
OGG Web으로 돌아와 구성으로 들어가면 등록한 DB 정보 출력을 확인합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-16.png" width="50%" height="50%">

OGG에서 Database에 정상 접속되는지 확인합니다. Source의 경우 스키마 앞에 PDB이름을 명시하여 입력합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-17.png" width="50%" height="50%">

Target의 경우 스키마 이름만 명시하여 입력합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-18.png" width="50%" height="50%">

### OGG Extract Process
OGG Extract Process를 추가합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-19.png" width="50%" height="50%">

통합(Integrated) Extract를 선택합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-20.png" width="50%" height="50%">

프로세스 이름과 트레일 이름을 임의로 입력합니다. (프로세스 이름 8자 이내, 트레일 이름 2글자)
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-21.png" width="50%" height="50%">

아래 SourceDB 인증서를 선택하면 밑에 PDB에 등록 항목이 나타납니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-22.png" width="50%" height="50%">

추출 내용을 적는 매개변수 파일입니다. 가장 아래 줄에 추출 대상 스키마를 입력합니다.  
```
EXTRACT NEWEXT 
USERIDALIAS SourceDB DOMAIN OracleGoldenGate 
EXTTRAIL N1 

TABLE SRCPDB.SRC_OGG.SRC_CUSTOMER; 
TABLE SRCPDB.SRC_OGG.SRC_CITY;
```
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-23.png" width="50%" height="50%">

실행 중으로 표시되는지 확인합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-24.png" width="50%" height="50%">

이제 Extract 확인을 위해 데이터를 입력해봅니다. 
```
SQL> Insert  into SRC_OGG.SRC_CUSTOMER (CUSTID,DEAR,LAST_NAME,FIRST_NAME,ADDRESS,CITY_ID,PHONE,AGE,SALES_PERS_ID) values (101,0,'Brendt','Paul','10 Jasper Blvd.',107,'(212) 555 2146',19,10);
SQL> commit;
```
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-25.png" width="50%" height="50%">

Extract 세부정보에서 통계에 들어가면 방금 작업한 내용을 추출한 것을 확인 가능합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-26.png" width="50%" height="50%">

이제 Replicat Process를 추가합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-27.png" width="50%" height="50%">

통합 Replicat을 선택합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-28.png" width="50%" height="50%">

트레일 이름을 Extract과 동일하게 입력합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-29.png" width="50%" height="50%">

Extract와 매핑을 위해 작성하는 매개변수 파일입니다. 가장 아래에 대상 테이블을 명시합니다.  
```
REPLICAT REP1 
USERIDALIAS TargetDB DOMAIN OracleGoldenGate 

MAP SRCPDB.SRC_OGG.SRC_CITY, TARGET TG_OGG.SRC_CITY;
MAP SRCPDB.SRC_OGG.SRC_CUSTOMER, TARGET TG_OGG.SRC_CUSTOMER; 
```
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-30.png" width="50%" height="50%">

Replicat이 실행 중으로 뜨면, 세부정보로 들어가서 확인합니다.  
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-31.png" width="50%" height="50%">

통계를 확인하면 EXTRACT PROCESS만 등록했을 때 INSERT한 데이터가 Replication 된 것을 확인할 수 있습니다.
<img src = "/assets/img/dataplatform/2024/oci-db-region-migration-part2-31.png" width="50%" height="50%">