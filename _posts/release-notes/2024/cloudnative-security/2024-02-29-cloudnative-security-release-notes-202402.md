---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "2월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2024년 2월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2024-cloudnative-security
tags:
  - oci-release-notes-2024
  - Feb-2024
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

## Automatic secret generation and periodic secret rotation in Vault
* **Services:** Vault
* **Release Date:** Feb. 9, 2024
* **Documentation:** [https://cloudmarketplace.oracle.com/marketplace/listing/136942717](https://cloudmarketplace.oracle.com/marketplace/listing/136942717){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OCI Vault에서 자동으로 Secret을 생성하도록 구성할 수 있습니다. 또한 Secret 자동 교체를 활성화 하면, 주기적으로 Secret을 변경할 수 있습니다. 

![](/assets/img/cloudnative-security/2024/2024-02-29-cloudnative-security-release-notes-1.png)

또한 OCI Functions의 사전 구현된(Pre-built) Function을 사용하여 Database Secret을 교체하는 기능을 활용할 수 있습니다. 관련된 내용은 아래 링크를 참고하세요.
* [Database Secret Rotation without Wallet Function](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functions_pbf_database_secret_rotation_without_wallet.htm)
* [Database Secret Rotation with Wallet Function](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functions_pbf_database_secret_rotation_with_wallet.htm)

## Document Generator pre-built function now available
* **Services:** Functions
* **Release Date:** Feb. 20, 2024
* **Documentation:** [https://cloudmarketplace.oracle.com/marketplace/listing/136942717](https://cloudmarketplace.oracle.com/marketplace/listing/136942717){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 사전 구현된(Pre-built) Function으로 Document Generator Function이 추가되었습니다. 이 기능은 Office 문서와 JSON 데이터를 기반으로 PDF를 자동으로 생성하는 기능을 제공합니다.

다음은 Function의 Request와 Response 예시입니다.  
**Request**
```
{
  "requestType": "SINGLE",
  "tagSyntax": "DOCGEN_1_0",
  "data": {    
    "source": "OBJECT_STORAGE",
    "namespace": "my_namespace",
    "bucketName": "my_bucket",
    "objectName": "my_folder/movies.json"
  },
  "template": {
    "source": "OBJECT_STORAGE",
    "namespace": "my_namespace",
    "bucketName": "my_bucket",
    "objectName": "my_folder/movies.docx"
  },
  "output": {
    "target": "OBJECT_STORAGE",
    "namespace": "my_namespace",
    "bucketName": "my_bucket",
    "objectName": "my_folder/movies.pdf",
    "contentType": "application/pdf"
   }
}
```

**Response (성공)**
```
{
  "responseType": "SINGLE",
  "code": 200,
  "status": "OK",
  "document": {
    "type": "OBJECT_STORAGE",
    "namespace": "my_namespace",
    "bucketName": "my_bucket",
    "objectName": "my_folder/movies.pdf",
    "contentType": "application/pdf"
  },
  "metadata": {
    "version": "1.0",
    "configurationParameters": {
      "FN_FN_NAME": "docgen",
      "FN_APP_NAME": "docgen-app",
      "FN_TYPE": "sync",
      "FN_APP_ID": "ocid1.fnapp.oc1.phx.example...63m5hsmzzz",
      "OCI_REGION_METADATA": "{\"realmDomainComponent\":\"oraclecloud.com\",\"realmKey\":\"oc1\",\"regionIdentifier\":\"us-phoenix-1\",\"regionKey\":\"PHX\"}",
      "FN_FN_ID": "ocid1.fnfunc.oc1.phx.example...h523viuzzz",
      "FN_MEMORY": "512"
    }
  }
}
```

**Response (실패)**
```
{
  "responseType": "ERROR",
  "code": "400",
  "status": "InvalidParameters",
  "error": "No template has been specified.",
  "metadata": {
    "version": "1.0",
    "configurationParameters": {
      "FN_FN_NAME": "docgen",
      "FN_APP_NAME": "docgen-app",
      "FN_TYPE": "sync",
      "FN_APP_ID": "ocid1.fnapp.oc1.phx.example...63m5hsmzzz",
      "OCI_REGION_METADATA": "{\"realmDomainComponent\":\"oraclecloud.com\",\"realmKey\":\"oc1\",\"regionIdentifier\":\"us-phoenix-1\",\"regionKey\":\"PHX\"}",
      "FN_FN_ID": "ocid1.fnfunc.oc1.phx.example...h523viuzzz",
      "FN_MEMORY": "512"
    }
  }
}
```

**여러 PDF 생성 시 Request**
```
{
  "requestType": "BATCH",
  "tagSyntax": "DOCGEN_1_0",
   "data": {
    "source": "INLINE",
    "content": [{"name":"John"},{"name":"Monica"}]
  },
  "template": {
    "source": "OBJECT_STORAGE",
    "namespace": "my_namespace",
    "bucketName": "my_bucket",
    "objectName": "my_folder/Letters.docx",
    "contentType": "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  },
  "output": {
    "target": "OBJECT_STORAGE",
    "namespace": "my_namespace",
    "bucketName": "my_bucket",
    "objectName": "my_folder/Letters{documentId}.pdf",
    "contentType": "application/pdf",
    "storageTier": "INFREQUENT_ACCESS"
   }
}
```

**여러 PDF 생성 시 Response**
```
{
  "responseType": "BATCH",
  "code": 207,
  "status": "Multi-Status",
  "documents": [
    {
      "documentId": 1,
      "code": 200,
      "status": "OK",
      "document": {
        "type": "OBJECT_STORAGE",
        "namespace": "my_namespace",
        "bucketName": "my_bucket",
        "objectName": "my_folder/Letters1.pdf",
        "contentType": "application/pdf",
        "storageTier": "INFREQUENT_ACCESS"    
      }
    },
    {
      "documentId": 2,
      "code": 200,
      "status": "OK",
      "document": {
        "type": "OBJECT_STORAGE",
        "namespace": "my_namespace",
        "bucketName": "my_bucket",
        "objectName": "my_folder/Letters2.pdf",
        "contentType": "application/pdf",
        "storageTier": "INFREQUENT_ACCESS"    
      }
    }
  ],
  "metadata": {
    "version": "1.0",
    "configurationParameters": {
      "FN_FN_NAME": "docgen",
      "FN_APP_NAME": "docgen-app",
      "FN_TYPE": "sync",
      "FN_APP_ID": "ocid1.fnapp.oc1.phx.example...63m5hsmzzz",
      "OCI_REGION_METADATA": "{\"realmDomainComponent\":\"oraclecloud.com\",\"realmKey\":\"oc1\",\"regionIdentifier\":\"us-phoenix-1\",\"regionKey\":\"PHX\"}",
      "FN_FN_ID": "ocid1.fnfunc.oc1.phx.example...h523viuzzz",
      "FN_MEMORY": "512"
    }
  }
 }
```

## Support for PVCs backed by Ultra-High Performance block volumes
* **Services:** Container Engine for Kubernetes
* **Release Date:** Feb. 20, 2024
* **Documentation:** [https://cloudmarketplace.oracle.com/marketplace/listing/136942717](https://cloudmarketplace.oracle.com/marketplace/listing/136942717){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 OKE에서 Ultra-High Performance (30 to 120 VPUs)를 지원하는 Persistent Volume Claim을 생성할 수 있습니다.

**Ultra-High Performance block volumes을 위한 Storage Class 예시**
```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: oci-uhp-sc
provisioner: blockvolume.csi.oraclecloud.com
parameters:
  vpusPerGB: "30"
  attachment-type: "iscsi"
reclaimPolicy: Delete
volumeBindingMode: WaitForFirstConsumer
allowVolumeExpansion: true
```