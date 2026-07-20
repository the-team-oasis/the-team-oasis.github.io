---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "5월 OCI AI Database 업데이트 소식"
teaser: "2026년 5월 OCI AI Database 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2026-aidb
tags:
  - oci-release-notes-2026
  - May-2026
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

## Introducing Database Tools MCP Server

- **Services:** Database Tools
- **Release Date:** May 12, 2026
- **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/database-tools/mcp.htm](https://docs.oracle.com/en-us/iaas/releasenotes/database-tools/mcp.htm){:target="_blank" rel="noopener"}
- **Documentation:** [Working With the Database Tools MCP Server](https://docs.oracle.com/en-us/iaas/database-tools/doc/working-database-tools-mcp-server.html){:target="_blank" rel="noopener"}, [Overview](https://docs.oracle.com/en-us/iaas/database-tools/doc/overview-mcp-server.html){:target="_blank" rel="noopener"}, [Creating a Database Tools MCP Server](https://docs.oracle.com/en-us/iaas/database-tools/doc/creating-mcp-server.html){:target="_blank" rel="noopener"}, [Connecting to an MCP Server](https://docs.oracle.com/en-us/iaas/database-tools/doc/connecting-mcp-server.html){:target="_blank" rel="noopener"}

### 업데이트 내용

**Database Tools MCP Server**가 새로 제공됩니다. Database Tools MCP Server는 Model Context Protocol (MCP)을 통해 MCP client가 Oracle AI Database에 안전하게 접근하도록 돕는 managed, multi-tenant service입니다.

이 서비스는 Database Tools Connection을 기반으로 데이터베이스에 연결하고, OAuth 2.0과 OCI IAM Identity Domains를 사용해 인증과 권한 부여를 처리합니다. 또한 built-in SQL/PLSQL tools와 custom SQL/PLSQL tools를 지원합니다.

### 주요 기능

- **Secure and serverless:** 별도 middleware를 배포하지 않고 Database Tools 서비스를 통해 승인된 database operation을 실행합니다.
- **Database support:** Oracle Database 19c 또는 Oracle AI Database 26ai 기반의 Oracle Database Cloud Service를 지원합니다.
- **Remote MCP support:** MCP client와 Streamable HTTP transport로 연동합니다.
- **Built-in tools:** SQL reporting, SQL script execution 같은 prebuilt MCP tool을 제공합니다.
- **Extensible:** SQL과 PL/SQL로 custom MCP tool을 만들 수 있습니다.
- **Authentication and authorization:** IAM Identity Domains와 OAuth 2.0을 사용하며, tool 접근은 application role로 제어합니다.

### 구성 흐름

Database Tools MCP Server를 사용하려면 먼저 대상 database에 대한 Database Tools Connection이 필요합니다. 이후 Console에서 Developer Services > Database Tools > Model Context Protocol Servers로 이동해 MCP Server를 생성하고, compartment, identity domain, database connection, Object Storage bucket, OAuth option, runtime identity를 설정합니다.

생성 후에는 MCP Server에 대한 application role을 사용자, 그룹 또는 client application에 할당합니다. MCP client는 OAuth 2.0 또는 Personal Access Token 방식으로 MCP Server에 연결할 수 있습니다.

### 활용 포인트

Database Tools MCP Server는 LLM application이나 agent framework가 데이터베이스에 직접 접근해야 할 때 유용합니다. 기존에는 애플리케이션 쪽에서 별도 middleware를 만들어 DB credential, SQL 실행, 권한 제어, 감사 로깅을 관리해야 했지만, MCP Server를 사용하면 OCI IAM과 Database Tools Connection을 활용해 더 통제된 방식으로 database query, SQL report, custom tool 실행을 제공할 수 있습니다.
