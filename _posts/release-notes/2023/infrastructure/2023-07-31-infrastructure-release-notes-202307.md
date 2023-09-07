---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "7월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 7월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - July-2023
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


## File Storage Now Supports Kerberos Authentication
* **Services:**  File Storage
* **Release Date:** July 19, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/401019bd-722a-4aee-98a4-35460db8c1f5/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/401019bd-722a-4aee-98a4-35460db8c1f5/){:target="_blank" rel="noopener"}

### 릴리즈 내용

파일 스토리지에서 Kerberos 인증을 제공합니다. Kerberos(커버로스) 인증이란, 네트워크 인증 방식 중 하나이며 서버와 클라이언트 간의 신원 확인을 위해 사용하는 프로토콜입니다. Kerberos는 클라이언트와 서버를 상호 인증 할 수 있을 뿐만 아니라 데이터 보존을 위해 클라이언트와 서버 간의 통신을 암호화 합니다.

커버로스(Kerberos) sso(Single Sign-On)의 일종이며, 여러 시스템의 접근 관리 기능을 제공합니다. 
Kerberos 버전 5 가 주로 사용되어, Kerberos는 "KRB5”라고도 합니다.

![](/assets/img/infrastructure/2023/keberos.jpeg)

## E5-based AMD shapes for compute instances
* **Services:**  Compute
* **Release Date:** July 14, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/86b741aa-5ed1-4cbd-886d-8ba710da1be0/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/86b741aa-5ed1-4cbd-886d-8ba710da1be0/){:target="_blank" rel="noopener"}

### 릴리즈 내용

새로운 AMD CPU가 새로 추가 되었습니다. 새로 추가된 AMD CPU는 아래와 같이 VM, BM 모두 지원합니다.
Shape에는 VM.Standard.E5.Flex (AMD) , BM.Standard.E5.192 두 가지 타입이 있습니다. 
CPU 클럭의 경우, AMD EPYC 9J14. Base frequency 2.4 GHz, max boost frequency 3.7 GHz.입니다. 

  - VM은 최대 94 OCPU 와 최대 1049GB 메모리를 지원합니다. 
  - BM은 192 OCPU와 2304GB 메모리를 지원합니다.


## Changing the encryption key for a volume backup
* **Services:**  Block Volume, Vault
* **Release Date:** July 12, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/1d439da6-eeec-4fa2-acef-89be177ce266/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/1d439da6-eeec-4fa2-acef-89be177ce266/){:target="_blank" rel="noopener"}

### 릴리즈 내용 

블록 볼륨이 볼륨 백업의 암호화 키 변경을 지원합니다. 암호화 키를 변경해도 볼륨 백업이 다시 암호화되는 것이 아니라 데이터 키만 다시 암호화됩니다.

> 기존의 암호화키를 변경하는게 아니라 기존 키를 다시 암호화해서 사용하는 방식입니다

- 아래 CLI를 통해서 변경이 가능합니다. 

  - oci bv backup update --backup-id=<backup_ID> --kms-key-id=<key_ID>
  - oci bv backup update --backup-id=<backup_ID> --kms-key-id=''