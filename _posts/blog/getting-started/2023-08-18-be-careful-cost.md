---
layout: page-fullwidth
#
# Content
#
subheadline: "Billing & Cost"
title: "비용 관점에서 사전 고려가 필요한 OCI의 서비스들"
teaser: "OCI에서 제공하는 다양한 서비스들을 사용함에 있어서 비용적인 측면에서 고려해야 할 내용들을 정리하였습니다."
author: dankim
breadcrumb: true
categories:
  - getting-started
tags:
  - [oci, cost]
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

# -------------- 내용 필독 -------------------
# 작성할 내용은 아래부터 작성
# 작성 방법
# 각 챕터별 제목은 "###"로 시작한다.
# 하위 제목은 "####"로 시작한다.
# 이미지는 images 폴더안에 Category(getting-started, infrastructure, platform, database, aiml)에 넣고 사용 시 "../../images/카테고리명/이미지" 형태로 참조한다.
# Bold는 **글자**
# Bold + Italic은 ***글자***
# ------------------------------------------
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

### OCI 서비스들에 대한 비용 확인
OCI에서는 Infrastructure, PaaS, Database, Security, Observability, Developer Service등 다양한 서비스들을 제공하고 있습니다. 이러한 서비스들은 일부 무료로 제공되는 서비스도 있지만, 상당부분은 유료로 제공되고 있습니다. 유료 서비스들에 대한 기본적인 가격 정보는 OCI Price List 페이지에서 확인 가능하며, Cost Estimator라는 도구를 통해서 미리 가격 시뮬레이션을 해볼 수 있습니다. 항상 특정 서비스를 사용하기에 앞서 아래 링크에서 가격을 확인한 후 사용을 하는 것이 좋습니다.

**OCI Price List**  
[https://www.oracle.com/kr/cloud/price-list/](https://www.oracle.com/kr/cloud/price-list/)

**OCI Cost Estimator**
[https://www.oracle.com/kr/cloud/costestimator.html](https://www.oracle.com/kr/cloud/costestimator.html)

Price List를 보면 일부 서비스들은 고비용이 발생할 수 있는 성격의 서비스들이 존재합니다. 이러한 서비스들은 명확한 계획을 세우고 사용하여야 비용 폭탄을 피할 수 있습니다. 지금부터는 OCI에서 제공하는 서비스 중에서 비용 이슈가 될 수 있는 서비스들을 나열하고 어떤 경우에 비용이 많이 발생할 수 있는지 알아보도록 하겠습니다.

### 비용이 많이 발생할 수 있는 서비스
#### Compute
* **Bare Metal**
  * Bare Metal은 물리 서버를 그대로 제공하므로, 기본적으로 많은 OCPU와 메모리를 가지고 프로버저닝이 됩니다. Bare Metal은 Shape 이름에 BM이(예시, BM.Standard3.64) 붙고, VM은 VM(예시, VM.Standard3)이 붙기 때문에 인스턴스 생성에서 Shape 선택 시 VM Shape인지, BM Shape인지 잘 확인한 후 생성해야 합니다. 비용은 프로비저닝이 끝난 후 생성된 BM의 OCPU와 메모리수에 따라 시간당 과금되며, 많은 리소스와 함께 프로비저닝 되므로 잘 관리하지 못하면 많은 비용이 발생할 수 있습니다.
* **Dedicated Virtual Host**
  * Dedicated Virtual Host 또한 Bare Metal과 비슷하지만, 다른 사용자와 공유되지 않는 별도의 전용 호스트를 할당받아 VM을 운영할 수 있는 서비스입니다. OCI Compute 매뉴에서 **Dedicated Virtual Host**를 통해서 생성하며, 최소 36 OCPU 이상으로 생성되므로, 많은 비용이 발생할 수 있습니다.
* **Capacity Reservations**
  * Capacity Reservations는 특정 용량의 컴퓨트 자원을 미리 확보하는 개념으로, OCI Compute 메뉴에서 **Capacity Reservations** 메뉴를 통해 생성할 수 있습니다. 미리 확보한 만큼의 용량은 실제 사용하지 않더라도 85% 정도의 비용이 발생하므로, 용량 확보시 주의하여 생성하셔야 합니다.

#### Networking
* **Outbound Data Transfer**
  * Outbound Data Transfer 비용은 리전에서 외부로 전달되는 데이터 양입니다. 기본적으로 월 10TB 무료로 제공되고 있지만, 10TB 이상부터 비용이 발생합니다. 주의할 사항은 다른 OCI 서비스들과 다르게 Outbound Data Transfer는 지역별로 가격 차이가 존재합니다. North America, Europe, UK는 기가 바이트당 $0.0085로 가장 저렴하며, APAC, Japan, South America는 $0.025 입니다. Middle East, Africa의 경우에는 $0.05로 가장 비싸게 책정되어 있습니다.
* **Network Firewall**
  * Network Firewall은 Palo Alto Next-Generation Firewall에 대한 관리형 서비스입니다. 비용은 인스턴스당 $2.75로 높은 편이며, 사용 시 비용을 잘 관리해야 하는 서비스중 하나입니다.

#### Storage
* **Object Storage**
  * Object Storage는 사용 방식에 따라 Standard, Infrequent Access, Archive 형태로 제공됩니다. Bucket 혹은 Object에 Access를 얼마나 자주하는지에 따라서 나눠질 수 있는데, 가격은 Staddard가 가장 비싸며, Infrequent Access, Archive 순으로 가격이 저렴합니다. 저장하는 데이터 특성에 따라서 스토리지 티어를 선택하면 좀 더 비용 효율을 높일 수 있습니다.

#### Database
* **Autonomous Database, Exadata Cloud Service**
  * OCI에서 제공하는 오라클 데이터베이스 서비스는 기본 VM 형태로 제공하는 Base Database와 Autonomous Database, Exadata Cloud Service로 나눠져 있습니다. Autonomous Database는 서버리스 형태로 제공되는 서비스이며, Exadata Cloud Service는 Exadata를 OCI 환경에서 운영할 수 있도록 해주는 서비스 입니다. 기본적으로 Autonomous Database와 Exadata Cloud Service는 Base Database에 비해 가격이 비싸므로, 특별한 경우를 제외하고는 Base Database를 사용하는 것이 좋습니다.

#### Observability and Management
* **Application Performance Monitoring**
  * OCI에서 제공하는 APM 서비스입니다. Tracing Data는 처음 1,000개의 이벤트까지만 무료이며, 이후 시간당 10만 이벤트에 대해서 $0.65씩 발생합니다. APM에서 처리하는 이벤트수는 애플리케이션 규모에 따라서 대규모로 발생할 수 있으므로, APM을 사용하는 경우에는 비용을 잘 모니터링 해야합니다.
* **Logging**
  * Logging은 OCI 서비스 혹은 외부 애플리케이션의 로그 데이터를 수집하여 보여주는 서비스로 데이터 저장양에 따라서 과금됩니다. 기본적으로 월 10기가까지 무료이며, 이후 기가 바이트당 $0.05가 과금됩니다. 로그를 Enable할 경우에는 Retention(보관 기간)을 설정할 수 있으므로, 로그 데이터가 많은 경우에는 Retention을 작게 설정하여 구성하셔야 비용을 절약할 수 있습니다.
* **Logging Analytics**
  * Logging Analytics는 Logging 데이터를 수집하여 다양한 관점에서 분석해주는 서비스입니다. 기본적으로 데이터는 최초 10기가까지 용량만 무료로 제공되며, 이후부터 Storage Unit(300GB)단위로 과금됩니다. 처음 35 Storage Unit까지는 Storage Unit당 $372이며, 36 ~ 103 Storage Unit에서는 Unit당 $260.40, 103 Storage Unit 이상부터는 Unit당 $223.20입니다. 로깅 분석을 위한 데이터 수집시 많은 데이터가 유입될 경우 많은 비용이 발생할 수 있으므로 주의해야 합니다.
* **Notifications**
  * 메시지 Topic 서비스로 매달 백만건까지 무료로 제공되며, 이후부터 백만건당 $0.60입니다. 만일 Notifications의 구독을 이메일로 하는 경우 메일 발송은 최초 1,000건 무료, 이후 1,000건당 $0.02가 발생합니다.

#### Developer Service
* **Container Engine for Kubernetes**
  * Worker Node는 사용하는 Compute Shape에 따라 비용이 지불됩니다. Cluster 생성 시 Basic Cluster로 생성을 하면 비용이 발생하지 않지만, 만약 Cluster를 Enhanced Cluster로 생성한 경우라면 시간당 클러스터 하나에 $0.10 비용이 발생합니다. Cluster 생성 시 Enhanced Cluster로 생성할 필요가 없는 경우라면, Basic Cluster 확인 옵션을 체크한 후 생성하는 것을 권장합니다.
* **Search Service With OpenSearch**
  * 처음 2 Data Node에 대해서는 Compute 비용(OCPU, Memory, Storage)만 청구되지만, 3 Node부터는 서비스 비용으로 노드당 $0.25가 추가됩니다.

#### Platform as a Services
  * OCI에서는 여러가지 PaaS 서비스를 제공하고 있습니다. PaaS 서비스들은 기본적으로 다른 클라우드 서비스와 비교해서 가격이 높게 책정되어 있으니, 프로비저닝 할 경우 사전에 가격 정보등 확인을 한 후 진행하는 것이 좋습니다. 다음은 OCI에서 제공하는 PaaS 서비스입니다. (Database 제외)
    * Oracle Analytics Cloud
    * Content Management
    * Big Data Service
    * Blockchain Platform
    * Tuxedo
    * Visual Builder
    * Integration
    * Data Integration
    * GoldenGate
    * Process Automation
    * Service Oriented Architecture (SOA)
    * Digital Assistant
