---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "8월 OCI Database Service - Others 업데이트 소식"
teaser: "2025년 8월 OCI Database Service - Others 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2025-others
tags:
  - oci-release-notes-2025
  - Aug-2025
  - Others
  - Redis
  - OCI Cache with Redis
  - PostgreSQL
  - OCI Database with PostgreSQL
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


## Multishape configurations for OCI Database with PostgreSQL
* **Services:** OCI Database with PostgreSQL
* **Release Date:** August 13, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/postgresql/increased-shape-compatibility-configs.htm](https://docs.oracle.com/en-us/iaas/releasenotes/postgresql/increased-shape-compatibility-configs.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Database with PostgreSQL에서 하나의 데이터베이스 구성(configuration) 이 여러 하드웨어 shape 에서 동작하도록 지원하는 기능이 추가되었습니다.
이제 동일한 구성 파일을 다양한 컴퓨트 옵션과 함께 사용할 수 있어, 운영 환경의 유연성과 효율성이 대폭 향상됩니다.

| **항목**         | **기존**       | **2025.08 이후 (신규 기능)** |
|----------------------|-------------|---------------------------------|
| **구성(Configuration)** | 특정 shape에 종속됨 – shape가 다르면 새로운 구성 생성 필요 | 하나의 구성으로 여러 shape 지원|
| **관리 방식** | shape 변경 시마다 별도 구성 관리 필요| 구성 재사용 가능 → 관리 단순화 |
| **DB 시스템 생성/수정 시 유연성** | 제한적 | 다양한 하드웨어 옵션과 조합 가능 |
| **운영 효율성** | 낮음 – 구성 중복 및 유지보수 부담 증가 | 높음 – 구성 표준화 및 재활용 용이 |

** 동일한 설정을 유지한 채로 다른 성능/비용 옵션을 가진 인스턴스 유형을 손쉽게 선택할 수 있습니다.
