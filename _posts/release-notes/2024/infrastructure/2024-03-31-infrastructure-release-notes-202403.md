---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "3월 OCI Infrastructure 업데이트 소식"
teaser: "2024년 3월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2024-infrastructure
tags:
  - oci-release-notes-2024
  - Mar-2024
  - Infrastructure
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



## Object-level granular access control for Object Storage
* **Services**:Object Storage
* **Release Date**: March 29, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/666199df-aa78-4da5-b9ed-4815bc8327c7/](https://docs.oracle.com/iaas/releasenotes/changes/666199df-aa78-4da5-b9ed-4815bc8327c7/){:target="_blank" rel="noopener"}

### 업데이트 내용
버킷 수준 액세스 제어보다 더 정교한 보안 권한 설정을 할 수 있게 되었습니다. 오브젝트 스토리지를 개별 개체나 접두사 또는 접미사 기반 개체 그룹에서 보다 세부적인 제어가 가능합니다.

객체 수준 IAM 버킷 내 특정 객체 및 객체 하위 집합에 권한을 부여할 수 있습니다 정책을 사용하면 Object Storage . IAM 변수 정책 target.object.name테넌시, 구획, 버킷에 대해 수행할 수 있는 작업과 유사하게 객체에 권한 부여 및 사용 권한을 적용할 수 있는 기능을 제공합니다.

```text
    ALLOW GROUP <group> TO manage objects IN TENANCY where all {target.object.name = '<object-pattern>', target.bucket.name = '<bucket_name>'}
```
```text
    예제 : ALLOW GROUP object-authZ-op-group-ost-object TO manage objects IN TENANCY where any {target.object.name = 'ost-object-*', request.operation = 'GetObject'}
```



## Publish custom metrics using agent configurations
* **Services**:Monitoring
* **Release Date**: March 27, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/5643d4e8-1cb2-46e5-af31-ababb0cbffd4/](https://docs.oracle.com/iaas/releasenotes/changes/5643d4e8-1cb2-46e5-af31-ababb0cbffd4/){:target="_blank" rel="noopener"}

### 업데이트 내용
사용자 로그 수집을 위해서 API가 꼭 필요하지는 않습니다. 이번 업데이트에서는 사용자 지정 로그 수집을 위해서 에이전트 설정하여 사용자 로그를 수집 할 수 있습니다. 
예를 들어 프로메테우스 기반의 HTTP Endpoint 기반의 로그를 수집 할 수 있습니다. 

![](/assets/img/infrastructure/2024/SCR-20240509-ntzj.png " ")

### 설정 방법
1. 에이전트 설치
2. 설치된 에이전트 검증
3. 다이나믹 그룹 설정 및 권한 설정
4. 검증


[에이전트 설정 링크](https://docs.oracle.com/en-us/iaas/Content/Monitoring/Tasks/agent-configurations.htm){:target="_blank" rel="noopener"}


### 지원되는 운영 체제

![](/assets/img/infrastructure/2024/SCR-20240509-ntpm.png " ")


## Two trigger rules per alarm
* **Services**:Monitoring
* **Release Date**: March 26, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/7eb8268d-db13-4bd5-ab12-d7c3c6856260/](https://docs.oracle.com/iaas/releasenotes/changes/7eb8268d-db13-4bd5-ab12-d7c3c6856260/){:target="_blank" rel="noopener"}

### 업데이트 내용
모니터링 서비스에서 트리거 규칙은 원래 1개 등록이 가능하였습니다. 이번 업데이틀 통해서 최대 2개의 트리거 규칙 또는 조건자를 추가할 수 있습니다.
하나의 규칙에 대해서 설정이 가능했으나. 아래 예제와 같이 2개의 트리거 규칙을 설정 할 수 있습니다.

- 90%에 대한 위험 트리거 규칙과 80%에 대한 경고 트리거 규칙을 추가 가능합니다.

![](/assets/img/infrastructure/2024/SCR-20240509-klym.png " ")
