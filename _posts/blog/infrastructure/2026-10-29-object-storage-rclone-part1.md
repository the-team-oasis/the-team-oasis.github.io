---
layout: page-fullwidth
subheadline: "Infrastructure"
title: "OCI 클라우드 스토리지로 데이터 이전하기 (1편): 마이그레이션 도구 선택 가이드"
teaser: "Rclone, OCI Object Storage Sync, s5cmd 등 OCI 클라우드 스토리지로 데이터를 옮길 때 쓰는 도구를 비교하고, 상황별 권장 도구와 Oracle의 테스트 결과를 알아봅니다."
author: kskim
date: 2026-10-29 00:00:00
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, object storage, file storage, rclone, s5cmd, migration]
# published: false
header: no

# -------------- 내용 필독 -------------------
# 원문: Oracle Tutorial "Use Migration Tools to Move Data into OCI Cloud Storage Services" (G25415-02)
# https://docs.oracle.com/en/learn/migr-ocistorage-p1/index.html
# 이미지가 필요하면 /assets/img/infrastructure/2026/object-storage-rclone/<파일명>.png 형식으로 참조합니다.
# ------------------------------------------
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

### 들어가며

온프레미스, 다른 클라우드, 또는 OCI 안의 다른 스토리지에서 **OCI 클라우드 스토리지 서비스**(Object Storage, File Storage, Block Volumes)로 데이터를 옮겨야 하는 경우가 많습니다. 가장 알맞은 방법은 데이터의 출발지와 목적지, 전송 방향에 따라 달라집니다.

이 글은 Oracle 공식 튜토리얼 Use Migration Tools to Move Data into OCI Cloud Storage Services를 한글로 정리한 것입니다. 원문은 4편으로 이루어진 시리즈의 1편으로, 자주 쓰는 마이그레이션 도구를 소개하고 상황별로 어떤 도구가 맞는지 안내합니다.

> Rclone의 명령, 옵션, 실제 사용 예시는 [2편: Rclone 활용]({% post_url blog/infrastructure/2026-10-29-object-storage-rclone-part2 %})에서, 설치부터 전송·검증까지의 실습 절차는 [3편: Rclone 설치부터 전송·검증까지]({% post_url blog/infrastructure/2026-10-29-object-storage-rclone-part3 %})에서 이어집니다.

#### 이전 전에 정할 것

- **이전할 데이터 양**과, 새 OCI 스토리지로 전환(cut-over)할 때 허용되는 **다운타임**을 정합니다.
- **배치 마이그레이션**은 이전 작업을 관리하기 쉬운 단위로 나눌 수 있어 좋은 선택입니다. 애플리케이션별로 서로 다른 시간대에 다운타임을 잡을 수 있습니다. 일부 고객은 2~4일의 정기 점검 기간에 한 번에 이전하기도 합니다.
- [OCI FastConnect](https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/fastconnect.htm)를 쓰면 OCI와 고객 환경 사이에 1G~400G 포트 속도의 전용 사설 연결을 만들어 전송 속도를 높일 수 있습니다. 파트너 연동은 [FastConnect integration with Megaport Cloud Router](https://blogs.oracle.com/cloud-infrastructure/post/fastconnect-integration-megaport-cloud-router)와 [Console Connect](https://www.consoleconnect.com/clouds/connect-to-oracle-cloud/)를 참고합니다.

#### 대상 독자

DevOps 엔지니어, 개발자, OCI 클라우드 스토리지 관리자와 사용자, IT 관리자, OCI 파워 유저, 애플리케이션 관리자

#### 사전 준비

- 이전할 데이터의 전체 크기와 파일(객체) 구성 파악 (예: 큰 파일 몇 개, 작은 파일 다수 등)
- 데이터를 둘 OCI 스토리지 서비스 결정 (Object Storage, File Storage, Block Volumes 중)
- 일정, 그리고 일괄(bulk) 이전인지 증분(batch) 이전인지 결정

### 주요 마이그레이션 도구

Oracle은 실제 데이터로 이전하기 전에 **샘플 데이터로 PoC와 테스트를 먼저 해 보고** 가장 알맞은 방법을 확인하라고 권장합니다.

| 도구 | 설명 |
|---|---|
| [Rclone](https://rclone.org/) | 오픈소스 명령줄 도구입니다. 1회성 이전과 주기적인 동기화를 모두 할 수 있고, 약 70가지 스토리지 유형을 지원합니다. **OCI Object Storage를 기본 백엔드로 지원**합니다. 옵션으로 프로세스를 scale-up·scale-out해서 성능을 높일 수 있으며, `copy`, `sync` 명령으로 데이터를 옮깁니다. ([설치 방법](https://rclone.org/install/)) |
| [Flexify IO](https://flexify.io/) | Object Storage 이전에 특화된 서드파티 도구입니다. S3 호환 클라우드(OCI, AWS, GCP, Azure 등)와 온프레미스(MinIO, Dell EMC ECS 등) Object Storage를 지원합니다. GUI로 자격 증명을 등록하고 이전을 설정하며, 연결과 스토리지가 허용하는 만큼 자동으로 수평 확장합니다. OCI 파트너인 Megaport 같은 NaaS 제공자와도 연동됩니다. |
| [Resilio Active Anywhere](https://www.resilio.com/) | 에이전트 기반 서드파티 데이터 전송 애플리케이션입니다. GUI로 전송 작업을 세밀하게 제어하고 성능 지표를 볼 수 있습니다. Oracle Cloud Marketplace에서 제공되며 라이선스는 Resilio에서 받습니다. 일대다, 다대일, 다대다 방향으로 동기화할 수 있습니다. ([Resilio Connect 활용 블로그](https://blogs.oracle.com/cloud-infrastructure/post/data-migration-oci-storage-resilio-connect)) |
| rsync / fpsync | Linux 오픈소스 동기화 도구입니다. `rsync`는 경로 간 1회 복사나 주기 동기화에 씁니다. `fpsync`는 rsync, tar, rclone 중 하나를 내부 도구로 골라 병렬로 실행하는 래퍼입니다. |
| [File Storage Parallel Tools](https://docs.oracle.com/en-us/iaas/Content/File/Tasks/using_file_storage_parallel_tools.htm) | OCI File Storage용 병렬 도구 패키지입니다. Linux developer 저장소에서 yum으로 설치하며, `cp`, `tar`, `rm`의 병렬 버전인 `parcp`, `partar`, `parrm`이 들어 있습니다. |
| [OCI CLI Object Storage Sync](https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.47.0/oci_cli_docs/cmdref/os/object/sync.html) (`os sync`) | OCI CLI에 포함된 명령으로, 파일 시스템 디렉터리와 버킷 객체를 동기화합니다. 하위 디렉터리를 돌면서 새로 생기거나 바뀐 파일을 복사하고, 원본에 없는 파일은 선택적으로 삭제합니다. 호스트 자원에 따라 여러 작업을 병렬로 실행합니다(원문 표기: "up to 1,00 parallel operations"). |
| [OCI Object Storage Bulk Copy Python API](https://github.com/oracle/oci-python-sdk/blob/master/examples/object_storage/object_storage_bulk_copy.py) | OCI Python API로 작성한 대량 복사 예제 스크립트입니다. 병렬 스레드로 버킷 간 객체를 복사합니다. ([사용 방법](https://docs.oracle.com/en/learn/oci-objstorage-bulk-operation/index.html)) |
| [s5cmd](https://github.com/peak/s5cmd/tree/master) | S3 호환 오픈소스 도구입니다. 로컬 파일 시스템과 NAS(온프레미스, OCI)를 OCI Object Storage로 이전하거나 동기화할 수 있고, 같은 리전 안에서 버킷 간 이전도 할 수 있습니다. |

> 원문의 File Storage Parallel Tools 설명에는 도구 이름이 `parcp, parter and param`으로 적혀 있습니다. 위 표의 `partar`, `parrm`은 [Using File Storage Parallel Tools](https://docs.oracle.com/en-us/iaas/Content/File/Tasks/using_file_storage_parallel_tools.htm) 문서 기준 이름입니다.

### 상황별 권장 도구

출발지, 목적지, 이전 방향, 사용 경험, 사용 환경에 따라 알맞은 도구가 달라집니다. 원문의 권장 사항은 다음과 같습니다. 번호는 원문의 권장 순서입니다.

| 출발지 | 목적지 | 권장 도구 | 참고 |
|---|---|---|---|
| 온프레미스 파일 시스템 | OCI Object Storage | 1. s5cmd (작은 파일/혼합)<br>2. OCI Object Storage Sync (큰 파일 소수)<br>3. Rclone (혼합)<br>4. Resilio Active Anywhere | 데이터 구조에 맞고 익숙한 도구를 고릅니다. 전송 시간을 줄이려면 FastConnect를 검토합니다. |
| 다른 클라우드의 Object/Blob Storage | OCI Object Storage | 1. Flexify IO<br>2. Rclone | S3 호환 벤더이거나 GUI가 필요하면 Flexify IO를 씁니다. 여러 설정을 바꿔 가며 시험하는 데 익숙하고, 70개 이상 벤더(S3 호환·비호환)를 지원해야 하면 Rclone을 씁니다. |
| OCI Object Storage | 다른 리전의 OCI Object Storage | 1. Object Replication<br>2. Bulk Copy Python API<br>3. Flexify IO<br>4. Rclone | 비어 있는 새 버킷에 정확한 복제본을 만들 때는 기본 Object Replication이 좋습니다. 원본 버킷에 이미 객체가 있어서 초기 복사가 필요하거나, 대상의 기존 객체를 보존해야 하면 나머지 도구를 씁니다. |
| OCI Object Storage | 다른 테넌시의 OCI Object Storage (같은/다른 리전) | 1. Bulk Copy Python API<br>2. Flexify IO<br>3. Rclone | Bulk Copy Python API를 쓰려면 테넌시 간 IAM 정책이 필요합니다. ([Accessing Object Storage Resources Across Tenancies](https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/accessingresourcesacrosstenancies.htm)) |
| OCI File Storage | OCI Object Storage | 1. s5cmd (작은 파일/혼합)<br>2. Object Storage Sync (큰 파일 소수)<br>3. Rclone (혼합)<br>4. Resilio Active Anywhere | 데이터 구조에 맞고 익숙한 도구를 고릅니다. |
| 온프레미스 파일 시스템 | OCI File Storage | 1. fpsync (Linux), CIFS + fpsync (Windows)<br>2. Resilio Active Anywhere | 원본과 대상 인스턴스 사이에 네트워크 연결이 되어 있어야 합니다. |
| 다른 클라우드의 로컬 디스크/파일 스토리지 | OCI File Storage | 1. fpsync (Linux), CIFS + fpsync (Windows)<br>2. Resilio Active Anywhere | 원본과 대상 인스턴스 사이에 네트워크 연결이 필요하고, 전송 시간을 줄이려면 FastConnect를 검토합니다. |
| OCI File Storage | 다른 리전의 OCI File Storage | 1. File System Replication<br>2. 인스턴스 간 스트리밍을 쓰는 fpsync<br>3. Resilio Active Anywhere | Replication을 쓰면 [제약 사항](https://docs.oracle.com/en-us/iaas/Content/File/Tasks/FSreplication.htm)을 확인합니다. 인스턴스 간 스트리밍을 쓰면 원본과 대상 인스턴스 사이 네트워크 연결이 필요합니다. |
| OCI File Storage | 같은 가용성 도메인의 OCI File Storage | 1. File System Replication<br>2. File Storage Parallel Tools: parcp<br>3. Resilio Active Anywhere | parcp를 쓰면 원본과 대상 파일 시스템을 모두 한 인스턴스에 마운트해야 합니다. |
| 온프레미스, 다른 클라우드 | OCI Object Storage 또는 OCI File Storage | Resilio Active Anywhere Platform | 다방향 동기화, 지원이 포함된 white-glove 서비스, GUI가 필요할 때 씁니다. OCI 클라우드 스토리지 제품팀이 검증했고 Oracle Cloud Marketplace에서 제공됩니다. |

> **참고:** 원문 시리즈는 OCI Object Storage/File System Replication, Bulk Copy Python API, Flexify, Resilio의 사용법은 다루지 않습니다.

### Oracle 테스트 결과 - 오라클 Region 기준 (선택)

원문의 권장 사항은 Oracle의 테스트와 고객 사례를 바탕으로 합니다. 결과는 각 데이터 세트에 대한 측정값이므로, 자신의 데이터에서는 PoC로 다시 확인해야 합니다.

#### 테스트 환경 1: 소수 대용량 파일 vs 다수 소형 파일

- VM 1대: `VM.Standard.E4.Flex`, 1 OCPU, 네트워크 1Gbps, 메모리 16GB
- 온프레미스 → OCI 이전을 흉내 내기 위해 **PHX 리전의 NFS**에서 **IAD 리전의 Object Storage**로 복사

**데이터 세트 1: 3TB (1TB 파일 3개)**

| 방법 | 소요 시간 | 명령 | 옵션 |
|---|---|---|---|
| os sync | 123m17.102s | NA | `--parallel-operations-count 100` |
| s5cmd | 239m20.625s | copy | `run commands.txt`, 기본값 `--numworkers 256` |
| rclone | 178m27.101s | copy | `--transfers=100 --oos-no-check-bucket --fast-list --checkers 64 --retries 2 --no-check-dest` |

이 데이터 세트에서는 **os sync**가 가장 빨랐습니다.

**데이터 세트 2: 9.787GB (20MB 파일 20,000개)**

| 방법 | 소요 시간 | 명령 | 옵션 |
|---|---|---|---|
| s5cmd | 1m12.746s | copy | 기본값 `--numworkers 256` |
| os sync | 2m48.742s | NA | `--parallel-operations-count 1000` |
| rclone | 1m52.886s | copy | `--transfers=500 --oos-no-check-bucket --no-check-dest` |

이 데이터 세트에서는 **s5cmd**가 가장 빨랐습니다.

#### 테스트 환경 2: 다양한 크기의 파일 2.25TiB

- 테스트마다 VM 2대: `VM.Standard.E4.Flex`, 24 OCPU, 네트워크 24Gbps, 메모리 384GB, Oracle Linux 8 (Flexify IO는 VM을 쓰지 않음)
- 데이터: 디렉터리 14개, 합계 2.25TiB. 파일 크기는 1KiB부터 2GiB까지 디렉터리마다 다릅니다(예: 1MiB 파일 110,242개, 1GiB 파일 1,295개, 64KiB 파일 354,909개 등).
- 디렉터리 14개를 VM 2대에 나누어, VM마다 디렉터리당 1개씩 7개 명령을 실행했습니다.

| 방법 | 경로 | 소요 시간 | 명령 | 옵션/비고 |
|---|---|---|---|---|
| s5cmd | NFS(PHX) → Object(IAD) | 54m41.814s | copy | `--numworkers 74` |
| os sync | NFS(PHX) → Object(IAD) | 65m43.200s | NA | `--parallel-operations-count 50` |
| rclone | NFS(PHX) → Object(IAD) | 111m59.704s | copy | `--oos-no-check-bucket --no-check-dest --ignore-checksum --oos-disable-checksum --transfers 50` |
| rclone | Object(PHX) → Object(IAD) | 28m55.663s | copy | 위와 같은 옵션에 `--transfers 400`, VM 2대에서 실행해 동시 전송 800 |
| Python bulk copy | Object(PHX) → Object(IAD) | 25m43.715s | 기본값 | VM 1대, worker 50, 한 번에 100,000개 파일 큐 |
| Flexify IO | Object(PHX) → Object(IAD) | 20m27s | copy | 기본 engine/slot 10 |
| Flexify IO | Object(PHX) → Object(IAD) | 16m12s | copy | engine/slot 20 ("Advanced Settings"에서 늘릴 수 있음) |

원문의 정리는 다음과 같습니다.

- 파일 시스템(NFS) → Object Storage 전송에서는 **s5cmd와 os sync**가 좋은 결과를 보였습니다. Flexify IO와 bulk copy 스크립트는 버킷 간 전송만 다루므로 NFS 이전은 테스트하지 않았습니다.
- 리전 간 버킷 전송은 Flexify IO, rclone, Python bulk copy 스크립트만 할 수 있어서 이 세 가지만 테스트했습니다. **Flexify IO가 가장 빨랐고**, Python bulk copy 스크립트가 rclone보다 빨랐습니다.
- rclone으로 Azure Blob Storage, Amazon S3, Google Cloud Storage에서 OCI Object Storage로 소규모 전송을 해서 동작을 확인했습니다. ([Move data to object storage in the cloud by using Rclone](https://docs.oracle.com/en/solutions/move-data-to-cloud-storage-using-rclone/configure-rclone-object-storage.html))
- Flexify IO로 같은 2.25TiB를 AWS us-east-2에서 OCI Ashburn 리전으로 옮기는 데 기본 engine/slot 10으로 **23m51s**가 걸렸습니다.

#### 테스트 환경 3: 30MiB 파일 1,000,000개 (7.74TiB), 버킷 간 복사

- 테스트마다 VM 1~2대 (사양은 테스트 환경 2와 같음), 모든 테스트는 버킷 간 복사

| 방법 | 경로 | 소요 시간 | 옵션 | 비고 |
|---|---|---|---|---|
| rclone | IAD → IAD | 18h39m11.4s | `--oos-no-check-bucket --fast-list --no-traverse --transfers 500 --oos-chunk-size 10Mi` | VM 1대. 파일 수가 많고 원본 listing 호출 때문에 매우 느림 |
| rclone | IAD → IAD | 55m8.431s | `--oos-no-check-bucket --no-traverse --transfers 500 --oos-chunk-size 10Mi --files-from <file>` | VM 2대, VM당 transfer 500. 파일 목록을 1,000개씩 넣어 원본·대상 listing을 막아 성능 향상 |
| Python bulk copy | IAD → IAD | 28m21.013s | 기본값 | VM 1대, worker 50 |
| Python bulk copy | IAD → IAD | NA | 기본값 | VM 2대, VM당 worker 50. 429 오류가 나고 스크립트가 멈춰 완료하지 못함 |
| Flexify IO | IAD → IAD | 39m19s | 기본값 | engine/slot 10 |
| Flexify IO | IAD → IAD | 21m37s | engine/slot 20 | |
| s5cmd | IAD → IAD | 14m10.864s | 기본값(worker 256) | VM 1대 |
| s5cmd | IAD → IAD | 7m50.013s | 기본값 | VM 2대. VM 1대의 약 절반 시간 |
| s5cmd | IAD → IAD | 3m23.382s | `--numworkers 1000` | VM 1대. 이 데이터 세트에서 s5cmd 최적 결과 |
| rclone | IAD → PHX | 184m36.536s | 55m8.431s 테스트와 같은 옵션 | VM 2대 |
| Python bulk copy | IAD → PHX | 35m31.633s | 기본값 | VM 1대, worker 50 |
| Flexify IO | IAD → PHX | 21m17s | engine/slot 20 | |

원문의 정리는 다음과 같습니다.

- **s5cmd**는 파일 수가 많고 작은 파일에서 꾸준히 가장 좋았습니다. 다만 **같은 테넌시, 같은 리전 안의 버킷 간 복사만** 할 수 있습니다.
- 이 데이터 세트에는 **Flexify IO**를 권장합니다. 성능이 좋고 여러 S3 호환 Object Storage를 지원하며, engine/slot 수를 늘리면 시간이 줄었습니다.
- **rclone**은 파일 목록을 명령에 넣어 주고(`--files-from`) VM을 늘렸을 때 크게 빨라졌습니다. 다른 도구보다 느릴 수 있지만, 지원하는 플랫폼과 이전 유형이 가장 다양합니다.
- **OCI Object Storage Bulk Copy Python API**는 OCI 기본 CopyObject API만 쓸 수 있고, worker 50 정도에서 throttling이 걸립니다. 이 데이터 세트에서는 대체로 좋은 성능을 보였습니다.
- IAD → PHX 테스트는 IAD → IAD에서 가장 잘 된 방법만 진행했습니다. s5cmd는 같은 리전 안에서만 버킷 간 복사가 되므로 IAD → PHX는 테스트하지 않았습니다.

### 다음 단계

원문 시리즈의 나머지 편에서 도구별 사용법을 다룹니다.

- Rclone: **[OCI 클라우드 스토리지로 데이터 이전하기 (2편): Rclone 활용]({% post_url blog/infrastructure/2026-10-29-object-storage-rclone-part2 %})** (원문: [Tutorial 2: Move Data into OCI Cloud Storage Services using Rclone](https://docs.oracle.com/en/learn/migr-ocistorage-rclone-p2))
- Rclone 설치·설정·전송·검증 실습: **[OCI 클라우드 스토리지로 데이터 이전하기 (3편): Rclone 설치부터 전송·검증까지]({% post_url blog/infrastructure/2026-10-29-object-storage-rclone-part3 %})**
- OCI Object Storage Sync, s5cmd: [Tutorial 3: Move Data into OCI Cloud Storage Services using OCI Object Storage Sync and S5cmd](https://docs.oracle.com/en/learn/migr-ocistorage-ossync-s5cmd-p3)
- fpsync, rsync (파일 시스템 이전): [Tutorial 4: Move Data into OCI Cloud Storage Services using Fpsync and Rsync for File System Data Migrations](https://docs.oracle.com/en/learn/migr-ocistorage-fpsync-rsync-p4)

### 마무리

이전 도구는 **출발지와 목적지, 파일 구성(큰 파일 소수 / 작은 파일 다수), 리전·테넌시 경계**에 따라 고릅니다. Oracle 테스트에서는 파일 시스템 → Object Storage에 s5cmd와 os sync, 리전 간 버킷 복사에 Flexify IO가 좋은 결과를 보였습니다. Rclone은 가장 빠르지는 않을 수 있지만 지원 범위가 가장 넓습니다. 어떤 도구든 샘플 데이터로 먼저 테스트해서 자신의 환경에 맞는 방법을 확인한 뒤 본 이전을 진행합니다.

#### 참고자료

* [Oracle: Use Migration Tools to Move Data into OCI Cloud Storage Services](https://docs.oracle.com/en/learn/migr-ocistorage-p1/index.html)
* [Oracle: Move Data into OCI Cloud Storage Services using Rclone](https://docs.oracle.com/en/learn/migr-ocistorage-rclone-p2)
* [Oracle: Move data to object storage in the cloud by using Rclone](https://docs.oracle.com/en/solutions/move-data-to-cloud-storage-using-rclone/configure-rclone-object-storage.html)
* [Oracle Blog: Announcing native OCI Object Storage provider backend support in rclone](https://blogs.oracle.com/cloud-infrastructure/post/native-oci-object-storage-support-rclone)
* [Oracle: Transferring Data To and From File Storage](https://docs.oracle.com/en-us/iaas/Content/File/Tasks/transferring-data-to-and-from-file-storage.htm#transfer-data)
* [Oracle: Object Storage Replication](https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usingreplication.htm)
* [Oracle: File System Replication](https://docs.oracle.com/en-us/iaas/Content/File/Tasks/FSreplication.htm)
* [Oracle LiveLabs: Migration Essentials for Moving Data into OCI Cloud Storage](https://oracle-livelabs.github.io/oci/oci-migration-essentials/workshops/freetier/)
* [rclone: Oracle Object Storage](https://rclone.org/oracleobjectstorage/)
