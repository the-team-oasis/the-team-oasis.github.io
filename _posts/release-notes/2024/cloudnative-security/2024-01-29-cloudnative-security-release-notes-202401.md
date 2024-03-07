---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "1월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2024년 1월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2024-cloudnative-security
tags:
  - oci-release-notes-2024
  - Jan-2024
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

## Path analysis tests to troubleshoot network configuration issues with Kubernetes clusters
* **Services:** Container Engine for Kubernetes
* **Release Date:** Jan. 9, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengtroubleshooting_topic-network_troubleshooting.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengtroubleshooting_topic-network_troubleshooting.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OKE Cluster내의 Network 구성 문제를 추적하기 위한 사전 정의된 Network Path Analysis Test룰 제공합니다. Network Path Analysis에서는 OKE Cluster에서 사용하는 여러 네트워크 리소스(VCN Topology, Route Tables, Security List와 Network Security Group의 Security Rule을 포함합니다.

### Network Path Analysis Test 범위
다음과 같은 유형의 네트워크 테스트를 지원합니다.
* **Cluster API tests:** Kubernetes API 엔드포인트와 다른 클러스터내 환경 및 다른 네트워크와의 양방향 테스트
* **Node tests:** Kubernetes Worker Node와 다른 클러스터내 환경 및 다른 네트워크와의 양방향 테스트
* **Pod tests:** Kubernetes Pod가 다른 클러스터내 환경 및 다른 네트워크와의 양방향 테스트
* **Load Balancer tests:** OCI Load Balancer 또는 Network Load Balancer와 다른 클러스터내 환경 및 다른 네트워크와의 양방향 테스트

### 스크린샷
**사전 정의된 테스트 케이스**
![](/assets/img/cloudnative-security/2024/2024-01-29-cloudnative-security-release-notes-1.png)

**테스트 실행**
![](/assets/img/cloudnative-security/2024/2024-01-29-cloudnative-security-release-notes-2.png)

## Support for deploying Istio as a cluster add-on
* **Services:** Container Engine for Kubernetes
* **Release Date:** Jan. 18, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengistio-cluster-add-on.htm](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengistio-cluster-add-on.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 K8s Cluster 서비스 메시인 Istio를 Cluster Add-On으로 사용할 수 있습니다. Istio를 독립적으로 설치하는 것이 아닌, Cluster Add-On으로 사용하면 구성 및 지속적인 유지 관리를 단순화 할 수 있습니다.

구체적으로 다음과 같은 기능을 사용할 수 있습니다.
1. Istio 활성화 또는 비활성화
1. Oracle의 자동 업데이트 여부를 선택할 수 있습니다.
1. Istio Add-On Version을 선택할 수 있습니다.
1. 승인된 키/값 구성 인수를 사용하여 추가 기능별 사용자 정의 관리가 가능합니다. 
* [승인된 구성 인수에 대한 키 값 확인](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons-configurationarguments.htm#contengconfiguringclusteraddons-configurationarguments_Istio)

## Support for CoreDNS cluster add-on resource request and limit configuration
* **Services:** Container Engine for Kubernetes
* **Release Date:** Jan. 23, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons-configurationarguments.htm#contengconfiguringclusteraddons-configurationarguments_coredns](hhttps://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons-configurationarguments.htm#contengconfiguringclusteraddons-configurationarguments_coredns){:target="_blank" rel="noopener"}

### 업데이트 내용
OKE Add-On으로 구성이 가능한 CoreDNS에 대해서 다음과 같이 키/값 형태의 승인된 구성 인수가 추가되었습니다.
* **coreDnsContainerResources**

이 구성 인수를 활용하여 다음과 같은 구성 설정을 할 수 있습니다.
1. CoreDNS 컨테이너가 요청하는 리소스 수량을 지정 (Key: coreDnsContainerResources)
2. CoreDNS 컨테이너가 초과할 수 없는 리소스 사용량 제한

**CoreDNS 구성 인수:** https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons-configurationarguments.htm#contengconfiguringclusteraddons-configurationarguments_coredns

## Support for Dedicated Key Management Service
* **Services:** Vault
* **Release Date:** Jan. 26, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons-configurationarguments.htm#contengconfiguringclusteraddons-configurationarguments_coredns](hhttps://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons-configurationarguments.htm#contengconfiguringclusteraddons-configurationarguments_coredns){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OCI KMS(Key Management Service)에서는 고가용성, 단인 테넌트 HSM 파티션을 지원하는 완전 관리형 전용(Dedicated) KMS를 지원합니다. 이 서비스를 통해서 변조 방지된 물리적 HSM 장채 내의 전용 파티션에 대한 독점적 액세스 및 제어가 가능하며, 암호화 키의 격리 및 보호도 보장됩니다. ㅒ챠 전용 HSM 파티션은 FIPS 140-2 레벨 3 인증을 획득하였습니다.

* **FIPS 140 프로그램:** 암호화 알고리즘 구현의 정확성과 변조 방지/대응을 비롯하여 암호화 모듈의 보안 설계 및 구현과 관련된 영역을 검증
* **보안 레벨 3:** 보안 관리 모범 사례 및 포괄적인 보안 컨트롤을 위해 연방 위험 및 인증 관리 프로그램(FedRAMP), 미국 건강 보험 양도 및 책임에 관한 법(HIPAA), 결제 카드 산업(PCI) 표준, 유럽 연합의 일반 데이터 보호 규정(GDPR), 국제 표준화 기구(ISO) 27001 표준을 비롯한 여러 산업 및 규제 표준을 준수

전용 (Dedicated) HSM 파티션으로 구성할 경우 다음과 같이 **Make it a virtual private vault**를 체크합니다.
![](/assets/img/cloudnative-security/2024/2024-01-29-cloudnative-security-release-notes-3.png)

### 가격
전용(Dedicated) HSM 파티션 가격은 다음과 같습니다.
![](/assets/img/cloudnative-security/2024/2024-01-29-cloudnative-security-release-notes-4.png)