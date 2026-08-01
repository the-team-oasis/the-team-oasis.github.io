---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2026년 7월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2026-cloudnative-security
tags:
  - oci-release-notes-2026
  - Jul-2026
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


## OpenShift Container Platform on OCI adds autoscaling support
* **Services:** OpenShift Container Platform on OCI
* **Release Date:** July 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/openshift-container-platform-on-oci/autoscaling-compute-openshift.htm](https://docs.oracle.com/iaas/releasenotes/openshift-container-platform-on-oci/autoscaling-compute-openshift.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OpenShift Container Platform on OCI에서 autoscaling 지원이 추가되었습니다. 워크로드 수요 변화에 따라 Compute 리소스를 더 유연하게 조정할 수 있습니다.

### 운영 시 참고 사항

Autoscaling 적용 전 최소·최대 노드 수, shape quota, 비용 상한, 애플리케이션 scale-out 특성을 확인해야 합니다. 운영 환경에서는 스케일 이벤트와 애플리케이션 지연 시간을 함께 관측하는 것이 좋습니다.

## Kubernetes Engine support for deploying the Node Feature Discovery cluster add-on
* **Services:** Kubernetes Engine
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Node-Feature-Discovery-addon.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Node-Feature-Discovery-addon.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 Node Feature Discovery cluster add-on 배포를 지원합니다. 노드의 CPU, 장치, 커널, 하드웨어 특성을 Kubernetes label로 노출해 워크로드 스케줄링에 활용할 수 있습니다.

### 운영 시 참고 사항

특정 하드웨어 특성에 의존하는 워크로드는 label 변경 시 배치가 달라질 수 있습니다. add-on 활성화 후 node label과 scheduler rule을 점검해야 합니다.

## Kubernetes Engine support for deploying the NVIDIA GPU Operator cluster add-on
* **Services:** Kubernetes Engine
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NVIDIA-GPU-Operator-addon.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NVIDIA-GPU-Operator-addon.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 NVIDIA GPU Operator cluster add-on 배포를 지원합니다. GPU 드라이버, device plugin, 관련 구성요소 운영을 Kubernetes add-on 방식으로 다룰 수 있습니다.

### 운영 시 참고 사항

GPU Operator는 GPU 워크로드 안정성과 직접 연결됩니다. 적용 전 GPU shape, 드라이버 호환성, 기존 수동 설치 구성과 충돌 여부를 확인하는 것이 좋습니다.

## Kubernetes Engine support for deploying the NVIDIA Network Operator cluster add-on
* **Services:** Kubernetes Engine
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NVIDIA-Network-Operator-addon.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NVIDIA-Network-Operator-addon.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 NVIDIA Network Operator cluster add-on 배포를 지원합니다. 고성능 네트워킹이 필요한 GPU/HPC 워크로드의 네트워크 구성요소 운영을 add-on으로 표준화할 수 있습니다.

### 운영 시 참고 사항

RDMA나 고성능 네트워킹을 사용하는 클러스터는 노드 shape, 네트워크 plugin, workload 요구사항을 함께 검토해야 합니다. 변경 전 테스트 클러스터에서 통신 성능과 안정성을 확인하는 것이 좋습니다.

## Kubernetes Engine support for deploying the CSI driver SMB cluster add-on
* **Services:** Kubernetes Engine
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-CSI-Driver-SMB-addon.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-CSI-Driver-SMB-addon.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 CSI Driver SMB cluster add-on 배포를 지원합니다. Kubernetes 워크로드가 SMB 기반 파일 공유를 더 표준적인 CSI 방식으로 사용할 수 있습니다.

### 운영 시 참고 사항

SMB 스토리지 연결에는 네트워크 접근성, 인증 정보, mount option이 중요합니다. Secret 관리와 namespace 권한 범위를 최소화하고, 재시작 시 mount 복구를 검증해야 합니다.

## OCI Kubernetes Engine (OKE) support for 20,000 worker nodes per Kubernetes cluster
* **Services:** Kubernetes Engine
* **Release Date:** July 08, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng_20000-node-support.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng_20000-node-support.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE 클러스터당 최대 20,000개 worker node를 지원합니다. 대규모 클러스터 운영과 고밀도 워크로드 배치 시 확장 한도가 크게 확대됩니다.

### 운영 시 참고 사항

대규모 클러스터는 control plane, IP 주소 계획, observability, upgrade 전략이 중요합니다. 실제 설계에서는 VCN/Subnet CIDR, pod density, 노드 풀 분리, 장애 도메인 분산을 함께 검토해야 합니다.

## Support for Kubernetes version 1.36.1
* **Services:** Kubernetes Engine
* **Release Date:** July 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-K8s-1-36-1-support.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-K8s-1-36-1-support.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 Kubernetes version 1.36.1을 지원합니다. 최신 Kubernetes 기능과 보안 수정 사항을 OKE 클러스터 수명주기 안에서 사용할 수 있습니다.

### 운영 시 참고 사항

업그레이드 전 deprecated API, admission controller, CNI/CSI/add-on 호환성을 확인해야 합니다. 운영 클러스터는 node pool 순차 업그레이드와 rollback 계획을 준비하는 것이 좋습니다.

## OCI Kubernetes Engine (OKE) support for on-demand virtual node cycling
* **Services:** Kubernetes Engine
* **Release Date:** July 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-virtual-node-cycling-release-note.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-virtual-node-cycling-release-note.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 on-demand virtual node cycling을 지원합니다. Virtual Node를 필요 시 교체해 업데이트나 상태 정리를 더 유연하게 수행할 수 있습니다.

### 운영 시 참고 사항

Node cycling은 실행 중인 Pod에 영향을 줄 수 있습니다. PodDisruptionBudget, replica 수, readiness probe, 배포 시간대를 확인하고 무중단 전환 가능성을 검증해야 합니다.
