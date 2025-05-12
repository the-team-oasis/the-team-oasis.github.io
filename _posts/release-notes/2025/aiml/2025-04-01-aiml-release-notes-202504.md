---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "4월 OCI AI/ML 업데이트 소식"
teaser: "2025년 4월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Apr-2025
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

# Data Science

## Data Science AI Quick Actions Model Reference

- **Services:** Data Science
- **Release Date:** April 11, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-models.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-models.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

#### Native Support for Model By Reference

**데이터 사이언스**는 이제 **자신의 Object Storage 버킷**에 모델 아티팩트를 등록할 수 있는 옵션을 제공합니다. 이 릴리스에서는 **네이티브 API**를 통해 이 기능을 사용할 수 있습니다.

**주요 이점:**

- **유지 관리성** 향상
- 대형 모델의 경우 모델 복사 과정에서 발생하는 **추가 비용 절감**
- **규정 준수 요구사항** 충족
- **각 테넌시의 OSS 버킷**에 있는 모델 등록 가능

#### Model Metadata Storage Enhancement

**AI 퀵 액션 메타데이터**는 이제 **모델 카탈로그**에 저장됩니다. 또한 **사용자 정의 키워드**를 기반으로 한 메타데이터 검색 지원이 추가되었습니다.

**주요 기능:**

- 모델 생성 시 **사용자 정의 키워드** 정의 가능
- 키워드 기반 모델 검색 지원
- 메타데이터 관리 효율성 향상

#### Service Models Accessibility

**서비스 관리 모델 컴파트먼트**에 있는 **서비스 관리 모델**에 **네이티브 API**를 통해 **추가 권한 없이** 접근할 수 있습니다.

**주요 특징:**

- **Fine-tuning, 특징 추출, 벤치마킹, 신속한 프로토타이핑** 등 다양한 작업에 적응 가능
- **기반 모델** 역할 수행
- **services-managed-models**에 부여된 **oss-read 권한** 제한
- **최소 권한 액세스** 적용으로 보안 강화
- 모델 저장소 데이터의 불필요한 노출 제한
- **규정 준수 및 액세스 제어** 모범 사례 준수

**관련 문서:**

- [콘솔에서 모델 생성 및 저장하기](https://docs.oracle.com/iaas/Content/data-science/using/manage-models.htm#create-model){:target="\_blank" rel="noopener"}
- [모델 편집하기](https://docs.oracle.com/iaas/Content/data-science/using/manage-models.htm#edit-model){:target="\_blank" rel="noopener"}

## Data Science AI Quick Actions v 1.0.6.d

- **Services:** Data Science
- **Release Date:** April 18, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-106-d.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-106-d.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

Data Science AI Quick Actions v 1.0.6.d에는 다음 내용이 포함됩니다:

- vLLM 서비스 관리 컨테이너가 버전 0.8.3으로 업그레이드되었습니다. AI Quick Actions 버전은 v 1.0.6.d입니다.
- Phi 4와 Phi 3.5가 서비스 캐시 모델로 추가되었습니다:
  - microsoft/phi-4-gguf
  - microsoft/phi-4
  - microsoft/Phi-3.5-vision-instruct
  - microsoft/Phi-3.5-MoE-instruct
  - microsoft/Phi-3.5-mini-instruct

## Data Science AI Quick Actions v 1.0.7

- **Services:** Data Science
- **Release Date:** April 25, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-107.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-107.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

Data Science AI Quick Actions v 1.0.7에는 다음 기능이 포함됩니다:

- **멀티 모델 배포**: 이제 단일 인스턴스에 여러 LLM 모델을 배포할 수 있습니다. 추론 요청은 LiteLLM을 통해 동적으로 라우팅되어, 사용자가 재배포 없이 런타임에 모델을 선택할 수 있습니다.
- UI 개선

자세한 내용은 [멀티모델 배포 팁](https://github.com/oracle-samples/oci-data-science-ai-samples/blob/main/ai-quick-actions/multimodel-deployment-tips.md)을 참고하세요.

## Data Science now Supports ML Applications

- **Services:** Data Science
- **Release Date:** April 25, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-107.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-107.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

ML Applications는 Data Science에서 ML 사용 사례를 독립적으로 표현하는 새로운 기능입니다.

ML Applications는 AI/ML 제공을 위한 강력한 MLOps 플랫폼을 제공하는 Data Science의 새로운 기능입니다. 이는 AI/ML 기능의 패키징과 배포를 표준화하여, 기계 학습을 서비스로 구축, 배포 및 운영할 수 있게 합니다. ML Applications를 통해 Data Science를 활용하여 AI/ML 사용 사례를 구현하고 애플리케이션이나 고객을 위한 프로덕션 환경에 프로비저닝할 수 있습니다. 개발 생명주기를 수개월에서 수주로 단축함으로써, ML Applications는 출시 시간을 단축하고 운영 복잡성과 총 소유 비용을 줄입니다. 개발, QA부터 사전 프로덕션 및 프로덕션까지 모든 단계에서 ML 솔루션을 배포, 검증 및 승격하기 위한 엔드투엔드 플랫폼을 제공합니다.

자세한 내용은 [ML Applications](https://docs.oracle.com/iaas/data-science/using/ml-apps-about.htm) 문서를 참고하세요.

---

# Generative AI

## Add AI Guardrails to OCI Generative AI Model Endpoints

- **Services:** Generative AI
- **Release Date:** April 16, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/ai-guardrails.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/ai-guardrails.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

이제 OCI Generative AI 모델 엔드포인트에 AI guardrails를 추가할 수 있습니다. AI guardrails는 기업용 사용 사례를 위해 설계된 안전 및 거버넌스 기능 세트로, 모델 동작 조정, 민감한 콘텐츠 보호, 비즈니스 및 규정 준수 요구사항에 맞는 출력 정렬에 도움을 줍니다.

**주요 기능:**

**콘텐츠 조정 필터**
AI guardrails는 혐오 발언, 괴롭힘, 폭력, 노골적인 자료를 포함한 유해한 콘텐츠를 분류하는 것을 목표로 합니다. 이러한 필터는 사용자 쿼리와 AI 응답에 적용될 수 있으며, 시스템에 들어오거나 나가는 안전하지 않은 콘텐츠로부터 보호하기 위한 제어 기능을 제공합니다. 내부 조정 모델이 유해한 콘텐츠 식별을 위한 분류를 수행합니다.

**프롬프트 주입 및 Jailbreak 방지**
AI guardrails는 프롬프트 주입 공격을 통해 AI 안전 지침을 무시하려는 시도를 감지하는 데 도움을 줍니다. 시스템은 사용자 프롬프트나 임베디드 컨텍스트 내의 악의적인 지침을 스캔하여 무단 모델 동작을 방지합니다. 이 기능은 업로드된 문서 내의 숨겨진 지침과 같은 직접적 및 간접적 공격으로부터 보호하는 것을 목표로 합니다.

**개인정보 및 PII 보호**
AI guardrails는 입력과 출력 모두에서 개인 식별 정보(PII)를 식별하는 것을 목표로 합니다. 사전 정의된 감지기는 이름, 전화번호, 이메일, 주소와 같은 민감한 데이터를 인식합니다. 이 기능은 의도하지 않은 데이터 유출을 방지하고 업계 표준을 준수하는 것을 목표로 합니다.

**API 기반 Guardrail 적용**
엔드포인트에 guardrails를 추가하면, 보안 API 기반 guardrail 적용을 통해 guardrails가 OCI Generative AI 모델에 직접 통합됩니다. 실시간 조정을 지원합니다.

**콘텐츠 조정**

- Off: 콘텐츠 조정을 적용하지 않고 노골적인 콘텐츠를 출력합니다.
- Block: 콘텐츠 조정을 식별하고 적용하는 데 도움을 줍니다.
- Inform: 콘텐츠 조정을 적용하지 않지만, 모델이 조정이 필요한 콘텐츠를 감지하면 사용자에게 알리도록 합니다.

**프롬프트 주입(PI) 보호**

- Off: PI 보호를 적용하지 않고 제한 없는 입력을 허용합니다.
- Block: 프롬프트 주입을 식별하고 보호하는 데 도움을 줍니다.
- Inform: PI 보호를 적용하지 않지만, 모델이 PI 보호가 필요한 콘텐츠를 감지하면 사용자에게 알리도록 합니다.

**개인 식별 정보(PII) 보호**

- Off: PII 보호를 적용하지 않고 데이터 노출 제한 없이 콘텐츠를 출력합니다.
- Block: 응답에서 개인 데이터를 제거하는 등 PII를 식별하고 보호하는 데 도움을 줍니다.
- Inform: PII 보호를 적용하지 않지만, 모델이 PII 보호가 필요한 콘텐츠를 감지하면 사용자에게 알리도록 합니다.

## Add Safety Modes to Cohere Models in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** April 16, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/safety-modes.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/safety-modes.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

이제 OCI Generative AI Cohere 모델의 채팅 세션 중에 선택적 안전 모드를 추가할 수 있습니다. 이 매개변수는 모델의 생성된 응답에 안전 지침을 추가합니다.

**안전 모드 옵션**

- **Strict**: 폭력적이거나 성적인 행위, 욕설과 같은 민감한 주제를 피하는 것을 목표로 합니다. 이 모드는 부적절하다고 판단되는 응답이나 권장사항을 금지하여 더 안전한 경험을 제공하는 것을 목표로 합니다. Strict 모드는 기업 커뮤니케이션 및 고객 서비스와 같은 기업용에 적합합니다.
- **Contextual**: 출력에 대해 Strict 모드보다 적은 제약을 둡니다. 유해하거나 불법적인 제안을 거부하는 핵심 보호 기능을 유지하면서, 욕설과 일부 유해한 콘텐츠, 성적으로 노골적이고 폭력적인 콘텐츠, 의료, 금융 또는 법적 정보를 포함하는 콘텐츠를 허용합니다. Contextual 모드는 엔터테인먼트, 창의적 또는 학술적 용도에 적합합니다.

**사용 가능한 모델**
이 기능은 `cohere.command-r-08-2024`, `cohere.command-r-plus-08-2024` 및 이러한 모델 이후에 출시된 Cohere 모델에서만 사용할 수 있습니다. [모델 출시 날짜](https://docs.oracle.com/iaas/Content/generative-ai/deprecating.htm)를 참고하세요.

안전 모드에 대한 자세한 내용은 [Generative AI에서 채팅하기](https://docs.oracle.com/iaas/Content/generative-ai/use-playground-chat.htm#chat)를 참고하세요. 서비스에 대한 자세한 내용은 [Generative AI 문서](https://docs.oracle.com/iaas/Content/generative-ai/home.htm)를 참고하세요.

---

# Generative AI Agents

## OCI Generative AI Agents Available in Brazil East (Sao Paulo) Region

- **Services:** Generative AI Agents
- **Release Date:** April 09, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-region-saopaulo.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai-agents/new-region-saopaulo.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

이제 **OCI Generative AI Agents**는 **브라질 동부(상파울루) 리전**에서 사용할 수 있습니다.

**관련 문서:**

- [Generative AI Agents가 지원하는 리전](https://docs.oracle.com/iaas/Content/generative-ai-agents/regions.htm){:target="\_blank" rel="noopener"}
- [Generative AI Agents 문서](https://docs.oracle.com/iaas/Content/generative-ai-agents/home.htm){:target="\_blank" rel="noopener"}
