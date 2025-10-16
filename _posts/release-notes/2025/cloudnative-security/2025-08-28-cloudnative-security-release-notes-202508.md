---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "8월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 8월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - August-2025
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

## VCN-Native Pod Networking CNI plugin version 2.3.0 now available
* **Services:** Kubernetes Engine
* **Release Date:** August 08, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-VCN-native-CNI-v230-Release-Notes.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-VCN-native-CNI-v230-Release-Notes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI VCN‑Native Pod Networking CNI 플러그인 2.3.0 버전이 Release 되었습니다.

### 주요 변경사항 및 신규 기능
1. CNI 플러그인 업데이트 전략 변경 (OnDelete 방식 채택, 참고: [DaemonSet Update Strategy](https://kubernetes.io/docs/tasks/manage-daemon/update-daemon-set/#daemonset-update-strategy))
CNI 플러그인 Pod가 기존에는 Cluster 업데이트 시에 자동으로 롤링 업데이트 되었었지만, 이제는 OnDelete 전략이 기본으로 적용되어 명시적으로 플러그인이 삭제될 때만 업데이트 됩니다. 이 기능의 이점은 Cluster 업데이트 중에 CNI 플러그인의 얘기치 않은 재시작으로 네트워크 연결에 심각한 문제(Pod 네트워크 단절, Pod 스케줄 실패, 서비스 불안정 및 다운타임 등)가 발생할 수 있는 것을 방지할 수 있습니다.

2. Validating admission policy
CNI 플러그인 Pod의 삭제를 제한하는 정책이 새롭게 도입되었습니다. CNI 플러그인을 기존 노드에 적용을 위해서는 다음과 같은 작업이 필요합니다.
* Validating admission policy 삭제
* 기존 CNI Pod를 수동 삭제
* Validating admission policy 다시 생성
이 작업을 통해서 DaemonSet Controller가 최신 버전의 CNI Pod를 다시 생성해줍니다.

> 새로운 노드를 추가하는 경우에는 최신 CNI 플러그인이 적용됩니다.

## Use OCI Streaming with Apache Kafka to create Kafka clusters
* **Services:** Kafka, Oracle Cloud Infrastructure
* **Release Date:** August 27, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/kafka/home.htm](https://docs.oracle.com/en-us/iaas/Content/kafka/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OCI에서 Apache Kafka 기반의 OCI Streaming 서비스를 사용할 수 있습니다. OCI Streaming with Apache Kafka는 수백만 개의 이벤트를 수집, 처리, 저장 및 이동할 수 있는 실시간 분산 데이터 스트리밍 파이프라인을 구축하기 위한 완전 관리형 Kafka 서비스입니다.

### OCI Streaming 서비스와 비교
1. OCI Streaming은 Serverless 서비스로 애플리케이션 간 메시지 버스, 중소 규모 이벤트 처리 용도로 사용하지만, OCI Streaming with Apache Kafka는 대용량 실시간 스트리밍, Change Data Capture(CDC), 분석 파이프라인, IoT 또는 복잡한 스트림 처리 워크로드 등에 사용.

2. OCI Streaming은 Apache Kafka 호환 API를 제공하나 Producer, Consumer, Admin 등 일부 기능 제한 있지만, OCI Streaming with Apache Kafka는 100% Apache Kafka 호환됨.

3. OCI Streaming은 데이터 입출력량 및 스토리지 용량 단위로 가격이 책정되지만, Streaming with Apache Kafka는 브로커 수, CPU/메모리, 스토리지 용량 단위로 가격이 책정됨. 따라서 OCI Streaming은 사용량 변화에 유연하게 대응이 가능하지만(비용 예측은 어려움), Streaming with Apache Kafka는 미리 자원을 할당해야 하므로 고정 비용이 발생함(비용 예측이 쉬움). 

OCI Streaming with Apache Kafka 서비스에 대한 더 자세한 정보는 아래 링크에서 찾아볼 수 있습니다.  
[Streaming with Apache Kafka documentation](https://docs.oracle.com/en-us/iaas/Content/kafka/home.htm)