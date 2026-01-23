---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "10월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 10월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - October-2025
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

## Support for longer running functions in Detached mode, and delivery destinations
* **Services:** Functions
* **Release Date:** October 07, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionsinvokingfunctions.htm#functionsinvokingdetachedfunctions](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionsinvokingfunctions.htm#functionsinvokingdetachedfunctions){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OCI Functions의 Detached 모드를 통해서 최대 1시간동안 Function 실행을 지원하며, 실행 결과를 Notifications, Queue, Streaming 서비스로 자동 전달할 수 있어 장시간 비동기 처리 및 이벤트 기반 아키텍처에 적용이 용이해졌습니다.

Detached 모드를 위해서 **detachedModeTimeoutInSeconds** 파라미터를 사용할 수 있고, 최소 5초에서 최대 3,600초(1시간) 적용이 가능합니다. 기존 **Synchronous invocation timeout**도 여전히 유효하며 최대 300초(5분) 지정이 가능합니다.

--- 

## Kubernetes Engine support for an annotation to assign a reserved public IPv4 address to a load balancer or network load balancer
* **Services:** Kubernetes Engine
* **Release Date:** October 29, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringloadbalancersnetworkloadbalancers-subtopic.htm#contengcreatingloadbalancer_topic_Specifying_Load_Balancer_Reserved_IP](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringloadbalancersnetworkloadbalancers-subtopic.htm#contengcreatingloadbalancer_topic_Specifying_Load_Balancer_Reserved_IP){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OKE에서 LoadBalancer 유형의 Service를 배포할 때, 클러스터가 생성하는 OCI Load Balancer 또는 Network Load Balancer에 Reserved Public IPv4 주소를 할당할 수 있습니다.

기존에는 Service 매니페스트의 spec.loadBalancerIP 필드에 Reserved Public IP 주소를 직접 지정하는 방식으로 설정했지만, 앞으로는 oci.oraclecloud.com/reserved-ips Annotation을 사용해서 설정이 가능합니다.

현재는 두 방식 모두 계속 지원되지만, spec.loadBalancerIP 방식은 향후 릴리스에서 Deprecated 될 예정입니다. 따라서 앞으로는  oci.oraclecloud.com/reserved-ips Annotation을 사용해 Reserved Public IPv4를 지정할 것을 권장합니다.

### 사용 예시
#### Assign a reserved public IP address to a load balancer using the annotation
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-lb-service
  annotations:
    oci.oraclecloud.com/reserved-ips: "10.0.0.1"
    oci.oraclecloud.com/load-balancer-type: "lb"
spec:
  type: LoadBalancer
  ports:
    - port: 80
      targetPort: 80
  selector:
    app: my-app
```

#### Assign a reserved public IP address to a network load balancer using the annotation
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-nlb-service
  annotations:
    oci.oraclecloud.com/reserved-ips: "10.0.0.1"
    oci.oraclecloud.com/load-balancer-type: "nlb"
spec:
  type: LoadBalancer
  ports:
    - port: 80
      targetPort: 80
  selector:
    app: my-app
```
