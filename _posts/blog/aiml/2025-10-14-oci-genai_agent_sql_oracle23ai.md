---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Generative AI Agents"
title: "OCI GenAI Agent: SQL Tool과 Oracle 23ai 연동"
teaser: "GenAI Agent에 SQL Tool을 추가하고 Oracle Autonomous Database 23ai와 연결하여 자연어로 데이터베이스를 조회하는 방법을 단계별로 구성합니다."
author: yhcho
breadcrumb: true
categories:
  - aiml
tags:
  - [oci, genai, agents, sql, oracle 23ai, adb]
#published: false

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

# -------------- 내용 필독 -------------------
# 작성할 내용은 아래부터 작성
# 작성 방법
# 각 챕터별 제목은 "###"로 시작한다.
# 하위 제목은 "####"로 시작한다.
# 이미지는 assets 폴더의 경로를 사용하며 "/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai" 하위 파일을 참조한다.
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

이 문서는 OCI Generative AI Agents 서비스에서 SQL Tool을 구성하여 자연어로 데이터베이스를 조회하는 방법을 설명합니다. Oracle Autonomous Database 23ai를 프로비저닝하고, Database Tools Connection을 생성한 후, Agent에 SQL Tool을 연결하여 자연어 쿼리를 SQL로 변환하여 실행하는 전체 과정을 다룹니다.

### 사전 준비

- **Region**: 현재 GenAI Agents는 Chicago, Ashburn, Phoenix, Frankfurt, London, Osaka 리전에서 제공됩니다.
- **권한**: Policies/Dynamic Group을 생성할 수 있는 권한 또는 관리자 권한. Oracle Databases, Networking, Vault 서비스를 관리할 수 있는 권한 필요.
- **예상 시간**: 약 120분

### 용어

- **SQL Tool**: 자연어 질의를 SQL 쿼리로 변환하여 데이터베이스에서 데이터를 검색하는 Agent 도구.
- **Database Tools Connection**: OCI에서 데이터베이스에 연결하기 위한 관리형 연결 서비스.
- **Agent**: SQL Tool을 포함하여 질의에 응답하는 실행 엔진.
- **Routing Instructions**: Agent가 여러 도구 중 어떤 도구를 언제 사용할지 결정하도록 안내하는 최상위 지침.
- **Agent Tool's Description**: Agent Tool이 수행하는 작업의 범위와 종류를 설명하는 필드. Agent가 "이 도구를 호출해야 하는가?"를 판단할 때 참조.
- **Agent Tool's Custom Instructions**: Agent Tool 호출 후 Agent의 응답 방식을 제어하는 세부 지침.

### 참고 흐름

1. VCN/Subnet 구성 → 2. Vault 및 Secret 생성 → 3. Autonomous Database 23ai 프로비저닝 → 4. Database Tools Connection 생성 → 5. 테이블 생성 및 데이터 입력 → 6. Agent 생성 및 SQL Tool 추가 → 7. Endpoint/Playground에서 테스트

---

### Task 1: Region 구독 확인

GenAI Agents는 ASIA 지역에서는 Osaka 리전에서 사용 가능합니다. 콘솔 우상단 Regions 메뉴에서 구독 여부를 확인합니다.

![regions list](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/policies/regions-list.png)

필요 시 Manage Regions 화면에서 원하는 리전(예: Osaka, Chicago 등)을 구독합니다.

![infrastructure regions](/assets/img/aiml/2025/aiml/genai-agent-rag-bucket/policies/infrastructure-regions.png)

### Task 2: Dynamic Group 및 Policy 생성

SQL Tool을 사용하기 위해서는 Agent가 Database Tools Connection과 Vault Secret에 접근할 수 있도록 Dynamic Group과 Policy를 구성해야 합니다.

#### Dynamic Group 생성 하기

Identity & Security 메뉴에서 Domain을 클릭 후 "Default" 도메인을 선택하면 Dynamic Group 탭을 확인할 수 있습니다.
Dynamic Group 탭으로 이동 후 "Create Dynamic Group" 버튼을 클릭합니다.

![domain navigation](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/locate_domain.png)

![click domain](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/click_domain.png)

> 만약 Default 도메인이 보이지 않는다면, 현재 Filtere된 구획을 확인하세요. (Default 도메인은 루트 구획에서 확인 가능합니다.)

**Dynamic Group의 Matching Rule은 다음과 같이 설정합니다:**

```text
ALL {resource.type='genaiagent'}
```

<!-- ![dg details](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dg_details.png) -->

#### Policy 작성하기

루트 컴파트먼트에서 정책을 수동 편집 모드로 아래와 같이 구성합니다. 컴파트먼트 이름은 실제 사용하는 컴파트먼트로 변경해야 합니다.

**Policy 자동 생성기를 사용하여 필요한 Policy를 쉽게 생성할 수 있습니다:**

{% capture sql_tool_policy %}{"title": "GenAI Agent SQL Tool Policy 생성기","description": "Dynamic Group과 Compartment 정보를 입력하면 필요한 Policy를 자동으로 생성합니다.","fields": [{"id": "dynamicGroup","label": "Dynamic Group 이름","placeholder": "예: genai-agent-dg"},{"id": "databaseComp","label": "Database Connection Compartment","placeholder": "예: database-compartment"},{"id": "vaultComp","label": "Vault Secret Compartment","placeholder": "예: vault-compartment"}],"policies": ["Allow dynamic-group &#123;&#123;dynamicGroup&#125;&#125; to read database-tools-family in compartment &#123;&#123;databaseComp&#125;&#125;","Allow dynamic-group &#123;&#123;dynamicGroup&#125;&#125; to read secret-bundle in compartment &#123;&#123;vaultComp&#125;&#125;","Allow any-user to read database-tools-family in compartment &#123;&#123;databaseComp&#125;&#125; where any &#123;request.principal.type='genaiagent'&#125;","Allow any-user to read secret-bundle in compartment &#123;&#123;vaultComp&#125;&#125; where any &#123;request.principal.type='genaiagent'&#125;","Allow any-user to use database-tools-connections in compartment &#123;&#123;databaseComp&#125;&#125; where any &#123;request.principal.type='genaiagent'&#125;"]}{% endcapture %}
{% include oci-policy-generator.html config=sql_tool_policy id="sql-tool" %}

**또는 수동으로 작성할 경우 다음 Policy 템플릿을 참고하세요:**

```text
Allow dynamic-group <your-dynamic-group> to read database-tools-family in compartment <comp-with-database-connection>
Allow dynamic-group <your-dynamic-group> to read secret-bundle in compartment <comp-with-vault-secret>
Allow any-user to read database-tools-family in compartment <database-connection-comp> where any {request.principal.type='genaiagent'}
Allow any-user to read secret-bundle in compartment <vault-comp> where any {request.principal.type='genaiagent'}
Allow any-user to use database-tools-connections in compartment <database-connection-comp> where any {request.principal.type='genaiagent'}
```

![click policy](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/click_policy.png)

![policy details](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/policy-details.png)

> **Note**: 기본 도메인이 아닌 다른 도메인을 사용하는 경우, 정책 구문에서 동적 그룹 이름 대신 `도메인이름/그룹이름` 형식으로 지정해야 합니다.

### Task 3: VCN 및 Private Subnet 구성

Autonomous Database가 사용할 VCN과 Private Subnet을 구성합니다. 기존 VCN이 있다면 해당 VCN의 Private Subnet을 사용할 수 있습니다.

- Networking → Virtual cloud networks로 이동하여 VCN을 선택합니다.

![vcn nav](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/vcn_nav.png)

- VCN을 생성하기 위해 Actions 를 클릭하여 VCN Wizard를 실행합니다.

![vcn wizard](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/vcn_wizard.png)
![vcn wizard](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/vcn_wizard_options.png)

- VCN 이름을 지정하고 나머지 설정은 기본값으로 VCN을 생성합니다.
- Private Subnet의 Security List로 이동하여 다음 Ingress Rule을 추가합니다. 데이터베이스 포트 1521-1522에 대한 접근을 허용해야 합니다.

![ingress rules](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/ingress_rules.png)

### Task 4: Vault 및 Secret 생성

데이터베이스 접속 정보를 안전하게 저장하기 위한 Vault와 Secret을 생성합니다. Secret은 Database Tools Connection에서 사용됩니다.

#### Vault 생성

1. Key Management & Secret Management → Vault로 이동합니다.

![create vault](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/nav_vault.png)

2. Name을 입력하고 "Create Vault"를 클릭합니다.

![create vault](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/create_vault1.png)
![create vault](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/create_vault2.png)

#### Master Encryption Key 생성

1. 생성한 Vault로 이동하여 "Create Key"를 클릭합니다.

![create key](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/create_key1.png)

2. Name을 입력하고 Protection Mode는 HSM을 선택한 후 "Create Key"를 클릭합니다.

![create key](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/create_key2.png)
![create key](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/create_key3.png)

### Task 5: Autonomous Database 23ai 생성

SQL Tool이 연결할 Autonomous Database 23ai를 생성합니다.

1. Oracle Databases → Autonomous Databases로 이동하여 "Create Autonomous Database"를 클릭합니다.

![create adb](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/nav_adb.png)
![create adb](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/create_adb1.png)

2. 다음 정보를 입력합니다:
   - **Compartment**: 사용할 컴파트먼트 선택
   - **Display name**: 데이터베이스 표시 이름
   - **Database name**: 데이터베이스 이름
   - **Workload type**: Transaction Processing 선택
   - **Deployment type**: Serverless 선택
   - **Database version**: 23ai 선택
   - **Password**: ADMIN 사용자 비밀번호 설정

![create atp](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/atp/create-atp-1.png)
![create atp](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/atp/create-atp-2.png)

3. Network Access 설정:
   - **Network Access**: "Private Endpoint access only" 선택
   - **VCN**: Task 3에서 구성한 VCN 선택
   - **Subnet**: Private Subnet 선택
   - **Require mutual TLS (mTLS) authentication**: 체크 해제

![adb creation](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/adb1.png)

4. 이메일 주소를 입력하고 "Create Autonomous Database"를 클릭합니다.

### Task 6: Database Tools Connection 생성

Agent가 데이터베이스에 연결하기 위한 Database Tools Connection을 생성합니다.

1. Developer Services → Database Tools → Connections로 이동하여 "Create connection"을 클릭합니다.

![create conn](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/nav_dbconn.png)
![create conn](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-create.png)

2. 기본 정보를 입력합니다:
   - **Name**: Connection 이름
   - **Compartment**: 컴파트먼트 선택
   - **Database cloud service**: Oracle Autonomous Database 선택
   - **Username**: admin

![create conn](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-create-1.png)

#### Password Secret 생성

3. "Create password secret"을 클릭하여 새로운 Secret을 생성합니다:
   - **Name**: Secret 이름
   - **Vault**: Task 4에서 생성한 Vault 선택
   - **Encryption Key**: Task 4에서 생성한 Key 선택
   - **Password**: ADB 생성 시 설정한 ADMIN 비밀번호 입력

![create password](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-create-pass.png)

4. 생성한 Secret을 "User password secret"으로 선택합니다.

#### Connection String 구성

5. ADB 상세 페이지에서 "Database connection"을 클릭하여 Connection String을 복사합니다 (low, medium, high 중 하나 선택).

> Connection 생성 첫 단계에서 Database Details 를 Select Database로 한 경우 해당 ADB의 Connection String을 자동으로 불러옵니다.

![conn string](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/conn_string-1.png)
![conn string](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/conn_string-2.png)

6. Connection String을 다음과 같이 수정합니다:
   - retry_count를 20에서 3으로 감소
   - host를 Private IP 주소로 교체 (ADB 상세 페이지에서 확인 가능)

![private ip](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-check-adb-private-ip.png)

![private ip](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-change-conn-string-1.png)
![private ip](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-change-conn-string-2.png)

#### Private Endpoint 생성

7. "Create private endpoint"를 클릭합니다:
   - **Name**: Private Endpoint 이름
   - **Subnet**: Task 3에서 구성한 Private Subnet 선택

![private endpoint](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-create-pe.png)

8. SSL details에서 "Wallet format"을 "None"으로 선택합니다.

9. "Create"를 클릭하여 Database Tools Connection을 생성합니다.

![create dbtools](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-create-2.png)

#### Connection 검증

10. 생성된 Database Tools Connection으로 이동하여 "Validate"를 클릭하여 연결을 테스트합니다.

![validate dbtools](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-validate-1.png)
![validate dbtools](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-validate-2.png)
![validate dbtools](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/adb/dbconn-validate-3.png)

### Task 7: 테이블 생성 및 데이터 입력

SQL Tool이 쿼리할 테이블을 생성하고 샘플 데이터를 입력합니다.

1. ADB 상세 페이지에서 "Database actions" → "SQL"을 선택하여 SQL Worksheet를 엽니다.

2. 다음 SQL 문을 실행하여 Employees 테이블을 생성합니다:

> **Note**: 본 예제에서는 간단한 직원 테이블을 사용합니다. 실제 환경에서는 본인의 테이블을 사용할 수 있습니다.

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DepartmentID INT,
    HireDate DATE NOT NULL
);
```

3. 다음 SQL 문을 실행하여 샘플 데이터를 입력합니다:

```sql
INSERT ALL
INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (1, 'John Doe', 1, TO_DATE('2020-01-01', 'YYYY-MM-DD'))
INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (2, 'Jane Smith', 2, TO_DATE('2020-02-01', 'YYYY-MM-DD'))
INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (3, 'Bob Johnson', 1, TO_DATE('2020-03-01', 'YYYY-MM-DD'))
INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (4, 'Alice Brown', 3, TO_DATE('2020-04-01', 'YYYY-MM-DD'))
INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (5, 'Mike Davis', 2, TO_DATE('2020-05-01', 'YYYY-MM-DD'))
SELECT * FROM dual;
```

> **Note**: 큰 테이블을 쿼리할 경우 Agent 서비스나 ODA에서 타임아웃이 발생할 수 있습니다. 결과를 필터링하여 반환되는 행 수를 제한하는 것이 좋습니다.

### Task 8: GenAI Agent 생성 및 SQL Tool 연결

메뉴에서 Agents → Create agent로 이동하여 Agent를 생성하고, SQL Tool을 추가합니다.
생성 후 Endpoints 화면에서 OCID를 확인하고, Chat Playground에서 질의 테스트를 수행합니다.

#### Agent 생성 메뉴로 이동

Analytics & AI → Generative AI Agents로 이동합니다.

![agents service navigation](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/console/agents-service-navigation.png)

"Create agent"를 클릭합니다.

#### OCI GenAI Agent 기본 정보 입력

아래 Routing Instructions는 Agent가 등록된 도구를 언제 사용할지 결정하도록 안내하는 최상위 지침입니다.
본 실습에서는 SQL Tool만 등록하므로 아래와 같이 작성합니다.

```text
You are a helpful assistant specializing in database queries. **Always respond to users in Korean (한글).**

When a user asks a question about employees or database information:

1. Use the SQL tool to query the Employees table in the database.
2. The SQL tool will automatically convert your natural language question into an Oracle SQL query and execute it.
3. Present the query results to the user in a clear and understandable format in Korean.
4. If the query returns no results, inform the user in Korean that no matching data was found.
5. For general greetings or non-database questions, you may respond naturally in Korean without using tools.

Remember: All responses must be in Korean regardless of the language used in the user's question.
```

Name과 Description을 입력하고 위의 Routing Instructions를 입력합니다.

#### OCI GenAI Agent에 SQL Tool 추가

1. Tools 섹션에서 "Add Tool"을 클릭합니다.

2. Tool type으로 "SQL"을 선택합니다.

3. 다음 정보를 입력합니다:
   - **Name**: 예) employees-sql-tool
   - **Description**: SQL Tool이 수행하는 작업에 대한 설명을 입력합니다.

##### Description (도구 설명)

- Agent가 이 도구를 **언제 사용할지** 판단하는 기준
- SQL Tool의 경우 어떤 데이터베이스 스키마를 다루는지 명확히 기술

```text
This tool allows you to query the Employees database table to retrieve information about employees including their ID, name, department, and hire date. Use this tool when users ask questions about employee information, department assignments, or hiring dates.
```

##### Database Schema

Task 7에서 생성한 테이블 스키마를 입력합니다. 이 정보를 통해 Agent는 어떤 컬럼이 존재하는지 이해하고 적절한 SQL 쿼리를 생성할 수 있습니다.

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DepartmentID INT,
    HireDate DATE NOT NULL
);
```

> **Note**: 본인의 테이블을 사용하는 경우, SQL Developer에서 `DESC table_name;` 명령으로 스키마를 확인할 수 있습니다.

![create sql tool](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/sqltool/create-tool.png)

##### SQL 설정

4. SQL Dialect로 "Oracle SQL"을 선택합니다.

5. Database Tools Connection으로 Task 6에서 생성한 Connection을 선택합니다.

6. "Enable SQL Execution"과 "Enable self correction"을 체크합니다.

   - SQL Execution: Agent가 생성한 SQL을 실제로 실행
   - Self correction: 쿼리 오류 발생 시 자동으로 수정 시도

7. "Test connection"을 클릭하여 연결을 확인합니다.

![tool connection](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/sqltool/tool-connection.png)

##### Custom Instructions (사용자 지정 지침)

도구가 선택된 **후** SQL 쿼리 생성 및 응답 동작을 제어하는 세부 규칙을 입력합니다.

```text
When using this SQL tool to respond to users:

1. Always answer in Korean (한글), regardless of the language used in the user's question.
2. Generate Oracle SQL queries that are optimized and correct.
3. Present query results in a clear table format or natural language summary in Korean.
4. If the query returns no results, respond with: "해당 조건에 맞는 직원 정보를 찾을 수 없습니다."
5. If there's an error in the query, attempt to correct it automatically using the self-correction feature.
6. For complex queries that might return many rows, add appropriate LIMIT or filtering conditions.
```

8. "Add tool"을 클릭하여 SQL Tool을 추가합니다.

#### OCI GenAI Agent Endpoint 설정

이 단계에서는 Agent Endpoint에 설정할 수 있는 Guardrails 옵션을 설정합니다.
본 실습에서는 기본값인 Disable로 지정하여 진행하겠습니다.

"Create agent"를 클릭합니다.

#### Llama 3 모델 사용약관 동의

OCI GenAI Agent에서는 내부적으로 Meta의 Llama 모델을 사용하고 있기 때문에 사용약관 동의 후 이용할 수 있습니다.
내용을 읽은 후 동의 체크하여 Submit 합니다.

#### 생성 결과 확인

Agent가 생성되면 Active 상태가 되고, Endpoint도 자동으로 생성됩니다.

#### SQL Agent 테스트하기

1. 생성된 Agent 상세 페이지에서 Endpoints 탭으로 이동합니다.

2. Endpoint의 "Launch Chat" 버튼을 클릭하여 Chat Playground를 엽니다.

3. 다음과 같은 질문을 테스트해봅니다:
   - "직원 목록을 보여줘"
   - "Give me list of employees"
   - "부서 ID가 1인 직원들을 알려줘"
   - "2020년 2월 이후에 입사한 직원은?"

Agent는 자연어 질문을 Oracle SQL로 변환하고 실행한 후, 결과를 한글로 표시합니다.

![test sql tool](/assets/img/aiml/2025/aiml/genai-agent-rag-oracle23ai/sql/test-sql-tool-kr.png)

> **Note**: SQL Tool이 올바른 응답을 반환하지 않는 경우, Tool의 Description이나 Custom Instructions에 인라인 예제를 추가하는 것이 도움이 됩니다. 자세한 내용은 [SQL Tool Guidelines](https://docs.oracle.com/en-us/iaas/Content/generative-ai-agents/sqltool-guidelines.htm#sqltool-iclexamples)를 참조하세요.

> **Note**: Agent가 잘못된 도구를 사용하는 경우, Description과 Routing Instructions를 더 상세히 작성해야 합니다.

> **Note**: 404 오류가 반환되는 경우, Policy가 누락되었을 가능성이 높습니다. Task 2의 Policy 설정을 다시 확인하세요.

> **Note**: 대용량 테이블을 쿼리하여 100개 이상의 결과가 반환되면 쿼리가 실패할 수 있습니다. 쿼리에 필터를 추가하여 응답 크기를 줄이세요.

---

## 마무리

본 실습에서는 OCI GenAI Agent를 활용하여 SQL Tool을 구성하고 Oracle Autonomous Database 23ai와 연동하여 자연어로 데이터베이스를 조회하는 시스템을 구축하는 전체 과정을 진행했습니다. VCN과 Private Subnet을 구성하고, Vault에 데이터베이스 인증 정보를 저장한 후, Database Tools Connection을 통해 Agent가 안전하게 데이터베이스에 접근할 수 있도록 설정했습니다.

주요 학습 내용:

- VCN, Subnet, Security List 구성을 통한 네트워크 설정
- Vault와 Secret을 활용한 데이터베이스 인증 정보 관리
- Autonomous Database 23ai 프로비저닝 및 Private Endpoint 구성
- Database Tools Connection 생성 및 검증
- SQL Tool 구성 및 자연어 쿼리 변환
- Routing Instructions, Description, Custom Instructions의 역할과 차이점
- Agent Endpoint 생성 및 테스트

SQL Tool을 사용하면 사용자가 SQL을 몰라도 자연어로 데이터베이스에 질의할 수 있어, 비즈니스 사용자와 데이터 분석가 모두에게 유용한 도구가 됩니다. 이 가이드가 OCI GenAI Agents를 활용한 프로젝트에 도움이 되기를 바랍니다.

## 참고

- [Region 구독](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingregions.htm#ariaid-title7)
- [Dynamic Groups](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingdynamicgroups.htm)
- [SQL Tool Guidelines for Generative AI Agents](https://docs.oracle.com/en-us/iaas/Content/generative-ai-agents/sqltool-guidelines.htm)
- [ADB Shared with Private Endpoint Access](https://docs.oracle.com/en-us/iaas/database-tools/doc/oracle-database-use-cases.html#OCDBT-GUID-C2C8BC15-EDB1-47D6-BDFC-852558C8D650)
- [Database Tools - ADB Shared with Public IP](https://docs.oracle.com/en-us/iaas/database-tools/doc/oracle-database-use-cases.html#OCDBT-GUID-87796740-BAE4-4805-BF6D-C75A02A3D1D4)
