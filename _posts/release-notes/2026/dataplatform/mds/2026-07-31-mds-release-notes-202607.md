---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2026년 7월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-mds
tags:
  - oci-release-notes-2026
  - Jul-2026
  - MDS
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

## HeatWave: Multi-Source Replication
* **Services:** MySQL HeatWave
* **Release Date:** July 08, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-multi-source-replication.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-multi-source-replication.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Inbound Replication](https://docs.oracle.com/iaas/mysql-database/doc/inbound-replication.html){:target="_blank" rel="noopener"}

### 업데이트 내용

MySQL HeatWave의 inbound replication이 multi-source replication을 지원합니다. 공식 Release Note에 따르면 하나의 replica DB system이 source별 replication channel을 사용해 최대 18개의 MySQL source에 연결할 수 있습니다.

여러 운영 MySQL source를 HeatWave 쪽으로 모아 통합 분석, 단계적 마이그레이션, reporting replica 구성을 할 때 활용 가치가 큽니다.

### Multi-Source Replication 구조

MySQL HeatWave inbound replication이 multi-source replication을 지원합니다. 하나의 replica DB system이 source별 replication channel을 사용해 최대 18개의 MySQL source에 연결할 수 있습니다. 통합 reporting, migration consolidation, 여러 source의 분석 복제에 활용할 수 있습니다.

### Channel 구성 예시

MySQL replication은 source별 channel 이름과 credential, binary log/GTID 설정을 분리해야 운영이 쉬워집니다. 아래는 MySQL replication channel 구성을 설명하기 위한 예시입니다.

```sql
CHANGE REPLICATION SOURCE TO
  SOURCE_HOST='source1.example.com',
  SOURCE_PORT=3306,
  SOURCE_USER='repl_user',
  SOURCE_PASSWORD='***',
  SOURCE_AUTO_POSITION=1
FOR CHANNEL 'source1_channel';

START REPLICA FOR CHANNEL 'source1_channel';
SHOW REPLICA STATUS FOR CHANNEL 'source1_channel'\G
```

### 충돌과 지연 관리

여러 source가 같은 schema/table/key range에 쓰면 충돌 가능성이 있습니다. source별 schema prefix, table mapping, filtering, initial load 순서를 설계하고, channel별 lag와 error를 개별 monitoring해야 합니다.

### 운영 체크

* 최대 18 source 한도 안에서 channel 수를 설계합니다.
* source별 GTID, network latency, replication user 권한을 검증합니다.
* 장애 시 특정 channel만 재시작할 수 있는 runbook을 준비합니다.
