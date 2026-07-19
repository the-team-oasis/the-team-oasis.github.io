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
* TOC
{:toc}
</div>

## Use Private Endpoints for Imported Models in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/private-endpoint-imported-models.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/private-endpoint-imported-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Private Endpoints in Generative AI](https://docs.oracle.com/iaas/Content/generative-ai/private-endpoint.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 imported model에 private endpoint를 생성할 수 있게 되었습니다. 이를 통해 imported model 접근 트래픽을 public internet이 아니라 private network path로 보낼 수 있습니다.

운영 영향은 보안 경계와 네트워크 통제입니다. 기업 내부 VCN에서 모델 endpoint를 호출해야 하거나, 인터넷 경유를 피해야 하는 AI inference workload라면 private endpoint 구성을 우선 검토할 수 있습니다.

### 주요 변경 포인트

* OCI Generative AI에서 imported model 또는 dedicated AI cluster 기반 선택지가 확장되었습니다.
* 모델을 직접 import해 endpoint로 배포하는 경우, 지원 region, dedicated AI cluster shape, endpoint 생성 조건을 함께 확인해야 합니다.
* 모델별 라이선스, 입력/출력 특성, latency, 비용 구조가 다를 수 있으므로 PoC 기준을 먼저 정하는 것이 좋습니다.

### 적용 및 검증 포인트

모델 import 후에는 dedicated AI cluster 상태, model lifecycle, endpoint 생성 가능 여부, inference 테스트를 순서대로 확인해야 합니다. 운영 적용 전에는 대표 prompt 또는 샘플 입력으로 품질과 응답 시간, 실패 시 retry 정책을 점검하는 것이 안전합니다.

### 네트워크 조건

Generative AI private endpoint는 VCN 안의 private IP로 OCI Generative AI model에 접근하게 해주는 리소스입니다. Dedicated AI cluster endpoint에 attach해 hosted model을 private endpoint로 접근하거나, Allow Usage In On-Demand Mode를 enable해 on-demand model 접근에도 사용할 수 있습니다.

접근 client는 private endpoint subnet에 private connectivity가 있어야 하며, 같은 VCN, peered VCN, DRG/IPSec VPN/FastConnect로 연결된 on-premises network, Bastion을 통한 private host 접근 같은 경로가 가능합니다. 운영 검증에서는 private endpoint FQDN이 private IP로 resolve되는지 반드시 확인해야 합니다.

## Import New Compatible Models in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/compatible-imported-models-june-30-2026.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/compatible-imported-models-june-30-2026.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 MiniMax, Mistral, Moonshot AI Kimi, Z.ai GLM 계열 신규 모델을 imported model로 사용할 수 있게 되었습니다. 공식 릴리스 노트는 각 model family별 compatible model list와 recommended dedicated AI cluster unit shape를 확인하라고 안내합니다.

이 항목은 모델 선택지 확장 성격이므로, 실제 운영 반영 전에는 모델 라이선스, context length, 비용, latency, 전용 AI cluster shape 요구사항을 비교해야 합니다. 업무별 benchmark를 통해 한국어/영어/코딩/추론 성능을 확인한 뒤 endpoint 배포 여부를 결정하는 것이 좋습니다.

### 주요 변경 포인트

* OCI Generative AI에서 imported model 또는 dedicated AI cluster 기반 선택지가 확장되었습니다.
* 모델을 직접 import해 endpoint로 배포하는 경우, 지원 region, dedicated AI cluster shape, endpoint 생성 조건을 함께 확인해야 합니다.
* 모델별 라이선스, 입력/출력 특성, latency, 비용 구조가 다를 수 있으므로 PoC 기준을 먼저 정하는 것이 좋습니다.

### 적용 및 검증 포인트

모델 import 후에는 dedicated AI cluster 상태, model lifecycle, endpoint 생성 가능 여부, inference 테스트를 순서대로 확인해야 합니다. 운영 적용 전에는 대표 prompt 또는 샘플 입력으로 품질과 응답 시간, 실패 시 retry 정책을 점검하는 것이 안전합니다.

### Import 조건

OCI Generative AI imported model은 Hugging Face 또는 OCI Object Storage bucket의 validated open-source/third-party model을 가져와 dedicated AI cluster에 host하고 endpoint로 사용할 수 있는 방식입니다. Hugging Face에서 가져오는 경우 gated model은 read 권한이 있는 Hugging Face token이 필요할 수 있습니다.

Object Storage에서 가져오는 경우에는 model artifact를 bucket에 저장해야 하며, import 성공을 위해 configuration file 이름은 `config.json`이어야 합니다. 또한 Object Storage import 대상 model은 `/v1/chat/completions` endpoint와 호환되고, TEXT_TO_TEXT, IMAGE_TEXT_TO_TEXT, AUDIO_TO_TEXT, EMBEDDING, RERANK 중 하나의 capability만 지원해야 합니다.

## Schedule Randomization for Data Science Scheduler
* **Services:** Data Science
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/data-science/june2026-schedule-randomization.htm](https://docs.oracle.com/iaas/releasenotes/data-science/june2026-schedule-randomization.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Data Science Scheduler](https://docs.oracle.com/iaas/Content/data-science/using/scheduler-about.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Science Scheduler에서 interval-based schedule의 randomized start window를 설정할 수 있게 되었습니다. 활성화하면 첫 실행 시 지정된 window 안에서 random offset을 선택하고, 이후 실행은 그 첫 실행 시점 기준 고정 interval로 수행됩니다.

운영 영향은 resource contention 완화입니다. 여러 notebook job, pipeline, model 관련 작업이 같은 시각에 몰리는 환경에서는 시작 시점을 분산해 compute/API 부하를 줄일 수 있습니다.

### 주요 변경 포인트

* 서비스의 사용 방식 또는 운영 옵션이 확장되었습니다.
* 기존 운영 절차와 자동화 스크립트에 영향을 줄 수 있는 설정 항목을 먼저 확인하는 것이 좋습니다.
* Console, API, CLI 중 실제 운영에서 사용하는 경로 기준으로 적용 가능 여부를 검증해야 합니다.

### 적용 및 검증 포인트

운영 반영 전에는 테스트 환경에서 생성·수정·조회·삭제 흐름을 확인하고, 관련 IAM policy, network path, logging/monitoring 지표를 함께 점검하는 것이 좋습니다.

### 동작 방식

Data Science Scheduler의 randomized start window는 interval-based schedule에서 실행 시작 시간이 한 시점에 몰리지 않도록 분산하는 기능입니다. 예를 들어 start time이 09:10 UTC이고 random window duration이 30분이면 첫 실행은 09:10~09:40 UTC 사이에서 무작위로 선택됩니다.

random window duration의 최소값은 30분이며, 설정한 schedule interval을 초과할 수 없습니다. random start를 enable했지만 duration을 지정하지 않으면 service가 configured interval의 절반을 기본 duration으로 사용합니다. 생성 또는 업데이트 전에는 next five executions preview로 실제 실행 window를 확인하는 것이 좋습니다.

## Import DeepSeek V4 Flash and DeepSeek V4 Pro in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

DeepSeek V4 Flash와 DeepSeek V4 Pro 모델을 OCI Generative AI로 import할 수 있게 되었습니다. 두 모델은 reasoning, coding, agentic workflow에 최적화된 MoE text-to-text model이며, context length는 최대 1 million token을 지원합니다.

공식 릴리스 노트 기준으로 DeepSeek V4 Flash는 `deepseek-ai/DeepSeek-V4-Flash`, 권장 shape는 `H100_X4`이고, DeepSeek V4 Pro는 `deepseek-ai/DeepSeek-V4-Pro`, 권장 shape는 `H200_X8`입니다. Pro는 1.6T total parameters / 49B active parameters, Flash는 284B total parameters / 13B active parameters로 안내됩니다.

### 주요 변경 포인트

* OCI Generative AI에서 imported model 또는 dedicated AI cluster 기반 선택지가 확장되었습니다.
* 모델을 직접 import해 endpoint로 배포하는 경우, 지원 region, dedicated AI cluster shape, endpoint 생성 조건을 함께 확인해야 합니다.
* 모델별 라이선스, 입력/출력 특성, latency, 비용 구조가 다를 수 있으므로 PoC 기준을 먼저 정하는 것이 좋습니다.

### 적용 및 검증 포인트

모델 import 후에는 dedicated AI cluster 상태, model lifecycle, endpoint 생성 가능 여부, inference 테스트를 순서대로 확인해야 합니다. 운영 적용 전에는 대표 prompt 또는 샘플 입력으로 품질과 응답 시간, 실패 시 retry 정책을 점검하는 것이 안전합니다.

### Import 조건

OCI Generative AI imported model은 Hugging Face 또는 OCI Object Storage bucket의 validated open-source/third-party model을 가져와 dedicated AI cluster에 host하고 endpoint로 사용할 수 있는 방식입니다. Hugging Face에서 가져오는 경우 gated model은 read 권한이 있는 Hugging Face token이 필요할 수 있습니다.

Object Storage에서 가져오는 경우에는 model artifact를 bucket에 저장해야 하며, import 성공을 위해 configuration file 이름은 `config.json`이어야 합니다. 또한 Object Storage import 대상 model은 `/v1/chat/completions` endpoint와 호환되고, TEXT_TO_TEXT, IMAGE_TEXT_TO_TEXT, AUDIO_TO_TEXT, EMBEDDING, RERANK 중 하나의 capability만 지원해야 합니다.

## Import Qwen 3 Next 80B A3B Instruct in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-next.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-next.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Qwen3 Next 80B A3B Instruct 모델을 OCI Generative AI로 import할 수 있습니다. 이 모델은 80B parameter text-to-text MoE language model이며 inference 중 3B parameter를 활성화해 효율성을 높이는 구조입니다.

공식 릴리스 노트는 Hugging Face model ID를 `Qwen/Qwen3-Next-80B-A3B-Instruct`로 안내하고, 권장 dedicated AI cluster unit shape로 `A100_80G_X4`, `H100_X4`, `H200_X4`를 제시합니다. long-context 처리에는 Gated DeltaNet과 Gated Attention을 결합한 hybrid attention design이 포함되며 context length는 최대 256K token입니다.

### 주요 변경 포인트

* OCI Generative AI에서 imported model 또는 dedicated AI cluster 기반 선택지가 확장되었습니다.
* 모델을 직접 import해 endpoint로 배포하는 경우, 지원 region, dedicated AI cluster shape, endpoint 생성 조건을 함께 확인해야 합니다.
* 모델별 라이선스, 입력/출력 특성, latency, 비용 구조가 다를 수 있으므로 PoC 기준을 먼저 정하는 것이 좋습니다.

### 적용 및 검증 포인트

모델 import 후에는 dedicated AI cluster 상태, model lifecycle, endpoint 생성 가능 여부, inference 테스트를 순서대로 확인해야 합니다. 운영 적용 전에는 대표 prompt 또는 샘플 입력으로 품질과 응답 시간, 실패 시 retry 정책을 점검하는 것이 안전합니다.

### Import 조건

OCI Generative AI imported model은 Hugging Face 또는 OCI Object Storage bucket의 validated open-source/third-party model을 가져와 dedicated AI cluster에 host하고 endpoint로 사용할 수 있는 방식입니다. Hugging Face에서 가져오는 경우 gated model은 read 권한이 있는 Hugging Face token이 필요할 수 있습니다.

Object Storage에서 가져오는 경우에는 model artifact를 bucket에 저장해야 하며, import 성공을 위해 configuration file 이름은 `config.json`이어야 합니다. 또한 Object Storage import 대상 model은 `/v1/chat/completions` endpoint와 호환되고, TEXT_TO_TEXT, IMAGE_TEXT_TO_TEXT, AUDIO_TO_TEXT, EMBEDDING, RERANK 중 하나의 capability만 지원해야 합니다.

## Import Google MedGemma 27B Text IT in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/google-med-gemma-27b-it.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/google-med-gemma-27b-it.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Google MedGemma 27B Text IT 모델을 OCI Generative AI로 import할 수 있습니다. 이 모델은 Gemma 3 기반 27B language model이며 medical literature와 clinical records로 학습되고 instruction-tuned되어 medical QA, clinical support, summarization 같은 healthcare-focused task에 맞춰져 있습니다.

공식 릴리스 노트는 Hugging Face model ID를 `google/medgemma-27b-text-it`로 안내하고, 권장 dedicated AI cluster unit shape로 `A100_80GB_X2`, `H100_X2`, `H200_X2`, `B200_X2`를 제시합니다.

### 주요 변경 포인트

* OCI Generative AI에서 imported model 또는 dedicated AI cluster 기반 선택지가 확장되었습니다.
* 모델을 직접 import해 endpoint로 배포하는 경우, 지원 region, dedicated AI cluster shape, endpoint 생성 조건을 함께 확인해야 합니다.
* 모델별 라이선스, 입력/출력 특성, latency, 비용 구조가 다를 수 있으므로 PoC 기준을 먼저 정하는 것이 좋습니다.

### 적용 및 검증 포인트

모델 import 후에는 dedicated AI cluster 상태, model lifecycle, endpoint 생성 가능 여부, inference 테스트를 순서대로 확인해야 합니다. 운영 적용 전에는 대표 prompt 또는 샘플 입력으로 품질과 응답 시간, 실패 시 retry 정책을 점검하는 것이 안전합니다.

### Import 조건

OCI Generative AI imported model은 Hugging Face 또는 OCI Object Storage bucket의 validated open-source/third-party model을 가져와 dedicated AI cluster에 host하고 endpoint로 사용할 수 있는 방식입니다. Hugging Face에서 가져오는 경우 gated model은 read 권한이 있는 Hugging Face token이 필요할 수 있습니다.

Object Storage에서 가져오는 경우에는 model artifact를 bucket에 저장해야 하며, import 성공을 위해 configuration file 이름은 `config.json`이어야 합니다. 또한 Object Storage import 대상 model은 `/v1/chat/completions` endpoint와 호환되고, TEXT_TO_TEXT, IMAGE_TEXT_TO_TEXT, AUDIO_TO_TEXT, EMBEDDING, RERANK 중 하나의 capability만 지원해야 합니다.

## Import OpenAI Whisper Large V3 Turbo in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/openai-whisper-large-v3-turbo.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/openai-whisper-large-v3-turbo.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OpenAI Whisper Large V3 Turbo 모델을 OCI Generative AI로 import할 수 있습니다. Whisper Large V3 Turbo는 Whisper Large V3를 automatic speech recognition 용도로 최적화한 audio-to-text model이며, decoder layer를 32개에서 4개로 줄여 더 빠른 transcription을 제공하되 품질 tradeoff가 일부 있을 수 있습니다.

공식 릴리스 노트는 Hugging Face model ID를 `openai/whisper-large-v3-turbo`, 권장 dedicated AI cluster unit shape를 `H100_X1` 또는 `A100_80G_X1`로 안내합니다. multilingual transcription, language identification, supported language의 English translation을 지원하며 latency-sensitive/high-throughput 음성 전사 workload에 적합합니다.

### 주요 변경 포인트

* OCI Generative AI에서 imported model 또는 dedicated AI cluster 기반 선택지가 확장되었습니다.
* 모델을 직접 import해 endpoint로 배포하는 경우, 지원 region, dedicated AI cluster shape, endpoint 생성 조건을 함께 확인해야 합니다.
* 모델별 라이선스, 입력/출력 특성, latency, 비용 구조가 다를 수 있으므로 PoC 기준을 먼저 정하는 것이 좋습니다.

### 적용 및 검증 포인트

모델 import 후에는 dedicated AI cluster 상태, model lifecycle, endpoint 생성 가능 여부, inference 테스트를 순서대로 확인해야 합니다. 운영 적용 전에는 대표 prompt 또는 샘플 입력으로 품질과 응답 시간, 실패 시 retry 정책을 점검하는 것이 안전합니다.

### Import 조건

OCI Generative AI imported model은 Hugging Face 또는 OCI Object Storage bucket의 validated open-source/third-party model을 가져와 dedicated AI cluster에 host하고 endpoint로 사용할 수 있는 방식입니다. Hugging Face에서 가져오는 경우 gated model은 read 권한이 있는 Hugging Face token이 필요할 수 있습니다.

Object Storage에서 가져오는 경우에는 model artifact를 bucket에 저장해야 하며, import 성공을 위해 configuration file 이름은 `config.json`이어야 합니다. 또한 Object Storage import 대상 model은 `/v1/chat/completions` endpoint와 호환되고, TEXT_TO_TEXT, IMAGE_TEXT_TO_TEXT, AUDIO_TO_TEXT, EMBEDDING, RERANK 중 하나의 capability만 지원해야 합니다.

## Import NVIDIA Nemotron 3 Ultra in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 05, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-ultra-nvfp4.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-ultra-nvfp4.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

NVIDIA Nemotron 3 Ultra 모델을 OCI Generative AI로 import할 수 있습니다. 공식 릴리스 노트는 이 모델을 complex agentic workflow, long-context analysis, tool use, code/math/science reasoning에 최적화된 frontier-scale open model로 설명합니다.

모델 사양은 550B total parameters, 55B active parameters, context length 최대 1 million token이며, Hugging Face model ID는 `nvidia/NVIDIA-Nemotron-3-Ultra-550B-A55B-NVFP4`입니다. 권장 dedicated AI cluster unit shape는 `B200_X4`입니다.

### 주요 변경 포인트

* OCI Generative AI에서 imported model 또는 dedicated AI cluster 기반 선택지가 확장되었습니다.
* 모델을 직접 import해 endpoint로 배포하는 경우, 지원 region, dedicated AI cluster shape, endpoint 생성 조건을 함께 확인해야 합니다.
* 모델별 라이선스, 입력/출력 특성, latency, 비용 구조가 다를 수 있으므로 PoC 기준을 먼저 정하는 것이 좋습니다.

### 적용 및 검증 포인트

모델 import 후에는 dedicated AI cluster 상태, model lifecycle, endpoint 생성 가능 여부, inference 테스트를 순서대로 확인해야 합니다. 운영 적용 전에는 대표 prompt 또는 샘플 입력으로 품질과 응답 시간, 실패 시 retry 정책을 점검하는 것이 안전합니다.

### Import 조건

OCI Generative AI imported model은 Hugging Face 또는 OCI Object Storage bucket의 validated open-source/third-party model을 가져와 dedicated AI cluster에 host하고 endpoint로 사용할 수 있는 방식입니다. Hugging Face에서 가져오는 경우 gated model은 read 권한이 있는 Hugging Face token이 필요할 수 있습니다.

Object Storage에서 가져오는 경우에는 model artifact를 bucket에 저장해야 하며, import 성공을 위해 configuration file 이름은 `config.json`이어야 합니다. 또한 Object Storage import 대상 model은 `/v1/chat/completions` endpoint와 호환되고, TEXT_TO_TEXT, IMAGE_TEXT_TO_TEXT, AUDIO_TO_TEXT, EMBEDDING, RERANK 중 하나의 capability만 지원해야 합니다.

## OpenAI gpt-oss Models Available on B200 Dedicated AI Clusters in Abu Dhabi
* **Services:** Generative AI
* **Release Date:** June 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/gpt-oss-abudhabi.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/gpt-oss-abudhabi.htm){:target="_blank" rel="noopener"}
* **Documentation:** [create a dedicated AI cluster](https://docs.oracle.com/iaas/Content/generative-ai/create-ai-cluster-hosting.htm){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

UAE Central(Abu Dhabi) region에서 B200 GPU shape 기반 dedicated AI cluster로 OpenAI gpt-oss 모델을 호스팅할 수 있게 되었습니다. 지원 cluster shape는 `OAI_B200_X1`, `OAI_B200_X2`, `OAI_B200_X4`, `OAI_B200_X8`이고, 지원 모델은 `openai.gpt-oss-20b`, `openai.gpt-oss-120b`입니다.

사용 흐름은 supported B200 GPU shape로 dedicated AI cluster를 만든 뒤, 해당 cluster 위에 model endpoint를 생성하고 endpoint를 호출하는 방식입니다. region별 데이터 주권, 중동 지역 latency, dedicated capacity 요구사항이 있는 고객에게 적합합니다.

### 주요 변경 포인트

* OCI Generative AI에서 imported model 또는 dedicated AI cluster 기반 선택지가 확장되었습니다.
* 모델을 직접 import해 endpoint로 배포하는 경우, 지원 region, dedicated AI cluster shape, endpoint 생성 조건을 함께 확인해야 합니다.
* 모델별 라이선스, 입력/출력 특성, latency, 비용 구조가 다를 수 있으므로 PoC 기준을 먼저 정하는 것이 좋습니다.

### 적용 및 검증 포인트

모델 import 후에는 dedicated AI cluster 상태, model lifecycle, endpoint 생성 가능 여부, inference 테스트를 순서대로 확인해야 합니다. 운영 적용 전에는 대표 prompt 또는 샘플 입력으로 품질과 응답 시간, 실패 시 retry 정책을 점검하는 것이 안전합니다.

### Cluster 생성 주의사항

Dedicated AI cluster에서 imported model 또는 base model을 hosting하려면 cluster type을 `Hosting`으로 선택하고 base model 또는 imported model을 지정합니다. Imported model을 선택한 경우에는 해당 model의 recommended unit size를 선택해야 하며, unit shape는 생성 후 변경할 수 없습니다.

Hosting cluster는 기본적으로 선택한 model을 위한 unit 하나를 생성하며, 필요 시 model replica 수를 늘릴 수 있습니다. B200 dedicated AI cluster와 region availability가 결합된 항목이므로, Abu Dhabi region에서 model 지원 여부와 endpoint 생성 가능 여부를 먼저 확인한 뒤 테스트 prompt로 latency와 응답 품질을 검증하는 흐름이 적절합니다.
