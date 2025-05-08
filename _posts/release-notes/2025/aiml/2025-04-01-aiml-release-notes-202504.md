---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "4월 OCI AI/ML 업데이트 소식"
teaser: "2025년 4월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Apr-2025
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

---

# Data Science

## Data Science AI Quick Actions Model Reference

- **Services:** Data Science
- **Release Date:** April 11, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-models.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-models.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

#### Native Support for Model By Reference

**데이터 사이언스**는 이제 **자신의 Object Storage 버킷**에 모델 아티팩트를 등록할 수 있는 옵션을 제공합니다. 이 릴리스에서는 **네이티브 API**를 통해 이 기능을 사용할 수 있습니다.

**주요 이점:**

- **유지 관리성** 향상
- 대형 모델의 경우 모델 복사 과정에서 발생하는 **추가 비용 절감**
- **규정 준수 요구사항** 충족
- **각 테넌시의 OSS 버킷**에 있는 모델 등록 가능

#### Model Metadata Storage Enhancement

**AI 퀵 액션 메타데이터**는 이제 **모델 카탈로그**에 저장됩니다. 또한 **사용자 정의 키워드**를 기반으로 한 메타데이터 검색 지원이 추가되었습니다.

**주요 기능:**

- 모델 생성 시 **사용자 정의 키워드** 정의 가능
- 키워드 기반 모델 검색 지원
- 메타데이터 관리 효율성 향상

#### Service Models Accessibility

**서비스 관리 모델 컴파트먼트**에 있는 **서비스 관리 모델**에 **네이티브 API**를 통해 **추가 권한 없이** 접근할 수 있습니다.

**주요 특징:**

- **Fine-tuning, 특징 추출, 벤치마킹, 신속한 프로토타이핑** 등 다양한 작업에 적응 가능
- **기반 모델** 역할 수행
- **services-managed-models**에 부여된 **oss-read 권한** 제한
- **최소 권한 액세스** 적용으로 보안 강화
- 모델 저장소 데이터의 불필요한 노출 제한
- **규정 준수 및 액세스 제어** 모범 사례 준수

**관련 문서:**

- [콘솔에서 모델 생성 및 저장하기](https://docs.oracle.com/iaas/Content/data-science/using/manage-models.htm#create-model){:target="\_blank" rel="noopener"}
- [모델 편집하기](https://docs.oracle.com/iaas/Content/data-science/using/manage-models.htm#edit-model){:target="\_blank" rel="noopener"}

---

# Generative AI Agents

## OCI Generative AI Agents Available in Brazil East (Sao Paulo) Region

- **Services:** Generative AI Agents
- **Release Date:** April 09, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-region-saopaulo.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-region-saopaulo.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

이제 **OCI Generative AI Agents**는 **브라질 동부(상파울루) 리전**에서 사용할 수 있습니다.

**관련 문서:**

- [Generative AI Agents가 지원하는 리전](https://docs.oracle.com/iaas/Content/generative-ai-agents/regions.htm){:target="\_blank" rel="noopener"}
- [Generative AI Agents 문서](https://docs.oracle.com/iaas/Content/generative-ai-agents/home.htm){:target="\_blank" rel="noopener"}
