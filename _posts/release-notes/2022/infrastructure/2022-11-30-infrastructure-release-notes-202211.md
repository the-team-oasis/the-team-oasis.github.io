---
layout: page-fullwidth
#
# Content
#
subheadline: "Release Notes 2022"
title: "11월 OCI Infrastructure 업데이트 소식"
teaser: "2022년 11월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
- release-notes-2022-infrastructure
tags:
- oci-release-notes-2022
- Nov-2022
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

## Cloud Shell now uses Oracle JDK 11 by default
* **Services:** Cloud Shell
* **Release Date:** Nov. 16, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/558948ae-7d7b-4be4-9833-b42d26e90b74/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/558948ae-7d7b-4be4-9833-b42d26e90b74/){:target="_blank" rel="noopener"}

### 기능 소개
OCI ( Oracle Cloud Infrastructure ) Cloud Shell은 Oracle Cloud Console 에서 액세스할 수 있는 웹 브라우저 기반 터미널 입니다. Cloud Shell은 무료로 사용할 수 있으며(월 테넌시 한도 내에서) 사전 인증된 Oracle Cloud Infrastructure CLI, 사전 인증된 Ansible 설치 및 다음 Oracle Cloud Infrastructure 서비스 자습서 및 기타 유용한 도구와 함께 Linux 셸에 대한 액세스를 제공합니다. 실험실. Cloud Shell은 콘솔 에서 액세스할 수 있는 모든 OCI 사용자가 사용할 수 있는 기능 입니다. Cloud Shell은 Oracle Cloud Console 에 콘솔 의 영구 프레임으로 표시됩니다.

> Java JDK 11이 기본적으로 설치되어 있어 아래와 같이 변경하여 사용 할 수 있습니다.

```terminal
    #To see what versions of a runtime are currently supported in Cloud Shell, use the list option. For example:
    csruntimectl java list
    
    #You can use the set option to specify which version of the runtime Cloud Shell uses. For example, to set the Java runtime:
    csruntimectl java set oraclejdk-11
```

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2022/11/SCR-20230116-j96.png)
