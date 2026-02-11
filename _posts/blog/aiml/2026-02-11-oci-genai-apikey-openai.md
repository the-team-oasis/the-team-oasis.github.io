---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Generative AI"
title: "OCI GenAI API Key로 OpenAI SDK 그대로 활용하기"
teaser: "OCI Generative AI API Key를 생성하고 IAM 권한을 부여한 뒤, 기존 OpenAI 호출 코드를 수정 없이 OCI GenAI 엔드포인트에 연결하는 방법을 설명합니다."
author: yhcho
breadcrumb: true
categories:
  - aiml
tags:
  - [oci, genai, api key, openai, llm, grok, llama, gpt-oss]
#published: false

#
# Styling
#
header: no

# -------------- 내용 필독 -------------------
# 작성할 내용은 아래부터 작성
# 작성 방법
# 각 챕터별 제목은 "###"로 시작한다.
# 하위 제목은 "####"로 시작한다.
# Bold는 **글자**
# Bold + Italic은 ***글자***
# ------------------------------------------
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## 개요

OCI Generative AI 서비스는 **API Key** 인증을 지원합니다. 이 API Key를 사용하면 **OpenAI Python SDK**를 그대로 활용하면서 `base_url`만 OCI 엔드포인트로 바꿔 OCI에서 호스팅하는 LLM(Meta Llama, xAI Grok, OpenAI gpt-oss 등)을 호출할 수 있습니다. 기존 OpenAI 기반 코드나 서드파티 도구에서 HTTP 클라이언트 오버라이드를 지원하지 않는 경우에도 API Key 방식으로 쉽게 전환할 수 있습니다.

이 문서에서는 OCI GenAI API Key 소개, 생성·권한 부여 방법, 사용 가능 리전·모델, 그리고 OpenAI SDK·REST API·LangChain 등 활용 방안을 정리합니다.

---

### OCI GenAI API Key란

**OCI Generative AI API Key**는 OCI Generative AI 서비스 전용 인증용 **비밀 토큰(문자열)**입니다. 이 키로 OCI GenAI가 호스팅하는 대규모 언어 모델(LLM) 엔드포인트에 대한 호출자를 인증하고 접근을 허가합니다.

- **OCI IAM API Key와 다릅니다.** OCI IAM API Key는 공개/개인 키 쌍으로 테넌시 전체 접근에 사용되는 반면, GenAI API Key는 GenAI 서비스용 단일 시크릿 토큰입니다.
- 각 API Key에는 **두 개의 시크릿**(예: `key-one`, `key-two`)이 있습니다. 두 시크릿 모두 동일한 수준의 접근을 제공하며, 애플리케이션에서는 둘 중 아무 것이나 **Authorization** 헤더에 넣어 사용할 수 있습니다.
- **리전 제약**: API Key는 사용하려는 **모델과 동일한 리전**에 생성되어 있어야 합니다.

자세한 내용은 [OCI 문서 - API Keys](https://docs.oracle.com/en-us/iaas/Content/generative-ai/api-keys.htm)를 참조하세요.

---

### API Key 생성 방법 및 주의사항

#### 생성 절차

1. OCI 콘솔에서 **Analytics & AI → Generative AI**로 이동합니다.
   ![genai menu](/assets/img/aiml/2026/genai-apikey/genai-menu.png)

2. 왼쪽 메뉴에서 **API Keys**를 선택한 뒤 **Create API key**를 클릭합니다.
   ![genai apikey](/assets/img/aiml/2026/genai-apikey/genai-apikey.png)
   ![genai apikey create](/assets/img/aiml/2026/genai-apikey/genai-apikey-create-1.png)

3. 이름, 설명(선택), 컴파트먼트를 입력하고, 필요 시 두 시크릿에 대한 이름·만료일을 설정합니다.
   ![genai apikey create](/assets/img/aiml/2026/genai-apikey/genai-apikey-create-2.png)
   ![genai apikey create](/assets/img/aiml/2026/genai-apikey/genai-apikey-create-3.png)

4. **Create** 후 표시되는 **시크릿 값(key-one, key-two)**을 **즉시 복사해 안전한 곳에 보관**합니다. 생성 직후에만 표시되며, 이후에는 다시 볼 수 없습니다.
   ![genai apikey create](/assets/img/aiml/2026/genai-apikey/genai-apikey-create-4.png)

#### 주의사항

- **시크릿은 한 번만 표시됩니다.** 새로 생성하거나 재생성한 시크릿은 반드시 바로 복사해 비밀 관리자(Secrets Manager) 등에 저장하세요.
- **리전 일치**: API Key를 생성한 리전과 호출할 모델이 제공되는 리전이 같아야 합니다.
- **만료일**: 두 시크릿에 만료일을 설정해 주기적으로 키를 갱신하는 것을 권장합니다.
- **보안**: 소스 코드에 커밋하거나 클라이언트 측 코드에 넣지 말고, 승인된 비밀 관리자에만 저장하세요.

API Key 생성 상세 단계는 [Create an API key](https://docs.oracle.com/en-us/iaas/Content/generative-ai/create-api-key.htm) 문서를 참조하세요.

---

### API Key 생성 후 권한 부여 방법

API Key만 생성해서는 호출이 거부됩니다. **OCI IAM 정책**으로 해당 API Key에 GenAI 사용 권한을 부여해야 합니다.

1. **Identity & Security → Policies**로 이동합니다.
2. 적절한 구획(또는 테넌시)에 정책을 만들거나 편집합니다.
3. 아래와 같은 문장을 추가합니다.

**특정 API Key만 허용하는 경우** (해당 API Key OCID로 제한):

```text
allow any-user to use generative-ai-family in compartment <compartment-name> where ALL { request.principal.type='generativeaiapikey', request.principal.id='ocid1.generativeaiapikey.oc1.us-chicago-1....' }
```

**해당 구획의 모든 GenAI API Key를 허용하는 경우**:

```text
allow any-user to use generative-ai-family in compartment <compartment-name> where ALL { request.principal.type='generativeaiapikey' }
```

- `<compartment-name>`은 실제 사용하는 구획 이름으로 바꿉니다.
- API Key OCID는 콘솔 **Generative AI → API Keys**에서 해당 키 상세 화면에서 확인할 수 있습니다.

자세한 내용은 [Add API Key Permission](https://docs.oracle.com/en-us/iaas/Content/generative-ai/add-api-permission.htm)을 참조하세요.

---

### API Key 사용 가능 리전 및 LLM 모델

#### 지원 리전 (OpenAI SDK 기준)

API Key로 사용할 수 있는 OCI 리전은 다음과 같이 제한됩니다.

| 리전                        |
| --------------------------- |
| Germany Central (Frankfurt) |
| India South (Hyderabad)     |
| Japan Central (Osaka)       |
| US East (Ashburn)           |
| US Midwest (Chicago)        |
| US West (Phoenix)           |

모델별 사용 가능 리전은 각 모델 카드 문서([Meta Llama](https://docs.oracle.com/en-us/iaas/Content/generative-ai/meta-models.htm), [xAI Grok](https://docs.oracle.com/en-us/iaas/Content/generative-ai/xai-models.htm), [OpenAI gpt-oss](https://docs.oracle.com/en-us/iaas/Content/generative-ai/openai-models.htm))에서 확인한 뒤, **위 6개 리전과 교집합**인 리전을 선택하면 됩니다. Dedicated 모드의 경우 퍼블릭·프라이빗 엔드포인트 모두 지원됩니다.

#### 지원 모델

- **Chat Completions API**: Meta Llama, xAI Grok, OpenAI gpt-oss
- **Responses API**: xAI Grok, OpenAI gpt-oss (Meta Llama는 Responses API 미지원)

xAI Grok 모델은 OCI 데이터센터 내 xAI 전용 테넌시에서 호스팅되며, OCI GenAI 서비스를 통해 접근합니다.

---

### API Key 활용 방안

#### 1. OpenAI SDK로 기존 파이썬 코드 그대로 활용

기존 OpenAI용 코드에서 **`api_key`**와 **`base_url`**만 바꾸면 OCI GenAI를 사용할 수 있습니다. 다른 코드는 수정하지 않아도 됩니다.

**base_url 형식:**

```text
https://inference.generativeai.<region-identifier>.oci.oraclecloud.com/20231130/actions/v1
```

예: Chicago 리전 → `https://inference.generativeai.us-chicago-1.oci.oraclecloud.com/20231130/actions/v1`

**예제 (Chat Completions + Responses API):**

```python
from openai import OpenAI
import os

API_KEY = os.getenv("OPENAI_API_KEY")

client = OpenAI(
    api_key=API_KEY,
    base_url="https://inference.generativeai.us-chicago-1.oci.oraclecloud.com/20231130/actions/v1"
)

# Responses API
response = client.responses.create(
    model="openai.gpt-oss-120b",
    input="Write a one-sentence bedtime story about a unicorn."
)
print(response)

# Chat Completions API
response = client.chat.completions.create(
    model="xai.grok-3",
    # model="meta.llama-3.3-70b-instruct",
    # model="openai.gpt-oss-120b",
    messages=[{
        "role": "user",
        "content": "Write a one-sentence bedtime story about a unicorn."
    }]
)
print(response)
```

환경 변수 `OPENAI_API_KEY`에 OCI GenAI API Key 시크릿 값을 넣어 두면, 기존 OpenAI 예제와 동일한 방식으로 사용할 수 있습니다.

#### 2. REST API / curl로 호출

HTTP 클라이언트나 스크립트에서 REST로 호출할 때는 **Authorization: Bearer &lt;API Key 시크릿&gt;** 헤더를 사용합니다.

**Chat Completions 엔드포인트:**

```text
https://inference.generativeai.<region-identifier>.oci.oraclecloud.com/20231130/actions/v1/chat/completions
```

**Responses 엔드포인트:**

```text
https://inference.generativeai.<region-identifier>.oci.oraclecloud.com/20231130/actions/v1/responses
```

**curl 예제:**

```bash
curl --location 'https://inference.generativeai.us-chicago-1.oci.oraclecloud.com/20231130/actions/v1/chat/completions' \
  --header 'Authorization: Bearer sk-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
  --header 'Content-Type: application/json' \
  --data '{
    "model": "xai.grok-4",
    "messages": [
      {
        "role": "user",
        "content": "What'\''s the capital of France?"
      }
    ]
  }'
```

#### 3. LangChain과 연동

[oci-openai](https://github.com/oracle-samples/oci-openai) 저장소에서는 **API Key**로 네이티브 OpenAI 클라이언트를 쓰는 방식을 권장합니다. LangChain의 `ChatOpenAI`에서도 `api_key`와 `base_url`만 OCI GenAI로 설정하면 됩니다.

```python
from langchain_openai import ChatOpenAI

llm = ChatOpenAI(
    model="xai.grok-4-fast-reasoning",
    api_key="<OCI GenAI API Key 시크릿>",
    base_url="https://inference.generativeai.us-chicago-1.oci.oraclecloud.com/20231130/actions/v1",
)

response = llm.invoke("Hello, translate this to French.")
print(response)
```

환경 변수로 API Key를 넣을 경우 `os.getenv("OPENAI_API_KEY")`를 사용하면 됩니다.

#### 4. OCI 리소스/인스턴스 인증이 필요한 경우 (oci-openai 패키지)

**사용자/리소스/컴퓨트 인스턴스 단위 인증**이 필요하면 API Key 대신 **oci-openai** Python 패키지를 사용할 수 있습니다. 이 경우 `http_client`를 OCI 인증(예: `OciSessionAuth`, `OciResourcePrincipalAuth`, `OciInstancePrincipalAuth`)으로 패치해 사용합니다.  
API Key 방식은 **기존 OpenAI 코드를 최소한으로만 수정**하고 싶을 때, 또는 HTTP 클라이언트 오버라이드를 지원하지 않는 서드파티와 연동할 때 유리합니다.

- 설치: `pip install oci-openai`
- 사용 예 및 Signer 종류: [oracle-samples/oci-openai](https://github.com/oracle-samples/oci-openai) README 참조.

---

### 키 로테이션(교체) 및 관리

- **두 시크릿 활용**: 먼저 사용하지 않던 시크릿(예: key-two)을 활성화하고 애플리케이션을 그 시크릿으로 전환한 뒤, 이전 시크릿을 비활성화(Deactivate) 또는 폐기(Revoke)할 수 있습니다. Revoke는 영구적이며 되돌릴 수 없습니다.
- **일시 중단/조사**: Deactivate; **유출·영구 폐기**: Revoke를 사용하는 것이 좋습니다.
- 콘솔 또는 API의 **SetApiKeyState** 등으로 상태 변경이 가능합니다. 상세 단계는 [Managing API Keys](https://docs.oracle.com/en-us/iaas/Content/generative-ai/api-keys.htm#manage)를 참조하세요.

---

### 제한 및 모범 사례

- **기본 한도**: 테넌시당 API Key 100개. 증설 시 [서비스 한도 증설](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits-request-increase.htm)에서 `api-key-count`로 요청할 수 있습니다.
- **모범 사례**
  - 시크릿은 승인된 비밀 관리자에만 저장하고, 소스 코드·클라이언트 코드에 두지 않기.
  - 두 시크릿 구조로 무중단 로테이션하고, 만료일을 설정해 주기적으로 갱신.
  - 구획과 최소 권한 정책으로 접근 제한.
  - 사용량 모니터링·알림 설정, 이상 징후 시 즉시 키 로테이션.

---

## 마무리

OCI GenAI **API Key**를 사용하면 기존 **OpenAI SDK** 기반 파이썬 코드를 거의 그대로 두고 `base_url`과 `api_key`만 OCI 엔드포인트·키로 바꿔 Meta Llama, xAI Grok, OpenAI gpt-oss 등을 호출할 수 있습니다. REST API, curl, LangChain 연동도 동일한 API Key로 가능합니다. 리전·모델 제한과 IAM 권한만 확인하면 됩니다.

## 참고

- [OCI Generative AI - API Keys](https://docs.oracle.com/en-us/iaas/Content/generative-ai/api-keys.htm)
- [Create an API key](https://docs.oracle.com/en-us/iaas/Content/generative-ai/create-api-key.htm)
- [Add API Key Permission](https://docs.oracle.com/en-us/iaas/Content/generative-ai/add-api-permission.htm)
- [Oracle GitHub - oci-openai](https://github.com/oracle-samples/oci-openai) (API Key 사용 예제 및 oci-openai 패키지)
