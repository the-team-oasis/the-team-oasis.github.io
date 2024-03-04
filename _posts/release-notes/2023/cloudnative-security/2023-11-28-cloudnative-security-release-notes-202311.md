---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "11월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 11월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - Nov-2023
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

## Virtual node support for pod readiness gates
* **Services:** Container Engine for Kubernetes
* **Release Date:** Nov. 3, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringloadbalancersnetworkloadbalancers-subtopic.htm#contengcreatingloadbalancer_topic-Specifying_pod_readiness_gates](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringloadbalancersnetworkloadbalancers-subtopic.htm#contengcreatingloadbalancer_topic-Specifying_pod_readiness_gates){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Virtual Nodes에서 Network Load Balancer 혹은 Load Balancer를 프로비저닝하여 사용하는 경우, ``Pod Readiness Gates``를 통해 트래픽 수신이 준비된 Pod에 대해서만 트래픽이 라우팅되도록 구성할 수 있습니다. 이 기능은 현재 Managed Node에서는 지원하지 않고, Virtual Nodes에서만 지원합니다.

``Pod Readiness Gates``에 대한 자세한 내용은 아래 쿠버네티스 공식 가이드를 참고합니다.

[https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-readiness-gate](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-readiness-gate)

### Load Balancer에 Pod Readiness Gates 적용 방법
Virtual Nodes에서 특정 Kubernetes Namespace에 생성된 모든 Pod에 대한 Pod Readiness Gates를 삽입하도록 지정하기 위해서는 ``loadbalancer.oci.oraclecloud.com/pod-readiness-gate-inject=enabled``를 Namespace Label에 추가해야 합니다.

```
$ kubectl label ns <namespace> loadbalancer.oci.oraclecloud.com/pod-readiness-gate-inject=enabled
```

그 다음 해당 Namespace에 Nginx를 배포합니다.
```
$ kubectl apply -f https://raw.githubusercontent.com/oracle-devrel/oci-oke-virtual-nodes/main/nginx-svc/nginx.yaml -n <namespace>
```

이제 Nginx 이미지 버전을 업데이트를 통해 Pod Readiness Gate를 사용하는 [https://raw.githubusercontent.com/oracle-devrel/oci-oke-virtual-nodes/main/nginx-svc/nginx.yaml](https://raw.githubusercontent.com/oracle-devrel/oci-oke-virtual-nodes/main/nginx-svc/nginx.yaml) 에서 Nginx 매니페스트를 다운로드하고 이미지 버전을 ``nginx:1.25.1``로 업데이트 한 후 다시 배포해 봅니다.
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.25.1
...
```

```
$ kubectl apply -f ./nginx.yaml -n <namespace>
```

Pod를 확인합니다. (아래는 예시입니다.)
```
$ kubectl get pods -o wide -n <namespace>

NAME                     READY   STATUS    RESTARTS   AGE   IP            NODE          NOMINATED NODE   READINESS GATES
nginx-678976847c-8bqs7   1/1     Running   0          44m   10.0.10.153   10.0.10.253   <none>           1/1
nginx-678976847c-ttqms   1/1     Running   0          47m   10.0.10.201   10.0.10.253   <none>           1/1
```

Pod의 상세 정보를 확인합니다. (아래는 예시입니다.)
```
$ kubectl describe pod nginx-678976847c-ttqms  -n <namespace>

...
Readiness Gates:
  Type                                                             Status
  podreadiness.loadbalancer.oraclecloud.com/f913fe603a9be9b5d51f   True 
Conditions:
  Type                                                             Status
  podreadiness.loadbalancer.oraclecloud.com/f913fe603a9be9b5d51f   True 
  PodScheduled                                                     True 
  Initialized                                                      True 
  Ready                                                            True 
  ContainersReady                                                  True 
```

## Support for flannel when using the OCI native ingress controller
* **Services:** Container Engine for Kubernetes
* **Release Date:** Nov. 8, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
OCI Native Pod Networking CNI Plugin을 사용하는 경우에 대해서만 OCI Native Ingress Controller를 사용 가능하였습니다. 이제 Pod Networking을 위한 CNI로 Flannel CNI Plugin을 사용하는 경우에 대해서도 OCI Native Ingress Controller을 지원합니다.

### Native Ingress Controller를 사용할 때 Native Pod Networking CNI와 Flannel CNI 사용 차이점
1. Native Ingress Controller의 백엔드 추가 범위
* Native Pod Networking CNI를 사용하는 경우에는 Native Ingress Controller Backend로 Pod가 추가됨
* Flannel CNI를 사용하는 경우에는 Native Ingress Controller Backend로 Worker Node가 추가됨. 이 경우 K8s 서비스의 ``externalTrafficPolicy`` 옵션을 통해서 K8s Cluster내의 라우팅 규칙을 정의할 수 있습니다.
  * **externalTrafficPolicy: Cluster:** K8s Cluster내에 있는 모든 Worker Node를 Backend로 추가
  * **externalTrafficPolicy: Local:** 해당 서비스의 Pod가 배포되어 있는 Worker Node만 Backend로 추가

2. Flannel CNI를 사용하는 경우 Native Ingress Controller를 사용하는 경우 서비스 유형이 NodePort인 서비스만 지원

## Support for deploying the Kubernetes Cluster Autoscaler as a cluster add-on
* **Services:** Container Engine for Kubernetes
* **Release Date:** Nov. 20, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengusingclusterautoscaler_topic-Working_with_Cluster_Autoscaler_as_Cluster_Add-on.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengusingclusterautoscaler_topic-Working_with_Cluster_Autoscaler_as_Cluster_Add-on.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Kubernetes Cluster Autoscaler를 Cluster add-on으로 사용할 수 있습니다. Cluster Autoscaler를 Cluster add-on으로 사용하면 구성 및 지속적인 유지 관리가 단순화됩니다.

### Cluster Autoscaler를 Cluster Add-On으로 사용할 경우 이점
* Cluster Autoscaler를 쉽게 Enable 혹은 Disable 가능
* Oracle의 자동 업데이트 여부를 사용자가 선택 가능
* Cluster Autoscaler Add-On 버전을 사용자가 선택 가능
* Key/Value Pair Configuration을 사용하여 Add-On 사용자 정의 관리 지원 (CLI 활용)
  * Key/Value Pair Configuration 예시 (cluster-autoscaler-add-on.json)
    ```
    {
      "addonName": "ClusterAutoscaler",
      "configurations": [
        {
          "key": "nodes",
          "value": "1:5:{{ node pool ocid 1 }}"
        }
      ]
    }
    ```