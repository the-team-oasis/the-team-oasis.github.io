---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "5월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 5월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - May-2023
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

## Support for on-demand node cycling
* **Services:** Container Engine for Kubernetes
* **Release Date:** May 2, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/f018e024-65d0-4f87-a1e0-dc1ba0d30e48/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/f018e024-65d0-4f87-a1e0-dc1ba0d30e48/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Managed Worker Node에 대한 On-demand Node Cycling 기능을 지원합니다. 이 기능이 출시되기 전에는 Node Pool 속성(Shape, Image, OCPU 등)이나 OS 버전을 업그레이드를 위해 Node Pool의 내용을 변경하면, 기존 Node에는 적용이 되지 않고 새로 생성되는 Node에만 적용이 되었습니다. 기존 Node 적용을 위해서는 Drain등의 작업을 포함한 재 생성 작업을 수행했어야 했습니다. 또한 Worker Node 쿠버네티스 버전 업그레이드의 경우도 Control Plane 업그레이드 후 별도의 Worker Node 업그레이드를 위한 Drain을 포함한 작업이 필요했습니다.

Node Cycling 기능은 Worker Node에 대한 쿠버네티스 버전 업그레이드 및 Worker Node Pool 속성 변경이 필요한 경우, Worker Node에 대한 Cordon, Drain, Terminate 작업을 자동화해 주는 기능입니다.

> Node Cycling은 Enhanced Cluster에서만 사용할 수 있습니다.

### Node Cycling 전략
Node Cycling에는 다음의 두 가지 전략을 사용할 수 있습니다.
1. 새 Worker Node를 생성한 후에 기존 Worker Node 삭제
최신 버전으로 업그레이드된 Worker Node 혹은 업그레이드된 Node Pool 속성이 반영된 Worker Node를 새로 생성한 후, 생성 및 활성화가 완료되면 기존 Worker Node를 차단하고 Node Pool에서 제거합니다. 이 전략은 가용성 측면에서 이점이 있지만, 추가된 노드와 기존 노드가 같이 존재할 수 있으므로 비용이 더 발생할 수 있습니다.

2. 기존 Worker Node를 제거한 후에 새 Worker Node 생성
기존 Node Pool에 있는 Worker Node를 사용할 수 없도록 차단 및 Node Pool에서 제거합니다. Node가 모두 제거되면 기존 Worker Node를 대체하기 위한 새로운 Worker Node를 Node Pool에 추가합니다. 이 전략은 비용이 적게 들 수 있지만, 가용성이 저하될 수 있습니다.

### maxSurge, maxUnavailable
두 가지 전략 선택을 위해 maxSurge, maxUnavailable라는 옵션을 활용합니다. 해당 옵션은 Node Pool의 **Cycle nodes** 버튼을 클릭하면 볼 수 있습니다.

![]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2023/2023-05-28-cloudnative-security-release-notes-1.png)

* maxSurge
  * 업그레이드 작업 중에 일시적으로 허용할 추가 Workder Node 수입니다. 추가 Worker Node 수가 많을수록 병렬로 업그레이드할 Node수가 많아지므로, 더 높은 가용성을 확보할 수 있으나, 비용은 상승할 수 있습니다.
* maxUnavailable
  * 업그레이드 작업 중에 기존 노드에 대해 사용할 수 없도록 허용할 Worker Node 수입니다. 사용할 수 없도록 허용하는 Worker Node 수가 많을수록 비용증가 없이 병렬로 업그레이드 할 Node수가 많아집니다. 하지만 이 수가 높을수록 가용성이 저하될 수 있습니다.
* maxSurge 또는 maxUnavailable값을 지정하지 않는 경우 기본 값은 maxSurge는 1, maxUnavailable는 0 입니다.
* maxSurge 값만 지정하는 경우 maxUnavailable의 기본값은 0입니다.
* maxUnavailable 값만 지정하는 경우 maxSurge 기본값은 1입니다.
* maxSurge와 maxUnavailable 값은 모두 0으로 지정할 수 없습니다.
* 새 Worker Node를 생성한 후에 기존 Worker Node 삭제 전략의 경우 예시
  * maxSurge=1, maxUnavailable=0
* 기존 Worker Node를 제거한 후에 새 Worker Node 생성
  * maxSurge=1, maxUnavailable=1

### 주의사항
* 새 Worker Node를 생성한 후에 기존 Worker Node 삭제 전략을 사용하는 경우, 생성할 자원에 대한 충분한 할당량을 확인하여야 합니다.
* 만일 업그레이드 과정중에 maxUnavailable 값을 지정하였지만, [Pod Disruption Budget(PDB)](https://kubernetes.io/docs/tasks/run-application/configure-pdb/)을 이유로 Node Pool에서 maxUnavailable을 지정할 수 없는 경우 작업이 실패할 수 있습니다.
* kubectl 명령어를 통해서 Worker Node를 직접 업그레이드 하는 경우(e.g Node에 Custom tag 지정하는 경우), Cycle nodes 작업을 수행하면 kubectl 작업은 수행되지 않습니다.
* Node Cycling작업은 최대 30분이내에 완료되어야 합니다. 만일 30분이 지나면 작업요청의 상태가 **Failed**로 변경됩니다. 만일 업그레이드할 Node가 1000개일 때 maxSurge를 1로 설정했다면, 오랜 시간동안 Node Cycling이 수행될 수 있습니다. **Failed** 후 다시 재개하기 위해서는 다른 Node Cycling을 수행해야 합니다.

---

## Ability to create up to 64 EmptyDir volumes per container instance
* **Services:** Container Instances
* **Release Date:** May 9, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/api/#/en/container-instances/20210415/datatypes/ContainerEmptyDirVolume](https://docs.oracle.com/en-us/iaas/api/#/en/container-instances/20210415/datatypes/ContainerEmptyDirVolume){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Container Instance당 64개까지 EmptyDir Volume을 생성할 수 있습니다. 

EmptyDir은 Pod가 생성될 때 같이 생성되고, 삭제될 때 같이 생성되는 임시 Volume입니다. 생성되는 시점에는 아무런 데이터가 없기 때문에 EmptyDir이라고 부릅니다. 

Container를 생성할 때 EmptyDir Volume을 마운트하면 Container Instances내의 Container간 데이터를 서로 공유할 수 있습니다.

---

## Support to store image pull secrets in OCI Vault
* **Services:** Container Instances
* **Release Date:** May 9, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/container-instances/vault-secrets-image-authorization.htm](https://docs.oracle.com/en-us/iaas/Content/container-instances/vault-secrets-image-authorization.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Container Instancs에서 Private Container Registry에서 Image Pull을 위한 인증정보(Username, Password)를 OCI Valut에 저장하여 사용할 수 있습니다.

### Container Instnaces에서 Valut 접근을 위한 정책 설정
Container Instnaces에서 Valut 접근을 위해서는 다음과 같이 Dynamic Group과 Policy를 생성해야 합니다.

* Dynamic Group
  ```
  ALL {resource.type='computecontainerinstance'}
  ```
* Policy
  ```
  allow dynamic-group <dynamic-group-name> to read secret-bundles in tenancy
  ```

### Vault에 Secret 등록
Valut에 Secret 등록 시 다음과 같은 포멧으로 등록해야 합니다.
```
{
 "username": "container-instance-user",
 "password": "<password>"
}
```

### Container Instances 생성 시 Valut 활용
아직은 OCI Console에서 Valut 사용을 위한 UI를 제공하지 않기 때문에 CLI를 활용하여 Container Instance를 생성합니다. 먼저 다음과 같은 JSON 템플릿이 필요합니다. 다음 템플릿에서 **secretId** 부분을 앞에서 생성한 Secret의 OCID로 대체합니다.

```
{
  "containers": [
    {
      "imageUrl": "example.registry.io/container-instance-user/example-image:latest",
      < ... other fields ... >
    }
  ],
  "imagePullSecrets": [
    {
      "secretType": "VAULT",
      "registryEndpoint": "example.registry.io/container-instance-user",
      "secretId": "ocid1.vaultsecret.oc1.<region_code>.<unique_ID>"
    }
  ],
  < ... other fields ... >
}
```

OCI CLI 명령어로 다음과 같이 실행합니다.
```
oci container-instances container-instance create --from-json file://ci-template.json
```

---

## CRI parser now available in Logging
* **Services:** Logging
* **Release Date:** May 24, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/Logging/Concepts/log_inputs_and_parsers.htm](https://docs.oracle.com/en-us/iaas/Content/Logging/Concepts/log_inputs_and_parsers.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Logging 서비스에서 사용자 정의 로그(Custom Logs)를 수집하기 위한 새로운 CRI(Container Runtime Interface) Parser를 사용할 수 있게 되었습니다. 새롭게 추가된 CRI Parser는 OKE 환경에서 FluentD CRI 로그를 Logging 서비스에서 수집할 수 있도록 도와줍니다. CRI 로그는 다음과 같은 형태로 구성됩니다.

```
2020-10-10T00:10:00.333333333Z stdout F Hello Fluentd

time: 2020-10-10T00:10:00.333333333Z
stream: stdout
logtag: F
message: Hello Fluentd
```

Fluent CRI Parser에 대한 자세한 설명은 다음 Github 문서를 참고합니다.

[https://github.com/fluent/fluent-plugin-parser-cri](https://github.com/fluent/fluent-plugin-parser-cri)

---

## Support for OCI Native Ingress Controller
* **Services:** Container Engine for Kubernetes
* **Release Date:** May 31, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
Kubernetes에서 Ingress Controller는 Cluster로 유입되는 트래픽을 Cluster내의 적절한 서비스로 라우팅할 수 있도록 하는 핵심 요소입니다. 기존에는 NGINX 혹은 Traefik과 같은 오픈소스 Ingress Controller만 지원하였는데, 이제 Oracle Kubernetes Engine(OKE)에서 Native Ingress Controller를 지원하게 되었습니다.

Native Ingress Controller는 라우터 역할을 하는 OCI Load Balancer와 통합되며, OCI 인증서 서비스를 통해서 TLS/SSL 통신 설정에 사용되는 인증서를 관리하게 됩니다.

**OCI Native Ingress Controller 아키텍처**
![]({{site.urlblogimg2023}}{{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2023/2023-05-28-cloudnative-security-release-notes-2.png)

### 제약사항
OCI Native Ingress Controller는 다음의 제약 사항을 가지고 있습니다.
* Kubernetes Cluster 1.25.4 버전 이상부터 사용 가능
* OCI VCN-Native Pod Networking CNI 플러그인에서만 사용 가능
* 다른 OCI 리소스 접근을 위해서는 Instance Principal을 사용
* Virtual Nodes에서는 사용 불가
* Workload Identity Principals을 사용하는 경우 사용 불가

### 사용 절차
1. [User Principal](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm#contengsettingupnativeingresscontroller-auth__section_userprincipalauthenticaton) 혹은 [Instance Principal](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm#contengsettingupnativeingresscontroller-auth__section_instanceprincipalauthenticaton) 설정
2. Cert Manager 설치
3. Helm CLI 설치
4. [OCI Native Ingress Controller 설치](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm#contengsettingupnativeingresscontroller-deployment)
5. [IngressClassParameters, IngressClass, Ingress 리소스 생성](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm#contengsettingupnativeingresscontroller-createresources)
6. [Ingress에 Route Rule 설정](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm#contengsettingupnativeingresscontroller-specifyingrouterules)
7. [추가적으로 Ingress Controller를 위한 Annotation 설정](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm#contengsettingupnativeingresscontroller-annotationcustomization)

### 참고
* [Setting Up the OCI Native Ingress Controller on a Kubernetes Cluster](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller.htm)
* [Example: Setting Up an Nginx Ingress Controller on a Cluster](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupingresscontroller.htm)