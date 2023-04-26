---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "3월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 3월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - May-2023
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

## Search with OpenSearch now supports OpenSearch version 2.3
* **Services:** Search Service with OpenSearch
* **Release Date:** March 7, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/680b3476-c887-4546-9e98-a0860cef07cb/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/680b3476-c887-4546-9e98-a0860cef07cb/){:target="_blank" rel="noopener"}

### 릴리즈 내용
OCI Search with OpenSearch에서 이제 [OpenSearch 2.3](https://opensearch.org/versions/opensearch-2-3-0.html) 버전을 지원합니다. 이 버전은 [Lucene 9.1](https://lucene.apache.org/core/9_1_0/index.html)을 사용하여 10-15% 더 빠른 인덱싱 성능을 제공합니다. 이 외에도 다음과 같은 개선 사항이 포함됩니다.

* 롤 기반 액세스 제어([role-based access control](https://docs.oracle.com/iaas/Content/search-opensearch/Concepts/clustersecurity.htm))의 첫 단계(Username 및 Password 지원)를 포함하는 보안 기능 향상
* 벌크 인덱싱 및 삭제 지원, 인덱스(Indices) 및 별칭(Aliases) 관리를 위한 API 지원
* [Nested aggregations](https://opensearch.org/docs/latest/aggregations/), [geo point fields](https://opensearch.org/docs/2.5/field-types/geo-point/), [geohashes](https://opensearch.org/docs/latest/aggregations/bucket-agg/)를 위한 쿼리 언어 지원
* 몇 가지 실험적인 기능 추가 (세그먼트 복제, 원격 백엔드 스토리지, OpenSearch Dashboards에서 Drag & Drop 시각화 기능)

### 기존 버전에서의 업그레이드
현재 기본은 OpenSearch 2.3버전의 클러스터로 생성되며, 기존 1.2.4 버전의 클러스터도 여전히 사용 가능합니다. 또한 기존 1.2.4 버전에서 2.3 버전으로 업그레이드도 지원합니다. 업그레이드 방법은 아래 링크를 참고합니다.

[Upgrading a Cluster](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Tasks/upgradingacluster.htm)

## New Security Zone Policies
* **Services:** Security Zones
* **Release Date:** March 14, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/security-zone/using/security-zone-policies.htm](https://docs.oracle.com/en-us/iaas/security-zone/using/security-zone-policies.htm){:target="_blank" rel="noopener"}

### 서비스 소개
OCI Security Zone은 OCI의 특정 구획에 대해서 보안을 위협할 수 있는 구성을 방지하여, 리소스를 보호하고 잘못된 보안 구성을 예방하기 위한 보안 서비스입니다.
![](https://k21academy.com/wp-content/uploads/2020/11/oracle-security-zones.jpg)

Security Zone 구획은 Cloud Guard의 Target이 될 수 있으며, Cloud Guard의 Detector 및 Response Recipe를 활용할 수 있습니다.

### 릴리즈 내용
이번에 Security Zone Recipe에 다음 두 개의 새로운 Recipe가 추가되었습니다.
* Security Zone에서 제한하고 있는 포트에 대해서는 Security List에 추가할 수 없습니다.
* Security Zone에 있는 Public Load Balancer 생성이 제한됩니다. 모든 로드 밸런서는 Private 이어야 합니다.

## Enhanced clusters now available
* **Services:** Container Engine for Kubernetes
* **Release Date:** March 14, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/8488d7da-0794-47be-a75c-9a094f4b8d45/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/8488d7da-0794-47be-a75c-9a094f4b8d45/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 기존 OKE 클러스터보다 더 향상된 기능을 포함하는 클러스터를 생성할 수 있습니다. 향상된 클러스터 (Enhanced Cluster)에서는 다음 기능을 수행할 수 있습니다.
* 가상 노드 사용으로 노드 관리 단순화
* 좀 더 세분화된 방법으로 Cluster add-ons을 배포하고 구성
* Workload identity를 통해 보안 강화
* 하나의 클러스터에서 더 많은 워커노드 지원
* Kubernetes API 서버 가동 시간 및 가용성에 대한 SLA 지원

기존 클러스터를 사용하고 있다면 향상된 클러스터(Enhanced Cluster)로 업그레이드를 할 수 있습니다. 업그레이드 방법은 아래 가이드를 참고합니다.

[Upgrading a Basic Cluster to an Enhanced Cluster](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengupgradingbasicclusterstoenhanced.htm)

> 향상된 클러스터 (Enhanced Cluster)에서는 기존 클러스터로 다운그레이드를 할 수 없습니다.

## Support for virtual node pools and virtual nodes
* **Services:** Container Engine for Kubernetes
* **Release Date:** March 15, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengworkingwithvirtualnodes.htm](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengworkingwithvirtualnodes.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
OKE Virtual Node 및 Virtual Node Pool 기능은 기존 Managed Node(컴퓨팅 인스턴스(베어 메탈 또는 가상 머신)에서 실행되며 부분적으로 사용자가 관리)와 다르게 오라클에서 완전 관리하는 Serverless 쿠버네티스 환경입니다. 

> 향상된 클러스터(Enhanced Cluster)에서만 Virtual Node를 지원합니다.

### Virtual Node 특징 및 제약사항
* **리소스 할당:** Managed Node와 다르게 Virtual Node의 리소스 할당은 Workder Node 수준이 아닌 Pod 수준에서 이루어집니다. 즉 Pod 수준에서 CPU 및 메모리 사양이 지정됩니다. Virtual Node에서 프로비저닝된 Pod에 할당된 CPU와 메모리 양을 계산할 때 다음을 고려합니다.
  * Pod 스펙에 지정된 각 컨테이너 별 CPU와 메모리
  * Pod에 있는 컨테이너 개수
  * kube-proxy와 컨테이너 런타임 최소 필요 (메모리: 0.25GB, CPU: 무시할 수 있는 수준)
  * 기본적으로 Pod에서 필요로 하는 CPU 및 메모리 최소값: 0.125 OCPU, 0.5GB 메모리
  * Pod 스펙에 Limits이 있지만, Requests가 정의되어 있지 않은 경우 Limits 값을 참조
  * Pod 스펙에 Requests가 정의되어 있지만, Limits이 정의되어 있지 않은 경우 Requests 값을 참조
  * Pod 스펙에 Limits과 Requests가 모두 지정되어 있는 경우 Limits 값을 참조
  * Pod 스펙에 Limits과 Requests가 지정되어 있지 않은 경우 컨테이너당 0.125 OCPU 및 0.5GB를 사용
  * Virtual Node에서 프로비저닝된 Pod는 한도와 요청을 동일한 값으로 설정하는 것을 권장
* **로드 밸런싱:** Managed Node와 동일하게 Load Balancing은 Pod 사이에 위치합니다. Virtual Node에서는 Load Balancer Security List가 자동으로 활성되지 않으며, 수동으로 구성해야 합니다. Virtual Node에서 실행중인 Pod에 연결할 때 **<node-ip>:<nodeport>**가 아닌 **<pod-ip>:<nodeport>**로 구문을 사용합니다. Pod 및 Node가 서로 다른 서브넷에 위치한 경우 Pod 서브넷에서 Node Port Ingress 구성을 해야 합니다.
* **포드 네트워킹:** VCN-Native Pod Networking만 지원됩니다(Flannel CNI 플러그인은 지원되지 않음). 이 외에 Managed Node와 다음과 같은 구성 차이가 있습니다.
  * 하나의 VNIC만 각 Virtual Node에 연결됩니다.
  * Pod가 생성되기 전에 IP 주소가 미리 할당되지 않습니다.
  * VCN-Native Pod Networking CNI 플러그인은 kube-system 네임스페이스에서 실행 중인 것으로 보이지 않습니다.
  * VCN-Native Pod Networking만 지원되므로 Pod 서브넷 라우팅 테이블에는 NAT 게이트웨이(인터넷 게이트웨이 아님) 및 서비스 게이트웨이에 대해 정의된 라우팅 규칙이 있어야 합니다.
* **자동 확장:** Virtual Node는 500개의 포드까지 자동으로 확장됩니다. 오라클은 Virtual Node하에서 리소스를 관리하기 때문에 Horizontal Pod Autoscaler (HPA)로 관리합니다. Kubernetes Cluster Autoscaler(Virtual Node에서 지원 안함)를 사용할 필요 없고, Vertical Pod Autoscaler 또한 Virtual Node에서 지원하지 않습니다.

기타 Virtual Node에 대한 제약 사항은 다음 문서의 **Notable Kubernetes features and capabilities not supported when using virtual nodes** 항목과 **Common deployments not supported, and supported differently, when using virtual nodes** 항목을 참고합니다.

[https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcomparingvirtualwithmanagednodes_topic.htm#contengusingvirtualormanagednodes_topic](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcomparingvirtualwithmanagednodes_topic.htm#contengusingvirtualormanagednodes_topic)

## Support for cluster add-on configuration and management
* **Services:** Container Engine for Kubernetes
* **Release Date:** March 15, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengconfiguringclusteraddons.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Kubernetes 클러스터의 기능을 지원하고 확장하는 소프트웨어 도구인 Kubernetes Cluster add-ons을 사용할 수 있습니다. 일부 클러스터 add-on(e.g,  CoreDNS, kube-proxy, CNI plugin for pod networking) 은 클러스터 운영에 필수적인 반면, 일부 클러스터 add-on(e.g. Kubernetes Dashboard, Tiller, Database Operator, Weblogic Operator, Certificate Manager)은 선택 사항이 될 수 있습니다.

> 향상된 클러스터(Enhanced Cluster)에서만 Cluster add-ons를 지원합니다.

이제 Cluster add-ons 기능으로 다음을 수행할 수 있습니다.
* 특정 add-on을 활성화 또는 비활성화합니다.
* add-on 버전을 선택합니다.
* Oracle의 자동 업데이트를 옵트인 및 옵트아웃합니다.
* 승인된 Key/Value 형태의 Argument를 사용하여 add-on에 대한 특정 사용자 지정을 관리할 수 있습니다.

## Support for more worker nodes per Kubernetes cluster
* **Services:** Container Engine for Kubernetes
* **Release Date:** March 15, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contenglargenodelimitconsiderations.htm](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contenglargenodelimitconsiderations.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
향상된 클러스터(Enhanced Cluster)에서는 클러스터당 2,000개 까지 노드 확장을 지원합니다. (기존 1,000개)  
이 외에도 Virtual Node의 경우 리전 별 9개까지 지원하며, 하나의 Virtual Node당 500개까지 Pod를 지원합니다. (Universal Credit 기준)

![](/assets/img/cloudnative-security/2023/2023-03-30-cloudnative-security-release-notes-1.png)

## Support for workload identity to improve cluster security
* **Services:** Container Engine for Kubernetes
* **Release Date:** March 15, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contenggrantingworkloadaccesstoresources.htm](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contenggrantingworkloadaccesstoresources.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
Kubneretes에서 Workload는 클러스터에서 실행되는 애플리케이션을 의미합니다. OCI의 Kubneretes 클러스터에서 실행되는 워크로드는 그 자체로 리소스로 간주되며, 이 Workload 리소스는 Cluster, Namespace, Service Account의 고유한 조합으로 식별됩니다. 이 고유의 조합을 Workload Identity라고 합니다. 이 Workload Identity를 IAM 정책에서 사용할 수 있으며, 이를 통해 Workload에서 OCI 리소스에 대한 세분화된 액세스 권한을 부여할 수 있습니다. 또한 OCI Audit을 통해서 각 Workload Identity 요청을 추적할 수 있으며, 이를 통해서 무단 액세스 및 의심스러운 활동을 모니터링 할 수 있습니다.

Workload의 모든 Pod에서 OCI 리소스에 대한 액세스 권한을 부여하려면 다음과 같은 작업이 필요합니다.
* Service Account를 위한 Namespace를 생성
* 애플리케이션을 위한 Service Account 생성
* Workload 리소스에서 OCI 리소스 액세스를 위한 IAM Policy 생성
* 적합한 OCI SDK를 다운로드하고 구성
* 애플리케이션 소스에서 다음 내용을 추가
  * OKE workload identity provider를 통해 인증될 수 있도록 작성
  * 액세스할 OCI 리소스
* 애플리케이션의 Deployment Spec을 업데이트하여 Workalod의 모든 Pod가 Service Account를 사용하도록 지정

Workload Identity를 사용할 때 주의사항
* Dynamic Group에서는 Workload Identity를 사용할 수 없음
* OCI SDK 에서만 Workload Identity를 지원 (not with the Console or the API)
* 지원되는 OCI SDK
  * Go SDK v65.32.0(이상)
  * Java SDK v2.54.0(이상)

### Java SDK를 사용하여 애플리케이션 Workload에 OCI 리소스에 대한 액세스 권한 부여 예시
1) Service Account를 위한 Namespace 생성
  ```
  $ kubectl create namespace <namespace-name>
  ```

  예시
  ```
  $ kubectl create namespace Finance
  ```

2) Service Account 생성
  ```
  $ kubectl create serviceaccount <service-account-name> \
    --namespace <namespace-name>
  ```

  예시
  ```
  kubectl create serviceaccount FinanceServiceAccount \
    --namespace Finance
  ```

3) IAM Policy 작성
  ```
  Allow any-user to <verb> <resource> in <location> where all {
    request.principal.type = 'workload',
    request.principal.namespace = '<namespace-name>',
    request.principal.service_account = '<service-account-name>',
    request.principal.cluster_id = '<cluster-ocid>'}
  ```

  예시
  ```
  Allow any-user to manage objects in tenancy where all {
    request.principal.type = 'workload',
    request.principal.namespace = 'Finance',
    request.principal.service_account = 'FinanceServiceAccount',
    request.principal.cluster_id = 'ocid1.cluster.oc1.iad.aaaaaaaaaf______jrd'}
  ```

4) 애플리케이션의 pom.xml에 oci-java-sdk-addons-oke-workload-identity 아티팩트를 Dependency로 추가
  ```
  <dependency>
  <groupId>com.oracle.oci.sdk</groupId>
  <artifactId>oci-java-sdk-addons-oke-workload-identity</artifactId>
  <version>2.54.0</version>
  </dependency>

  <dependency>
  <groupId>com.oracle.oci.sdk</groupId>
  <artifactId>oci-java-sdk-common</artifactId>
  <version>2.54.0</version>
  </dependency>
  ```

5) Java 애플리케이션 코드에 다음을 추가
  * OKE Workload Identity Provider ( OkeWorkloadIdentityAuthenticationDetailsProvider)
  * 액세스할 OCI 리소스

  예시
  ```java
  import com.oracle.bmc.Region;
  import com.oracle.bmc.auth.AuthenticationDetailsProvider;
  import com.oracle.bmc.auth.ConfigFileAuthenticationDetailsProvider;
  import com.oracle.bmc.auth.okeworkloadidentity.OkeWorkloadIdentityAuthenticationDetailsProvider;
  import com.oracle.bmc.objectstorage.ObjectStorage;
  import com.oracle.bmc.objectstorage.ObjectStorageClient;
  import com.oracle.bmc.objectstorage.model.BucketSummary;
  import com.oracle.bmc.objectstorage.requests.GetNamespaceRequest;
  import com.oracle.bmc.objectstorage.requests.GetObjectRequest;
  import com.oracle.bmc.objectstorage.requests.ListBucketsRequest;
  import com.oracle.bmc.objectstorage.requests.ListBucketsRequest.Builder;
  import com.oracle.bmc.objectstorage.responses.GetNamespaceResponse;
  import com.oracle.bmc.objectstorage.responses.GetObjectResponse;
  import com.oracle.bmc.objectstorage.responses.ListBucketsResponse;

  import java.io.InputStream;

  public class ObjectStorageSyncExample {

      public static void main(String[] args) throws Exception {
          /* Config the Container Engine for Kubernetes workload identity provider */
          final OkeWorkloadIdentityAuthenticationDetailsProvider provider = new OkeWorkloadIdentityAuthenticationDetailsProvider
                  .OkeWorkloadIdentityAuthenticationDetailsProviderBuilder()
                  .build();

          /* Configure the client to use workload identity provider*/
          ObjectStorage client =
                  ObjectStorageClient.builder().region(Region.US_PHOENIX_1).build(provider);

          GetNamespaceResponse namespaceResponse =
                  client.getNamespace(GetNamespaceRequest.builder().build());
          String namespaceName = namespaceResponse.getValue();
          System.out.println("Using namespace: " + namespaceName);

          Builder listBucketsBuilder =
                  ListBucketsRequest.builder()
                          .namespaceName(namespaceName)
                          .compartmentId("enter tenancy id");

          String nextToken = null;
          do {
              listBucketsBuilder.page(nextToken);
              ListBucketsResponse listBucketsResponse =
                      client.listBuckets(listBucketsBuilder.build());
              for (BucketSummary bucket : listBucketsResponse.getItems()) {
                  System.out.println("Found bucket: " + bucket.getName());
              }
              nextToken = listBucketsResponse.getOpcNextPage();
          } while (nextToken != null);

          // fetch the file from the object storage
          String bucketName = null;
          String objectName = null;
          GetObjectResponse getResponse =
                  client.getObject(
                          GetObjectRequest.builder()
                                  .namespaceName(namespaceName)
                                  .bucketName(bucketName)
                                  .objectName(objectName)
                                  .build());

          // stream contents should match the file uploaded
          try (final InputStream fileStream = getResponse.getInputStream()) {
              // use fileStream
          } // try-with-resources automatically closes fileStream

          client.close();
      }
  }
  ```

5) 애플리케이션의 Deployment Spec을 열고 다음을 추가
  * serviceAccountName을 Service Account의 이름으로 설정
    * 예시: serviceAccountName: FinanceServiceAccount
  * automountServiceAccountToken을 추가하고 true로 설정

  예시
  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: nginx
  spec:
  serviceAccountName: FinanceServiceAccount
  automountServiceAccountToken: true
  containers:
    - name: nginx
      image: nginx:1.14.2
      ports:
      - containerPort: 80
  ```

6) 배포
  ```
  $ kubectl create -f <filename>
  ```

  예시
  ```
  $ kubectl create -f financeworkloadidentity.yaml
  ```

## Support for additional GPU shapes
* **Services:** Container Engine for Kubernetes
* **Release Date:** March 16, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengrunninggpunodes.htm#contengrunninggpunodes_topic-supportedgpushapes](https://docs.oracle.com/iaas/Content/ContEng/Tasks/contengrunninggpunodes.htm#contengrunninggpunodes_topic-supportedgpushapes){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 OKE Worker Node로 기존 GPU Shape외에 다음 GPU Shape을 추가 지원합니다.

* BM.GPU.A100-v2.8
* BM.GPU.GM4.8
* BM.GPU.A10.4
* BM.GPU.GU1.4
* VM.GPU.A10.1
* VM.GPU.GU1.1
* VM.GPU.A10.2
* VM.GPU.GU1.2

OKE에서 지원되는 GPU Shape에 대한 자세한 정보는 아래 링크를 참고합니다.  
[https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengrunninggpunodes.htm#contengrunninggpunodes_topic-supportedgpushapes](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengrunninggpunodes.htm#contengrunninggpunodes_topic-supportedgpushapes)

## Support for pre-built functions
* **Services:** Functions
* **Release Date:** March 21, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_pbf_creating_prebuilt.htm](https://docs.oracle.com/iaas/Content/Functions/Tasks/functions_pbf_creating_prebuilt.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Functions에서는 오라클에서 제공하는 Pre-built Function을 위한 카탈로그를 제공합니다. Pre-built Function은 사용자가 코드를 만들거나 관리할 필요 없으며, 바로 사용할 수 있습니다.

다음은 현재 제공되고 있는 Pre-built Functions 입니다.
* Media Workflow Job Spawner : OCI Media Flow를 사용하여 미디어 처리를 자동화하여 비디오가 Object Storage 버킷에 업로드될 때 트랜스코딩합니다. 
* Zero Quota Policy Creator : 자원 할당량 정책 생성을 자동화하여 사전 대비를 위한 비용 거버넌스(proactive cost governance)를 위한 OCI 환경의 일부로 예산을 통제합니다.
* Object Storage File Zip : 압축된 소스를 해제하거나, OCI Data Integration 서비스를 통해 수신된 데이터를 Object Storage에 저장합니다.
* Object Storage File Extractor : Data Flow Integration 작업을 사용하여 소스 파일을 성공적으로 압축 해제하기 위해 Data Integration Pipeline의 일부로 unzip PBF 기능을 통합합니다.

## Support for customizing build runner shape
* **Services:** Functions
* **Release Date:** March 21, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/devops/using/add_buildstage.htm](https://docs.oracle.com/en-us/iaas/Content/devops/using/add_buildstage.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 DevOps 서비스에서 Build Stage에서 사용하는 Build Runner Shape에 대해서 OCPU 수와 메모리 양(GB)을 선택하여 사용자 정의할 수 있습니다.

![](/assets/img/cloudnative-security/2023/2023-03-30-cloudnative-security-release-notes-2.png)

> 사용자 정의의 경우 프로비저닝 시간이 더 오래 소요됩니다.

## DevOps now supports validating external connection
* **Services:** Functions
* **Release Date:** March 28, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/devops/using/validate_connection.htm](https://docs.oracle.com/en-us/iaas/Content/devops/using/validate_connection.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 DevOps는 개인용 액세스 토큰(PAT)이 활성화되었는지 여부를 확인하기 위해 생성한 외부 코드 리포지토리에 대한 연결의 유효성을 검사합니다. 일반적으로 PAT가 삭제되었거나 만료된 경우 런타임 시 연결 실패가 발생할 수 있는데, 유효성 검사를 통해 이러한 런타임 연결 실패를 사전에 방지할 수 있습니다.

> 유효성 검사가 성공하였다 하더라도 PAT가 선택한 리포지토리에 액세스할 수 있는 권한이 없는 등의 이유로 빌드가 실패할 수 있습니다.

![](/assets/img/cloudnative-security/2023/2023-03-30-cloudnative-security-release-notes-3.png)

> 현재는 GitLab 및 Bitbucket에 대한 연결에는 유효성 검사를 지원하지 않습니다.


