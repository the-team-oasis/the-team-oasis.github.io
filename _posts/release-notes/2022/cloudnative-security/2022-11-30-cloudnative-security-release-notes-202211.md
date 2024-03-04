---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2022"
title: "11월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2022년 11월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2022-cloudnative-security
tags:
  - oci-release-notes-2022
  - nov-2022
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

## New Vulnerability Scanning Agent
* **Services:** Vulnerability Scanning
* **Release Date:** Nov. 2, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/scanning/using/managing-host-recipes.htm#create-host-recipe-qualys-agent](https://docs.oracle.com/en-us/iaas/scanning/using/managing-host-recipes.htm#create-host-recipe-qualys-agent){:target="_blank" rel="noopener"} 

### 기능 소개
이제 Vulnerability Scanning을 위해 Qualys를 연결할 수 있습니다. Qualys는 보안 위험 및 취약성 관리를 위한 솔루션으로 OCI에 Qualys 에이전트를 구성하여 Compute에 대한 Vulnerability Scanning을 수행할 수 있으며, 수행된 결과를 OCI Console 혹은 Qualys 대시보드에서 볼 수 있습니다.

![]({{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-11-0.png)

> Qualys를 사용하기 위해서는 사전에 Qualys 라이센스가 필요합니다.

### Qualys 스캔시 주의 사항
* Qualys는 4시간마다 OCI 호스트를 스캔합니다. OCI 호스트 스캔은 Qualys 라이센스 사용량에 포함됩니다. 라이센스 또는 사용과 관련된 문제는 오라클이 관여하지 않으며, Qualys에 문의하여야 합니다.
* Qualys 포털에서의 스캔 결과 확인은 스캔 대상을 생성한 후 약 4시간 후에 확인할 수 있습니다.
* OCI Console에서의 Qualys 스캔 결과 확인은 스캔 대상을 생성한 후 약 12시간 이내에 확인할 수 있습니다.

**Qualys 스캔 레시피 생성 화면**
![]({{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-11-1.png)

**Qualys 스캔 결과 화면**
![]({{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-11-2.png)

---

## Roll back to a previous apply job
* **Services:** Resource Manager
* **Release Date:** Nov. 8, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ResourceManager/Concepts/resourcemanager.htm#features__rollback](https://docs.oracle.com/en-us/iaas/Content/ResourceManager/Concepts/resourcemanager.htm#features__rollback){:target="_blank" rel="noopener"} 

### 기능 소개
스택 잡 실행 이전 상태로 롤백하는 기능입니다. 만일 잡을 실행하는 과정에서 실패를 하면 실패하기 전까지 생성된 리소스는 남게 됩니다. 일반적으로 Destroy를 하면 해당 잡을 통해 생성된 모든 과거 리소스까지 모두 삭제되므로, 이 경우에는 바로 전 단계의 상태로 롤백이 필요합니다. 이 경우 Rollback 기능은 좋은 대안이 될 수 있습니다.

**Rollback 메뉴**
![]({{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-11-3.png)