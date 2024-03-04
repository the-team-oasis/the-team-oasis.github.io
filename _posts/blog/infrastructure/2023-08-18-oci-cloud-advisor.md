---
layout: page-fullwidth
#
# Content
#
subheadline: "Storage"
title: "OCI Cloud Advisor 소개"
teaser: "OCI 테넌시내의 모든 클라우드 리소스에 대한 비용 절감, 성능, 보안, 가용성을 최적화 하기 위한 권장 사항을 제공하는 Cloud Advisor에 대해서 알아봅니다."
author: dankim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, cloud advisor]
#published: false

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


### Cloud Advisor란?
Cloud Advisor는 OCI 테넌시내의 모든 리소스에 대한 분석하여, 비용을 절감할 수 있는 항목을 식별해 사용자에게 비용을 절감할 수 있도록 권장 사항으로 제공합니다. 또한 보안이나 가용성을 최적화 하기 위한 권장 사항도 식별하여 사용자에게 권장 사항으로 제공합니다.

Cloud Advisor는 다음과 같은 이점을 제공합니다.

* 비용 절감
* 성능 향상
* 보안 개선
* 가용성 개선

### Cloud Advisor에서 제공하는 권장 사항

* 사용되지 않은 리소스 삭제: 사용되지 않는 컴퓨팅 인스턴스, 블록 볼륨 및 스토리지 볼륨을 식별합니다. 이러한 리소스를 삭제하여 비용을 절약할 수 있습니다.
* 리소스 크기 조정: 과도하게 구성된 컴퓨팅 인스턴스와 블록 볼륨을 식별합니다. 이러한 리소스를 더 작은 크기로 조정하여 비용을 절약할 수 있습니다.
* 리소스 그룹화: 유사한 리소스를 그룹화하는 데 도움이 되는 권장 사항을 제공합니다. 이를 통해 리소스에 대한 정책을 적용하고 리소스를 보다 효율적으로 관리할 수 있습니다.
* 보안 취약점 해결: 테넌시의 보안 취약점을 식별하는 데 도움이 되는 권장 사항을 제공합니다. 이러한 취약점을 해결하면 보안을 개선하고 공격의 위험을 줄일 수 있습니다.
* 성능 최적화: 테넌시의 성능을 최적화하는 데 도움이 되는 권장 사항을 제공합니다. (애플리케이션의 성능을 개선하고 지연 시간 개선)
* 가용성 개선: 테넌시의 가용성을 개선하는 데 도움이 되는 권장 사항을 제공합니다.(애플리케이션이 오프라인 상태가 될 위험을 줄이고 사용자에게 지속적으로 액세스할 수 있음)

### Cloud Advisor의 작동 방식
* OCI Cloud Advisor는 **하루에 한번** 테넌시의 모든 데이터를 수집합니다. 
* 구독중인 모든 리전의 데이터들은 홈리전으로 모아서 집계하고, 권장 사항을 생성합니다.
* Cloud Advisor가 작업을 권장하기에 충분한 데이터를 축적한 후 7일 후에 권장 사항을 제공합니다.
* Cloud Advisor가 CPU 사용률을 확인 하고 컴퓨팅 권장 사항을 제공하려면 Cloud Advisor가 컴퓨팅 인스턴스를 모니터링하도록 설정해야 합니다. 모니터링이 활성화되지 않은 경우 Cloud Advisor는 모니터링 을 활성화하라는 권장 사항을 생성하게 됩니다.

### Cloud Advisor 화면
#### 대시보드
원가관리, 고가용성, 성능 및 보안을 하나의 대시보드를 통해서 보여줍니다.
![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/oci-cloud-advisor-1.png " ")

#### 초기 권장 사항 내용
권장 사항에서는 범주별(원가 관리, 성능, 고가용성)로 조회가 가능하며, 예상 절감 비용, 중요도, 상태등을 확인할 수 있습니다. 각 권장 사항을 클릭하면 권장 내용과 함께 연관된 리소스를 확인할 수 있습니다.
![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/oci-cloud-advisor-2.png " ")

#### 작업 요청
작업 요청에서는 Cloud Advisor 통해서 실행된 요청 내역을 볼 수 있습니다.
![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/oci-cloud-advisor-3.png " ")

#### 내역
내역에서는 Cloud Advisor 통해서 설정된 모든 리스트를 볼 수 있습니다.
![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/oci-cloud-advisor-4.png " ")

#### 설정
설정을 통해서 Cloud Advisor 적용할 리소스에 대한 설정 및 우선 범위 설정을 할 수 있습니다.
![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/oci-cloud-advisor-5.png " ")

### 마무리
이름에서 알 수 있듯이 Cloud Advisor를 통해서 전체 테넌시에 대한 비용 최적화를 위한 조언과 권장 및 보안, 성능, 고가용성에 대한 조언과 권장을 받아볼 수 있습니다. 이를 통해서 보다 비용 효율적이고 성능 최적화된 환경을 달성하는데 도움이 되기를 바랍니다.