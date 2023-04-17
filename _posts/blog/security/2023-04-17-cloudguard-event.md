---
layout: page-fullwidth
#
# Content
#
subheadline: "Security"
title: "OCI Cloud Guard를 위한 Event 및 Notifications 구성하기"
teaser: "OCI Cloud Guard를 위한 Event, Notification 구성에 대해서 알아봅니다."
author: dankim
breadcrumb: true
categories:
  - security
tags:
  - [oci, security, cloudguard, event, notifications]
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

### Cloud Guard Event Notification
Cloud Guard를 사용할 때 Cloud Guard에서 감지한 여러가지 이벤트에 대한 알림을 받을 수 있습니다. 알림을 받기 위해서는 OCI Event 서비스와 Notification 서비스를 활용하여 구성하여야 합니다.

#### Cloud Guard Notification Topic 구성
먼저 Notification 설정을 위해서 Notification Topic을 생성합니다. Notification Topic 생성을 위해서 ***메뉴 > 개발자 서비스(Developer Services) > 애플리케이션 통합(Application Integration) > 통지(Notification)*** 로 이동합니다.
![](/assets/img/cloudnative-security/2023/oci-cloudguard-7-1.png)

토픽 생성 (Create Topic) 버튼을 클릭한 후 다음과 같이 Topic을 생성합니다.
* **Name:** TopicForCloudGuardEvent
![](/assets/img/cloudnative-security/2023/oci-cloudguard-7-2.png)

구독(Subscription) 채널은 Email, Functions, HTTPS, PagerDuty, Slack, SMS를 제공하는데, 여기서는 Email로 구독을 설정하겠습니다. 구독 생성(Create Subscription) 버튼을 클릭한 후 다음과 같이 입력하고 생성합니다.

* **Protocol:** Email
* **Email:** 수신받을 이메일 주소

![](/assets/img/cloudnative-security/2023/oci-cloudguard-7-3.png)

이메일 구독을 할 경우에는 이메일 확인이 필요합니다. 구독한 이메일로 수신한 메일에서 **Confirm subscription**을 클릭합니다.
![](/assets/img/cloudnative-security/2023/oci-cloudguard-7-4.png)

#### Cloud Guard Event Rule 구성
Event 설정을 위해서 ***메뉴 > 관찰 가능성 및 관리(Observability & Management) > 이벤트 서비스(Event Service) > 규칙(Rule)** 으로 이동합니다.
![](/assets/img/cloudnative-security/2023/oci-cloudguard-7-5.png)

규칙 생성 버튼을 클릭한 후 다음과 같이 입력하고 생성합니다.
* **Display Name:** CloudGuardEvent
* **Rule Condition:** 
  * **Condition:** Event Type
  * **Service Name:** Cloud Guard
  * **Event Type:** Detected - Problem, Detected - Sighting
    * Cloud Guard Event 유형은 다음의 총 7개의 유형을 제공합니다.
      * Cloud Guard - Announcements: Cloud Guard에 새로운 기능이 추가될 때 이벤트 발생
      * Cloud Guard - Status: Cloud Guard 서비스에 대한 활성화 상태가 변경될 때 이벤트 발생
      * Detected - Problem: Cloud Guard가 Problem을 감지할 때 이벤트 발생
      * Detected - Sighting: Threat Detector에 의해서 Problem으로 판단되는 경우 이벤트 발생
      * Dismissed - Problem: 사용자가 Problem을 Dismiss할때 이벤트 발생
      * Problem Threshold Reached: VCN이나 Identity 서비스에서 과도한 Audit 신호가 감지되어 특정 임계치를 넘을경우 이벤트 발생
      * Remediated - Problem: Problem에 대한 Remediation이 발생한 경우
  * **Actions:**
    * **Action Type:** Notifications
    * **Notifications Compartment:** Topic을 생성한 구획
    * **Topic:** TopicForCloudGuardEvent

![](/assets/img/cloudnative-security/2023/oci-cloudguard-7-6.png)









### Cloud Guard Event Notification 수신 예시
Cloud Guard Event는 기본적으로 다음과 같이 JSON 형식으로 전달됩니다.

```
{
 "eventType" : "com.oraclecloud.cloudguard.problemdetected",
 "cloudEventsVersion" : "0.1",
 "eventTypeVersion" : "2.0",
 "source" : "CloudGuardResponderEngine",
 "eventTime" : "2021-03-18T05:25:00Z",
 "contentType" : "application/json",
 "data" : {
   "compartmentId" : "ocid1.compartment.oc1..aaaaaaaawnovj5ia4ckegzxexju545cnesp4pvejocwvgiyx4p3i2qss63xa",
   "compartmentName" : "cloudguard",
   "resourceName" : "Bucket is public",
   "resourceId" : "ocid1.cloudguardproblem.oc1.ap-seoul-1.amaaaaaax5ndt7cqvs3cymw7c55aobwmfenmpkwa2kmxxepozx4w64zus2aq",
   "additionalDetails" : {
     "tenantId" : "ocid1.tenancy.oc1..aaaaaaaazzz5iodmzyzlg7qm2cjyrp6sbhxiuw2qtc3qtlyml7e2swcgil2q",
     "riskLevel" : "CRITICAL",
     "status" : "OPEN",
     "problemType" : "CONFIG_CHANGE",
     "resourceName" : "cloudguard-bucket",
     "resourceId" : "cnb99kfoaq4b/cloudguard-bucket",
     "resourceType" : "Bucket",
     "targetId" : "ocid1.cloudguardtarget.oc1.ap-seoul-1.amaaaaaax5ndt7aako7xu4yefvdzm2oyrbru3qqufqln3rd6uwc6jwtqtb4q",
     "labels" : "CIS 3.0, ObjectStorage",
     "firstDetected" : "2021-03-18T05:24:14.108Z",
     "lastDetected" : "2021-03-18T05:24:14.108Z",
     "region" : "ap-seoul-1",
     "problemDescription" : "Object Storage supports anonymous, unauthenticated access to a bucket. A public bucket that has read access enabled for anonymous users allows anyone to obtain object metadata, download bucket objects, and optionally list bucket contents.",
     "problemRecommendation" : "Ensure that the bucket is sanctioned for public access, and if not, direct the OCI administrator to restrict the bucket policy to allow only specific users access to the resources required to accomplish their job functions."
   }
 },
 "eventID" : "43a3f0f3-f9e6-4c9c-98ef-abcf80c6d1d4",
 "extensions" : {
   "compartmentId" : "ocid1.compartment.oc1..aaaaaaaawnovj5ia4ckegzxexju545cnesp4pvejocwvgiyx4p3i2qss63xa"
 }
}
```

### 참고 
* https://docs.oracle.com/en-us/iaas/cloud-guard/using/export-notifs-config.htm
