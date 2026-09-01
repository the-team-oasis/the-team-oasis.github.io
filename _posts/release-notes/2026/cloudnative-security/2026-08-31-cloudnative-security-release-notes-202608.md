---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "8월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2026년 8월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2026-cloudnative-security
tags:
  - oci-release-notes-2026
  - Aug-2026
  - cloudnative
#
# Styling
#
header: no
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## Kubernetes Engine support for deploying the AMD GPU Operator cluster add-on
* **Services:** Kubernetes Engine
* **Release Date:** August 03, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-AMD-GPU-Operator-addon.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-AMD-GPU-Operator-addon.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengintroducingclusteraddons.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengintroducingclusteraddons.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/configuration-arguments-amd-gpu-operator.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/configuration-arguments-amd-gpu-operator.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 AMD GPU Operator를 cluster add-on으로 배포할 수 있게 되었습니다. 이 add-on은 AMD GPU workload에 필요한 device plugin, node labeller, metrics exporter, test runner, device configuration manager의 배포와 관리를 자동화해 GPU software stack을 OKE의 add-on lifecycle로 운영할 수 있게 합니다.

### AMD GPU Operator 구성

Cluster add-on을 활성화할 때는 공식 AMD GPU Operator configuration arguments 문서에서 지원되는 설정을 확인하고, GPU node pool에 이미 수동 배포한 동일 구성요소가 있는지 먼저 점검해야 합니다. 표준 add-on으로 전환하면 GPU 인식, node label 게시, metric 수집, GPU 공유 관련 구성의 일관성을 높일 수 있지만, 기존 GPU software 구성과의 중복은 workload scheduling과 관측에 영향을 줄 수 있습니다.

### 노드·드라이버 확인

적용 범위는 AMD GPU workload를 실행하는 node pool을 중심으로 잡고, 사용 중인 OKE 및 add-on version에서 노출되는 configuration argument만 사용해야 합니다. 적용 후에는 add-on 상태와 관련 pod의 정상 기동 여부, AMD GPU resource와 node label의 노출 여부, test runner 및 metrics exporter의 결과를 순서대로 확인해 실제 workload가 GPU를 사용할 수 있는지 검증합니다.

## Updates to OCI Kubernetes Engine (OKE) cluster add-ons
* **Services:** Kubernetes Engine
* **Release Date:** August 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Add-on-release-notes-July-2026-Release-Note.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Add-on-release-notes-July-2026-Release-Note.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller-configuring.htm#contengsettingupnativeingresscontroller_grpclistener](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller-configuring.htm#contengsettingupnativeingresscontroller_grpclistener){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller-configuring.htm#contengsettingupnativeingresscontroller-https_tls__section_configuring-tls-policies](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller-configuring.htm#contengsettingupnativeingresscontroller-https_tls__section_configuring-tls-policies){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE cluster add-on에 WebLogic Kubernetes Operator 4.3.10, Istio 1.29.5, Native Ingress Controller 1.4.5가 추가되었습니다. Certificate Manager는 Kubernetes Gateway API를, ObservabilityAgent는 priority class 설정을 지원하며, Native Ingress Controller는 gRPC listener와 listener·backend set의 cipher suite 및 TLS protocol 지정을 지원합니다.

### Gateway API·gRPC·TLS 반영 지점

Gateway API를 사용하는 인증서 발급 흐름, observability agent의 scheduling 우선순위, gRPC용 OCI Load Balancer listener, TLS policy를 각각 해당 add-on 설정에 반영할 수 있습니다. Ingress 변경은 외부 traffic의 protocol 처리와 TLS 호환성에 직접 영향을 주므로 현재 listener와 backend set을 기준으로 필요한 기능만 단계적으로 활성화합니다.

### 기존 cluster에서 확인할 상태

새 기능은 Release Note에 명시된 add-on version과 실제 cluster에서 선택 가능한 version을 기준으로 적용해야 하며, TLS cipher와 protocol은 client 및 backend가 모두 지원하는 조합이어야 합니다. 변경 후 Gateway API certificate 상태, ObservabilityAgent pod의 priority class, gRPC 요청 성공 여부, TLS handshake와 기존 HTTP workload의 정상 동작을 함께 확인합니다.

## OCI Kubernetes Engine (OKE) support for rolling back managed nodes to an earlier Kubernetes version
* **Services:** Kubernetes Engine
* **Release Date:** August 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng_K8s-version-rollback.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng_K8s-version-rollback.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengupgradingimageworkernode_Rolling-Back.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengupgradingimageworkernode_Rolling-Back.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE managed node pool에서 더 이전의 Kubernetes version을 지정한 뒤 기존 managed node를 교체하는 방식으로 worker node version을 rollback할 수 있게 되었습니다. Control plane을 되돌리는 기능이 아니라 node pool의 managed node를 지원되는 이전 version으로 교체하는 절차라는 점이 핵심입니다.

### 노드 교체와 workload 중단 관리

Rollback 대상 node pool에서 사용할 수 있고 control plane과 호환되는 이전 Kubernetes version을 선택한 뒤 공식 절차에 따라 기존 node를 교체합니다. 선택 가능한 version은 tenancy에 따라 달라질 수 있습니다. 교체 과정의 pod 재배치와 capacity 변화를 고려해 replica, disruption budget, node별 workload를 먼저 확인하고, 작업 전후 node version·pod readiness·cluster add-on·storage와 network 연동 상태를 비교합니다.

## Support for Kubernetes version 1.34.10
* **Services:** Kubernetes Engine
* **Release Date:** August 20, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-K8s-1-34-10-support.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-K8s-1-34-10-support.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

OKE가 Kubernetes 1.34.10을 지원하며, 기존 1.35.2와 1.36.1도 계속 지원합니다. Oracle은 1.34.2 지원을 2026년 9월 22일 종료할 예정이므로 1.34.10, 1.35.2 또는 1.36.1로 즉시 업그레이드할 것을 권고합니다.

## OCI Kubernetes Engine (OKE) support for virtual nodes using persistent volumes backed by File Storage service
* **Services:** Kubernetes Engine
* **Release Date:** August 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng_virtual-nodes-persistent-storage-support.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng_virtual-nodes-persistent-storage-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim_Provisioning_PVCs_on_FSS.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim_Provisioning_PVCs_on_FSS.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE virtual node에서도 File Storage service를 기반으로 하는 PersistentVolume을 사용할 수 있게 되었습니다. 기존 managed node와 self-managed node에 더해 virtual node workload도 File Storage 기반 PVC를 통해 지속성과 공유 파일 접근이 필요한 데이터를 다룰 수 있습니다.

### File Storage 연결 구조

공식 File Storage PVC 절차에 따라 mount target과 network 접근 경로를 준비하고 PersistentVolume 또는 StorageClass, PersistentVolumeClaim을 workload에 연결합니다. Virtual node에 상태 저장 workload를 배치할 수 있는 범위가 넓어지지만, pod lifecycle과 별개로 File Storage의 가용성, 권한, 용량과 mount 경로를 운영해야 합니다.

### Virtual node 적용 조건

이 업데이트는 File Storage service가 지원하는 persistent volume에 대한 것이므로 다른 storage driver의 virtual node 지원으로 확대 해석해서는 안 됩니다. 배포 전 subnet과 보안 규칙, File Storage export 및 mount 권한을 확인하고, 배포 후 PVC가 정상 연결되는지와 pod 재생성 뒤에도 read/write 결과가 유지되는지를 검증합니다.
