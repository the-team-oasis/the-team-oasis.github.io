---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "10월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 10월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - Oct-2023
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

## Support for Kubernetes volume clones
* **Services:** Container Engine for Kubernetes
* **Release Date:** Oct. 4, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_BV.htm#contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_BV-PV_From_Clone_CSI](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_BV.htm#contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_BV-PV_From_Clone_CSI){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 CSI Volume Plugin은 Persistent Volume을 프로비저닝할 때 Kubernetes Volume Clone(Block Volume 클론으로 프로비저닝) 사용을 지원합니다. Volume Clone을 사용하면 Production 환경에 영향을 주지 않고 구성 변경 사항을 신속하게 테스트 할 수 있습니다.

### 전제조건
Block Volume Clone을 통해서 새로운 Persistent Volume을 프로비저닝 하기 위해서는 다음과 같은 전제조건이 있습니다.

1. Kubernetes Control Plane의 버전은 1.25 버전 이상이어야 합니다.
2. Worker Node는 AMD 혹은 Arm 기반 프로세서를 사용하는 Shape이어야 합니다.
3. Worker Node는 Oracle Linux 7 혹은 Oracle Linux 8에서 실행되어야 합니다.
4. 기존 PVC를 새로운 PVC의 데이터 소스로 지정하는 경우 다음을 충족해야 합니다.
  * Block Volume으로 프로비저닝된 PV에 바인딩이 되어 있어야 합니다.
  * Available 상태여야 합니다.
5. 새 Block Volume은 복제되는 소스 Block Volume과 크기가 같거나 커야 합니다. 소스 Block Volume보다 큰 새 PVC의 저장 값을 지정하면 새 Block Volume의 크기가 그에 따라 조정됩니다. 복제하려는 Block Volume보다 작거나 소스 PVC의 저장 값보다 작은 새 PVC의 저장 값을 지정할 수 없습니다.
6. 새 Block Volume에 대해 지정된 파일 시스템 유형은 복제되는 소스 Block Volume의 파일 시스템 유형과 동일해야 합니다

### 기존 Block Volume을 복제하여 새 PVC 프로비저닝
다음과 같이 기존 PVC를 dataSource에 새 PVC로 지정합니다.
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-clone-pvc
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: custom-clone-storage-class
  resources:
    requests:
      storage: 50Gi
  dataSource:
    kind: PersistentVolumeClaim
    name: my-source-pvc
```

PVC를 생성합니다.
```
kubectl create -f csi-myclonepvc.yaml
```

다음과 같이 Pod에 해당 PVC를 할당합니다.
```
apiVersion: v1
kind: Pod
metadata:
  name: sample-pod
spec:
  containers:
    - name: sample-nginx
      image: nginx
      ports:
        - containerPort: 80
          name: "http-server"
      volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: sample-volume
  volumes:
  - name: sample-volume
    persistentVolumeClaim:
      claimName: my-clone-pvc
```

---

## New Release of Network Firewall
* **Services:** Network Firewall
* **Release Date:** Oct. 17, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/885cd16c-4abb-4c12-8d8b-7100f460ea23/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/885cd16c-4abb-4c12-8d8b-7100f460ea23/){:target="_blank" rel="noopener"}

### 릴리즈 내용
Network Firewall의 새로운 기능들이 추가되었습니다.
1. **Increased limits for policy components:** Policy 요소들에 대한 Limit이 대폭 증가되었습니다. 자세한 내용은 [Policy Components](https://docs.oracle.com/en-us/iaas/releasenotes/changes/885cd16c-4abb-4c12-8d8b-7100f460ea23/)를 참고합니다.
2. **Higher bandwidth for firewalls on demand:** SR을 통해서 Network Firewall의 Bandwidth를 4Gbps 부터 25Gbps까지 증설할 수 있습니다.
3. **Regional High Availability:** Network Firewall을 배포할 때 Regional 또는 특정 AD에 배포할 수 있습니다.
4. **Operational improvements:** Network Firewall Policy를 업데이트 할 때 이제 더 이상 Connection Reset 현상이 발생하지 않습니다. 단, 다음의 경우는 Connection이 Reset될 수 있습니다.
  * Policy Component중 “Mapped Secret”의 정보를 수정한 후 반영하는 경우 (WIP입니다. 앞으로 이 부분도 개선될 예정이라 합니다.)
5. **Bulk import policy components:** Policy를 Json 파일 형태로 작성하여 UI Console에서 가져오기 기능으로 추가할 수 있게 되었습니다. 관련 내용과 JSON 포멧 파일은 [Bulk Importing Policy Components](https://docs.oracle.com/en-us/iaas/Content/network-firewall/bulk-import.htm#top)에서 확인할 수 있습니다.
6. **Easily reorder security and decryption rules:** 규칙을 추가한 후에 규칙에 대한 순서를 사용자가 임의로 지정하여 우선순의를 지정할 수 있게 되었습니다.
관련 내용은 [Creating a Security Rule](https://docs.oracle.com/en-us/iaas/Content/network-firewall/security-rule-create.htm#top), [Creating a Decryption Rule](https://docs.oracle.com/en-us/iaas/Content/network-firewall/decryption-rule-create.htm#top)을 참고합니다.
7. **Search for components:** Search 기능을 통해서 Policy Component를 조회할 수 있습니다.
8. **Easy migration:** 기존 Policy에 대한 마이그레이션을 UI를 통해서 쉽게 수행할 수 있습니다. 기존에 사용하고 있는 Policy 목록에 "Upgrade policy to use new features” 라는 메시지와 함께 "Upgrade policy”라는 버튼을 확인할 수 있습니다. 해당 버튼을 클릭하면 기존 Policy가 위에 언급한 신규 기능을 사용할 수 있는 버전으로 업그레이드가 됩니다. 

### 업그레이드 관련 주의사항
* 업그레이드중에는 Policy나 관련 Component를 수정할 수 없습니다.
* 업그레이드 후에는 이전 버전으로 다운그레이드가 불가 합니다.
* 업그레이드 소요시간은 수분 내외이며 정책을 사용하는 Firewall의 트래픽에 영향을 주지 않습니다.
  * 이 부분은 현재 공식 문서에도 언급이 되어 있지만, 만약을 위해서 가급적이면 트래픽이 많지 않은 시간에 진행하는 것을 권장합니다.

---

## Virtual node support for Kubernetes security contexts
* **Services:** Container Engine for Kubernetes
* **Release Date:** Oct. 19, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/885cd16c-4abb-4c12-8d8b-7100f460ea23/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/885cd16c-4abb-4c12-8d8b-7100f460ea23/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Virtual Node에서 다음과 같은 Security Context를 지원합니다.
* runAsNonRoot
* runAsUser
* runAsGroup
* readOnlyRootFilesystem
* allowPrivilegeEscalation=false