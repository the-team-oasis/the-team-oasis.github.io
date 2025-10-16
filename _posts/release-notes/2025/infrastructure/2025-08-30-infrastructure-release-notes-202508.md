---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "8월 OCI Infrastructure 업데이트 소식"
teaser: "2025년 8월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2025-infrastructure
tags:
   - oci-release-notes-2025
   - Aug-2025
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



## Use OCI Streaming with Apache Kafka to create Kafka clusters
* **Services**: Kafka, Oracle Cloud Infrastructure
* **Release Date**: August 27, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/kafka/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/kafka/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle이 자체 관리형 Kafka 서비스인 OCI Streaming with Apache Kafka 를 공식 출시하였습니다. 이 서비스는 오픈소스 Kafka와의 호환성을 유지하면서, 분산 스트리밍 파이프라인을 손쉽게 구축하고 운영할 수 있습니다.

![OCIGG23AICON](/assets/img/infrastructure/2025/kafka.png)

- 완전 관리형 Kafka 서비스 제공
  - 스트리밍 클러스터의 설치, 구성, 업그레이드, 운영 부담을 OCI 쪽에서 처리하며, 사용자는 스트림 설계와 데이터 흐름에 집중할 수 있습니다.

- 오픈소스 Apache Kafka 호환성 유지
  - 기존 Kafka 클라이언트와 도구들이 호환되도록 설계되어, 현재 Kafka 기반 시스템을 OCI로 이전하거나 통합하기에 적합합니다.

- 실시간 이벤트 처리 지원
  - 수백만 개의 이벤트를 분 단위로 수집, 처리, 저장 그리고 이동하는 스트리밍 파이프라인 구축이 가능합니다.

- 확장성과 안정성 제공
  - 대규모 스트리밍 워크로드에 대응할 수 있도록 자동 확장 옵션 및 관리 도구를 제공합니다. (리소스 조정, 장애 대응 등)

- 지원되는 Apache Kafka 버전

  | **Apache Kafka Version** | **OCI Release Date** | **End of Life** |
  |----------------------|-------------|---------------------------------|
  | **3.7.0** | 27 August 2025   | na |
  | **3.6.1** | 27 August 2025   | na |
  | **3.6.0** | 27 August 2025   | na |