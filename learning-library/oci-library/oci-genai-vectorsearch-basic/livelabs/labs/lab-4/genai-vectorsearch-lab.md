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
     "max_tokens": 600,
     "temperature": 1,
     "frequency_penalty": 0,
     "presence_penalty": 0,
     "top_p": 0.75,
     "top_k": 0
   }
   ```

1. 코드 실행 및 응답 확인

   ```shell
    python oci_genai_basic.py --message "Hello"
    python oci_genai_basic.py -m "Ask a question"
    python oci_genai_basic.py -m "Hello" -c oci_genai_basic_llm_config.json
   ```

1. 파라미터 값 조정 후 결과 확인 (temperature)

작성필요

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
       "temperature": 0.7,
       "top_p": 0.75,
       "max_tokens": 3000
     },
     "retriever_params": {
       "k": 3
     }
   }
   ```

1. 코드 실행 및 응답 확인

   ```shell
    python oci_genai_rag_basic.py --db-config db_config.json --llm-config llm_parameter_config.json "벡터 검색의 장 점은?"
   ```

1. 파라미터 값 조정 후 결과 확인 (RAG 관련)

작성필요

[다음 랩으로 이동](#next)
