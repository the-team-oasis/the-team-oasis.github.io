---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "1월 OCI AI/ML 업데이트 소식"
teaser: "2024년 1월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-aiml
tags:
  - oci-release-notes-2024
  - Jan-2024
  - AI/ML
  - Gen AI
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

## Data Science: Bring Your Own Containers with Improved Functionality
* **Services:** Data Science
* **Release Date:** Feb 21, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/0f818ffa-d328-4764-a498-ace0d3856bd4/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/0f818ffa-d328-4764-a498-ace0d3856bd4/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 OCI Data Science 서비스에서 Bring Your Own Containers (BYOC) 기능이 개선되었습니다.

- 새로운 ML Jobs API와 콘솔을 통해 이제 컨테이너를 더 효율적으로 관리할 수 있습니다.
- 컨테이너에 작업 아티팩트를 업로드하고 사용하여 워크플로우를 보다 간편하게 관리할 수 있습니다.
- 새로운 서명 검증 기능을 통해 컨테이너 이미지의 신뢰성을 보장하세요.
- SHA256 다이제스트를 통한 불변 컨테이너 이미지 실행 지원은 신뢰성과 보안을 향상시킵니다.

## New Data Science Conda Environments are Introduced
* **Services:** Data Science
* **Release Date:** Feb 23, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/d3d4f471-52e6-454a-b15a-198d3129597e/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/d3d4f471-52e6-454a-b15a-198d3129597e/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 OCI Data Science 서비스에서 새로운 OCI Operator 관련 Conda 환경이 추가되었습니다.
- [AI Anomaly Detection Operator for CPU on Python 3.8 (version 1.0)](https://docs.oracle.com/iaas/data-science/using/conda-operators.htm)
- [AI Forecasting Operator for CPU on Python 3.8 (version 2.0)](https://docs.oracle.com/iaas/data-science/using/conda-operators.htm)

#### Operator 란?
연산자는 다양한 데이터 과학적 요구를 해결하기 위해 설계된 미리 패키지된 솔루션 스위트입니다. 사용자 친화적이고 로우 코드 인터페이스를 제공하여 다양한 전문 지식 수준의 사용자가 데이터 과학 작업에 접근할 수 있도록 합니다. 도메인 전문가는 연산자를 활용하여 도메인 특정 지식을 캡슐화하고 확장할 수 있습니다. 데이터 과학자와 AI 엔지니어는 데이터 및 모델링 매개변수를 사용자 정의하고 연산자가 ETL, 데이터 클리닝, OCI AI 플랫폼 통합, 보고서 생성, 설명 가능성 등과 같은 보다 반복적인 작업을 처리하도록 할 수 있습니다.

#### 연산자의 주요 특성
- 도메인 전문 지식 필요 없음: 연산자를 사용하기 위해 도메인 전문가가 되어야 할 필요가 없습니다. 각 연산자는 모든 필요한 도메인 특정 지식을 갖추고 있어 특화된 전문 지식이 필요하지 않습니다.
- 구성 옵션: 연산자의 동작을 세부 조정하고 싶은 도메인 전문가를 위해 주요 구성 설정이 제공됩니다. 이러한 설정을 사용하여 연산자를 사용자의 특정 요구에 맞게 사용자 정의할 수 있습니다.
- 기본 설정: 연산자는 도메인 특정 정보를 캡슐화하는 기본 구성으로 제공됩니다. 이를 통해 사용자는 사용자 정의를 하지 않고도 빠르게 시작할 수 있습니다.
- 다양한 배포 옵션: 연산자는 OCI 데이터 과학 작업, OCI 데이터 플로우 애플리케이션, Kubernetes (K8s) 및 로컬과 같은 다양한 환경에서 실행될 수 있습니다. 이러한 유연성을 통해 요구 사항에 가장 적합한 환경을 선택할 수 있습니다.
- 간편한 배포를 위한 CLI 도구: 다양한 환경에서 배포 프로세스를 단순화하기 위해 사용자 친화적인 CLI(Command Line Interface) 도구를 제공합니다. 이 도구를 사용하면 연산자의 설정 및 실행을 단순화하여 어디서든 연산자의 기능을 활용할 수 있습니다.

클라우드 또는 로컬에서 작업하는 경우, 연산자는 소프트웨어 엔지니어, 데이터 과학자 및 도메인 전문가 모두에게 성능이 우수하고 사용자 정의 가능한 솔루션을 제공합니다.

자세한 내용은 [Oracle ADS Operator 문서](https://accelerated-data-science.readthedocs.io/en/latest/user_guide/operators/){:target="_blank" rel="noopener"}를 참조하세요.

## Language 2.4 now available
* **Services:** Language
* **Release Date:** Feb 28, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/a284df41-8bcf-492a-9896-902a6e055c80/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/a284df41-8bcf-492a-9896-902a6e055c80/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해서 OCI AI Language 서비스의 일부 기능이 개선, 추가 되었습니다.

- Language Detection API에서 주요 언어를 식별하는 데 고려할 텍스트 길이와 표기 변환을 무시하기 위한 플래그를 지정하는 기능이 추가되었습니다.
- GetModelType API를 통해 번역을 지원하는 언어를 확인하는 기능이 추가되었습니다.
- 언어식별 기능 지원 언어가 추가 되었습니다.
  - Croatian (hr)
  - Hungarian (hu)
  - Slovak (sk)
  - Slovenian (sl)
  - Thai (th)
  - Vietnamese (vi)