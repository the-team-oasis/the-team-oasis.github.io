---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "Autonomous Database Cloud Service Hands-On - Provisioning, Object Storage Parquet Data Load 하기"
teaser: "OCI Autonomous Database Cloud Service 를 프로비저닝하고 오브젝트 스토리지의 Parquet 데이터를 로드 하는 방법에 대해 실습하실 수 있습니다."
author: lim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, database, exadata, autonomous]
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

### Hands-On 소개
OCI Autonomous Database는 클라우드 기반 자율 데이터 관리 솔루션으로, 자동 패치 적용, 업그레이드 및 튜닝을 제공합니다. Autonomous Database 클라우드는 자체 관리, 자체 보안 및 자체 복구 기능을 갖추고 있어 수동 데이터베이스 관리 및 인적 오류를 방지하는 데 도움이 됩니다. 이번 Hands-On 블로그에서는 새로운 Autonomous Database 중 Autonomous Data Warehouse 를 프로비저닝하고 Object Storage 에 저장된 Parquet 파일을 Database 에 로드하는 방법과 Local 에 있는 파일 데이터를 로드하는 방법에 대해 실습 상세히 설명합니다.

#### 1. Autonomous Data Warehouse (ADW) 프로비저닝
간단하게 Database 의 이름과 ADMIN 사용자의 Password 만 입력하여 수분안에 빠르게 데이터베이스가 생성되어 즉시 사용이 가능합니다.
  1. OCI Console 에 로그인하여 아래의 Navigation 메뉴에서 Autonomous Database (자율운영 데이터베이스) 메뉴를 선택합니다.
    ![ADB Create](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_menu_01.png " ")

  2. Autonomous Database (자율운영 데이터베이스) 목록 화면에서 선택된 Compartment (컴파트먼트) 를 확인하고 "자율운영 데이터베이스 생성" 버튼을 클릭합니다.
    ![ADB Create](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_menu_02.png " ")

  3. Autonomous Database (자율운영 데이터베이스) 생성 화면에서 아래 화면과 같이 표시 이름과 DB 이름을 입력하고 워크로드 유형을 선택 후 화면 아래로 스크롤을 합니다.
    ![ADB Create](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_create_db_03.png " ")
      * <mark>표시 이름</mark> : 목록에서 나타낼 이름을 입력합니다.
      * <mark>데이터베이스 이름</mark> : 데이터베이스를 인식할 이름으로 영문과 숫자 조합으로 입력합니다.
      * <mark>작업 로드 유형 (워크로드 유형)</mark> : 데이터베이스가 주로 처리해야할 워크로드 유형에 따라 선택합니다.
        - 데이터 웨어하우스 - DW 용도로 데이터를 적재하고 분석하는 용도로 선택해서 사용
        - 트랜잭션 처리 - OLTP 워크로드를 주로 처리하는 데이터베이스 용도로 선택해서 사용
        - JSON - MongoDB 와 같은 DocumentDB 워크로드를 처리하는 데이터베이스
  4. 데이터베이스 구성 섹션에서 개발자 모드, 데이터베이스 버전, 초기 세팅할 CPU 갯수, 컴퓨츠 자동 스케일링 여부, 스토리지 용량, 스토리지 자동 스케일링 여부를 선택한 후 아래로 스크롤을 합니다.     
    ![ADB Create](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_create_db_04.png " ")
      * <mark>개발자</mark> : 개발자용 Autonomous Database 로 고정된 4 ECPU, 최대 20GB 스토리지 사양으로 사용하실 수 있는 모드입니다.
  5. 자동 백업 옵션은 Default 로 두고 관리자 인증 생성 섹션까지 아래로 스크롤 하여 아래 화면처럼 ADMIN 사용자에 대한 Password 를 입력 후 생성 버튼을 클릭합니다.
    ![ADB Create](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_create_db_05.png " ")
  6. 생성 버튼을 클릭하면 아래와 같이 화면이 전환되며 상태가 "프로비저닝" 상태였다가 2 ~ 3분 뒤 "사용 가능" 상태로 전환이 되면 데이터베이스를 즉시 사용하실 수 있습니다.
    ![ADB Create](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_create_db_06.png " ")

#### 2. Autonomous Database 사용자 추가
Autonomous Database 에서는 사용자 관리, SQL Developer, Data Loader 등 다양한 데이터베이스 사용 툴들을 제공합니다. 데이터베이스에 신규 스키마를 생성하고 어플리케이션 개발을 위해 스키마의 Owner 인 신규 사용자를 생성해야 합니다. (기본적으로 생성된 관리자 사용자인 ADMIN 사용자는 관리 용도로만 사용 권고) 데이터베이스 사용자 관리 툴을 이용하여 사용자 추가를 실습합니다.

  1. Autonomous Database 의 상세 화면에서 우측 상단의 "모든 데이터베이스 작업 보기" 버튼을 클릭하면 별도의 브라우저 윈도우가 팝업되어 사용할 수 있는 Autonomous Database 사용 Tool들이 있는 Database Actions 메뉴 화면이 나타납니다.
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_07.png " ")
    <br>
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_08.png " ")

  2. Database Actions 메뉴에서 관리 탭의 데이터베이스 사용자 메뉴를 선택하여 클릭하면 사용자를 추가할 수 있는 화면으로 전환됩니다.
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_09.png " ")

  3. 전환된 사용자 관리 화면에서 "+사용자 생성" 버튼을 클릭하면 사용자를 추가할 수 있는 메뉴가 나타납니다.
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_10.png " ")
    <br>
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_11.png " ")

  4. 전환된 사용자 관리 화면에서 "+사용자 생성" 버튼을 클릭하면 사용자를 추가할 수 있는 메뉴가 나타납니다. 사용자 추가를 위해 아래의 항목들을 입력 및 선택하여 사용자를 생성합니다.
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_12.png " ")
      * <mark>사용자 이름</mark> : 데이터베이스 사용자 이름을 입력합니다.
      * <mark>비밀 번호</mark> : 데이터베이스 사용자 비밀번호를 입력합니다.
      * <mark>테이블스페이스의 할당량 DATA</mark> : 데이터베이스 사용자에게 할당될 데이터 사이즈를 드랍다운 목록에서 선택하여 줍니다. (사이즈:25M, 100M, 500M, 1GB, UNLIMITED 중 택 1)
      * <mark>REST, GraphQL, MongoDB API 및 웹 엑세스</mark> : True 로 선택
      * <mark>웹 엑세스 고급 기능의 권한 부여 필요 옵션 </mark> : True 로 선택

  5. 추가한 사용자(예:APPDEVELOP)가 사용자 목록에 나타났는지 확인 후 로그인된 ADMIN 사용자를 사인아웃합니다.
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_13.png " ")

  6. 로그아웃을 수행하면 다시 로그인 화면이 나타납니다. 추가한 사용자(예:APPDEVELOP)로 Database Actions 화면으로 제대로 로그인이 되는지 확인합니다.
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_14.png " ")

  7. 로그인한 Database Actions 화면에서 개발 탭의 SQL 메뉴를 클릭하여 SQL Developer 가 실행되는지 확인합니다.
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_15.png " ")
    <br>
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_16.png " ")

  8. 이제 추가된 사용자를 가지고 데이터를 Loading 하고 어플리케이션을 개발할 준비가 되었습니다.

#### 3. Autonomous Database 에 Data Loading (Local CSV 파일)
이제 준비된 Autonomous Database 에 추가한 사용자의 스키마에 데이터를 로딩하는 방법에 대해 살펴봅니다. Autonomous Database 는 보다 손쉽게 데이터를 로딩할 수 있는 방법을 제공합니다. 로컬에 있는 CSV 파일을 Autonomous Database 로 데이터를 로딩하는 방법에 대해 실습합니다.

  1. Database Actions 의 Data Load 툴을 이용하여 Local Disk 에 있는 CSV 파일을 Loading 할 수 있습니다. 먼저, 아래의 화면에서 Data Studio 의 데이터 로드 메뉴를 선택합니다.
  전환된 데이터 로드 화면에서 데이터 로드 타일을 선택합니다.
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_17.png " ")  
  <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_18.png " ")  

  2. 데이터 로드 메뉴에서 로컬 파일 메뉴를 선택하면 아래에 로컬 파일을 업로드 할 수 있는 창이 나타납니다. 로컬 파일을 Drag 해서 파일을 끌어 놓거나 파일 선택 버튼을 클릭하여 로드할 데이터 CSV 파일을 선택하여 줍니다.
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_19.png " ")  
  <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_20.png " ")  

  3. 선택한 CSV 파일이 업로드되고 해당 파일을 Database 에 로드하기 전에 검토할 수 있습니다. 업로드된 파일명을 클릭하면 아래와 같이 테이블의 이름은 어떤 이름으로 만들 것인지 혹은 기존 테이블이 존재하면 데이터를 삽입하거나 병합할 것인지를 선택할 수 있습니다. 테이블 이름은 파일이름을 기준으로 자동으로 입력이 되는데 원하는 이름으로 변경할 수 있습니다.
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_21.png " ")  
  <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_22.png " ")  
  <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_23.png " ")  

  4. 닫기 버튼을 클릭하고 파일 목록 상단의 시작 버튼을 클릭하면 데이터 로딩을 시작합니다. 데이터 로딩이 완료되면 로딩 결과 보고서를 확인하실 수 있습니다.
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_24.png " ")  
  <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_25.png " ")  
  <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_26.png " ")

  5. 로딩된 데이터를 확인하기 위해서 Database Actions 툴에서 제공하는 SQL Developer 를 통해 확인할 수 있습니다.
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_15.png " ")
    <br>
    ![ADB User](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_27.png " ")

#### 4. Autonomous Database 에 Data Loading (Object Storage 의 Parquet 파일)
데이터를 Object Storage 에 대량으로 Parquet 파일 형태로 보관하고 있을 경우, Autonomous Database 의 Data Loader 툴을 통해 직접 Object Storage 에서 Autonomous Database 로 Data Load 를 수행할 수 있습니다.

  1. Object Storage 에 있는 Parquet 파일을 Data Loading 하기 위해 Parquet 파일을 준비하여 Object Storage 로 업로드 합니다. 테스트를 위해 공개된 Parquet 파일을 다운로드하여 Object Storage 로 업로드 실습을 진행합니다. 먼저, 버킷 생성을 위해 Object Storage 의 버킷 메뉴로 이동합니다.
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_28.png " ")
  
  2. 컴파트먼트를 확인한 후 버킷 생성 버튼을 클릭한 후 버킷 이름을 입력하고 스토리지 계층을 표준으로 선택한 후 버킷 생성 버튼을 클릭합니다.
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_29.png " ")
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_30.png " ")

  3. 생성된 버킷의 가시성이 기본적으로 프라이빗으로 설정된 것을 확인할 수 있는데, 편의상 이번 실습에서는 간편하게 스토리지의 인증 정보를 설정하지 않는 방법으로 간편하게 데이터 로딩을 하기 위해 가시성을 퍼블릭으로 편집합니다. (권고 사항은 보안을 위해 Object Storage 의 가시성은 프라이빗으로 설정을 권고합니다.)
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_31.png " ")
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_32.png " ")

  4. 버킷을 클릭하여 버킷의 상세 정보로 접근해서 객체 탭을 클릭하면 버킷에 올라가 있는 파일이나 폴더의 객체를 확인하실 수 있습니다. 객체 업로드 버튼을 클릭하여 로컬 디스크에 준비한 Parquet 파일들을 Object Storage 의 Bucket 에 업로드 합니다.
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_33.png " ")
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_34.png " ")
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_35.png " ")
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_36.png " ")
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_37.png " ")
    
 5. 업로드된 Object Stroage 의 데이터를 접근하기 위해서는 객체의 위치 정보인 URI 정보를 획득해야 합니다. URI 정보는 아래와 같은 샘플 형식으로 객체의 위치 정보가 저장되어 있습니다. 객체의 위치 정보는 아래 화면과 같이 객체 세부정보 보기 메뉴를 선택하여 확인할 수 있습니다.

    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb//oci_adb_handson_oss_data_load_40.png " ")  
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb//oci_adb_handson_oss_data_load_41.png " ")  

    - 객체 정보의 샘플 형식은 아래와 같이 객체를 뜻하는 '/o' 까지의 위치 정보를 복사해 클립보드나 메모장에 복사하여 둡니다.
  
    ```
    https://objectstorage.<region>.oraclecloud.com/n/<namespace>/b/<bucket>/o
    ```

 6. 로컬 파일 업로드와 동일하게 Database Actions 의 Data Load 툴을 이용하여 Object Storage 의 Parquet 파일을 Loading 할 수 있습니다. 먼저, 아래의 화면에서 Data Studio 의 데이터 로드 메뉴를 선택합니다. 전환된 데이터 로드 화면에서 데이터 로드 타일을 선택하고 전환된 화면에서 상단 탭의 클라우드 저장소를 클릭하시고 클라우드 저장소 위치 생성 버튼을 클릭합니다.
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_17.png " ")  
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_data_load_18.png " ")  
    <br>
    ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_38.png " ")

7. 아래의 화면에서 버킷 URI 정보에 앞의 5번 단계에서 획득한 URI 정보를 복사하여 붙여넣기 한 후 다음 버튼을 클릭해 줍니다. 
  ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_39.png " ")

8. URI 정보에 정확한 정보가 입력되면 아래와 같이 업로드가 가능한 파일 목록이 나타납니다. 생성 버튼을 클릭하여 클라우드 위치 정보 생성을 마칩니다.
  ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_42.png " ")
    <br>
  ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_43.png " ")

9. 좌측의 Object Storage 내의 파일 목록에서 데이터 로드를 수행할 파일을 선택하고 우측의 창에 Drag & Drop 을 해 놓으면 아래 화면 처럼 데이터 로드가 준비됩니다. 시작 버튼을 클릭하여 데이터 로드를 시작합니다. 업로드가 완료되면 아래 그림과 같이 결과 보고서를 확인하실 수 있습니다. 여러개의 Parquet 파일이 있다면 반복적으로 수행하실 수 있습니다.
  ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_44.png " ")
  <br>
  ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_45.png " ")
  <br>
  ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_46.png " ")

10. Object Storage 로부터 로딩된 Parquet 데이터 결과를 확인하기 위해서 Database Actions 툴에서 제공하는 SQL Developer 를 통해 확인할 수 있습니다. SQL Developer 의 좌측 네비게이터 목록에 테이블들이 추가된 것을 확인할 수 있고, 우측의 쿼리 결과 데이터가 성공적으로 로드가 된 것을 확인할 수 있습니다.
  ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_add_user_15.png " ")
    <br>
  ![ADB Data Load](/assets/img/dataplatform/2025/blog/adb/oci_adb_handson_oss_data_load_47.png " ")

### 마무리
지금까지 Autonomous Database 에 Local Disk 와 Object Storage 에 저장된 CSV 파일, Parquet 파일을 Autonomous Database 에 기본적으로 탑재되어 있는 Data Loading 툴을 이용하여 손쉽게 Load 를 해 보았습니다. Autonomous Database 에 저장된 데이터를 조회할 수 있는 Python, Java, Node.js 어플리케이션 프로그램 개발 방법도 다루도록 하겠습니다. 아래 참고 자료 링크를 참조하세요.

### 추가 참고 자료
- [Autonomous Database 서비스 살펴 보기](https://the-team-oasis.github.io/dataplatform/Autonomous-database-cloud-service-overview/)


---

