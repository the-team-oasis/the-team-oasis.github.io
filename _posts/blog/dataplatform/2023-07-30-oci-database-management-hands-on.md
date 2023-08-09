---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "[Hands-On] OCI Database Management Service 활성화 (Enable) 방법 실습"
teaser: "On-Premise 와 Cloud 에서 동작 중인 Oracle Database 의 관리와 모니터링을 위해 다양한 기능들을 제공하는 OCI (Oracle Cloud Infrastructure) 의 Database Management 를 활성화 하는 방법에 대해 실습해 봅니다."
author: lim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, oracle database, database management]
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

### 서비스 소개

OCI Database Management Service 는 온프레미스 및 클라우드에서 Oracle 데이터베이스를 관리하고 모니터링하기 위한 광범위한 기능을 제공하는 클라우드 서비스입니다. 새로운 Database Management 서비스 릴리스는 이제 Management Agent를 설치하지 않고도 OCI의 가상 머신, Bare Metal 및 Exadata Cloud Service에서 Oracle Database를 지원합니다.

OCI IaaS, ExaCC, 온프레미스 또는 기타 클라우드에서 실행되는 데이터베이스의 경우 관리 에이전트를 설치하고 데이터베이스 관리 서비스에서 데이터베이스를 외부 데이터베이스 리소스로 등록해야 합니다.

데이터베이스 관리 서비스는 다음과 같은 기능을 제공합니다.
- Fleet Montoring & Management
  - On-Premise 및 Cloud 전반에서 Oracle Database 를 모니터링하고 관리하기 위한 통합 보기 지원
- 성능 진단
  - 손쉬운 성능 진단을 위한 데이터베이스 Activity 의 통합 보기
  - ADDM (Automatic Database Diagnositic Monitor), ASH (Active Session History) 분석, SQL 모니터링, 
- 데이터베이스 관리
  - 테이블스페이스 관리
  - 데이터베이스 Parameter 구성
  - 예약된 작업 등....

이 블로그에서는 Oracle Cloud 데이터베이스용 데이터베이스 관리 서비스를 활성화하는 단계별 가이드를 제공합니다.

### 사전 준비 사항
- DBCS 구성을 위한 Virtual Cloud Network (VCN) 구성 
- OCI DBCS 에 올려진 Oracle Database - DBCS 생성 시  [DBCS 생성 퀵스타트 가이드 참고](/dataplatform/oracle-database-cloud-service-quickstart/){:target="_blank" rel="noopener"} 
- OCI Valut - 비밀번호 관리

### STEP 1 : Oracle Database Monitoring 사용자 (dbsnmp) 암호 및 권한설정
데이터베이스 사용자(예: SYSTEM 또는 DBSNMP)에게 데이터베이스 모니터링 및 관리에 필요한 권한을 부여합니다.

```sql
alter user dbsnmp account unlock;
alter user dbsnmp identified by "Strong_P@ssword45";
GRANT CREATE PROCEDURE TO dbsnmp;
GRANT SELECT ANY DICTIONARY, SELECT_CATALOG_ROLE TO dbsnmp;
GRANT ALTER SYSTEM TO dbsnmp;
GRANT ADVISOR TO dbsnmp;
GRANT EXECUTE ON DBMS_WORKLOAD_REPOSITORY TO dbsnmp;
```

- 수행 결과

![Terminal](/assets/img/dataplatform/2023/oracle/dbmgnt/01_oci_dbmgmt_user_unlock.png)

### STEP 2 : Monitoring 사용자 비밀번호를 OCI Vault 에 Secret 으로 저장
OCI Console 의 메뉴에서 ID & Security 에서 Vault 서비스를 선택 클릭합니다.

![Vault](/assets/img/dataplatform/2023/oracle/dbmgnt/02_oci_dbmgmt_vault_secret_01.png)

- 필요한 경우 새로운 Vault 를 생성하기 위해 Create Vault 버튼을 클릭합니다. 

  ![Vault](/assets/img/dataplatform/2023/oracle/dbmgnt/03_oci_dbmgmt_vault_secret_02.png)

- Vault 저장소를 아래 그림과 같이 Vault 이름을 지정하여 Vault 를 생성합니다.

  ![Vault](/assets/img/dataplatform/2023/oracle/dbmgnt/04_oci_dbmgmt_vault_secret_03.png)

- Vault 내에서 사용자 암호를 암호화하는데 사용할 키를 아래 그림과 같이 만듭니다.

  ![Key](/assets/img/dataplatform/2023/oracle/dbmgnt/05_oci_dbmgmt_vault_secret_04.png)

- 좌측 메뉴의 Secrets 메뉴를 클릭하여 DBSNMP 사용자에 대한 패스워드를 아래 그림과 같이 DBSNMP_DB_Password 와 같은 이름으로 저장해 줍니다.

  ![Key](/assets/img/dataplatform/2023/oracle/dbmgnt/06_oci_dbmgmt_vault_secret_05.png)

- Secret 생성 시 이전 단계에서 생성한 Key 를 선택하고, 저장할 비밀번호를 Secret Contents 에 입력합니다.

  ![Key](/assets/img/dataplatform/2023/oracle/dbmgnt/07_oci_dbmgmt_vault_secret_06.png)

### STEP 3 : Database Management 서비스에 대한 IAM 권한 할당
Database Management 서비스를 사용하기 위한 Identity & Access Management 에 다음의 권한을 부여합니다.
- OCI Vault Secret 에 저장된 Database Monitoring 사용자 비밀번호 일기 권한
- Oracle Cloud Database 들에 대한 예약된 작업의 결과를 Object Storage 서비스에 쓰기 권한

다음의 문장을 사용하여 새로운 IAM Policy 를 생성합니다.

```text
Allow service dpd to read secret-family in compartment ABC
Allow service dpd to manage objects in compartment ABC
```

### STEP 4 : OCI 사용자에게 IAM 권한 할당
Database Management 를 활성화하고 사용하려면 테넌시 Administrators 그룹 또는 다음 권한이 있는 그룹 (예: DB-MGMT-ADMIN) 에 속해야 합니다.

```text
Allow group DB-MGMT-ADMIN to manage dbmgmt-family in compartment ABC
Allow group DB-MGMT-ADMIN to read database-family in compartment ABC
Allow group DB-MGMT-ADMIN to manage vnics in compartment ABC
Allow group DB-MGMT-ADMIN to use subnets in compartment ABC
Allow group DB-MGMT-ADMIN to use network-security-groups in compartment ABC
Allow group DB-MGMT-ADMIN to use security-lists in compartment ABC
Allow group DB-MGMT-ADMIN to manage secret-family in compartment ABC
Allow group DB-MGMT-ADMIN to read buckets in compartment ABC
```
WHERE 절을 사용하여 이러한 권한을 특정 리소스로 추가로 제한할 수 있습니다.

### STEP 5 : Network 구성 - VCN 에 Private Endpoint 생성
Database Management 서비스는 VCN 내에 생성된 Private Endpoint 를 통해 클라우드 Database 와 상호 통신을 합니다. Private Endpoint 는 Cloud Database 와 동일한 Subnet 에 있을 필요는 없지만 Cloud Database 와의 통신을 허용하는 Subnet 에 있어야 합니다.

- OCI Console 에서 Database Management 메뉴를 찾아 클릭합니다.
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/08_oci_dbmgmt_menu.png)

- Database Management 메뉴 중에서 Administration 의 Private Endpoints 메뉴에 Access 후 "Create private endpoint" 버튼을 클릭합니다.
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/09_oci_dbmgmt_private_endpoint_01.png)

- Private Endpoint 이름을 지정하고 Compartment 를 선택한 다음 VCN, Subnet 등을 선택 후 마지막에 Private Endpoint 생성 버튼을 클릭합니다.
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/10_oci_dbmgmt_private_endpoint_02.png)

- Private Endpoint 가 생성되면 화면과 같이 Endpoint 를 위한 Private IP 가 할당됩니다.
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/11_oci_dbmgmt_private_endpoint_03.png)

### STEP 6 : Network 구성 - Private Endpoint 와 Cloud Database 간의 Network Traffic 허용
VCN 의 Security List 나 Security Group 에 수신 (Ingress) 및 송신 (Egress) 규칙을 추가하여 Database Management 서비스가 Private Endpoint 를 통해 Cloud Database 와 통신할 수 있도록 합니다. RAC DB 인 경우 SCAN IP 를 사용하여 Database Management 서비스와 통신하도록 설정합니다.

- 아래와 같은 보안 규칙을 추가합니다.
  - OCI 의 Oracle Base Database Service 의 VM DB 시스템의 Network Security List 에서 Private Endpoint 의 Private IP 를 Ingress Rule 에 추가하여 데이터베이스가 Database Management Service 에서 트래픽을 수신할 수 있도록 설정
  - Private Endpoint 의 Network Security List 에 Oracle Base Database Service 의 VM DB 시스템의 Private IP를 Egress Rule 에 추가하여 Database Management Service 가 데이터베이스에 요청을 보낼 수 있도록 Egress Rule 설정

- VCN Subnet Security List 의 Ingress Rule 설정 추가 예
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/12_oci_dbmgmt_security_list_01.png)
- VCN Subnet Security List 의 Engress Rule 설정 Egress Rule 설정 예
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/13_oci_dbmgmt_security_list_02.png)

### STEP 7 : Database Management 활성화 

Database Management 를 활성화하면 Full Management 또는 Base Management 옵션을 선택할 수 있습니다.

- Database Management 서비스의 기능 구분 (Full / Base)
  - Full Management : EE를 위한 모든 데이터베이스 관리 기능을 포함합니다. Performance Hub 기능은 SE에서 사용할 수 없습니다.
  - Base Management : CPU Utilization 및 Storage Allocated 와 같은 14가지 기본 모니터링 지표를 포함합니다. 또한 CDB 용 Performance Hub 에는 ASH 분석 및 SQL 모니터링 기능이 포함되지만 PDB용은 포함되지 않습니다.

- Database Management 를 Enable 하기 위해 Database Details 페이지로 Access 합니다.

  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/14_oci_dbmgmt_enable_dbmgmt_01.png)

- 아래로 스크롤 다운하여 Database Management Enable 을 클릭합니다.
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/15_oci_dbmgmt_enable_dbmgmt_02.png)

- Enable 버튼 클릭 시 나타난 입력란에는 기본적인 정보들이 아래 화면과 같이 모두 입력되어 있습니다.
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/16_oci_dbmgmt_enable_dbmgmt_03.png)

- Enable Database Management 창을 아래로 더 스크롤 다운하여 Database Management 서비스가 연결 시 사용할 사용자 정보 DBSNMP 를 아래 화면과 같이 입력하고, STEP 2 에서 생성했던 Vault 의 Secret Key 를 선택하고, STEP 5 에서 생성했던 Private Endpoint 를 선택 후 아래로 스크롤 다운합니다.
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/17_oci_dbmgmt_enable_dbmgmt_04.png)

- Enable Database Management 창을 아래로 더 스크롤 다운하여 Management Option 을 선택해 후 Enable Database 버튼을 클릭하여 활성화를 진행합니다.
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/18_oci_dbmgmt_enable_dbmgmt_05.png)

- 아래 그림과 같이 Database 의 상태가 "UPDATE" 상태로 바뀝니다.
  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/19_oci_dbmgmt_enable_dbmgmt_06.png)

- Database 의 상태가 "AVAILABLE" 상태로 바뀌면, Database Management 메뉴로 Access 를 하면 아래 그림과 같이 조금전 등록했던 Database (DBMGMT) 이름이 나타나는 것을 확인할 수 있습니다.

  ![DBMGMT](/assets/img/dataplatform/2023/oracle/dbmgnt/20_oci_dbmgmt_enable_dbmgmt_07.png)

지금까지 Database Management 서비스를 활성화하는 절차를 단계별로 설명해 보았습니다.
Base Database 서비스 Virtual Machines, Bare Metal 및 Exadata Cloud Service에서 Oracle Cloud 데이터베이스에 대한 Database Management 서비스를 매우 쉽게 ​​활성화할 수 있습니다.
이 실습에서는 CDB 에 대한 Database Managment 활성화를 수행해 보았지만, PDB 에 대한 Database Management 활성화도 동일한 방법으로 손쉽게 활성화하실 수 있습니다.
포괄적인 데이터베이스 성능 진단, 모니터링 및 관리 기능을 시작하고 활용하십시오.

Database Management 서비스에 대한 자세한 기능은 다음 블로그 글을 통해 설명드리도록 하겠습니다.

---