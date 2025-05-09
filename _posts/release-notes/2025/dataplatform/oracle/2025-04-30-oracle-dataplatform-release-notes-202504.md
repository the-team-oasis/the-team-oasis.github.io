---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "4월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2025년 4월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2025-dataplatform
tags:
  - oci-release-notes-2025
  - Apr-2025
  - DATAPLATFORM, DATABASE, BIGDATA, DATAFLOW, SPARK, ORACLE
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

## File Storage with Lustre is now available
* **Services:**  File Storage with Lustre, Oracle Cloud Infrastructure
* **Release Date:** April 02, 2025
* **Release Date:** May 01, 2025

* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/lustre/launch.htm](https://docs.oracle.com/en-us/iaas/releasenotes/lustre/launch.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud Infrastructure File Storage with Lustre는 AI/ML 학습 및 추론, 그리고 고성능 컴퓨팅 요구 사항을 충족하도록 설계된 완전 관리형 서비스입니다.

File Storage with Lustre는 배포, 확장 및 유지 관리 작업을 자동화하여 Lustre 인프라 관리가 아닌 애플리케이션에 집중할 수 있도록 지원합니다. OCI는 메타데이터 서버, 관리 서버, 스토리지 서버를 포함한 모든 Lustre 서버 구성 요소를 배포하고 유지 관리합니다.

- OCI GPU & Storage Options
  ![HPCStorage](/assets/img/dataplatform/2025/release_note/202505/oci_gpu_storage_options.png)

- 그림의 중간에 GPU 클러스터 및 HPC 클러스터에서 파일 공유를 해서 사용할 수 있는 세가지의 옵션이 있습니다. 그중 Managed Lustre 가 출시 예정이었고 이번에 25년 4월부터 서비스 사용이 가능하게 되었습니다.

- OCI File Storage with Lustre Overview
  ![LustreOverview](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_overview_01.png)

- Lustre Managed 서비스를 출시하게 됨 배경에는 본사에서도 LLM 모델이나 GenAI 어플리케이션의 파일 공유 시스템으로 고가의 FSS 대신 Lustre 를 권고하고 있고, Kubernetes 환경도 지원하고 4가지의 Performance Level 선택할 수 있다는 특징이 있습니다.

- 자세한 사항은 본사 블로그 아래 참고 
  - [https://blogs.oracle.com/cloud-infrastructure/post/fully-managed-lustre-file-storage-in-the-cloud](https://blogs.oracle.com/cloud-infrastructure/post/fully-managed-lustre-file-storage-in-the-cloud){:target="_blank" rel="noopener"}

- Lustre 는 아래 그림처럼 File Storage Service 와 유사하게 OCI 에서 Fully Managed Service 로 제공하고 있고 있습니다.
  ![LustreFS](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_managed_svc_01.png)

- Lustre 서비스 생성 화면

  ![LustreFS](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_create_01.png)

  ![LustreFS](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_create_02.png)

- 생성된 Lustre 의 상세 보기 화면에서는 사용하고자 하는 컴퓨트 노드에서 Lustre FS 를 Mount 하기 위한 Mount 명령어가 표시되어 FSS 서비스와 유사하게 손쉽게 공유 스토리지를 구성할 수 있게 됩니다. 이 마운트 정보를 이용하여 Linux OS, Kubernes 등 다양한 클라이언트에서 접근할 수 있습니다.

  ![LustreFSMount](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_managed_svc_02.png)

## Lustre 를 위한 네트워크 구성
  1. Lustre FS 와 Workload 를 처리할 Instance 를 동일한 VCN, 동일한 Subnet 에 구성하는 경우

      ![LustreFSConn](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_connectivity_01.png)

  2. HPC Cluster 와 같이 Workload 를 처리할 Instance client 들과 Lustre 간 독립성을 가져야 할 경우 (Local Peering Gateway 설정을 통해 네트워크 구성)

      ![LustreFSConn](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_connectivity_02.png) 

## 고객 활용 사례

  - OCI 고객들은 LLM 교육 및 엔지니어링 시뮬레이션 모델과 같은 활용 사례에서 이미 Lustre 서비스의 이점을 활용하고 있습니다.

    - 대규모 LLM 교육: 최근 OCI에서 관리하는 Lustre 파일 시스템을 탑재한 OCI 파일 스토리지를 사용하여 대규모 LLM 교육을 실행했습니다. 이 시스템은 최대 20Tbps(초당 테라비트)의 총 속도로 25,000개의 GPU를 지원합니다.

    - 엔지니어링을 위한 AI: 제조, 물류 및 에너지 분야를 위한 대규모 언어 모델을 제공하는 산업 AI 시뮬레이션 분야의 선두 기업인 NXAI는 Lustre와 함께 OCI 파일 스토리지를 활용하여 AI 교육 속도를 향상시킵니다.

    - 물리 시뮬레이션: Emmi AI는 전기 시스템, 열 시뮬레이션 및 항공우주 엔지니어링 분야에서 실시간 상호작용을 구현하는 물리 아키텍처와 모델을 구동하며, Lustre와 함께 OCI 파일 스토리지를 활용하여 시뮬레이션 시간을 단축합니다.

## For more information
  - [File Storage with Lustre web page](https://www.oracle.com/cloud/storage/file-storage-with-lustre){:target="_blank" rel="noopener"}
  - [Generally Available: Fully Managed Lustre File Storage in the Cloud](https://blogs.oracle.com/cloud-infrastructure/post/fully-managed-lustre-file-storage-in-the-cloud){:target="_blank" rel="noopener"}
  - [File Storage with Lustre recorded demo](https://videohub.oracle.com/media/OCI%20File%20Storage%20with%20Lustre%20Demo/1_60xzt8kv){:target="_blank" rel="noopener"}
  - [Solutions Brief: Lustre Installation and Configuration](https://docs.oracle.com/en/solutions/deploy-lustre-file-systems/index.html){:target="_blank" rel="noopener"}
  - [Oracle Cloud Pricing web page](https://www.oracle.com/cloud/pricing/){:target="_blank" rel="noopener"}


---