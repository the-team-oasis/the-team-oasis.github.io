---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "1월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 1월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - Jan-2025
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

## Full Stack Disaster Recovery introduces support for Kubernetes Engine (OKE)
* **Services:** Full Stack Disaster Recovery
* **Release Date:** January 29, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/disaster-recovery/doc/prepare-oke-disaster-recovery.html#CSSGM-GUID-8DD826BB-199D-4581-A23B-CA8B043E6509](https://docs.oracle.com/en-us/iaas/disaster-recovery/doc/prepare-oke-disaster-recovery.html#CSSGM-GUID-8DD826BB-199D-4581-A23B-CA8B043E6509){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 Full Stack Disaster Recovery (FSDR) Protection Group으로 OKE를 지원합니다. FSDR Protection Group으로 OKE를 사용할 때 요건은 다음과 같습니다.
1. Standby Region에 미리 OKE Cluster가 준비되어 있어야 합니다.
2. Primary Region과 Standby Region 두 곳에 백업을 위한 Object Storage Bucket이 준비되어 있어야 합니다. 이 Bucket의 용도는 OKE Cluster의 구성을 백업하는 용도입니다.
3. Persistent Volume(Block Volume or File Storage)을 사용중이라면, 사전에 Standby Region과 Replication을 구성한 후에 해당 스토리지를 FSDR Protection Group에 포함시켜야 합니다.
4. OCI Native Ingress Controller를 사용하고 있다면, Standby Region에 Load Balancer를 생성한 후에 Primary Load Balancer와 매핑하는 작업이 선행되어야 합니다. 이 작업은 FSDR Protection Group을 생성하는 과정에서 UI를 통해 진행합니다.
5. Kubernetes Secret을 저장하기 위한 용도로 OCI Vault를 사용하고 있다면, Standby Region에 Vault를 생성한 후에 Primary Region과 매핑하는 작업이 선행되어야 합니다. 이 작업은 FSDR Protection Group을 생성하는 과정에서 UI를 통해 진행하며, Secret에 대한 Manual Copy 혹은 Replication을 활성화 합니다.
6. OKE API 서비스 접속을 위해 별도의 Jump Host를 운영중이라면, 아래와 같은 도구 및 라이브러리가 설치되어 있어야 합니다.
* Python3
* Kubectl
* Helm
* Install the following Python modules:
  * PyYaml - pip install PyYAML
  * oci-cli - pip install oci-cli

## Support for GRPC as a load balancer listener protocol with Kubernetes Engine
* **Services:** Kubernetes Engine
* **Release Date:** January 29, 2025
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengcreatingloadbalancers-subtopic.htm#listenerprotocol](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengcreatingloadbalancers-subtopic.htm#listenerprotocol){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OKE에서 Load Balancer를 사용할 때 프로토콜로서 GRPC 프로토콜을 사용할 수 있습니다. (기존 HTTP, TCP)

> gRPC(Google Remote Procedure Call)는 Google에서 개발한 고성능, 오픈소스 원격 프로시저 호출(Remote Procedure Call, RPC) 프레임워크입니다. GRPC는 HTTP/2 기반으로 동작하며, 양방향 스트리밍 (클라이언트와 서버 간 실시간 데이터 전송) 및 프로토콜 버퍼(속도와 효율성 향상)를 지원합니다. 일반적으로 마이크로 서비스간 통신이나, 실시간 데이터 처리 및 스트리밍 서비스등에서 활용됩니다.

GRPC 프로토콜 지정방식은 기존의 HTTP, TCP 프로토콜 지정할 때 사용한 Annotation을 활용합니다.
```
service.beta.kubernetes.io/oci-load-balancer-backend-protocol: GRPC
```

## Support for raw block volume storage with Kubernetes Engine
* **Services:** Kubernetes Engine
* **Release Date:** January 31, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_BV.htm#contengcreatingpersistentvolumeclaim_topic_Provisioning_PVCs_on_BV_PV_Raw_BVs](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_BV.htm#contengcreatingpersistentvolumeclaim_topic_Provisioning_PVCs_on_BV_PV_Raw_BVs){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OKE에서 CSI Volume Plugin으로 Block Volume을 사용할 때 Block Volume을 Raw Block Volume으로 마운트해서 사용할 수 있습니다. 일반적으로 Block Volume은 File System을 마운트하여 사용하지만, Raw Block Volume은 File System 없이 순수한 Block Device 형태로 컨테이너에 제공됩니다. Kubernetes에서 Raw Block Volume을 사용하는 경우, 컨테이너 내부의 애플리케이션이 File System을 거치지 않고 Block Device 자체를 직접 활용할 수 있어 더 나은 성능을 기대할 수 있습니다. (I/O 성능 향상, 데이터베이스나 고성능 애플리케이션에 적합)

Raw Block Volume PVC 구성 시 ``volumeMode: Block``옵션을 통해서 적용 할 수 있습니다. 만약 별도로 지정하지 않으면, ``volumeMode: Filesystem`` 형태로 적용됩니다.
```
kind: PersistentVolumeClaim
metadata:
  name: pvc-raw-block-volume
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 50Gi
  storageClassName: oci-bv
  volumeMode: Block
```
