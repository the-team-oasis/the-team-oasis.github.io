---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "4월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2026년 4월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2026-cloudnative-security
tags:
  - oci-release-notes-2026
  - April-2026
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

## New Experience in Oracle Cloud Console
* **Services:** Container Registry
* **Release Date:** April 07, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/registry/mar31-cloud-console-release-note.htm](https://docs.oracle.com/en-us/iaas/releasenotes/registry/mar31-cloud-console-release-note.htm){:target="_blank" rel="noopener"}
* **Documentation:** [New Console Experience](https://docs.oracle.com/en-us/iaas/Content/GSG/Concepts/new-console.htm){:target="_blank" rel="noopener"}, [Container Registry](https://docs.oracle.com/en-us/iaas/Content/Registry/){:target="_blank" rel="noopener"}, [Listing Images](https://docs.oracle.com/en-us/iaas/Content/Registry/Tasks/list-images.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Container Registry에 새로운 Oracle Cloud Console Experience가 적용되었습니다. 이번 업데이트는 OCI Console 전반의 사용성과 일관성을 높이기 위한 디자인 개편의 일부이며, Resource List Page, Resource Details Page, Resource Creation Workflow가 더 직관적인 흐름으로 변경됩니다.

공식 릴리즈 노트에서는 새 Console Experience가 문서 업데이트보다 먼저 표시될 수 있다고 안내합니다. 따라서 Console 화면이 기존 문서의 스크린샷과 다르게 보일 수 있으며, Repository, Image Version, Layer, Signature, Scan Result, Tag 정보를 조회하는 흐름도 새 목록/상세 페이지 패턴을 따르게 됩니다.

![](https://docs.oracle.com/en-us/iaas/Content/GSG/images/redwood-nav.png)

### 주요 변경 포인트

* Service별 관련 리소스를 탐색할 수 있는 좌측 Navigation Pane 제공
* Resource List Page의 Search and Filter 개선
* List Table의 Sort, Filter, Column 관리 기능 개선
* Resource Details Page에서 Details, Monitoring, Policies, Work Requests, Tags 등 하위 정보를 Tab 기반으로 정리
* 복잡한 Resource 생성 시 단계별 또는 Section 기반 Creation Workflow 제공

Container Registry는 OCI에서 Docker Image, Manifest List, Helm Chart 등 OCI(Open Container Initiative) 호환 Artifact를 저장하고 관리하는 서비스입니다. 새 Console Experience는 Repository 및 Image 목록 탐색, Image Detail 확인, Pull Command 복사, Scan Result 확인 같은 반복적인 운영 작업을 더 일관된 방식으로 처리하도록 돕습니다.

## Valkey 8.1 cache engine version
* **Services:** OCI Cache
* **Release Date:** April 09, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/oci-cache/apr2026-valkey-8-1.htm](https://docs.oracle.com/en-us/iaas/releasenotes/oci-cache/apr2026-valkey-8-1.htm){:target="_blank" rel="noopener"}
* **Documentation:** [OCI Cache Overview](https://docs.oracle.com/en-us/iaas/Content/ocicache/overview.htm){:target="_blank" rel="noopener"}, [Creating an OCI Cache Cluster](https://docs.oracle.com/en-us/iaas/Content/ocicache/createcluster.htm){:target="_blank" rel="noopener"}
* **References:** [Valkey 8 in OCI Cache](https://blogs.oracle.com/cloud-infrastructure/valkey-8-json-valkeysearch-in-oci-cache-now-live){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Cache에서 Cache Engine Version으로 **Valkey 8.1**을 선택할 수 있게 되었습니다. Valkey 8.1은 JSON 데이터 타입과 `JSON`, `valkey-search` 모듈을 통한 벡터 유사도 검색을 지원하며, 신규 배포에는 Valkey 8.1 사용이 권장됩니다.

OCI Cache 가이드의 Engine Version 표에도 `VALKEY 8.1`이 Recommended Version으로 표시되며, 클러스터 생성 시 `VALKEY 8.1`, `VALKEY 7.2`, `REDIS 7.0` 중 하나를 선택할 수 있습니다.

### 주요 개선 포인트

Oracle Cloud Infrastructure Blog에서는 Valkey 8.1의 주요 개선 사항으로 I/O Threading 개선, Hash Table 최적화, Key Iterator Prefetching, Sorted Set 명령 최적화, Conditional Update를 소개하고 있습니다. OCI Cache 사용자 입장에서는 기존 캐시 워크로드에서 더 높은 처리량과 낮은 지연 시간, 메모리 효율 개선을 기대할 수 있고, JSON 및 Vector Similarity Search 기능을 활용해 실시간 추천, 콘텐츠 기반 검색, AI 애플리케이션 캐시 패턴에 더 잘 맞는 구조를 만들 수 있습니다.

## Kubernetes Engine support for Karpenter Provider for OCI (KPO)
* **Services:** Kubernetes Engine
* **Release Date:** April 09, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-Karpenter-Support-Release-Note.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-Karpenter-Support-Release-Note.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Using Karpenter Provider for OCI (KPO)](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/conteng-kpo.htm){:target="_blank" rel="noopener"}
* **References:** [Smarter Kubernetes autoscaling on OCI with Karpenter provider now GA](https://blogs.oracle.com/cloud-infrastructure/smarter-kubernetes-autoscaling-with-karpenter){:target="_blank" rel="noopener"}, [Karpenter Documentation](https://karpenter.sh/docs/){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 **Karpenter Provider for OCI (KPO)**를 사용할 수 있게 되었습니다. Karpenter는 Kubernetes에서 스케줄링되지 못한 Pod를 감지해 해당 Pod의 CPU, Memory, Architecture, Availability Domain, Taint, Affinity 요구사항에 맞는 Worker Node를 자동으로 프로비저닝하고, 불필요하거나 비효율적인 Node를 정리하는 오픈소스 Node Provisioning 도구입니다.

KPO는 Karpenter를 OKE와 OCI Compute에 연결하는 Provider입니다. OCI 전용 Worker Node 설정은 `OCINodeClass`에서 정의하고, 어떤 Capacity를 허용할지와 스케일링 의도는 Karpenter `NodePool`에서 정의합니다. Pod가 Pending 상태가 되면 Karpenter가 적합한 `NodePool`을 선택해 `NodeClaim`을 만들고, KPO가 해당 `NodeClaim`과 `OCINodeClass`를 읽어 OCI Compute Instance, VNIC, Boot Volume 등을 생성한 뒤 Worker Node를 클러스터에 조인시킵니다.

### 구성 요소

* **NodePool:** Karpenter가 사용할 Capacity 정책, Scheduling Requirement, Disruption 설정, Scaling Limit을 정의합니다.
* **OCINodeClass:** OCI Compute Shape, Boot Volume, Image, VNIC, NSG, Subnet, Tag, Kubelet 설정 등 OCI 인프라 세부 설정을 정의합니다.
* **NodeClaim:** Pending Pod를 처리하기 위해 Karpenter가 생성하는 Worker Node 요청 단위입니다.

### 설치 및 운영 시 참고 사항

공식 가이드 기준으로 KPO를 설치하려면 클러스터에 KPO Controller가 실행될 최소 Worker Node Capacity가 있어야 합니다. Kubernetes Version은 1.31 이상을 사용할 수 있으며, Kubernetes 1.35 클러스터에서는 KPO `v1.1.0` 이상이 필요합니다. OCI VCN-Native Pod Networking CNI Add-on을 사용하는 경우에는 Add-on Version 3.0.0 이상이 필요하며, Oracle은 3.2.0 이상 사용을 권장합니다.

```bash
helm repo add karpenter-provider-oci https://oracle.github.io/karpenter-provider-oci/charts
helm repo update karpenter-provider-oci
```

### 활용 포인트

기존 Cluster Autoscaler는 보통 고정된 Managed Node Pool 단위로 확장되므로, 다양한 Shape나 구매 옵션을 쓰려면 Node Pool을 여러 개 미리 준비해야 했습니다. KPO를 사용하면 하나의 정책에서 여러 OCI Shape, Architecture, On-demand 또는 Preemptible Capacity를 허용하고, 실제 Pod 요구사항에 맞춰 더 동적으로 Node를 생성할 수 있습니다.

## OCI Kubernetes Engine (OKE) support for configuring cookie-based session persistence for managed load balancers
* **Services:** Kubernetes Engine
* **Release Date:** April 13, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-cookie-based-session-persistence.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-cookie-based-session-persistence.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Configuring Cookie-Based Session Persistence for Load Balancers](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengconfiguringloadbalancersnetworkloadbalancers-subtopic.htm){:target="_blank" rel="noopener"}, [Configuring Cookie-Based Session Persistence for the OCI Native Ingress Controller](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupnativeingresscontroller-configuring.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE가 Kubernetes `Service` Type `LoadBalancer`로 프로비저닝하는 OCI Load Balancer에서 **Cookie-Based Session Persistence**를 Annotation으로 구성할 수 있게 되었습니다. 또한 OCI Native Ingress Controller에서도 `Ingress` Annotation을 통해 동일한 방식의 Session Persistence를 설정할 수 있습니다.

지원되는 방식은 두 가지입니다.

* **Application Cookie Persistence:** Backend Application이 Cookie를 생성하고 관리합니다.
* **Load Balancer Cookie Persistence:** OCI Load Balancer가 Cookie를 생성하고 관리합니다.

### LoadBalancer Service Annotation

Session Persistence는 OCI Load Balancer 타입에서 지원됩니다.

* `oci.oraclecloud.com/load-balancer-type: "lb"`에서는 지원됩니다.
* `oci.oraclecloud.com/load-balancer-type: "nlb"`에서는 지원되지 않으며, 관련 Annotation은 무시됩니다.
* Application Cookie Persistence와 Load Balancer Cookie Persistence Annotation은 상호 배타적입니다.

```yaml
metadata:
  annotations:
    oci.oraclecloud.com/load-balancer-type: "lb"
    oci-load-balancer.oraclecloud.com/session-persistence-config: |
      {
        "cookieName": "APPSESS",
        "disableFallback": true
      }
```

```yaml
metadata:
  annotations:
    oci.oraclecloud.com/load-balancer-type: "lb"
    oci-load-balancer.oraclecloud.com/lb-cookie-session-persistence-config: |
      {
        "cookieName": "X-Oracle-OCI-Route",
        "disableFallback": true,
        "domain": "example.com",
        "path": "/",
        "maxAgeInSeconds": 120,
        "isSecure": true,
        "isHttpOnly": true
      }
```

### OCI Native Ingress Controller Annotation

OCI Native Ingress Controller에서는 `Ingress` 리소스의 `metadata.annotations`에 다음 Annotation 중 하나를 추가합니다.

* `oci-native-ingress.oraclecloud.com/session-persistence-config`
* `oci-native-ingress.oraclecloud.com/lb-cookie-session-persistence-config`

`isSecure: true`를 사용하는 경우에는 HTTPS/TLS Listener가 구성되어 있어야 합니다.

## Support for Kubernetes version 1.35.2
* **Services:** Kubernetes Engine
* **Release Date:** April 28, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-K8s-1-35-2-support.htm](https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-K8s-1-35-2-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Upgrading the Kubernetes Version on Control Plane Nodes](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengupgradingk8smasternode.htm){:target="_blank" rel="noopener"}, [Upgrading the Kubernetes Version on Worker Nodes](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengupgradingworkernodes.htm){:target="_blank" rel="noopener"}, [Supported Images and Shapes for Worker Nodes](https://docs.oracle.com/en-us/iaas/Content/ContEng/Reference/contengimagesshapes.htm){:target="_blank" rel="noopener"}
* **References:** [Kubernetes v1.35 Release Notes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.35.md){:target="_blank" rel="noopener"}, [Kubernetes v1.35 Release Blog](https://v1-35.docs.kubernetes.io/blog/2025/12/17/kubernetes-v1-35-release/){:target="_blank" rel="noopener"}

### 업데이트 내용

OKE에서 Kubernetes Version **1.35.2**를 지원합니다. 공식 릴리즈 노트에서는 1.35.2가 기존 1.34.2, 1.33.1에 더해 지원된다고 안내하고 있습니다.

Kubernetes 1.35.2 지원이 추가됨에 따라 OKE는 **2026년 5월 28일**에 Kubernetes 1.32.10 지원을 중단할 예정입니다. Oracle은 Kubernetes 1.32.10 클러스터를 1.33.1, 1.34.2 또는 1.35.2로 업그레이드할 것을 권장합니다.

### Kubernetes 1.35 Worker Node 이미지 주의사항

Kubernetes 1.35 이상을 실행하는 Worker Node에는 OKE OL8 Image와 OKE OL8 Image 기반 Custom Image가 지원됩니다. OKE OL8 Image 중 Build Number 1367 이상은 cgroups v2가 기본 활성화되어 있습니다. Build Number가 더 낮은 OKE OL8 Image나 OL8 Platform Image 기반 Custom Image를 사용하는 경우에는 `systemd.unified_cgroup_hierarchy=1` Kernel Argument를 설정해 cgroups v2를 활성화해야 합니다.

지원되지 않는 이미지는 OL7 Platform Image, OL8 Platform Image, OKE OL7 Image 기반 Custom Image, OL7 Platform Image 기반 Custom Image입니다.

### 업그레이드 순서

OKE 클러스터를 새 Kubernetes Minor Version으로 올릴 때는 Control Plane을 먼저 업그레이드하고, 이후 Worker Node Pool을 업그레이드합니다. Kubernetes Version Skew Policy도 함께 확인해야 합니다.

### Kubernetes 1.35 주요 변화

Kubernetes 1.35는 60개 Enhancement를 포함하며, In-place Pod Resource Update GA, Pod Certificate 기반 Workload Identity Beta, Storage Version Migration Beta, `/flagz` 및 `/statusz`의 구조화된 JSON 응답 지원 등을 포함합니다. Kubernetes 1.35에서는 cgroup v1 지원 제거가 중요한 변화로 언급되므로, OKE에서 Kubernetes 1.35로 이동할 때는 Worker Node 이미지와 cgroups v2 구성을 반드시 점검해야 합니다.

## OCI Batch Service - Release Version 1.0.2.0
* **Services:** Batch
* **Release Date:** April 29, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/batch/batch_service_release_1_0_2_0.htm](https://docs.oracle.com/en-us/iaas/releasenotes/batch/batch_service_release_1_0_2_0.htm){:target="_blank" rel="noopener"}
* **Documentation:** [How Batch Objects Work Together](https://docs.oracle.com/en-us/iaas/Content/oci-batch/batch-objects.htm){:target="_blank" rel="noopener"}, [Creating a Job](https://docs.oracle.com/en-us/iaas/Content/oci-batch/create-job.htm){:target="_blank" rel="noopener"}, [OCI Batch Lifecycle States Reference](https://docs.oracle.com/en-us/iaas/Content/oci-batch/batch-lifecycle-states.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Batch Service 1.0.2.0 Release에는 Batch Job과 Task를 더 계층적으로 구성하고, 실행 상태를 더 명확하게 추적하기 위한 개선이 포함되었습니다.

주요 변경 사항은 다음과 같습니다.

* **Group Tasks 추가:** Task를 계층적으로 그룹화하고, 그룹 단위 Dependency를 정의할 수 있습니다.
* **Task 실행 가시성 개선:** Execution ID, 시작 및 종료 시간, Task Lifecycle Transition Time, Fleet Shape, Container 생성 및 실패 상세, Execution Error Detail을 확인할 수 있습니다.
* **Job 및 Task Lifecycle Event 가시성 추가:** 상태 전이를 더 쉽게 추적하고 Notification 또는 History View 구성에 활용할 수 있습니다.
* **Job Lifecycle 변경:** 새 Job은 Task가 `IN PROGRESS` 상태로 진입하기 전까지 `WAITING` 상태로 유지됩니다.
* **Task Argument 길이 증가:** Task Argument 길이 제한이 256자에서 2048자로 늘어났습니다.

### Group Tasks

Group Task는 여러 Task를 하나의 단위처럼 다루기 위한 컨테이너입니다. OCI Batch의 Job은 Task 간 Dependency로 Directed Acyclic Graph (DAG)를 구성할 수 있는데, Group Task를 사용하면 DAG 안에서 여러 Task를 하나의 단계처럼 다룰 수 있습니다.

* Group 외부에서는 하나의 Task처럼 동작하므로, 다른 Task가 Group Task에 의존할 수 있습니다.
* Group 내부에는 자체 Task와 Dependency를 정의할 수 있습니다.
* 내부 Task가 모두 성공해야 Group Task가 성공합니다.
* 내부 Task가 실패하면 Group Task와, 해당 Group Task에 의존하는 다른 Task도 실패합니다.
* Group Task는 최대 4단계까지 중첩할 수 있습니다.

### High-Level Batch Workflow

![](https://docs.oracle.com/en-us/iaas/Content/oci-batch/images/batch-objects.png)

OCI Batch는 Batch Context, Job Pool, Job, Task 계층으로 대규모 Batch Workload를 정의하고 실행합니다. 이번 Release의 Group Task와 Lifecycle 가시성 개선은 복잡한 렌더링, 시뮬레이션, 데이터 처리 파이프라인처럼 여러 단계와 의존성이 있는 Batch Workflow를 더 읽기 쉽고 운영하기 쉽게 만드는 데 초점이 있습니다.

## OCI Cache Backup and Restore
* **Services:** OCI Cache
* **Release Date:** April 29, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/oci-cache/may2026-backup-restore.htm](https://docs.oracle.com/en-us/iaas/releasenotes/oci-cache/may2026-backup-restore.htm){:target="_blank" rel="noopener"}
* **Documentation:** [OCI Cache Backup and Restore](https://docs.oracle.com/en-us/iaas/Content/ocicache/backup-restore.htm){:target="_blank" rel="noopener"}, [Creating an OCI Cache Cluster](https://docs.oracle.com/en-us/iaas/Content/ocicache/createcluster.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Cache에 **Backup and Restore** 기능이 추가되었습니다. 이 기능을 사용하면 OCI Cache Cluster의 Point-in-time Backup을 만들고, Backup Retention을 관리하며, Backup을 Export 또는 Import해 Migration이나 장기 보관에 활용하고, Backup에서 Cluster를 복구할 수 있습니다.

### Backup

OCI Cache Backup은 Cache Cluster의 특정 시점 상태를 RDB Snapshot으로 캡처합니다. 현재 공식 가이드 기준으로 On-demand Manual Backup을 지원하며, Console, CLI, API에서 필요할 때 직접 실행할 수 있습니다.

Backup은 Primary Node 또는 Replica Node에서 수행할 수 있습니다. Backup Retention Period는 1일부터 35일까지 설정할 수 있고, 기본값은 7일입니다. Backup과 Restore 작업은 Work Request로 처리되며, Work Request ID를 통해 `ACCEPTED`, `IN_PROGRESS`, `SUCCEEDED` 상태를 추적할 수 있습니다.

### Export, Import, Restore

Export 기능을 사용하면 Managed Backup을 사용자가 소유한 Object Storage Bucket으로 내보낼 수 있습니다. 35일 Retention보다 긴 장기 보관이 필요하거나 Region 간 Migration이 필요한 경우에 유용합니다.

Import 기능은 Object Storage에 저장된 Redis 또는 Valkey Database File을 사용해 OCI Cache Cluster를 초기화하는 방식입니다. 기존 Redis 또는 Valkey Workload를 OCI Cache로 이전할 때 사용할 수 있습니다.

Restore는 활성 Backup에서 새 OCI Cache Cluster를 생성하는 방식으로 수행됩니다. Restore 시에는 Source Backup과의 호환성이 강제됩니다. Cache Engine과 Cluster Mode는 변경할 수 없고, Sharded Cluster는 원본과 동일한 Shard Count를 사용해야 하며, Node당 Memory는 Source Cluster와 같거나 더 커야 합니다. Node 수는 필요에 따라 조정할 수 있습니다.

### IAM 및 비용 참고사항

Backup and Restore 기능은 OCI IAM 권한으로 제어됩니다. Export 및 Import 작업에는 OCI Cache 권한뿐 아니라 Object Storage 접근 권한도 필요합니다. Object Storage 사용량과 Backup 생성 과정에서 OCI Cache Service가 사용하는 Block Volume 리소스에 대한 비용이 발생할 수 있습니다.
