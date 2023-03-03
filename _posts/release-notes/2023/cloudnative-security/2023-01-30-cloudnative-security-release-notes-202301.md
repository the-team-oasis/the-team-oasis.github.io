---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "1월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 1월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - Jan-2023
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

## Logging Analytics: Monitor and manage Kubernetes with our Marketplace app
* **Services:** Container Engine for Kubernetes, Logging Analytics
* **Release Date:** Jan. 9, 2023
* **Documentation:** [https://cloudmarketplace.oracle.com/marketplace/listing/136942717](https://cloudmarketplace.oracle.com/marketplace/listing/136942717){:target="_blank" rel="noopener"}

### 서비스 소개
이제 Oracle Kubernetes Engine(OKE) 모니터링을 위한 OCI Logging Analytics 대시보드를 OCI 마켓플레이스를 통해서 제공합니다. 


### 지원하는 로그 유형

현재 수집되는 OKE 서비스 로그들은 다음과 같습니다.
* Kube Proxy
* Kube Flannel
* Kubelet
* CoreDNS
* CSI Node Driver
* DNS Autoscaler
* Cluster Autoscaler
* Proxymux Client
* Linux System Logs

또한 다음과 같은 리눅스 시스템 로그를 수집하여 모니터링합니다.
* Syslog
* Secure logs
* Cron logs
* Mail logs
* Audit logs
* Ksplice Uptrack logs
* Yum logs
* Control Plane Logs

현재 다음의 OKE Object의 상태를 대시보드에서 확인할 수 있습니다.
* Nodes
* Namespaces
* Pods
* DaemonSets
* Deployments
* ReplicaSets
* Events

> 현재는 Control Plane의 로그는 다루지 않지만, 곧 Control Plane 로그 모니터링도 지원 예정입니다.

### 스크린샷
**Topology**  
![](https://cloudmarketplace.oracle.com/marketplace/content?contentId=136942971)

**Monitoring Dashboards**  
![](https://cloudmarketplace.oracle.com/marketplace/content?contentId=136943018)

**Pods**  
![](https://cloudmarketplace.oracle.com/marketplace/content?contentId=136943235)

**Cluster**  
![](https://cloudmarketplace.oracle.com/marketplace/content?contentId=136943296)

**Infrastructure**  
![](https://cloudmarketplace.oracle.com/marketplace/content?contentId=136943554)

---

## OCI Search with OpenSearch now supports the OpenSearch Index State Management plugin
* **Services:** Search Service with OpenSearch
* **Release Date:** Jan. 12, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Tasks/ociopensearchindexstatemanagement.htm](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Tasks/ociopensearchindexstatemanagement.htm){:target="_blank" rel="noopener"}

### 서비스 소개
이제 OCI Search with OpenSearch 서비스에서 인덱스 상태 관리(Index State Management: ISM)를 위한 플러그인을 지원합니다. ISM은 인덱스 수명, 인덱스 크기 또는 문서 수의 변경 사항을 기반으로 트리거하여 이러한 주기적인 관리 작업을 자동화할 수 있는 플러그인입니다. ISM을 사용하면 인덱스 롤오버 혹은 삭제를 자동화할 수 있습니다.

ISM에 대한 자세한 내용은 아래 링크를 참고합니다.  
[Index State Management](https://opensearch.org/docs/1.2/im-plugin/ism/index/)

### ISM 적용하기
ISM은 Opensearch 대시보드에서 ISM 정책을 생성하여 적용할 수 있습니다. 정책은 다음과 같은 항목에 대해서 작성하여야 하며, JSON 형태로 작성할 수 있습니다.

* State: 인덱스의 상태 이름을 정의
* Actions: 해당 상태가 되었을 때 ISM이 수행하는 액션을 정의
* Transitions: 다음 상태로 이동하기 위한 조건을 정의

#### Index Rollups
시계열 데이터는 스토리지 비용을 증가시키고, 클러스터 상태에 부담을 주며 시간이 지날수록 처리 속도를 저하시킵니다. 인덱스 롤업을 활용하면 오래된 데이터를 압축된 인덱스로 롤업하여 데이터 세분성을 줄일 수 있습니다.

참고: [Index Rollups](https://opensearch.org/docs/latest/im-plugin/index-rollups/index/)

#### Index transforms
특정 필드를 중심으로 데이터의 요약 보기를 생성할 수 있으며, 이를 통해서 다양한 방식으로 데이터를 시각화하거나 분석할 수 있습니다. 예를 들어 여러 필드와 카테고리로 나눠져 있는 항공사 데이터가 있다고 가정할 때 항공사, 분기 및 가격별로 구성된 데이터 요약을 보고 싶다고 가정할 수 있습니다. 변환 작업을 사용하면 이러한 특정 범주로 구성된 새로운 요약 인덱스를 생성할 수 있습니다.

참고: [Index transforms](https://opensearch.org/docs/latest/im-plugin/index-transforms/index/)

#### ISM Policy 예시
```
{
  "policy": {
    "description": "hot warm delete workflow",
    "default_state": "hot",
    "schema_version": 1,
    "states": [
      {
        "name": "hot",
        "actions": [
          {
            "rollover": {
              "min_index_age": "1d"
            }
          }
        ],
        "transitions": [
          {
            "state_name": "warm"
          }
        ]
      },
      {
        "name": "warm",
        "actions": [
          {
            "replica_count": {
              "number_of_replicas": 5
            }
          }
        ],
        "transitions": [
          {
            "state_name": "delete",
            "conditions": {
              "min_index_age": "30d"
            }
          }
        ]
      },
      {
        "name": "delete",
        "actions": [
          {
            "notification": {
              "destination": {
                "chime": {
                  "url": "<URL>"
                }
              },
              "message_template": {
                "source": "The index {{ctx.index}} is being deleted"
              }
            }
          },
          {
            "delete": {}
          }
        ]
      }
    ]
  }
}
```

---

## OCI Search with OpenSearch now supports the OpenSearch Snapshot API
* **Services:** Search Service with OpenSearch
* **Release Date:** Jan. 12, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/snapshotapibackups.htm](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/snapshotapibackups.htm){:target="_blank" rel="noopener"}

### 서비스 소개
이제 OCI Search with OpenSearch에서 OpenSearch Snapshot API를 사용할 수 있습니다. Snapshot API를 사용하여 OpenSearch 클러스터의 스냅샷을 만들고 복원할 수 있습니다. 스냅샷 플러그인을 사용하면 문제가 있는 클러스터를 복구하거나 다른 클러스터로 마이그레이션을 할 수 있습니다.

자세한 내용은 아래 링크를 참고합니다.  
[Take and restore snapshots](https://opensearch.org/docs/1.2/opensearch/snapshot-restore/)

> 스냅샷은 Object Storage에 저장되며, Object Storage 비용이 발생합니다.

### 스냅샷 생성
스냅샷 생성을 위해서는 우선 Object Storage Bucket을 준비합니다. 또한 OpenSearch Cluster에서 Object Storage에 접근하기 위한 IAM Policy를 생성하여야 합니다.

```
DEFINE tenancy opensearch-tenancy as ocid1.tenancy.oc1..<unique_ID>
ADMIT resource opensearch opensearchsnapshots of tenancy opensearch-tenancy to manage object-family in compartment <snapshot_bucket_compartment> where ALL {request.principal.clusterid='<cluster_OCID>', request.principal.ownertenant='<cluster_tenancy_OCID>', request.principal.ownercompartment='<cluster_compartment_OCID>', target.bucket.name='<snapshot_bucket_name>'}
```

스냅샷을 생성하기 위해서는 다음과 같이 OpenSearch Dashboard에서 저장소를 등록해주어야 합니다.
```
PUT _snapshot/<repository_name>
{
  "type": "oci",
  "settings": {
    "client": "default",
    "endpoint": "https://objectstorage.us-ashburn-1.oraclecloud.com",
    "bucket": "<bucket_name>",
    "namespace": "<namespace>",
    "authType": "RESOURCE_PRINCIPAL",
    "bucket_compartment_id": "<bucket_compartment_OCID>",
    "forceBucketCreation": true
  }
}
```

> forceBucketCreation 값을 true로 지정한 경우에는 해당 Bucket이 없는 경우 바로 생성해줄 수 있습니다.

스냅샷 생성은 OpenSearch Dashboard에서 다음 API를 사용합니다.
```
POST _snapshot/<repository_name>/<snapshot_name>?wait_for_completion=true
```

또한 특정 인덱스를 포함하거나 제외하여 스냅샷을 생성할 수 있습니다.
```
PUT _snapshot/my-repository/2
{
  "indices": "opensearch-dashboards*,my-index*,-my-index-2016",
  "ignore_unavailable": true,
  "include_global_state": false,
  "partial": false
}
```

### 스냅샷 복원
다음은 모든 스냅샷 조회 예시입니다.
```
GET _snapshot/_all?pretty
```

다음은 특정 저장소에 있는 스냅샷만 조회하는 예시입니다.
```
GET _snapshot/<repository_name>?pretty
```

다음은 특정 스냅샷을 복구하는 예시입니다.
```
POST _snapshot/<repository_name>/<snapshot_name>/_restore
{
     "indices": "opensearch-dashboards*,my-index*,-my-index-2016",
     "ignore_unavailable": true,
     "include_global_state": false,
     "rename_pattern": "(.+)",
     "rename_replacement": "restored_$1",
     "include_aliases": true
```

## Reduce the number of sign-in prompts by using Keep me signed in
* **Services:** IAM
* **Release Date:** Jan. 31, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/0f93d003-947b-46e9-b3fd-732de7bfa592/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/0f93d003-947b-46e9-b3fd-732de7bfa592/){:target="_blank" rel="noopener"}

### 서비스 소개
OCI에 로그인되어 있는 사용자 세션 유지 시간을 관리할 수 있는 기능으로, 관리자가 Identity Domain Settings에서 **Enable Keep me signed in**를 선택하면 다음과 같은 설정을 할 수 있습니다.
1. Keep me signed in duration (days): 로그인 상태를 유지할 수 있는 기간(days)
2. Reauthentication interval (days): 만일 사용자가 **Keep me signed in** 기능을 사용하지 않고 로그인 한 경우, 재 인증해야 하는 간격 (days)
3. Maximum keep me signed-in sessions: 사용자가 가질 수 있는 최대 로그인 세션 수

#### Sign-On Policy에서 Keep me signed in 설정
Sign-on Rule 설정에서 **Keep me signed-in session is present** 옵션을 선택하는 경우에는, 사용자가 **Keep me signed-in** 상태에서 세션이 만료되어 다시 로그인 하는 경우에 Sign-On Policy(재인증 혹은 MFA와 같은)를 따라야 합니다.

#### Clearing All Keep Me Signed-In Sessions for a User
관리자가 특정 사용자의 **Keep me signed-in** 세션을 모두 삭제할 수 있습니다. **Identity & Security > Identity > Domains > Users**로 이동하여 작업할 사용자를 선택한 후 **More Actions**에서 **Clear all signed-in sessions**를 클릭하면 모든 로그인된 세션이 사라지게 됩니다.

#### Accessing Your Keep Me Signed-In Sessions
사용자는 자신의 **Keep Me Signed-In** 세션을 확인할 수 있고, 삭제할 수 있습니다. OCI Console 우측 상단의 **My Profile**을 클릭한 후 **Keep me signed-in sessions** 세션을 선택하면 **Keep me signed-in sessions** 목록을 확인할 수 있습니다. 또한 하나 이상의 세션을 선택한 후 **Clear session**를 클릭하면 해당 세션을 삭제할 수 있습니다.