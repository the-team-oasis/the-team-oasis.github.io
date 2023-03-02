---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "2월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 2월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - Feb-2023
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

## OCI Secrets Store CSI Driver Provider enables Kubernetes clusters to access secrets in Vault
* **Services:** Container Engine for Kubernetes
* **Release Date:** Feb. 2, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengmanagingsecrets.htm](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengmanagingsecrets.htm){:target="_blank" rel="noopener"}

### 서비스 소개
이제 Kubernetes Secrets Store CSI 드라이버(secrets-store.csi.k8s.io)를 사용하여 외부 Secret Store에 Application Secret을 저장하고 접근할 수 있습니다.

Secrets Store CSI 드라이버는 Secrets Store를 Kubernetes 클러스터와 CSI(Container Storage Interface) 볼륨으로 통합합니다. Secrets Store CSI 드라이버를 사용하면 Kubernetes 클러스터가 외부 Secret Store에 저장된 여러 Secret, Key 및 인증서를 Pod에 Volume으로 마운트할 수 있습니다. 볼륨이 연결되면 볼륨의 데이터가 애플리케이션 컨테이너의 파일 시스템에 마운트됩니다. OCI Vault는 외부 Secret Store 중 하나로 사용할 수 있으며, Oracle은 오픈 소스 OCI Secrets Store CSI Driver Provider를 통해서 클러스터가 Vault의 Secret에 액세스할 수 있도록 해줍니다. 자세한 내용은 다음 GitHub의 OCI Secrets Store CSI 드라이버 Provider 문서를 참고합니다.

[OCI Secrets Store CSI Driver Provider documentation on GitHub](https://github.com/oracle-samples/oci-secrets-store-csi-driver-provider)

### How to
1) 우선 OCI API 접근을 위한 Secret 설정이 필요합니다. Secret은 다음 kubectl 명령어로 생성이 가능합니다.
```
kubectl create secret generic oci-config \
         --from-file=config=user-auth-config-example.yaml \
         --from-file=private-key=./oci/oci_api_key.pem \
         --namespace <workload-namespace>
```

다음은 **user-auth-config-example.yaml** 예시입니다.
```
auth:
  region: us-phoenix-1
  tenancy: ocid1.tenancy.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
  user: ocid1.user.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
  # Omit if there is not a password for the key
  passphrase: supersecretpassword
  fingerprint: 12:bf:17:7b:5f:e0:7d:13:75:11:d6:39:0d:e2:84:74
```

2) OCI Vault에 접근하기 위한 Dynamic Group과 Polcy가 필요합니다. 다음은 예시입니다.
  ```
  Any {instance.compartment.id = 'ocid1.compartment.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'}
  ```
  ```
  allow dynamic-group dg-name to use secret-family in tenancy
  ```

3) Provider와 Driver는 Daemonset형태로 배포합니다. 배포 방식은 Helm Chart와 yaml로 배포할 수 있는데, 다음은 Code Repository로 부터 Helm Chart를 이용해 배포하는 예시입니다.
```
helm upgrade --install  oci-provider -n kube-system charts/oci-secrets-store-csi-driver-provider
```

그 외 배포 방식에 대한 자세한 내용은 아래 링크 참고합니다.  
[https://github.com/oracle-samples/oci-secrets-store-csi-driver-provider/blob/main/GettingStarted.md](https://github.com/oracle-samples/oci-secrets-store-csi-driver-provider/blob/main/GettingStarted.md)

4) SecretProviderClass 생성
SecretProviderClass는 볼륨과 Provider간의 인터페이스 역할을 합니다. 다음은 SecretProviderClass 예시입니다.
```
apiVersion: secrets-store.csi.x-k8s.io/v1
kind: SecretProviderClass
metadata:
  name: my-test-spc
spec:
  provider: oci 
  parameters: # provider-specific parameters
    secrets: |
      - name: secret1              # Name of the secret in vault
        stage: PREVIOUS
      - name: secret2
        versionNumber: 1           # Version of the secret
        fileName: app1-db-password # Secret will be mounted with this name instead of secret name
    authType: instance             # possible values are: user, instance
    authSecretName: oci-config  # required only for user authType
    vaultId: ocid1.vault.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
```

5) Deployment Volume을 생성할 때 다음과 같이 정의할 수 있습니다.
```
volumes:
- name: secrets-store-inline
   csi:
      driver: secrets-store.csi.k8s.io
      readOnly: true
      volumeAttributes:
      secretProviderClass: my-test-spc
```

6) Container에서 Volume mount는 다음과 같이 정의합니다.
```
volumeMounts:
   - name: secrets-store-inline
   mountPath: '/mnt/secrets-store'
```

---

## OCI Search with OpenSearch now supports role-based access control
* **Services:** Search Service with OpenSearch
* **Release Date:** Feb. 2, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/clustersecurity.htm](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/clustersecurity.htm){:target="_blank" rel="noopener"}

### 서비스 소개
이제 OpenSearch 클러스터에 대한 role-based access를 활성화하는 OpenSearch Secret Plugin이 포함됩니다. 이 플러그인을 사용하면 OpenSearch 클러스터 접근 사용자를 정의하고 제어할 수 있습니다.

OpenSearch Role-based Access 설정을 위한 사용자, 역할 구성에 대한 자세한 내용은 아래 링크를 참고합니다.  
[https://opensearch.org/docs/1.2/security-plugin/access-control/users-roles/#create-roles](https://opensearch.org/docs/1.2/security-plugin/access-control/users-roles/#create-roles)

## DevOps supports running commands in the deployment pipeline
* **Services:** DevOps
* **Release Date:** Feb. 3, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/devops/using/shell_stage.htm](https://docs.oracle.com/en-us/iaas/Content/devops/using/shell_stage.htm){:target="_blank" rel="noopener"}

### 서비스 소개
OCI DevOps 서비스의 Deployment Pipeline에서 이제 Shell Stage를 통해 사용자 정의 명령어를 실행할 수 있습니다. 이 기능에 대한 주요 이점은 다음과 같습니다.

* OCI CLI나 사전에 설치된 특정 도구를 사용하여 서비스 메시 혹은 컨테이너 인스턴스와 같은 OCI플랫폼에 대한 배포를 자동화할 수 있습니다.
* Oracle SQL Developer Command Line(SQLcl)과 같은 명령을 사용하여 데이터베이스 스키마 마이그레이션을 실행할 수 있습니다.
* 배포 실행중에 특정 파이프라인 변수를 참고하거나 파이프라인 파라미터나 변수를 변경하여 실행할 수 있습니다.
* 운영 환경에 배포하기 전에 아티팩트에 대한 통합 테스트를 수행할 수 있습니다.
* DevOps 워크플로를 사용자 지정하여 실행할 수 있습니다. 예를 들어 파이프라인에서 리소스를 배포하기 전에 일부 리소스가 준비될 때까지 대기할 수 있도록 구성할 수 있습니다.

## Oracle Visual Builder Studio is now available
* **Services:** Visual Builder Studio
* **Release Date:** Feb. 14, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/144265b4-da13-46bf-8f5b-4e79332671dc/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/144265b4-da13-46bf-8f5b-4e79332671dc/){:target="_blank" rel="noopener"}

### 서비스 소개
OCI Classic에서 제공되던 Visual Builder Studio 