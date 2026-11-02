---
layout: page-fullwidth
subheadline: "Infrastructure"
title: "OCI 클라우드 스토리지로 데이터 이전하기 (2편): Rclone 활용"
teaser: "Rclone의 copy·sync 명령과 성능 옵션, 대량 파일 이전 방법, OKE와 fpart를 함께 써서 파일 시스템 데이터를 OCI Object Storage로 옮기는 방법을 알아봅니다."
author: kskim
date: 2026-10-29 00:00:00
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, object storage, file storage, rclone, oke, fpsync, migration]
# published: false
header: no

# -------------- 내용 필독 -------------------
# 원문: Oracle Tutorial "Move Data into OCI Cloud Storage Services using Rclone" (G25447-02)
# https://docs.oracle.com/en/learn/migr-ocistorage-rclone-p2/index.html
# 1편: 2026-10-29-object-storage-rclone.md
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

이 글은 Oracle 공식 튜토리얼 [Move Data into OCI Cloud Storage Services using Rclone](https://docs.oracle.com/en/learn/migr-ocistorage-rclone-p2/index.html)을 한글로 정리한 것입니다. 4편으로 이루어진 시리즈의 2편으로, **Rclone으로 데이터를 OCI 클라우드 스토리지 서비스로 옮기는 방법**을 다룹니다.

> 어떤 상황에 어떤 도구가 맞는지는 1편 [OCI 클라우드 스토리지로 데이터 이전하기: 마이그레이션 도구 선택 가이드]({% post_url blog/infrastructure/2026-10-29-object-storage-rclone-part1 %})에서 먼저 확인하세요. Rclone을 설치하고 OCI·원본을 설정해 전송·검증하는 실습 절차는 [3편]({% post_url blog/infrastructure/2026-10-29-object-storage-rclone-part3 %})에서 이어집니다.

Rclone은 클라우드로, 또는 클라우드 스토리지 벤더 사이에서 데이터를 옮기는 오픈소스 명령줄 도구입니다. 1회성 이전과 주기적인 동기화를 모두 할 수 있고, Object Storage, File Storage, 마운트된 드라이브 등 70가지 스토리지 유형을 지원합니다. **OCI Object Storage를 기본 백엔드로 지원**하며, 옵션으로 프로세스를 scale-up·scale-out해서 전송 성능을 높일 수 있습니다.

이전할 데이터 양과 전환(cut-over) 때 허용되는 다운타임을 먼저 정합니다. 배치 마이그레이션으로 작업을 나누면 애플리케이션별로 다운타임을 다른 시간대에 잡을 수 있습니다. [OCI FastConnect](https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/fastconnect.htm)를 쓰면 1G~400G 전용 사설 연결로 전송 속도를 높일 수 있고, Megaport, Console Connect 같은 파트너와 연동해 데이터센터나 다른 클라우드와 직접 연결할 수 있습니다. ([FastConnect integration with Megaport Cloud Router](https://blogs.oracle.com/cloud-infrastructure/post/fastconnect-integration-megaport-cloud-router))

#### 대상 독자

DevOps 엔지니어, 개발자, OCI 클라우드 스토리지 관리자와 사용자, IT 관리자, OCI 파워 유저, 애플리케이션 관리자

#### 목표

- Rclone으로 파일 시스템 데이터(로컬, NAS, 클라우드 호스팅)를 OCI Object Storage로 이전
- 다른 클라우드의 Object/Blob Storage 데이터를 OCI Object Storage로 이전
- OKE(Oracle Cloud Infrastructure Kubernetes Engine)에서 Rclone을 실행해 OCI File Storage 데이터를 OCI Object Storage로 이전

#### 사전 준비

- OCI 계정
- 마이그레이션 도구를 설치할 OCI VM 인스턴스, 또는 도구를 설치해 쓸 수 있는 시스템
- 홈 디렉터리의 `.oci` 하위 디렉터리에 동작하는 config 파일이 있는 OCI CLI ([Setting up the Configuration File](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm#configfile))
- OCI Object Storage 버킷 접근 권한
- 최소 1개 버킷 또는 compartment에 대해 bucket·object 관리 권한이나 `manage object-family` 권한 ([Common Policies](https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/commonpolicies.htm), [Policy Reference](https://docs.oracle.com/en-us/iaas/Content/Identity/Reference/policyreference.htm))
- OCI File Storage를 생성·export·마운트할 권한, 또는 이미 VM에 마운트된 File Storage mount target, 또는 복사에 쓸 다른 NFS 마운트나 로컬 파일 시스템
- Mac OS, Linux, BSD의 터미널, 또는 Windows PowerShell·명령 프롬프트·bash 사용 경험
- Linux에 소프트웨어를 설치해 본 경험, Kubernetes에 대한 기본 이해
- OCI IAM과 dynamic group에 대한 기본 지식 (Ubuntu 호스트를 dynamic group에 넣어 사용) ([Managing Dynamic Groups](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingdynamicgroups.htm))
- Rclone 등 마이그레이션 도구 설치는 [Migration Essentials for Moving Data into OCI Cloud Storage](https://oracle-livelabs.github.io/oci/oci-migration-essentials/workshops/freetier/) 참고

### Rclone 개요와 기본 개념

Rclone은 지원하는 프로토콜과 클라우드 제공자가 많고 설정이 쉬워서, 어떤 데이터 세트에도 쓸 수 있는 범용 마이그레이션 도구입니다. 특히 **데이터를 배치로 나눠 여러 노드에 scale-out할 수 있는 경우**에 잘 맞습니다.

Rclone으로 이전할 수 있는 대상은 다음과 같습니다.

- 파일 시스템 데이터(OCI File Storage, OCI Block Storage, OCI File Storage with Lustre, 온프레미스 파일 시스템, 온프레미스 NFS)를 다른 파일 시스템 스토리지로, 또는 Object Storage(OCI Object Storage 포함)와 주고받기
- 지원하는 클라우드 제공자의 Object Storage와 OCI Object Storage 사이

#### Rclone 성능 이해하기

성능은 얼마나 scale-up·scale-out할 수 있는지에 달려 있습니다. 샘플 데이터로 여러 번 테스트해서 네트워크 대역폭 한계에 언제 닿는지 확인하라고 원문은 권장합니다.

예를 들어 원본 버킷에 약 1TB씩 든 폴더(prefix)가 10개 있다면, CPU와 RAM이 큰 VM 2대에 나누어 각 VM에서 Rclone copy 프로세스 여러 개를 병렬로 실행할 수 있습니다. 다음 명령으로 시작한 뒤, 각 VM의 NIC가 꽉 찰 때까지 transfer 수와 checker 수를 조정합니다.

```bash
rclone copy --progress --transfers 10 --checkers 8 --no-check-dest aws_s3_virgina:/source_bucket_name/folder1 iad_oss_native:/destination_bucket_name/folder1
rclone copy --progress --transfers 50 --checkers 8 --no-check-dest aws_s3_virgina:/source_bucket_name/folder2 iad_oss_native:/destination_bucket_name/folder2
```

- **Scale-up:** CPU, 메모리, 네트워크 대역폭이 큰 시스템일수록 더 많은 transfer와 checker를 병렬로 실행할 수 있습니다.
- **Scale-out:** 데이터를 구조에 따라 배치로 나눌 수 있으면 여러 시스템에서 Rclone을 실행합니다.

Oracle 테스트에서는 VM 2대로 scale-out했습니다. 데이터가 더 크면 4대까지 늘리거나 Bare Metal(BM) 인스턴스를 쓰는 것도 고려합니다.

#### copy와 sync 명령

| 명령 | 동작 |
|---|---|
| `rclone copy` | 원본 파일(객체)을 대상에 복사합니다. 크기와 수정 시각, 또는 md5sum으로 같은 파일은 건너뜁니다. **대상의 파일은 지우지 않습니다.** |
| `rclone sync` | 원본과 대상을 동기화합니다. 같은 파일은 건너뛰고, 대상을 원본과 똑같이 맞춥니다. 즉 **원본에 없는 대상 파일은 삭제됩니다.** |

> **주의:** `sync`는 대상을 원본과 정확히 같게 만들고 싶을 때만 씁니다. 새 파일을 대상에 복사만 하려면 `copy`를 씁니다.

#### 성능에 영향을 주는 주요 옵션

| 옵션 | 설명 |
|---|---|
| `--no-traverse` | `copy`에서만 동작합니다. 대상 파일 시스템을 순회(list)하지 않고, 파일을 하나씩 확인해서 복사할지 정합니다. 파일이 이미 많은 대상에 적은 수의 파일을 복사할 때 더 빠를 수 있습니다. |
| `--no-check-dest` | `copy`에서만 동작합니다. 대상 파일을 확인하거나 list하지 않아 API 호출을 줄이고, 파일을 항상 전송합니다. 대상이 비어 있거나, 대상 상태와 관계없이 원본을 모두 복사하려 할 때 씁니다. |
| `--ignore-checksum` | 전송이 크게 빨라지지만, 전송 중 데이터 손상을 확인하지 않습니다. |
| `--oos-disable-checksum` | 객체 메타데이터에 MD5 checksum을 저장하지 않습니다. 기본 동작은 업로드 전에 MD5를 계산해 메타데이터에 넣는데, 무결성에는 좋지만 큰 파일은 업로드 시작이 늦어집니다. |
| `--transfers <int>` | 병렬 파일 전송 수입니다(기본 4). 호스트 크기에 맞춰 테스트하면서 최대 전송 속도에 닿을 때까지 늘립니다. 원문에 따르면 고객들은 64~3000 사이로 올려 원하는 성능을 얻었습니다. |
| `--checkers <int>` | 병렬 검사 수입니다(기본 8). 너무 높이면 서버에 부담을 주고 대상에 문제가 생길 수 있습니다. 메모리가 아주 큰 시스템이면 2씩 늘립니다. 테스트 환경에서 좋은 결과를 낸 최대값은 64였고, 보통 8~10이면 충분합니다. transfer 수의 25~50% 정도가 적당하며, transfer 수가 클수록 25%에 가깝습니다. |
| `--progress` | 전송 중 진행 상황을 보여 줍니다. |
| `--fast-list` | 가능하면 재귀 list를 씁니다. 메모리를 더 쓰지만 API 호출이 줄어듭니다. 중첩 디렉터리에 파일이 적당히 많을 때 좋습니다. `copy`, `sync` 모두에 쓸 수 있습니다. |
| `--oos-no-check-bucket` | 버킷이 있다고 가정하고 바로 데이터를 넣습니다. 버킷이 있는 걸 알 때 쓰면 Rclone의 요청 수가 줄어듭니다. |
| `--oos-upload-cutoff` | 이 크기보다 큰 파일은 chunk로 나눠 업로드합니다. 기본 200MiB입니다. |
| `--oos-chunk-size` | upload cutoff보다 크거나 크기를 모르는 파일은 이 chunk 크기로 multipart 업로드합니다. 크기를 아는 큰 파일은 10,000 chunk 제한 아래로 맞추려고 Rclone이 chunk 크기를 자동으로 늘립니다. 기본 5MiB입니다. |
| `--oos-upload-concurrency <int>` | multipart 업로드에서 동시에 올리는 chunk 수입니다(기본 8). 고속 링크로 큰 파일 몇 개를 올리는데 대역폭을 다 쓰지 못하면 천천히 늘립니다. |

> **참고 1:** `--no-traverse`와 `--no-check-dest`는 **둘 중 하나만** 씁니다. 둘 다 넣는 경우가 많지만 필요 없습니다.
> - 대상이 비어 있거나, 무조건 원본을 모두 복사하려면 `--no-check-dest`
> - 아주 큰 파일 몇 개를 옮기는 경우에는 `--no-traverse` (복사 전에 파일마다 대상에 최신본이 있는지 확인해 list API 호출과 복사량을 줄일 수 있음)
>
> **참고 2:** `--fast-list`는 `--no-traverse`, `--no-check-dest`와 반대되는 옵션이라 함께 쓰지 않습니다.
>
> **참고 3:** 여러 호스트로 scale-out하면 429 "TooManyRequests" 오류가 날 수 있습니다. 이때는 checker 수를 2씩 줄여 10까지 낮춰 보고, 그래도 안 되면 transfer 수도 줄입니다.
>
> **참고 4:** `--transfers`, `--oos-upload-concurrency`, `--oos-chunk-size`를 쓰는 multipart 업로드는 메모리를 더 씁니다. 단일 파트 업로드는 추가 메모리를 쓰지 않습니다. 네트워크 지연이 클수록 단일 파트 업로드가 더 빠를 가능성이 큽니다.

#### OCI Object Storage용 Rclone 설정 파일 예시

```ini
[oci]
type = oracleobjectstorage
namespace = xxxxxxxxxxx
compartment = ocid1.compartment.oc1..xxxxxxxxx
region = us-ashburn-1
provider = user_principal_auth
config_file = ~/.oci/config
config_profile = Default
```

#### 기본 명령 형식

```bash
rclone <flags> <command> <source> <dest>
```

로컬 파일 시스템 또는 OCI File Storage → OCI Object Storage:

```bash
rclone copy /src/path oci:bucket-name
```

OCI Object Storage → 로컬 파일 시스템 또는 OCI File Storage:

```bash
rclone copy oci:bucket-name /src/path
```

S3 → OCI Object Storage:

```bash
rclone copy s3:s3-bucket-name oci:bucket-name
```

> **참고:** AWS에서 KMS 서버 측 암호화를 쓰고 있으면, checksum 오류를 피하려면 Rclone 설정에 `server_side_encryption = aws:kms`를 넣어야 합니다. ([Rclone S3 KMS](https://rclone.org/s3/#key-management-system-kms), [Rclone S3 configuration](https://rclone.org/s3/#configuration))
>
> `sync` 명령도 형식은 같고, `copy`를 `sync`로 바꾸면 됩니다.

### Rclone 사용 예시

**예시 1: 파일(객체)이 이미 많은 대상에 작은 파일 몇 개를 복사**

```bash
rclone --progress  --transfers 16  --oos-no-check-bucket --checkers 8  --no-traverse copy <source> <dest>
```

**예시 2: 큰 파일 몇 개를 multipart로 업로드**

```bash
rclone --progress  --oos-no-check-bucket --fast-list --no-traverse --transfers 8 --oos-chunk-size 10M --oos-upload-concurrency 10 --checkers 10  copy <source> <dest>
```

> 위 `--transfers`, `--oos-chunk-size`, `--oos-upload-concurrency`, `--checkers` 값은 시작점입니다. 파일(객체) 크기, 메모리, 시스템 자원에 맞춰 대역폭을 충분히 쓸 때까지 올립니다. 시스템이 아주 작으면 자원을 아끼도록 낮춰야 할 수도 있습니다.

**예시 3: 100Gbps NIC를 가진 BM 3대로 scale-out, 크기가 섞인 페타바이트 규모 데이터, multipart 업로드, 비어 있지 않은 버킷, OCI File Storage → OCI Object Storage**

```bash
rclone --progress --stats-one-line --max-stats-groups 10 --fast-list --oos-no-check-bucket --oos-upload-cutoff 10M --transfers 64 --checkers 32 --oos-chunk-size 512Mi --oos-upload-concurrency 12 --oos-disable-checksum --oos-attempt-resume-upload --oos-leave-parts-on-error --no-check-dest /src/path oci:bucket
```

예시 3에 추가로 쓴 옵션은 다음과 같습니다.

| 옵션 | 설명 |
|---|---|
| `--stats-one-line` | 통계를 한 줄로 표시합니다. |
| `--max-stats-groups` | 메모리에 유지할 통계 그룹의 최대 수입니다. 최대치에 이르면 가장 오래된 것을 버립니다(기본 1000). |
| `--oos-attempt-resume-upload` | 이전에 시작한 객체의 multipart 업로드를 이어서 시도합니다. |
| `--oos-leave-parts-on-error` | 실패해도 업로드 중단(abort)을 호출하지 않고, 업로드에 성공한 파트를 수동 복구용으로 남깁니다. |

### 파일이 아주 많을 때: 목록을 나눠서 이전

Rclone은 디렉터리 단위로 동기화합니다. 수천만 개 파일(객체)을 옮긴다면 **디렉터리(prefix)당 약 10,000개 이하**로 나눠야 합니다. 그렇지 않으면 Rclone이 메모리를 너무 많이 써서 중단될 수 있습니다. 작은 파일이 수억 개 이상인 고객이 자주 겪는 문제입니다. 파일이 모두 한 디렉터리에 있다면 먼저 나눕니다.

1. 원본의 파일 목록을 만듭니다.

   ```bash
   rclone lsf --files-only -R src:bucket | sort > src
   ```

2. `split`으로 목록을 1,000~10,000줄씩 나눕니다. 아래 명령은 1,000줄씩 나눠 `src_00` 같은 `src_##` 파일로 저장합니다.

   ```bash
   split -l 1000 --numeric-suffixes src src_
   ```

3. 나눈 목록 파일을 여러 VM에 나눠 scale-out합니다. 각 Rclone 명령은 다음과 같습니다.

   ```bash
   rclone --progress --oos-no-check-bucket --no-traverse --transfers 500 copy remote1:source-bucket remote2:dest-bucket --files-from src_00
   ```

간단한 `for` 반복문으로 `split`이 만든 목록 파일들을 차례로 처리할 수도 있습니다. 원문 테스트에서는 한 버킷에 파일이 약 270,000개 있을 때 복사 시간이 40배 빨라졌습니다. 결과는 환경에 따라 다를 수 있습니다.

> **참고:** 디렉터리 구조로 나누거나 `split`으로 목록을 나누는 것이 전송 최적화의 중요한 방법입니다.

### Rclone + OKE + fpart로 파일 시스템 데이터를 Object Storage로 이전

여러 Kubernetes pod로 파일 시스템과 Object Storage 사이의 전송을 scale-out할 수 있습니다. 병렬화는 지연은 비교적 크고 처리량은 높은 스토리지로 전송할 때 속도를 높여 줍니다. 이 방식은 디렉터리 구조를 여러 덩어리로 나누고, 같은 노드나 여러 노드의 컨테이너에서 병렬로 전송합니다. 여러 노드에서 실행하면 노드마다의 네트워크 처리량과 컴퓨팅 성능이 합쳐집니다.

| 구성 요소 | 역할 |
|---|---|
| fpart (Filesystem partitioner) | 디렉터리 구조를 나눕니다. 나눈 파티션마다 rsync, tar, Rclone 같은 도구를 서로 독립적으로 병렬 실행할 수 있습니다. 여기서는 Rclone과 함께 씁니다. |
| fpsync | fpart로 전송 도구(rsync, Rclone)를 병렬 실행하는 래퍼 스크립트입니다. fpsync operator 호스트에서 실행하며, 별도 worker 노드를 쓰는 옵션도 있습니다. 수정된 fpsync는 Rclone과 Kubernetes pod를 지원합니다. |
| kubectl | Kubernetes job을 관리합니다. |

#### 진행 순서

1. 이전할 원본 데이터에 접근할 수 있고 Rclone이 설치된 호스트를 **fpsync operator 호스트**로 정합니다.

2. kubectl을 설치합니다.

   ```bash
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   chmod 755 kubectl
   cp -a kubectl /usr/bin
   ```

3. fpsync operator 호스트가 OKE 클러스터를 관리할 수 있도록 OCI IAM 정책을 만듭니다. 아래 정책을 쓸 수 있고, pod 제어에 필요한 최소 권한으로 더 세밀하게 설정할 수도 있습니다.

   ```text
   Allow dynamic-group fpsync-host to manage cluster-family in compartment storage
   ```

4. OKE 클러스터에 접근할 수 있도록 kubeconfig 파일을 설정합니다. ([Setting Up Local Access to Clusters](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengdownloadkubeconfigfile.htm#localdownload))

5. fpart와 fpsync를 설치하고 패치합니다. fpart 패키지에 포함된 fpsync는 Rclone과 Kubernetes pod를 지원하지 않으므로, 병렬 scale-out을 하려면 패치가 필요합니다. Ubuntu에서는 다음과 같이 설치합니다.

   ```bash
   apt-get install fpart
   git clone https://github.com/aboovv1976/fpsync-k8s-rclone.git
   cd fpsync-k8s-rclone/
   cp -p /usr/bin/fpsync /usr/bin/k-fpsync
   patch /usr/bin/k-fpsync fpsync.patch
   ```

6. 컨테이너 이미지를 빌드합니다. `rclone-rsync-image`에 있는 Docker 빌드 명세로 이미지를 만들고, OKE 클러스터에서 접근할 수 있는 레지스트리에 올립니다.

   ```bash
   # rclone-rsync-image
   docker build -t rclone-rsync .
   docker login
   docker tag rclone-rsync:latest <registry url/rclone-rsync:latest>
   docker push <registry url/rclone-rsync:latest>
   ```

   이미지 사본은 `fra.ocir.io/fsssolutions/rclone-rsync:latest`에 있습니다. `sample` 디렉터리에 출력 파일 예시가 있습니다.

7. `k-fpsync`를 실행합니다. 패치된 fpsync(`k-fpsync`)는 원본 파일 시스템을 나눈 뒤 여러 Kubernetes pod로 전송을 scale-out합니다. pod anti-affinity 규칙은 전송 worker pod가 없는 노드를 우선하도록 설정되어 있어, 노드별 대역폭을 효과적으로 씁니다. ([Assigning Pods to Nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/))

   - 원본 파일 시스템을 fpart operator 호스트에 마운트하고, 모든 pod가 접근할 공유 디렉터리를 만듭니다. 로그 파일과 파티션 파일이 이 디렉터리에 저장됩니다.
   - 아래 명령은 `/data/src` 파일 시스템의 데이터를 OCI Object Storage 버킷 `rclone-2`로 전송합니다. fpart가 만든 파티션을 전송하려고 pod를 한 번에 2개씩 시작합니다.

   ```bash
   mkdir /data/fpsync
   PART_SIZE=512 && ./k-fpsync -v -k fra.ocir.io/fsssolutions/rclone-rsync:latest,lustre-pvc  -m rclone -d /data/fpsync  -f $PART_SIZE -n 2 -o "--oos-no-check-bucket --oos-upload-cutoff 10Mi --multi-thread-cutoff 10Mi --no-check-dest --multi-thread-streams 64 --transfers $PART_SIZE  --oos-upload-concurrency 8 --oos-disable-checksum  --oos-leave-parts-on-error" /data/src/ rclone:rclone-2
   ```

   > **참고:** 실행 로그는 run-ID 디렉터리에 남습니다. 위 예시에서는 `/data/fpsync/{Run-Id}/log`입니다. 출력 예시는 `sample` 디렉터리에 있습니다.

### Oracle 테스트 결과 (선택)

2편의 테스트 환경과 측정값은 [1편의 테스트 결과]({% post_url blog/infrastructure/2026-10-29-object-storage-rclone-part1 %}#oracle-테스트-결과-선택)와 같은 환경(테스트 환경 1~3)이며, Flexify IO 결과만 빠져 있습니다. 성능 비교를 위해 bulk copy 스크립트, os sync, s5cmd 결과도 함께 실려 있습니다.

Rclone 관련 결과만 다시 정리하면 다음과 같습니다.

| 테스트 | 경로 | 소요 시간 | 옵션/비고 |
|---|---|---|---|
| 환경 1: 3TB (1TB 파일 3개) | NFS(PHX) → Object(IAD) | 178m27.101s | `--transfers=100 --oos-no-check-bucket --fast-list --checkers 64 --retries 2 --no-check-dest` |
| 환경 1: 9.787GB (파일 20,000개) | NFS(PHX) → Object(IAD) | 1m52.886s | `--transfers=500 --oos-no-check-bucket --no-check-dest` |
| 환경 2: 2.25TiB | NFS(PHX) → Object(IAD) | 111m59.704s | `--oos-no-check-bucket --no-check-dest --ignore-checksum --oos-disable-checksum --transfers 50` |
| 환경 2: 2.25TiB | Object(PHX) → Object(IAD) | 28m55.663s | 같은 옵션에 `--transfers 400`, VM 2대로 동시 전송 800 |
| 환경 3: 30MiB 파일 1,000,000개 | Object IAD → IAD | 18h39m11.4s | `--oos-no-check-bucket --fast-list --no-traverse --transfers 500 --oos-chunk-size 10Mi`, VM 1대, listing 때문에 매우 느림 |
| 환경 3: 30MiB 파일 1,000,000개 | Object IAD → IAD | 55m8.431s | `--oos-no-check-bucket --no-traverse --transfers 500 --oos-chunk-size 10Mi --files-from <file>`, VM 2대, 목록을 1,000개씩 입력 |
| 환경 3: 30MiB 파일 1,000,000개 | Object IAD → PHX | 184m36.536s | 55m8.431s 테스트와 같은 옵션, VM 2대 |

> 2편 원문의 환경 1 데이터 세트 2 표에는 파일 크기가 "1MB"로 적혀 있습니다. 1편에는 "each file 20MB"로 되어 있어 두 편의 표기가 다릅니다.

2편 원문의 정리는 다음과 같습니다.

- 파일 시스템(NFS) → Object Storage에서는 s5cmd와 os sync가 좋은 결과를 보였습니다.
- 리전 간 버킷 전송은 rclone과 Python bulk copy 스크립트만 테스트했습니다. Python bulk copy 스크립트가 더 빨랐지만 OCI Object Storage만 지원하고, rclone은 여러 백엔드와 클라우드 제공자를 지원합니다.
- rclone으로 Azure Blob Storage, Amazon S3, Google Cloud Storage → OCI Object Storage 소규모 전송을 해서 동작을 확인했습니다. ([Move data to object storage in the cloud by using Rclone](https://docs.oracle.com/en/solutions/move-data-to-cloud-storage-using-rclone/configure-rclone-object-storage.html))
- **rclone은 파일 목록을 명령에 넣어 주고(`--files-from`) VM을 하나 더 늘렸을 때 크게 빨라졌습니다.** 다른 도구보다 느릴 수 있지만 지원 플랫폼과 이전 유형이 가장 다양합니다.

### 다음 단계

- 1편: [OCI 클라우드 스토리지로 데이터 이전하기: 마이그레이션 도구 선택 가이드]({% post_url blog/infrastructure/2026-10-29-object-storage-rclone-part1 %})
- 3편: **[OCI 클라우드 스토리지로 데이터 이전하기 (3편): Rclone 설치부터 전송·검증까지]({% post_url blog/infrastructure/2026-10-29-object-storage-rclone-part3 %})**
- OCI Object Storage Sync, s5cmd: [Tutorial 3: Move Data into OCI Cloud Storage Services using OCI Object Storage Sync and S5cmd](https://docs.oracle.com/en/learn/migr-ocistorage-ossync-s5cmd-p3)
- fpsync, rsync (파일 시스템 이전): [Tutorial 4: Move Data into OCI Cloud Storage Services using Fpsync and Rsync for File System Data Migrations](https://docs.oracle.com/en/learn/migr-ocistorage-fpsync-rsync-p4)

### 마무리

Rclone은 지원 범위가 넓은 범용 이전 도구입니다. **`copy`와 `sync`의 차이**를 먼저 이해하고, 대상 상태에 맞춰 `--no-check-dest`와 `--no-traverse` 중 하나를 고릅니다. 그다음 `--transfers`, `--checkers` 같은 값을 샘플 데이터로 시험하며 조정합니다. 파일이 아주 많으면 목록을 나눠 `--files-from`으로 여러 VM에 분산하고, 파일 시스템 데이터가 크면 OKE와 fpart로 pod 단위 scale-out을 고려합니다.

#### 참고자료

* [Oracle: Move Data into OCI Cloud Storage Services using Rclone](https://docs.oracle.com/en/learn/migr-ocistorage-rclone-p2/index.html)
* [Oracle: Use Migration Tools to Move Data into OCI Cloud Storage Services](https://docs.oracle.com/en/learn/migr-ocistorage-p1)
* [Oracle: Move data to object storage in the cloud by using Rclone](https://docs.oracle.com/en/solutions/move-data-to-cloud-storage-using-rclone/configure-rclone-object-storage.html)
* [Oracle Blog: Announcing native OCI Object Storage provider backend support in rclone](https://blogs.oracle.com/cloud-infrastructure/post/native-oci-object-storage-support-rclone)
* [Oracle LiveLabs: Migration Essentials for Moving Data into OCI Cloud Storage](https://oracle-livelabs.github.io/oci/oci-migration-essentials/workshops/freetier/)
* [GitHub: Data Transfer between file systems and OCI Object Storage using OKE](https://github.com/aboovv1976/fpsync-k8s-rclone)
* [rclone: Oracle Object Storage](https://rclone.org/oracleobjectstorage/)
