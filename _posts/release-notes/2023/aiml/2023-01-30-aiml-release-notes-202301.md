---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "1월 OCI AI/ML 업데이트 소식"
teaser: "2023년 1월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-aiml
tags:
  - oci-release-notes-2023
  - Jan-2023
  - AI/ML
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

## Data Labeling now Supports Key Value Labeling
* **Services:** Data Labeling
* **Release Date:** Jan 18, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/6e9bb2a6-0634-460f-9305-74aad923f004/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/6e9bb2a6-0634-460f-9305-74aad923f004/){:target="_blank" rel="noopener"}

### 업데이트 소개
이번 업데이트를 통해 데이터 라벨링 서비스에서 문서에 대한 Key Value Labeling 기능을 지원하게 되었습니다.
이 기능을 통해 사용자는 문서 이미지에 포함된 텍스트에서 지정한 라벨에 대한 값을 라벨링 할 수 있습니다

### 기능 소개
1. 데이터셋 생성 시 데이터 집합 형식을 "Document Labeling" , 주석 클래스를 "Key Value" 로 각각 선택합니다.
   ![](/assets/img/aiml/2023/oci-releasenote-202301-1.png)
2. 데이터셋에서 분류하고자 하는 Key를 Label로 지정합니다.
   ![](/assets/img/aiml/2023/oci-releasenote-202301-2.png)
3. 지정한 옵션 및 입력 정보를 확인합니다.
   ![](/assets/img/aiml/2023/oci-releasenote-202301-3.png)
4. 생성된 데이터셋의 레코드를 클릭하여 라벨링 합니다.
   ![](/assets/img/aiml/2023/oci-releasenote-202301-4.png)
5. 문서 이미지의 텍스트가 추출되어 각 텍스트를 선택할 수 있으며, 선택한 텍스트를 우측 Labels의 Label을 클릭하여 분류할 수 있습니다. 분류 결과는 좌측 Summary에서 확인할 수 있습니다.
   ![](/assets/img/aiml/2023/oci-releasenote-202301-5.png)


## Introducing Model Versioning in Model Catalogs
* **Services:** Data Science
* **Release Date:** Jan 17, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/26d2542d-58c8-4bac-ad72-bcf5abfe6cb8/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/26d2542d-58c8-4bac-ad72-bcf5abfe6cb8/){:target="_blank" rel="noopener"}

### 업데이트 소개
이번 업데이트를 통해 데이터 과학 프로젝트에서 모델 카탈로그에 대한 버전 집합 기능이 추가되었습니다.
모델 버전 관리를 통해 사용자는 훈련한 여러 모델과 검증 데이터 세트에서 모델의 성능을 향상시키기 위한 다양한 시도를 버전별로 기록할 수 있고, 모델 버전 관리를 통해 이러한 모델을 유연하게 추적할 수 있습니다.

### 기능 소개
1. 먼저 데이터 과학 프로젝트에서 "모델 버전 집합 생성" 버튼을 클릭하여 모델 버전 집합을 생성합니다.
   ![](/assets/img/aiml/2023/oci-releasenote-202301-6-1.png)
2. 모델 버전 집합의 이름을 입하고 "생성" 버튼을 클릭합니다. **모델 버전 집합의 이름은 구획 내에서 고유해야 합니다.**
   ![](/assets/img/aiml/2023/oci-releasenote-202301-6.png)
3. 모델 생성 시 사전에 생성한 모델 버전 집합을 선택하고, 버전을 식별할 수 있는 라벨을 입력 합니다.
   ![](/assets/img/aiml/2023/oci-releasenote-202301-7.png)
   ![](/assets/img/aiml/2023/oci-releasenote-202301-8.png)
4. 같은 버전 집합에 생성된 모델의 버전을 비교할 수 있습니다.
   ![](/assets/img/aiml/2023/oci-releasenote-202301-10.png)
   ![](/assets/img/aiml/2023/oci-releasenote-202301-11.png)

## Personal Identifiable Information detection is introduced
* **Services:** Language
* **Release Date:** Jan 31, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/f99af3d9-1cd9-4100-a88e-b88b05749d03/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/f99af3d9-1cd9-4100-a88e-b88b05749d03/){:target="_blank" rel="noopener"}

### 업데이트 소개
OCI의 AI 서비스 중 하나인 Language 서비스에서 개인 식별 가능정보를 탐지할 수 있는 기능이 업데이트 되었습니다.
이 기능을 통해 사용자는 분석을 요청한 텍스트에 개인 식별 정보(PII)가 포함 여부에 대한 결과를 확인할 수 있습니다.

OCI Language 의 PII 탐지 기능에서 식별 가능한 항목은 아래와 같습니다.
* Person name
* Address
* Age
* Date or time
* Social security number or taxpayer ID (US)
* Email
* Passport number (US)
* Telephone or fax (US)
* Driver identification number (US)
* Bank account number (US)
* Bank routing number
* Bank account (SWIFT)
* Credit or debit card number
* IP address
* MAC address
* Secret types
  - COOKIE
  - XSRF_TOKEN
  - AUTH_BASIC
  - AUTH_BEARER
  - JSON_WEB_TOKEN
  - PRIVATE_KEY
  - PUBLIC_KEY
* OCI account details
  - OCI_OCID_USER
  - OCI_OCID_TENANCY
  - OCI_SMTP_USERNAME
  - OCI_OCID_REFERENCE
  - OCI_FINGERPRINT
  - OCI_CREDENTIAL
  - OCI_PRE_AUTH_REQUEST
  - OCI_STORAGE_SIGNED_URL
  - OCI_CUSTOMER_SECRET_KEY
  - OCI_ACCESS_KEY

### 기능 소개
- 개인정보가 포함된 텍스트를 OCI 콘솔에 입력하고 분석 합니다.
  ![](/assets/img/aiml/2023/oci-releasenote-202301-12.png)
- 분석 결과에서 개인정보 탐지가 되었는지 확인합니다. 개인 식별 정보(PII)로 탐지된 결과는 마스킹되어 반환됩니다.
  ![](/assets/img/aiml/2023/oci-releasenote-202301-13.png)