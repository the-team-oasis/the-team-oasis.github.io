---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "4월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 4월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - April-2025
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

## Support for specifying the maximum size of HTTP headers accepted by load balancer listeners provisioned by Kubernetes Engine
* **Services:** Kubernetes Engine
* **Release Date:** April 07, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingloadbalancers-subtopic.htm#contengcreatingloadbalancer_topic_Specifying_Load_Balancer_HTTP_Header_Rule_Set](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingloadbalancers-subtopic.htm#contengcreatingloadbalancer_topic_Specifying_Load_Balancer_HTTP_Header_Rule_Set){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OKE에서 Load Balancer의 Listener에 의해 수락될 수 있는 최대 HTTP Header 사이즈를 지정할 수 있습니다. OCI Load Balancer에서는 HTTP 요청의 헤더 크기가 너무 크면 요청을 거부하거나 413 오류를 반환할 수 있습니다 (기본적으로 Load Balancer는 HTTP 요청 헤더의 크기에 제한을 두고 있음: 16KB). 이때 httpLargeHeaderSizeInKB 설정을 통해 허용할 수 있는 헤더의 크기를 늘릴 수 있습니다.

### 사용 방법
Service 정의 YAML을 작성할 때 다음과 같이 **httpLargeHeaderSizeInKB**을 사용할 수 있습니다.
```
apiVersion: v1
kind: Service
metadata:
  name: my-nginx-svc
  labels:
    app: nginx
  annotations:
    oci.oraclecloud.com/load-balancer-type: "lb"
    oci.oraclecloud.com/oci-load-balancer-rule-sets: |
      {
        "header-size": {
          "items": [
            {
              "action": "HTTP_HEADER",
              "httpLargeHeaderSizeInKB": 16
            }
          ]
        }
      }
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: nginx
```

## 사용 주의사항
* 너무 큰 헤더 크기 설정은 성능 저하를 일으킬 수 있습니다. 일반적으로는 16KB ~ 64KB 사이의 크기가 적당합니다.
* 보안 측면에서, 너무 큰 헤더는 서비스 거부(DoS) 공격에 악용될 수 있으므로, 필요 이상의 크기로 설정하지 않는 것이 좋습니다.

## Support for Kubernetes version 1.30.10
* **Services:** Kubernetes Engine
* **Release Date:** April 09, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-K8s-1-30-10-support.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-K8s-1-30-10-support.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OKE에서 Kubernetes 1.30.10버전이 추가되었습니다. 1.30.1 버전은 2025년 5월 13일부터 지원을 중단합니다.

다음은 현재 지원중인 OKE 버전입니다.
* 1.32.1
* 1.31.1
* 1.30.10
* 1.30.1 (OKE End-of-life Date: 2025-05-13)