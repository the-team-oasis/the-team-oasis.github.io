---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "9월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 9월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - Sept-2023
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

## Container Instances now support Arm-based Ampere A1.Flex shape
* **Services:** Container Instances
* **Release Date:** Sept. 7, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/container-instances/container-instance-shapes.htm#container-instance-shapes](https://docs.oracle.com/en-us/iaas/Content/container-instances/container-instance-shapes.htm#container-instance-shapes){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Container Instance에서 ARM 기반의 Ampere A1.Flex Shape (CI.Standard.A1.Flex)을 지원합니다. 다음은 현재 Container Instance에서 지원하는 Shape 목록입니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="스케쥴 태그 설명"><caption></caption><colgroup><col><col><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__0" style="width:100px">Shape</th>
      <th class="entry" id="About__entry__1" style="width:300px">OCPU</th>
      <th class="entry" id="About__entry__2" style="width:300px">Memory (GB)</th>
      <th class="entry" id="About__entry__3" style="width:300px">Ephemeral Storage (GB)</th>
      <th class="entry" id="About__entry__4" style="width:300px">Max Network Bandwidth</th>
      <th class="entry" id="About__entry__5" style="width:300px">Max VNICs Total: Linux</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__0"><span class="ph">CI.Standard.E3.Flex</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">Minimum: 1 OCPU<br><br> Maximum: 64 OCPU (with extended OCPUs)</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">Minimum: 1 GB or a value matching the number of OCPUs, whichever is greater<br><br>Maximum: 64 GB per OCPU, up to 1024 GB total</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">15</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">1 Gbps per OCPU, maximum 40 Gbps</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">1 VNIC</span></td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__0"><span class="ph">CI.Standard.E4.Flex</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">Minimum: 1 OCPU<br><br>Maximum: 64 OCPU (with extended OCPUs)</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">Minimum: 1 GB or a value matching the number of OCPUs, whichever is greater<br><br>Maximum: 64 GB per OCPU, up to 1024 GB total</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">15</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">1 Gbps per OCPU, maximum 40 Gbps</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">1 VNIC</span></td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__0"><span class="ph">CI.Standard.A1.Flex</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">Minimum: 1 OCPU<br><br>Maximum: 76 OCPU (with extended OCPUs)</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">Minimum: 1 GB or a value matching the number of OCPUs, whichever is greater<br><br>Maximum: 64 GB per OCPU, up to 488 GB total</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">15</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">1 Gbps per OCPU, maximum 40 Gbps</span></td>
      <td class="entry" headers="About__entry__0"><span class="ph">1 VNIC</span></td>
      </tr>
      </tbody>
</table>

---

## Support for virtual nodes running pods on Arm shapes
* **Services:** Container Engine for Kubernetes
* **Release Date:** Sept. 12, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Reference/contengimagesshapes.htm#shapes#ariaid-title3](https://docs.oracle.com/en-us/iaas/Content/ContEng/Reference/contengimagesshapes.htm#shapes#ariaid-title3){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Virtual Node에서 Pod 운영을 위한 ARM 기반의 Ampere A1.Flex Shape 을 사용할 수 있습니다. 현재까지 Virtual Node에서 지원하는 Shape은 다음과 같습니다.

* Pod.Standard.A1.Flex
* Pod.Standard.E3.Flex
* Pod.Standard.E4.Flex

---

## Support for Container Engine for Kubernetes service logs
* **Services:** Container Engine for Kubernetes
* **Release Date:** Sept. 12, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/ContEng/Reference/contengimagesshapes.htm#shapes#ariaid-title3](https://docs.oracle.com/en-us/iaas/Content/ContEng/Reference/contengimagesshapes.htm#shapes#ariaid-title3){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 OKE의 Control Plane Process Log(kube-scheduler, kube-controller-manager, cloud-controller-manager, and kube-apiserver)를 OCI Logging 서비스를 통해서 볼 수 있습니다. 해당 로그를 통해서 다음과 같은 내용을 확인할 수 있습니다.

* kube-scheduler log: scheduler decisions 로그
* kube-controller-manager log: reconciling the deployment 로그
* cloud-controller-manager log: provisioning the load balancer 로그
* kube-apiserver log: every request sent to the Kubernetes API server 로그

이 기능은 **Observability & Management**의 **Logging** 서비스를 통해서 활성화 활 수 있습니다.
![](/assets/img/cloudnative-security/2023/2023-09-28-cloudnative-security-release-notes-1.png)

다음과 같이 Service로 **Container Engine for Kubernetes**를 선택한 후 Resouce(Cluster)와 모니터링 하기위한 Category를 선택, Log Name을 입력한 후 Enable Log를 클릭합니다.
![](/assets/img/cloudnative-security/2023/2023-09-28-cloudnative-security-release-notes-2.png)

이제 다음과 같이 Logging 서비스에서 관련 로그를 볼 수 있습니다.
![](/assets/img/cloudnative-security/2023/2023-09-28-cloudnative-security-release-notes-3.png)

--- 

## Support for Kubernetes version 1.26.7, 1.25.12
* **Services:** Container Engine for Kubernetes
* **Release Date:** Sept. 12, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/446f0cda-375f-4877-8fb9-84ea750f5353/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/446f0cda-375f-4877-8fb9-84ea750f5353/){:target="_blank" rel="noopener"}

### 릴리즈 내용
OKE에 Kubernetes 1.26.7, 1.25.12 버전이 추가되었습니다. 이로써 기존 **1.26.2** 버전과 **1.25.4** 버전은 더 이상 지원하지 않습니다.

### 현재 지원 버전
* 1.27.2
* 1.26.7 (1.26.2 대체)
* 1.25.12 (1.25.4 대체)

## Support for Different Application Shapes
* **Services:** Functions
* **Release Date:** Sept. 12, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/Functions/Tasks/functionsspecifyingcomputearchitectures.htm](https://docs.oracle.com/iaas/Content/Functions/Tasks/functionsspecifyingcomputearchitectures.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 Function을 배포할 때 Function을 실행하기 위한 Compute Instance의 Process Architecture를 지정할 수 있습니다. 단일 아키텍처(ex. Arm)에서 실행하거나 여러 아키텍처(ex. Arm, x86 모두)에서 실행되도록 할 수 있습니다.

다음과 같이 Functions Appliation을 생성할 때 Shape을 선택할 수 있으며, 여러 아키텍처로 구성하고자 할 경우 **GENERIC_X86_ARM**을 선택합니다.
![](/assets/img/cloudnative-security/2023/2023-09-28-cloudnative-security-release-notes-4.png)

여러 아키텍처를 지원하는 Function을 배포할 경우, 일반적으로 권장하는 방식은 fn 명령어를 사용하는 것입니다.
```
$ fn -v deploy --app <app-name>
```

이 외에도 **Docker buildx plugin**을 사용하여 빌드하는 방식도 제공합니다. 상세한 내용은 다음 링크를 참고합니다.  
[https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionsspecifyingcomputearchitectures.htm#functionsbuildingmultiarchimages-fnprojectcli](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionsspecifyingcomputearchitectures.htm#functionsbuildingmultiarchimages-fnprojectcli)

## Search with OpenSearch now supports OpenID Connect
* **Services:** Search Service with OpenSearch
* **Release Date:** Sept. 14, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/ociopensearchopenid.htm](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/ociopensearchopenid.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 OpenSearch 서비스에서 OpenID Connect를 지원합니다. OpenSearch Cluster 접근을 위해 Identity Provider를 통해 발급받은 토큰을 활용할 수 있습니다.

### 설정 방법
OpenSearch Security Plugin의 [Configuration API](https://opensearch.org/docs/2.3/security/access-control/api/#configuration)를 통해서 OpenID Connect를 활성화 할 수 있습니다. 다음은 예시 입니다.

```
PUT _plugins/_security/api/securityconfig/config
{
  "dynamic": {
    "security_mode": "ENFORCING",
    "http": {
      "anonymous_auth_enabled": false,
      "xff": {
        "enabled": false
      }
    },
    "authc": {
      "openid_auth_domain": {
                    "http_enabled": true,
                    "transport_enabled": true,
                    "order": 0,
                    "http_authenticator": {
                        "challenge": false,
                        "type": "openid",
                        "config": {
                            "subject_key": "sub",
                            "roles_key": "sub",
                            "openid_connect_url": "https://idcs-<IDCS_Instance_ID>.identity.oraclecloud.com/.well-known/openid-configuration"
                        }
                    },
                    "authentication_backend": {
                        "type": "noop",
                        "config": {}
                    },
                    "description": "Authenticate using OpenId connect"
                },
                "basic_internal_auth_domain": {
                    "http_enabled": true,
                    "transport_enabled": true,
                    "order": 1,
                    "http_authenticator": {
                        "challenge": true,
                        "type": "basic",
                        "config": {}
                    },
                    "authentication_backend": {
                        "type": "intern",
                        "config": {}
                    },
                    "description": "Authenticate via HTTP Basic against internal users database"
                }
    },
    "authz": null
  }
}
```

OpenID Connect를 사용할 경우 다음과 같이 Identity Provider를 통해서 발급받은 Access Token을 활용합니다. 아래는 Cluster heath API를 사용할 때 OpenID Connect를 활용한 예시입니다.
```
GET /_cluster/health
Authorization: Bearer <access_token>
```

참고로 IDCS에서 Access Token을 발급받는 방법은 아래 링크를 참고합니다.  
[Using Access Token Authorization with My Services API](https://docs.oracle.com/iaas/Content/MyServices/Tasks/usingoauth.htm)

---

## Ingest Log Data with Search with OpenSearch
* **Services:** Search Service with OpenSearch
* **Release Date:** Sept. 14, 2023
* **Documentation:** [https://docs.oracle.com/iaas/Content/search-opensearch/Tasks/ingestinglogstashdata.htm](https://docs.oracle.com/iaas/Content/search-opensearch/Tasks/ingestinglogstashdata.htm){:target="_blank" rel="noopener"} [https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Tasks/ingestingfluentbit.htm](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Tasks/ingestingfluentbit.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
OpenSearch Cluster로 데이터를 전달하기 위해 Aggregator인 Logstash와 Collector인 Fluent Bit를 활용할 수 있습니다. 

### Logstash 설치 및 구성
OpenSearch Aggregator를 위한 Logstash Plugin (Logstash OSS with OpenSearch Output Plugin) 설치 및 구성 방법은 [Ingesting Data into an OpenSearch Cluster with Logstash](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Tasks/ingestinglogstashdata.htm)의 **Install and Configure LogStash** 부분을 참고합니다.

### Fluent Bit 설치 및 구성
OpenSearch Collector를 위한 Fluent Bit 설치 및 구성 방법은 [Ingesting Data into an OpenSearch Cluster with Fluent Bit](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Tasks/ingestingfluentbit.htm)의 **Install and Configure Fluent Bit** 부분을 참고합니다.

---

## Search with OpenSearch now supports OpenSearch Dashboards multi-tenancy
* **Services:** Search Service with OpenSearch
* **Release Date:** Sept. 14, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/opensearchmultitenant.htm](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/opensearchmultitenant.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 OpenSearch Cluster를 Mutl-Tenancy를 위한 환경으로 구성할 수 있습니다. 여기서의 Tenancy는 OCI의 Tenancy가 아닌 OpenSearch의 Tenancy를 의미합니다. OpenSearch Dashboard에서 Tenant는 index pattern, visualization, dashboard 및 기타 OpenSearch Dashboard 요소를 저장하는 단위입니다. Tenant는 다음 두 가지로 구분할 수 있습니다.

* Private: OpenSearch Dashboard 사용자는 데이터를 서로 공유할 수 없고, 오직 특정 사용자만 접근할 수 있습니다.
* Global: 모든 OpenSearch Dashboard 사용자 사이에서 데이터를 공유할 수 있습니다.

OpenSearch Dashboards multi-tenancy에 대한 더 자세한 정보는 아래 링크를 통해서 확인할 수 있습니다.  
[OpenSearch Dashboards multi-tenancy](https://opensearch.org/docs/2.3/security/access-control/multi-tenancy)

### Multi-Tenancy 기능 활성 여부 확인
다음 Configuration API를 통해서 기능 활성 여부를 확인할 수 있습니다.
```
GET _plugins/_security/api/securityconfig

{
   "config" : {
      "dynamic" : {
         "filtered_alias_mode" : "warn",
         "disable_rest_auth" : false,
         "disable_intertransport_auth" : false,
         "respect_request_indices_options" : false,
         "kibana" : {
            "multitenancy_enabled" : false,
            "server_username" : "kibanaserver",
            "index" : ".kibana"
         },
   <additional securityconfig response returned for GET request>...
```

만일 활성화가 안되어 있다면 다음 예시와 같이 Configuration API를 통해서 활성화 할 수 있습니다.
```
PUT _plugins/_security/api/securityconfig/config
{
   "dynamic": {
      "security_mode": "ENFORCING",
      "kibana": {
         "multitenancy_enabled": true,
         "server_username": "kibanaserver",
         "index": ".kibana_1"
      },
   <additional securityconfig details for PUT request>...
```
