---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "11월 OCI AI/ML 업데이트 소식"
teaser: "2025년 11월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2025-aiml
tags:
  - oci-release-notes-2025
  - Nov-2025
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

## Access OpenAI gpt-oss models in OCI Generative AI

- **Services:** Generative AI
- **Release Date:** November 18, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/openai-gpt-oss.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/openai-gpt-oss.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

OCI Generative AI에서 추론(Reasoning) 및 에이전틱(Agentic) 작업에 특화된 OpenAI gpt-oss 모델을 지원합니다.

주요 내용:

- **openai.gpt-oss-120b**: 복잡한 대규모 추론 작업에 적합
- **openai.gpt-oss-20b**: 낮은 지연시간이 필요한 경량 워크로드에 적합
- On-Demand 방식과 Dedicated AI 클러스터 엔드포인트 배포 방식 모두 지원

자세한 내용은 [Generative AI 문서](https://docs.oracle.com/iaas/Content/generative-ai/openai-models.htm){:target="\_blank" rel="noopener"} 참고.

---

## Import Your Own Models into OCI Generative AI

- **Services:** Generative AI
- **Release Date:** November 12, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/imported-models.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/imported-models.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

Hugging Face 또는 OCI Object Storage 버킷(Hugging Face 형식)에 있는 LLM을 OCI Generative AI로 가져와 엔드포인트로 배포할 수 있습니다.

주요 내용:

- Hugging Face에서 직접 모델 Import
- OCI Object Storage 버킷에 저장된 모델(Hugging Face 형식) Import
- Import한 모델로 엔드포인트 생성 및 배포
- 기존 보유 모델을 OCI 인프라에서 운영 가능

관련 문서:
- [지원 모델 목록](https://docs.oracle.com/iaas/Content/generative-ai/imported-models.htm){:target="\_blank" rel="noopener"}
- [Import 가이드](https://docs.oracle.com/iaas/Content/generative-ai/manage-imported-models.htm){:target="\_blank" rel="noopener"}
- [서비스 개요](https://docs.oracle.com/iaas/Content/generative-ai/home.htm){:target="\_blank" rel="noopener"}

---

## Use OpenAI Compatible SDKs with OCI Generative AI Models

- **Services:** Generative AI
- **Release Date:** November 05, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/oci-openai.htm](https://docs.oracle.com/en-us/iaas/releasenotes/generative-ai/oci-openai.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

OpenAI SDK 호환 Python 라이브러리 **oci-openai**가 출시되었습니다. 기존 OpenAI SDK 기반 코드를 최소한의 수정으로 OCI Generative AI 및 Data Science Model Deployment에서 사용할 수 있습니다.

주요 내용:

- OpenAI 호환 SDK로 OCI Generative AI 모델 호출
- OCI Data Science Model Deployment 엔드포인트 호출 지원
- OCI 인증 자동 처리 (Session, Resource Principal, Instance Principal, User Principal)
- 동기/비동기 클라이언트 지원 (`OciOpenAI`, `AsyncOciOpenAI`)
- LangChain 연동 지원 (`langchain-openai`)
- **참고:** Cohere 모델은 OpenAI 호환 API 미지원

### 지원 인증 방식

| 인증 방식 | 클래스명 | 사용 환경 |
|----------|---------|----------|
| Session Token | `OciSessionAuth` | 로컬 개발 환경 (OCI CLI 설정 필요) |
| Resource Principal | `OciResourcePrincipalAuth` | OCI Functions, Data Flow 등 RP 지원 서비스 |
| Instance Principal | `OciInstancePrincipalAuth` | OCI Compute 인스턴스 (Dynamic Group 정책 필요) |
| User Principal (API Key) | `OciUserPrincipalAuth` | 서비스 계정/자동화 환경 |

### 설치 방법

```bash
pip install oci-openai
```

### 사용 예시

**1. OCI Generative AI - 동기 클라이언트**

```python
from oci_openai import OciOpenAI, OciSessionAuth

client = OciOpenAI(
    base_url="https://inference.generativeai.us-chicago-1.oci.oraclecloud.com/20231130/actions/v1",
    auth=OciSessionAuth(profile_name="DEFAULT"),
    compartment_id="<compartment_ocid>",
)

completion = client.chat.completions.create(
    model="meta.llama-3.1-70b-instruct",  # Cohere 모델 제외
    messages=[
        {"role": "user", "content": "Python으로 디렉토리의 모든 파일을 출력하는 방법은?"},
    ],
)
print(completion.model_dump_json())
```

**2. OCI Generative AI - 비동기 클라이언트**

```python
from oci_openai import AsyncOciOpenAI, OciSessionAuth

client = AsyncOciOpenAI(
    base_url="https://inference.generativeai.us-chicago-1.oci.oraclecloud.com/20231130/actions/v1",
    auth=OciSessionAuth(profile_name="DEFAULT"),
    compartment_id="<compartment_ocid>",
)

completion = await client.chat.completions.create(
    model="meta.llama-3.1-70b-instruct",
    messages=[
        {"role": "user", "content": "Hello, how are you?"},
    ],
)
print(completion.model_dump_json())
```

**3. OCI Data Science Model Deployment**

```python
from oci_openai import OciOpenAI, OciSessionAuth

client = OciOpenAI(
    base_url="https://modeldeployment.us-ashburn-1.oci.customer-oci.com/<OCID>/predict/v1",
    auth=OciSessionAuth(profile_name="DEFAULT")
)

response = client.chat.completions.create(
    model="<model-name>",
    messages=[
        {"role": "user", "content": "Explain how to list all files in a directory using Python."},
    ],
)
print(response.model_dump_json())
```

**4. LangChain 연동**

```python
from langchain_openai import ChatOpenAI
import httpx
from oci_openai import OciUserPrincipalAuth

llm = ChatOpenAI(
    model="meta.llama-3.1-70b-instruct",
    api_key="OCI",
    base_url="https://inference.generativeai.us-chicago-1.oci.oraclecloud.com/20231130/actions/v1",
    http_client=httpx.Client(
        auth=OciUserPrincipalAuth(profile_name="DEFAULT"),
        headers={"CompartmentId": "<compartment_ocid>"}
    ),
)

messages = [
    ("system", "You are a helpful assistant that translates English to Korean."),
    ("human", "I love programming."),
]
ai_msg = llm.invoke(messages)
print(ai_msg)
```

**5. 네이티브 OpenAI 클라이언트 사용**

```python
import httpx
from openai import OpenAI
from oci_openai import OciSessionAuth

client = OpenAI(
    api_key="OCI",
    base_url="https://inference.generativeai.us-chicago-1.oci.oraclecloud.com/20231130/actions/v1",
    http_client=httpx.Client(
        auth=OciSessionAuth(profile_name="DEFAULT"),
        headers={"CompartmentId": "<compartment_ocid>"}
    ),
)

completion = client.chat.completions.create(
    model="meta.llama-3.1-70b-instruct",
    messages=[
        {"role": "user", "content": "How do I output all files in a directory using Python?"},
    ],
)
print(completion.model_dump_json())
```

**6. 인증 방식 선택**

```python
from oci_openai import (
    OciOpenAI,
    OciSessionAuth,           # 로컬 개발 환경
    OciResourcePrincipalAuth, # OCI 서비스 (Functions 등)
    OciInstancePrincipalAuth, # OCI Compute 인스턴스
    OciUserPrincipalAuth,     # API Key 기반
)

# 1) Session (로컬 개발; ~/.oci/config + 세션 토큰 사용)
session_auth = OciSessionAuth(profile_name="DEFAULT")

# 2) Resource Principal (OCI Functions, Data Flow 등)
rp_auth = OciResourcePrincipalAuth()

# 3) Instance Principal (OCI Compute 인스턴스)
ip_auth = OciInstancePrincipalAuth()

# 4) User Principal (~/.oci/config의 API Key 사용)
up_auth = OciUserPrincipalAuth(profile_name="DEFAULT")
```

관련 링크:
- [공식 문서](https://docs.oracle.com/iaas/Content/generative-ai/oci-openai.htm){:target="\_blank" rel="noopener"}
- [GitHub 레포지토리](https://github.com/oracle-samples/oci-openai){:target="\_blank" rel="noopener"}
- [PyPI 패키지](https://pypi.org/project/oci-openai/){:target="\_blank" rel="noopener"}

---

# Data Science

## Data Science AI Quick Actions v 2.0

- **Services:** Data Science
- **Release Date:** November 12, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-20.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/ai-quick-actions-20.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

AI Quick Actions v2.0이 출시되었습니다. OpenAI 엔드포인트 배포, Llama 4 파인튜닝, Stacked Deployment 등 여러 기능이 추가되었습니다.

주요 내용:

- **OpenAI 엔드포인트 모델 배포**: 여러 OpenAI 엔드포인트로 모델 배포, 스트리밍 및 고급 파라미터 지원
- **Stacked Model Deployment**: 여러 파인튜닝 모델이 베이스 모델 배포를 공유하여 GPU 효율 향상
- **Quantization 지원**: 메모리 사용량 감소로 작은 Shape의 Compute 에서도 LLM 배포 가능
- **Llama 4 Fine-Tuning 지원**: Llama 4 모델 파인튜닝
- **vLLM 0.11 / llama.cpp 0.3.16 지원**

자세한 내용은 [AI Quick Actions 모델 문서](https://docs.oracle.com/iaas/Content/data-science/using/ai-quick-actions-models.htm){:target="\_blank" rel="noopener"} 참고.

---

## Data Science now Supports JupyterLab 4.4.6

- **Services:** Data Science
- **Release Date:** November 04, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/data-science/juptyerlab446.htm](https://docs.oracle.com/en-us/iaas/releasenotes/data-science/juptyerlab446.htm){:target="\_blank" rel="noopener"}

### 업데이트 내용

Data Science 노트북 세션에서 JupyterLab 4.4.6을 지원합니다. 기존 JupyterLab 3.6.6에서 메이저 버전 업그레이드입니다.

주요 내용:

- 신규 노트북은 JupyterLab 4.4.6 자동 적용
- 기존 노트북은 Deactivate/Reactivate로 수동 업그레이드 필요
- JupyterLab 3.x는 유지보수 종료(End of maintenance) 예정으로 4.x 업그레이드 권장

### 3.x → 4.x 주요 변경 사항

**성능 개선**
- CSS 최적화 및 CodeMirror 6 업그레이드로 편집기 반응성 향상
- MathJax 3 적용
- Notebook windowing: 화면에 보이는 셀만 렌더링하여 대용량 노트북 로딩/스크롤 성능 개선

**확장(Extension) 호환성**
- 4.x에서 확장 API 변경이 있어 일부 확장은 업데이트 필요
- 기존 사용 중인 확장이 4.x 호환되는지 확인 권장

**4.4.6 버그 픽스 (4.4 라인 안정화 패치)**
- 셀 split 시 커널 연결 유지 이슈 수정
- 파일 브라우저 preferredDir 네비게이션 버그 수정
- 상태바 탭 순서 개선
- 특정 ipykernel 버전 디버거 회귀 대응

### 업그레이드 방법

1. OCI 콘솔 → Data Science → Notebook Sessions 이동
2. 대상 노트북 선택 → **Deactivate** 클릭
3. Deactivate 완료 후 → **Activate** 클릭
4. 노트북 접속 후 JupyterLab 버전 확인

### 업그레이드 전 체크리스트

- [ ] 사용 중인 JupyterLab 확장이 4.x 호환되는지 확인
- [ ] 노트북 세션 내 작업 중인 파일 저장/백업
- [ ] Deactivate 전 실행 중인 커널 종료

자세한 내용은 [Deactivating and Activating a Notebook Session 문서](https://docs.oracle.com/iaas/Content/data-science/using/deactivate-notebooks.htm){:target="\_blank" rel="noopener"} 참고.
