---
layout: page-fullwidth
#
# Content
#
subheadline: "Networking"
title: "Cross-Region Oracle Heatwave MySQL Disaster Recovery"
teaser: "Cross-Region Oracle Heatwave MySQL Disaster Recovery 설정하는 방법 소개합니다."
author: "kisukim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, mds, heatwave]
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

## Oracle HeatWave MySQL Cross-Region DR (Part 1) 

Oracle HeatWave MySQL Disaster Recovery Copy는 Oracle Cloud Infrastructure(OCI)에서 프로덕션 MySQL 데이터베이스를 다른 리전으로 복제하여 재해 상황에 대비할 수 있도록 제공되는 기능입니다. 이를 통해 리전 장애 발생 시에도 데이터 보호와 서비스 연속성을 확보할 수 있습니다.

OCI에서는 HeatWave MySQL DR Copy를 구성하는 두 가지 방법을 제공합니다. 이번 블로그에서는 첫번째 방식으로 테스트를 진행햘 예정입니다.

	1.OCI Console 기반 방식
	  프로덕션 DB의 전체 백업(Full Backup) 생성
	  백업을 다른 리전으로 복사
	  해당 백업을 기반으로 DR 리전에 DB 생성
	  In-bound Replication Channel을 구성하여 Primary → DR 복제 설정

	2.MySQL Shell 유틸리티 기반 방식
	  MySQL Shell을 이용해 프로덕션 DB를 백업 및 복구
	  DR 리전에 데이터베이스를 생성
	  In-bound Replication Channel을 통해 복제 구성

이 튜토리얼에서는 OCI Console을 활용한 방식에 초점을 맞추어,
프로덕션 데이터베이스의 전체 백업을 생성하고 이를 Cross-Region으로 복사한 뒤,
해당 백업을 기반으로 DR 데이터베이스를 구성하고 Primary → DR 간 복제 채널을 설정하는 전체 과정을 단계별로 설명합니다.

본 가이드는 MySQL 8.0.35 이상 버전에서 실행 중인 Oracle HeatWave MySQL Database Service 환경을 기준으로 하며,
아래 아키텍처 다이어그램은 본 튜토리얼에서 사용되는 전체 DR 구성 구조를 보여줍니다.

![](/assets/img/infrastructure/2025/MySQL_DR_Copy_Architecture.png " ")


위 아키텍처를 구현하기 위해서 아래의 선행 작업이 필요합니다. 
- <strong style="color: red;">각(서울, 싱가포르) 리전간 DRG(Dynatmic Routing Gateway) 구성</strong>
[참조 : OCI Remote Peering - 서로 다른 리전간의 VCN 연결하기](https://the-team-oasis.github.io/infrastructure/oci-remote-peering/)

## 작업 순서 

하나의 테넌시를 기준으로 서울 , 싱가포르 리전을 사용할 것이며 서울은 source 싱가포르는 target이 됩니다. 각 VCN은 아래와 같은 환경으로 구성이 되었습니다. 

```
서울 
   VCN CIDR : 10.10.0.0/16
   Private Subnet : 10.10.1.0/24
   Heatwave endpoint : 10.10.1.14
싱가포르 
   VCN CIDR : 10.0.0.0/16
   Private Subnet : 10.0.1.0/24
   Heatwave endpoint : 10.0.1.26
```



1. 서울 Heatwave를 구성합니다. (일반적인 설정)
   
   [참조 : OCI MySQL Database Service 간단 실습 ](https://the-team-oasis.github.io/learning-library/oci-library/oci-basic-compute/livelabs/index.html?lab=create-mds)

   

2. 서울 Heatwave 구성이 완료된 전체 백업을 해줍니다.

   ![](/assets/img/infrastructure/2025/manual_backup_heatwave.png " ")

3. 서울 Heatwave 전체 백업된 이후 "Copy Backup to Disaster Recovery Region" 을 통해서 싱가포르 리전으로 복제를 합니다.

   ![](/assets/img/infrastructure/2025/dr_region_copy.png " ")

   아래 사용자가 구독한 리전 리스트가 보여집니다. 저의 경우 싱가포르, 아부다비가 구독되어 있어 보여집니다. 테스트는 싱가포르로 합니다. 따라서 싱가포로 복사합니다.
   
   ![](/assets/img/infrastructure/2025/heawave_dr_copy.png " ")

4. 싱가포르에서 서울에서 백업된 데이터를 기준으로 새 데이터베이스 시스템으로 복원

   서울에서 복제된 백업이 싱가포르 리전에 보여집니다. 백업된 데이터를 싱가포르에서 새 DB 시스템으로 복원합니다.
   ![](/assets/img/infrastructure/2025/heatwave_dr_1.png " ")

   ![](/assets/img/infrastructure/2025/heatwave_dr_2.png " ")

   <strong style="color: red;">새로운 DB 시스템을 구성할때, 서울 보다 낮은 스펙 또는 고스펙으로 설정이 가능하며, Standalone 또는 HA 구성도 가능합니다. (서울과 다른 스펙으로도 구성이 가능하며, 서울 보다 낮은 구성도 가능합니다.) 단 비동기 복제가 되어야 하기 때문에 서울과 싱가포르 모두 활성 상태여야 합니다.</strong>

5. 서울에서 복제용 데이터베이스 사용자 생성 합니다.

   싱가포르에서 서울의 Heatwave 복제를 위해서 서울에 복제 관련된 사용자 생성 및 권한을 줍니다. 또한 싱가포르에서 접속을 위한 REPLICATION  관련 설정도 해줍니다. 아래 명령어를 참조 하시면 됩니다.

   ```
   mysql> CREATE USER 'rep11'@'10.0.1.26' IDENTIFIED BY 'Test@123' 
   REQUIRE SSLi Query OK, O rows affected (0.01 sec) 
   mysql› GRANT REPLICATION SLAVE ON *.* TO 'rep11'@'10.0.1.26';
   ```
   ![](/assets/img/infrastructure/2025/heatwave_dr_3.png " ")

6. 싱가포르에서 복제채널을 생성합니다.

   싱가포르에서 신규 데이터 베이스 기반으로 서울과 복제할 채널을 만들어 줍니다. 
   ![](/assets/img/infrastructure/2025/heatwave_dr_4.png " ")

   소스는 서울의 Heatwave endpoint와 사용자 관련 정보는 복제를 위한 사용자 계정정보를 입력합니다. (위에서 사용자 정보 확인 하시면 됩니다.)
   ![](/assets/img/infrastructure/2025/heatwave_dr_5.png " ") 

   보안을 통한 SSL 설정을 기본으로 선택합니다.
   ![](/assets/img/infrastructure/2025/heatwave_dr_6.png " ")

   GTID(Global Transaction Identifier)는 MySQL 복제 환경에서 각 트랜잭션을 고유하게 식별하여, 복제 위치를 자동으로 관리하고 DR 및 장애 복구 시 안정성과 운영 편의성을 크게 향상시키는 핵심 기능입니다. OCI HeatWave MySQL의 Cross-Region DR 구성에서는 GTID 자동 위치 지정을 사용하는 것이 권장됩니다.
   ![](/assets/img/infrastructure/2025/heatwave_dr_7.png " ")

   **‘허용’**은 기본 키(Primary Key)가 없는 테이블에 대해 CREATE TABLE 또는 ALTER TABLE 트랜잭션이 발생하더라도 복제 채널에서 오류 없이 그대로 복제를 진행하도록 허용하는 설정입니다. 복제지연은 소스에서 수신된 트랜잭션을 적용하기 전에 채널이 기다리는 시간(초)입니다. 최소 1초부터 설정이 가능합니다. 
   ![](/assets/img/infrastructure/2025/heatwave_dr_8.png " ")

   대상 시스템은 싱가포르의 Heatwave를 선택하시면 됩니다. 
   ![](/assets/img/infrastructure/2025/heatwave_dr_9.png " ")

   정상적으로 완료되면 아래와 같이 구성된 채널에 대한 상세 정보를 확인 할 수 있습니다. 추후 잘못된 부분이나 수정이 필요한 경우 편집을 통해서 변경 할 수 있습니다. 아래 화면은 구성된 내용이며 각 탭 마다 상세 정보를 확인 할 수 있습니다.
   ![](/assets/img/infrastructure/2025/heatwave_dr_10.png " ")

   로그를 보면 실제 동기화되는데 걸리는 시간 및 실패에 대한 로그를 확인 할 수 있습니다.
   ![](/assets/img/infrastructure/2025/heatwave_dr_11.png " ")


7. 서울에서 만들어진 데이터 베이스에 대해서 CRUD 테스를 진행하여 정상 여부를 확인 합니다. 

   서울에서 테이블 및 데이터 입력하고서 싱가포르에서 확인한 모습입니다.
   ![](/assets/img/infrastructure/2025/heatwave_dr_12.png " ")


이번 글에서는 OCI Console을 활용해 Oracle HeatWave MySQL의 Cross-Region Disaster Recovery Copy를 구성하는 방법과 함께, GTID 설정 및 기본 키 없는 테이블 처리 옵션의 의미를 살펴 보았습니다.

단기적인 DR 구성과 장기적인 운영 안정성 사이에서 어떤 선택이 적절한지는 각 서비스의 특성과 운영 정책에 따라 달라질 수 있습니다. 다만, DR 환경은 평상시보다 장애 상황에서 더 큰 차이를 만들기 때문에, 초기 설계 단계에서의 옵션 선택이 무엇보다 중요합니다.