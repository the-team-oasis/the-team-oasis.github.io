---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "10월 OCI AI/ML 업데이트 소식"
teaser: "2025년 10월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Oct-2025
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

## Use xAI Grok 4 Fast in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 10, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xAI-grok-4-fast.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/xAI-grok-4-fast.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

xAI의 대표 모델 Grok 4의 **속도/비용 최적화** 버전인 **Grok 4 Fast**가 **GA**로 제공됩니다. 빠른 첫 토큰 지연과 높은 출력 속도를 제공하여 **실시간 애플리케이션**에 적합합니다.

핵심 포인트:

- Grok 4 대비 더 빠른 응답 시작 및 토큰 생성 속도
- 비용 효율성 향상으로 대량/실시간 처리 워크로드에 적합

**제공 리전(온디맨드)**

- US East (Ashburn)
- US Midwest (Chicago)
- US West (Phoenix)

자세한 모델 특성과 리전은 [문서](https://docs.oracle.com/iaas/Content/generative-ai/xai-grok-4-fast.htm) 참고.

## Use Google Gemini 2.5 in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 01, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/gemini-2-5-GA.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/gemini-2-5-GA.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI의 Google Vertex AI 플랫폼이 **GA**로 제공되며, **Gemini 2.5 Pro / Flash / Flash-Lite** 모델을 지원합니다.

Gemini 2.5 특징 요약:

- 고급 멀티모달 추론(텍스트/이미지 등)
- 향상된 사고 체인 기반 문제 해결
- 모델군 별 성능/지연 특성: Pro(정확도), Flash/Flash-Lite(속도/비용)

접속 권한은 Oracle 담당자 문의. 모델 상세는 [문서](https://docs.oracle.com/iaas/Content/generative-ai/google-models.htm) 참고.

Highlights:

- 현재 플래그십 모델 지원: Gemini 2.5 Pro, Gemini 2.5 Flash, Gemini 2.5 Flash‑Lite
- GCP Vertex AI Gemini REST API 호환 지원
- OCI Generative AI 온디맨드 서빙 전용 지원(구글 Vertex AI Dynamic Quota 활용)
- 멀티모달: 텍스트/코드/이미지 입력 → 텍스트 출력만 제공
- 멀티모달(API 전용): 비디오/오디오 입력 → 텍스트 출력만 제공
- 제공 리전: US East(Ashburn) – Oracle Interconnect로 Google Cloud 연결, 미국 내 데이터 로컬라이제이션
- 제공 리전: US Midwest(Chicago), US West(Phoenix) – 퍼블릭 인터넷 통해 Google Cloud 연결, 미국 내 데이터 로컬라이제이션
- 접근 방식: OCI Generative AI 콘솔 플레이그라운드, 범용 챗 SDK, CLI
- Zero Data Retention(데이터 미보관) 시나리오 지원
- Gemini 모델에 대한 Oracle 엔터프라이즈 지원 제공

## Use Grok Code Fast 1 in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** October 01, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/grok-code-fast-1-GA.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/grok-code-fast-1-GA.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

고빈도 코딩 작업(디버깅/편집 등)과 **에이전틱 코딩 워크플로우**에 특화된 **Grok Code Fast 1**이 **GA**로 제공됩니다.

주요 특징:

- 반복적 수정/리팩토링/디버깅 작업에 최적화
- 에이전트 기반 개발 흐름을 고려한 도구 사용 설계
- 지원 리전/자세한 사양은 [문서](https://docs.oracle.com/iaas/Content/generative-ai/xai-grok-code-fast-1.htm) 참고
