---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "12월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 12월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - December-2025
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

## API Gateway support for IPv6 and Reserved Public IPs
* **Services:** API Gateway
* **Release Date:** December 03, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayassigningIPv4IPv6addresses-top.htm](https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayassigningIPv4IPv6addresses-top.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OCI API Gateway를 생성할 때 IPv4와 IPv6 지원 방식에 따라 다양한 네트워크 구성을 선택할 수 있게 되었습니다. 기존과 동일하게 IPv4만 사용하는 단일 스택(public/private) 구성이 기본으로 제공되며, 여기에 더해 IPv4와 IPv6를 동시에 지원하는 듀얼 스택 구성, 그리고 IPv6만 사용하는 단일 스택 구성의 API Gateway도 생성할 수 있습니다. 이 모든 구성은 Public 및 Private API Gateway 모두에서 지원됩니다.

또한, Public IPv4 단일 스택 API Gateway 또는 Public IPv4/IPv6 듀얼 스택 API Gateway를 생성할 때, Reserved Public IPv4 주소를 지정할 수 있는 기능이 추가되었습니다. 따라서 API Gateway에 한 번 Reserved IP를 할당해 두면 이후 해당 API Gateway를 삭제하고 새로 생성하더라도 동일한 Reserved IP를 재사용해 다시 할당이 가능합니다. 또한 API Gateway 교체나 재배포 시에도 IP 주소가 변경되지 않으므로, 방화벽 규칙, DNS, 연동 시스템 등 기존 네트워크 설정을 수정할 필요 없이 안정적인 서비스 운영이 가능해졌습니다.

## Oracle Cloud Infrastructure Batch is now available
* **Services:** Batch
* **Release Date:** December 17, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/oci-batch/home.htm](https://docs.oracle.com/en-us/iaas/Content/oci-batch/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI Batch는 HPC 워크로드를 자동으로 실행 및 관리하는 Multi Tenant Cloud Native 서비스입니다. 대규모 연산 집약적 배치 작업(렌더링, 사이언스 시뮬레이션, 미디어 처리, 대규모 데이터 변환 등)을 효율적으로 처리하며, Batch contexts, Job Pools, Jobs, Tasks 구조로 자원을 체계적으로 관리해 수작업 인프라 운영을 줄이고 처리 속도를 높여줍니다.

### OCI Batch Object 간의 주요 관계
OCI Batch는 Batch Context → Job Pool → Job → Task 구조로 배치 워크로드를 관리합니다. 
Batch Context는 Network Settings, Fleets, entitlements, logs, job prioritization 정책 등 전체 실행 환경을 정의하는 최상위 단위이며, Job Pool은 관련 Job들을 묶어 관리, 우선순위, 접근 제어를 구성합니다. Job은 여러 Task를 논리적으로 묶는 단위이고, Task는 실제 실행되는 최소 작업 단위로 실행 환경, 컴퓨트 요구사항, 의존성 등을 포함합니다.

#### Batch Context
* **Network Settings:** Job과 Task가 어떤 네트워크 환경에서 동작할지를 정의
* **Fleets:** Task 실행에 필요한 컴퓨트 리소스(Shape, OCPUs, RAM 등) 구성 및 배치
* **Entitlements:** 라이선스 등의 제한 자원 동시 사용 개수를 제어
* **Job Prioritization:** 여러 Job과 Task가 동시에 리소스를 요구할 때 실행 순서를 결정
* **Logs:** OCI Batch에서 실행되는 Job과 Task의 실행 상태, 진행 상황, 오류 정보를 확인

#### Job Pools
Batch Context는 Job들을 Job Pool로 구성하며, Job Pool은 관련된 Job을 그룹화해 관리와 우선순위 설정을 단순화합니다. Job Pool 태그를 사용해 Job 실행 우선순위, 접근 제어, 스케줄링을 효율적으로 관리할 수 있습니다.

#### Job
Job은 Job Pool 내에서 서로 연관된 작업을 묶는 논리적 단위로, 하나 이상의 Task로 구성됩니다. Job은 Job Pool 태그와 Job 태그를 기반으로 우선순위가 결정되며, Batch Context에 정의된 규칙에 따라 어떤 Job이 먼저 실행될지가 정해집니다.

#### Task
Task는 Job 내에서 실행되는 개별 실행 단위이며, Job 생성 시 정의됩니다. 각 Task는 실행 환경(Task Environment), 필요 컴퓨트 자원(Task Profile), 제한 자원 제어를 위한 Entitlement, 그리고 실행 순서를 보장하는 Task 간 의존성(Task Dependencies) 으로 구성되어, 재사용성과 자원 관리, 실행 제어를 효율적으로 지원합니다.

OCI Batch는 Task를 실행할 때 컨테이너 이미지를 기반으로 실행 환경을 구성합니다. 즉, 각 Task는 컨테이너 안에서 동작하며, 그 컨테이너 이미지가 Task가 실행하는 실제 코드, 라이브러리, 실행 환경을 포함합니다.

### High-Level Batch Workflow
![](https://docs.oracle.com/en-us/iaas/Content/oci-batch/images/batch-objects.png)

> 2026년 1월 23일 기준 애슈번 리전과 마드리드 리전에서만 지원합니다.

## Kubernetes Engine support for a cluster-level default backend NSG for load balancers and network load balancers
* **Services:** Kubernetes Engine
* **Release Date:** December 17, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringloadbalancersnetworkloadbalancers-subtopic.htm#contengcreatingloadbalancer_topic-Specifying_Load_Balancer_Security_Rule_Management_Annotation](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringloadbalancersnetworkloadbalancers-subtopic.htm#contengcreatingloadbalancer_topic-Specifying_Load_Balancer_Security_Rule_Management_Annotation){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OKE 클러스터를 생성하거나 업데이트할 때, 기본 Backend NSG를 클러스터 속성으로 선택적으로 지정할 수 있게 되었습니다. 또한 LoadBalancer Service에서 oci.oraclecloud.com/security-rule-management-mode Annotation 값을 NSG 로 설정하면, Kubernetes Engine은 Load Balancer용 Frontend NSG를 자동으로 생성하여 외부 트래픽에 대한 보안 규칙을 관리하고,
동시에 Load Balancer에서 워커 노드로 전달되는 트래픽에 대해서는 클러스터에 설정된 기본 Backend NSG를 사용합니다.

### IAM 정책 구성
이 구성을 위해서는 다음과 같이 oci-cloud-controller-manager가 NSG를 생성 및 관리할 수 있도록 IAM 정책을 허용해야 합니다. 사전에 미리 생성된 NSG를 사용하는 경우라면 아래 정책만 추가하면 됩니다.
```
ALLOW any-user to manage network-security-groups in compartment <compartment-name> where request.principal.type = 'cluster' 
```

만일 NSG를 새로 생성해야 하거나 Load Balancer 생성 과정에서 VCN 네트워크 리소스를 직접 관리해야 하는 경우라면 다음 IAM 정책도 허용해야 합니다.
```
ALLOW any-user to manage vcns in compartment <compartment-name> where request.principal.type = 'cluster'
ALLOW any-user to manage virtual-network-family in compartment <compartment-name> where request.principal.type = 'cluster'
```

### Using the oci.oraclecloud.com/security-rule-management-mode annotation
다음과 같이 구성하면 LB 앞에 Frondend NSG가 자동 생성되며, 지정된 Backend NSG를 사용하도록 구성됩니다.
```
apiVersion: v1
kind: Service
metadata:
  name: my-nginx-svc
  annotations:
    oci.oraclecloud.com/load-balancer-type: "lb"
    oci.oraclecloud.com/security-rule-management-mode: "NSG"
    oci.oraclecloud.com/oci-backend-network-security-group: "ocid1.networksecuritygroup.oc1.phx.aaaaaa....cwex"
spec:
  type: LoadBalancer
  ports:
    - port: 80
      targetPort: 80
  selector:
    app: nginx
```

다음과 같이 여러개의 Backend NSG를 지정할 수도 있습니다.
```
oci.oraclecloud.com/oci-backend-network-security-group: "ocid1.networksecuritygroup.oc1.phx.aaaaaa....cwex,ocid1.networksecuritygroup.oc1.phx.aaaaaa....jfle,ocid1.networksecuritygroup.oc1.phx.aaaaaa....pkrj"
```

만약 `oci.oraclecloud.com/security-rule-management-mode: "NSG"` 만 사용한다면, Frontend NSG만 생성됩니다. 이 경우에도 Backend NSG는 별도 수동으로 구성할 수 있습니다.