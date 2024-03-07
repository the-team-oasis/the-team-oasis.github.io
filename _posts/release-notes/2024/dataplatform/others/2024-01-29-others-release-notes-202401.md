---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "1월 OCI Database Service - Others 업데이트 소식"
teaser: "2024년 1월 OCI Database Service - Others 업데이트 소식입니다."
author: kisukim
breadcrumb: true
categories:
  - release-notes-2024-others
tags:
  - oci-release-notes-2024
  - Jan-2024
  - Others
  - Redis
  - OCI Cache with Redis
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


## OCI Database with PostgreSQL adds support for uuid-ossp extension
* **Services**:OCI Database with PostgreSQL
* **Release Date**: Jan. 16, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/d9371373-a78f-49bc-b77d-12de5be5c8ea/](https://docs.oracle.com/iaas/releasenotes/changes/d9371373-a78f-49bc-b77d-12de5be5c8ea/){:target="_blank" rel="noopener"}

### 업데이트 내용
PostgreSQL에서 범용 고유 식별자(UUID) 지원합니다. 이 식별자는 동일한 알고리즘을 사용하여 알려진 세계에 다른 사람이 동일한 식별자를 생성 가능성이 없으며, 선택된 알고리즘에 생성된 128비트 값입니다. 
uuid-ossp 모듈은 기본적으로 활성화 되어 있지 않기 때문에 UUID 사용하기 위해서는 모듈을 설치하여 사용 해야합니다.

![](/images/infrastructure/SCR-20240307-ngok.png " ")


