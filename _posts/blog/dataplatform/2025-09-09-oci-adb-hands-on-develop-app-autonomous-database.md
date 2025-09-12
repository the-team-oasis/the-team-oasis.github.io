---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "Autonomous Database Cloud Service Hands-On - Python, Node.js, Java 프로그램 개발하기"
teaser: "Python, Node.js, Java, 프로그램에서 SQL 쿼리를 실행하여 Oracle Autonomous Database 에 연결하는 방법을 실습합니다."
author: lim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, database, exadata, autonomous, ADB, Python, Java, NodeJS]
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
이 Hands-On 에서는 Python, Node.js, Java 프로그램에서 SQL 쿼리를 실행하여  Oracle Autonomous Database 에 연결하는 방법을 실습합니다.

### 사전 준비 사항
- [Autonomous Database Cloud Service Hands-On - Provisioning, Object Storage Parquet Data Load 하기](https://the-team-oasis.github.io/dataplatform/oci-adb-hands-on-provisioning-data-load/)
- Wallet 파일 다운로드
- One-way TLS 연결 구성
- 개발 실습을 위한 Compute Instance

### Hands-On 실습
이번 Hands-On 에서는 아래와 그림과 같이 Python, Node.js, Java 프로그램에서 Autonomous Database 에 연결하여 SQL 쿼리를 수행하는 것을 실습합니다.

![ADB Create](/assets/img/dataplatform/2025/blog/adb/develop/oci_adb_app_develop_01.png " ")

#### Autonomous Data Warehouse (ADW) 및 컴퓨트 인스턴스 프로비저닝

먼저 위 사전 준비 사항의 링크를 참조하여 Autonomous Database 를 참조하여 Autonomous Database 를 Provisioning 합니다. 더불어, Python, Java, Node.js 프로그램을 실행할 컴퓨트 Instance 를 생성합니다.

#### Python 어플리케이션 개발
python-oracledb 드라이버를 사용하면 Python 3 애플리케이션이 Oracle Database에 연결할 수 있습니다. Autonomous Database 에서도 동일한 Oracle Driver 를 사용하여 연결을 합니다. Python-oracledb는 과거 Python cx_Oracle 드라이버의 새 이름입니다.

1. Python 설치 - 
python-oracledb 을 사용하기 위해서는 Python 3.8, 3.9, 3.10, 3.11, 3.12 나 3.13 을 설치하여야 합니다.
  - Python version 체크
    
    ```
    python3 --version
    ```
2. python-oracledb 설치 - python-oracledb를 설치하려면 다음 명령을 사용하세요. 시스템 디렉터리에 쓰기 권한이 없는 경우 --user 옵션이 유용할 수 있습니다.
    ```
    python3 -m pip install oracledb
    ```  
    ```
    python3 -m pip install oracledb --upgrade --user
    ```  

    ![Python Install](/assets/img/dataplatform/2025/blog/adb/develop/oci_adb_app_develop_python_02.png " ")

3. Wallet 을 이용한 Python 개발
  - Autonomous Database 의 상세 메뉴에서 Wallet 을 다운받을 수 있습니다. 아래의 화면을 참고하여 Wallet 파일을 다운 받습니다.
  - 다운받은 Wallet 파일을 unzip 하여 파일들을 확인합니다.
  - Thin mode 에서 python-oracledb 에서는 Wallet 파일 안에 파일들 중에서 아래 두가지 파일만 필요합니다.
    - <mark>tnasnames.ora</mark> - 
    - <mark>ewallet.pem</mark> - 

#### 3. Node.js 어플리케이션 개발
#### 4. Java 어플리케이션 개발

### 마무리
추후 Autonomous Database 와 Gen AI 를 연동하여 RAG Chatbot 을 구축하는 방법에 대해....

### 추가 참고 자료
- [Autonomous Database 서비스 살펴 보기](https://the-team-oasis.github.io/dataplatform/Autonomous-database-cloud-service-overview/)
- [Autonomous Database Cloud Service Hands-On - Provisioning, Object Storage Parquet Data Load 하기](https://the-team-oasis.github.io/dataplatform/oci-adb-hands-on-provisioning-data-load/)

---

