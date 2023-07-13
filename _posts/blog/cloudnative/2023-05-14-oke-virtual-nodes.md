---
layout: page-fullwidth
#
# Content
#
subheadline: "CloudNative"
title: "OCI Serverless Kubernetes 환경을 제공하는 가상 노드(Virtual Nodes) 소개"
teaser: "OCI에서 Serverless Kubernetes 환경을 제공하는 가상 노드(Virtual Nodes)에 대해서 알아보고, MSA 기반의 샘플 애플리케이션인 Mushop을 배포해 봅니다."
author: dankim
breadcrumb: true
categories:
  - cloudnative
tags:
  - [oke, virtual nodes]
#
# Styling
#
header: no
#  image:
#    title: /assets/img/cloudnative-security/2022/weblogic_oke_0.png
#     thumb: /assets/img/cloudnative-security/2022/weblogic_oke_0.png
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

### OCI Virtual Nodes 소개
Kubernetes는 컨테이너 애플리케이션의 대규모 클러스터를 관리하기 위한 컨테이너 오케스트레이션의 표준으로, 최근 클라우드 환경에서 최신 애플리케이션을 구축하는데 사용되고 있습니다. 그러나 최근 CNCF(Cloud Native Computing Foundation) 설문 조사에 따르면 Kubernetes 운영의 복잡성은 여전히 채택의 주요 장애물로 남아 있습니다. 다음은 Kubernetes 운영의 복잡성 요소입니다.

* 인프라 크기 조정: Kubernetes는 대규모로 애플리케이션을 관리하고 확장하도록 설계되었습니다. 따라서 CPU 및 메모리와 같은 인프라 리소스 관리와 관련된 작업은 복잡하고 많은 리소스가 필요할 수 있습니다.
* 업그레이드 및 유지 관리: Kubernetes 클러스터를 최신 상태로 유지하려면 정기적인 업데이트 및 유지 관리가 필요합니다. 업그레이드는 복잡할 수 있으며 다운타임을 최소화하기 위해 신중한 계획과 조정이 필요합니다. 업그레이드는 일반적으로 조직의 여러 팀이 참여하는 작업으로 하루 종일 걸릴 수 있습니다.
* 인프라 보안: Kubernetes 보안에는 인프라 강화를 포함하는 여러 측면이 포함됩니다. Kubernetes 클러스터의 인프라가 손상되면 클러스터에서 실행 중인 모든 애플리케이션이 위험에 노출됩니다. 인프라를 강화하고 액세스를 제한하며 보안 패치를 적시에 적용해야 합니다.

OCI Virtual Nodes는 Serverless Kubernetes 경험을 제공함으로서 이러한 Kubernetes 운영 오버헤드를 없애줍니다. Virtual Nodes를 사용하면 Pod 수준의 탄력성과 Pod 단위의 가격을 제공하며, Worker Node 인프라의 관리, 확장, 업그레이드 및 문제 해결에 대한 운영 오버헤드를 없앨 수 있습니다. Oracle은 클러스터의 Control Plane과 Data Plane을 관리하며, 사용자는 Kubernetes API를 통해 배포된 애플리케이션에 대해서만 관리합니다.

### OCI Virtual Nodes 아키텍처
앞서 언급한 것처럼 OCI Virtual Nodes는 Serverless이며 OCI에서 Kubernetes API를 통해 배포된 애플리케이션을 제외하고 모든것을 관리합니다. Virtual Nodes는 클러스터내에서 기존 Kubernetes 노드처럼 보이지만, 실제로는 완전히 새로운 형태의 노드입니다. Virtual Nodes는 컨테이너 런타임을 위해 Container Instances 구성을 활용합니다. 여기 [OCI Container Instances 소개 및 Spring Boot Application 배포해보기](https://the-team-oasis.github.io/cloudnative/oci-container-Instances/)에서 Container Instances에 대한 관련 내용을 확인할 수 있습니다. 아래 그림에서 알 수 있듯이 하나의 Pod는 하나의 Container Instance에 매핑이 되는 구조입니다.

***Virtual Nodes 개요***
![](https://blogs.oracle.com/content/published/api/v1.1/assets/CONTDF219277FEEA4A3FA0469402F6E19E27/native?cb=_cache_15b8&channelToken=f7814d202b7d468686f50574164024ec)

Virtual Nodes는 오픈 소스 CNCF(Cloud Native Computing Foundation)의 [Virtual Kubelet](https://virtual-kubelet.io/) 프로젝트를 사용하여 OCI Container Instance와 Kubernetes 간 변환 계층을 제공합니다.

***Virtual Nodes 아키텍쳐***
![](https://blogs.oracle.com/content/published/api/v1.1/assets/CONT3CDD66507EA44BB5B0211698E725629A/native?cb=_cache_15b8&channelToken=f7814d202b7d468686f50574164024ec)

Virtual Nodes의 주요 요소는 다음과 같습니다.
* Pod 관리: OKE Managed Nodes (기존 OKE Node를 Managed Node라 부름)와 마찬가지로 Virtual Nodes 또한 Pod에 대한 수명주기를 관리하고 상태를 Kubernetes에 보고하는 역할을 합니다. 단 Virtual Nodes는  하나의 노드당 최대 500개 Pod까지 확장 가능합니다.
* HTTPS kubelet API: Virtual Node를 위한 HTTPS API로 Pod 로그 수집, Pod 실행, Pod 연결, 자동 확장을 위한 Pod 메트릭 수집 등을 담당하는 트래픽을 제공합니다.

### Virtual Node 특징 및 제약사항
* **리소스 할당:** Managed Node와 다르게 Virtual Node의 리소스 할당은 Workder Node 수준이 아닌 Pod 수준에서 이루어집니다. 즉 Pod 수준에서 CPU 및 메모리 사양이 지정됩니다. Virtual Node에서 프로비저닝된 Pod에 할당된 CPU와 메모리 양을 계산할 때 다음을 고려합니다.
  * Pod 스펙에 지정된 각 컨테이너 별 CPU와 메모리
  * Pod에 있는 컨테이너 개수
  * kube-proxy와 컨테이너 런타임 최소 필요 (메모리: 0.25GB, CPU: 무시할 수 있는 수준)
  * 기본적으로 Pod에서 필요로 하는 CPU 및 메모리 최소값: 0.125 OCPU, 0.5GB 메모리
  * Pod 스펙에 Limits이 있지만, Requests가 정의되어 있지 않은 경우 Limits 값을 참조
  * Pod 스펙에 Requests가 정의되어 있지만, Limits이 정의되어 있지 않은 경우 Requests 값을 참조
  * Pod 스펙에 Limits과 Requests가 모두 지정되어 있는 경우 Limits 값을 참조
  * Pod 스펙에 Limits과 Requests가 지정되어 있지 않은 경우 컨테이너당 0.125 OCPU 및 0.5GB를 사용
  * Virtual Node에서 프로비저닝된 Pod는 한도와 요청을 동일한 값으로 설정하는 것을 권장
* **로드 밸런싱:** Managed Node와 동일하게 Load Balancing은 Pod 사이에 위치합니다. Virtual Node에서는 Load Balancer Security List가 자동으로 활성되지 않으며, 수동으로 구성해야 합니다. Virtual Node에서 실행중인 Pod에 연결할 때 **<node-ip>:<nodeport>**가 아닌 **<pod-ip>:<nodeport>**로 구문을 사용합니다. Pod 및 Node가 서로 다른 서브넷에 위치한 경우 Pod 서브넷에서 Node Port Ingress 구성을 해야 합니다.
* **포드 네트워킹:** VCN-Native Pod Networking만 지원됩니다(Flannel CNI 플러그인은 지원되지 않음). 이 외에 Managed Node와 다음과 같은 구성 차이가 있습니다.
  * 하나의 VNIC만 각 Virtual Node에 연결됩니다.
  * Pod가 생성되기 전에 IP 주소가 미리 할당되지 않습니다.
  * VCN-Native Pod Networking CNI 플러그인은 kube-system 네임스페이스에서 실행 중인 것으로 보이지 않습니다.
  * VCN-Native Pod Networking만 지원되므로 Pod 서브넷 라우팅 테이블에는 NAT 게이트웨이(인터넷 게이트웨이 아님) 및 서비스 게이트웨이에 대해 정의된 라우팅 규칙이 있어야 합니다.
* **자동 확장:** Virtual Node는 500개의 포드까지 자동으로 확장됩니다. 오라클은 Virtual Node하에서 리소스를 관리하기 때문에 Horizontal Pod Autoscaler (HPA)로 관리합니다. Kubernetes Cluster Autoscaler(Virtual Node에서 지원 안함)를 사용할 필요 없고, Vertical Pod Autoscaler 또한 Virtual Node에서 지원하지 않습니다.

기타 Virtual Node에 대한 제약 사항은 다음 문서의 **Notable Kubernetes features and capabilities not supported when using virtual nodes** 항목과 **Common deployments not supported, and supported differently, when using virtual nodes** 항목을 참고합니다.

[https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcomparingvirtualwithmanagednodes_topic.htm#contengusingvirtualormanagednodes_topic](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcomparingvirtualwithmanagednodes_topic.htm#contengusingvirtualormanagednodes_topic)

### OKE Enhanced Cluster 및 Virtual Node Pool 생성
이제 OKE Cluster는 기존 Managed Node 형태로 제공되는 **Basic Cluster**와 여러 기능을 포함하는 **Enhanced Cluster**로 구분됩니다. 아래 링크로 들어가면 OKE Enhanced Cluster의 릴리스 발표 내용을 볼 수 있습니다.

[https://the-team-oasis.github.io/release-notes-2023-cloudnative-security/cloudnative-security-release-notes-202303/#enhanced-clusters-now-available](https://the-team-oasis.github.io/release-notes-2023-cloudnative-security/cloudnative-security-release-notes-202303/#enhanced-clusters-now-available)

Enhanced Cluster에서 지원되는 기능은 다음과 같습니다.
* 가상 노드(Virtual Nodes) 사용으로 노드 관리 단순화
* 좀 더 세분화된 방법으로 Cluster add-ons을 배포하고 구성
* Workload identity를 통해 보안 강화
* 하나의 클러스터에서 더 많은 워커노드 지원
* Kubernetes API 서버 가동 시간 및 가용성에 대한 SLA 지원

OKE Cluster 생성 시 노드 유형을 **가상(Virtual)**를 선택하거나 **Cluster Add-ons(빠른 생성이 아닌 사용자정의 생성인 경우 선택 가능)** 기능을 선택하게 되면 해당 클러스터는 자동으로 Enhanced Cluster로 동작합니다. 참고로 Enhanced Cluster는 Basic Cluster와 다르게 Cluster 관리 비용이 발생합니다. ($0.10 / Cluster Per Hour)

이제 OKE Enhanced Cluster 및 Virtual Nodes Pool을 생성해 보도록 하겠습니다.
1) OCI Console에서 ***개발자 서비스 > Kubernetes 클러스터(OKE)***를 차례로 클릭합니다.
  ![](/assets/img/cloudnative-security/2023/oke-virtual-nodes-1.png " ")

2) 여기서는 **빠른 생성** 기능을 통해서 클러스터와 관련된 VCN도 자동으로 같이 생성하도록 하겠습니다.
  ![](/assets/img/cloudnative-security/2023/oke-virtual-nodes-2.png " ")

3) 다음과 같이 입력 및 선택합니다.
  * 이름: VirtualNodesCluster1
  * 구획: 클러스터를 생성할 구획을 선택합니다.
  * Kubernetes 버전: v1.26.2 (글을 작성하는 시점에서의 최신 버전입니다.)
  * Kubernetes API 끝점: 공용 끝점
  * 노드 유형: 가상 노드(Virtual)
  * 노드 수: 3
  * POD 구성: Pod.Standard.E4.Flex (AMD Shape으로 최대 64 OCPU(128 vCPU), 1TB 메모리 지원)

  ![](/assets/img/cloudnative-security/2023/oke-virtual-nodes-3.png " ")

4) 모든 내용을 검토한 후 **클러스터 생성** 버튼을 클릭합니다.
  ![](/assets/img/cloudnative-security/2023/oke-virtual-nodes-4.png " ")

5) 클러스터 목록에서 생성된 클러스터를 확인할 수 있습니다.
![](/assets/img/cloudnative-security/2023/oke-virtual-nodes-5.png " ")

6) 클러스터 세부 정보에서 클러스터 유형이 **고급(Enhanced)** 인 것을 확인할 수 있습니다.
![](/assets/img/cloudnative-security/2023/oke-virtual-nodes-6.png " ")

### Mushop 배포 (MSA 기반의 이커머스 애플리케이션(Polygrot)) 및 부하 테스트
Mushop은 오라클에서 제공하는 MSA 기반의 이커머스 데모 애플리케이션으로 여러 언어로 개발된 Polygrot 마이크로 서비스 애플리케이션입니다. 현재 Helm Chart 형태로 제공되고 있습니다.

1) 먼저 다음 git clone 명령어로 mushop Helm Chart를 다운받습니다.
  ```
  $ git clone https://github.com/oracle-quickstart/oci-cloudnative.git mushop
  ```

2) mushop 폴더로 이동한 후 Helm Chart를 실행합니다. 사전에 Helm이 설치되어 있어야 합니다.
  ```
  $ cd mushop
  $ helm install mushop ./deploy/complete/helm-chart/mushop -f ./deploy/complete/helm-chart/mushop/values-virtual-nodes.yaml
  ```

3) 다음과 같이 총 7개의 Pod가 생성된 것을 확인할 수 있습니다.
```
$ kubectl get pod -n default
NAME                                  READY   STATUS      RESTARTS   AGE
mushop-api-6cbb9957fc-4qnr6           1/1     Running     0          84s
mushop-assets-687c574c68-7qm5h        1/1     Running     0          84s
mushop-assets-deploy-1-zl7pw          0/1     Completed   0          83s
mushop-edge-645bc886c7-swjtk          1/1     Running     0          84s
mushop-fulfillment-76f98cddbb-smfsx   1/1     Running     0          84s
mushop-session-67bc86d446-n6999       1/1     Running     0          84s
mushop-storefront-5747bd4644-b2ttp    1/1     Running     0          84s
```

4) External IP를 다음 명령어로 확인합니다.
```
$ kubectl get svc edge
NAME   TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
edge   LoadBalancer   10.96.251.27   140.83.xx.xxx  80:30392/TCP   2m17s
```

> External IP로 접속이 안될 수 있습니다. 이 경우 VCN Subnet의 Security List 구성이 필요한데, [Mushop 애플리케이션 접속을 위한 Security List 구성](#mushop-애플리케이션-접속을-위한-security-list-구성)을 참고합니다.

5) Mushop의 HPA 구성을 보면, 최대 10개까지 Pod가 확장될 수 있음을 알 수 있습니다.
> 하나의 Virtual Node는 최대 500개까지 Pod를 확장할 수 있습니다. 또한 Pod에 대한 HPA 구성은 사용자가 직접 구성하여야 합니다. K8s HPA에 대한 내용은 https://kubernetes.io/ko/docs/tasks/run-application/horizontal-pod-autoscale/ 에서 확인합니다.
```
$ kubectl get hpa
NAME                REFERENCE                      TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
mushop-api          Deployment/mushop-api          0%/70%    1         10        1          3m44s
mushop-assets       Deployment/mushop-assets       0%/70%    1         10        1          3m44s
mushop-edge         Deployment/mushop-edge         0%/70%    1         10        3          3m44s
mushop-storefront   Deployment/mushop-storefront   0%/70%    1         10        2          3m44s
```

6) 부하를 주기위한 시뮬레이션 파드를 배포합니다.
```
$ kubectl create -f https://raw.githubusercontent.com/oracle-quickstart/oci-cloudnative/master/src/load/load-dep.yaml
```

7) 다시 확인해 보면 Replicas가 최대치로 늘어난 것을 확인할 수 있습니다.
```
$ kubectl get hpa
NAME                REFERENCE                      TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
mushop-api          Deployment/mushop-api          0%/70%    1         10        10         8m8s
mushop-assets       Deployment/mushop-assets       0%/70%    1         10        10         8m8s
mushop-edge         Deployment/mushop-edge         13%/70%   1         10        10         8m8s
mushop-storefront   Deployment/mushop-storefront   8%/70%    1         10        10         8m8s
```

### Mushop 애플리케이션 접속을 위한 Security List 구성
Managed Node와는 다르게 Load Balancer 서비스를 생성할 때 자동으로 Security List에 Ingress 및 Egress Rule이 추가되지 않습니다. 따라서 사용자는 수동으로 Security List의 Rule을 구성해줘야 합니다. 관련된 공식 문서는 다음 링크를 참고하세요.

[https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengnetworkconfig.htm#securitylistconfig__security_rules_for_load_balancers](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengnetworkconfig.htm#securitylistconfig__security_rules_for_load_balancers)

1) 먼저 Load Balancer를 위한 Subnet에 대한 Security List를 구성해야 합니다. 만일 **빠른 생성**으로 클러스터를 생성하였다면 **oke-svclbseclist-**라는 이름으로 시작하는 Security List에 추가하면 됩니다.

<summary><b>Load Balancer Subnet의 Ingress Rule</b></summary>
<div markdown="1">
<table class="table vl-table-bordered vl-table-divider-col" summary="This table summarizes basic information about each region"><caption></caption><colgroup><col><col><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1">State</th>
      <th class="entry" id="About__entry__2">Source</th>
      <th class="entry" id="About__entry__3">Protocol/Dest. Port</th>
      <th class="entry" id="About__entry__4">Description</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Stateful</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">0.0.0.0/0 or specific CIDR</span>
      </td>
      <td class="entry" headers="About__entry__3">TCP/443</td>
      <td class="entry" headers="About__entry__4">Allow inbound traffic to Load Balancer.
<span class="ph"></span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Stateful</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">0.0.0.0/0 or specific CIDR</span>
      </td>
      <td class="entry" headers="About__entry__3"><span class="ph">TCP/80</span></td>
      <td class="entry" headers="About__entry__4"><span class="ph">Allow inbound traffic to Load Balancer.</span>
      </td>
      </tr>
    </tbody>
  </table>
</div>

<summary><b>Load Balancer Subnet의 Egress Rule</b></summary>
<div markdown="1">
<table class="table vl-table-bordered vl-table-divider-col" summary="This table summarizes basic information about each region"><caption></caption><colgroup><col><col><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1">State</th>
      <th class="entry" id="About__entry__2">Source</th>
      <th class="entry" id="About__entry__3">Protocol/Dest. Port</th>
      <th class="entry" id="About__entry__4">Description</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Stateful</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">Worker nodes CIDR</span>
      </td>
      <td class="entry" headers="About__entry__3"><span class="ph">ALL/30000-32767</span></td>
      <td class="entry" headers="About__entry__4"><span class="ph">Allow traffic to worker nodes.</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Stateful</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">Worker node subnet CIDR</span>
      </td>
      <td class="entry" headers="About__entry__3">ALL/10256</td>
      <td class="entry" headers="About__entry__4">Allow OCI load balancer or network load balancer to communicate with kube-proxy on worker nodes.
<span class="ph"></span>
      </td>
      </tr>
    </tbody>
  </table>
</div>

2) 다음은 Virtual Node를 위한 Subnet에 대한 Security List를 구성합니다. 만일 **빠른 생성**으로 클러스터를 생성하였다면 **oke-nodeseclist-**라는 이름으로 시작하는 Security List에 추가하면 됩니다.

<summary><b>Virtual Node Subnet의 Ingress Rule</b></summary>
<div markdown="1">
<table class="table vl-table-bordered vl-table-divider-col" summary="This table summarizes basic information about each region"><caption></caption><colgroup><col><col><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1">State</th>
      <th class="entry" id="About__entry__2">Source</th>
      <th class="entry" id="About__entry__3">Protocol/Dest. Port</th>
      <th class="entry" id="About__entry__4">Description</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Stateful</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">Load balancer or network load balancer subnet CIDR</span>
      </td>
      <td class="entry" headers="About__entry__3">ALL/10256</td>
      <td class="entry" headers="About__entry__4">Allow OCI load balancer or network load balancer to communicate with kube-proxy on worker nodes.
<span class="ph"></span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Stateful</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">0.0.0.0/0 or specific CIDR</span>
      </td>
      <td class="entry" headers="About__entry__3"><span class="ph">ALL/30000-32767</span></td>
      <td class="entry" headers="About__entry__4"><span class="ph">Allow worker nodes to receive connections through OCI Network Load Balancer.</span>
      </td>
      </tr>
    </tbody>
  </table>
</div>

3) External IP로 접속하면 다음과 같은 화면을 볼 수 있습니다.
```http://140.83.xx.xxx/```

![](/assets/img/cloudnative-security/2023/oke-virtual-nodes-7.png " ")