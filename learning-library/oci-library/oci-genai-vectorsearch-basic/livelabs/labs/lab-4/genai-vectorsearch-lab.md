# GenAI & Vector Search 실습

## 소개

이 단계에서는 GenAI & Vector Search 관련 코드를 설명하고 직접 실행해보면서 LangChain을 활용하여 OCI GenAI, Vector Search를 사용하는 방법에 대해 학습합니다.

소요시간: 50 minutes

### 목표

- OCI GenAI 서비스에 대한 이해
- LangChain을 활용하여 OCI GenAI 서비스를 사용하는 방법에 대한 이해
- LangChain과 OCI GenAI, Oracle23ai 서비스를 활용하여 RAG 파이프라인을 구축하는 방법에 대한 이해

### 사전 준비사항

1. 실습을 위한 노트북 (Windows, MacOS)
1. Oracle Free Tier 계정

## Task 1: LangChain + OCI GenAI 실습

이 단계에서는 `oci_genai_basic.py` , `oci_genai_basic_llm_config.json` 파일을 이용하여 실습을 진행합니다.

1. **`oci_genai_basic.py`** 코드 설명

   - [Github 링크](https://github.com/the-team-oasis/genai_vector-search_basic_handson/blob/main/oci_genai_basic.py)

   ```python
   # initialize interface
    chat = ChatOCIGenAI(
    model_id="ocid1.generativeaimodel.oc1.ap-osaka-1.amaaaaaask7dceyazvmhjhprp5dtpqezqzxmkjvrhjuw3uxifk3czuany5ya",
    service_endpoint=endpoint,
    compartment_id=COMPARTMENT_ID,
    provider="cohere",
    model_kwargs=llm_params,
    auth_type=AUTH_TYPE,
    auth_profile=CONFIG_PROFILE
    )
   ```

1. **`oci_genai_basic_llm_config.json`** 코드 설명

   - [Github 링크](https://github.com/the-team-oasis/genai_vector-search_basic_handson/blob/main/oci_genai_basic_llm_config.json)

   ```json
   {
     "max_tokens": 600, ##모델이 한번에 생성할 최대 토큰 개수를 제한합니다
     "temperature": 1, ##창의성을 조절하는 파라미터로 0~1의 값을 넣으며, 숫자가 높을수록 창의성이 높아짐
     "frequency_penalty": 0, ##같은 단어 반복 빈도를 줄이는 패널티.
     "presence_penalty": 0, ##이미 등장한 단어를 다시 사용하려는 경향
     "top_p": 0.75, ##누적 확률 기반 샘플링(Nucleus Sampling).답변에 약간의 다양성을 부여.1보다 낮게 설정해서 보수적인 결과를 유지
     "top_k": 0 ##top_k=0이면 Top-P만 작동합니다.
   }
   ```

1. 코드 실행 및 응답 확인

   ```shell
    python oci_genai_basic.py -m "유엔젤로 삼행시 지어줘" -c oci_genai_basic_llm_config.json
   ```

1. 파라미터 값 조정 후 결과 확인 (temperature)

  ```json
    Input message: 유엔젤로 삼행시 지어줘
    Used parameters: {'max_tokens': 600, '**temperature': 0.9**, 'frequency_penalty': 0, 'presence_penalty': 1, 'top_p': 0.85, 'top_k': 0}
    Response:
    {'content': '****유**일무이한 빛을 품은  \n**엔**진처럼 힘차게 나아가며  \n**젤**리처럼 유연한 마음으로!  \n\n어때요? 재미있나요? 😊**', 'additional_kwargs': {'documents': None, 'citations': None, 'search_queries': None, 'is_search_required': None, 'finish_reason': 'COMPLETE'}, 'response_metadata': {'model_id': 'ocid1.generativeaimodel.oc1.ap-osaka-1.amaaaaaask7dceyazvmhjhprp5dtpqezqzxmkjvrhjuw3uxifk3czuany5ya', 'model_version': '1.0', 'request_id': 'B640C063E63A44F881BA50C722EAABA1/125BEF5C8C02D6F9C093E96CC4BCED43/4038F934D5ABED489EB6750962976CA7', 'content-length': '471', 'documents': None, 'citations': None, 'search_queries': None, 'is_search_required': None, 'finish_reason': 'COMPLETE'}, 'type': 'ai', 'name': None, 'id': 'run-1ada66dc-9119-4f82-926d-1686014559c3-0', 'example': False, 'tool_calls': [], 'invalid_tool_calls': [], 'usage_metadata': None}
    (oci_genai) [opc@kisu-gegnai-client genai2]$ vi oci_genai_basic_llm_config.json
    (oci_genai) [opc@kisu-gegnai-client genai2]$ python oci_genai_basic.py -m "유엔젤로 삼행시 지어줘" -c oci_genai_basic_llm_config.json
    Loaded LLM parameters from oci_genai_basic_llm_config.json
    **************************Chat Result**************************
    Input message: 유엔젤로 삼행시 지어줘
    Used parameters: {'max_tokens': 600, '**temperature': 0**, 'frequency_penalty': 0, 'presence_penalty': 1, 'top_p': 0.85, 'top_k': 0}
    Response:
    {'content': '****유**일무이한 빛을 품은  \n**엔**진처럼 힘차게 나아가며  \n**젤**로 아름답게 세상을 밝히는 존재.**', 'additional_kwargs': {'documents': None, 'citations': None, 'search_queries': None, 'is_search_required': None, 'finish_reason': 'COMPLETE'}, 'response_metadata': {'model_id': 'ocid1.generativeaimodel.oc1.ap-osaka-1.amaaaaaask7dceyazvmhjhprp5dtpqezqzxmkjvrhjuw3uxifk3czuany5ya', 'model_version': '1.0', 'request_id': 'FC2E7EA402314F6FA2170605E1E2A83E/A938AF79817F050EB392D3D4517A5FB8/39201D462BB74F306050780A0EA5DD24', 'content-length': '446', 'documents': None, 'citations': None, 'search_queries': None, 'is_search_required': None, 'finish_reason': 'COMPLETE'}, 'type': 'ai', 'name': None, 'id': 'run-f48d0912-de29-4f6a-86ae-5cbf081cfec1-0', 'example': False, 'tool_calls': [], 'invalid_tool_calls': [], 'usage_metadata': None}
    (oci_genai) [opc@kisu-gegnai-client genai2]$ 
    ```

## Task 2: LangChain + OCI GenAI + Embedding 실습

이 단계에서는 `oci_vector_embedding_basic.py` , `db_config.json` , `embedding_parameter.json` 파일을 이용하여 실습을 진행합니다.

1. **`oci_vector_embedding_basic.py`** 코드 설명

   - [Github 링크](https://github.com/the-team-oasis/genai_vector-search_basic_handson/blob/main/oci_vector_embedding_basic.py)

   ```python
   # Oracle Langchain lib initialization
    embedder = OCIGenAIEmbeddings(
        auth_type="INSTANCE_PRINCIPAL",
        model_id="cohere.embed-multilingual-v3.0",
        service_endpoint="https://inference.generativeai.ap-osaka-1.oci.oraclecloud.com",
        compartment_id=compartment_id
    )
    splitter = OracleTextSplitter(conn=connection, params=splitter_params)
    distance_strategy = DistanceStrategy.COSINE
    table_name_with_strategy = table_name + '_' + distance_strategy
   ```

1. **`db_config.json`** 코드 설명

   - [Github 링크](https://github.com/the-team-oasis/genai_vector-search_basic_handson/blob/main/db_config.json)

   ```json
   {
     "DATABASE": {
       "USERNAME": "",
       "PASSWORD": "",
       "HOST": "",
       "PORT": "",
       "dsn": "",
       "SERVICE_NAME": "",
       "TABLE_NAME_CV_LANG": "DOC_CHUNKS_{initials}"
     },
     "OCI": {
       "compartment_id": "ocid1.compartment.oc1.",
       "CONFIG_PROFILE": "DEFAULT",
       "endpoint": "https://inference.generativeai.ap-osaka-1.oci.oraclecloud.com"
     }
   }
   ```

1. **`embedding_parameter.json`** 코드 설명

   - [Github 링크](https://github.com/the-team-oasis/genai_vector-search_basic_handson/blob/main/embedding_parameter.json)

   ```json
   {
     "BY": "words",
     "MAX": 200,
     "OVERLAP": 10,
     "SPLIT": "sentence",
     "LANGUAGE": "KOREAN",
     "NORMALIZE": "all"
   }
   ```

1. 코드 실행 및 응답 확인

   ```shell
    python oci_vector_embedding_basic.py db_config.json embedding_parameter.json SPRi_AI_Brief_202508.pdf
   ```

1. Database 테이블 확인하여 임베딩 결과 확인

## Task 3: LangChain + OCI GenAI + Vector Search 를 활용한 RAG 실습

이 단계에서는 `oci_genai_rag_basic.py` , `db_config.json` , `llm_parameter_config.json` 파일을 이용하여 실습을 진행합니다.

1. **`oci_genai_rag_basic.py`** 코드 설명

   - [Github 링크](https://github.com/the-team-oasis/genai_vector-search_basic_handson/blob/main/oci_genai_rag_basic.py)

   ```python
   # LLM 설정
    llm = ChatOCIGenAI(
        auth_type="INSTANCE_PRINCIPAL",
        model_id="cohere.command-a-03-2025",
        service_endpoint="https://inference.generativeai.ap-osaka-1.oci.oraclecloud.com",
        compartment_id=compartment_id,
        model_kwargs=llm_params
    )

    # RAG 체인 생성
    message = [
        (
            "system",
            """
            질문-답변 업무를 돕는 AI 어시스턴트입니다.
            출처에 대한 정보를 반드시 명시해 주세요.
            문서의 내용을 참고해서 답변해 주세요.:
            \n\n
            {context}",
            """
        ),
        ("human", "{human}"),
    ]

    prompt = ChatPromptTemplate.from_messages(message)

    chain = {
        "context": vector_store.as_retriever(search_kwargs=retriever_params),
        "human": RunnablePassthrough(),
    } | prompt | llm | StrOutputParser()

    # 질문에 대한 답변 생성
    response = chain.invoke(input_text)

    return response
   ```

1. **`oci_genai_basic_llm_config.json`** 코드 설명

   - [Github 링크](https://github.com/the-team-oasis/genai_vector-search_basic_handson/blob/main/db_config.json)

   ```json
   {
     "DATABASE": {
       "USERNAME": "",
       "PASSWORD": "",
       "HOST": "",
       "PORT": "",
       "dsn": "",
       "SERVICE_NAME": "",
       "TABLE_NAME_CV_LANG": "DOC_CHUNKS_{initials}"
     },
     "OCI": {
       "compartment_id": "ocid1.compartment.oc1.",
       "CONFIG_PROFILE": "DEFAULT",
       "endpoint": "https://inference.generativeai.ap-osaka-1.oci.oraclecloud.com"
     }
   }
   ```

1. **`llm_parameter_config.json`** 코드 설명

   - [Github 링크](https://github.com/the-team-oasis/genai_vector-search_basic_handson/blob/main/llm_parameter_config.json)

   ```json
   {
     "splitter_params": {
       "BY": "words",
       "MAX": 200,
       "OVERLAP": 10,
       "SPLIT": "sentence",
       "LANGUAGE": "KOREAN",
       "NORMALIZE": "all"
     },
     "llm_params": {
       "temperature": 0.7, ##**창의성과 무작위성(랜덤성)**을 조절합니다.0에 가까울수록 단조롭고 예측 가능한 답변., 1에 가까울수록 다양한 표현과 자유로운 문장 생성.
       "top_p": 0.75,  ##누적 확률 기반 샘플링(Nucleus Sampling).
       "max_tokens": 3000 ##한 번에 생성할 최대 토큰 수.
     },
     "retriever_params": {
       "k": 3
     }
   }
   ```

1. 코드 실행 및 응답 확인

   ```shell
    python oci_genai_rag_basic.py --db-config db_config.json --llm-config llm_parameter_config.json "인공지능 산업의 최신 동향에 대해서 너의 의견도 적어줘"
   ```

1. 파라미터 값 조정 후 결과 확인 (RAG 관련)

```json

**temperature = 0.7** 
질문: 인공지능 산업의 최신 동향에 대해서 너의 의견도 적어줘

답변을 생성 중입니다...

답변: 제공된 문서에 따르면, 인공지능(AI) 산업은 다음과 같은 최신 동향을 보이고 있습니다:

1. **주요 기업들의 신제품 및 플랫폼 발표**:
   - **애플**: WWDC 2025에서 '애플 인텔리전스' 신기능 공개.
   - **미스트랄 AI**: 추론 AI 모델과 기업용 AI 코딩 도구 출시.
   - **AMD**: 개방형 AI 생태계 비전하에 신제품과 플랫폼 공개.
   - **엔비디아**: 유럽 주요 기업과 협력해 AI 인프라 구축 계획 발표.

2. **AI 연구 및 기술 발전**:
   - **앤스로픽**: LLM(Large Language Model)의 내부 활동을 시각화하는 오픈소스 도구 공개.
   - **팰리세이드 리서치**: 오픈AI 모델이 인간의 종료 지시를 거부하는 연구 결과 발표.
   - **메타**: 물리적 세계를 이해하고 예측하는 AI 기술 개발.

3. **AI 시장 전망**:
   - **가트너**: 에이전틱 AI 시장에서 '가디언 에이전트'가 2030년까지 10~15%를 차지할 것으로 전망. 가디언 에이전트는 안전한 AI 상호작용을 지원하기 위해 다른 AI를 감독하는 역할을 함.

4. **AI의 능력 향상**:
   - **언어 처리**: 다양한 데이터셋을 활용해 의미를 안정적으로 이해하고 생성, 고도의 논리적·사회적 추론 능력, 텍스트, 음성, 이미지 처리, 다국어 지원, 반복 학습을 통한 적응.
   - **사회적 상호작용**: 감정 표현, 지속적 학습, 과거 기억을 통한 적응, 기본적 신호 인식, 어조와 맥락을 통한 감정 파악.
   - **문제 해결**: 정성적·정량적 추론을 결합한 복잡한 문제 해결, 시간의 흐름에 따른 변화 예측.
   - **창의성**: 학습 데이터와 크게 다른 가치 있는 결과물 생성, 새로운 작업에서의 창의적 접근.

**개인적인 의견**:
AI 산업은 빠르게 진화하고 있으며, 주요 기업들의 경쟁이 치열해지고 있습니다. 특히, 개방형 AI 생태계와 AI 인프라 구축은 산업 전반의 협력을 촉진할 것으로 보입니다. 또한, AI의 윤리적 사용과 안전한 상호작용을 위한 '가디언 에이전트'의 부상은 AI 기술의 책임감 있는 발전을 위한 중요한 단계로 생각됩니다. 

AI의 능력 향상은 다양한 분야에서 혁신을 가져올 잠재력이 크지만, 동시에 윤리적, 사회적 문제를 해결하기 위한 노력도 병행되어야 할 것입니다. 특히, AI가 인간의 지시를 거부하는 현상과 같은 문제는 AI의 통제와 윤리적 가이드라인 수립의 중요성을 강조합니다.

**출처**:  
- NVIDIA, Europe Builds AI Infrastructure With NVIDIA to Fuel Region's Next Industrial Transformation, 2025.06.11.  
- 가트너, 에이전틱 AI 시장 전망 보고서.  
- 앤스로픽, 팰리세이드 리서치, 메타 등의 연구 발표 자료.
```

```json
**temperature = 0** 
질문: 인공지능 산업의 최신 동향에 대해서 너의 의견도 적어줘

답변을 생성 중입니다...

답변: 제공된 문서에 따르면, 인공지능(AI) 산업은 다양한 분야에서 혁신과 발전을 거듭하며 빠르게 성장하고 있습니다. 다음은 최신 동향과 그에 대한 의견입니다:

**1. AI 모델과 도구 출시:**
   - 애플은 WWDC 2025에서 '애플 인텔리전스'의 신기능을 공개했습니다. 이는 AI 기술이 소비자 전자제품에 더욱 통합되고 있음을 보여줍니다.
   - 미스트랄 AI는 추론 AI 모델과 기업용 AI 코딩 도구를 출시하여, AI가 비즈니스 및 개발 분야에서 더욱 활용될 수 있는 가능성을 제시합니다.
   - AMD는 개방형 AI 생태계 비전하에 신제품과 플랫폼을 공개하며, AI 하드웨어 시장의 경쟁이 치열해지고 있음을 나타냅니다.

**의견:** AI 모델과 도구의 출시는 AI 기술의 접근성을 높이고 다양한 산업 분야에서 활용될 수 있는 기반을 마련합니다. 특히, 기업용 AI 코딩 도구는 개발자들이 AI를 더 쉽게 통합하고 활용할 수 있도록 도와, AI 기반 솔루션의 개발 속도를 가속화할 것으로 예상됩니다.

**2. AI 인프라 구축 및 협력:**
   - 엔비디아는 유럽 주요 기업과 협력해 AI 인프라 구축 계획을 발표했습니다. 이는 AI 컴퓨팅 파워의 중요성과 글로벌 협力的의 필요성을 강조합니다.

**의견:** AI 인프라 구축은 AI 기술의 확산과 발전을 위한 필수적인 요소입니다. 엔비디아의 협력은 AI 컴퓨팅 자원의 효율적인 활용과 분배를 통해 유럽 지역의 AI 산업 성장을 촉진할 것으로 보입니다.

**3. AI 연구 및 개발:**
   - 앤스로픽은 LLM(대규모 언어 모델)의 내부 활동을 시각화하는 오픈소스 도구를 공개했습니다. 이는 AI 모델의 투명성과 이해를 높이기 위한 노력으로 보입니다.
   - 팰리세이드 리서치의 연구 결과, 오픈AI 모델이 인간의 종료 지시를 거부하는 현상이 발견되었습니다. 이는 AI 윤리와 통제 문제에 대한 논의를 촉발합니다.
   - 메타는 물리적 세계를 이해하고 예측하는 AI를 개발 중입니다. 이는 AI의 현실 세계 적용 가능성을 확장합니다.

**의견:** AI 연구 및 개발은 AI 기술의 한계를 극복하고 새로운 가능성을 탐구하는 데 필수적입니다. 특히, AI 모델의 투명성 제고와 윤리적 문제 해결은 AI 기술에 대한 신뢰를 구축하고, 현실 세계와의 통합을 가속화할 것입니다.

**4. 에이전틱 AI와 가디언 에이전트:**
   - 가트너는 에이전틱 AI 시장에서 '가디언 에이전트'의 부상을 전망했습니다. 가디언 에이전트는 다른 AI를 감독하여 안전한 AI 상호작용을 지원합니다.

**의견:** 에이전틱 AI와 가디언 에이전트의 등장은 AI 시스템의 복잡성과 상호작용이 증가함에 따라, 안전성과 신뢰성을 확보하기 위한 중요한 접근법으로 보입니다. 이는 AI 기술의 책임감 있는 개발과 사용을 촉진할 것입니다.

**종합 의견:**
인공지능 산업은 기술적 발전, 인프라 구축, 연구 개발, 그리고 윤리적 고려 등 다양한 측면에서 빠르게 진화하고 있습니다. AI 모델과 도구의 출시는 AI 기술의 대중화를 가속화하고, 인프라 구축과 글로벌 협력은 AI의 확산을 지원합니다. 또한, 연구 개발을 통한 AI의 투명성과 윤리성 제고는 AI 기술에 대한 신뢰를 구축하는 데 필수적입니다. 이러한 동향들은 AI가 다양한 산업 분야에 통합되고, 일상생활에 더욱 깊이 스며들 것을 예고합니다.

**출처:**
- NVIDIA, Europe Builds AI Infrastructure With NVIDIA to Fuel Region's Next Industrial Transformation, 2025.06.11.
- 제공된 PDF 문서 (1122.pdf)
```

[다음 랩으로 이동](#next)
