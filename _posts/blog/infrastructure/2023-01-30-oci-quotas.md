---
layout: page-fullwidth
#
# Content
#
subheadline: "Governance"
title: "OCI에서 리소스 할당량 관리하기"
teaser: "OCI에서 특정 리소스에 대한 할당량을 관리하는 방법에 대해서 알아봅니다."
author: dankim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, quota]
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

### 소개
OCI에서는 특정 구획내의 리소스 사용을 제한할 수 있는 구획 할당량 (Compartment Quotas) 기능을 제공하고 있습니다. 구획 할당량은 서비스 제한(Limit)기능과 유사하지만, 서비스 제한(Service Limit)은 오라클에서, 그획 할당량은 사용자(관리자)가 관리한다는 차이가 있습니다. 구획 할당량 기능은 일반적으로 구획 별 리소스 사용량을 관리하기 위한 용도로 사용될 수 있지만, 사용자의 실수나 허용되지 않은 불법적인 인증을 통한 접근을 통해 고 비용의 리소스가 생성되는 것을 방지하는 효과도 가져올 수 있습니다.

구획 할당량은 OCI 정책 설정과 유사하게 설정할 수 있는데, 다음과 같은 세 가지 유형의 특수한 할당량 정책 구문을 사용합니다. 

* set: 구획에 사용할 수 있는 클라우드 리소스의 최대 개수를 설정합니다.
* unset: 할당량을 기본 서비스 제한으로 재설정합니다.
* zero: 구획에 대한 클라우드 리소스에 대한 액세스를 제거합니다.

### 할당량 적용 가능 서비스
할댱량 적용 가능 서비스와 각 서비스 별 할당량 적용 예시는 아래 링크를 참고합니다.

[https://docs.oracle.com/en-us/iaas/Content/Quotas/Concepts/resourcequotas_topic-Available_Quotas_by_Service.htm#AvailableQuotasByService](https://docs.oracle.com/en-us/iaas/Content/Quotas/Concepts/resourcequotas_topic-Available_Quotas_by_Service.htm#AvailableQuotasByService)

* Analytics Cloud
* Big Data
* Block Volume Quotas
* Blockchain Platform Quotas
* Cloud Guard Quotas
* Compute Quotas
* Container Instances Quotas
* Content Management Quotas
* Data Catalog Quotas
* Data Integration Quotas
* Data Labeling Quotas
* Data Science Quotas
* Data Transfer Quotas
* Database Quotas
* Database Migration Quotas
* DevOps Quotas
* Digital Assistant Quotas
* DNS Quotas
* Events Quotas
* Email Delivery Quotas
* File Storage Quotas
* GoldenGate Quotas
* Health Checks Quotas
* Integration Quotas
* Java Management Quotas
* Load Balancing Quotas
* Management Agent Quotas
* Media Flow Quotas
* Networking Quotas
* NoSQL Database Cloud Quotas
* Notifications Quotas
* Object Storage Quotas
* Process Automation Quotas
* Resource Manager Quotas
* Service Connector Hub Quotas
* Streaming Quotas
* Vault Quotas
* Vulnerability Scanning Quotas
* WAF Quotas

### 할당량 적용 방법
할당량 정책 적용을 위해 OCI Console 메뉴에서 거버넌스 & 관리(Governance & Administration) > 테넌시 관리(Tenancy Management) > 할당량 정책(Quota Policies)로 이동합니다.

![](/assets/img/infrastructure/2023/oci-quotas-1.png)

다음 화면과 같이 할당량 생성(Create Quota) 버튼을 클릭한 후 이름과 설명, 할당량 정책 구문을 입력하여 정책을 생성합니다.

![](/assets/img/infrastructure/2023/oci-quotas-2.png)

### 할당량 구문 예시
다음은 몇 가지 구문 예시입니다.

* **아웃바운드 이메일 또는 알림 사용 금지 :**
```
Zero email-delivery quotas in compartment MyCompartment
Zero notifications quotas in compartment MyCompartment
```

* **전체 테넌시에서 Exadata 인스턴스를 1개로 제한 :**
```
set database quota /*exadata*/ to 1 in tenancy
```

* **productionApp 구획을 제외한 모든 구획에서 VM.Standard2 및 BM.Standard2 코어를 10 개로 제한 :**
```
set compute-core quota standard2-core-count to 10 in tenancy
unset compute-core quota standard2-core-count in compartment productionApp
```

* **미국 Phoenix 지역의 MyCompartment 구획내에서 VM.Standard.E4 및 BM.Standard.E4 할당량을 각 AD별로 240개 OCPU(코어)로 제한 :**
```
set compute-core quota standard-e4-core-count to 240 in compartment MyCompartment where request.region = us-phoenix-1
```

* **전체 테넌시에서 VM.Standard2 및 BM.Standard2의 OCPU를 240개로 제한 :**
```
set compute-core quota standard2-core-count to 240 in tenancy
```

* **ItCompartment 구획에서 VM.Standard2 및 BM.Standard2의 OCPU를 20개로 제한 :**
```
set compute-core quota standard2-core-count to 20 in compartment ItCompartment
```

* **미국 Phoenix 지역의 MyCompartment 구획에서 VM.Standard2 및 BM.Standard2의 OCPU를 20개로 제한 :**
```
set compute-core quota standard2-core-count to 20 in compartment MyCompartment where request.region = us-phoenix-1
```

* **미국 Phoenix지역의 AD1, MyCompartment 구획에서 VM.Standard2 및 BM.Standard2의 OCPU를 20개로 제한 :**
```
set compute-core quota standard2-core-count to 20 in compartment MyCompartment where request.ad=abcd:US-PHOENIX-1-AD-1
```
* **전체 테넌시에서 모든 Compute 리소스 할당량을 0, Database 리소스 할당량을 0로 제한 :**
```
set compute-core quota to 0 in tenancy
Set database quota to 0 in compartment quotassdktest
```

* **전체 테넌시에서 모든 Compute 리소스 생성을 완전히 제한하지만, VM.Standard2 및 BM.Standard2에 대해서는 허용 :**
```
zero compute-core quotas in tenancy
unset compute-core quota standard2-core-count in tenancy
```

* **전체 테넌시에서 모든 DenseIO 리소스 생성을 완전히 제한하지만, 미국 Phoenix 지역에 대해서는 OCPU 48개 까지 허용 :**
```
zero compute-core quotas /*dense-io*/ in tenancy
set compute-core quota /*dense-io*/ to 48 in tenancy where request.region = us-phoenix-1
```

* **전체 테넌시에서 모든 Compute 리소스 생성을 완전히 제한하지만, VM.Standard.E4 and BM.Standard.E4에 대해서는 허용 :**
```
zero compute-core quotas in tenancy
unset compute-core quota standard-e4-core-count in tenancy
```
