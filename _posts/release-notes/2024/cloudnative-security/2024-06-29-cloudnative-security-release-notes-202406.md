---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "6월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2024년 6월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2024-cloudnative-security
tags:
  - oci-release-notes-2024
  - June-2024
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

## Support for deploying the OCI native ingress controller as a cluster add-on
* **Services:** Container Engine for Kubernetes
* **Release Date:** June 05, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller-cluster-addon-top-level.htm](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller-cluster-addon-top-level.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OCI Native Ingress Controller를 Cluster Add-On으로 사용할 수 있습니다.
OCI Native Ingress Controller를 cCluster Add-On 기능으로 사용하면 구성및 유지 관리가 간소화됩니다.

다음은 OCI Native Ingress Controller Cluster Add-On 기능의 이점입니다.
* OCI Native Ingress Controller를 쉽게 활성화하거나 비활성화합니다.
* Oracle의 자동 업데이트에 대한 수신 동의 및 거부를 선택할 수 있습니다.
* OCI Native Ingress Controller Add-On을 선택할 수 있습니다.
* 승인된 키/값 구성 인수를 사용하여 추가 기능별 사용자 정의 관리가 가능합니다.
  * [승인된 구성 인수에 대한 키 값 확인](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons-configurationarguments.htm#contengconfiguringclusteraddons-configurationarguments_NIC)

## List-Unsubscribe is now available
* **Services:** Email
* **Release Date:** June 14, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/Email/Reference/list-unsubscribe.htm](https://docs.oracle.com/en-us/iaas/Content/Email/Reference/list-unsubscribe.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
작년에 Google과 Yahoo에서 안전한 메일박스를 유지하고, 원치않는 메일을 수신하지 않도록 하는 3가지 필수 요건을 발표했는데, 그 중 한가지가 한번의 클릭으로 메일 구독취소를 할 수 있는 기능이었습니다. (1. 메일 인증구성, 2.스팸 비율을 0.3% 미만으로 유지, 3. 원클릭 구독취소)

이제 Email Delivery 서비스에서 수신자가 이메일을 쉽게 구독 해지할 수 있도록 ‘One-Click Unsubscribe’ 기능을 제공합니다. 이 기능은 수신자가 이메일 내의 구독 해지 링크를 클릭하면 자동으로 구독 해지가 이루어지는 방식입니다. 이 기능을 통해 수신자는 이메일을 열고 별도의 절차 없이 한 번의 클릭으로 구독을 취소할 수 있습니다. 이는 사용자 경험을 개선하고, 불필요한 이메일을 줄이는 데 도움이 됩니다. 이 기능은 스팸 필터에 긍정적인 영향을 미치며, 이메일 발송자에게는 구독 해지율을 낮추고 수신자 관리를 더 효율적으로 할 수 있는 장점을 제공합니다. OCI는 이 기능을 통해 구독 해지 요청을 자동으로 처리하며, 수신자는 이메일 발송자에게 추가적인 요청을 하지 않아도 됩니다. 

### 참고 화면
![](https://jangomail.com/wp-content/uploads/2021/01/iosunsub.jpg)




## Support for deploying the Kubernetes Metrics Server as a cluster add-on
* **Services:** Container Engine for Kubernetes
* **Release Date:** June 18, 2024
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengworkingwithmetricsserver_cluster-add-on.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengworkingwithmetricsserver_cluster-add-on.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Kubernetes Metrics Server를 Cluster Add-On으로 사용할 수 있습니다. Kubernetes Metrics Server는 각 Worker Node에서 실행되는 Kubelet으로 부터 수집된 Resource Metrics 데이터를 Kubernetes Metrics API를 통해 Kubernetes API 서버로 노출합니다. 이제 Kubernetes API(kubectl)를 활용하여 Cluster 전반의 Metrics 정보를 쉽게 확인할 수 있습니다.

다음은 Kubernetes Metrics Server Add-On 기능의 이점입니다.
* Kubernetes Metrics Server를 쉽게 활성화하거나 비활성화합니다.
* Oracle의 자동 업데이트에 대한 수신 동의 및 거부를 선택할 수 있습니다.
* Kubernetes Metrics Server Add-On을 선택할 수 있습니다.
* 승인된 키/값 구성 인수를 사용하여 추가 기능별 사용자 정의 관리가 가능합니다.
  * [승인된 구성 인수에 대한 키 값 확인](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons-configurationarguments.htm#contengconfiguringclusteraddons-configurationarguments_metrics-server)
