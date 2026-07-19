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
* **Documentation:** [Private Endpoints in Generative AI](https://docs.oracle.com/iaas/Content/generative-ai/private-endpoint.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 imported model에 private endpoint를 생성할 수 있게 되었습니다. 이를 통해 imported model 접근 트래픽을 public internet이 아니라 private network path로 보낼 수 있습니다.

운영 영향은 보안 경계와 네트워크 통제입니다. 기업 내부 VCN에서 모델 endpoint를 호출해야 하거나, 인터넷 경유를 피해야 하는 AI inference workload라면 private endpoint 구성을 우선 검토할 수 있습니다.

적용 전에는 VCN/subnet, DNS, security list 또는 NSG, model endpoint 접근 주체를 확인해야 합니다. 검증은 private network에서 endpoint 호출이 되는지, public path를 차단해도 inference가 정상인지, latency와 접근 로그가 기대대로 기록되는지 확인하는 방식이 좋습니다.

## Import New Compatible Models in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/compatible-imported-models-june-30-2026.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/compatible-imported-models-june-30-2026.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 MiniMax, Mistral, Moonshot AI Kimi, Z.ai GLM 계열 신규 모델을 imported model로 사용할 수 있게 되었습니다. 공식 릴리스 노트는 각 model family별 compatible model list와 recommended dedicated AI cluster unit shape를 확인하라고 안내합니다.

이 항목은 모델 선택지 확장 성격이므로, 실제 운영 반영 전에는 모델 라이선스, context length, 비용, latency, 전용 AI cluster shape 요구사항을 비교해야 합니다. 업무별 benchmark를 통해 한국어/영어/코딩/추론 성능을 확인한 뒤 endpoint 배포 여부를 결정하는 것이 좋습니다.

## Schedule Randomization for Data Science Scheduler
* **Services:** Data Science
* **Release Date:** June 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/data-science/june2026-schedule-randomization.htm](https://docs.oracle.com/iaas/releasenotes/data-science/june2026-schedule-randomization.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Data Science Scheduler에서 interval-based schedule의 randomized start window를 설정할 수 있게 되었습니다. 활성화하면 첫 실행 시 지정된 window 안에서 random offset을 선택하고, 이후 실행은 그 첫 실행 시점 기준 고정 interval로 수행됩니다.

운영 영향은 resource contention 완화입니다. 여러 notebook job, pipeline, model 관련 작업이 같은 시각에 몰리는 환경에서는 시작 시점을 분산해 compute/API 부하를 줄일 수 있습니다.

적용 전에는 현재 스케줄들이 동시에 시작되는지, 업무상 허용 가능한 지연 window가 얼마인지 확인해야 합니다. 검증은 randomized window 적용 후 실제 first run time과 이후 interval이 의도대로 유지되는지, resource peak가 완화되는지 보는 방식이 좋습니다.

## Import DeepSeek V4 Flash and DeepSeek V4 Pro in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

DeepSeek V4 Flash와 DeepSeek V4 Pro 모델을 OCI Generative AI로 import할 수 있게 되었습니다. 두 모델은 reasoning, coding, agentic workflow에 최적화된 MoE text-to-text model이며, context length는 최대 1 million token을 지원합니다.

공식 릴리스 노트 기준으로 DeepSeek V4 Flash는 `deepseek-ai/DeepSeek-V4-Flash`, 권장 shape는 `H100_X4`이고, DeepSeek V4 Pro는 `deepseek-ai/DeepSeek-V4-Pro`, 권장 shape는 `H200_X8`입니다. Pro는 1.6T total parameters / 49B active parameters, Flash는 284B total parameters / 13B active parameters로 안내됩니다.

운영 전에는 전용 AI cluster 비용, latency, context length가 필요한 use case인지, 모델 라이선스와 데이터 보안 요구사항을 확인해야 합니다.

## Import Qwen 3 Next 80B A3B Instruct in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-next.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-next.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Qwen3 Next 80B A3B Instruct 모델을 OCI Generative AI로 import할 수 있습니다. 이 모델은 80B parameter text-to-text MoE language model이며 inference 중 3B parameter를 활성화해 효율성을 높이는 구조입니다.

공식 릴리스 노트는 Hugging Face model ID를 `Qwen/Qwen3-Next-80B-A3B-Instruct`로 안내하고, 권장 dedicated AI cluster unit shape로 `A100_80G_X4`, `H100_X4`, `H200_X4`를 제시합니다. long-context 처리에는 Gated DeltaNet과 Gated Attention을 결합한 hybrid attention design이 포함되며 context length는 최대 256K token입니다.

활용 시나리오는 긴 문서 분석, instruction-following 업무 자동화, 코드/추론 평가입니다. 배포 전에는 shape별 비용과 지연시간을 benchmark로 확인하는 것이 좋습니다.

## Import Google MedGemma 27B Text IT in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/google-med-gemma-27b-it.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/google-med-gemma-27b-it.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Google MedGemma 27B Text IT 모델을 OCI Generative AI로 import할 수 있습니다. 이 모델은 Gemma 3 기반 27B language model이며 medical literature와 clinical records로 학습되고 instruction-tuned되어 medical QA, clinical support, summarization 같은 healthcare-focused task에 맞춰져 있습니다.

공식 릴리스 노트는 Hugging Face model ID를 `google/medgemma-27b-text-it`로 안내하고, 권장 dedicated AI cluster unit shape로 `A100_80GB_X2`, `H100_X2`, `H200_X2`, `B200_X2`를 제시합니다.

의료/생명과학 데이터 활용 시에는 개인정보, 규제, 전문성 검증이 중요합니다. 실제 업무 적용 전에는 전문가 검토, 데이터 비식별화, 답변 품질 평가 기준을 마련해야 합니다.

## Import OpenAI Whisper Large V3 Turbo in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 09, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/openai-whisper-large-v3-turbo.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/openai-whisper-large-v3-turbo.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OpenAI Whisper Large V3 Turbo 모델을 OCI Generative AI로 import할 수 있습니다. Whisper Large V3 Turbo는 Whisper Large V3를 automatic speech recognition 용도로 최적화한 audio-to-text model이며, decoder layer를 32개에서 4개로 줄여 더 빠른 transcription을 제공하되 품질 tradeoff가 일부 있을 수 있습니다.

공식 릴리스 노트는 Hugging Face model ID를 `openai/whisper-large-v3-turbo`, 권장 dedicated AI cluster unit shape를 `H100_X1` 또는 `A100_80G_X1`로 안내합니다. multilingual transcription, language identification, supported language의 English translation을 지원하며 latency-sensitive/high-throughput 음성 전사 workload에 적합합니다.

활용 시나리오는 콜센터 녹취, 회의록, 음성 로그 분석입니다. 개인정보가 포함될 수 있으므로 저장 위치, 접근 권한, 보존 정책을 함께 검토해야 합니다.

## Import NVIDIA Nemotron 3 Ultra in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** June 05, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-ultra-nvfp4.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-ultra-nvfp4.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing Imported Models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

NVIDIA Nemotron 3 Ultra 모델을 OCI Generative AI로 import할 수 있습니다. 공식 릴리스 노트는 이 모델을 complex agentic workflow, long-context analysis, tool use, code/math/science reasoning에 최적화된 frontier-scale open model로 설명합니다.

모델 사양은 550B total parameters, 55B active parameters, context length 최대 1 million token이며, Hugging Face model ID는 `nvidia/NVIDIA-Nemotron-3-Ultra-550B-A55B-NVFP4`입니다. 권장 dedicated AI cluster unit shape는 `B200_X4`입니다.

운영 전에는 B200 기반 전용 클러스터 확보 가능성, 비용, long-context workload 필요성, agent/tool-use 평가 기준을 확인해야 합니다.

## OpenAI gpt-oss Models Available on B200 Dedicated AI Clusters in Abu Dhabi
* **Services:** Generative AI
* **Release Date:** June 01, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/gpt-oss-abudhabi.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/gpt-oss-abudhabi.htm){:target="_blank" rel="noopener"}
* **Documentation:** [create a dedicated AI cluster](https://docs.oracle.com/iaas/Content/generative-ai/create-ai-cluster-hosting.htm){:target="_blank" rel="noopener"}, [Generative AI documentation](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

UAE Central(Abu Dhabi) region에서 B200 GPU shape 기반 dedicated AI cluster로 OpenAI gpt-oss 모델을 호스팅할 수 있게 되었습니다. 지원 cluster shape는 `OAI_B200_X1`, `OAI_B200_X2`, `OAI_B200_X4`, `OAI_B200_X8`이고, 지원 모델은 `openai.gpt-oss-20b`, `openai.gpt-oss-120b`입니다.

사용 흐름은 supported B200 GPU shape로 dedicated AI cluster를 만든 뒤, 해당 cluster 위에 model endpoint를 생성하고 endpoint를 호출하는 방식입니다. region별 데이터 주권, 중동 지역 latency, dedicated capacity 요구사항이 있는 고객에게 적합합니다.

검증 시에는 Abu Dhabi region의 quota/capacity, endpoint 생성 상태, inference latency, 모델별 비용과 처리량을 확인해야 합니다.
