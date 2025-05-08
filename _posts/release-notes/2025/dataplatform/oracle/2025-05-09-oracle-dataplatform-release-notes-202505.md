---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "5월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2025년 5월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2025-dataplatform
tags:
  - oci-release-notes-2025
  - May-2025
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

- 그림의 중간에 GPU 클러스터 및 HPC 클러스터에서 파일 공유를 해서 사용할 수 있는 세가지의 옵션이 있습니다. 그중 마지막에 Managed Lustre 가 출시 예정이었으나 이번에 서비스가 가능하게 되었습니다.

- OCI File Storage with Lustre Overview
  ![LustreOverview](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_overview_01.png)

- Lustre Managed 서비스를 출시하게 됨 배경에는 본사에서도 LLM 모델이나 GenAI 어플리케이션의 파일 공유 시스템으로 FSS 대신 Lustre 를 권고하고 있고, Kubernetes 환경도 지원하고 4가지의 Performance Level 선택할 수 있다는 특징이 있습니다.

- 자세한 사항 본사 블로그 아래 참고 
  - [https://blogs.oracle.com/cloud-infrastructure/post/fully-managed-lustre-file-storage-in-the-cloud](https://blogs.oracle.com/cloud-infrastructure/post/fully-managed-lustre-file-storage-in-the-cloud){:target="_blank" rel="noopener"}

- Lustre 는 아래 그림처럼 File Storage Service 와 유사하게 OCI 에서 Fully Managed Service 로 제공하고 있고 있습니다.
  ![LustreFS](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_managed_svc_01.png)

- 생성된 Lustre 의 상세 보기 화면에서는 사용하고자 하는 컴퓨트 노드에서 Lustre FS 를 Mount 하기 위한 Mount 명령어가 표시되어 FSS 서비스와 유사하게 손쉽게 공유 스토리지를 구성할 수 있게 됩니다. 이 마운트 정보를 이용하여 Linux, Windows, Kubernes 등 다양한 클라이언트에서 접근할 수 있습니다.

  ![LustreFSMount](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_managed_svc_02.png)

- Lustre 를 위한 네트워크 구성
  1. Lustre FS 와 Workload 를 처리할 Instance 를 동일한 VCN, 동일한 Subnet 에 구성하는 경우

      ![LustreFSConn](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_connectivity_01.png)

  2. HPC Cluster 와 같이 Workload 를 처리할 Instance client 들과 Lustre 간 독립성을 가져야 할 경우 (Local Peering Gateway 설정을 통해 네트워크 구성)

      ![LustreFSConn](/assets/img/dataplatform/2025/release_note/202505/oci_lustre_fs_connectivity_02.png)  


---