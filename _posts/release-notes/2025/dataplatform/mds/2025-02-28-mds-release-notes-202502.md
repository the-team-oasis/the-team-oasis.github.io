---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "2월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2025년 2월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2025-mds
tags:
  - oci-release-notes-2025
  - Jan-2024
  - MDS
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


## HeatWave: Timeout in switchover of high availability DB systems
* **Services**: HeatWave
* **Release Date**: February 25, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-ha-timeout.htm](https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-ha-timeout.htm){:target="_blank" rel="noopener"}
### 업데이트 내용
이전에는 고가용성(HA) 데이터베이스 시스템에서 주(primary) 인스턴스를 전환(switchover)할 때, 기존에 진행 중인 모든 트랜잭션이 완료될 때까지 기다려야 했으며, 장시간 걸리는 트랜잭션이 있을 경우 전환이 지연되었습니다.

하지만 이제 새롭게 생성하거나 업그레이드한 고가용성 DB 시스템에서는 스위치오버(switchover) 작업 시 **5분의 타임아웃(timeout)**이 적용됩니다. 즉, 기존에 실행 중인 트랜잭션이 모두 완료될 때까지 최대 5분 동안만 기다리며, 5분이 지나면 강제로 주(primary) 인스턴스를 전환합니다. 이때 5분 이내에 끝나지 않은 트랜잭션은 자동으로 **롤백(rollback)**됩니다.

## HeatWave: No downtime in updating the Configuration of a high availability DB system which changes only dynamic variables
* **Services**: HeatWave
* **Release Date**: February 18, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-config-ha.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-config-ha.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
고가용성(HA) DB 시스템의 설정을 업데이트할 때 동적 변수(dynamically adjustable variables)만 변경하는 경우, 더 이상 롤링 재시작(rolling restart)이 필요하지 않으며, 이에 따라 다운타임이 발생하지 않습니다.

- **max_connections**최대 동시 연결 수를 설정합니다.
- **wait_timeout / interactive_timeout**비활성 연결의 자동 종료 시간(초)을 지정합니다.
- **max_allowed_packet**클라이언트와 서버 간 전송되는 패킷의 최대 크기를 지정합니다.
- **thread_cache_size**스레드 재사용을 위한 캐시 크기를 설정하여 성능을 최적화합니다.
- **innodb_buffer_pool_size**InnoDB 스토리지 엔진의 버퍼 풀 크기를 지정합니다. (MySQL 8.0 이상에서 동적 변경 가능)
- **innodb_buffer_pool_instances**버퍼 풀의 분할 인스턴스 수를 설정합니다.
- **innodb_flush_log_at_trx_commit**트랜잭션 커밋 시 로그의 디스크 기록 방식을 제어합니다.
- **innodb_log_buffer_size**트랜잭션 로그 버퍼의 크기를 지정합니다.
- **sort_buffer_size**정렬 작업용 버퍼 크기를 지정합니다. (세션 변수)
- **join_buffer_size**조인 작업용 버퍼 크기를 지정합니다. (세션 변수)
- **read_buffer_size / read_rnd_buffer_size**순차 및 임의 읽기 작업의 버퍼 크기를 설정합니다. (세션 변수)
- **net_buffer_length**네트워크 통신용 기본 버퍼 크기를 설정합니다.
- **binlog_format**바이너리 로그 형식을 지정합니다. (예: ROW, STATEMENT, MIXED)
- **sync_binlog**바이너리 로그의 동기화 빈도를 제어합니다.
- **sql_mode**SQL 표준 준수 수준과 MySQL 동작 방식을 설정합니다.
- **auto_increment_increment / auto_increment_offset**복제 환경에서 자동 증가 값의 생성 방식을 제어합니다.
- **slow_query_log** 및 **long_query_time**느린 쿼리 감지와 로깅을 위한 성능 모니터링 설정입니다.

## HeatWave: Database and access modes
* **Services**: HeatWave
* **Release Date**: February 04, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-database-access-modes.htm](https://docs.oracle.com/en-us/iaas/releasenotes/mysql-database/heatwave-database-access-modes.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
기본적으로 HeatWave DB 시스템은 읽기-쓰기(read-write) 모드로 실행되며, 모든 유효한 사용자 계정이 자유롭게 연결할 수 있습니다. 하지만 이제 더욱 강력한 보안과 유연한 운영을 위해 새로운 데이터베이스 모드 및 접근 제한 기능이 추가되었습니다.

1. **읽기 전용(Read-Only)** 모드 지원

새롭게 추가된 읽기 전용 모드를 활성화하면 쓰기 작업(write operations)이 제한됩니다.

✔ 활용 사례: 이 기능은 인바운드 복제(inbound replication) 대상 DB로 활용할 때 특히 유용합니다.

2. **접근 제한(Restricted Access)** 모드

이제 특정 사용자 그룹만 DB 시스템에 연결할 수 있도록 접근 제한 모드를 설정할 수 있습니다.

✔ 활용 사례: 재해 복구(DB 시스템이 DR 용도로 사용될 경우) 또는 기타 보안이 중요한 환경에서 일반 사용자의 접근을 차단할 수 있습니다.


## HeatWave: Read endpoint
* **Services**: HeatWave
* **Release Dat**e: February 04, 2025
* **Documentation:** [https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-read-endpoint.htm](https://docs.oracle.com/iaas/releasenotes/mysql-database/heatwave-read-endpoint.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
Oracle Cloud Infrastructure(OCI)의 MySQL DB 시스템은 클라이언트 애플리케이션이 데이터베이스에 연결하여 데이터를 액세스할 수 있도록 다양한 유형의 엔드포인트를 제공합니다.

주요 엔드포인트 유형:
1.	Primary Endpoint(기본 엔드포인트):

    각 단독(standalone) 또는 고가용성(high availability) DB 시스템은 기본 엔드포인트를 보유하며, 이를 통해 클라이언트 애플리케이션은 DB 시스템에 연결하여 데이터에 대한 읽기 및 쓰기 작업을 수행할 수 있습니다.

2.	Read Endpoint(읽기 엔드포인트):

	선택적으로 생성할 수 있으며, 단독 또는 고가용성 DB 시스템에서 읽기 복제본(read replica)의 존재 여부와 관계없이 생성 가능합니다.
	연결 동작:
        활성화된 읽기 복제본이 있는 경우: 클라이언트 애플리케이션의 연결이 해당 읽기 복제본으로 전달됩니다.
        읽기 복제본이 없는 경우: 단독 DB 시스템에서는 MySQL 인스턴스로, 고가용성 DB 시스템에서는 기본 인스턴스로 연결됩니다.
	제한 사항:
        현재 읽기 엔드포인트는 최대 8 Gbps의 대역폭만 지원합니다.
        읽기 엔드포인트에 연결할 때 클라이언트 호스트 이름 또는 호스트 기반 액세스 제어 규칙을 사용할 수 없습니다. 이 경우, 계정 이름은 사용자 이름만으로 구성되어야 합니다.
        읽기 엔드포인트를 Oracle Cloud Infrastructure Network Load Balancer의 백엔드 서버로 구성할 수 없습니다.
        아웃바운드 복제 중에는 읽기 엔드포인트를 소스로 구성할 수 없으며, 기본 엔드포인트만 소스로 구성할 수 있습니다.
        IPv6이 활성화된 서브넷에서는 읽기 엔드포인트를 생성할 수 없습니다. DB 시스템과 읽기 엔드포인트는 IPv4 전용 서브넷에서 생성되어야 합니다.

3.	Read Replica Endpoint(읽기 복제본 엔드포인트):

    각 읽기 복제본은 자체 엔드포인트를 가지며, 이를 통해 클라이언트 애플리케이션은 해당 읽기 복제본에 연결하여 데이터를 읽을 수 있습니다.

4.	Read Replica Load Balancer Endpoint(읽기 복제본 로드 밸런서 엔드포인트):

    DB 시스템에 첫 번째 읽기 복제본이 생성되면 자동으로 생성됩니다.
	연결 동작: 클라이언트 애플리케이션이 이 엔드포인트에 연결하면, 연결은 DB 시스템의 활성화된 읽기 복제본 중 하나로 전달됩니다.
	특징: 읽기 엔드포인트가 활성화된 경우, 읽기 복제본 로드 밸런서는 읽기 엔드포인트와 동일한 네트워크 로드 밸런서를 공유하며, 동일한 호스트 이름 및 IP 주소 값을 가집니다.

이러한 엔드포인트 옵션을 활용하여 클라이언트 애플리케이션의 요구 사항에 맞게 MySQL DB 시스템에 효율적으로 연결할 수 있습니다.
