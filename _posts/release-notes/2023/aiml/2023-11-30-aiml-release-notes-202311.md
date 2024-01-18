---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "11월 OCI AI/ML 업데이트 소식"
teaser: "2023년 11월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-aiml
tags:
  - oci-release-notes-2023
  - Nov-2023
  - AI/ML
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

## Accelerated Data Science 2.9.0 is released

- **Services:** Data Science
- **Release Date:** Nov 22, 2023
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/ca37b22a-3e00-4fe1-a82b-a6edc3c9abf8/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/ca37b22a-3e00-4fe1-a82b-a6edc3c9abf8/){:target="\_blank" rel="noopener"}

### 업데이트 소개

- AI forecast Operator 도입. **다음 "연산자" 섹션에서 자세한 내용을 설명합니다.**
- 데이터에서 개인 식별 정보(PII)를 탐지하고 가리는 것을 목표로 하는 PII 연산자 도입
- Apple 실리콘 M1 및 M2 로컬 머신에서 기능을 보장하기 위해 `opctl conda create` 및 `opctl conda publish` 명령에 대한 버그 수정
- 모델 배포 반환 값이 실패한 경우에 대한 버그 수정
- 작업 및 모델 배포에 대한 로그 정렬 시 발생하는 버그 수정

### 연산자(Operator)란?

연산자는 다양한 데이터 과학 요구 사항을 해결하기 위해 설계된 사전 패키지된 솔루션 모음입니다. 사용자 친화적이고 로우 코드 인터페이스를 제공하여 전문 지식 수준이 다양한 사용자가 데이터 과학 작업에 접근할 수 있도록 합니다. 도메인 전문가가 아니더라도 연산자를 활용할 수 있는데, 이는 필요한 모든 도메인 특정 지식을 캡슐화하기 때문입니다. 그러나 이러한 연산자는 로우 코드 도구의 편리함을 중요시하고 그 동작을 미세 조정하려는 전문가들에게도 적합합니다. 이러한 사용자 정의는 다양한 연산자가 노출하는 구성 매개 변수를 통해 이루어지며, 두 세계의 장점을 모두 제공합니다.

#### 연산자(Operator)의 주요 특징

1. **도메인 전문 지식 불필요**: 연산자를 사용하기 위해 도메인 전문가일 필요는 없습니다. 각 연산자는 필요한 모든 도메인 특정 지식을 갖추고 있어 전문화된 전문 지식이 필요 없습니다.

2. **구성 옵션**: 연산자의 동작을 미세 조정하려는 도메인 전문가를 위해 주요 구성 설정이 제공됩니다. 이러한 설정을 통해 특정 요구 사항에 맞게 연산자를 사용자 정의할 수 있습니다.

3. **기본 설정**: 연산자는 도메인 특정 정보를 캡슐화하는 기본 구성과 함께 제공됩니다. 이를 통해 사용자는 사용자 정의를 하지 않고도 빠르게 시작할 수 있습니다.

4. **다중 배포**: 연산자는 OCI 데이터 과학 작업, OCI 데이터 플로우 애플리케이션, Kubernetes(K8s), 로컬 등 다양한 환경에서 실행할 수 있습니다. 이 유연성을 통해 요구 사항에 가장 적합한 환경을 선택할 수 있습니다.

5. **간편한 배포를 위한 CLI 도구**: 다양한 환경에서 배포 프로세스를 간소화하기 위해 사용자 친화적인 CLI(Command Line Interface) 도구를 제공합니다. 이 도구를 사용하면 연산자의 설정 및 실행이 간소화되어 어디에서 실행하든 그 힘을 쉽게 활용할 수 있습니다.
