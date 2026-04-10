---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "데이터와 AI를 하나의 플랫폼에서 통합 운영이 가능한 AI Data Platform 소개"
teaser: "데이터와 AI를 하나의 플랫폼에서 통합 운영하여, 기업이 빠르게 AI 기반 서비스를 구축할 수 있도록 지원하는 클라우드 데이터 플랫폼에 대해서 설명합니다."
author: lim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, databricks, AIDP, datapipeline, dataplatform]
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

### OCI AI Data Platform 개요
OCI AIDP (AI Data Platform) 는 OCI 의 클라우드 서비스로, 기업이 데이터 수집 → 저장 → 분석 → AI 활용까지 하나의 플랫폼에서 통합적으로 처리할 수 있도록 설계된 엔드투엔드 AI 데이터 플랫폼 입니다.
특히 GenAI, 데이터 레이크하우스, 실시간 분석을 하나로 묶어 AI 중심 데이터 운영 환경을 제공하는 것이 핵심입니다.

Oracle AI Data Platform은 Autonomous AI Lakehouse, Oracle Analytics Cloud, Oracle Object Storage, OCI Generative AI 및 Fusion Data Intelligence를 단일 관리 플랫폼으로 통합하여 기업 데이터 기반의 데이터 및 AI 애플리케이션을 구축, 배포 및 확장할 수 있도록 합니다.

* OCI AI Data Platform 서비스

![AIDP](/assets/img/dataplatform/2026/blog/01.oci_ai_dataplatform_overview_01.png " ")  

Oracle AI Data Platform 의 일반적인 사용 사례에는 Blonze, Silver, Gold 레이어로 구성된 메달리온 아키텍처 구현, Spark 기반 워크플로를 사용한 ETL 및 데이터 엔지니어링 작업 수행, 머신 러닝 모델 학습 및 배포, 엔터프라이즈 데이터 카탈로그 및 거버넌스 관리, 데이터 소스 간의 원활한 통합 보장 등이 있습니다.

* AI Data Platform Medalion 아키텍쳐

![AIDP](/assets/img/dataplatform/2026/blog/02.oci_aidp_medalion_02.png " ")


#### 주요 특징

1. End-to-End 데이터 + AI 통합

    * 데이터 수집 → 저장 → 처리 → 분석 → AI 모델 적용까지 단일 플랫폼에서 처리가 가틍한 통합 플랫폼입니다.
    * 별도 서비스 간 이동 없이 데이터 파이프라인 간소화할 수 있습니다.
    * 데이터와 AI 워크로드를 분리하지 않고 통합 운영이 가능합니다. 이를 통해 운영 복잡도를 감소하고 개발 속도를 향상 시킬 수 있습니다.

2. Lakehouse 기반 구조

    * 데이터 레이크 (OCI Object Storage) + 데이터 웨어하우스 (Autonomous AI DataLake, DataWarehouse) 를 결합한 구조입니다.
    * 정형/비정형 데이터 모두 처리가 가능합니다.
    * 단일 저장소에서 분석 및 OCI GenAI 모델을 이용하여 AI 수행이 가능합니다.

3. Gen AI 및 AI 워크로드 최적화

    * LLM 기반 GenAI 워크로드 지원 - GenAI 를 기반으로 실시간 데이터를 보강하실 수 있습니다. 
    * RAG (Retrieval-Augmented Generation) 구현 지원 - Autonomous AI Database 의 Vector Data 를 이용하여 RAG 를 구축하실 수 있고, RAG Tool 로써 Agent 가 사용할 수 있도록 지원합니다.
    * GPU 기반 고성능 AI 인프라 지원 - AIDP 의 데이터 파이프라인 및 AI Agent 가 구동할 수 있는 환경으로 고성능 GPU 자원을 지원합니다.

4. 실시간 데이터 처리 및 분석

    *	스트리밍 데이터 처리를 지원합니다. 온라인 트랜잭션 데이터베이스, Kafka 등과 연결이 가능합니다.
    *	실시간 분석 및 의사결정 지원 - 트랜잭션 데이터 및 Kafka 등의 스트리밍 데이터 또는 GoldenGate 등과 연계를 통해 실시간 분석 및 의사결정을 지원합니다.
    * 이벤트 기반 데이터 파이프라인 구성이 가능합니다.

5. 완전 관리형 서비스 (Fully Managed)

    * OCI 에서 제공하는 완전 관리형 서비스로 인프라 관리가 불필요합니다.
    * 워크로드 양에 따라 자체적으로 자동 스케일링 (Auto Scaling) 을 지원합니다.
    * 패치 및 운영을 자동화하실 수 있습니다. 

### AIDP 샘플 Notebook 사용해 보기

### OCI Console 로 AIDP 메뉴 클릭

* https://cloud.oracle.com 에 접속합니다.
* Analytic & AI 메뉴에서 "AI 데이터 플랫폼 워크벤치"를 클릭합니다.

![AIDP](/assets/img/dataplatform/2026/blog/03.oci_aidp_console.png " ")

* AI Data Platform Workbenches 메뉴 목록에서 생성한 워크벤치를 선택합니다.

![AIDP](/assets/img/dataplatform/2026/blog/04.oci_aidp_workbench.png " ")

### Spark Cluster 확인

* 기존 Workspace 나 신규 Workspace 의 Compute 메뉴에서 생성되어 있는 Default Spark Cluster 를 확인합니다.
* Spark Cluster 는 Workspace 를 생성해서 노트북을 실행시키기 위해 원하는 사양의 컴퓨트를 선택하여 Spark Cluster 를 생성할 수 있습니다.

![AIDP](/assets/img/dataplatform/2026/blog/05.oci_aidp_spark_cluster.png " ")

### Working Folder 준비

* Workspace 이름을 클릭하고 Shared Folder 를 오픈합니다.
* Sameple Notebook, Script, SQL 파일 및 기타 필요한 파일을 넣기 위한 신규 폴더를 생성합니다.

![AIDP](/assets/img/dataplatform/2026/blog/06.oci_aidp_workspace_new_folder.png " ")

### 필수 파이썬 라이브러리 추가

* 해당 폴더에 requirements.txt 파일을 생성합니다.
* requirements.txt 파일 안에 다음을 추가합니다.

```text
requests
```

* requirements.txt 파일 생성 화면

![AIDP](/assets/img/dataplatform/2026/blog/07.oci_aidp_workspace_new_file.png " ")

### 사용자용 Spark Cluster 생성

* 기본 Spark Cluster 를 남겨두고 나만의 라이브러리를 설치해서 사용할 수 있는 Spark Cluster 를 아래의 화면과 같이 생성합니다.
* 워크스페이스 메뉴 하단의 "Compute" 를 선택 후 "Create" 버튼을 클릭하여 새로이 Spark Cluster 를 생성합니다.

![AIDP](/assets/img/dataplatform/2026/blog/08.oci_aidp_create_cluster_01.png " ")

<br>

![AIDP](/assets/img/dataplatform/2026/blog/09.oci_aidp_create_cluster_02.png " ")

### 라이브러리 업로드 및 설치

* 컴퓨팅 섹션에서 새로이 생성한 Spark Cluster 를 찾아 클릭하여 상세 정보를 조회합니다.

![AIDP](/assets/img/dataplatform/2026/blog/10.oci_aidp_cluster_detail_01.png " ")

* Cluster Detail 화면에서 Library 섹션을 클릭합니다.

![AIDP](/assets/img/dataplatform/2026/blog/11.oci_aidp_cluster_detail_02.png " ")

* "+" 버튼을 클릭하고 공유 디렉터리로 이동한 다음 생성한 requirements.txt 파일을 선택합니다.

![AIDP](/assets/img/dataplatform/2026/blog/12.oci_aidp_library_install_01.png " ")

![AIDP](/assets/img/dataplatform/2026/blog/13.oci_aidp_library_install_02.png " ")

* 이 파일을 사용자 지정 라이브러리로 설치합니다. 그러면 requests 파이썬 패키지가 추가됩니다.

![AIDP](/assets/img/dataplatform/2026/blog/15.oci_aidp_library_install_04.png " ")

### Import Samples Notebook 생성 및 실행

* 워크스페이스의 sample_1 폴더로 돌아가 "import_samples.ipynb" 라는 이름으로 노트북을 생성합니다.
* GitHub에서 샘플 노트북을 다운로드하고 워크스페이스로 가져오는 Python 코드를 작성합니다. 다음 코드를 복사하여 작성합니다.

```text
import os
import zipfile
import requests

def download_unzip_save(zip_url, zip_path="", zip_content_extract_path=""):
    r = requests.get(zip_url)
    with open(zip_path, 'wb') as f:
      f.write(r.content)
    with zipfile.ZipFile(zip_path, 'r') as zip_ref:
      zip_ref.extractall(zip_content_extract_path)
    return zip_path

download_unzip_save("https://github.com/oracle-samples/oracle-aidp-samples/archive/refs/heads/main.zip", "/Workspace/Shared/sample_1/aidp_quickstart.zip", "/Workspace/Shared/sample_1/")
```

![AIDP](/assets/img/dataplatform/2026/blog/16.oci_aidp_notebook_sample_01.png " ")

* 작성한 노트북을 저장하고, 앞서 생성한 Spark Cluster 를 이 노트북에 연결합니다.
* 연결이 완료되면 노트북을 실행합니다.

![AIDP](/assets/img/dataplatform/2026/blog/17.oci_aidp_notebook_cluster_attach_01.png " ")

* 코드의 기능은 다음과 같습니다.
    - GitHub에서 샘플 zip 파일을 다운로드합니다.
    - 파일을 작업 폴더에 저장하고 압축을 해제합니다.
    - 이 단계에서 압축 파일과 압축 해제된 폴더에 여러 샘플 노트북이 포함된 것을 확인할 수 있습니다.

### Object Storage Sample 실행

* 추출한 샘플들을 Open 합니다.
* 먼저 Object Storage 를 사용하는 예제부터 시작합니다. 이 노트북은 Oracle Object Storage 에서 데이터를 읽고 씁니다.
* Object Storage 를 사용하기 위한 Parameter 를 소스코드에서 수정하세요. 버킷 이름을 사용하고 상황에 맞게 조정하시면 됩니다.
* 코드를 실행합니다. 샘플 데이터를 작성하고, 객체 스토리지에 저장한 다음 다시 읽어옵니다.

![AIDP](/assets/img/dataplatform/2026/blog/19.oci_aidp_object_storage_sample.png " ")

* 출력 결과를 확인합니다.
* 해당 버킷과 폴더에서 데이터 파일과 CSV 파일들을 찾아 봅니다.
* 샘플 폴더에는 다양한 샘플들이 있으며, 이러한 샘플들을 활용하여 Oracle AIDP 의 다양한 기능 동작 방식들을 알 수 있습니다.

### 마무리
이제 데이터와 AI 가 분리된 시대는 끝났습니다. 데이터에서 AI, AI 에서 비즈니스 가치 창출까지 이어지는 완전한 AI 데이터 파이프라인이 필요합니다.
OCI AIDP는 데이터와 AI를 하나의 플랫폼에서 통합 운영하여, 기업이 빠르게 AI 기반 서비스를 구축할 수 있도록 지원하는 클라우드 데이터 플랫폼입니다.

---

