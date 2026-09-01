---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "8월 OCI AI/ML 업데이트 소식"
teaser: "2026년 8월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aiml
tags:
  - oci-release-notes-2026
  - Aug-2026
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

## Import New Models into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 05, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/imported-models-august-05-2026.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/imported-models-august-05-2026.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI가 다음 9개 모델의 import를 지원합니다: `aisingapore/Qwen-SEA-LION-v4-32B-IT`, `mistralai/Magistral-Small-2509`, `google/gemma-4-12B-it`, `google/gemma-4-26B-A4B`, `Qwen/Qwen3.5-397B-A17B`, `k2-fsa/OmniVoice`, `nvidia/NVIDIA-Nemotron-3-Super-120B-A12B-NVFP4`, `deepseek-ai/DeepSeek-V4-Pro`, `zai-org/GLM-5.2-FP8`입니다. 이는 공식 Release Note에 열거된 모델 ID이며, 개별 모델의 capability와 최소 hardware unit shape는 Models for Import 문서에서 확인해야 합니다.

### 모델 목록 및 확인 항목

Models for Import에서 사용할 모델 ID의 철자, capability, 최소 Dedicated AI Cluster unit shape를 확인하고, Managing Imported Models에서 해당 shape의 가용 범위와 import·endpoint 배포 절차를 확인합니다. 운영 적용 여부는 이 공식 호환성 정보와 실제 배포 region에서 선택할 수 있는 shape를 대조한 뒤 판단합니다.

## Import Moonshot AI Kimi K3 into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/moonshot-ai-kimi-k3.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/moonshot-ai-kimi-k3.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-moonshot-ai-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-moonshot-ai-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에 `moonshotai/Kimi-K3`를 import하고 endpoint로 배포할 수 있습니다. 공식 Release Note에 명시된 capability는 `IMAGE_TEXT_TO_TEXT`이고, 최소 Dedicated AI Cluster unit shape는 `B300_X8`, `B200_X16`, `H100_X32`입니다.

### 모델 사양과 배포 전제조건

모델 ID와 세 최소 shape 중 배포 region에서 제공되는 구성을 Models for Import에서 확인합니다. Hugging Face에서 직접 가져오는 경우에는 해당 모델 접근 요건을 확인하고, Object Storage에서 가져오는 경우에는 Managing Imported Models 문서에 따라 model artifact를 bucket에 저장하며 구성 파일 이름을 `config.json`으로 준비해야 합니다. 운영 배포 전에는 선택한 import 경로의 artifact와 shape 조건을 각각 검증합니다.

## Import NVIDIA Nemotron 3.5 Lightning Models into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-5-lightning.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-5-lightning.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI가 `nvidia/NVIDIA-Nemotron-3.5-Lightning-30B-A3B-BF16`과 `nvidia/NVIDIA-Nemotron-3.5-Lightning-30B-A3B-NVFP4`의 import와 endpoint 배포를 지원합니다. 두 모델의 공식 capability는 모두 `TEXT_TO_TEXT`입니다.

### BF16와 NVFP4 배포 차이

BF16 모델의 최소 Dedicated AI Cluster unit shape는 `A100_40G_X2`, `A100_80G_X1`, `H100_X1`, `H200_X1`, `B200_X1`이고, NVFP4 모델은 `H100_X1`, `H200_X1`, `B200_X1`을 지원합니다. 따라서 운영 구성은 정밀도 형식별 공식 shape 목록과 배포 region에서 실제 선택 가능한 shape를 대조해 결정하고, BF16용 A100 구성을 NVFP4에도 적용할 수 있다고 가정하지 않습니다. Endpoint 생성 후 선택한 정밀도 형식과 shape가 일치하는지 확인하고 실제 추론 요청으로 배포 상태를 검증합니다.

## OCI Generative AI now available in Oracle US Government Cloud and Oracle US Defense Cloud
* **Services:** Generative AI, Oracle Cloud Infrastructure Government Cloud
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/generative-ai-government.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/generative-ai-government.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/hardware-unit-shapes-by-region.htm](https://docs.oracle.com/iaas/Content/generative-ai/hardware-unit-shapes-by-region.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/model-endpoint-regions.htm](https://docs.oracle.com/iaas/Content/generative-ai/model-endpoint-regions.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/gov-cloud/govfedramp.htm](https://docs.oracle.com/iaas/Content/gov-cloud/govfedramp.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/gov-cloud/govfeddod.htm](https://docs.oracle.com/iaas/Content/gov-cloud/govfeddod.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI가 Oracle US Government Cloud의 US Gov West(Phoenix)와 Oracle US Defense Cloud의 US DoD West(Phoenix) region에서 제공됩니다. 두 region에서는 일부 foundation model을 hosting하기 위한 B300 hardware unit shape도 사용할 수 있습니다.

### 설정 및 적용 범위

대상 government cloud tenancy와 region에서 사용 가능한 foundation model을 Models by Region 문서로 먼저 확인합니다. B300 unit을 사용하려면 Release Note에 명시된 대로 service limit increase를 요청하고, Hardware Unit Shapes by Region 문서에서 해당 limit 이름과 region 지원 여부를 확인해야 합니다.

### 영향과 제약

정부 클라우드 workload가 해당 region 안에서 OCI Generative AI 모델 endpoint를 구성할 수 있는 선택지가 생겼습니다. 다만 B300은 모든 모델에 일괄 적용되는 shape가 아니라 해당 region에서 지원되는 일부 foundation model용이며, service limit이 승인되지 않으면 필요한 unit을 확보할 수 없습니다.

### 검증 항목

사용 중인 tenancy가 올바른 government cloud와 Phoenix region을 대상으로 하는지 확인합니다. 이어서 사용할 모델의 region 가용성, B300 service limit, endpoint 생성에 필요한 capacity를 확인한 뒤 실제 endpoint 상태와 모델 호출 성공 여부를 검증합니다.

## Import DeepSeek V4 Flash 0731 into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 19, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4-flash-0731.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4-flash-0731.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-deepseek-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-deepseek-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에 `deepseek-ai/DeepSeek-V4-Flash-0731`을 import하고 endpoint로 배포할 수 있습니다. 공식 Release Note는 이 모델을 DeepSeek-V4-Flash preview를 대체하는 정식 릴리스로 설명하며, 향상된 agentic capability, speculative decoding module, low·high·max reasoning-effort 수준을 명시합니다. capability는 `TEXT_TO_TEXT`이고 최소 shape는 `H100_X4`, `H200_X4`, `B200_X2`, `B300_X2`입니다.

### Preview 대체 시 유의점

기존 preview 사용 시에는 정식 모델 ID와 artifact로 교체하고, agentic coding·tool use·complex reasoning workload에서 응답을 다시 검증합니다. Speculative decoding은 공식 모델 사양에 포함된 모듈이므로 이를 별도의 OCI endpoint 설정값으로 간주하지 않으며, 운영 전환 판단은 정식 모델 endpoint의 실제 결과와 기존 preview 기준을 비교해 내립니다.

## Import Qwen 3.8 into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 19, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-8.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-8.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-alibaba-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-alibaba-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에 FP8 Mixture-of-Experts 모델 `Qwen/Qwen3.8-2.4T-A95B-FP8`을 import하고 endpoint로 배포할 수 있습니다. 공식 사양은 총 2.4조 parameter 중 950억 parameter를 활성화하며, capability는 `TEXT_TO_TEXT`, 최소 Dedicated AI Cluster unit shape는 `B200_X16`입니다.

### Context 확장과 B200_X16 전제

Native context length는 262,144 token이고 최대 1,010,000 token까지 확장할 수 있습니다. 다만 imported model 문서는 실제 최대 context가 hosting cluster의 hardware 구성에 의해 제한될 수 있다고 명시하므로, `B200_X16` 제공 여부를 확인한 후 목표 context 길이로 endpoint를 검증해야 합니다. 이 hardware 전제와 context 상한은 endpoint 수용량 및 장문 요청의 운영 설계에 직접 영향을 줍니다. 1,010,000 token을 모든 배포에서 자동 보장되는 값으로 간주하지 않습니다.

## Import Xiaomi MiMo V2.5 Pro into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 19, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/xiaomi-mimo-v2-5-pro.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/xiaomi-mimo-v2-5-pro.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-xiaomi-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-xiaomi-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에 `XiaomiMiMo/MiMo-V2.5-Pro`를 import하고 endpoint로 배포할 수 있습니다. 공식 Release Note에 따르면 이 모델은 총 1.02조 parameter 중 420억 parameter를 활성화하는 open source Mixture-of-Experts(MoE) 모델이며, capability는 `TEXT_TO_TEXT`, 지원 context length는 최대 100만 token입니다.

### 모델 사양과 배포 전제조건

최소 Dedicated AI Cluster unit shape는 `B200_X8` 또는 `B300_X8`입니다. 운영 배포 전 Models for Import에서 모델 ID와 shape 조건을 확인하고, 실제 배포 region에서 두 shape 중 사용할 구성이 제공되는지 확인합니다. Imported model의 유효 최대 context는 선택한 hardware 구성에 의해 제한될 수 있으므로 목표 context 길이로 endpoint를 별도 검증합니다.

## Model Selection, Scheduled Enrichment, and Background SQL Generation Available for Enterprise AI NL2SQL
* **Services:** Generative AI
* **Release Date:** August 26, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/nl2sql-model-selection-background-generation.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/nl2sql-model-selection-background-generation.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/nl2sql.htm](https://docs.oracle.com/iaas/Content/generative-ai/nl2sql.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/model-endpoint-regions.htm](https://docs.oracle.com/iaas/Content/generative-ai/model-endpoint-regions.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Enterprise AI NL2SQL에 enrichment용 모델 선택, semantic store의 정기 enrichment, SQL 생성 요청의 background 처리가 추가되었습니다. enrichment와 SQL 생성의 모델·실행 시점을 workload에 맞게 제어하고, client timeout을 넘길 수 있는 요청을 비동기 job으로 처리할 수 있습니다.

### 설정 방법

Semantic store를 enrich할 Generative AI 모델을 선택하며, API에서는 개별 SQL 생성 요청에도 모델을 지정할 수 있습니다. 모델을 지정하지 않으면 `openai.gpt-oss-120b`가 기본값으로 사용됩니다. 정기 enrichment는 ISO 8601 duration으로 설정하고 최소 간격은 6시간이며, API의 delta refresh는 `GenerateEnrichmentJob`에서 `DeltaRefreshEnrichmentJobConfiguration`을 사용합니다. Background SQL 생성은 `GenerateSqlFromNl` 호출의 `completionMode`를 `BACKGROUND_JOB`으로 설정합니다.

### 영향과 제약

선택 가능한 모델은 해당 region에서 on-demand로 제공되고 tenancy가 접근할 수 있는 Generative AI 모델로 제한되며, 예약된 refresh마다 선택한 모델이 사용됩니다. Delta refresh는 최근 enrichment 이후 변경된 database object만 갱신합니다. Background SQL 생성은 API·SDK·CLI에서 제공되지만 Console에서는 사용할 수 없고, SQL을 생성할 뿐 database에서 실행하지는 않습니다.

### 검증 항목

예약 간격이 6시간 이상인지와 enrichment job의 완료 상태를 확인하고, 변경된 schema metadata가 delta refresh 결과에 반영됐는지 점검합니다. Background 요청은 `GetGenerateSqlFromNlJob`을 최종 상태와 결과의 기준으로 삼고, 성공 시 `jobOutput`에서 생성된 SQL을 확인합니다.
