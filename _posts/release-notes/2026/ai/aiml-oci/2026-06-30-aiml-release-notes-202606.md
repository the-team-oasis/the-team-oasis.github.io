---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "6월 OCI AI/ML 업데이트 소식"
teaser: "2026년 6월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aiml

tags:
  - oci-release-notes-2026
  - Jun-2026
  - AI/ML
  - Gen AI

#
# Styling
#
header: no
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## Use Private Endpoints for Imported Models in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/private-endpoint-imported-models.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/private-endpoint-imported-models.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 imported model에 private endpoint를 생성할 수 있게 되었습니다. Private Endpoint는 공용 인터넷 대신 VCN 내부 경로로 서비스에 접근하도록 해주는 네트워크 구성입니다.

AI 모델 추론 트래픽을 내부 네트워크 경로로 제한할 수 있어 보안 요구사항이 높은 엔터프라이즈 환경에 중요합니다. 모델 제공 경로, VCN 설계, 접근 정책을 함께 검토해야 합니다.

## Import New Compatible Models in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/compatible-imported-models-june-30-2026.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/compatible-imported-models-june-30-2026.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 새 compatible model을 import할 수 있게 되었습니다. Imported model은 외부 또는 오픈 모델을 OCI Generative AI 환경으로 가져와 관리형 추론 환경에서 활용하는 방식입니다.

모델 선택지가 늘어나면 업무별 정확도, 비용, 지연시간 요구사항에 맞춰 모델을 비교할 수 있습니다. 단, 라이선스와 모델 사용 조건은 배포 전 반드시 확인해야 합니다.

## Schedule Randomization for Data Science Scheduler
* **Services:** Data Science
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/data-science/june2026-schedule-randomization.htm](https://docs.oracle.com/iaas/releasenotes/data-science/june2026-schedule-randomization.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Science Scheduler에서 interval 기반 스케줄의 시작 시간을 무작위 창 안에서 분산할 수 있게 되었습니다. Scheduler는 노트북 작업, 파이프라인, 모델 관련 작업을 정해진 시간에 실행하는 데 사용됩니다.

무작위 시작 창은 많은 작업이 동시에 시작되어 리소스가 몰리는 문제를 줄입니다. 대규모 ML 배치 작업이나 정기 모델 재학습 환경에서 안정적인 리소스 사용에 도움이 됩니다.

## Oracle Data Science Agent
* **Services:** Autonomous Database Serverless
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-data-science-agent.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-06-data-science-agent.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Data Science Agent는 이번 기준에서 `ai-database`가 아니라 `aiml-oci`로 분류합니다. ADB Serverless의 Select AI 직접 연계 기능이 아니라 Data Science/Agent 성격의 OCI AI/ML 기능으로 보기 때문입니다.

AI Agent는 사용자의 목표를 이해하고 도구나 모델을 조합해 작업을 수행하는 소프트웨어 구성입니다. ADB 내부 Select AI Agent가 아닌 일반 Agent/Assistant는 모두 `aiml-oci`에 배치합니다.

## Import DeepSeek V4 Flash and DeepSeek V4 Pro in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

DeepSeek V4 Flash와 DeepSeek V4 Pro 모델을 OCI Generative AI로 import할 수 있게 되었습니다. DeepSeek 계열 모델은 코드, 추론, 일반 언어 작업 등 다양한 생성형 AI 활용 사례에서 검토되는 모델군입니다.

모델 import 지원은 고객이 OCI 안에서 보안·네트워크·운영 정책을 유지하면서 다양한 모델을 평가할 수 있게 해줍니다.

## Import Qwen 3 Next 80B A3B Instruct in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-next.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-next.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Qwen3 Next 80B A3B Instruct 모델을 OCI Generative AI로 import할 수 있습니다. Instruct 모델은 사용자의 지시를 따르는 방식으로 튜닝된 모델입니다.

대규모 언어 모델 선택지가 늘어나면 한국어, 영어, 코드, 추론 등 업무별 벤치마크를 통해 적합한 모델을 고를 수 있습니다. 운영 전에는 모델 크기와 추론 비용, 지연시간을 함께 확인해야 합니다.

## Import Google MedGemma 27B Text IT in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/google-med-gemma-27b-it.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/google-med-gemma-27b-it.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Google MedGemma 27B Text IT 모델을 OCI Generative AI로 import할 수 있습니다. MedGemma는 의료·생명과학 텍스트 작업을 염두에 둔 모델군입니다.

도메인 특화 모델은 일반 모델보다 특정 업무에서 더 나은 답변 품질을 보일 수 있지만, 의료 데이터 활용 시 개인정보, 규제, 검증 절차가 중요합니다. 실제 업무 적용 전에는 반드시 전문가 검토와 평가 체계를 마련해야 합니다.

## Import OpenAI Whisper Large V3 Turbo in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/openai-whisper-large-v3-turbo.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/openai-whisper-large-v3-turbo.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OpenAI Whisper Large V3 Turbo 모델을 OCI Generative AI로 import할 수 있습니다. Whisper는 음성 인식과 전사 작업에 널리 사용되는 모델군입니다.

콜센터 녹취, 회의록, 음성 데이터 분석을 OCI 환경 안에서 처리하려는 경우 선택지가 늘어납니다. 음성 데이터는 개인정보가 포함될 수 있으므로 저장 위치, 접근 권한, 보존 정책을 함께 검토해야 합니다.

## Import NVIDIA Nemotron 3 Ultra in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 05, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-ultra-nvfp4.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-ultra-nvfp4.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

NVIDIA Nemotron 3 Ultra 모델을 OCI Generative AI로 import할 수 있습니다. Nemotron 계열은 NVIDIA의 생성형 AI 모델군으로, GPU 최적화와 엔터프라이즈 AI 활용 사례에서 검토됩니다.

모델 import 지원은 고객이 자체 보안 경계 안에서 모델 성능을 비교하고 운영할 수 있게 해줍니다. GPU 자원, 모델 크기, 추론 비용을 함께 평가해야 합니다.

## OpenAI gpt-oss Models Available on B200 Dedicated AI Clusters in Abu Dhabi
* **Services:** Generative AI
* **Release Date:** June 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/gpt-oss-abudhabi.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/gpt-oss-abudhabi.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OpenAI gpt-oss 모델을 Abu Dhabi 리전의 B200 Dedicated AI Cluster에서 사용할 수 있게 되었습니다. Dedicated AI Cluster는 특정 고객 워크로드를 위해 전용 AI 인프라를 제공하는 구성입니다.

리전별 모델 제공은 데이터 주권, 지연시간, 규제 요구사항에 영향을 줍니다. 중동 지역에서 생성형 AI 서비스를 운영하는 고객은 전용 클러스터 기반 모델 호스팅 선택지를 검토할 수 있습니다.
