---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "9월 OCI AI/ML 업데이트 소식"
teaser: "2025년 9월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Sep-2025
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

# Generative AI

## Use Private Endpoints in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** September 30, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/generative-ai-private-endpoint.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/generative-ai-private-endpoint.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

전용 AI 클러스터에 호스팅된 모델에 대해 **VCN 내부의 프라이빗 엔드포인트**로 접속할 수 있습니다. 서비스가 프라이빗 서브넷에 VNIC를 생성하며, 서브넷/보안 규칙은 고객이 제어합니다. 전용 클러스터의 엔드포인트를 Generative AI **프라이빗 엔드포인트**에 연결해 사용합니다.

구성 요약:

- VCN 내 프라이빗 서브넷에 엔드포인트(VNIC) 생성
- 보안 목록/NSG 규칙으로 접근 제어
- 전용 AI 클러스터 엔드포인트를 프라이빗 엔드포인트에 연결

개념/설정은 [Private Endpoints](https://docs.oracle.com/iaas/Content/generative-ai/private-endpoint.htm) 참고.

## The xAI platform for OCI Generative AI now supports Grok Code Fast 1 in Beta

- **Services:** Generative AI
- **Release Date:** September 12, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/grok-code-fast-1-beta.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/grok-code-fast-1-beta.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

고빈도 코딩 작업(디버깅/편집 등)에 최적화된 **Grok Code Fast 1** 모델이 **베타**로 제공됩니다. [Oracle Beta Programs](https://beta.oracle.com/ords/f?p=102:100) 등록 후 플레이그라운드에서 `xai.grok-code-fast-1` 모델을 사용할 수 있습니다.

핵심 특징:

- 에이전틱 코딩 워크플로우 지향
- 일반적/반복적 코딩 작업 최적화
- 지원 리전/세부 사양은 [문서](https://docs.oracle.com/iaas/Content/generative-ai/xai-grok-code-fast-1.htm) 참고

## Access to OpenAI gpt-oss models in OCI Generative AI is now in (Beta)

- **Services:** Generative AI
- **Release Date:** September 09, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/openai-gpt-oss-beta.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/openai-gpt-oss-beta.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

추론/에이전틱 태스크에 설계된 **OpenAI gpt-oss** 사전 학습 모델 접근을 지원합니다.

모델 버전:

- `openai.gpt-oss-120b`: 고난도/고자원 시나리오용
- `openai.gpt-oss-20b`: 저지연/로컬 지향 사용 사례용

베타 접근은 [Oracle Beta Programs](https://beta.oracle.com/ords/f?p=102:100) 참고. 기능/지원 사항은 [문서](https://docs.oracle.com/iaas/Content/generative-ai/openai-models.htm)에서 확인.
