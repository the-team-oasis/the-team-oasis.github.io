---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "8월 OCI AI/ML 업데이트 소식"
teaser: "2025년 8월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Aug-2025
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

## Google Vertex AI Platform for OCI Generative AI – Beta

- **Services:** Generative AI
- **Release Date:** August 29, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/gemini-2-5-beta.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/gemini-2-5-beta.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 Google Vertex AI 플랫폼이 **베타**로 제공됩니다. **Gemini 2.5 Pro / Flash / Flash-Lite** 모델에 접근할 수 있으며, 복잡한 추론을 지원하는 최신 멀티모달 모델군입니다. 이용을 위해 [Oracle Beta Programs](https://beta.oracle.com/ords/f?p=102:100) 등록이 필요합니다. 각 모델 관련 정보는 [문서](https://docs.oracle.com/iaas/Content/generative-ai/google-models.htm) 참고.

Gemini 2.5 시리즈 특성:

- 응답 전 사전 사고(Reasoning)를 통해 복잡한 추론 과제 처리
- 향상된 베이스 모델 + 개선된 포스트 트레이닝 결합으로 성능 강화

## LangChain OCI 패키지 정식 배포

- **Services:** Generative AI
- **Release Date:** August 28, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/langchain-oci.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/langchain-oci.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

OCI 전용 패키지 `langchain-oci`가 출시되었습니다. 기존 `langchain-community`의 OCI 통합은 더 이상 권장되지 않으며, 향후 개발/버그 수정/기능 개선은 전용 저장소에서 진행됩니다.

```bash
pip install -U langchain-oci
```

자세한 연동: [Generative AI × LangChain](https://docs.oracle.com/iaas/Content/generative-ai/langchain.htm)

이점 요약:

- 최신 기능/개선사항 우선 제공
- 보안 업데이트 및 버그 수정 지속 제공
- 전용 문서/지원 채널 제공
- 성능 최적화 및 유지보수성 향상

## OCI Generative AI is available in the Saudi Arabia Central (Riyadh) region

- **Services:** Generative AI
- **Release Date:** August 18, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/new-region-riyadh.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/new-region-riyadh.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI가 **audi Arabia Central(Riyadh)** 리전에서 제공됩니다. 전체 리전 목록은 [Regions with Generative AI](https://docs.oracle.com/iaas/Content/generative-ai/overview.htm#regions) 참고.

## OCI Generative AI is available in the US East (Ashburn) region

- **Services:** Generative AI
- **Release Date:** August 07, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/new-region-ashburn.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/new-region-ashburn.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI가 **US East(Ashburn)** 리전에서 제공됩니다.

---

# Generative AI Agents

## OCI Generative AI Agents is now available in US West (Phoenix)

- **Services:** Generative AI Agents
- **Release Date:** August 28, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-region-phoenix.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-region-phoenix.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

Generative AI Agents가 **US West (Phoenix)** 리전에서 제공됩니다. 전체 리전 목록은 [Regions](https://docs.oracle.com/iaas/Content/generative-ai-agents/overview.htm#regions) 참고.

---

# Speech

## Speech has added new features for Whisper models

- **Services:** Speech
- **Release Date:** August 05, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/speech/aug-25-whisper-prompt.htm](https://docs.oracle.com/en-us/iaas/releasenotes/speech/aug-25-whisper-prompt.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

- 프롬프트 입력(Transcribe Job Prompting): 전사 작업 시 사용자 프롬프트를 전달해 맥락/용어 반영 및 결과 품질을 조정할 수 있습니다. 설정 방법은 전사 작업 생성 가이드를 참고하세요.
- **Auto** 언어 코드: 입력 음성의 언어를 자동 감지하여 설정 부담을 줄입니다.
  ![](/assets/img/aiml/2025/release/202508-speech-auto-detect-language.png " ")
  ![](/assets/img/aiml/2025/release/202508-speech-whisper-prompt.png " ")

## Speech has added new languages for Live Transcribe

- **Services:** Speech
- **Release Date:** August 27, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/speech/aug-25-whisper-new-languages.htm](https://docs.oracle.com/en-us/iaas/releasenotes/speech/aug-25-whisper-new-languages.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

WHISPER 기반 실시간 전사 기능에서 새롭게 90+개 언어를 지원합니다. 예) `auto`(자동 감지), `ar`, `en`, `es`, `de`, `fr`, `it`, `pt`, `ja`, `sv`, `nl` 등.

- 사용 시 `modelType`을 WHISPER로 지정해야 합니다(기본은 ORACLE).
- WHISPER 사용 시 포함하면 안 되는 ORACLE 전용 파라미터:
  - `partialSilenceThresholdInMs`, `finalSilenceThresholdInMs`, `stabilizePartialResults`, `shouldIgnoreInvalidCustomizations`, `customizations`
- 부분 결과(Partial results)는 ORACLE 모델에서만 지원됩니다.

![](/assets/img/aiml/2025/release/202508-speech-realtime-transcribe.png " ")

---

# Vision

## Vision Service now Supports Stream Video Analysis

- **Services:** Vision
- **Release Date:** August 18, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/vision/streaming-video.htm](https://docs.oracle.com/en-us/iaas/releasenotes/vision/streaming-video.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

GPU 가속 실시간 비디오 분석 서비스로, RTSP 라이브 스트림에서 객체 감지/얼굴 감지/추적(단일/멀티카메라) 기능을 제공합니다.
현재는 API를 통해서만 기능을 제공하고 있으며, 아직까지 OCI 콘솔에서 해당 기능을 확인할 수 없습니다.
자세한 사용법은 [문서](https://docs.oracle.com/iaas/Content/vision/using/video-stream-processing-top.htm){:target="\_blank" rel="noopener"} 참고.

추적 기능 상세:

- 단일 카메라 추적: 단일 스트림 내에서 사람 얼굴을 지속적으로 식별/추적
- 멀티카메라 추적: 논리적으로 그룹화된 여러 카메라 간 동일 인물 일관 식별(Tracking ID 유지)

주요 기능 요약:

- 객체 감지(Object Detection): 사람/차량 등 다양한 객체를 바운딩 박스로 식별
- 얼굴 감지(Face Detection): 얼굴을 감지하고 바운딩 박스/메타데이터 제공
- 객체 추적(Object Tracking, 현재 얼굴 한정): 프레임 간 추적 ID로 동일 인물 연속 식별(단일/멀티카메라)

사용 방법 요약:

1. 카메라 연결 방식 선택

- 퍼블릭 인터넷: 고정 공인 IP + 포트 포워딩(기본 RTSP 554) 구성 후 접근
- 전용망: Site‑to‑Site VPN 또는 Private Endpoint로 VCN 내부에서 안전하게 접근

2. API 워크플로우(요지)

- Private Endpoint 생성: 서브넷 OCID로 Vision Private Endpoint 생성
- Stream Source 생성: RTSP URL과 네트워크 액세스 타입(PUBLIC/PRIVATE) 지정
- Stream Job 생성: 기능(featureType) 선택(예: OBJECT_TRACKING), 결과 저장(Object Storage 버킷)
- 작업 시작/중지: Start/Stop API로 스트림 처리 제어

3. 결과/출력(예시)

- 라벨 감지: 라벨/신뢰도/타임스탬프
- 객체 감지: 라벨/바운딩 박스/신뢰도
- 텍스트 감지: 전사 결과/바운딩 박스
- 얼굴 감지: 바운딩 박스/얼굴 메타데이터
- 객체 추적: ObjectID 및 시간에 따른 추적 바운딩 박스

권장 설정(성능): 30 FPS, 해상도 720p 이하, 일정한 조명, 15–20m 피사체 거리

참고: 세부 절차/샘플 요청은 공식 문서의 API Reference를 확인하세요. [Stream Video Analysis 가이드](https://docs.oracle.com/en-us/iaas/Content/vision/using/video-stream-processing-top.htm)

---

# Document Understanding

## Document Understanding now supports Label Studio for data labeling

- **Services:** Document Understanding
- **Release Date:** August 01, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/document-understanding/label-studio.htm](https://docs.oracle.com/en-us/iaas/releasenotes/document-understanding/label-studio.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

[Label Studio](https://labelstud.io/)를 통한 데이터 라벨링을 지원합니다. 자세한 내용은 [Label Studio 섹션](https://docs.oracle.com/iaas/Content/document-understanding/using/label-studio-top.htm) 참고.

Label Studio란?

- 오픈소스 다중 타입 데이터 라벨링/어노테이션 툴로 표준화된 출력 포맷 제공
- 멀티 유저, 다중 프로젝트, 템플릿 기반 라벨링 UI, 다양한 데이터 타입(이미지/오디오/텍스트/HTML/시계열/비디오) 지원
- 파일/클라우드(예: S3, GCS)에서 데이터 가져오기, 모델 예측 연동을 통한 프리라벨링/온라인 러닝/액티브 러닝 지원, REST API로 파이프라인 통합 용이
- 설치 방식: Docker, pip/conda, Docker Compose(+MinIO) 등 다양한 배포 옵션 제공
- 참고: [GitHub 레포지토리](https://github.com/HumanSignal/label-studio)

OCI Document Understanding 연동 개요

- 사전 준비: Label Studio 인스턴스 구동(Docker 또는 pip 등), 프로젝트 생성, 작업자 계정 권한 설정
- 템플릿 선택: 문서 분류/키-값 추출/엔티티 태깅 등 사용 사례에 맞는 라벨링 템플릿 구성
- 스토리지 연동: 라벨링 대상 문서와 결과물을 저장할 OCI Object Storage 버킷을 준비하고, Label Studio에서 데이터 소스/타겟을 구성
- 라벨링 진행: 프로젝트에 문서 업로드(또는 버킷 연동) 후 어노테이션 수행, 필요 시 모델 예측 연동으로 프리라벨링 활용
- 내보내기/적용: 지원 형식으로 어노테이션 결과를 내보내어 버킷에 저장하고, OCI Document Understanding에서 해당 버킷을 참조해 데이터셋/학습에 활용
- 자세한 절차와 요구 사항은 문서 참고: [OCI Document Understanding × Label Studio](https://docs.oracle.com/iaas/Content/document-understanding/using/label-studio-top.htm)

## Document Understanding Version 2.0 is now Available

- **Services:** Document Understanding
- **Release Date:** August 19, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/document-understanding/version-2.htm](https://docs.oracle.com/en-us/iaas/releasenotes/document-understanding/version-2.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

영어 외 다국어 지원을 포함한 **Document Understanding 2.0**이 제공됩니다. 지원 언어는 [Supported Languages](https://docs.oracle.com/en-us/iaas/Content/document-understanding/using/getting_started.htm#supported-languages) 참고.

지원 언어(버전별) 요약

| 모델                                | 변수           | V1 언어 | V2 언어                                    |
| ----------------------------------- | -------------- | ------- | ------------------------------------------ |
| Optical Character Recognition (OCR) | NOT APPLICABLE | EN      | AR, ZH, FR, DE, HE, JA, PT, RU, ES, NL, UK |
| Document Classification             | NOT APPLICABLE | EN      | NOT APPLICABLE                             |
| Custom Document Classification      | NOT APPLICABLE | EN      | NOT APPLICABLE                             |
| Table Extraction                    | NOT APPLICABLE | EN      | NOT APPLICABLE                             |
| Key Value Extraction                | Invoice        | EN      | AR, ZH, FR, DE, HE, JA, PT, RU, ES, NL, UK |
| Key Value Extraction                | Receipt        | EN      | AR, ZH, FR, DE, HE, JA, PT, RU, ES, NL, UK |
| Key Value Extraction                | Driver ID      | EN      | NOT APPLICABLE                             |
| Key Value Extraction                | Passport       | EN      | NOT APPLICABLE                             |
| Key Value Extraction                | Health ID      | EN      | NOT APPLICABLE                             |
| Custom Key Value Extraction         | NOT APPLICABLE | EN      | ES, PG                                     |

참고: V1은 영어(EN) 중심, V2는 멀티링구얼(일부 모델 제외) 지원.

---

# Data Science

## Data Science now Supports Distributed Jobs

- **Services:** Data Science
- **Release Date:** August 15, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/distributed-jobs.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/distributed-jobs.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

분산 잡(Distributed Jobs)을 통해 여러 노드 그룹을 병렬/순차로 구성하여 대규모 학습/데이터 워크로드를 실행할 수 있습니다. 인프라 오케스트레이션은 서비스가 담당하며, 사용자는 작업 구조와 그룹 간 상호작용만 정의합니다.

- 노드 그룹: 역할(예: 매니저/워커) 단위로 독립 설정, 병렬 또는 순차 프로비저닝 선택 가능
- 통신/오케스트레이션: 프레임워크 요구에 맞게 그룹 간 통신 방식을 지정
- BYO: 코드/아티팩트/컨테이너를 그대로 가져와 실행 가능
- 장점: 온디맨드 확장성과 비용 효율, 신뢰성 높은 실행 환경

![](/assets/img/aiml/2025/release/202508-ds-distributed-jobs-1.png " ")
![](/assets/img/aiml/2025/release/202508-ds-distributed-jobs-2.png " ")
![](/assets/img/aiml/2025/release/202508-ds-distributed-jobs-3.png " ")

자세한 사용법: [Distributed Jobs](https://docs.oracle.com/iaas/Content/data-science/using/jobs-distributed-jobs.htm)

## Data Science AI Quick Actions now Supports Multimodel Serving

- **Services:** Data Science
- **Release Date:** August 06, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/multi-model-serving.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/multi-model-serving.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

AI Quick Actions에서 멀티모델 서빙과 모델 그룹을 지원합니다.

- 멀티모델 서빙: 단일 인스턴스에서 여러 LLM을 호스팅하고, 요청을 런타임에 적절한 모델로 라우팅(LiteLLM)
- 모델 그룹: 하나의 논리 그룹으로 모델을 묶어 엔드포인트/운영을 단순화
- 효과: 재배포 없이 모델 선택/전환, 운영 단순화 및 비용 절감

문서: [Model Group](https://docs.oracle.com/iaas/Content/data-science/using/models-mms-top.htm)
