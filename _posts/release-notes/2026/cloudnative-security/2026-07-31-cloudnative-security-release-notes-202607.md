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

## OCI Kubernetes Engine (OKE) support for on-demand virtual node cycling
* **Services:** Kubernetes Engine
* **Release Date:** July 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-virtual-node-cycling-release-note.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-virtual-node-cycling-release-note.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Performing an In-Place Virtual Node Update by Cycling Virtual Nodes in an Existing Virtual Node Pool](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengcreatingvirtualnodesupdatedprops_topic-Performing_an_InPlace_Virtual_Node_Update_By_Cycling_an_Existing_Node_Pool.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Balancing Service Availability and Cost When Cycling Virtual Nodes in Virtual Node Pools](https://docs.oracle.com/iaas/Content/ContEng/Tasks/balance-service-availability-cost-virtual-nodes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 virtual node의 on-demand cycling을 지원합니다. 기존 virtual node pool의 속성을 수정한 뒤 cycling을 수행하면 OKE가 기존 virtual node를 cordon, drain, terminate하고 업데이트된 속성의 새 virtual node를 생성합니다.

공식 Release Note에 따르면 cycling 시 생성 가능한 새 node 최대 수와 unavailable node 최대 수를 지정할 수 있으며, 현재 CLI와 API로 제공됩니다.

### Virtual Node Cycling 동작

Virtual node cycling은 기존 virtual node pool의 속성을 바꾼 뒤 node를 교체하는 방식입니다. OKE는 기존 virtual node를 cordon, drain, terminate하고 업데이트된 속성의 새 virtual node를 생성합니다. Release Note 원문에 따르면 cycling 작업에는 새로 만들 수 있는 node 최대 수와 unavailable node 최대 수를 지정할 수 있으며, 현재 CLI와 API로 제공됩니다.

### CLI 적용 흐름 예시

```bash
# 1) virtual node pool 속성 변경 후 OCID 확인
oci ce virtual-node-pool get --virtual-node-pool-id "$VNP_OCID"

# 2) cycling 실행 예시: 실제 option 이름은 사용 중인 OCI CLI 버전 help로 확인
oci ce virtual-node-pool cycle \
  --virtual-node-pool-id "$VNP_OCID" \
  --maximum-surge 2 \
  --maximum-unavailable 1

# 3) 교체 상태 확인
kubectl get nodes -l oci.oraclecloud.com/oke-is-virtual-node=true -w
```

### 서비스 가용성 설계

Cycling은 pod eviction을 유발할 수 있습니다. 무중단을 목표로 한다면 replica 수, PodDisruptionBudget, readiness probe, session persistence를 먼저 확인합니다.

```yaml
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: api-pdb
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app: api
```

### 비용과 안정성 균형

maximum surge를 크게 잡으면 교체 속도는 빨라지지만 일시 비용과 capacity 요구량이 늘어납니다. maximum unavailable을 크게 잡으면 비용은 줄 수 있지만 서비스 가용성 위험이 커집니다.
## Support for Kubernetes version 1.36.1
* **Services:** Kubernetes Engine
* **Release Date:** July 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-K8s-1-36-1-support.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-K8s-1-36-1-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Migrating Kubernetes Secrets to KMS v2](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengmigratingsecretstokmsv2.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Upgrading the Kubernetes Version on Control Plane Nodes in a Cluster](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengupgradingk8smasternode.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Upgrading the Kubernetes Version on Worker Nodes in a Cluster](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengupgradingworkernodes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE가 Kubernetes 1.36.1을 지원합니다. 동시에 공식 Release Note는 OKE가 Kubernetes 1.33.10 지원을 2026년 8월 10일에 종료한다고 안내하며, 1.34.2, 1.35.2, 1.36.1로 업그레이드할 것을 권고합니다.

또한 Kubernetes 1.36.1 이상 신규 cluster는 Kubernetes Secret object에 대해 Kubernetes KMS provider version 2를 사용한다는 점이 중요합니다.

### 업그레이드 영향

OKE가 Kubernetes 1.36.1을 지원하며, 1.33.10 지원은 2026년 8월 10일 종료됩니다. Oracle은 1.34.2, 1.35.2, 1.36.1로 업그레이드할 것을 권고합니다. 또한 1.36.1 이상 신규 cluster는 Kubernetes Secret object에 KMS provider version 2를 사용합니다.

### 사전 점검 명령 예시

```bash
# cluster와 node version 확인
kubectl version --short
kubectl get nodes -o wide

# deprecated API 사용 여부 점검 예시
kubectl api-resources --verbs=list --namespaced -o name | while read r; do
  kubectl get "$r" --all-namespaces --ignore-not-found >/dev/null 2>&1 || true
done

# workload readiness 확인
kubectl get pods -A --field-selector=status.phase!=Running
```

### 업그레이드 순서

Control plane을 먼저 올리고, node pool은 workload 영향이 낮은 순서로 순차 업그레이드합니다. CNI, CSI, ingress controller, admission webhook, cluster add-on의 version 호환성을 확인해야 합니다. Kubernetes 공식 version skew policy도 함께 확인해 client, kubelet, control plane 조합이 지원 범위 안에 있는지 검토합니다.

### Secret 암호화 변화

KMS provider v2는 secret 암호화 처리 방식과 migration 절차에 영향을 줄 수 있습니다. 신규 cluster와 기존 cluster migration 시 secret 암호화 상태, KMS key 접근 권한, backup/restore 절차를 함께 검증합니다.
## OCI Kubernetes Engine (OKE) support for 20,000 worker nodes per Kubernetes cluster
* **Services:** Kubernetes Engine
* **Release Date:** July 08, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng_20000-node-support.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng_20000-node-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Container Engine for Kubernetes Limits](https://docs.oracle.com/iaas/Content/General/Concepts/servicelimits.htm#Container_Engine_for_Kubernetes_Limits){:target="_blank" rel="noopener"}
* **Documentation:** [Planning for Enhanced Clusters Up to 20,000 Nodes](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengplanningfor20knodes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE enhanced cluster에서 cluster당 최대 20,000개의 managed 또는 self-managed node를 지원합니다. 공식 Release Note는 5,000개를 초과하는 worker node를 계획할 경우 Oracle account team의 승인이 필요하다고 설명합니다.

이 증가 한도는 flannel CNI 기반 pod networking을 사용하는 enhanced cluster에 적용되며, VCN-Native Pod Networking CNI의 기본 한도는 2,000개 node입니다.

### 대규모 클러스터 설계 기준

OKE enhanced cluster에서 최대 20,000 worker node를 지원합니다. 단, 5,000개를 초과하는 worker node를 계획하면 Oracle account team 승인이 필요하며, flannel CNI 기반 pod networking과 regional/realm capacity 조건을 함께 봐야 합니다. VCN-Native Pod Networking CNI의 기본 한도는 2,000 managed 또는 self-managed node입니다.

### 용량 산정 예시

```text
node_count = 20000
pods_per_node = 30
estimated_pods = node_count * pods_per_node  # 600,000 pods

검토 대상:
- subnet CIDR과 pod IP capacity
- API server 요청량과 controller 부하
- image pull burst와 registry throughput
- monitoring metric cardinality
- upgrade batch size와 maintenance window
```

### 운영상 영향

하나의 큰 cluster는 resource utilization과 운영 표준화를 높일 수 있지만, 장애 반경도 커집니다. node pool을 업무·zone·risk별로 나누고, namespace quota, admission policy, deployment ring을 사용해 blast radius를 줄여야 합니다.

### 관련 Kubernetes 원칙

Kubernetes 자체도 version skew, API server 부하, controller 처리량, etcd object 수 같은 확장성 고려사항이 있습니다. OKE의 20,000 node 지원은 platform 한도 확대이지, 모든 workload를 단일 cluster에 넣어도 된다는 의미는 아닙니다.
## Kubernetes Engine support for deploying the Node Feature Discovery cluster add-on
* **Services:** Kubernetes Engine
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Node-Feature-Discovery-addon.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-Node-Feature-Discovery-addon.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Overview of Cluster Add-ons](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengintroducingclusteraddons.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Node Feature Discovery add-on configuration arguments](https://docs.oracle.com/iaas/Content/ContEng/Tasks/configuration-arguments-node-feature-discovery-plugin.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 Node Feature Discovery(NFD) cluster add-on 배포를 지원합니다. NFD는 node의 CPU, device, kernel, OS, GPU 등 하드웨어와 시스템 특성을 탐지하고 Kubernetes node label로 게시합니다.

이 label은 특정 하드웨어 기능이 필요한 workload를 적절한 node에 scheduling하는 데 사용할 수 있습니다.

### OKE 적용 예시

Node Feature Discovery(NFD)는 node의 CPU, device, kernel, OS, GPU 같은 특성을 Kubernetes label로 게시합니다. OKE cluster add-on으로 제공되므로, 수동 DaemonSet 배포보다 lifecycle 관리가 쉬워집니다.

```bash
# 적용 후 label 확인 예시
kubectl get nodes --show-labels | grep -E 'feature.node.kubernetes.io|nvidia.com'

# 특정 label만 확인
kubectl get nodes -L feature.node.kubernetes.io/cpu-cpuid.AVX2
```

### 스케줄링 활용

NFD label은 hardware-aware scheduling에 사용합니다. 예를 들어 특정 CPU feature가 필요한 workload는 node affinity를 사용해 해당 label이 있는 node에만 배치할 수 있습니다.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: avx2-worker
spec:
  replicas: 2
  selector:
    matchLabels:
      app: avx2-worker
  template:
    metadata:
      labels:
        app: avx2-worker
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: feature.node.kubernetes.io/cpu-cpuid.AVX2
                operator: In
                values: ["true"]
      containers:
      - name: worker
        image: container-registry.oracle.com/os/oraclelinux:8
        command: ["sleep", "3600"]
```

### 연계 기술

NFD는 Kubernetes SIG Node 생태계에서 널리 쓰이는 hardware feature discovery 구성요소입니다. label 기반 scheduling은 Kubernetes 공식 node affinity 기능과 함께 사용하며, label 값 변경에 따른 배치 영향도 고려해야 합니다.
## Kubernetes Engine support for deploying the NVIDIA GPU Operator cluster add-on
* **Services:** Kubernetes Engine
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NVIDIA-GPU-Operator-addon.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NVIDIA-GPU-Operator-addon.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Overview of Cluster Add-ons](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengintroducingclusteraddons.htm){:target="_blank" rel="noopener"}
* **Documentation:** [NVIDIA GPU Operator add-on configuration arguments](https://docs.oracle.com/iaas/Content/ContEng/Tasks/configuration-arguments-nvidia-gpu-operator.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 NVIDIA GPU Operator cluster add-on을 지원합니다. 공식 Release Note는 이 add-on이 NVIDIA device plugin, NVIDIA Container Toolkit, MIG Manager, DCGM, DCGM Exporter 같은 GPU workload 운영 구성요소를 자동 관리한다고 설명합니다.

AI/ML, HPC, GPU inference workload를 OKE에서 운영할 때 수동 드라이버·plugin 설치 부담을 줄이고 표준 add-on lifecycle로 관리할 수 있습니다.

### GPU 운영 구성요소

NVIDIA GPU Operator add-on은 GPU node 운영에 필요한 NVIDIA device plugin, NVIDIA Container Toolkit, MIG Manager, DCGM, DCGM Exporter 등을 관리합니다. OKE에서 GPU workload를 운영할 때 수동 설치 대신 add-on lifecycle로 GPU stack을 다룰 수 있습니다.

### GPU workload 예시

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: cuda-vectoradd
spec:
  restartPolicy: OnFailure
  containers:
  - name: cuda
    image: nvcr.io/nvidia/k8s/cuda-sample:vectoradd-cuda12.5.0
    resources:
      limits:
        nvidia.com/gpu: 1
```

적용 후에는 `nvidia.com/gpu` resource가 node allocatable에 표시되는지, GPU pod가 정상 scheduling되는지 확인합니다.

```bash
kubectl describe node <gpu-node-name> | grep -A5 'nvidia.com/gpu'
kubectl logs pod/cuda-vectoradd
```

### 호환성 및 제약

GPU Operator는 driver, container runtime, Kubernetes version, node image와 밀접합니다. 이미 수동 설치한 NVIDIA 구성요소가 있는 cluster에서는 중복 설치나 version mismatch가 발생할 수 있으므로 별도 GPU node pool에서 먼저 검증하는 것이 좋습니다.

### 관측 포인트

DCGM Exporter를 사용하면 GPU utilization, memory, temperature 같은 metric을 수집할 수 있습니다. AI inference 운영 환경에서는 application latency와 GPU metric을 함께 봐야 병목을 정확히 판단할 수 있습니다.
## Kubernetes Engine support for deploying the NVIDIA Network Operator cluster add-on
* **Services:** Kubernetes Engine
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NVIDIA-Network-Operator-addon.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-NVIDIA-Network-Operator-addon.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Overview of Cluster Add-ons](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengintroducingclusteraddons.htm){:target="_blank" rel="noopener"}
* **Documentation:** [NVIDIA Network Operator add-on configuration arguments](https://docs.oracle.com/iaas/Content/ContEng/Tasks/configuration-arguments-nvidia-network-operator.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 NVIDIA Network Operator cluster add-on을 지원합니다. 이 add-on은 Multus CNI, CNI plugins, NVIDIA IPAM, SR-IOV Network Operator, SR-IOV/RDMA CNI 구성요소, VF configuration resource 등을 선택한 add-on version과 VF creation mode에 맞춰 관리합니다.

GPU/HPC처럼 고성능 네트워킹이 중요한 workload에서 네트워크 구성요소 운영을 표준화하는 데 의미가 있습니다.

### 고성능 네트워크 구성요소

NVIDIA Network Operator add-on은 Multus CNI, CNI plugin, NVIDIA IPAM, SR-IOV Network Operator, SR-IOV/RDMA CNI, VF configuration resource 등을 add-on version과 VF creation mode에 따라 배포·관리합니다. GPU cluster에서 distributed training, HPC, low-latency workload를 운영할 때 중요한 업데이트입니다.

### NetworkAttachmentDefinition 예시

Multus 기반 secondary interface를 사용하는 workload는 NetworkAttachmentDefinition과 pod annotation을 함께 사용합니다. 실제 CNI type과 parameter는 OKE/NVIDIA Network Operator 구성값에 맞춰 조정해야 합니다.

```yaml
apiVersion: k8s.cni.cncf.io/v1
kind: NetworkAttachmentDefinition
metadata:
  name: rdma-net
  namespace: ai-training
spec:
  config: |
    {
      "cniVersion": "0.3.1",
      "type": "sriov",
      "name": "rdma-net",
      "ipam": { "type": "host-local", "subnet": "10.10.0.0/24" }
    }
---
apiVersion: v1
kind: Pod
metadata:
  name: training-worker
  namespace: ai-training
  annotations:
    k8s.v1.cni.cncf.io/networks: rdma-net
spec:
  containers:
  - name: worker
    image: container-registry.oracle.com/os/oraclelinux:8
    command: ["sleep", "3600"]
```

### 연계 기술

Multus CNI는 CNCF/Kubernetes 생태계에서 pod에 여러 network interface를 붙일 때 사용되는 대표 기술입니다. SR-IOV와 RDMA는 성능을 높일 수 있지만 node hardware, VF 구성, CNI 호환성이 맞아야 합니다.

### 운영상 영향

네트워크 add-on은 cluster networking에 직접 영향을 주므로 장애 영향이 큽니다. GPU/HPC workload용 node pool을 분리하고, add-on upgrade 전후 throughput, latency, packet drop, pod network attachment 상태를 측정해야 합니다.
## Kubernetes Engine support for deploying the CSI driver SMB cluster add-on
* **Services:** Kubernetes Engine
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/conteng/conteng-CSI-Driver-SMB-addon.htm](https://docs.oracle.com/iaas/releasenotes/conteng/conteng-CSI-Driver-SMB-addon.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Overview of Cluster Add-ons](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengintroducingclusteraddons.htm){:target="_blank" rel="noopener"}
* **Documentation:** [CSI Driver SMB add-on configuration arguments](https://docs.oracle.com/iaas/Content/ContEng/Tasks/configuration-arguments-csi-driver-smb.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 CSI Driver SMB cluster add-on을 지원합니다. Kubernetes workload가 SMB/CIFS file share를 PersistentVolume으로 mount하고, PersistentVolumeClaim을 통해 shared network file storage를 사용할 수 있습니다.

ReadWriteMany 성격의 공유 파일 접근이 필요한 애플리케이션, 파일 공유, 상태 저장 workload에 활용할 수 있습니다.

### SMB PersistentVolume 구성

CSI Driver SMB add-on은 SMB/CIFS share를 Kubernetes PersistentVolume으로 mount하고 PVC로 사용할 수 있게 합니다. shared file storage, legacy SMB file share 연계, ReadWriteMany 성격 workload에 활용할 수 있습니다.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: smbcreds
  namespace: app
stringData:
  username: "${SMB_USER}"
  password: "${SMB_PASSWORD}"
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-smb
spec:
  capacity:
    storage: 100Gi
  accessModes:
  - ReadWriteMany
  persistentVolumeReclaimPolicy: Retain
  csi:
    driver: smb.csi.k8s.io
    volumeHandle: smb-share-001
    volumeAttributes:
      source: "//smb.example.com/share"
    nodeStageSecretRef:
      name: smbcreds
      namespace: app
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-smb
  namespace: app
spec:
  accessModes:
  - ReadWriteMany
  resources:
    requests:
      storage: 100Gi
  volumeName: pv-smb
```

### 보안 고려사항

SMB credential은 Kubernetes Secret으로 관리되므로 namespace와 RBAC 범위를 최소화해야 합니다. 네트워크 경로는 SMB 서버까지의 routing, firewall, DNS, port 허용 상태를 포함해 검증합니다.

### 장애 시나리오

SMB 서버 장애나 credential 만료는 pod startup 지연, mount 실패, application I/O error로 이어질 수 있습니다. 재시작 시 mount 복구와 read/write test를 운영 runbook에 포함합니다.
## OpenShift Container Platform on OCI adds autoscaling support
* **Services:** OpenShift Container Platform on OCI
* **Release Date:** July 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/openshift-container-platform-on-oci/autoscaling-compute-openshift.htm](https://docs.oracle.com/iaas/releasenotes/openshift-container-platform-on-oci/autoscaling-compute-openshift.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Getting Started with OpenShift Container Platform on OCI](https://docs.oracle.com/iaas/Content/openshift-on-oci/overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OpenShift Container Platform on OCI에서 autoscaling을 지원합니다. 애플리케이션 수요 변화에 따라 worker capacity를 자동 조정할 수 있어, 수동으로 worker pool 크기를 조절하던 운영 부담을 줄일 수 있습니다.

공식 Release Note에 따르면 신규 OpenShift 클러스터 생성 시 autoscaling을 활성화하거나, 기존 클러스터 배포 후 autoscaling을 추가할 수 있습니다.

### OpenShift 적용 흐름

이번 업데이트는 OpenShift Container Platform on OCI에서 worker capacity를 application demand에 맞춰 자동 조정할 수 있게 해줍니다. 신규 cluster 생성 시 autoscaling을 켜거나 기존 cluster에 autoscaling을 추가할 수 있다는 점이 Release Note의 핵심입니다.

### 구성 예시

OpenShift의 workload autoscaling은 애플리케이션 replica와 worker capacity를 함께 봐야 합니다. HorizontalPodAutoscaler가 pod 수를 늘려도 worker 여유가 없으면 scheduling이 지연될 수 있으므로, cluster autoscaling 범위와 pod autoscaling 기준을 같이 설계합니다.

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: web-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: web
  minReplicas: 3
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 65
```

### 용량·비용 제약

Autoscaling의 최대 worker 수는 quota와 regional capacity에 묶입니다. OpenShift cluster의 worker shape, image pull 시간, 애플리케이션 warm-up 시간을 측정해야 실제 scale-out 속도를 예측할 수 있습니다.

### 운영 체크

* scale-out 이벤트 때 node 추가와 pod 배치가 기대 시간 안에 완료되는지 확인합니다.
* scale-in 때 PodDisruptionBudget과 replica 수가 서비스 중단을 막는지 확인합니다.
* 비용 alert를 worker 최대치 기준으로 재설정합니다.
