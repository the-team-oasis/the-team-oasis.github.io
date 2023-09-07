---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "8월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 8월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - Aug-2023
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

## Support for Kubernetes cluster credential rotation
* **Services:** Container Engine for Kubernetes
* **Release Date:** Aug. 1, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengrotatingcredentials.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengrotatingcredentials.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
OKE 클러스터간 혹은 클러스터내에서 TLS 통신을 활성화 하기 위해 PKI 인증서를 사용합니다. OKE에서 생성한 클러스터에는 PKI Root CA, 클러스터와 ETCD, Front Proxy를 위한 개인키를 가지고 있습니다. 클러스터에 사용되는 루트 CA, 서명된 인증서 및 개인 키를 통칭하여 클러스터 자격 증명(Cluster Credential)이라고 합니다.

일반적으로 클러스터내의 Root CA는 5년 후에 만료가 됩니다. 클러스터를 계속 사용하기 위해서는 5년 이내에 자격 증명을 변경해야 합니다. 또한 조직마다 더 자주 이 자격 증명을 변경하도록 정책을 강제할 수 도 있기 때문에 더 자주 자격 증명을 변경해야 할 수 있습니다. 

이제 클러스터 자격 증명 (Cluster Credential)이 만료에 대한 안내 메시지가 콘솔, CLI, API를 통해서 확인할 수 있게 됩니다.

> 이 기능은 현재 Virtual Nodes에서는 지원하지 않습니다.

### 자격 증명 만료 확인(Console) 및 갱신
**OCI Console에서 만료 날짜 확인**

![](/assets/img/cloudnative-security/2023/2023-08-28-cloudnative-security-release-notes-1.png)

**인증서 갱신**
인증서 갱신을 진행할 때에는 지연 기간을 명시적으로 24시간 이상, 14일 이내로 설정할 수 있습니다. 이 기간에 인증서는 자동으로 갱신이 되며, 이 기간 동안 기존 자격 증명과 새 자격 증명을 같이 사용할 수 있습니다.

![](/assets/img/cloudnative-security/2023/2023-08-28-cloudnative-security-release-notes-2.png)

### 새로운 자격 증명으로 교체 후 추가 작업
1. Kubernetes Client API 업데이트: 기존 자격 증명과 새 자격 증명을 모두 사용하기 위해 ```oci ce cluster create-kubeconfig``` 명령어를 통해 Kubeconfig 파일을 새로 생성합니다. 
2. Kubernetes API 서버와 직접 통신하는 Worker Node 혹은 Pod를 다시 생성하거나 다시 시작합니다.
3. 지정한 지연 기간이 지난 후에는 기존 자격 증명이 폐기됩니다. 따라서 기존 자격 증명을 사용하는 Kubeconfig는 가급적이면 삭제하는 것이 좋습니다. 
4. Cluster 상세 페이지 에서 **Complete credential rotation on** 옆의 **Complete Rotation Now**를 클릭합니다. **Complete Rotation** 창이 나오면 **I have read the above message** 옵션을 선택합니다. 
5. 마지막으로 **Start** 버튼을 클릭하면 새로운 자격 증명이 적용되고, 기존 Root CA, 개인키, 인증서가 삭제됩니다.

## Support for Kubernetes version 1.27.2
* **Services:** Container Engine for Kubernetes
* **Release Date:** Aug. 17, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/5db87ff8-32a5-4296-9010-3d2ebad74375/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/5db87ff8-32a5-4296-9010-3d2ebad74375/){:target="_blank" rel="noopener"}

### 릴리즈 내용
OKE에 Kubernetes 1.27.2 버전이 추가되었습니다. 이로써 기존 **1.24.1** 버전은 더 이상 지원하지 않습니다.

#### 현재 지원 버전
* 1.27.2
* 1.26.2
* 1.25.4

## Security settings for Container Instances
* **Services:** Container Instances
* **Release Date:** Aug. 21, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/container-instances/creating-a-container-instance.htm#creating-a-container-instance](https://docs.oracle.com/iaas/Content/container-instances/creating-a-container-instance.htm#creating-a-container-instance){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Container Instance를 생성할 때 각 Container에 대한 Security Context 설정을 지정할 수 있습니다 . User ID, Group ID를 설정하여 Root가 아닌 사용자로 실행하고 읽기 전용의 Root File System을 활성화할 수 있습니다.

**컨테이너 인스턴스 생성 시 보안 설정**
![](/assets/img/cloudnative-security/2023/2023-08-28-cloudnative-security-release-notes-3.png)

* User ID와 Group ID는 컨테이너의 Entrypoint 프로세스를 실행할 때 사용되며, **0과 65535** 사이의 값으로 지정합니다. 만일 User ID를 지정하지 않으면 Root 사용자가 Entrypoint 프로세스를 실행합니다.

> 컨테이너를 root 사용자로 실행하였을 때 root 사용자 계정이 탈취될 수 있으며, 이는 공격자에게 필요한 것 이상으로 더 많은 특권을 주게 됩니다. 따라서 보안을 위해서는 가급적이면 컨테이너 실행 사용자를 Root로 지정하지 않는 것이 좋습니다.

* **Run as non-root user**를 체크하면 root 사용자가 컨테이너를 실행하지 않습니다. **Run as non-root user**를 체크하면 User ID는 **0**으로 설정할 수 없습니다.

* **Enable read-only root filesystem**를 체크하면 Root 폴더는 Read Only 접근만 가능합니다.

## Cloud Guard Adds an Activity Detector
* **Services:** Cloud Guard, Oracle Cloud Infrastructure
* **Release Date:** Aug. 29, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/container-instances/creating-a-container-instance.htm#creating-a-container-instance](https://docs.oracle.com/iaas/Content/container-instances/creating-a-container-instance.htm#creating-a-container-instance){:target="_blank" rel="noopener"}

### 릴리즈 내용
Cloud Guard Activity Detector에 **Local user authenticated without MFA** 규칙이 새로 추가되었습니다. 이 규칙은 MFA(다단계 인증)가 활성화되지 않은 로컬 사용자가 인증할 경우 경고를 발생시킵니다.
 
![](/assets/img/cloudnative-security/2023/2023-08-28-cloudnative-security-release-notes-4.png)