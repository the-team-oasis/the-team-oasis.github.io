---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "12월 OCI AI Database 업데이트 소식"
teaser: "2025년 12월 OCI AI Database 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-aidb
tags:
  - oci-release-notes-2025
  - Dec-2025
  - AI Database
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

# AI Database
## MCP Server for Autonomous AI Database
- **Services:** Autonomous Database Serverless
- **Release Date:** December 23, 2025
- **Documentation:** [https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/mcp-server.html](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/mcp-server.html){:target="\_blank" rel="noopener"}

### 업데이트 내용
Oracle Autonomous AI Database에 내장된 관리형, Multi Tenant 서버로, Database 내부 기능 및 도구를 **표준화된 MCP 프로토콜**을 통해 외부 AI Agent나 Client Application이 보안,통제된 방식으로 접근할 수 있게 해주는 MCP 서버입니다.


### Use MCP Server
Autonomous AI Database의 MCP 서버를 사용하기 위해서는 기본적으로 다음 IAM 정책이 필요합니다.
```
Allow group <group-name> to use autonomous-databases in tenancy where target.id = '<database-OCID>'
```

Autonomous AI Database의 MCP 서버 활성화를 위해서는 구성한 Autonomous AI Database의 free-form Tag를 다음과 같이 추가하면 됩니다.
```
Tag Name: adb$feature Tag Value: {"name":"mcp_server","enable":true}
```

***For example:***
![](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/img/adb_enable_mcp_server.png)

MCP 서버를 활성화 하면 다음과 같은 URL을 통해서 MCP Client에서 접속이 가능합니다.
```
https://dataaccess.adb.{region-identifier}.oraclecloudapps.com/adb/mcp/v1/databases/{database-ocid}
```

#### Configure your AI agent application
**OAuth authentication**

Claude와 같은 MCP Client에서는 다음과 같은 json 포멧을 사용해서 OAuth 인증하도록 구성합니다.
```json
{
  "mcpServers": {
    "sales_database_mcp_server": {  
      "description": "A database that contains all sales-related information, such as transactions, customers, and product details.",
      "command": "/opt/homebrew/bin/npx",  
      "args": [                            
        "-y",
        "mcp-remote",
        "https://dataaccess.adb.{region-identifier}.oraclecloudapps.com/adb/mcp/v1/databases/{database-ocid}", 
        "--allow-http"
      ],
      "transport": "streamable-http"       
    }
   }
  }
```

**Bearer token authentication**
Bearer token을 활용하는 경우는 다음과 같은 URL을 통해서 HTTP Post 방식으로 호출합니다.
```
curl --location 'https://dataaccess.adb.{region-identifier}.oraclecloudapps.com/adb/auth/v1/databases/{database-ocid}/token' \
  --header 'Content-Type: application/json' \
  --header 'Accept: application/json' \
  --data '{
    "grant_type":"password",
    "username":"<db-username>",
    "password":"<db-password>"
  }'
```

아래 예시는 MCP Client로 Visual Studio Code with [Cline](https://docs.cline.bot/getting-started/installing-cline)을 활용해서 Bearer Token 방식으로 호출하는 예시입니다.
```
{
  "mcpServers": {  
    "sales-database": {
      "timeout": 300,
      "type": "streamableHttp",  
      "url": "https://dataaccess.adb.{region-identifier}.oraclecloudapps.com/adb/mcp/v1/databases/{database-ocid}",
      "headers": {
        "Authorization":"Bearer <your-token>" 
      }
    }
  }
}
```

#### MCP 서버의 도구 구성
Autonomous Database MCP Server는 Select AI Agent를 통해서 등록된 도구를 표준 MCP 도구 형태로 외부에 노출할 수 있습니다. 즉 다음과 같이 Select AI Agent를 통해서 생성 가능한 도구들이 MCP 도구가 될 수 있습니다.
* SQL 실행
* PL/SQL 프로시저
* Select AI 기능 (RAG, NL2SQL, Translate 등)
* Custom AI Agent Action
* 외부 REST 호출을 감싼 PL/SQL 로직

다음은 PL/SQL 프로시저를 Select AI Agent 도구로 생성한 예시로 이렇게 생성된 도구는 MCP 서버를 통해서 외부로 노출됩니다.  
***PL/SQL 프로시저 생성***
```sql
CREATE OR REPLACE PROCEDURE get_customer_summary (
  p_customer_id IN NUMBER,
  p_result OUT CLOB
) AS
BEGIN
  SELECT JSON_OBJECT(
           'customer_id' VALUE c.customer_id,
           'name' VALUE c.name,
           'total_orders' VALUE COUNT(o.order_id)
         )
  INTO p_result
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
  WHERE c.customer_id = p_customer_id
  GROUP BY c.customer_id, c.name;
END;
/
```

***Select AI Agent에 도구로 등록***
```sql
BEGIN
  DBMS_CLOUD_AI.CREATE_AGENT_TOOL(
    agent_name => 'SALES_AGENT',
    tool_name  => 'get_customer_summary',
    tool_type  => 'PLSQL',
    tool_spec  => '{
      "procedure": "GET_CUSTOMER_SUMMARY",
      "description": "Return customer summary information"
    }'
  );
END;
/
```

이렇게 생성한 프로시져는 바로 MCP 도구로 사용됩니다.