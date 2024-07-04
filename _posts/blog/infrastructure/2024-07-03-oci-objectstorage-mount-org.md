---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Object Storage"
title: "OCI Object Storage 활용하기"
teaser: "OCI에서 Object Storage를 오픈소스를 통한 마운트 및 백업을 위한 벌크 다운로드 실습해 보겠습니다."
author: "kisukim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, compute, Object Storage]
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


# 1.Object Storage 소개

오늘은 클라우드 스토리지 솔루션의 강자로 자리 잡은 **Oracle Cloud Infrastructure (OCI) Object Storage**에 대해 활용에 대해서 설명 하고자 합니다. 대규모 데이터를 안전하고 경제적으로 저장, 관리 및 검색할 수 있는 이 고가용성, 고성능 저장소 서비스를 통해 클라우드 환경을 어떻게 최적화할 수 있는지 함께 알아보겠습니다.

OCI Object Storage는 Oracle의 클라우드 인프라스트럭처에서 제공하는 서비스로, 다양한 유형의 비정형 데이터를 저장하는 데 최적화된 스토리지입니다. 이는 무한 확장성이 가능하며, 클라우드 네이티브 애플리케이션, 데이터 분석, 백업 및 복구 등의 용도로 사용할 수 있습니다. 간단히 말해, 모든 종류의 데이터를 손쉽게 저장하고 관리할 수 있는 만능 저장소라 할 수 있습니다.

이번 포스트에서는 OCI Object Storage를 이용한 마운트 및 CLI 이용한  벌크 다운로드 그리고 rclone 사용에 대해서 확인해 보겠습니다.

## 1-1.Object Storage 주요 특징

- **고가용성 및 내구성**: 데이터는 여러 가용 영역에 걸쳐 복제되어 높은 내구성과 가용성을 보장합니다. 이는 데이터를 잃어버릴 걱정 없이 안전하게 보관할 수 있음을 의미합니다.
- **무한 확장성**: 데이터 사용량이 늘어나면 자동으로 확장되어 필요할 때마다 저장소를 추가할 수 있습니다.
- **강력한 보안**: 데이터 암호화, IAM(Identity and Access Management), VCN(Virtual Cloud Network)과 통합된 네트워크 보안 기능을 제공합니다. 이로써 데이터 접근을 철저히 통제할 수 있습니다.
- **유연한 데이터 관리**: 라이프사이클 정책을 통해 데이터의 자동 이동, 보관 및 삭제를 관리할 수 있습니다.
- **S3 호환성**: AWS S3 API와 호환되어 다양한 툴 및 애플리케이션과 쉽게 통합할 수 있습니다.

## 1-2.Object Storage 사용 사례

- **백업 및 복구**: 중요한 데이터를 백업하고 필요할 때 신속하게 복구할 수 있습니다.
- **빅데이터 분석**: 대규모 데이터셋을 저장하고 분석 작업을 효율적으로 처리할 수 있습니다.
- **콘텐츠 저장 및 배포**: 비디오, 이미지, 로그 파일 등 다양한 콘텐츠를 저장하고 배포하는 데 유용합니다.
- **데이터 아카이빙**: 장기 보관이 필요한 데이터를 안전하게 아카이빙할 수 있습니다.

## 1-3.Oracle Cloud Infrastructure(OCI) Object Storage 주요 기능

- **라이프사이클 관리**: 특정 조건에 따라 오브젝트를 자동으로 아카이브하거나 삭제할 수 있습니다.
- **액세스 제어**: 버킷과 오브젝트에 대한 세부적인 권한 설정을 통해 접근을 철저히 관리할 수 있습니다.
- **데이터 암호화**: 저장 및 전송 중 데이터를 암호화하여 보안을 강화합니다.
- **버전 관리**: 오브젝트의 여러 버전을 저장하여 필요시 이전 버전으로 복원할 수 있습니다.
- **미터링 및 로깅**: 사용량과 접근 로그를 통해 데이터를 모니터링하고 관리할 수 있습니다.

# 2. 테스트 종류

## 2-1. OCI CLI 을 통한 bulk download

OCI CLI(Oracle Cloud Infrastructure Command Line Interface)는 Oracle Cloud Infrastructure(OCI)의 리소스를 관리하고 자동화할 수 있는 강력한 명령줄 도구입니다.  Object Storage 저장된 데이터를 로컬 혹은 다른 환경에 저장하기 위해서 사용되는 벌크 명령어입니다.
OCI CLI를 사용하면 다양한 OCI 서비스에 대해 명령어를 실행하여 인스턴스 생성, 네트워크 구성, 스토리지 관리 등 다양한 작업을 수행할 수 있습니다. 아래  CLI를 통한 제어를 하기 위해서는 CLI 설치해야 합니다. 아래 링크 참조하여 환경에 맞는 설치를 진행하시면 됩니다.

- OCI-CLI 설치 방법 ([https://the-team-oasis.github.io/getting-started/oracle-linux-ocicli-config/](https://the-team-oasis.github.io/getting-started/oracle-linux-ocicli-config/))

![](/assets/img/infrastructure/2024/obsmount/objectstorage-mount-0.png)

- 위 화면에 리스트에 있는 파일을 아래 명령어를 통해서 한꺼번에 다운로드 받을 수 있습니다. (bulk-downlaod 관련 참고 링크 입니다. [https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.44.1/oci_cli_docs/cmdref/os/object/bulk-download.html](https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.44.1/oci_cli_docs/cmdref/os/object/bulk-download.html))

```bash

oci os object bulk-download -ns [네임스페이스] -bn [버켓이름] --download-dir [다운로드 저장위치]
```

![](/assets/img/infrastructure/2024/obsmount/objectstorage-mount-1.png)

## 2-2. Rclone 이용한 마운트 활용 방법 (참고)

Rclone은 다양한 클라우드 저장소 서비스를 효율적으로 관리하고 동기화할 수 있는 오픈 소스 커맨드라인 툴입니다. 주로 백업 및 파일 전송에 사용되며, 여러 클라우드 스토리지 서비스를 지원합니다. 다음은 Rclone의 주요 특징과 사용법입니다.

1.	**다양한 클라우드 스토리지 지원**: Amazon S3, Google Drive, Dropbox, OneDrive 등 다수의 클라우드 스토리지 서비스를 지원합니다.

2.	**강력한 동기화 기능**: 로컬 파일 시스템과 클라우드 스토리지 간의 양방향 동기화가 가능합니다.

3.	**암호화**: 파일과 디렉토리를 암호화하여 안전하게 클라우드에 저장할 수 있습니다.

4.	**유연한 구성**: 다양한 옵션과 플래그를 통해 세부적인 설정이 가능합니다.

5.	**자동화 및 스케줄링**: 크론 작업과 함께 사용하여 자동화된 백업 및 동기화 작업을 수행할 수 있습니다.

- 아래 명령어는 Oracle Linux 8 버전에서 테스트를 진행하였으며, rclone 패키지 설치를 위한 명령어입니다. (**root 권한으로 실행합니다.**)

```bash
## Oracle Linux 8 버전으로 테스트 진행했습니다.
curl https://rclone.org/install.sh | bash
```

![](/assets/img/infrastructure/2024/obsmount/objectstorage-mount-7.png)

- 설치가 정상적으로 이루어지면 “rclone config” 명렁어를 실행하거나, 혹은 아래 rclone 경로에 config 파일을 만들어서 사용하면 됩니다.

- rclone conifg 설정 파일 (/root/.config/rclone/rclone.conf)

```jsx
[oci]
type = s3
provider = Other
env_auth = true
access_key_id = d50db9932d2e9cadad9f7f4b8e5daae94741427affd2ab -- 샘플입니다.
secret_access_key = I2/In5SdzUUnJESJddaakshZVUU40NCkZYqt2QpZx8a/hS+M= -- 샘플입니다.
region = ap-tokyo-1
acl = bucket-owner-full-control
endpoint = https://axlpeslmb1ng.compat.objectstorage.ap-tokyo-1.oraclecloud.com -- endpoint는 앞에서 설명한 s3fs endpoint 참고 하시면 됩니다. 
```

- 위 화면에서 필요한 **access_key** 및 **secret_access_key**는 앞장에서 설명 되었던 “**고객 암호 키**” 참고 하시면 됩니다.

```bash

rclone ls [config 설명 이름]:[버켓이름] // oci는 config 설정에 명시된 부분이며, 이후 이름은 버켓이름 입니다. 
rclone ls oci:bucket-20240614-1338 
```

- 위 명령어는 Rclone 통해서 디렉토리 조회하는 명령어 입니다.

```bash
rclone copy /path/to/local/folder remote:bucket/folder
```

- 클라우드 스토리지로 파일 복사 명령어 입니다.

```bash
rclone sync /path/to/local/folder remote:bucket/folder
```

- 클라우드 스토리지와 로컬 디렉터리 동기화

