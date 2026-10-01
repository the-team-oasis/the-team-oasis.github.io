---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "9월 OCI AI/ML 업데이트 소식"
teaser: "2026년 9월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aiml
tags:
  - oci-release-notes-2026
  - Sep-2026
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

## Use xAI Grok 4.7 in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/xai-grok-4-7.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/xai-grok-4-7.htm){:target="_blank" rel="noopener"}

### 지원 범위와 적용 대상
OCI Generative AI에서 xAI Grok 4.7을 on-demand로 사용할 수 있습니다. 코딩·agentic task·지식 작업에 사용할 모델 선택지가 추가되었습니다.

## Import Z.ai GLM-5.3-Flash into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 24, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/zai-glm-5-3-flash.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/zai-glm-5-3-flash.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-zai-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-zai-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
### 모델 등록과 제공 방식
zai-org/GLM-5.3-Flash 모델을 OCI Generative AI에 import하고 endpoint로 배포할 수 있습니다. 모델 capability와 대상 hardware shape는 배포 전에 공식 조건을 확인해야 합니다.

### 적용 및 검증 포인트

Imported model 배포 전에는 해당 모델의 capability, 지원 hardware shape, 배포 가능 리전을 함께 확인해야 합니다. endpoint를 만든 뒤에는 대표 요청으로 입력·출력 형식과 응답을 검증하고, 모델별 제한을 workload 설계에 반영합니다.

## Bring Your Own Reservations for Data Science
* **Services:** Data Science
* **Release Date:** September 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/data-science/bring_your_own_reservations.htm](https://docs.oracle.com/iaas/releasenotes/data-science/bring_your_own_reservations.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/data-science/using/bring-your-own-reservations.htm](https://docs.oracle.com/iaas/Content/data-science/using/bring-your-own-reservations.htm){:target="_blank" rel="noopener"}
### 기능 변경과 적용 범위
기존 OCI Compute capacity reservation을 Data Science notebook session·single-node job·job run·model deployment에 사용할 수 있습니다. 예약 용량을 AI/ML workload에 연결하기 전 지원 resource를 확인해야 합니다.

### 예약 용량 적용

Data Science가 지원하는 notebook session·job·model deployment resource에만 기존 Compute capacity reservation을 연결할 수 있습니다. 예약을 지정하기 전에는 workload shape·가용 domain·예약 잔여 용량을 확인하고, 실제 실행이 예약 용량을 소비하는지 job run으로 검증합니다.

## Find models by region with model discovery in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/model-discovery.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/model-discovery.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/api/#/en/generative-ai/latest/ModelDiscoveryCollection/ListModelDiscovery](https://docs.oracle.com/iaas/api/#/en/generative-ai/latest/ModelDiscoveryCollection/ListModelDiscovery){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/tools/oci-cli/latest/oci_cli_docs/cmdref/generative-ai/model-discovery-collection/list-model-discovery.html](https://docs.oracle.com/iaas/tools/oci-cli/latest/oci_cli_docs/cmdref/generative-ai/model-discovery-collection/list-model-discovery.html){:target="_blank" rel="noopener"}
### 기능 변경과 적용 범위
Model discovery로 지정 region의 모델과 capability, input/output type 같은 세부 정보를 조회할 수 있습니다. 배포 전 region별 모델 선택과 호환성 점검에 활용할 수 있습니다.

### 모델 선택 확인

Model discovery는 리전별 model capability와 input/output type을 확인하는 API·CLI 기반 조회 기능입니다. endpoint를 만들기 전 target region에서 필요한 model과 capability가 반환되는지 확인해 지원하지 않는 조합의 배포를 방지합니다.

## Route on-demand inference requests across regions with smart model router
* **Services:** Generative AI
* **Release Date:** September 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/regional-router.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/regional-router.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/create-routing-profile.htm](https://docs.oracle.com/iaas/Content/generative-ai/create-routing-profile.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/model-endpoint-regions.htm](https://docs.oracle.com/iaas/Content/generative-ai/model-endpoint-regions.htm){:target="_blank" rel="noopener"}
### 요청 라우팅 동작
Smart model router는 사용자가 정한 regional scope 안에서 on-demand inference 요청을 cross-region으로 라우팅합니다. routing profile의 모델과 허용 region 구성을 운영 정책에 맞춰 지정해야 합니다.

### 라우팅 정책

Routing profile에 사용할 model과 허용 리전 범위를 정한 뒤, 데이터 처리 지역 정책과 서비스 연속성 요구사항을 함께 검토해야 합니다. profile을 적용한 요청이 허용된 리전 범위에서 처리되는지, 관측·비용 관리 기준이 맞는지 검증합니다.

## Import DeepSeek V4.1 Flash into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4-1-flash.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4-1-flash.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-deepseek-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-deepseek-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
### 모델 등록과 제공 방식
deepseek-ai/DeepSeek-V4.1-Flash를 import해 OCI Generative AI endpoint로 사용할 수 있습니다. 텍스트·이미지·복합 입력과 텍스트 생성을 지원하는 모델입니다.

### 적용 및 검증 포인트

모델 import는 model artifact와 지원 shape가 맞아야 endpoint 배포로 이어집니다. 배포 전 지원 capability와 리전을 확인하고, endpoint 생성 후 실제 요청으로 모델의 입력 형식과 응답을 검증합니다.

## Import Google Gemma 4 26B A4B IT into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/google-gemma-4-26b-a4b-it.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/google-gemma-4-26b-a4b-it.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-google-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-google-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
### 모델 등록과 제공 방식
google/gemma-4-26B-A4B-it를 import하고 endpoint로 배포할 수 있습니다. 입력·출력 capability와 필요한 shape를 확인한 뒤 모델 import 계획에 반영합니다.

### 적용 및 검증 포인트

모델별 input/output capability와 required hardware shape를 확인한 뒤 import합니다. 개발 endpoint에서 대표 prompt를 실행해 지원 형식과 응답을 확인한 다음 production 배포를 결정합니다.

## New Retirement Date for On-Demand Models in Abu Dhabi
* **Services:** Generative AI
* **Release Date:** September 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/new-on-demand-retirement-date-AUH.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/new-on-demand-retirement-date-AUH.htm){:target="_blank" rel="noopener"}

### 종료 일정과 전환 대상
Abu Dhabi의 Cohere Command A Vision과 Cohere Embed 4 on-demand 모델 retirement date가 2026년 10월 21일로 변경되었습니다. 해당 region workload는 retirement 전 대체 serving mode 또는 모델을 준비해야 합니다.

## Import Z.ai GLM-5.3 into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/zai-glm-5-3-model-import.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/zai-glm-5-3-model-import.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-zai-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-zai-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
### 모델 등록과 제공 방식
UAE Central(Abu Dhabi) region에서 zai-org/GLM-5.3을 import해 endpoint로 배포할 수 있습니다. region과 전용 AI cluster 조건을 확인해 배포해야 합니다.

### 적용 및 검증 포인트

이 모델은 제공 리전과 dedicated AI cluster 조건을 확인해야 합니다. cluster와 endpoint를 준비한 뒤 model deployment 상태와 대표 inference 요청을 검증합니다.

## Cohere Command A Vision and Cohere Embed 4 are available on-demand in Dubai
* **Services:** Generative AI
* **Release Date:** September 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/cohere-command-a-vision-embed-4-on-demand-dubai.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/cohere-command-a-vision-embed-4-on-demand-dubai.htm){:target="_blank" rel="noopener"}

### 지원 범위와 적용 대상
Cohere Command A Vision과 Cohere Embed 4가 UAE East(Dubai)에서 on-demand로 제공됩니다. 두 모델은 Dubai dedicated AI cluster에서도 사용할 수 있습니다.

## Cohere Command A Vision and Cohere Embed 4 on-demand models deprecated in Abu Dhabi
* **Services:** Generative AI
* **Release Date:** September 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/cohere-command-a-vision-embed-4-on-demand-deprecated-abudhabi.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/cohere-command-a-vision-embed-4-on-demand-deprecated-abudhabi.htm){:target="_blank" rel="noopener"}

### 종료 일정과 전환 대상
Abu Dhabi에서 Cohere Command A Vision과 Cohere Embed 4의 on-demand serving이 deprecated 되었으며 2026년 10월 21일 종료됩니다. 운영 endpoint는 대체 모델 또는 dedicated AI cluster 전환을 준비해야 합니다.

## Use xAI Grok 4.6 in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 10, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/xai-grok-4-6.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/xai-grok-4-6.htm){:target="_blank" rel="noopener"}

### 지원 범위와 적용 대상
OCI Generative AI에서 xAI Grok 4.6을 on-demand로 사용할 수 있습니다. coding·agent workflow·research workload의 모델 선택지가 확대됩니다.

## Import Alibaba Qwen3.8-27B and Qwen3.5-397B-A17B into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-8-27b-3-5-397b.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/alibaba-qwen-3-8-27b-3-5-397b.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-alibaba-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-alibaba-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
### 모델 등록과 제공 방식
Qwen/Qwen3.8-27B와 Qwen/Qwen3.5-397B-A17B 모델을 import하고 OCI Generative AI endpoint로 사용할 수 있습니다. 모델별 capability와 required shape를 확인해야 합니다.

### 적용 및 검증 포인트

두 모델은 각각의 capability와 required shape가 다를 수 있으므로 동일한 배포 조건으로 가정하면 안 됩니다. 대상 리전·shape·endpoint 상태를 모델별로 확인하고 inference test를 분리해 수행합니다.

## Import DeepSeek V4 Pro 0813 into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4-pro-0813.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/deepseek-v4-pro-0813.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-deepseek-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-deepseek-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
### 모델 등록과 제공 방식
deepseek-ai/DeepSeek-V4-Pro-0813을 OCI Generative AI에 import해 endpoint로 배포할 수 있습니다. 지원 capability와 cluster 요구사항을 배포 전 확인합니다.

### 적용 및 검증 포인트

import 전에 모델이 지원하는 capability와 dedicated AI cluster 요구사항을 확인합니다. endpoint 배포 뒤에는 입력 형식, 응답, quota 사용량을 시험 workload로 검증합니다.

## Import Google Gemma 4 31B IT into OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/google-gemma-4-31b-it.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/google-gemma-4-31b-it.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-google-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-google-models.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
### 모델 등록과 제공 방식
google/gemma-4-31b-it를 import하고 OCI Generative AI endpoint로 사용할 수 있습니다. 모델 import 대상 region과 deployment shape를 검토해야 합니다.

### 적용 및 검증 포인트

대상 리전과 deployment shape가 지원되는지 먼저 확인해야 합니다. model import와 endpoint 생성이 완료된 뒤 대표 요청으로 서비스 호환성을 검증합니다.

## Use Imported Models with the OCI Responses API in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** September 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/responses-api-for-imported-models-september-06-2026.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/responses-api-for-imported-models-september-06-2026.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-alibaba-models.htm#qwen-3-6](https://docs.oracle.com/iaas/Content/generative-ai/imported-alibaba-models.htm#qwen-3-6){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/imported-google-models.htm#gemma](https://docs.oracle.com/iaas/Content/generative-ai/imported-google-models.htm#gemma){:target="_blank" rel="noopener"}
### 모델 등록과 제공 방식
OCI Responses API에서 지정된 imported model을 호출할 수 있습니다. Model Import 기반 endpoint와 Responses API 지원 모델 목록을 구분해 integration을 구성해야 합니다.

### 호환성 확인

Responses API를 지원하는 imported model과 endpoint 구성을 먼저 확인해야 합니다. model capability·hardware shape·agentic region 조건이 맞지 않으면 endpoint를 만들 수 없으므로, 개발 환경에서 API 호출과 응답 형식을 확인한 뒤 통합합니다.

## Limit access to OCI Generative AI models with IAM policies
* **Services:** Generative AI
* **Release Date:** September 03, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/limit-model-access.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/limit-model-access.htm){:target="_blank" rel="noopener"}

* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/limit-model-access.htm](https://docs.oracle.com/iaas/Content/generative-ai/limit-model-access.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/generative-ai/home.htm](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="_blank" rel="noopener"}
### 모델 접근 제어
IAM policy의 target.model.id 조건으로 group이 사용할 Generative AI model ID를 allow·pattern·exclude 방식으로 제한할 수 있습니다. 모델별 접근 통제를 least privilege policy에 반영할 수 있습니다.

### 최소 권한 적용

target.model.id 조건은 group이 사용할 수 있는 model ID를 제한하는 IAM policy 조건입니다. allow·pattern·exclude 규칙을 적용하기 전 허용할 model ID 목록과 기존 application dependency를 확인하고, 제한된 사용자로 inference 요청을 시험해 접근 제어를 검증합니다.

## 용어 주석

- **Imported model**: OCI Generative AI에 가져온 모델을 endpoint로 배포해 사용하는 방식입니다. 모델별 capability·shape·리전 조건은 다를 수 있습니다. [OCI Generative AI imported models](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
- **Dedicated AI cluster**: imported model deployment에 사용하는 OCI Generative AI의 전용 실행 자원입니다. [OCI Generative AI imported models](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="_blank" rel="noopener"}
- **Routing profile**: on-demand inference 요청을 허용된 리전 범위에서 라우팅하기 위한 OCI Generative AI 구성입니다. [Routing profile 생성](https://docs.oracle.com/iaas/Content/generative-ai/create-routing-profile.htm){:target="_blank" rel="noopener"}
