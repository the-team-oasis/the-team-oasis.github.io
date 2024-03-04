---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "11월 OCI Database Service - Others 업데이트 소식"
teaser: "2023년 11월 OCI Database Service - Others 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-others
tags:
  - oci-release-notes-2023
  - Nov-2023
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

## OCI Database with PostgreSQL is now available

- **Services:** OCI Database with PostgreSQL is now available
- **Release Date:** Nov. 14, 2023
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/9a4b73b5-d4d6-4c89-bd31-b1fa2098fa34/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/9a4b73b5-d4d6-4c89-bd31-b1fa2098fa34/){:target="\_blank" rel="noopener"}

### 서비스 내용

OCI Database with PostegreSQL 서비스는 완전 관리형으로 제공되며 고가용성 (HA), 튜닝, Intelligent Sizing 기능을 탑재한 PostgreSQL 호환 서비스 입니다.

이 서비스는 데이터베이스 테이블이 생성되거나 삭제됨에 따라 스토리지를 자동으로 조정하므로 관리가 더 쉬워지고 스토리지 비용 지출이 최적화됩니다. OCI Postgresql을 통해 처리되는 데이터는 전송 중과 저장 중 모두 암호화되며, AD( availability domain ) 장애가 발생하는 경우에도 고가용성을 제공하도록 설계되었습니다.

### 제약사항

OCI Database with PostgreSQL 시스템의 제약사항입니다.

- 리전당 최대 8개의 데이터베이스 시스템 생성가능
- 리전당 최대 10개의 백업설정 생성가능
- 리전당 최대 20개의 설정구성 생성 가능

### Pricing

가격 정책은 PostgreSQL 서비스 비용으로 시간당 CPU 사용량, 월별 Storage 사용량으로 책정되며, 추가로 생성되는 Compute의 CPU, Memory, Storage 성능옵션 사용량으로 책정됩니다.

- PostgreSQL 서비스 비용 (OCPU / 시간당)
- PostgreSQL 스토리지 비용 (GB / 월별)
- Compute IaaS 비용 (OCPU, Memory / 시간당)
- 스토리지 성능옵션 비용 (GB / 월별)

#### 예시. OCI PostgreSQL 서비스 1달 사용 예시 (2 OCPU, 32 GB 구성, 스토리지 100GB)

- Database with PostgreSQL -> 2 OCPU \* **$0.098** \* 744 Hours = $145.82
- Database Optimized Storage -> 100 GB \* **$0.072** = $7.20
- Storage_Block Volume_Performance Units -> 12000 \* **$0.0017** = $20.40
- Compute OCPU -> 2 OCPU \* **$0.025** \* 744 Hours = $37.20
- Compute Memory -> 32 GB \* **$0.0015** \* 744 Hours = $35.71

총 $246.34

#### 서비스 소개 포스팅

자세한 내용은 서비스 소개 포스팅을 참고 해주세요
[OCI PostgreSQL Database System 서비스 살펴보기](/dataplatform/oci-postgresql-overview/){:target="\_blank" rel="noopener"}
