---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI AI/ML 업데이트 소식"
teaser: "2026년 7월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2026-aiml
tags:
  - oci-release-notes-2026
  - Jul-2026
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


## New Hardware Unit Shapes Available for Cohere and Meta Models in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** July 30, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/cohere-meta-hardware-shapes.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/cohere-meta-hardware-shapes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 Cohere 및 Meta 모델에 사용할 수 있는 새로운 hardware unit shape가 제공됩니다. 모델별 성능과 비용 특성에 맞춰 배포 구성을 선택할 수 있는 폭이 넓어졌습니다.

### 운영 시 참고 사항

Shape 선택은 처리량, latency, 비용에 영향을 줍니다. 모델별 권장 shape와 예상 요청량을 기준으로 사전 부하 테스트를 수행하는 것이 좋습니다.

## Background Mode Available for the OCI Responses API
* **Services:** Generative AI
* **Release Date:** July 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/responses-api-background-mode.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/responses-api-background-mode.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Responses API에서 Background Mode를 사용할 수 있습니다. 오래 걸리는 생성 작업을 비동기 흐름으로 처리해 클라이언트 대기 시간을 줄일 수 있습니다.

### 운영 시 참고 사항

비동기 작업은 상태 조회, timeout, 재시도, 결과 보관 정책이 중요합니다. 애플리케이션에서는 작업 ID 관리와 실패 처리 로직을 함께 설계해야 합니다.

## Expanded On-Demand Model Availability in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** July 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/expanded-on-demand-model-availability.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/expanded-on-demand-model-availability.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI의 on-demand model 가용 범위가 확대되었습니다. 별도 전용 용량 없이도 더 많은 모델을 바로 호출할 수 있습니다.

### 운영 시 참고 사항

On-demand 방식은 시작이 빠르지만 quota, 리전별 가용성, 요청 한도 영향을 받습니다. 운영 워크로드는 dedicated serving 옵션과 비용·성능을 비교하는 것이 좋습니다.

## H100 Multi-Node Serving Now Available for Model Import in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** July 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/h100-multinode-imported-models.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/h100-multinode-imported-models.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI의 model import에서 H100 multi-node serving을 사용할 수 있습니다. 대형 모델을 여러 GPU 노드에 분산해 서빙할 수 있는 구성이 가능해졌습니다.

### 운영 시 참고 사항

Multi-node serving은 네트워크 성능, GPU 용량, 모델 크기, serving 병렬화 전략이 중요합니다. 비용 영향이 크므로 사전 용량 산정과 성능 검증이 필요합니다.

## Use OCI IAM Authentication for Hosted Application Endpoints in OCI Generative AI
* **Services:** Generative AI
* **Release Date:** July 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/generative-ai/hosted-applications-iam.htm](https://docs.oracle.com/iaas/releasenotes/generative-ai/hosted-applications-iam.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI의 hosted application endpoint에서 OCI IAM 인증을 사용할 수 있습니다. 애플리케이션 엔드포인트 접근을 OCI IAM 정책과 통합해 제어할 수 있습니다.

### 운영 시 참고 사항

IAM 인증 적용 시 principal, policy, compartment 범위를 최소 권한으로 구성해야 합니다. 기존 API key 또는 별도 인증 방식과 병행할 경우 접근 경로를 명확히 구분해야 합니다.

## New Experience in Oracle Cloud Console
* **Services:** Speech
* **Release Date:** July 15, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/speech/console-experience.htm](https://docs.oracle.com/iaas/releasenotes/speech/console-experience.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Speech 서비스에 새로운 Console Experience가 적용되었습니다. 리소스 목록, 상세 화면, 생성 워크플로우가 OCI Console의 최신 경험에 맞춰 개선됩니다.

### 운영 시 참고 사항

콘솔 UI 변경은 내부 가이드와 스크린샷에 영향을 줄 수 있습니다. 운영 절차서나 교육 자료의 메뉴 경로와 화면 캡처를 업데이트하는 것이 좋습니다.
