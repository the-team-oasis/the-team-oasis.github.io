---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "5월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2026년 5월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2026-cloudnative-security
tags:
  - oci-release-notes-2026
  - May-2026
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

## Support for Kubernetes version 1.33.10
* **Services:** Kubernetes Engine
* **Release Date:** May 06, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-K8s-1-33-10-support.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-K8s-1-33-10-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Supported Versions of Kubernetes](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengaboutk8sversions.htm){:target="_blank" rel="noopener"}, [Upgrading the Kubernetes Version on Control Plane Nodes](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengupgradingk8smasternode.htm){:target="_blank" rel="noopener"}, [Upgrading the Kubernetes Version on Worker Nodes](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengupgradingworkernodes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 Kubernetes Version **1.33.10**을 지원합니다. 공식 릴리즈 노트 기준으로 1.33.10은 1.35.2, 1.34.2와 함께 지원됩니다.

Kubernetes 1.33.10 지원이 추가됨에 따라 OKE는 **2026년 6월 8일**에 Kubernetes 1.33.1 지원을 중단할 예정입니다. Oracle은 1.33.1 클러스터를 1.33.10, 1.34.2 또는 1.35.2로 업그레이드할 것을 권장합니다.

### 업그레이드 참고사항

OKE 클러스터를 업그레이드할 때는 Control Plane을 먼저 업그레이드하고, 이후 Worker Node Pool을 업그레이드합니다. Kubernetes 1.28 이후 skew policy는 Control Plane이 Worker Node보다 최대 세 minor version 앞서는 것을 허용하지만, OKE 지원 종료일이 지난 Worker Version은 운영 대상에서 제외하는 것이 좋습니다.

## OCI Kubernetes Engine (OKE) support for multiple secondary VNIC attachments
* **Services:** Kubernetes Engine
* **Release Date:** May 06, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-Generic-VNIC-attachments.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-Generic-VNIC-attachments.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Attaching Multiple Secondary VNICs for Pod Networking](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengAttaching_Multiple_VNICs.htm){:target="_blank" rel="noopener"}, [Using the OCI VCN-Native Pod Networking CNI plugin](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengpodnetworking_topic-OCI_CNI_plugin.htm){:target="_blank" rel="noopener"}, [VCN IP Enhancements](https://docs.oracle.com/en-us/iaas/releasenotes/network/vcn-ip-enhancements.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE Node Pool에 여러 개의 Secondary VNIC를 연결하고, 각 Secondary VNIC Profile을 Subnet, NSG, IP allocation 설정별로 독립적으로 구성할 수 있게 되었습니다.

대표 시나리오는 다음과 같습니다.

* **Workload isolation:** Pod 그룹별로 서로 다른 VNIC Profile과 Subnet/NSG를 사용해 네트워크 격리를 구성합니다.
* **Pod density 증가:** VCN IP Enhancements와 함께 사용하면 Node당 최대 256개 Pod까지 확장할 수 있습니다.
* **Multi-interface pod networking:** Multus, NetworkAttachmentDefinition, OCI IPAM plugin과 함께 multi-interface pod 구성을 지원합니다.

### 사용 조건

Multiple Secondary VNIC Attachment는 OCI VCN-Native Pod Networking CNI plugin이 필요합니다. flannel CNI plugin에서는 지원되지 않습니다. 각 Compute Shape가 지원하는 최대 VNIC 수를 확인하고, VNIC Profile에 할당된 Subnet이 Node당 `ipCount`를 수용할 만큼 충분히 커야 합니다.

## Support for Node 24 and Java 21
* **Services:** Functions
* **Release Date:** May 13, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/index.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Function Development Kits](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionssupportedlanguageversions.htm){:target="_blank" rel="noopener"}, [Fn Project Tutorials](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionsfnprojecttutorials.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Functions에서 **Node 24**와 **Java 21**로 작성된 function을 build 및 deploy할 수 있게 되었습니다.

OCI Functions는 Fn Project Function Development Kit (FDK)를 사용해 Java, Node.js, Python, Go, Ruby, C# 같은 언어별 function runtime을 지원합니다. FDK는 build-time base image, runtime base image, FDK library로 구성되며, 언어 버전별로 적합한 base image를 사용합니다.

### 활용 포인트

Node 24와 Java 21 지원으로 최신 LTS 계열 언어 기능과 보안 업데이트를 사용하는 serverless application을 OCI Functions에서 운영할 수 있습니다. 새 runtime을 사용하려면 Fn Project CLI를 최신 버전으로 유지하고, `fn init --help` 또는 Fn runtime list를 통해 지원 runtime을 확인한 뒤 function을 생성합니다.

## VCN-Native Pod Networking CNI plugin version 3.3.0 now available
* **Services:** Kubernetes Engine
* **Release Date:** May 13, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-VCN-native-CNI-v330-Release-Notes.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-VCN-native-CNI-v330-Release-Notes.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Using the OCI VCN-Native Pod Networking CNI plugin](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengpodnetworking_topic-OCI_CNI_plugin.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE용 OCI VCN-Native Pod Networking CNI plugin version **3.3.0**이 제공됩니다. 이번 버전에는 다음 기능과 개선이 포함됩니다.

* Multiple Secondary VNIC가 연결된 Worker Node에 대한 ZPR support
* Bug fixes and enhancements

ZPR support는 Kubernetes version 1.32 이상이 필요합니다. 이 기능은 OCI VCN-Native Pod Networking CNI plugin을 사용하는 클러스터에서 의미가 있으며, flannel 기반 클러스터와는 구성 방식이 다릅니다.

## OCI Kubernetes Engine (OKE) support for HTTP/2 for managed load balancers
* **Services:** Kubernetes Engine
* **Release Date:** May 21, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-LB_HTTP2-support.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-LB_HTTP2-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Provisioning OCI Load Balancers for Kubernetes Services of Type LoadBalancer](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingloadbalancers-subtopic.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE가 Kubernetes `Service` Type `LoadBalancer`로 생성하는 OCI Load Balancer에서 **HTTP/2 listener protocol**을 지원합니다.

HTTP/2 Listener를 구성하려면 다음 Annotation을 사용합니다.

```yaml
metadata:
  annotations:
    oci.oraclecloud.com/load-balancer-type: "lb"
    service.beta.kubernetes.io/oci-load-balancer-backend-protocol: "HTTP2"
```

HTTP/2는 clusters running Kubernetes version 1.32 이상에서 지원되며, listener에 frontend SSL/TLS 구성이 필요합니다.

## OCI Kubernetes Engine (OKE) support for assigning reserved public IPv6 addresses to load balancers
* **Services:** Kubernetes Engine
* **Release Date:** May 21, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-Reserved-IPv6-addresses-LB.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-Reserved-IPv6-addresses-LB.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Configuring Load Balancers and Network Load Balancers](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringloadbalancersnetworkloadbalancers-subtopic.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE가 Kubernetes `Service` Type `LoadBalancer`로 생성하는 OCI Load Balancer에 Reserved Public IPv6 Address를 할당할 수 있게 되었습니다. 사용 Annotation은 기존 Reserved Public IP 지정에 사용하는 `oci.oraclecloud.com/reserved-ips`입니다.

Reserved Public IPv6 Address를 지정하려면 Reserved Public IPv4 Address와 Reserved Public IPv6 Address를 comma-separated list로 함께 지정해야 합니다.

```yaml
metadata:
  annotations:
    oci.oraclecloud.com/load-balancer-type: "lb"
    oci.oraclecloud.com/reserved-ips: "ocid1.publicip.oc1..ipv4...,ocid1.publicip.oc1..ipv6..."
spec:
  type: LoadBalancer
  ipFamilies:
    - IPv4
    - IPv6
```

Reserved Public IPv6 Address는 Load Balancer가 생성되는 Subnet에 속해야 하며, Service manifest에는 IPv4와 IPv6 address family가 모두 지정되어야 합니다. 이 기능은 Kubernetes version 1.32 이상에서 지원됩니다. Network Load Balancer와 `spec.loadBalancerIP` field에는 지원되지 않습니다.

## Annotation to assign a reserved private IPv4 address to a load balancer or network load balancer with OKE
* **Services:** Kubernetes Engine
* **Release Date:** May 26, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-Reserved-private-IP-address-LB-NLB-NIC.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-Reserved-private-IP-address-LB-NLB-NIC.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Configuring Load Balancers and Network Load Balancers](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringloadbalancersnetworkloadbalancers-subtopic.htm){:target="_blank" rel="noopener"}, [Customizing OCI Native Ingress Controller Behavior Using Annotations](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller-configuring.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 internal load balancer 또는 internal network load balancer를 생성할 때 Reserved Private IPv4 Address를 Annotation으로 지정할 수 있게 되었습니다.

```yaml
metadata:
  annotations:
    oci.oraclecloud.com/load-balancer-type: "lb"
    oci.oraclecloud.com/internal-load-balancer: "true"
    oci.oraclecloud.com/reserved-private-ips: "ocid1.privateip.oc1..reservedprivateip..."
```

Network Load Balancer에도 internal NLB 구성과 함께 사용할 수 있습니다. 이 Annotation은 Kubernetes version 1.32 이상을 실행하는 클러스터에서 지원됩니다.

OCI Native Ingress Controller가 생성하는 OCI Load Balancer에는 `oci-native-ingress.oraclecloud.com/reserved-private-ip-address-id` Annotation을 사용할 수 있으며, 이 기능은 OCI Native Ingress Controller version 1.4.4 이상에서 지원됩니다.

## OCI Kubernetes Engine (OKE) support for Zero Trust Packet Routing
* **Services:** Kubernetes Engine
* **Release Date:** May 27, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-zpr-security-attribute-support.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-zpr-security-attribute-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Zero Trust Packet Routing](https://docs.oracle.com/en-us/iaas/Content/zero-trust-packet-routing/home.htm){:target="_blank" rel="noopener"}, [Using the OCI VCN-Native Pod Networking CNI plugin](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengpodnetworking_topic-OCI_CNI_plugin.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 선택된 Cluster-related resource에 **Zero Trust Packet Routing (ZPR) Security Attribute**를 지정할 수 있게 되었습니다.

지원되는 리소스는 다음과 같습니다.

* Kubernetes API endpoints
* Managed Node VNICs
* Kubernetes Service Type `LoadBalancer`로 생성된 Load Balancer와 Network Load Balancer
* OCI Native Ingress Controller가 생성한 Load Balancer
* CSI Volume Plugin이 생성한 File Storage Mount Target

ZPR은 protected OCI resource 간 통신에 대해 fine-grained network access policy를 정의하는 기능입니다. NSG, Security List, Kubernetes Network Policy 같은 기존 네트워크 제어와 함께 사용할 수 있습니다.

### 사용 시 주의사항

ZPR Security Attribute를 지정하는 것만으로 트래픽이 허용되지는 않습니다. 필요한 통신 경로를 허용하는 ZPR Policy를 별도로 생성해야 합니다.

OKE에서 ZPR Security Attribute는 OCI VCN-Native Pod Networking CNI plugin을 사용하는 Managed Node Pool과 Self-managed Node에서 지원됩니다. Virtual Node Pool 또는 flannel CNI plugin을 사용하는 클러스터에서는 지원되지 않습니다.
