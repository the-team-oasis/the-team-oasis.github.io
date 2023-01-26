---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2022"
title: "12월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2022년 12월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2022-cloudnative-security
tags:
  - oci-release-notes-2022
  - dec-2022
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

## Container Instances is now available
* **Services:** Container Instances
* **Release Date:** Dec. 6, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/container-instances/home.htm](https://docs.oracle.com/en-us/iaas/Content/container-instances/home.htm){:target="_blank" rel="noopener"} 

### 기능 소개
Container Instances 서비스는 사용자가 서버를 관리할 필요 없이 컨테이너를 빠르게 실행할 수 있는 서버리스 컴퓨팅 서비스입니다. Container Instances는 가상 머신과 동일한 형태의 격리를 제공하는 컨테이너 워크로드에 최적화된 서비리스 컴퓨팅 환경에서 실행합니다.

### Container Instances Shape
OCPU와 메모리 양을 사용자가 지정할 수 있는 Flex Shape을 사용합니다.
* CI.Standard.E4.Flex (Processor 2.25 GHz AMD EPYC™ 7J13 (Milan))
  * OCPU: Minimum: 1 OCPU, Maximum: 64 OCPU
  * Memory: Minimum: 1 GB or a value matching the number of OCPUs, whichever is greater, Maximum: Maximum: 64 GB per OCPU, up to 1024 GB total
* CI.Standard.E3.Flex (Processor 2.25 GHz AMD EPYC™ 7742 (Rome))
  * Minimum: 1 OCPU, Maximum: 64 OCPU
  * Memory: Minimum: 1 GB or a value matching the number of OCPUs, whichever is greater, Maximum: 64 GB per OCPU, up to 1024 GB total

### Event 서비스와의 연동
OCI Event 서비스를 통해서 Container Instances 서비스를 자동화할 수 있습니다. 관련 이벤트는 다음과 같습니다.

* Create Container Instance
* Restart Container Instance
* Start Container Instance
* Stop Container Instance
* Update Container Instance
* Change Container Instance Compartment
* Delete Container Instance
* Update Container
* Container Instance Maintenance

### Container Instances 상태에 따른 리소스 청구 

<table class="table vl-table-bordered vl-table-divider-col" summary="This table summarizes basic information about each region"><caption></caption><colgroup><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1">Container Instance States</th>
      <th class="entry" id="About__entry__2">Billing</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Creating</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">No</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Active</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">Yes</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Updating</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">Yes</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Failed</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">No</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Inactive</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">No</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Deleting</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">No</span>
      </td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Deleted</span>
      </td>
      <td class="entry" headers="About__entry__2"><span class="ph">No</span>
      </td>
      </tr>
    </tbody>
</table>

### Container Instances 생성 화면

1. Add basic details
![](/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-12-1.png)

2. Configure containers 
![](/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-12-2.png)
---

## Support for OAuth 2.0 and OpenID Connect
* **Services:** API Gateway
* **Release Date:** Dec. 7, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayusingjwttokens.htm#Using_JSON_Web_Tokens_JWTs_to_Add_Authentication_and_Authorization_to_API_Deployments__section_oath2_openidconnect](https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayusingjwttokens.htm#Using_JSON_Web_Tokens_JWTs_to_Add_Authentication_and_Authorization_to_API_Deployments__section_oath2_openidconnect){:target="_blank" rel="noopener"} 

### 기능 소개
이제 API Gateway에서 OAuth 2.0 및 OpenID Connect를 지원합니다.

### OpenID 개요
OIDC(OpenID Connect) 프로토콜은 OAuth 2.0 프로토콜상에 있는 간단한 ID 계층입니다. OpenID Connect를 사용하면 브라우저, 모바일 애플리케이션, 데스크톱 클라이언트와 같은 다양한 유형의 애플리케이션들이 안전하고 중앙 집중식이며 표준화된 방식으로 인증 및 ID 관리를 할 수 있도록 지원합니다. OpenID Connect 프로토콜을 기반으로 하는 앱은 사용자 ID를 확인하기 위해 ID 공급자를 사용하여 인증 프로세스를 안전하게 처리합니다.

#### OpenID Connect 인증 흐름
![](/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-12-3.png)

### API Gateway에서의 OpenID Connect 구현
![](/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-12-4.png)

### 일반적인 API 인증
1. 타사 시스템은 ID 공급자로부터 획득한 토큰을 제시하여 게이트웨이를 통해 백엔드 서비스에 대한 액세스를 요청합니다.
2. 게이트웨이는 타사 시스템이 백엔드 서비스에 액세스할 수 있는지 확인하기 위해 ID 공급자로 토큰의 유효성을 검사합니다.
3. 타사 시스템이 승인되면 게이트웨이는 적절한 백엔드 서비스로 라우팅하고 이행된 응답을 타사 시스템에 반환합니다.

### 웹 브라우저 및 모바일 애플리케이션 인증
웹 브라우저는 액세스 토큰을 얻는 데 사용되는 클라이언트 ID 및 암호와 같은 기밀 정보를 저장할 수 없습니다. 웹 애플리케이션은 웹 브라우저를 사용자를 인증하고 권한을 부여하는 ID 공급자로 리디렉션하는 OpenID Connect 흐름을 사용합니다.

1. 클라이언트 애플리케이션은 API 게이트웨이를 통해 백엔드 서비스에 대한 액세스를 요청합니다.
2. 게이트웨이는 클라이언트를 OCI IAM , Microsoft Active Directory 및 Okta 와 같은 자격 증명 공급자로 안내합니다 .
3. 클라이언트는 ID 제공자로 인증합니다. 성공적으로 인증되면 클라이언트는 인증을 제공하는 토큰을 받습니다.
4. 자격 증명 공급자는 액세스 토큰을 사용하여 클라이언트를 게이트웨이로 리디렉션합니다.
5. 게이트웨이는 ID 공급자를 통해 액세스 토큰의 유효성을 검사합니다.
6. 토큰 유효성 검사가 성공하면 게이트웨이는 적절한 백엔드 서비스로 라우팅하고 처리된 응답을 클라이언트에 반환합니다.

## Support for logout back ends
* **Services:** API Gateway
* **Release Date:** Dec. 7, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayaddinglogoutbackends.htm](https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayaddinglogoutbackends.htm){:target="_blank" rel="noopener"} 

### 기능 소개
이제 OAuth 2.0 토큰 인증 정책을 정의할 때 로그아웃 백엔드에 대한 경로를 포함하는 OAuth 2.0 유효성 검사 실패 정책을 선택적으로 지정할 수 있습니다. 로그아웃 백 엔드를 사용하면 API 클라이언트가 액세스 토큰을 취소하여 로그아웃하고 잠재적으로 다른 URL을 호출하여 추가 로그아웃 작업을 수행할 수 있습니다.

**API Gateway Deployment에서 Logout URI 추가 화면**
![](/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-12-5.png)

## Support for dynamically provisioning Kubernetes Persistent Volume Claims (PVCs) on new file systems in File Storage service
* **Services:** Container Engine for Kubernetes
* **Release Date:** Dec. 14, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim_Provisioning_PVCs_on_FSS.htm#contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_FSS-Using-CSI-Volume-Plugin](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim_Provisioning_PVCs_on_FSS.htm#contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_FSS-Using-CSI-Volume-Plugin){:target="_blank" rel="noopener"} 

### 기능 소개
이제 OCI File Storage 서비스에서 새 File System을 동적으로 생성하여 Kubernetes Persistent Volume Claim(PVC)을 프로비저닝할 수 있습니다. File Storage 서비스 File System은 클러스터에 배포된 CSI(Container Storage Interface) 드라이버를 사용하여 Kubernetes용 Container Engine에서 생성된 클러스터에서 실행되는 컨테이너 내부에 마운트됩니다.

### 구성 절차
먼저 다음과 같인 포멧으로 fss.csi.oracleclould.com Provisoner를 사용하여 Storage Class를 작성합니다.

```
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: <storage-class-name>
provisioner: fss.csi.oraclecloud.com
parameters:
  availabilityDomain: <ad-name>
  mountTargetOcid: <mt-ocid> | mountTargetSubnetOcid: <mt-subnet-ocid>
  compartmentOcid: <compartment-ocid>
  kmsKeyOcid: <key-ocid>
  exportPath: <path>
  exportOptions: [{<options-in-json-format>}]
  encryptInTransit: "true"|"false"
```

다음은 예시입니다.

```
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: fss-dyn-storage
provisioner: fss.csi.oraclecloud.com
parameters:
  availabilityDomain: US-ASHBURN-AD-1
  mountTargetSubnetOcid: ocid1.subnet.oc1.iad.aaaaaaaa2xpk______zva
  compartmentOcid: ocid1.compartment.oc1..aaaaaaaay______t6q
  kmsKeyOcid: ocid1.key.oc1.iad.anntl______usjh
  exportPath: /FileSystem1
  exportOptions: [ { "source" : "0.0.0.0/0", "requirePrivilegedSourcePort" : false, "access" : "READ_WRITE", "identitySquash" : "ROOT" } ]
  encryptInTransit: "true"
```

Storage Class를 생성합니다.

```
$ kubectl create -f fss-dyn-st-class.yaml
```


PVC를 생성할 때 다음과 같이 앞에서 생성한 Storage Class를 사용하도록 작성합니다.

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: <pvc-name>
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: "<storage-class-name>"
  resources:
    requests:
      storage: 50Gi
```

다음은 예시입니다.

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: fss-dynamic-claim
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: "fss-dyn-storage"
  resources:
    requests:
      storage: 50Gi
```

PVC를 생성합니다.

```
$ kubectl create -f fss-dyn-claim.yaml
```

Pod를 생성할 때 다음과 같이 PVC를 사용하도록 작성합니다. 

```
apiVersion: v1
kind: Pod
metadata:
  name: fss-dynamic-app
spec:
  containers:
    - name: nginx
      image: nginx:latest
      ports:
        - name: http
          containerPort: 80
      volumeMounts:
        - name: persistent-storage
          mountPath: /usr/share/nginx/html
  volumes:
  - name: persistent-storage
    persistentVolumeClaim:
      claimName: fss-dynamic-claim
```

## The Queue service is now available
* **Services:** Queue
* **Release Date:** Dec. 14, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/queue/overview.htm](https://docs.oracle.com/en-us/iaas/Content/queue/overview.htm){:target="_blank" rel="noopener"} 

### 기능 소개
OCI Queue 서비스는 비동기 작업을 지원하는 완전 관리형 서버리스 서비스입니다. Queue는 손실 혹은 중복 없이 독립적으로 처리된 메시지가 필요한 대용량 트랜잭션 데이터를 처리하는데 사용됩니다.

![](/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-12-6.png)

### 개념 이해
#### message
메시지는 문자열 형식의 페이로드를 포함하는 큐의 요소입니다. 문자열은 XML, JSON, CSV, Base64로 인코딩된 이진 메시지 및 gzip과 같은 압축 형식을 포함한 모든 형식일 수 있습니다. 생산자와 소비자는 메시지 형식에 동의해야 합니다. 각 메시지는 독립적으로 처리됩니다.

#### producer
큐에 메시지를 전달하는 클라이언트

#### consumer
큐로부터 메시지를 받는 클라이언트. consumer는 또한 메시지를 받은 후 큐에서 메시지를 삭제할 책임이 가지고 있습니다.

#### maximum retention period
message가 Consumer에 의해 삭제되지 않은 경우 시스템에 의해 자동으로 삭제될 때까지 큐가 message를 보유하는 시간입니다. 최대 보존 기간은 10초에서 7일 사이의 값으로 구성할 수 있습니다. 기본값은 1일입니다.

#### delivery count
요청 시 소비자에게 전달되는 횟수입니다.

#### maximum delivery attempts
Consumer에게 여러번 전달 시도한 횟수(이러한 메시지는 결국 DLQ(Dead Letter Queue)로 보내지기 전에 업데이트 혹은 삭제되지 않은 메시지들임). maximum delivery attempts 값은 1-20까지 지정 가능.

#### polling timeout
Consumer가 메시지를 사용할 때까지 기다리는 시간입니다. 폴링 제한 시간을 늘리면 Consumer가 Queue에서 메시지를 요청하는 횟수가 줄어들지만 응답에는 사용할 수 있는 메시지가 없다고 표시됩니다. 폴링 타임아웃은 Queue 수준에서 0~30초의 값으로 구성할 수 있으며 Consumer는 메시지를 요청할 때 값을 설정할 수 있습니다. 기본값은 30초입니다.

#### visibility timeout
한 Consumer가 Queue에서 받은 메시지가 다른 Consumer에게 표시되지 않는 시간입니다. visibility timeoutd은 큐 수준에서 1초에서 12시간까지의 값으로 구성할 수 있으며 Consumer는 메시지를 요청할 때 값을 설정할 수 있습니다. 기본값은 30초입니다.

#### visible messages
현재 큐에서 사용할 수 있는 메시지 수입니다.

#### in-flight messages
Consumer에게 전달되었지만 아직 삭제되지 않은 메시지 수입니다. 전송 중인 메시지는 visibility timeout이 지날 때까지 재전송할 수 없습니다.

#### dead letter queue
메시지가 성공적으로 전송되지 않고 구성된 maximum delivery attempts 횟수보다 더 많은 전달 시도가 있는 경우 메시지는 Dead Letter Queue(DLQ)로 전송됩니다.

### Service Limits
![](/assets/img/cloudnative-security/2022/oci-cloudnative-security-release-notes-12-7.png)