---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "11월 OCI Infrastructure 업데이트 소식"
teaser: "2023년 11월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2023-infrastructure
tags:
  - oci-release-notes-2023
  - Nov-2023
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


## Cloud Advisor Supports Additional Compute Shape
* **Services:** Cloud Advisor
* **Release Date:** Nov. 28, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/9a32c52a-0301-4d75-b9fd-db431cfc59ac/](https://docs.oracle.com/iaas/releasenotes/changes/9a32c52a-0301-4d75-b9fd-db431cfc59ac/){:target="_blank" rel="noopener"}

### 릴리즈 내용
Cloud Advisor 권장 사항에 따르면 활용도가 낮은 컴퓨팅 인스턴스 축소, 유휴 컴퓨팅 인스턴스 삭제, 컴퓨팅 인스턴스 크기 조정이 이제 20개 이상의 다른 표준 및 최적화 컴퓨팅 형태 외에도 컴퓨팅 형태 ``VM.Standard3.Flex``를 지원합니다.

Cloud Advisor를 활성화하면 사용하고 있는 compute 리소스 대해서 기본 7일 동안의 CPU 사용량을 토대로 현재, 사용하고 있는 shape에 대해서 적합한 compute를 제안해 주는 기능이 있습니다. 

이러한 기능은 워크로드의 효율적인 운영과 오버스펙에 compute에 대한 비용의 효율화를 이룰 수 있습니다. 

VM Shape
- VM.Standard1.1
- VM.Standard2.1
- ``VM.Standard3.Flex``
- VM.Optimized3.Flex
- VM.Standard.A1.Flex
- VM.Standard.B1.1
- VM.Standard.E2.1
- VM.Standard.E2.1.Micro
- VM.Standard.E3.Flex
- VM.Standard.E4.Flex

BM Shape
- BM.Standard1.36
- BM.Standard2.52
- BM.Standard.A1.160
- BM.Standard.B1.44
- BM.Standard.E2.64
- BM.Standard.E3.128
- BM.Standard.E4.128
- BM.DenseIO1.36
- BM.DenseIO2.52

## High Performance Computing now available
* **Services:** Compute
* **Release Date:** Nov. 21, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/d484abab-9fda-4761-a88b-f71fe02a7cd3/](https://docs.oracle.com/iaas/releasenotes/changes/d484abab-9fda-4761-a88b-f71fe02a7cd3/){:target="_blank" rel="noopener"}

### 릴리즈 내용

고성능 컴퓨팅(HPC)은 복잡한 계산을 수행하고 기존 컴퓨팅보다 빠르게 데이터를 처리합니다. HPC는 베어메탈 서버, 대기 시간이 매우 짧은 클러스터 네트워킹, 고성능 스토리지 옵션 및 병렬 파일 시스템을 사용합니다. 이 인프라를 사용하면 인공 지능, 딥 러닝, 데이터 분석, 과학 시뮬레이션 및 기타 고강도 워크로드와 같은 컴퓨팅 집약적인 워크로드에 대한 병렬 처리가 가능합니다.

![](/images/infrastructure/2013-Nov-infra-hpc.png " ")

HPC 모듈의 경우 개별적으로 활성화/비활성화 할 수 있습니다. 

자동설정 : 
- GPU shape 권장 네트워크 어댑터 설정을 적용합니다.
- GPU shape 권장되는 Mellanox Connect-X 설정을 적용합니다.
- 기본 VCN을 기반으로 RDMA 네트워크 인터페이스에 IP 주소를 할당합니다.

RDMA 인증/설정
- 권장되는 QoS 및 MTU로 RDMA 네트워크 인터페이스를 구성합니다.
- 필수 RDMA 네트워크 인증 구성 및 유지 관리 설정을 지원합니다.

GPU & RDMA 모니터링
- RDMA 및 GPU 성능 지표를 확인 할 수 있습니다. 


## Automatic Workload Repository (AWR) Hub
* **Services:** Operations Insights
* **Release Date:** Nov. 21, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/d96df03a-80c5-4428-822e-6ec75c4ed736/](https://docs.oracle.com/iaas/releasenotes/changes/d96df03a-80c5-4428-822e-6ec75c4ed736/){:target="_blank" rel="noopener"}

### 릴리즈 내용
중요한 Oracle Autonomous Databases의 자동 작업 로드 저장소에서 자세한 성능 데이터를 통합하고 저장할 수 있습니다. 새로운 AWR Hub 온보딩 절차를 통해 웨어하우스와 허브를 루트가 아닌 다른 구획에 배치할 수 있으며 이제 하위 구획에 정책을 생성할 수 있습니다.


## New Release of Secure Desktops
* **Services:** Secure Desktops
* **Release Date:** Nov. 20, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/9a61891d-463f-4995-80b9-2e6747a0173b/](https://docs.oracle.com/iaas/releasenotes/changes/9a61891d-463f-4995-80b9-2e6747a0173b/){:target="_blank" rel="noopener"}

### 릴리즈 내용
이번 릴리스에는 버그 수정이 이루어졌습니다.

- Azure에서 실행되는 Microsoft Active Directory에서 데스크톱 풀을 생성하고 데스크톱을 시작하는 기능이 향상되었습니다.
- 새로운 볼륨 및 네트워크 엔드포인트 생성에 대한 오류 보고 및 진단 가능성이 향상되었습니다.
- 컴퓨팅 인스턴스에 스토리지 볼륨 연결과 관련된 데스크톱 시작 실패 문제를 수정했습니다.
- 개인 네트워크 엔드포인트 삭제와 관련된 풀 관리 문제를 수정했습니다.

## OCI Database with PostgreSQL is now available
* **Services:** OCI Database with PostgreSQL
* **Release Date:** Nov. 14, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/9a4b73b5-d4d6-4c89-bd31-b1fa2098fa34/](https://docs.oracle.com/iaas/releasenotes/changes/9a4b73b5-d4d6-4c89-bd31-b1fa2098fa34/){:target="_blank" rel="noopener"}

### 릴리즈 내용
완전 관리형 PostgreSQL 호환 서비스는 엔터프라이즈, SMB 또는 개발 및 테스트 환경을 위한 가격 대비 성능, 지능형 크기 조정 및 조정, 높은 내구성을 제공합니다.

- 최대 3배 향상된 성능 : Database Optimized Storage 덕분에 스토리지 계층에서 SQL 트랜잭션 처리 엔진을 분리하면 표준 PostgreSQL 구성에 비해 성능이 크게 향상되었습니다.
- AWS 2의 절반 이하 비용 : 아마존 웹 서비스(AWS)의 동급 서비스인 아마존 오로라 PostgreSQL은 OCI보다 2.5배 더 비쌉니다.
- 보안 : OCI Database for PostgreSQL은 다른 OCI 데이터 스토어 및 서비스와 마찬가지로 상시(Always-On) 암호화 및 정기적인 보안 업데이트를 제공하여 데이터 보호 및 컴플라이언스 지원을 강화하고 있습니다. 이 서비스는 Audit, IAM, Cloud Guard 등 다른 OCI 보안 서비스와 완벽하게 통합되어 보안 및 거버넌스 관리를 용이하게 합니다.
- 고가용성 : 99.99%의 SLA와 OCI 아키텍처 혁신과 PostgreSQL 데이터베이스 복제 방법론을 결합한 RTO(복구 시간 목표) 및 RPO(복구 시점 목표)를 충족하는 기능을 통해 OCI의 PostgreSQL 사용자에게 최고 수준의 내구성과 고가용성을 제공합니다.

![](/images/infrastructure/2013-Nov-infra-postgresql.png " ")




## Management Agent New Release
* **Services:** Management Agent
* **Release Date:** Nov. 8, 2023
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/changes/c455f471-84dd-40f7-976c-2f59b57b4e6c/](https://docs.oracle.com/iaas/releasenotes/changes/c455f471-84dd-40f7-976c-2f59b57b4e6c/){:target="_blank" rel="noopener"}

### 릴리즈 내용
Oracle Cloud Infrastructure 관리자는 모니터링하려는 서비스 및 소스에서 데이터를 수집하기 위해 관리 에이전트를 배포할 수 있습니다. 
관리 에이전트 서비스는 관리 에이전트의 라이프사이클과 서비스에 대한 플러그인을 관리합니다.

이제 관리 에이전트 버전 231002.2040을 사용할 수 있습니다.
이 새 버전은 ``macOS`` 및 ``AIX`` 운영 체제를 지원합니다.

![](/images/infrastructure/2013-Nov-infra-ma-overview.png " ")

![](/images/infrastructure/2013-Nov-infra-ma.png " ")




