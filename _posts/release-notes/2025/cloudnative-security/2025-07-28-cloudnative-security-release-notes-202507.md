---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "7월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 7월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - July-2025
  - cloudnative
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

## OCI Functions Console support for scheduled functions
* **Services:** Functions
* **Release Date:** July 28, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionsschedulingfunctions-about.htm](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionsschedulingfunctions-about.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
Scheduling Functions는 Function으ㄹ주기적으로 자동 실행하게 해주는 기능입니다. 이제 OCI Scheduled Functions 기능을 활용해서 특정 시간(예, 매주/매일/매시간)에 특정 작업과 같은 작업을 자동으로 수행할 수 있습니다.

### 활용 예시
* 유지보수 및 특정 리소스 관리를 위한 작업: DB Cleanup, Log Rotation, Data Archiving, 애플리케이션 만료 세션 정리 등 
* 주기적 데이터 처리 및 분석: 데일리 리포트 생성, 분석 데이터 업데이트, 센서 데이터 집계 등 
* 머신러닝 및 AI 관련 작업: 예측 및 추천 데이터 생성을 위한 주기적 모델 재학습, 예측 실행, 모델 성능 저하(Drift 현상) 모니터링 등

### 구성을 위한 사전 작업
**Resource Schedle 관련 Policy**
```
Allow group acme-functions-developers to manage resource-schedule-family in tenancy
```

**Dynamic Group**
```
ALL {resource.type='resourceschedule', resource.id='ocid1.resourceschedule.oc1.phx.amaaaaaa3______owq'}
```

**Function 관련 Policy**
```
Allow dynamic-group resource-scheduler-prod-dynamic-group to manage functions-family in tenancy
```

### 설정 화면
![](/assets/img/cloudnative-security/2025/2025-07-28-cloudnative-security-release-notes-1.png)

## API Gateway support for resource locking
* **Services:** API Gateway
* **Release Date:** July 30, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewaymanagingresourcelocks.htm](https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewaymanagingresourcelocks.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
API Gateway Resource Locking 기능은 API Gateway 및 관련 리소스가 변경되거나 삭제되는 것을 방지하기 위한 기능입니다.

#### Locking Resources
* API gateways
* APIs
* API deployments
* API Gateway certificates
* SDKs
* subscribers
* usage plans

#### Locking Types
다음 두 가지 Locking 유형을 지원합니다.
1. Delete lock
Resource 삭제(delete)만 방지하고, 읽기(read), 업데이트(update), 이동(move)은 허용합니다.
2. Full lock
Resource에 대한 업데이트(update), 이동(move), 삭제(delete) 모두 방지합니다. 읽기(read)만 허용합니다.

#### Locking 구성을 위한 Policy
```
Allow group acme-apigw-developers to RESOURCE_LOCK_ADD in compartment acme-apigw-compartment
```