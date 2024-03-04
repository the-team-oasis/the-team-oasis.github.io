---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "OCI Database 알림 설정하기 - 자동 백업(Automatic Backup)이 실패했을 때 알림 받기"
teaser: "OCI DBCS에 설정된 자동백업이 실패 하는 경우에 Notification을 받을 수 있는 방법에 대해 알아봅니다."
author: yhcho
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, oracle database, notification, automatic backup, 알림 설정, 알람, 백업 오류]
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

## Intro
이번 포스팅에서는 OCI Database 서비스 인스턴스에서 구성한 자동 백업이 실패할 경우 이메일로 알림이 발송 되도록 구성하는 단계별 절차에 대해 알아 보려고 합니다.

## 사전 준비 사항
아래 실습에서는 Topic 과 Subscription, 그리고 Event-rule 을 생성하여 알림을 구성 합니다. 
만약 클라우드 계정의 관리자가 아닌 경우 실습에 진행하기 전에 먼저 필요한 권한이 충분한지 확인하고 필요한 경우 클라우드 관리자가에 아래 예시의 권한을 요청해야 합니다.

  ```txt
  Allow group <group_name> to manage ons-topics in compartment <compartment_name>
  Allow group <group_name> to manage cloudevents-rules in compartment <compartment_name>
  Allow group <group_name> to inspect compartments in tenancy
  ```

## 1. Topic & Subscription 생성하기
1. 전체 메뉴에서 "개발자 서비스(Developer Service)" -> "애플리케이션 통합(Application Integration)" -> "통지(Notifications)" 메뉴를 클릭하여 통지 화면으로 이동합니다.
   ![](/assets/img/dataplatform/2023/alarm-dbcs/topic-1.png " ")
2. "토픽 생성" 버튼을 클릭하여 토픽을 생성해줍니다.
   + 이름 입력 예시 : backup-notify
   + 설명을 입력합니다
   + "생성" 버튼을 클릭하여 토픽을 생성합니다.

   ![](/assets/img/dataplatform/2023/alarm-dbcs/topic-2.png " ")
3. "구독 생성" 버튼을 클릭하여 구독을 생성합니다.
   + 구독 유형 선택 : 전자메일 (EMAIL)
   + 이메일 주소 입력
   + "생성" 버튼을 클릭하여 구독을 생성합니다.

   ![](/assets/img/dataplatform/2023/alarm-dbcs/topic-3.png " ")
4. 구독을 생성할 때 입력한 전자메일 주소로 구독을 Confirm 하기 위한 이메일이 발송됩니다. 수신된 이메일에서 Confirm subscription 버튼을 클릭하여 구독을 활성화 합니다.
   ![](/assets/img/dataplatform/2023/alarm-dbcs/topic-4.png " ")
   ![](/assets/img/dataplatform/2023/alarm-dbcs/topic-5.png " ")
   ![](/assets/img/dataplatform/2023/alarm-dbcs/topic-6.png " ")
5. 구독 생성 및 활성화가 완료되었습니다.
   ![](/assets/img/dataplatform/2023/alarm-dbcs/topic-7.png " ")

## 2. Events Services 에서 Rule 생성하기

1. 전체 메뉴에서 "관찰 가능성 및 관리()" -> "이벤트 서비스(Events Service)" -> "규칙(Rules)" 메뉴를 클릭하여 화면으로 이동합니다.
   ![](/assets/img/dataplatform/2023/alarm-dbcs/event-1.png " ")
2. "규칙 생성" 버튼을 클릭합니다.
   ![](/assets/img/dataplatform/2023/alarm-dbcs/event-2.png " ")
3. 아래와 같이 입력합니다.
   + 이름 입력 예시 : BackupNotifyRule
   + 설명을 입력합니다.
   + 규칙 조건에서 조건을 "이벤트 유형(Event Type)" 으로 선택하고 서비스 이름(Service Name)을 "Database"로 선택한 다음 "이벤트 유형(Event Type)"을 "Database - Automatic Backup End"로 선택합니다.
   + "다른 조건" 버튼을 클릭하여 조건을 추가 후 조건을 "속성(Attribute)", 속성 이름(Attribute Name)을 "lifecycleState" 로 선택한 다음 속성값(Attribute Value)을 "FAILED" 로 입력합니다.

   > NOTE: 값이 "FAILED"인 특성 "lifecycleState"를 사용하여 이벤트를 트리거하는 조건으로 필터링 할 경우 DBCS 백업이 실패한 이벤트에 대해서만 알림을 받습니다. 만약 모든 자동 백업 완료 이벤트에 대한 알림을 받으려면 이 필터를 생략할 수 있습니다. 기본적으로 이 규칙은 규칙이 작성되는 구획(또는 하위)의 모든 db 시스템에 적용 되며, db system ocid 또는 database ocid 또는 db_unique_name 등을 기준으로 규칙을 필터링해서 특정 DBCS에 대한 알림을 구성할수 있습니다.
   
   ![](/assets/img/dataplatform/2023/alarm-dbcs/event-3.png " ")
   
   + 위 규칙 조건을 모두 동일하게 선택할 경우 아래와 같이 규칙 로직(Rule Logic)을 확인할 수 있습니다.

   ```txt
   MATCH event WHERE (
      eventType EQUALS ANY OF (
            com.oraclecloud.databaseservice.automaticbackupdatabase.end
         )
      AND (
         lifecycleState MATCHES ANY OF (
            FAILED
         )
      )
   )
   ```

4. 작업 섹션에서 "작업 유형(Action Type)" 을 "통지(Notifications)"로 선택하고, 구획(compartment)을 선택해서 앞단계 에서 생성한 토픽을 선택합니다.
   ![](/assets/img/dataplatform/2023/alarm-dbcs/event-4.png " ")
5. "규칙 생성" 버튼을 클릭하여 규칙을 생성 합니다.
6. 만약 자동 백업이 실패할 경우 아래와 샘플과 같은 이메일을 수신하게 됩니다.
```txt
Subject: OCI Event Notification :com.oraclecloud.databaseservice.automaticbackupdatabase.end
From: noreply@notification.<region>.oraclecloud.com
Date: 5/3/2020, 1:34 PM
To: <email-address>
{
   "eventType" : "com.oraclecloud.databaseservice.automaticbackupdatabase.end",
   "cloudEventsVersion" : "0.1",
   "eventTypeVersion" : "2.0",
   "source" : "DatabaseService",
   "eventTime" : "2020-05-03T08:04:17.102Z",
   "contentType" : "application/json",
   "data" : {
      "compartmentId" : "ocid1.compartment.oc1..XXXX",
      "compartmentName" : "XXXX",
      "resourceName" : "Automatic Backup",
      "resourceId" : "ocid1.dbbackup.oc1.region.XXXX",
      "availabilityDomain" : "urcn:XXXX-AD-1",
      "additionalDetails" : {
         "timeCreated" : "2020-05-03T08:02:19Z",
         "timeUpdated" : "2020-05-03T08:04:17Z",
         "lifecycleState" : "FAILED",
         "lifecycleDetails" : "The backup failed because the database is not in archivelog mode. See https://docs.cloud.oracle.com/Content/Database/Troubleshooting/Backup/backupfail.htm for information about troubleshooting.",
         "dbSystemId" : "ocid1.dbsystem.oc1.region.XXXX",
         "dbHomeId" : "ocid1.dbhome.oc1.region.XXXX",
         "dbUniqueName" : "ORA19_XXXX",
         "dbVersion" : "19.6.0.0.0",
         "databaseEdition" : "ENTERPRISE_EDITION",
         "autoBackupsEnabled" : "true",
         "recoveryWindow" : "7",
         "backupType" : "Incremental",
         "databaseId" : "ocid1.database.oc1.region.XXXX"
      },
      "definedTags" : {
         "Oracle-Tags" : {
            "CreatedBy" : "XXXX",
            "CreatedOn" : "2020-05-01T10:24:13.253Z"
         }
      }
   },
   "eventID" : "5992010b-3355-4c70-b480-554420eb8828",
   "extensions" : {
      "compartmentId" : "ocid1.compartment.oc1..XXXX"
      }
   }
```


---