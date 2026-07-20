---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "5월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2026년 5월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2026-mds
tags:
  - oci-release-notes-2026
  - May-2026
  - MDS
  - MySQL HeatWave
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

---

## HeatWave: DB System Cloning

* **Services:** MySQL HeatWave
* **Release Date:** May 21, 2026
* **Documentation:** [HeatWave: DB System Cloning](https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-clone-db-system.htm){:target="_blank" rel="noopener"}
* **Related Guides:** [Viewing DB System Details](https://docs.oracle.com/en-us/iaas/mysql-database/doc/viewing-db-system-details.html){:target="_blank" rel="noopener"}, [Advanced Options](https://docs.oracle.com/en-us/iaas/mysql-database/doc/advanced-options.html){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave에서 기존 Standalone 또는 High Availability DB System을 복제해 같은 테넌시 안에 새로운 DB System을 만들 수 있게 되었습니다. Clone은 소스 DB System과 같은 리전에 만들 수도 있고 다른 리전에 만들 수도 있습니다.

### 주요 기능

* Standalone DB System과 High Availability DB System을 Clone Source로 사용할 수 있습니다.
* 같은 테넌시 내에서 신규 DB System을 생성합니다.
* 동일 리전 또는 다른 리전으로 Clone을 생성할 수 있어 테스트, 개발, DR 검증, 리전 간 복제 준비에 활용할 수 있습니다.
* 소스 운영 DB System을 직접 변경하지 않고 유사한 환경을 빠르게 만들 수 있습니다.

### 활용 예시

운영 데이터와 유사한 검증 환경을 빠르게 만들거나, 애플리케이션 릴리즈 테스트, 성능 테스트, 리전 이전 사전 검증을 수행할 때 유용합니다. High Availability DB System도 Clone할 수 있으므로 운영 표준 구성을 그대로 재현하는 데 도움이 됩니다.
