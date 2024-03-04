---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "[Hands-On] On-Premise Oracle DB 의 OCI DBCS 로 Data pump 를 이용한 Migration 실습"
teaser: "On-Premise 에서 운영 중인 Oracle Database 를 OCI 의 Database Cloud Service 로 Data Pump 를 이용하여 이전하는 방법에 대해 실습해 봅니다. 현재 범용적으로 사용하는 Non-CDB 환경을 사용할 경우, 손쉽게 Data Pump 를 이용하여 이전하는 절차를 기준으로 작성하였습니다."
author: lim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, oracle database, datapump, migration, non-CDB]
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

### 개요

On-Premise 에서 운영 중인 Oracle Database 를 OCI 의 Database Cloud Service 로 이전할 수 있는 방법은 Acvie Data Guard, Oracle GoldenGate, Zero-Downtime Migration 을 이용하는 방법 등 다양합니다.
이번 글에서는 그 중에서 이전을 위해 오프라인 다운타임이 필요하지만 가장 간단하게 Oracle Database 를 이전할 수 있는 방법인 Data Pump 를 이용하는 방법을 실습을 통해 다뤄보도록 하겠습니다.

### 사전 준비 사항
- DBCS 구성을 위한 Virtual Cloud Network (VCN) 구성 
- On-Premise Oracle Database 12c non-CDB DB - On-Premise DB 가 없을 시 [Marketplace 의 Oracle DB 를  Compute 로 생성하는 방법](/dataplatform/oracle-database-cloud-service-quickstart/){:target="_blank" rel="noopener"} 참고
- OCI DBCS 에 올려진 Oracle Database - DBCS 생성 시  [DBCS 생성 퀵스타트 가이드 참고](/dataplatform/oracle-database-cloud-service-quickstart/){:target="_blank" rel="noopener"} 
- OCI Valut - 비밀번호 관리

### STEP 1 : SOURCE DB에 SEED Data 생성
- Source 데이터베이스에 Migration 할 샘플 데이터셋을 구성합니다. 먼저, Source DB 에 sys 사용자로 Connection 을 연결 후, SRC_OCIGGLL 이라는 사용자를 생성해 줍니다. (※ password 항목은 사용할 password 로 대체 필요)

  ```sql
  CREATE USER "SRC_OCIGGLL" IDENTIFIED BY "<password>";
  GRANT CREATE SESSION TO "SRC_OCIGGLL";
  ALTER USER "SRC_OCIGGLL" ACCOUNT UNLOCK;
  GRANT CONNECT, RESOURCE TO "SRC_OCIGGLL";
  GRANT CREATE ANY TABLE TO "SRC_OCIGGLL";
  GRANT ALL PRIVILEGES TO "SRC_OCIGGLL";
  GRANT UNLIMITED TABLESPACE TO "SRC_OCIGGLL";
  ```

  ![SEED User]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2022/goldengate/09.oci-goldengate-sql-developer-seed-user.png)
  
- 상기 생성한 SRC_OCIGGLL 사용자로 SQL Developer 에 접속 후 SQL 커맨드 창에서 아래의 SEED Data Load Script 를 수행합니다. SEED Data Load Script 는 [SOURCE-SEED-DATA.SQL](/assets/files/ocigg-sql/SOURCE-SEED-DATA.SQL) 를 다운받아 생성한 SRC_OCIGGLL 사용자의 Connection 을 이용해 접속 후 SQL 실행창에 복사하여 붙여놓고 SQL 문장들을 실행합예다. (※ 아래 내용은 해당 스크립트의 일부입니다.)


  ```sql
  GRANT UNLIMITED TABLESPACE TO SRC_OCIGGLL;
  --------------------------------------------------------
  --  File created - @dsgray 3-07-2021   
  --------------------------------------------------------
  --------------------------------------------------------
  --  DDL for Table SRC_CITY
  --------------------------------------------------------

  CREATE TABLE "SRC_OCIGGLL"."SRC_CITY" 
   (	"CITY_ID" NUMBER(10,0), 
	"CITY" VARCHAR2(50 BYTE), 
	"REGION_ID" NUMBER(10,0), 
	"POPULATION" NUMBER(10,0)
   ) 
   ;

   ..... 중략

  ```
  아래 화면은 상기 SEED-DATA.SQL 스크립트를 실행한 결과입니다. SRC_OCIGGLL 스키마에 샘플테이블인 SRC_CITY, SRC_CUSTOMER, SRC_PRODUCT, SRC_REGION 등의 테이블과 데이터가 입력이 되어 있는지 확인합니다.

    ![SEED User]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2022/goldengate/11.oci-goldengate-sql-developer-seed-data-result.png)


### STEP 2 : SOURCE DB 에 Export Directory 생성
SOURCE DB 내에셔 Data pump 를 통해 Export 를 받을 Directory 를 생성해 줍니다.
- Root User 로 Terminal 에 로그인 후 다음 명령을 실행합니다.

```text
$ sudo su -
$ mkdir /u01/export
$ cd /u01
$ chown oracle export
$ chgrp oinstall export
$ exit
```

- 수행 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/01_datapump_export_dir_create_01.png)

- oracle user 로 로그인하여 sqlplus 로 접속합니다.

```text
$ sudo su - oracle
$ sqlplus / as sysdba
```

- sqlplus 로 다음 쿼리를 수행하여 export directory 를 생성합니다.

```text
SQL> create directory export as '/u01/export';
SQL> exit
```

- 수행 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/02_datapump_export_dir_create_02.png)


### STEP 3 : SOURCE DB 에서 Data Pump Export 수행
Data Pump Export 명령인 expdp 명령을 통해 데이터를 export 를 받는 단계입니다. 사전에 얼마의 시간이 걸릴 것인지 체크 후 본 expdp 명령을 수행합니다. 참고로 Data Pump 는 병렬 처리가 가능한 Parallelism 을 지원합니다.

- export 사전 소요 시간 체크
```text
$ sudo su - oracle
$ expdp directory=export full=Y nologfile=Y estimate_only=Y parallel=4
```
- 수행 결과 (수행 시 DBA 계정과 Password 입력 필요)
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/03_datapump_export_precheck.png)

- 사전체크가 완료되면 아래 expdp 명령을 통해 본격적인 export 를 수행합니다.
```text
$ expdp DIRECTORY=export DUMPFILE=orclfull.dmp LOGFILE=full_exp.log FULL=YES parallel=4
```

- 수행 결과 (수행 시 DBA 계정과 Password 입력 필요)
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/04_datapump_export_start.png)
- Export 수행 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/05_datapump_export_end.png)

### STEP 4 : TARGET DB 에 Export Directory 생성 후 SOURCE DB 의 Dump 파일을 TARGET DB 로 전송
SOURCE DB 에서 export 받은 dump 파일을 TARGET DB 쪽으로 옮기기 위한 Directory 를 생성해 줍니다. SOURCE DB 와 마찬가지로 Export Directory 를 생성합니다.

- TARGET DB 인 DBCS 에 Root User 로 Terminal 에 로그인 후 다음 명령을 실행합니다.

```text
$ sudo su -
$ mkdir /u01/export
$ cd /u01
$ chown opc export
$ chgrp opc export
$ exit
```
- 수행 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/06_datapump_target_export_directory.png)

- SOURCE DB 의 '/u01/export' Directory 의 dump 파일을 로컬디스크로 다운받습니다.
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/07_datapump_data_move.png)

- 다운받은 dump 파일을 TARGET DB 의 '/u01/export' 에 dump 파일을 업로드합니다.
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/08_datapump_data_move_upload.png)

### STEP 5 : dump 파일 소유권 변경 및 TMSNAMES.ora 파일 수정
dump 파일은 opc 계정으로 DBCS DB 의 VM 에 업로드되어서 oracle 사용자에게 권한이 없습니다. 권한 부여와 TNSNAMES.ora 파일의 SERVICE 항목을 변경해 줍니다.

- TARGET DB 에 접속하여 root 사용자로 업로드한 dump 파일의 소유권을 oracle 사용자로 변경합니다.

```text
$ sudo su - 
$ cd /u01/export
$ chown oracle *.*
$ chgrp oinstall *.*
$ cd /u01
$ chown oracle export
$ chgrp oinstall export
$ exit 
```
- 수행 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/09_datapump_data_change_owner.png)

- oracle 사용자로 전환하여 TNSNAMES.ora 파일을 수정해 줍니다.
```text
$ sudo su - oracle
$ cd $ORACLE_HOME/network/admin
$ vi tnsnames.ora
```
- 다음의 예처럼 TARGET DB 의 상위 서비스명을 복사하여 아래와 같이 PDB 명과 SERVICE_NAME 항목을 변경합니다.
```text
PDB1 =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = trgdbcs)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = PDB1.sub12150803481.pslimvcnmigrati.oraclevcn.com)
    )
  )
```
- 수정 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/10_datapump_modify_tnsnames.png)

- tnsping 을 수행하여 해당 pdb 이름으로 서비스를 아래와 같이 성공적으로 찾는지 확인합니다.
```text
$ tnsping PDB1
$ exit
```
- 수행 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/11_datapump_tnsping.png)

### STEP 6 : TARGET DB (DBCS) 에 PDB 로 연결하여 Data Import 수행
TARGET DB 의 PDB 로 데이터를 Import 하는 단계입니다. 
- PDB 로 연결하여 아래와 같이 system 계정에 import 를 수행할 수 있는 권한을 부여해 줍니다.
```text
$ sudo su - oracle
$ sqlplus / as sysdba
 
SQL> alter session set container=PDB1;
SQL> create directory export as '/u01/export';
SQL> grant dba to system with admin option;
SQL> grant CONNECT,RESOURCE,imp_full_database to system with admin option;
SQL> exit
```
- 수행 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/12_datapump_grant.png)

- 다음 명령을 실행하여 권한을 먼저 Import 합니다.
```text
$impdp system/Password@PDB1 directory=export dumpfile=orclfull.dmp logfile=roles.log full=Y INCLUDE=USER,ROLE,ROLE_GRANT,PROFILE
```
- 수행 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/13_datapump_import_permission.png)

- 다음 명령을 실행하여 실질적인 데이터를 Import 합니다.
```text
$impdp system/Password@PDB1 directory=export dumpfile=orclfull.dmp logfile=import.log full=Yes parallel=4
```
- 수행 결과 - 아래 화면처럼 User Table 들이 제대로 Import 를 수행하고 있는지 확인합니다. (참고 : ORA-31685: Object type USER:"SYS" failed due to insufficient privileges. 와 같은 에러가 발생하나 무시해도 됨)
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/14_datapump_import.png)

### STEP 7 : 데이터 확인
TARGET DB 에 SOURCE DB 와 동일한 사용자, 테이블, 데이터들이 제대로 Import 되었는지 확인합니다.
- TARGET DB 에 oracle 사용자로 sqlplus 실행 후 SELECT 쿼리 수행
```text
$ sudo su - oracle
$ sqlplus / as sysdba
SQL> alter session set container=PDB1;
SQL> select count(*) from SRC_OCIGGLL.SRC_CITY;
```
- 실생 결과
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/15_datapump_import_result.png)

- SQLDeveloper 를 통한 Import 데이터 확인
![Terminal]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/oracle/datapump/16_datapump_import_result_sqldev.png)

오프라인 기반이지만 데이터베이스를 가장 심플하고 안정적으로 마이그레이션할 수 있는 방법인 Data Pump 기반의 Export & Import 에 대해 실습 자료를 작성해 보았습니다. 데이터베이스 Migration 에 많은 도움이 되길 바랍니다. 

---