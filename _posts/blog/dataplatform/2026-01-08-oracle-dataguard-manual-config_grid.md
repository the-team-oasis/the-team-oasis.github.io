---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "OCI Base Database 의 Data Guard 에 STANDBY DB 를 Manual 로 추가 구성하는 방법"
teaser: "OCI Base Database Service 에서 제공하는 Data Guard Association 기능은 STANDBY DB 를 한대만 추가할 수 있습니다. 이 가이드 문서에서는 OCI 에서 기본적으로 제공되는 Data Guard 로 STANDBY 를 구성한 후 추가적으로 STANDBY DB 를 한대 더 추가하여 멀티로 STANDBY DB 들을 운영하고자 하는 경우를 위해 수동으로 Manual 하게 STANDBY DB 를 Data Guard 에 추가하는 절차를 정리했습니다."
author: lim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, base-database, DataGuard, Manul, dgbroker]
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


### 들어가며

OCI Base Database 에서는 기본적인 Data Guard Association 구성 기능을 제공합니다. OCI Console 에서 제공되는 OCI Base Database 의 Data Guard 기능에서는 Primary, Secondary 를 각각 1개만 Data Guard 로 Association 할 수 있기 때문에 추가적인 STANDBY DB 를 구성할 수가 없습니다.

이에 추가적인 STANDBY DB가 필요한 경우에는 OCI Console 에서는 구성할 수가 없고, Oracle Database 가 제공하는 Data Guard Broker / Manager 를 이용하여 Manual 하게 여러대의 STAMDBY DB 를 구성하실 수가 있습니다.

이번 블로그에서는 OCI Console 에서 구성한 Data Guard 에 추가적으로 STANDBY DB 를 Manual하게 구성하는 절차를 정리했습니다. 추가적으로 추가할 DB 는 편의상 <mark> STANDBY DR DB (stbdr19c)</mark> 라고 칭하도록 하겠습니다. STANDBY DR DB 는 동일한 Region 에 있을 수도 있고, 다른 Region 에 구성하실 수도 있습니다.

구성을 위한 아키텍쳐 및 시나리오는 아래와 같습니다.

- DR 매뉴얼 구성을 위한 아키텍쳐

![DB_Architecture](/assets/img/dataplatform/2025/blog/dg/01.oci_dg_manual_config_archi.png " ")

상기 아키텍쳐에서 좌측의 운영 (PROD) DB 와 STANDBY DB 는 OCI 에서 제공하는 DataGuard Association 기능을 사용하여 구성을 해 놓고, 우측의 추가적인 STANDBY DR DB 를 Manual 하게 구성해 보도록 하겠습니다.

추가적으로 구성하는 STANDBY DR DB 는 편의상 동일한 Region 의 동일한 VCN 에 구성하도록 하겠습니다.

Remote Region 에 구성하는 경우는 Remote Peering Gateway 같은 네트워크를 사전에 구성하여 통신이 원활하게 이루어져야 합니다. Remote Region 구성에 관해서는 아래 사전 준비 사항을 참고 바랍니다.

아키텍쳐에서 각각의 DB 서버의 DB Unique Name 과 IP 를 다음과 같이 가정하여 구성하도록 하겠습니다. Data Guard 구성시에는 DB 의 Unique Name 의 구분이 상당히 중요합니다.

DB Unique Name 은 뒤에서 나오는 TNSNAME 의 Service 명으로 매핑됩니다.

- PROD : <mark>db19c_prod19c</mark> (IP : 10.0.0.138)
- STANDBY : <mark>db19c_b48_kix</mark> (OCI Console 에서 DataGuard 구성시 DB Unique Name 자동 부여) (IP:10.0.0.243)
- STANDBY DR (REMOTE) : <mark>db19c_stbdr19c</mark> (Manual 구성할 DB) (IP:10.0.0.22)

<mark>주의</mark>

- 본 문서는 Oracle Database 19c 기준 예시입니다.
- 환경(LVM/ASM, Single/RAC, CDB/Non-CDB)에 따라 경로와 파라미터가 달라질 수 있습니다.
- 문서 내 패스워드는 <SYS_PASSWORD>로 마스킹했습니다. 실제 환경에 맞게 치환하세요.
- /etc/hosts 파일에 PROD, STANDBY, STANDBY DR(Remote) DB 서버들이 올바르게 등록되어야 합니다.
- tnsnames.ora 파일에 각각 DB 들의 서비스명들이 명확히 등록되어 있어야 합니다.

### 참고 문서

- Oracle Data Guard Hybrid Cloud Configuration  
  https://docs.oracle.com/en/database/oracle/oracle-database/19/haovw/oracle-data-guard-hybrid-cloud-configuration1.html
- Hybrid Oracle Data Guard without Transparent Data Encryption (TDE) License  
  https://www.youtube.com/watch?v=HsnOtef87mM

---

### 사전 준비 사항

- OCI Base Database 에서 PROD DB 구성 (Oracle Grid 기반, PDB 기반 구성)
- 동일 Region 에 STANDBY DB 를 PROD DB 의 Data Gaurd Association 기능을 통해 구성

- STANDBY DR 을 Remote Region 에 연결 구성 시, Remote Peering Gateway 연결 구성
  - Remote Region 과의 Network 연결 구성에 대한 절차는 아래 링크를 참조하시기 바랍니다.
    - [OCI Remote Peering - 서로 다른 리전간의 VCN 연결하기](https://the-team-oasis.github.io/infrastructure/oci-remote-peering/)

---


### STEP-1. 운영(PROD DB) 준비 및 상태 점검

#### 1-1. PROD DB 의 PDB Seed Data 입력 (기존 운영 데이터를 보유한 DB일 경우 생략)

- PROD DB 의 PDB 에서 운영 데이터가 관리되고 있는 상황을 준비하기 위해 Seed Data 를 입력해 줍니다.
- PROD DB 의 CDB ROOT 사용자인 sys 사용자로 Connection 을 연결 후, SRC_OCIGGLL 이라는 사용자를 생성해 줍니다. (※ PASSWORD 항목은 사용할 PASSWORD 로 대체 필요)

```sql
-- SOURCE DB 가 non-CDB 일 경우, 아래 alter session 문장 제거 
ALTER SESSION SET CONTAINER=PDB1;

CREATE USER "SRC_OCIGGLL" IDENTIFIED BY "<PASSWORD>";
GRANT CREATE SESSION TO "SRC_OCIGGLL";
ALTER USER "SRC_OCIGGLL" ACCOUNT UNLOCK;
GRANT CONNECT, RESOURCE TO "SRC_OCIGGLL";
GRANT CREATE ANY TABLE TO "SRC_OCIGGLL";
GRANT ALL PRIVILEGES TO "SRC_OCIGGLL";
GRANT UNLIMITED TABLESPACE TO "SRC_OCIGGLL";
```

- 상기 생성한 SRC_OCIGGLL 사용자로 SQL Developer 에 접속 후 SQL 커맨드 창에서 아래의 SEED Data Load Script 를 수행합니다.
- SEED Data Load Script 는 [SOURCE-SEED-DATA.SQL](/assets/files/ocigg-sql/SOURCE-SEED-DATA.SQL) 를 다운받아 생성한 SRC_OCIGGLL 사용자의 Connection 을 이용해 접속 후 SQL 실행창에 복사하여 붙여놓고 SQL 문장들을 실행합예다. (※ 아래 내용은 해당 스크립트의 일부입니다.)

```sql
GRANT UNLIMITED TABLESPACE TO SRC_OCIGGLL;
--------------------------------------------------------
--  File created - @dsgray 3-07-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SRC_CITY
--------------------------------------------------------

CREATE TABLE "SRC_OCIGGLL"."SRC_CITY" (	
  "CITY_ID" NUMBER(10,0), 
  "CITY" VARCHAR2(50 BYTE), 
  "REGION_ID" NUMBER(10,0), 
  "POPULATION" NUMBER(10,0)
) 
;
..... 중략
```

#### 1-2.  운영(PROD DB)의 데이터 파일 및 Redo Log 파일 확인

```sql
sqlplus / as sysdba
set heading off linesize 999 pagesize 0;
select name from v$datafile;
select member from v$logfile;
```

예시 결과: (Grid 기반 DB 일 경우)

``` text
-- DATAFILE
SQL> select name from v$datafile;
+DATA/DB19C_PROD19C/DATAFILE/system.260.1221841487
+DATA/DB19C_PROD19C/DATAFILE/sysaux.267.1221841471
+DATA/DB19C_PROD19C/DATAFILE/undotbs1.259.1221841511
+DATA/DB19C_PROD19C/4142F69E2C41AC0AE0634A02F40A6B4D/DATAFILE/system.263.1221841239
+DATA/DB19C_PROD19C/4142F69E2C41AC0AE0634A02F40A6B4D/DATAFILE/sysaux.264.1221841239
+DATA/DB19C_PROD19C/4142F69E2C41AC0AE0634A02F40A6B4D/DATAFILE/undotbs1.265.1221841239
+DATA/DB19C_PROD19C/47BBACC67A1E5D26E0638A00000A3BBE/DATAFILE/system.272.1221841771
+DATA/DB19C_PROD19C/47BBACC67A1E5D26E0638A00000A3BBE/DATAFILE/sysaux.270.1221841779
+DATA/DB19C_PROD19C/47BBACC67A1E5D26E0638A00000A3BBE/DATAFILE/undotbs1.269.1221841787
+DATA/DB19C_PROD19C/DATAFILE/users.268.1221841919
+DATA/DB19C_PROD19C/47BBACC67A1E5D26E0638A00000A3BBE/DATAFILE/users.273.1221841919

11 rows selected.

-- REDO
SQL> select member from v$logfile;
+RECO/DB19C_PROD19C/ONLINELOG/group_3.259.1221841201
+RECO/DB19C_PROD19C/ONLINELOG/group_2.258.1221841201
+RECO/DB19C_PROD19C/ONLINELOG/group_1.257.1221841201
+RECO/DB19C_PROD19C/ONLINELOG/group_4.262.1221846375
+RECO/DB19C_PROD19C/ONLINELOG/group_5.263.1221846381
+RECO/DB19C_PROD19C/ONLINELOG/group_6.264.1221846389
+RECO/DB19C_PROD19C/ONLINELOG/group_7.265.1221846395

7 rows selected.
```

---

### STEP-2. STANDBY DR DB 생성 (OCI Console)

- OCI Console 을 통해 STANDBY DR 을 위치시킬 Region 에 DB 를 생성합니다.
- 운영과 동일한 DB_NAME 으로 생성합니다. 본 문서 예에서는 DB19C 로 입력하였습니다.
- DB_UNIQUE_NAME 에 들어갈 접미사에 운영 DB와 구분지을 수 있는 Unique Name 접미사를 부여하여 생성합니다. 본 문서 예에서는 STBDR19c 라고 부여하였습니다.
- 최종적으로 Manual 로 DR 에 추가할 DB 의 DB_UNIQUE_NAME 은 'DBNAME_DBUNIQUENAME접미사' 의 조합으로 <mark>DB19C_STBDR19C</mark> 로 생성하였습니다.

<mark>주의</mark>

- CDB/Non-CDB, ASM/FS 레이아웃이 운영과 상이하면 DB_FILE_NAME_CONVERT, LOG_FILE_NAME_CONVERT 매핑을 정확히 설정해야 합니다.

---

### STEP-3. 운영(PROD)과 STANDBY, STANDBY DR 서버들의 hosts 파일 등록과 TNS 설정

<mark>이 STEP 은 매우 중요합니다.</mark>

많은 오류가 hosts 파일에 DB 서버 상호간 host 들이 등록이 되지 않아 통신이 안되거나 TNS 설정이 잘못되어 발생하는 경우가 많습니다.
DB 서버 상호간 통신이 되어야 하며, TNS 설정을 올바르게 해 주어야 합니다.

#### 3-1. /etc/hosts 파일에 대한 내용 업데이트

Hosts 파일에 모든 DB 서버들의 Host 명을 등록해 줍니다. 
OCI Console 을 통해 Data Guard 를 구성했을 경우, PROD DB와 STANDBY DB 는 Hosts 파일에 이미 Host 들이 자동으로 등록이 되어 있습니다.

추가적으로 DR 사이트의 STANDBY DR DB 서버 (stbdr19c) 에 대한 IP 와 Host 명을 PROD, STANDBY 쪽으로도 추가하고 STANDBY DR 쪽에서는 PROD 와 STANDBY 의 IP 와 호스트명을 상호 등록해 줍니다. (Data Guard 로 구성되는 모든 서버들은 모두 hosts 파일에 상호간 등록이 되어 있어야 합니다.)

```bash
# opc 사용자로 전환
sudo vi /etc/hosts

#/etc/hosts 파일에 기존 내용에 더해 DG 연결 대성 서버들에 대한 IP 와 host 명을 상호 추가 등록

127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4
::1 localhost localhost.localdomain localhost6 localhost6.localdomain6
10.0.0.138  prod19c.sub04280329380.myvcn.oraclevcn.com  prod19c
192.168.16.18  prod19c-priv.sub04280329380.myvcn.oraclevcn.com  prod19c-priv
10.0.0.138  prod19c-vip.sub04280329380.myvcn.oraclevcn.com  prod19c-vip
10.0.0.138  prod19c-scan.sub04280329380.myvcn.oraclevcn.com  prod19c-scan
10.0.0.243 stb19c.sub04280329380.myvcn.oraclevcn.com stb19c
10.0.0.22  stbdr19c.sub04280329380.myvcn.oraclevcn.com  stbdr19c
```

#### 3-2. $ORACLE_HOME/network/admin/tnsnames.ora 파일 내용 업데이트 

운영(PROD) ↔ STADBY ↔ STANDBY DR 간 상호 TNS 통신이 가능하도록 TNS 설정을 합니다.

Oracle 사용자로 로그인하여 $ORACLE_HOME/network/admin/tnsnames.ora 파일을 아래와 깉이 상호 tnsping 이 가능하도록 DB 서비스명을 등록해 줍니다.

Data Guard 로 구성되는 모든 서버들의 tnsnames.ora 파일에 모든 DB 서비스명을 올바르게 설정해 줍니다.

```bash
sudo su - oracle
cd $ORACLE_HOME/network/admin/
vi tnsnames.ora
```

- tnsnames.ora 파일 내용 (PROD DB, STANDBY, STANBY DR 등 모든 DB 서버에 동일하게 적용)

```text
DB19C_PROD19C =   (DESCRIPTION = 
    (SDU=65535)(SEND_BUF_SIZE=10485760)(RECV_BUF_SIZE=10485760)
    (ADDRESS = (PROTOCOL=TCP)(HOST=10.0.0.138)(PORT=1521))
    (CONNECT_DATA = 
      (SERVER=DEDICATED)
      (SERVICE_NAME=db19c_prod19c.sub04280329380.myvcn.oraclevcn.com)
    )
  )

DB19C_B48_KIX = 
  (DESCRIPTION = 
    (SDU=65535)(SEND_BUF_SIZE=10485760)(RECV_BUF_SIZE=10485760)
    (ADDRESS = (PROTOCOL=TCP)(HOST=10.0.0.243)(PORT=1521))
    (CONNECT_DATA = 
      (SERVER=DEDICATED)
      (SERVICE_NAME=db19c_b48_kix.sub04280329380.myvcn.oraclevcn.com)
    )
  )

DB19C_STBDR19C =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = stbdr19c)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = db19c_stbdr19c.sub04280329380.myvcn.oraclevcn.com)
    )
  )

```

아래와 같이 각각의 DB 서버 호스트들에서 DB 서비스들에 대해 tnsping 을 통해 연결 가능 여부를 체크합니다.

```bash
sudo su - oracle
tnsping db19c_prod19c
tnsping db19c_b48_kix
tnsping db19c_stbdr19c
```

- 각각의 DB 호스트들에서 아래와 같이 TNSPING 결과로 OK가 나오는지 체크해야 합니다.

![TNSPING](/assets/img/dataplatform/2025/blog/dg/06.dg-tnsping.png " ")

팁

- TNS-12154/12514 오류의 다수는 SERVICE_NAME 철자/대소문자 불일치, 리스너 미등록, 방화벽 포트 미개방에서 발생합니다.
- lsnrctl status로 서비스 등록 여부를 확인하세요.


---

### STEP-4. STANDBY DR DB (db19c_stbdr19c) 의 데이터 삭제 

운영 DB 복제 전 추가 구성할 STANDBY DR DB 의 기존 데이터를 모두 삭제하는 단계입니다.

#### 4-1. STANDBY DR DB 구성 체크 (참고용)

작업할 대상 서버가 STANDBY DR DB 서버인지, DB 호스트명과 DB Unique Name 을 체크합니다.

```bash
* bash 명령

sudo su - oracle
srvctl config database -d db19c_stbdr19c
```

![TNSPING](/assets/img/dataplatform/2025/blog/dg/15.dg-stbdr_config_check.png " ")


#### 4-2. STANDBY DR DB 의 기본 데이터 파일 삭제 스크립트 생성/실행

Default 로 생성된 데이터 파일들을 삭제하기 위해 STANDBY DR DB Host (예제 host 의 stbdr19c 호스트) 에 oracle user 로 접속하여 /home/oracle 위치에 rm_dbfiles.sql 생성들을 생성합니다.

삭제 파일 (rm_dbfiles.sql) 생성 : vi 명령으로 아래의 SQL Script 를 내용으로 rm_dbfiles.sql 파일을 생성합니다.

```bash
* bash 명령 (oracle user)
vi /home/oracle/rm_dbfiles.sql
```

/home/oracle/rm_dbfiles.sql 파일 내용으로 아래 내용을 복사하여 붙여넣고 파일을 저장합니다.

```sql
set heading off linesize 999 pagesize 0 feedback off trimspool on
spool /home/oracle/files.lst
select 'asmcmd rm '||name from v$datafile
union all select 'asmcmd rm '||name from v$tempfile
union all select 'asmcmd rm '||member from v$logfile;
spool off
create pfile='/home/oracle/db19c_stbdr19c.pfile' from spfile;
```

생성된 SQL Script 파일을 실행하여 삭제 명령 script 파일을 생성합니다. (Output : files.lst)

```bash
sqlplus "/ as sysdba" @rm_dbfiles.sql
exit
```
SQLPLUS 를 나와서 파일 목록을 확인합니다.

```bash
[oracle@stbdr19c ~]$ ls
db19c_stbdr19c.pfile  files.lst  rm_dbfiles.sql
```
데이터 파일 삭제 실행 : 파일 목록 중에 files.lst 파일을 bash 명령어로 수행하여 데이터 파일 삭제를 수행합니다. (삭제전 데이베이스 서비스를 Stop 합니다.)

```bash
chmod 777 /home/oracle/files.lst
# Database 서비스 Down
srvctl stop database -d db19c_stbdr19c
exit

#ASM 에서 파일 삭제를 위해 grid 사용자로 전환
sudo su - grid

# 생성된 asmcmd 명령 실행
/home/oracle/files.lst   
```

아래와 같이 아무런 메시지 없이 프롬프트가 나타나면 정상적으로 파일이 삭제된 것입니다.

```bash
[grid@stbdr19c ~]$ /home/oracle/files.lst 
[grid@stbdr19c ~]$ 
```

<mark>주의</mark>

- 파일 제거는 복구 불가입니다. 정확하게 Manual 하게 DG 에 추가할 STANDBY DR DB인지 재확인 바랍니다.


---

### STEP-5. 패스워드 파일 설정

#### 5-1. 운영 서버(PROD DB) 에서 Manual 하게 추가한 STANDBY DR 로 (stbdr19c) ssh key 파일 준비/전송

운영 (PROD) DB 서버의 /home/oracle/.ssh 폴더에 PROD DB 와 STANDBY DR DB 생성 시 사용한 private ssh key 를 전송합니다. 이 Key 를 이용하여 운영 (PROD) DB 서버에서 STANDBY DR DB 서버로의 ssh 접속, scp 전송 시 사용됩니다.

![ssh_key전송](/assets/img/dataplatform/2025/blog/dg/04.ftp-key-transfer.png " ")

운영 (PROD) DB 서버에 SSH 접속 후 opc 사용자에서 root 계정으로 전환 후 key file 을 oracle 사용자의 .ssh 폴더로 업로드한 key 파일을 복사하고 Ownership 을 oracle 사용자로 변경 후 chmod 로 600 권한으로 변경해 줍니다.

```bash
# 운영 (PROD) DB 서버로 접속
# Root 사용자로 전환
sudo su -
cp /home/opc/.ssh/ssh-key.key /home/oracle/.ssh/ssh-key.key
cd /home/oracle/.ssh
chown oracle:oinstall /home/oracle/.ssh/ssh-key.key
chmod 600 /home/oracle/.ssh/ssh-key.key
exit
```

운영(PROD DB) 서버에서 Oracle 사용자로 STANDBY DR 서버로 접속이 가능한지 체크합니다. ECDSA Key fingerprint 추가를 물어보면 Yes 를 입력합니다.

```bash
sudo su - oracle
## STANDBY DR 서버 (stbdr19c) 로 접속 시도
ssh -i ~/.ssh/ssh-key.key opc@10.0.0.22
TThe authenticity of host '10.0.0.22 (10.0.0.22)' can't be established.
ECDSA key fingerprint is SHA256:fponsJyr3FDnQAp9zTzqwaOV0a1p1KBOzVmmlc2g1Ak.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.0.0.22' (ECDSA) to the list of known hosts.
Last login: Wed Jan  7 07:18:02 2026 from 1.229.5.33
exit
```

#### 5-1. 운영(PRDOD) DB 에서 SYS 패스워드 및 패스워드 파일 준비/전송

운영(PROD) 서버의 DB SYS 패스워드 파일을 Manual 하게 Data Guard 를 추가할 STANDBY DR (Remote) 서버로 전송합니다.

```bash
sudo su - oracle
cp $ORACLE_HOME/dbs/orapwdb19c /tmp/orapwdb19c
## PROD DB 서버에서 -> STANDBY DR 서버로 전송 (prod19c -> stbdr19c 서버로 전송)
scp -i ~/.ssh/ssh-key.key /tmp/orapwdb19c opc@10.0.0.22:/tmp/orapwdb19c  
```

#### 5-2. STADBY DR (stbdr19c) 에서 패스워드 파일 ASM로 배치

STADBY DR (stbdr19c) 에서 앞서 운영(PROD DB) 서버에서 복사해온 SYS 패스워드 파일을 ASM 으로 배치해 줍니다.

```bash
# STADBY DR (stbdr19c) 서버로 접속
# 파일 권한 부여 (opc 사용자)
sudo chmod 777 /tmp/orapwdb19c
# 구성 확인
sudo su - oracle
srvctl config database -d db19c_stbdr19c
exit

# opc 사용자에셔 grid로 전환
sudo su - grid

# ASM에 pwfile 복사
asmcmd pwcopy --dbuniquename DB19C_STBDR19C -f /tmp/orapwdb19c +DATA/DB19C_STBDR19C/PASSWORD/pwfile
asmcmd ls -l +DATA/DB19C_STBDR19C/PASSWORD/pwfile
exit
```

* 참고 : "ASMCMD-9453: failed to register password file as a CRS resource" 오류가 발생하더라도 무시합니다.

앞서 ASMCMD 를 통해 나온 Password 파일의 위치를 아래 위치에 업데이트하여 DB 서비스를 수정해 줍니다.

```bash
sudo su - oracle
# SRVCTL에 pwfile 경로 등록
srvctl modify database -d DB19C_STBDR19C -pwfile '+DATA/DB19C_STBDR19C/PASSWORD/pwfile'
```

---

### STEP-6. STADBY DR (stbdr19c) 서버 DB 재구성을 위한 RMAN 복제

#### 6-1. STADBY DR의 데이터 파일 파라미터 설정

STADBY DR (stbdr19c) 서버에서 데이터 파일에 대한 파라미터를 설정하여 줍니다.

```bash
sudo su - oracle
sqlplus / as sysdba
```

```sql
startup nomount;
-- convert 파라메터 설정 확인
show parameter convert;
-- db_file_name_convert, log_file_name_convert 파라메터가 설정이 안되어 있으면 아래와 같은 포맷으로 설정해 줍니다.
alter system set db_file_name_convert=
  '+DATA/DB19C_PROD19C','+DATA/DB19C_STBDR19C'
  scope=spfile;

alter system set log_file_name_convert=
  '+RECO/DB19C_PROD19C','+RECO/DB19C_STBDR19C'
  scope=spfile;

alter system set standby_file_management=auto scope=both sid='*';

alter system set db_create_online_log_dest_1='+RECO' scope=both sid='*';

alter system set db_create_file_dest='+DATA' scope=both sid='*';

shutdown immediate;
startup nomount;
```

#### 6-2. 운영(PROD) DB 의 보완 파라미터

운영(PROD DB) (gprod19c) 서버에 접속해서 데이터 파일에 대한 파라미터를 설정하여 줍니다.

```sql
alter system set db_file_name_convert=
  '+DATA/DB19C_STBDR19C','+DATA/DB19C_PROD19C'
  scope=spfile;

alter system set log_file_name_convert=
  '+RECO/DB19C_STBDR19C','+RECO/DB19C_PROD19C'
  scope=spfile;

alter system set standby_file_management=auto scope=both sid='*';
```

#### 6-3. 운영 (PROD) DB 서버에서 데이터 파일 확인 

운영 (PROD) DB 에 접속하여 운영의 데이터 파일의 현황을 다시 한번 체크 합니다.

```sql
-- 운영 DB
set heading off linesize 999 pagesize 0; 
SELECT file#, name, bytes/1024/1024 AS size_mb FROM v$datafile ORDER BY file#;
```

#### 6-4. STADBY DR (stbdr19c) 서버에서 RMAN으로 데이터 복제 (From PROD DB)

운영 (PROD) DB 로부터 데이터 파일을 복구하는 중요한 단계입니다. STANBY DR DB (stbdr19c) 서버에 접속하여 RMAN 을 수행하여 운영 DB (db19c_prod19c) 로부터 데이터 복구를 수행합니다.

<mark>반드시 STANDBY DR DB 서버인지 확인합니다.</mark>

```sql
sudo su - oracle
-- RMAN
rman target /

shutdown immediate;

-- RMAN 복제 작업을 위해 반드시 Nomount 로 시작
startup nomount;

-- 운영 (PROD) DB 서버로 부터 Control 파일 Restore
RESTORE STANDBY CONTROLFILE FROM SERVICE 'db19c_prod19c';

-- Mount 로 전환
ALTER DATABASE MOUNT;

-- 운영 (PROD) DB 서버로 부터 데이터 파일 Restore
RUN {
  ALLOCATE CHANNEL c1 DEVICE TYPE DISK;
  SET NEWNAME FOR DATABASE TO '+DATA';
  RESTORE DATABASE FROM SERVICE 'db19c_prod19c';
  SWITCH DATAFILE ALL;
  SWITCH TEMPFILE ALL;
}
```

- RMAN 수행 결과 아래와 같이 오류없이 Restore 가 잘 되어야 합니다.

![RMANRESULT](/assets/img/dataplatform/2025/blog/dg/20.dg-rman-result.png " ")

- RMAN 명령창에서 DB 서비스를 내렸다가 mount 모드로 시작합니다.

```sql
shutdown immediate;
startup mount;

exit
```

---

### STEP-7. STANDBY DR DB 의 Data File 확인 및 Redo Log 재조정 

RMAN 복구 작업 후 Data File 이 운영 DB 의 Data file 위치와 비교하여 ASM 의 Convert Rule 에 따라 복제가 되었는지 확인합니다.
Redo Log 의 경우, RMAN 복구 후 logdata file 들이 운영의 Log file 위치와 상이하게 생성되는데, Log file 의 재성성 및 Clear 작업 등 재조정 작업이 필요합니다.

#### 7-1 Data File 에 대한 비교

- 운영 (PROD) DB 의 Data File 위치 및 갯수 확인

```sql
-- 운영 DB (oracle 사용자)
sqlplus / as sysdba
set heading off linesize 999 pagesize 0;
SELECT file#, name FROM v$datafile ORDER BY file#;
```

![DATAFILES](/assets/img/dataplatform/2025/blog/dg/07.dg-prod_datafiles.png " ")

- STANDBY DR DB 의 Data File 위치 및 갯수 확인

```sql
-- STANDBY DR DB (oracle 사용자)
sqlplus / as sysdba
set heading off linesize 999 pagesize 0;
SELECT file#, name FROM v$datafile ORDER BY file#;
```

![DATAFILES](/assets/img/dataplatform/2025/blog/dg/08.dg-standbydr_datafiles.png " ")

상기 화면에서 보듯이 데이터 파일들이 ASM 의 +DATA 위치에 DB Unique Name (DB19C_PROD19C, DB19C_STBDR19C) 아래 동일하게 정상적으로 생성된 것을 확인할 수 있습니다.

#### 7-2 Redo Log File 에 대한 비교

- 운영 (PROD) DB 의 Redo Log 확인

```sql
-- 운영 DB (oracle 사용자)
sqlplus / as sysdba
set heading off linesize 999 pagesize 0;
select group#, member from v$logfile;
```

![REDOLOGFILES](/assets/img/dataplatform/2025/blog/dg/09.dg-prod_redolog_files.png " ")

- STANDBY DR DB 의 Redo Log 확인

```sql
-- STANDBY DR DB (oracle 사용자)
sqlplus / as sysdba
set heading off linesize 999 pagesize 0;
select group#, member from v$logfile;
```

![REDOLOGFILES](/assets/img/dataplatform/2025/blog/dg/10.dg-stbdr_redolog_files.png " ")

<mark>중요</mark>

Redo Log 파일들은 상기 화면들과 같이 운영(PROD) DB 와 STANDBY DR DB 의 저장 위치가 상이하게 생성된 것을 확인할 수 있습니다.
Redo Log 파일들이 STANDBY DR DB 의 저장 위치처럼 <mark>'+RECO/DB-Unique-Name/'</mark> 위치에 저장되지 않고 <mark>'+RECO/MUST_RENAME_THIS_LOGFILE_#/'</mark> 위치에 저장되어 있다면 Redo Log 를 삭제하고 재생성하는 단계인 다음 단계를 진행합니다.

#### 7-3 잘못 생성된 Redo Log 파일 삭제

<mark>'+RECO/MUST_RENAME_THIS_LOGFILE_#/'</mark> 위치에 저장된 파일에 대한 삭제 작업을 수행합니다.

주의

반드시 Manual 로 구성하려는 STANDARD DR DB 인지 확인하고 Redo Log 삭제 작업을 수행합니다.

```bash
-- STANDBY DR DB (oracle 사용자)
sudo su - oracle
# STANDBY DR DB 의 구성 확인
srvctl config database -d db19c_stbdr19c
```

![DB Config](/assets/img/dataplatform/2025/blog/dg/11.dg-stbdr_database_config.png " ")

- STANDBY DR DB 의 Redo Log 관리 수동 전환 및 Logfile 위치 확인

```sql
-- STANDBY DR DB (oracle 사용자)
sqlplus / as sysdba
-- Redo Log 파일 관리를 수동으로 전환 
ALTER SYSTEM SET STANDBY_FILE_MANAGEMENT=MANUAL SCOPE=BOTH;

set heading off linesize 999 pagesize 0;
select group#, member from v$logfile;
```

- Logfile 위치가 '+RECO/MUST_RENAME_THIS_LOGFILE_#/' 위치에 저장되어 있는지 다시 한번 확인합니다.

![REDO Log Files](/assets/img/dataplatform/2025/blog/dg/12.dg-stbdr_redo_log_rename_files.png " ")

- 상기 화면처럼 '+RECO/MUST_RENAME_THIS_LOGFILE_#/' 위치에 있는 Logfile 들은 삭제 후, 재생성이 필요합니다.
- Logfile 삭제를 위해 아래와 같이 Logfile 의 group 수 만큼 logfile DROP script 를 작성하여 수행합니다.

<mark>주의</mark>

- STANDBY DR DB 인지 반드시 확인하고 수행 바랍니다.

```sql
ALTER DATABASE DROP STANDBY LOGFILE GROUP 1;
ALTER DATABASE DROP STANDBY LOGFILE GROUP 2;    
ALTER DATABASE DROP STANDBY LOGFILE GROUP 3;
ALTER DATABASE DROP STANDBY LOGFILE GROUP 4;
ALTER DATABASE DROP STANDBY LOGFILE GROUP 5;
ALTER DATABASE DROP STANDBY LOGFILE GROUP 6;
ALTER DATABASE DROP STANDBY LOGFILE GROUP 7;
-- 삭제 확인
select group#, member from v$logfile;
```

- 아래와 같이 모든 Logfile 이 삭제되었는지 확인합니다.

![REDO Log Drop Results](/assets/img/dataplatform/2025/blog/dg/13.dg-stbdr_redo_log_drop_results.png " ")


#### 7-4 Redo Log 파일 재생성

- 운영 (PROD) DB 의 Redo Log File Size 확인

운영 (PROD) DB 의 Redo Log 파일 사이즈를 확인하기 위해 운영 (PROD) DB 에 접속하여 다음 쿼리로 사이즈를 확인합니다.

```sql
-- 운영 (PROD) DB 에서 수행
SELECT group#, status, bytes/1024/1024 size_mb FROM v$log;
```

![REDO Log File Size](/assets/img/dataplatform/2025/blog/dg/14.dg-stbdr_redo_log_file_size.png " ")

상기 예제에서는 1024 MB 사이즈 단위로 Redo Log 파일을 생성하여 관리하고 있음을 확인할 수 있습니다.

- STANDBY DR DB Redo Log File 및 그룹 추가
STANDBY DR DB 에 Redo Log 파일들을 운영의 Log 그룹, Log 파일 사이즈(상기 예 : 1024M) 와 동일하게 맞추어 Logfile 을 추가합니다.

```sql
-- STANDBY DR DB (oracle 사용자)
sqlplus / as sysdba
-- Standby Logfile
ALTER DATABASE ADD STANDBY LOGFILE THREAD 1 GROUP 4 ('+RECO') SIZE 1024M;
ALTER DATABASE ADD STANDBY LOGFILE THREAD 1 GROUP 5 ('+RECO') SIZE 1024M;
ALTER DATABASE ADD STANDBY LOGFILE THREAD 1 GROUP 6 ('+RECO') SIZE 1024M;
ALTER DATABASE ADD STANDBY LOGFILE THREAD 1 GROUP 7 ('+RECO') SIZE 1024M;

-- Online Log
ALTER DATABASE ADD  LOGFILE THREAD 1 GROUP 1 ('+RECO') SIZE 1024M;
ALTER DATABASE ADD  LOGFILE THREAD 1 GROUP 2 ('+RECO') SIZE 1024M;
ALTER DATABASE ADD  LOGFILE THREAD 1 GROUP 3 ('+RECO') SIZE 1024M; 

-- Log File Management 를 Auto 로 전환하여 줍니다.
ALTER SYSTEM SET STANDBY_FILE_MANAGEMENT=AUTO SCOPE=BOTH;
```

#### 7-5 Redo Log 파일 Clear 수행

온라인 로그 및 STANDBY Redo Log 에 대해 Clear 작업을 수행 후 Database 서비스를 내린 후 mount 모드로 시작해 줍니다.
- 중요 : 반드시 mount 모드로 시작 합니다.

```sql
ALTER DATABASE CLEAR LOGFILE GROUP 1;
ALTER DATABASE CLEAR LOGFILE GROUP 2;
ALTER DATABASE CLEAR LOGFILE GROUP 3;
ALTER DATABASE CLEAR LOGFILE GROUP 4;
ALTER DATABASE CLEAR LOGFILE GROUP 5;
ALTER DATABASE CLEAR LOGFILE GROUP 6;
ALTER DATABASE CLEAR LOGFILE GROUP 7;

shutdown immediate;
-- 중요 : 반드시 mount 모드로 시작
startup mount;
-- FLASHBACK 을 ON
ALTER DATABASE FLASHBACK ON;

exit
```

---

### STEP-8. TDE key 설정 (운영 Key 복제)

OCI 의 Base Database 는 기본적으로 tablespace_encryption=AUTO_ENABLE 가 되어 있습니다. 따라서 STANDBY DR 에서도 운영 (PROD) DB 와 동일한 TDE Key 를 사용해야 하기 때문에 운영 DB 로 부터 TDE key 를 복사해 주어야 합니다,

#### 8-1. TDE 키 복사 (PROD DB → STANDBY DR DB)

- 운영 (PROD DB) 에서 수행

```bash
sudo su - oracle
scp -rp -i ~/.ssh/ssh-key.key /opt/oracle/dcs/commonstore/wallets/db19c_prod19c/tde opc@10.0.0.22:/tmp/tde
```

- STANDBY DR 에서 수행

```bash
# opc 사용자로 전환
# 운영에서 복사해 온 /tmp/tde 파일에 대한 ownership oracle 로 변경하기 위해 root 사용자로 전환
sudo su -
cd /tmp
chown oracle:oinstall tde
cd /tmp/tde
chown oracle:asmadmin *
exit

# 운영에서 복사해온 /tmp/tde 를 STANDBY DR 에 적용하기 위해 oracle 사용자로 전환
sudo su - oracle
cp -rp /tmp/tde/* /opt/oracle/dcs/commonstore/wallets/db19c_stbdr19c/tde/
```

- TDE 관련 parameter 확인 후 DB 재기동

```sql
-- 확인
sqlplus / as sysdba

show parameter encrypt_new_tablespaces;
show parameter tablespace_encryption;
show parameter tde_configuration;
show parameter wallet_root;

shutdown immediate;
-- 반드시 mount 모드로 DB 로 시작
startup mount;

select CON_ID, WRL_PARAMETER, WRL_TYPE, STATUS, WALLET_TYPE from V$ENCRYPTION_WALLET;

```

<mark>주의</mark>

- 디렉토리 권한과 소유자(oracle/grid)를 확인하세요.
- 경로 오타(대상 디렉토리 슬래시 누락 등)에 유의하세요.
- ORA-28365 발생 시 wallet 경로/권한/상태, AUTOLOGIN 여부를 재확인하세요.

---


### STEP-9. Data Guard Broker 구성 및 Redo Shipping

이제 데이터 복제 및 Redo log 조정이 완료되고, 운영과 동일한 TDE Key 를 사용하는 환경이 준비되었습니다. 
<BR>

다음은 본격적으로 Data Guard Broker 를 이용하여 Manual 하게 STANDBY DR DB 에 대한 구성 작업을 진행합니다.

#### 9-1. 운영 (PROD) DB 확인  

```sql
sqlplus / as sysdba

SELECT LOG_MODE, FORCE_LOGGING, FLASHBACK_ON, OPEN_MODE, DATABASE_ROLE FROM V$DATABASE;
show parameter standby_file_management;

-- 이미 운영 (PROD) DB 가 Data Guard 를 사용하도록 설정되어 있는 환경이면 아래 SQL 을 수행할 필요 없음
-- alter system set dg_broker_start=true scope=both;
-- show parameter dg_broker_start;

```

#### 9-2. STANDBY DR (db19c_stbdr19c) DB 에서 DG Broker 활성화 수행

```sql
sqlplus / as sysdba

select pname from v$process where pname like 'DMON%';

alter system set dg_broker_config_file1 = '+RECO/DB19C_STBDR19C/db19c_stbdr19c_1.dat' scope=both;
alter system set dg_broker_config_file2 = '+RECO/DB19C_STBDR19C/db19c_stbdr19c_2.dat' scope=both;

alter system set dg_broker_start=true;

select pname from v$process where pname like 'DMON%';
exit
```

#### 9-3. DG Broker 를 통해 STANDBY DR (db19c_stbdr19c) DB 에 대한 추가 구성 (DGMGRL)

- STANDBY DR DB 에서 DGMGRL 을 수행합니다.

```bash
dgmgrl sys/<SYS_PASSWORD>@db19c_prod19c

--- 아래 주석 부분은 DG 를 처음 구성할때 필요, 이미 구성된 환경이므로 수행 불필요

-- CREATE CONFIGURATION db19c AS
--  PRIMARY DATABASE IS db19c_prod19c
--  CONNECT IDENTIFIER IS db19c_prod19c;

SHOW CONFIGURATION VERBOSE;

-- DG 에 STANDBY DR DB 추가

ADD DATABASE db19c_stbdr19c AS
  CONNECT IDENTIFIER IS db19c_stbdr19c
  MAINTAINED AS PHYSICAL;

-- Configuration 퐐성화
ENABLE CONFIGURATION;
SHOW CONFIGURATION;

-- APPLY ON 수행
EDIT DATABASE db19c_stbdr19c SET STATE='APPLY-OFF';
EDIT DATABASE db19c_stbdr19c SET STATE='APPLY-ON';

-- 필요 시 Primary에도 동일하게 토글
EDIT DATABASE db19c_gprod19c SET STATE='APPLY-OFF';
EDIT DATABASE db19c_gprod19c SET STATE='APPLY-ON';

SHOW CONFIGURATION VERBOSE;
```

- 아래와 같이 Data Guard Configuration 을 확인하면 PROD DB 가 Primary 에 STANDBY DB 와 STANDBY DR DB 가 Physical Standby database 로 구성이 된 것을 확인하면 성공적으로 구성이 완료된 것입니다.

![DGSUCCESS](/assets/img/dataplatform/2025/blog/dg/21.dg-dataguard-config-success.png " ")

---

### STEP-10. Data Guard 전환 테스트

Data Guard 구성이 완료되었습니다. Data Guard 가 제대로 동작하는지 아래 2가지를 체크합니다. 

1) Switch Over 를 수행하지 않고, STANDBY DR 을 Read Only 로 Open 하여 STANDBY DR 쪽에 운영 DB 의 변경 사항이 적용되고 있는지 확인합니다. (10-1)

2) PROD DB → STADNBY DB → STANDBY DR DB 또는 STANDBY DR DB → PROD DB 로 Switch Over 를 수행하여 원활히 전환이 되는지 검증합니다. (10-2)

#### 10-1 STAND BY DR DB 에 대해 Read Only 로 Open

STANDBY DR DB 의 Database 를 Read Only 로 Open 하고 운영(PROD) Database 에 변경을 수행 후 STANDBY DR DB 쪽에 반영이 되는지 확인합니다.

```sql
-- Active Data Gaurd 활성화
-- STANDBY DR 쪽에 수행하고, 운영 DB 에 CRUD 를 수행 후 변경이 반영되었는지 확인
ALTER DATABASE OPEN READ ONLY;
```

#### 10-2 Switch Over 수행

```bash
sudo su - oracle
dgmgrl sys/<SYS_PASSWORD>@db19c_prod19c

-- STANDBY DR DB 로 Primary 전환
switchover to db19c_stbdr19c;

-- STANDBY DB 로 Primary 전환
switchover to db19c_b48_kix;

-- PROD DB 로 Primary 전환
switchover to db19c_prod19c;

SHOW CONFIGURATION;
```

- Manual 하게 추가한 STANDBY DR DB 쪽으로 전환이 잘 되어 새로운 Primary 가 STANDB DR DB 서버로 되었는지 확인합니다.

![DGWARN](/assets/img/dataplatform/2025/blog/dg/19.dg-switch-over.png " ")


- DGMGRL 의 SHOW CONFIGURATION 수행 시 아래와 같은 Error 나 Warning 메시지가 나올 수 있는데 Redo Log 가 운영 DB 와 동기화가 아직 안되어서 나올 수 있는 메시지입니다. 시간이 지나면 정상화가 됩니다.

![DGERROR](/assets/img/dataplatform/2025/blog/dg/16.dg-show-configuration-error.png " ")

![DGWARN](/assets/img/dataplatform/2025/blog/dg/17.dg-show-configuration-warning.png " ")

![DGWARN](/assets/img/dataplatform/2025/blog/dg/18.dg-show-configuration-success.png " ")

---

### 문제 해결(트러블슈팅) 체크리스트

- 네트워크/TNS
  - TNS-12154/12514: SERVICE_NAME/리스너 등록, 포트 방화벽, tnsnames.ora 철자 확인
- SRL/Redo 전송
  - ORA-00313/00312: SRL 사이즈/개수/경로 재확인
  - 전송 지연: `ALTER SYSTEM ARCHIVE LOG CURRENT` 후 V$MANAGED_STANDBY 점검
- Broker/DMON
  - `SHOW CONFIGURATION`, `VALIDATE DATABASE VERBOSE`로 점검
  - `dg_broker_start`, config file 경로 ASM/FS 혼동 주의
  - DG 제거 시 DG Broker 에서 다음 명령으로 제거 
  - REMOVE DATABASE db19c_stbdr19c;

- TDE
  - ORA-28365: wallet 상태/경로/권한 확인, AUTOLOGIN 키 유무 점검
  - Primary `DECRYPT_ONLY`, Standby `AUTO_ENABLE` 적용 여부 확인

---

### 마무리

OCI Console 에서 제공하는 OCI Base Database 서비스의 Data Guard 에서는 1개 이상의 Data Guard 를 추가할 수가 없습니다. 이 블로그의 Manual 절차를 통해 추가적인 DR 용 Data Guard 서버를 추가하실 수 있습니다.
구성이 완료되면 주기적으로 로그 전송 지연(transport/apply lag) 등에 대한 모니터링을 권장합니다.

---
