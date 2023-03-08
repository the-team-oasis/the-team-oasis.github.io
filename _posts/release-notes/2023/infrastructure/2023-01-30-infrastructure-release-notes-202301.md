---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "1월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 1월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - Jan-2023
  - Infrastructure
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

## File Storage Support for Cross-Region Replication
* **Services:** File Storage
* **Release Date:** Jan. 13, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/58de3dca-232a-41b9-b40c-23d0d8f6ffd3/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/58de3dca-232a-41b9-b40c-23d0d8f6ffd3/){:target="_blank" rel="noopener"}

### 서비스 소개
파일 스토리지 지역 간 복제는 지역 중단으로부터 보호하고 재해 복구 작업을 지원하여, 재해복구를 지원합니다. 

한국,일본 기준 사용 가능한 리전
- South Korea Central (Seoul) -> South Korea North (Chuncheon)
- South Korea North (Chuncheon)	-> South Korea Central (Seoul)
- Japan Central (Osaka)	-> Japan East (Tokyo)
- Japan East (Tokyo) -> Japan Central (Osaka) , Singapore (Singapore)

사용하기 위한 Policy
```terminal
    Allow group Managers to manage replications in tenancy
    Allow group Managers to manage file-systems in tenancy
```

제한 및 고려사항



![](/assets/img/infrastructure/2023/release-note/SCR-20230303-bdd.png){:width="100%":align="center"}

![](/assets/img/infrastructure/2023/release-note/SCR-20230303-bgj.png){:width="100%":align="center"}

![](/assets/img/infrastructure/2023/release-note/SCR-20230303-bqb.png){:width="100%":align="center"}




## Instance accessibility status metric for compute VM instances
* **Services:** Compute,Monitoring
* **Release Date:** Jan. 23, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/67329da4-c93d-4848-b231-1834438dae85/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/67329da4-c93d-4848-b231-1834438dae85/){:target="_blank" rel="noopener"}

### 서비스 소개
compute의 인스턴스 상태지표는 컴퓨터의 인스턴스 상태 및 엑세스 가능을 모니터링하는데 도움을 줍니다. 아래 인스턴스 접근성 상태의 "instance_accessibility_status"을 사용하며 vm 인스턴스가 응답 하지 않는지 여부를 모니터링 할 수 있습니다. 

![](/assets/img/infrastructure/2023/release-note/SCR-20230303-bu3.png){:width="100%":align="center"}

