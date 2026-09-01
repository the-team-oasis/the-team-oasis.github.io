---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "8월 OCI Database Service - Others 업데이트 소식"
teaser: "2026년 8월 OCI Database Service - Others 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-others
tags:
  - oci-release-notes-2026
  - Aug-2026
  - Others
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

## Big Data Service 3.4.0 new features and updates
* **Services:** Big Data
* **Release Date:** August 05, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/big-data/v3-4-0.htm](https://docs.oracle.com/iaas/releasenotes/big-data/v3-4-0.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/bigdata/manage-cluster-list-work-request-log.htm](https://docs.oracle.com/iaas/Content/bigdata/manage-cluster-list-work-request-log.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/bigdata/security-odh-ssl-enable-ss.htm](https://docs.oracle.com/iaas/Content/bigdata/security-odh-ssl-enable-ss.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/bigdata/overview.htm#bds-versions](https://docs.oracle.com/iaas/Content/bigdata/overview.htm#bds-versions){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/bigdata/manage-cluster-node-replace.htm](https://docs.oracle.com/iaas/Content/bigdata/manage-cluster-node-replace.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Big Data Service 3.4.0은 보안 인증서 관리, cluster lifecycle, Java runtime, 장애 복구와 운영 가시성을 함께 개선한 릴리스입니다. Hive metadata migration용 export script, 실패 원인을 구체적으로 표시하는 work request log, OCI Certificates Service 연동, 일부 Generic shape 지원, Ambari 3, component별 JDK 선택, 종료된 master·utility node 교체, cluster 검색·정렬과 Usersync 활성화가 포함됩니다.

### 업그레이드 영향과 설정

ODH 기반 3.4.0에서는 Hive(Tez), Flink, Flume, Kafka, Spark 3, HBase의 기본값이 JDK 11이고 Trino의 기본값은 JDK 21이며, 지원 component의 JDK는 Ambari에서 선택할 수 있습니다. SSL을 OCI Certificates Service로 관리하려면 cluster의 SSL, truststore, LDAP certificate 설정을 Ambari와 함께 점검해야 합니다. 실패한 work request는 Console의 **Work requests > Logs** 또는 `oci bds work-request-log-entry list --work-request-id <work_request_id>`로 확인할 수 있어 장애 분석 시간이 줄어듭니다.

### 제약 및 검증

Hive metadata export script는 Oracle Support 요청을 통해 제공되며, node backup을 이용한 failed-node replacement는 master와 utility node에 적용되고 worker node 교체는 이번 릴리스 범위에 포함되지 않습니다. Generic shape도 모든 구성이 아니라 지원되는 일부 `VM.Standard.Generic`과 `VM.DenseIO.Generic` 구성에 한정됩니다. 적용 전 component별 JDK 호환성과 Ambari 관리 항목을 테스트하고, 적용 후 cluster version, service health, certificate 상태, 대표 workload, work request log 조회와 node recovery 절차를 검증해야 합니다. Java 8은 향후 지원 component 상황에 따라 폐기될 예정이므로 기존 job 의존성도 함께 조사합니다.
