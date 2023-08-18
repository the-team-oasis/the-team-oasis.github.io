---
layout: page-fullwidth
#
# Content
#
subheadline: "CloudNative"
title: "OKE Kubeconfig 파일에 서비스 계정 인증 토큰 추가하기"
teaser: "OKE( Container Engine for Kubernetes ) 를 사용하여 만든 Kubernetes 클러스터의 kubeconfig 파일에 서비스 계정 인증 토큰을 추가하는 방법을 알아보세요"
author: "yhcho"
breadcrumb: true
categories:
  - cloudnative
tags:
  - [oke, service account, authorization, account, service, kubectl, kubeconfig]
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

## OKE 클러스터에 서비스 계정 인증 토큰을 사용하는 이유? 
<br>
클러스터에 대한 kubeconfig 파일을 설정할 때 기본적으로 사용자별로 특정 클러스터 범위의 단기 인증 토큰을 생성하기 위한 Oracle Cloud Infrastructure CLI 명령어가 포함됩니다.<br> 
이렇게 CLI 명령으로 생성된 인증 토큰은 개별 사용자가 kubectl 및 Kubernetes 대시보드를 사용하여 클러스터에 엑세스하기 위한 인증 용도로 적합합니다.<br>
그러나 이렇게 생성된 인증 토큰은 CI/CD(Continuous Integration and Continuous Delivery) 도구와 같이 클러스터에 액세스하는 여러 프로세스 및 다양한 도구를 인증하는 데 적합하지 않습니다. <br>
클러스터에 대한 액세스를 보장하기 위해 이러한 도구에는 오랫동안 지속되는 비사용자별 인증 토큰이 필요합니다.<br>
이러한 문제를 해결하기 위한 솔루션은 이 포스팅에서 안내예정인 Kubernetes 서비스 계정을 사용하는 것입니다.<br>

- 먼저 서비스 계정을 만든 후 클러스터 관리 권한이 있는 clusterrolebinding에 바인딩합니다. 
- 그리고 Kubernetes 시크릿으로 저장되는 서비스 계정에 대한 인증 토큰을 생성합니다. 
- 그런 다음 서비스 계정(및 관련 서비스 계정 인증 토큰)을 kubeconfig 파일 자체에서 사용자 정의로 추가할 수 있습니다.

이렇게 구성하게 되면 다른 도구에서 클러스터에 액세스할 때 서비스 계정 인증 토큰을 사용하여 인증할 수 있습니다.<br>
지금부터 서비스 계정 인증 토큰을 추가 하는 방법에 대해 알아보도록 하겠습니다.!


> **_NOTE:_** 이 포스팅을 실습하기 전에 먼저 OKE 클러스터에 대한 접속 설정이 필요합니다. 만약 접속 설정을 하지 않은 경우 [OCI Container Engine for Kubernetes (OKE) Cluster 접속 방법](/cloudnative/access-oke-cluster/){:target="_blank" rel="noopener"}을 참고하여 접속을 설정해야 합니다.

 
## OKE Kubeconfig 파일에 서비스 계정 인증 토큰 추가하기
아래 단계는 kubectl 명령어를 실행하여 OKE 클러스터에 접속할 수 있는 환경에서 실행해야 합니다.

### 1. 서비스 계정 생성하기
먼저 터미널에서 다음 kubectl 명령어를 입력하여 kube-system 네임스페이스에 신규 서비스 계정을 생성합니다.

**<mark>서비스 계정 생성 예시</mark>**
```
kubectl -n kube-system create serviceaccount <service-account-name>
```

예를 들어 **<mark>kubeconfig-sa</mark>** 이름으로 서비스 계정을 생성하려면 다음과 같이 입력합니다.<br>
```
kubectl -n kube-system create serviceaccount kubeconfig-sa
```

위 명령에 대한 출력은 다음과 같이 서비스 계정 생성이 생성되었음을 확인합니다
```<outputExample>
serviceaccount/kubeconfig-sa created
```

kube-system 네임스페이스에서 서비스 계정을 생성하는 것이 권장되는 모범 사례이며 이 포스팅에서도 kube-system 네임스페이스에서 실습을 진행합니다. 그러나 원하는 경우 액세스 권한이 있는 다른 네임스페이스에 서비스 계정을 만들 수 있습니다.

### 2. 클러스터 관리 권한을 위한 clusterrolebinding 생성하기

클러스터 관리 권한이 있는 새 clusterrolebinding을 만들고 다음 kubectl 명령을 입력하여 방금 만든 서비스 계정에 바인딩합니다.


**<mark>clusterrolebinding 생성 예시</mark>**
```
kubectl create clusterrolebinding <binding-name> --clusterrole=cluster-admin --serviceaccount=kube-system:<service-account-name>
```

예를 들어 **<mark>add-on-cluster-admin</mark>** 이라는 clusterrolebinding을 생성하고 **<mark>kubeconfig-sa</mark>** 서비스 계정에 바인딩하려면 다음을 입력합니다.<br>
```
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:kubeconfig-sa
```

위 명령에 대한 출력은 다음과 같이 clusterrolebinding 생성이 생성되었음을 확인합니다
```<outputExample>
clusterrolebinding.rbac.authorization.k8s.io/add-on-cluster-admin created
```

### 3. 서비스 계정에 대한 인증 토큰 Secret 생성하기

다음 절차를 진행하여 kubeconfig-sa 서비스 계정에 대한 인증 토큰을 얻습니다.

1. 텍스트 편집기에서 파일(예: oke-kubeconfig-sa-token.yaml)을 생성하여 다음 콘텐츠로 암호(예: oke-kubeconfig-sa-token)를 생성합니다. (만약 서비스 계정과 클러스터 롤 바인딩 이름을 다르게 지정한 경우 상황에 맞게 변경해줍니다.)
```
apiVersion: v1
kind: Secret
metadata:
name: oke-kubeconfig-sa-token
namespace: kube-system
annotations:
kubernetes.io/service-account.name: kubeconfig-sa
type: kubernetes.io/service-account-token
```

2. 다음과 같이 입력하여 서비스 계정 토큰을 생성합니다.
```
kubectl apply -f <filename>
```
여기서 는 **<mark>filename</mark>**이전에 만든 파일의 이름입니다.<br>
```
kubectl apply -f oke-kubeconfig-sa-token.yaml
```

3. 다음과 같이 입력하여 생성한 서비스 계정 인증 토큰 Secret을 조회하여 생성된 내용을 확인합니다.
```
kubectl describe secrets oke-kubeconfig-sa-token -n kube-system
```
위 명령의 출력에는 아래와 같이 요소 값으로 인증 토큰(token)(긴 영숫자 문자열)이 포함됩니다.
```<outputExample>
Name:         oke-kubeconfig-sa-token
Namespace:    kube-system
Labels:       <none>
Annotations:  kubernetes.io/service-account.name: kubeconfig-sa
kubernetes.io/service-account.uid: 6d0fda1c-b456-44b3-25fd-4a824bef1936
Type:  kubernetes.io/service-account-token
Data
====
ca.crt:     1289 bytes
namespace:  11 bytes
token:      bxYk______rz15A
```
위의 예에서 `bxYk______rz15A`(가독성을 위해 축약됨)은 인증 토큰입니다.


### 4. 서비스 계정 인증 토큰 값 환경 변수 설정하기
서비스 계정 인증 토큰의 값을 가져오고 해당 값(base64에서 디코딩됨)을 환경 변수에 할당합니다. 
이 포스팅에서는 환경 변수의 이름을 `TOKEN`으로 지정한다고 가정합니다. 입력할 명령은 운영 체제에 따라 다릅니다.

* MacOS, Linux 또는 Unix 환경에서 서비스 계정 인증 토큰의 값을 환경 변수에 지정하려면 다음 명령어를 입력합니다.
```
TOKEN=`kubectl -n kube-system get secret oke-kubeconfig-sa-token -o jsonpath='{.data.token}' | base64 --decode`
```

* Windows 환경에서 서비스 계정 인증 토큰의 값을 가져오고 환경 변수에 지정하려면 다음 명령어 및 절차를 순차적으로 진행합니다.
  1. 다음 명령어를 실행합니다.
```
kubectl -n kube-system get secret oke-kubeconfig-sa-token -o jsonpath='{.data.token}'
```

  2. 위 명령의 출력을 복사하여 base64 디코더(예: https://www.base64decode.org, https://www.base64decode.net 또는 유사)에 붙여넣습니다.
  3. base64 디코더의 출력을 복사합니다.
  4. 다음 명령어를 실행합니다.
```
TOKEN=`[<base64-decoded-output>]`
```
위의 예에서 `[<base64-decoded-output>]` base64 디코더에서 복사한 출력입니다.

### 5. 서비스 계정에 토큰값 설정하기
다음 kubectl 명령을 입력하여 kubeconfig 파일에서 서비스 계정(및 해당 인증 토큰)을 새 사용자 정의로 추가합니다.

```
kubectl config set-credentials <service-account-name> --token=$TOKEN
```

예를 들어 **<mark>kubeconfig-sa</mark>** 서비스 계정과 해당 인증 토큰을 kubeconfig 파일에 추가하려면 다음을 입력합니다.<br>
```
kubectl config set-credentials kubeconfig-sa --token=$TOKEN
```

위 명령에 대한 출력은 다음과 같이 서비스 계정이 kubeconfig 파일에 추가되었음을 확인합니다.
```<outputExample>
User "kubeconfig-sa" set.
```

### 6. 현재 context의 사용자를 서비스 계정으로 지정하기
다음 kubectl 명령을 입력하여 현재 컨텍스트에 대해 kubeconfig 파일에 지정된 사용자를 생성한 새 서비스 계정 사용자로 설정합니다.


```
kubectl config set-context --current --user=<service-account-name>
```

예를 들어 **<mark>kubeconfig-sa</mark>** 서비스 계정을 지정할 경우 다음을 입력합니다.<br>
```
kubectl config set-context --current --user=kubeconfig-sa
```

위 명령에 대한 출력은 다음과 같이 현재 Context 설정이 변경되었음을 확인합니다.
```<outputExample>
Context "context-ctdiztdhezd" modified.
```

### 7. 정상 동작 여부 확인하기
인증이 예상대로 작동하는지 확인하려면 kubectl 명령을 실행하여 서비스 계정 인증 토큰을 사용하여 서비스 계정 사용자를 성공적으로 인증할 수 있는지 확인합니다.

```
kubectl get pods -n kube-system
```

필요에 따라 설정완료한 kubeconfig 파일을 다른 프로세스 및 도구(예: CI/CD 도구)에 배포하여 클러스터에 액세스할 수 있도록 합니다.

### 8. Secret 리소스 삭제 방법 (필요시 삭제)
위 실습 내용대로 설정한 이후에 더이상 서비스 계정 인증 토큰을 통한 클러스터 접속이 필요하지 않을 경우 아래와 같이 명령어를 입력하여 secret을 삭제해야 합니다.

```
kubectl -n kube-system delete secret <secret-name>
```

실습에서는 `oke-kubeconfig-sa-token` 이름으로 Secret을 생성했기 때문에 실습 리소스를 삭제하기 위해서 아래와 같이 입력합니다.

```
kubectl -n kube-system delete secret oke-kubeconfig-sa-token
```

## 마무리하며....
이번 포스팅에서는 OKE 클러스터에 접속하기 위한 서비스 계정을 생성하고 인증 토큰을 설정하는 방법에 대해 알아보았습니다.
이 포스팅이 도움이 되셨으면 좋겠습니다. 감사합니다.
