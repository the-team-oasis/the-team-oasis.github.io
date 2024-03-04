---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "7월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 7월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - July-2023
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

## Support for tagging Container Registry-related resources
* **Services:** Registry
* **Release Date:** July 7, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/Registry/Tasks/registrytaggingresourceswithfreeformdefinedtags.htm](https://docs.oracle.com/en-us/iaas/Content/Registry/Tasks/registrytaggingresourceswithfreeformdefinedtags.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 컨테이너 레지스트리 (OCIR) 저장소, 이미지, 이미지 서명(Signature)에 태깅 기능을 지원합니다. 태깅을 사용하면 다음과 같은 이점을 얻을 수 있습니다.

* Resource tracking: 컨테이너 레지스트리의 리소스(저장소, 이미지, 이미지 서명)들을 추척할 수 있습니다.
* Cost tracking: 컨테이너 레지스트리에 대해 태깅을 통한 적절한 비용 현황을 확인할 수 있습니다.
* Authorization grouping: 특정 태그가 있는 저장소, 이미지, 이미지 서명에 대한 액세스 권한을 부여하거나 제한할 수 있습니다.

### 태그 적용 방법
#### 저장소에 태그 적용
저장소에 다음과 같이 태그를 지정할 수 있습니다. 기본적으로 태그 네임스페이스, 테그 키, 테그 값을 지정합니다.
![](/assets/img/cloudnative-security/2023/2023-07-28-cloudnative-security-release-notes-1.png)

#### 이미지에 태그 적용
저장소에 다음과 같이 태그를 지정할 수 있습니다. 기본적으로 태그 네임스페이스, 테그 키, 테그 값을 지정합니다.
![](/assets/img/cloudnative-security/2023/2023-07-28-cloudnative-security-release-notes-2.png)

### 액세스 권한 설정 예시

```
allow any-user to read repos in compartment HR where target.resource.tag.mynamespace.dept= 'Sales'
```

```
allow any-user to manage repos in compartment HR where target.resource.tag.mynamespace.dept= 'Marketing'
```

---

## Support for the use of workload identity to access resources in different tenancies and compartments
* **Services:** Container Engine for Kubernetes
* **Release Date:** July 12, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contenggrantingworkloadaccesstoresources.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contenggrantingworkloadaccesstoresources.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
Workload Identity는 OKE Pod내에서 OCI 자원에 쉽게 연동할 수 있는 기능으로 Enhanced Cluster에서 사용할 수 있는 옵션입니다. 현재 Workload Identity를 지원하는 SDK는 다음과 같습니다.
* Go SDK v65.32.0(이상)
* Java SDK v2.54.0(이상)
* Python SDK v2.111.0(이상)

이번에 발표된 내용은 Workload Identity에 대한 IAM 정책을 정의할 때 Workload Identity를 사용하여 다른 테넌시 또는 구획에 있는 OCI 리소스(예: Object Storage Bucket)에 대한 액세스 권한을 부여할 수 있습니다.