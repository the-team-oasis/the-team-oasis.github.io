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

OCI Generative AI의 imported model 목록에 SEA-LION, Magistral Small, Gemma, Qwen, OmniVoice, NVIDIA Nemotron, DeepSeek, Z.ai GLM 계열의 9개 모델이 추가되었습니다. 모델마다 지원되는 기능과 필요한 Dedicated AI Cluster 구성이 다르므로 Models for Import에서 정확한 모델 ID와 호환성을 확인해야 합니다. 배포 전에는 Managing Imported Models 문서에서 지원 hardware unit shape와 endpoint 생성 절차를 함께 점검합니다.

이 변경은 사용할 모델의 기능 범위와 추론 인프라 선택에 직접 영향을 주므로, 운영 용량과 비용 계획을 함께 검토해야 합니다.

## Import Moonshot AI Kimi K3 into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/moonshot-ai-kimi-k3.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/moonshot-ai-kimi-k3.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-moonshot-ai-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-moonshot-ai-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에 `moonshotai/Kimi-K3`를 import하고 endpoint로 배포할 수 있습니다. 이 모델의 capability는 `IMAGE_TEXT_TO_TEXT`이며 최소 Dedicated AI Cluster unit shape는 `B300_X8`, `B200_X16`, `H100_X32`입니다. 도입 전 모델 문서에서 artifact 요건을 확인하고, 배포 region에서 필요한 shape의 capacity와 service limit을 점검해야 합니다.

이 변경은 사용할 모델의 기능 범위와 추론 인프라 선택에 직접 영향을 주므로, 운영 용량과 비용 계획을 함께 검토해야 합니다.

## Import NVIDIA Nemotron 3.5 Lightning Models into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-5-lightning.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/nvidia-nemotron-3-5-lightning.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI가 NVIDIA Nemotron 3.5 Lightning 30B의 BF16 모델과 NVFP4 모델 import를 지원합니다. 두 모델 모두 `TEXT_TO_TEXT` capability를 제공하지만, BF16은 A100·H100·H200·B200 계열을 지원하고 NVFP4는 H100·H200·B200 계열의 최소 unit shape를 요구합니다. 모델 형식에 맞는 최소 shape와 해당 region의 capacity를 확인한 뒤 endpoint 배포를 검증합니다.

이 변경은 사용할 모델의 기능 범위와 추론 인프라 선택에 직접 영향을 주므로, 운영 용량과 비용 계획을 함께 검토해야 합니다.

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

OCI Generative AI에 preview를 대체하는 공식 `deepseek-ai/DeepSeek-V4-Flash-0731` 모델을 import하고 endpoint로 배포할 수 있습니다. 이 `TEXT_TO_TEXT` 모델은 low·high·max reasoning-effort 수준을 지원하며, 최소 shape는 `H100_X4`, `H200_X4`, `B200_X2`, `B300_X2` 중 하나입니다. 기존 preview 사용자는 모델 ID와 artifact를 구분하고, 대상 region에서 선택한 shape의 지원 여부와 endpoint 호출을 확인해야 합니다.

이 변경은 사용할 모델의 기능 범위와 추론 인프라 선택에 직접 영향을 주므로, 운영 용량과 비용 계획을 함께 검토해야 합니다.

## Import Qwen 3.8 into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 19, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-8.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-8.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-alibaba-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-alibaba-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에 FP8 MoE 모델 `Qwen/Qwen3.8-2.4T-A95B-FP8`을 import하고 endpoint로 배포할 수 있습니다. 모델 capability는 `TEXT_TO_TEXT`이고 최소 Dedicated AI Cluster unit shape는 `B200_X16`이며, 기본 context length는 262,144 token이고 최대 1,010,000 token까지 확장할 수 있습니다. 배포 전 모델 artifact 호환성, B200_X16 capacity와 service limit을 확인하고 예상 context 크기로 endpoint 응답을 검증합니다.

이 변경은 사용할 모델의 기능 범위와 추론 인프라 선택에 직접 영향을 주므로, 운영 용량과 비용 계획을 함께 검토해야 합니다.

## Import Xiaomi MiMo V2.5 Pro into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** August 19, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/xiaomi-mimo-v2-5-pro.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/xiaomi-mimo-v2-5-pro.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-xiaomi-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-xiaomi-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm#imported-models){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에 `XiaomiMiMo/MiMo-V2.5-Pro`를 import하고 endpoint로 배포할 수 있습니다. 이 `TEXT_TO_TEXT` MoE 모델은 최대 100만 token context를 지원하며 최소 Dedicated AI Cluster unit shape는 `B200_X8` 또는 `B300_X8`입니다. 배포 전에 모델 artifact 요건과 대상 region의 shape capacity를 확인하고, 실제 workload의 context 길이로 endpoint를 검증합니다.

이 변경은 사용할 모델의 기능 범위와 추론 인프라 선택에 직접 영향을 주므로, 운영 용량과 비용 계획을 함께 검토해야 합니다.

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
