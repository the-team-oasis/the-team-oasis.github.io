---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "8월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2026년 8월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-dataplatform
tags:
  - oci-release-notes-2026
  - Aug-2026
  - DATAPLATFORM, DATABASE, ORACLE
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

## Oracle database Patch Compliance in Oracle Data Safe
* **Services:** Data Safe
* **Release Date:** August 04, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/data-safe/patch-compliance.htm](https://docs.oracle.com/iaas/releasenotes/data-safe/patch-compliance.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle OCI 공식 릴리즈 노트는 다음 업데이트를 안내합니다. Data Safe now includes Patch Compliance in Security Assessment. Patch Compliances provides a bird’s-eye view of the current patching.

## Configure HTTP Retry Behavior for DBMS_CLOUD.SEND_REQUEST
* **Services:** Autonomous Database Serverless
* **Release Date:** August 05, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-configure-http.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-configure-http.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle OCI 공식 릴리즈 노트는 다음 업데이트를 안내합니다. You can configure HTTP retry behavior for individual DBMS_CLOUD.SEND_REQUEST calls by using the optional retry_params parameter. The retry_params JSON object lets you disable retries, limit retry attempts, set a total retry timeout, and configure exponential backoff delays. This helps you control request duration and reduce pressure on temporarily unavailable endpoints, especially for scheduled jobs and batch workloads. The setting applies only to failures that DBMS_CLOUD already treats as retryable.

## Background Execution Of SQL Statements and Scripts
* **Services:** Database Tools
* **Release Date:** August 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-tools/backgrnd-execution.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/backgrnd-execution.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle OCI 공식 릴리즈 노트는 다음 업데이트를 안내합니다. SQL Worksheet in the Database Tools service now supports running SQL statements and scripts as background jobs. This capability.

## Database Tools MCP Server Enhancements
* **Services:** Database Tools
* **Release Date:** August 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-tools/gen-ai.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/gen-ai.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle OCI 공식 릴리즈 노트는 다음 업데이트를 안내합니다. The following enhancements are now available for Database Tools MCP server in OCI: You can now.

## Time Travel for Apache Iceberg Tables
* **Services:** Autonomous Database Serverless
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-time-travel.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-time-travel.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle OCI 공식 릴리즈 노트는 다음 업데이트를 안내합니다. You can query Apache Iceberg external tables as they existed at a specified time by using Oracle SQL AS OF TIMESTAMP. This lets you perform historical analysis, auditing, troubleshooting, and repeatable reporting on Iceberg data accessed through Databricks, AWS Glue, or Hadoop Catalog on OCI Object Storage.

## Changes to DBMS_CLOUD.EXPORT_DATA Parquet Type Mappings
* **Services:** Autonomous Database Serverless
* **Release Date:** August 18, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-export-data-changes.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-export-data-changes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle OCI 공식 릴리즈 노트는 다음 업데이트를 안내합니다. DBMS_CLOUD.EXPORT_DATA uses an implementation when exporting data in Parquet format, providing improved reliability and performance. This change also updates the Oracle-to-Parquet column type mappings in generated Parquet files.

## External File System Support for Workload Capture and Replay
* **Services:** Autonomous Database Serverless
* **Release Date:** August 18, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-external-file-system.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-external-file-system.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle OCI 공식 릴리즈 노트는 다음 업데이트를 안내합니다. You can use external file system support for workload capture and replay to store workload capture files, replay files, and replay reports in a customer-managed directory, in addition to Object Storage, giving you greater flexibility and control over workload storage and management.

## Service Logs for Database Tools MCP Servers
* **Services:** Database Tools
* **Release Date:** August 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-tools/logging.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/logging.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle OCI 공식 릴리즈 노트는 다음 업데이트를 안내합니다. Database Tools now supports OCI Logging for MCP servers, enabling you to collect service logs for MCP server operations..

## Maintenance Schedule Selection in OCI
* **Services:** Autonomous Database Serverless
* **Release Date:** August 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-maintenance-schedule.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-08-maintenance-schedule.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle OCI 공식 릴리즈 노트는 다음 업데이트를 안내합니다. You can change the maintenance window of an existing Autonomous AI Database instance using the Oracle Cloud Infrastructure Console. This capability helps pick a maintenance window for your Autonomous AI Database instance that is most convenient for your business needs.
