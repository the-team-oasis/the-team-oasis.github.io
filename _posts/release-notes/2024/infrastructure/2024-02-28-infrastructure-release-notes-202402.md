---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "2월 OCI Infrastructure 업데이트 소식"
teaser: "2024년 2월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2024-infrastructure
tags:
  - oci-release-notes-2024
  - Feb-2024
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

## End of Life
* **Services:** Storage Gateway
* **Release Date**: Feb. 28, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/d67506ea-eb9b-4eeb-8c2b-e05e2dea70a4/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/d67506ea-eb9b-4eeb-8c2b-e05e2dea70a4/){:target="_blank" rel="noopener"}

### 업데이트 내용
오브젝트 스토리지 게이트웨이가 2024년 2월28일 이후로 서비스가 종료되었습니다. 
- 신규 사용자 : 클라이언트 프로그램을 다운 받을 수 없습니다.
- 기존 사용자 : 사용이 가능하나, 업데이트가 이뤄지지 않으며, 지원에 제약이 있습니다.

위 서비스 대체로 아래 솔루션으로 대체 가능합니다. 

- [OCI CLI running OCI Object Storage sync](https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.29.4/oci_cli_docs/cmdref/os.html){:target="_blank" rel="noopener"}
- Rclone: [OCI support for Rclone](https://blogs.oracle.com/cloud-infrastructure/post/native-oci-object-storage-support-rclone){:target="_blank" rel="noopener"} , [Using Rclone to migrate to OCI Object Storage](https://blogs.oracle.com/linux/post/using-rclone-to-copy-data-in-and-out-of-oracle-cloud-object-storage){:target="_blank" rel="noopener"}
- OCIFs: [access to Object Storage via a Filesystem](https://blogs.oracle.com/linux/post/introducing-ocifs){:target="_blank" rel="noopener"} 
- [Onprem migration to OCI Object storage](https://docs.oracle.com/en/learn/migrate-data-to-oci-object-storage/index.html#introduction){:target="_blank" rel="noopener"} - leveraging rclone and NFS file system
- [Virtual ZFS](https://docs.oracle.com/cd/E27998_01/html/E48433/shares__shadow_migration.html){:target="_blank" rel="noopener"} – leverage shadow migration to support data migration




## Cloud Shell Now Enables Architecture Choice
* **Services:** Cloud Shell
* **Release Date:** Feb. 27, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/02fd9b32-ad69-4396-8259-1bdc47a2cd6a/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/02fd9b32-ad69-4396-8259-1bdc47a2cd6a/){:target="_blank" rel="noopener"}
  
### 업데이트 내용
유료 사용자의 경우 클라우드쉘의 아키텍처를 아래 타입으로 선택 할 수 있습니다. 기본적으로 아키텍처 기본 설정은 기본 설정 없음으로 설정되어 있습니다. 이 옵션을 선택하면 Cloud Shell 세션은 해당 지역에서 사용 가능한 하드웨어에 따라 x86_64 또는 ARM(aarch64) 아키텍처를 기반으로 합니다.

> 데이터 센터의 가용량에 따라서 해당 아키텍처가 지원이 안 될수도 있습니다.

- ARM (aarch64)
- x86_64 
- No Preference

![](/images/infrastructure/SCR-20240306-jwag.png " ")



![](/images/infrastructure/SCR-20240306-jwbh.png " ")






## Queue source for connectors
* **Services**:Connector Hub
* **Release Date**: Feb. 27, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/7e5a0da1-c2f9-44d2-9988-e0b984dd5167/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/7e5a0da1-c2f9-44d2-9988-e0b984dd5167/){:target="_blank" rel="noopener"}
  

### 업데이트 내용
큐 서비스의 메시지를 커넥터를 통해서 Functions, Notifications, Object Storage, and Streaming 서비스에 메시지를 이동 할 수 있는 기능이 추가 되었습니다.

![](/images/infrastructure/SCR-20240306-jyoe.png " ")

아래 화면과 같이 Queue 서비스에 Target을 Functions, Notifications, Object Storage, Streaming을 선택 할 수 있습니다.

![](/images/infrastructure/SCR-20240306-jyys.png " ")



## Disable Simultaneous Multithreading now available on VM instances
* **Services**:Compute
* **Release Date**: Feb. 22, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/566f4706-9165-403c-b3cb-c4bfdfa0d627/](https://docs.oracle.com/iaas/releasenotes/changes/566f4706-9165-403c-b3cb-c4bfdfa0d627/){:target="_blank" rel="noopener"}

### 업데이트 내용
- 동시 멀티스레딩(Simultaneous multithreading, SMT)은 하드웨어 멀티스레딩을 지원하는 슈퍼스칼라 CPU의 전반적인 효율성을 개선하기 위한 기술입니다.
- 가상머신에 대해서 멀티쓰레드 비활성화를 지원합니다. 아래 가성머신 생성시 "Advanced OCPU Settings"에서 활성화 여부를 선택할 수 있습니다. 기본적으로 활성화 되어 있습니다.


![](/images/infrastructure/SCR-20240306-kaas.png " ")

### 참고
* https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/disablesmt.htm

## New Release of Secure Desktops
* **Services**:Secure Desktops
* **Release Date**: Feb. 20, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/aedc9ee8-a17e-4300-8528-86bcd83a2905](https://docs.oracle.com/iaas/releasenotes/changes/aedc9ee8-a17e-4300-8528-86bcd83a2905){:target="_blank" rel="noopener"}

### 업데이트 내용
Secure Desktops 버그 수정 및 기능이 추가 되었습니다. 

- 오라클 리눅스 7,8 버전을 지원합니다. 
- 반복되는 시간에 풀에서 데스크톱을 시작하고 중지하는 정기 예약 기능의 개선 및 버그 수정하였습니다.
- 데스크톱 풀의 이벤트 데이터 감사 및 작업 요청과의 통합이 개선되었습니다.


## VIew Unused Database CPU Capacity
* **Services**:Operations Insights
* **Release Date**: Feb. 19, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/09599fa9-b65b-4c9f-b8b9-8757325a3bd1/](https://docs.oracle.com/iaas/releasenotes/changes/09599fa9-b65b-4c9f-b8b9-8757325a3bd1/){:target="_blank" rel="noopener"}


### 업데이트 내용
오퍼레이션 인사이트에 활성화된 데이터베이스의 사용하지 않은 CPU 활용률 확인 할 수 있습니다.

![](/images/infrastructure/SCR-20240306-jbar.png " ")



## Logging Analytics: Support to ingest more types of OCI service logs
* **Services**:Logging Analytics
* **Release Date**: Feb. 16, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/c3a591f5-b3b3-4c98-ba9f-f395f73d4030/](https://docs.oracle.com/iaas/releasenotes/changes/c3a591f5-b3b3-4c98-ba9f-f395f73d4030/){:target="_blank" rel="noopener"}

### 업데이트 내용
Logging Analytics에서 아래 6가지 서비스에 대해서 로그 수집을 지원하게 되었습니다.

- OCI Media Flow
- OCI Data Flow
- OCI Web Application Accelerator
- OCI GoldenGate
- OCI Application Performance Monitoring
- OCI Service Connector Hub


## Lock and unlock topics
* **Services**:Notifications
* **Release Date**: Feb. 15, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/4a9364b7-cf4c-48f9-84c4-1f035c7c3d8c/](https://docs.oracle.com/iaas/releasenotes/changes/4a9364b7-cf4c-48f9-84c4-1f035c7c3d8c/){:target="_blank" rel="noopener"}

### 업데이트 내용
토픽에서 잠금을 추가하고 제거할 수 있습니다. 토픽을 잠그면 업데이트, 이동, 삭제가 불가능해져 리소스가 변조되지 않도록 보호할 수 있습니다.

> 토픽 잠금은 API를 통해서만 사용할 수 있습니다.

아래 화면에서 악의적인 사용자가 웹콘솔로 접근시 토픽을 통해서 임의 메시지를 전달 할 수 있습니다. 보안상의 변조 방지를 위해서 토픽에 대해서 lock과 unlock을 설정 할 수 있습니다.

![](/images/infrastructure/SCR-20240306-ncwu.png " ")

### 참조
[Adding a Topic Lock](https://docs.oracle.com/en-us/iaas/Content/Notification/Tasks/add-topic-lock.htm){:target="_blank" rel="noopener"}




## Logging Analytics: New query command to search for log record patterns within predetermined groups
* **Services**:Logging Analytics
* **Release Date**: Feb. 9, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/89a7d403-1f5e-496a-95b7-234c5da6dac8/](https://docs.oracle.com/iaas/releasenotes/changes/89a7d403-1f5e-496a-95b7-234c5da6dac8/){:target="_blank" rel="noopener"}

### 업데이트 내용
로깅분석툴은 새로운 명령어(' sequence ')를 지원하게 되었습니다.
- **"sequence"는 link 명령어에 의해서 그룹화된 레코드의 검색을 위한 명령어입니다.**

![](/images/infrastructure/SCR-20240306-nfrz.png " ")


## Logging Analytics: New workflow to ingest OCI Audit Logs from the console
* **Services**:Logging Analytics
* **Release Date**: Feb. 2, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/a4cf76e7-9583-4406-9731-593ca89d57c2/](https://docs.oracle.com/iaas/releasenotes/changes/a4cf76e7-9583-4406-9731-593ca89d57c2/){:target="_blank" rel="noopener"}

### 업데이트 내용
이제 서비스 커넥터를 사용하여 다른 OCI 서비스에서 로그 수집 할 수 있습니다.

### 정책 

```
allow any-user to {LOG_ANALYTICS_LOG_GROUP_UPLOAD_LOGS} in compartment id <Log_Group_Compartment_OCID> 
    where all 
    {request.principal.type = 'serviceconnector', 
    target.loganalytics-log-group.id = '<Log_Group_OCID>',
    request.principal.compartment.id = '<Service_Connector_Compartment_OCID>'}
allow group <userGroup> to MANAGE serviceconnectors in tenancy
allow group <userGroup> to READ logging-family in tenancy

```
### 참고 
[공식문서링크](https://docs.oracle.com/en-us/iaas/logging-analytics/doc/ingest-logs-other-oci-services-using-service-connector.html)



## Cloud Advisor Supports Additional Compute Shape
* **Services**:Cloud Advisor
* **Release Date**: Feb. 2, 2024
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/af4a867e-3946-49d2-826f-20c015d1fbfc/](https://docs.oracle.com/iaas/releasenotes/changes/af4a867e-3946-49d2-826f-20c015d1fbfc/){:target="_blank" rel="noopener"}

### 업데이트 내용
클라우드 어드바이저를 통한 compute 다운 사이징 조정 shape에 A1 시리즈가 추가 되었습니다.

- **VM.Standard.A1.Flex**

### 참고
* https://docs.oracle.com/en-us/iaas/Content/CloudAdvisor/Concepts/recommendations-costmanagement.htm
