---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "OCI Database Management Service 살펴보기"
teaser: "OCI (Oracle Cloud Infrastructure) 의 Database Management 서비스에서 제공하는 다양한 기능과 활용 방법에 대해 알아봅니다."
author: yhcho
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, oracle database, database management, perfomance hub]
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

## 서비스 소개
 
OCI Database Management Cloud Service를 통해 DBA는 모니터링, 성능 관리, 튜닝 및 관리를 위한 수명 주기 데이터베이스 관리 기능을 갖춘 온프레미스 및 클라우드 데이터베이스를 위한 통합 콘솔을 얻을 수 있습니다. 
고급 데이터베이스 플리트 진단 및 튜닝을 사용하여 문제를 해결하고 성능을 최적화하거나, 실시간 SQL 모니터링으로 SQL을 최적화하고 데이터베이스 구성을 단순화할 수 있습니다.

이번 포스팅에서는 Database Management 옵션과 Basic, Full 유형별 활용 방법에 대하여 알아보겠습니다.

만약 Database Management 기능을 활성화 하지 않은 경우 먼저 아래 포스팅을 참고하여 활성화하여야 합니다. 

> [OCI Database Management Service 활성화 방법 실습](dataplatform/oci-database-management-hands-on/){:target="_blank" rel="noopener"}

## Oracle Database 를 위한 데이터베이스 관리 옵션

데이터베이스 관리 기능은 전체(Full) 관리 및 기본(Basic) 관리 옵션 중 선택하여 사용할 수 있습니다. 기본 관리 옵션은 추가 비용 없이 사용할 수 있습니다

### 전체(Full) 관리, 기본(Basic) 관리 옵션 비교

주요 차이점으로 기본(Basic) 관리에서는 PDB를 지원하지 않습니다. 상세한 기능 비교는 아래 지원기능 비교를 확인하세요. 

| 전체 관리(Full management) 지원 기능  	                             | 기본 관리(Basic management) 지원 기능  	                                                                                    |
|-------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| 데이터베이스 플리트(fleet) 모니터링  	                                   | 14개 항목의 데이터베이스 모니터링 지표가 제공됨. <br>예를 들어 `CpuUtilization`, `StorageAllocated`, 그리고 `UserCalls` (전체 항목은 아래에서 확인 가능)  	 |
| 단일 관리 데이터베이스 모니터링  	                                        | 성능 허브(Performance Hub)콘솔을 통해 ASH 분석, AWR Report, 그리고 SQL 모니터링 기능이 제공됨   	                                           |
| Exadata 모니터링과 같은 고급 기능을 포함한 성능 허브(Performance Hub) 기능 제공  	 | 데이터베이스 관리 콘솔의 대시보드 중 기본(Basic) 기능에서 제공하는 항목으로 구성된 대시보드 기능                                                           |
| RAC 데이터베이스 모니터링  	                                          | 	                                                                                                                   |
| SQL Tuning Advisor  	                                       | 	                                                                                                                   |
| 데이터베이스 관리 기능들  	                                            | 	                                                                                                                   |
| 대시보드 기능들  	                                                 | 	                                                                                                                   |

> 일부 대시보드를 제외한 다른 데이터베이스 관리 콘솔의 기능은 기본(Basic) 관리 옵션에서 사용할 수 없습니다.

#### 기본(Basic) 데이터베이스 관리에서 제공하는 모니터링 항목

데이터베이스 관리 서비스에서 집계된 모니터링 항목은 `oracle_oci_database` 네임스페이스로 제공됩니다. 아래는 데이터 베이스 기본(Basic) 관리 옵션에서 제공하는 모니터링 항목들 입니다.

| Metric Name                    | Metric Display Name                     | Unit               | Description and Metric Chart Defaults                                                                                                                                                                                                                                              | Collection Frequency | Dimensions                                           |
|------------------|-----------------------------------------|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------|------------------------------------------------------|
| BlockChanges                   | DB Block Changes                        | changes per second | 초당 변경된 평균 블록 수입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                                                                                                                                 | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>   |
| CpuUtilization                 | CPU Utilization                         | percent            | 모든 소비자 그룹에서 집계된 CPU 사용률은 백분율로 표시됩니다\. 사용률은 데이터베이스에서 사용할 수 있는 CPU 수(OCPU 수의 2배)와 관련하여 보고됩니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                                                        | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>   |
| CurrentLogons                  | Current Logons                          | count              | 선택한 간격 동안 성공한 로그온 수입니다\.<br><br>Statistics: Sum<br>Interval: 1 minute<br>                                                                                                                                                                                                            | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>   |
| ExecuteCount                   | Execute Count                           | count              | 선택한 간격 동안 SQL 문을 실행한 사용자 및 재귀 호출 수입니다\.<br><br>Statistic: Sum<br>Interval: 1 minute<br>                                                                                                                                                                                              | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>   |
| MonitoringStatus               | Monitoring Status                       | NA                 | 리소스의 모니터링 상태입니다. 메트릭 수집이 실패하면 이 메트릭에서 오류 정보가 캡처됩니다\.<br><br>Statistic: Mean<br>Interval: 5 minutes<br>                                                                                                                                                                               | 5 minutes            | <br>collectionName<br>errorSeverity<br>errorCode<br> |
| OcpusAllocated                 | OCPU Allocated                          | integer            | 선택한 시간 간격 동안 서비스에서 할당한 실제 OCPU 수입니다\.<br><br>Statistic: Count<br>Interval: 1 minute<br>                                                                                                                                                                                                | 5 minutes            | NA                                                   |
| ParseCount                     | Parse Count \(Total\)                   | count              | 선택한 간격 동안의 하드 및 소프트 구문 분석 수입니다\.<br><br>Statistic: Sum<br>Interval: 1 minute<br>                                                                                                                                                                                                       | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>   |
| StorageAllocated               | Allocated Storage Space                 | GB                 | 수집 시간에 데이터베이스에 할당된 총 스토리지 공간입니다\.<br><br>Statistic: Max<br>Interval: 30 minutes<br>                                                                                                                                                                                                    | 30 minutes           | NA                                                   |
| StorageAllocatedByTablespace   | Allocated Storage Space By Tablespace   | GB                 | 수집 시간에 테이블스페이스에 할당된 총 스토리지 공간입니다. CDB의 경우 이 메트릭은 루트 컨테이너 테이블스페이스를 제공합니다\.<br><br>Statistic: Max<br>Interval: 30 minutes<br>                                                                                                                                                            | 30 minutes           | <br>tablespaceName<br>tablespaceType<br>             |
| StorageUsed                    | Storage Space Used                      | GB                 | 테이블스페이스, 플래시 복구 영역, 제어 파일 및 로그 파일이 사용하는 공간을 포함하여 수집 시간에 데이터베이스가 사용하는 총 스토리지입니다.\.<br><br>Statistic: Max<br>Interval: 30 minutes<br>                                                                                                                                                    | 30 minutes           | NA                                                   |
| StorageUsedByTablespace        | Storage Space Used By Tablespace        | GB                 | 수집 시간에 테이블스페이스에서 사용하는 총 스토리지 공간입니다. CDB의 경우 이 메트릭은 루트 컨테이너 테이블스페이스를 제공합니다\. <br><br>Statistic: Max<br>Interval: 30 minutes<br>                                                                                                                                                         | 30 minutes           | <br>tablespaceName<br>tablespaceType<br>             |
| StorageUtilization             | Storage Utilization                     | percent            | 현재 사용 중인 프로비저닝된 스토리지 용량의 비율입니다. 모든 테이블스페이스에 할당된 총 공간을 나타냅니다\.<br><br>Statistic: Mean<br>Interval: 30 minutes<br>                                                                                                                                                                       | 30 minutes           | NA                                                   |
| StorageUtilizationByTablespace | Storage Space Utilization By Tablespace | percent            | 수집 시간에 테이블스페이스에서 사용하는 스토리지 공간의 백분율입니다. CDB의 경우 이 메트릭은 루트 컨테이너 테이블스페이스를 제공합니다\.<br><br>Statistic: mean<br>Interval: 30 minutes<br> | 30 minutes           | <br>tablespaceName<br>tablespaceType<br>             |
| TransactionCount               | Transaction Count                       | count              | 선택한 간격 동안 사용자 커밋과 사용자 롤백을 합한 수입니다\.<br><br>Statistic: Sum<br>Interval: 1 minute<br>                                                                                                                                                   | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>   |
| UserCalls                      | User Calls                              | count              | 선택한 간격 동안 결합된 로그온, 구문 분석 및 실행 호출 수입니다\.<br><br>Statistic: Sum<br>Interval: 1 minute<br>                                                                                                                                                | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>   |


#### 전체(Full) 데이터베이스 관리에서 제공되는 모니터링 항목

데이터베이스 관리 서비스에서 집계된 모니터링 항목은 `oracle_oci_database` 네임스페이스로 제공됩니다. 아래는 데이터 베이스 전체(Full) 관리 옵션에서 제공하는 모니터링 항목입니다.

| Metric Name                             | Metric Display Name                       | Unit                    | Description and Metric Chart Defaults                                                                                                                                                                                                 | Collection Frequency | Dimensions                                                                                                                                                                                                                                       |
|-------------------------------|-------------------------------------------|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------|------------------------------------------------------------------------------------------------------------------------------|
| AllocatedStorageUtilizationByTablespace | Allocated Space Utilization By Tablespace | percent                 | 할당된 공간 중 테이블스페이스가 사용하는 공간의 백분율입니다. CDB의 경우 이 메트릭은 루트 컨테이너 테이블스페이스에 대한 데이터를 제공합니다\.<br><br>Statistic: Mean<br>Interval: 30 minutes<br>                                                                                                     | 30 minutes           | <br>tablespaceName<br>tablespaceType<br>                                                                                                                                                                                                         |
| AvgGCCRBlockReceiveTime                 | Average GC CR Block Receive Time          | milliseconds            | 평균 글로벌 캐시 일관성 읽기(CR) 블록 수신 시간입니다\.<br><br>Statistic: Mean<br>Interval: 5 minutes<br><br>_RAC CDB 및 RAC non-CDB 전용_\.<br>                                                                                                              | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| BlockingSessions                        | Blocking Sessions                         | count                   | 현재 차단 세션\.<br><br>Statistic: Max<br>Interval: 15 minutes<br><br>_CDB에는 적용되지 않습니다._\.<br>                                                                                                                                              | 15 minutes           | NA                                                                                                                                                                                                                                               |
| CPUTime                                 | CPU Time                                  | seconds per second      | 시간 간격 동안 데이터베이스 인스턴스의 포그라운드 세션별 평균 CPU 시간 누적 비율입니다. 평균 활성 세션의 CPU 시간 구성 요소입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                      | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| dbmgmtJobExecutionsCount                | Job Executions                            | count                   | 단일 관리 데이터베이스 또는 데이터베이스 그룹에 대한 SQL 작업 실행 수 및 해당 상태. 상태 차원은 "성공", "실패", "진행 중" 값일 수 있습니다\.<br><br>Statistic: Sum<br>Interval: 1 minute<br>                                                                                              | NA                   | <br>managedDatabaseId<br>managedDatabaseGroupId<br>jobId<br>status<br>                                                                                                                                                                           |
| DBTime                                  | DB Time                                   | seconds per second      | 시간 간격 동안 데이터베이스 인스턴스의 포그라운드 세션별 평균 데이터베이스 시간 누적 비율(CPU + 대기)입니다. 평균 활성 세션이라고도 합니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                  | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| FRASpaceLimit                           | Flash Recovery Area Limit                 | GB                      | 플래시 복구 영역 공간 제한입니다\.<br><br>Statistic: Max<br>Interval: 15 minutes<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                                     | 15 minutes           | NA                                                                                                                                                                                                                                               |
| FRAUtilization                          | Flash Recovery Area Utilization           | percent                 | 플래시 복구 영역 사용률입니다\.<br><br>Statistic: Mean<br>Interval: 15 minutes<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                                      | 15 minutes           | NA                                                                                                                                                                                                                                               |
| GCCRBlocksReceived                      | GC CR Blocks Received                     | blocks per second       | 초당 받은 글로벌 캐시 CR 블록입니다\.<br><br>Statistic: Mean<br>Interval: 5 minutes<br><br>_RAC CDB 및 RAC non-CDB 전용_\.<br>                                                                                                                         | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| GCCurrentBlocksReceived                 | GC Current Blocks Received                | blocks per second       | 초당 받은 글로벌 캐시 현재 블록입니다\.<br><br>Statistic: Mean<br>Interval: 5 minutes<br><br>_RAC CDB 및 RAC non-CDB 전용_\.<br>                                                                                                                         | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| InterconnectTraffic                     | Average Interconnect Traffic              | MB per second           | 노드 간 평균 데이터 전송률입니다\.<br><br>Statistic: Mean<br>Interval: 5 minutes<br><br>_RAC CDB 및 RAC non-CDB 전용_\.<br>                                                                                                                            | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| InvalidObjects                          | Invalid Objects                           | count                   | 유효하지 않은 데이터베이스 개체의 수입니다\.<br><br>Statistic: Max<br>Interval: 24 hours<br><br>_CDB에는 적용되지 않습니다_\.<br>                                                                                                                                  | 24 hours             | NA                                                                                                                                                                                                                                               |
| IOPS                                    | IOPS                                      | operations per second   | 초당 평균 IO 작업 수입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                                                                                   | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>ioType \(Read, Write\)<br>                                                                                                                                                                     |
| IOThroughput                            | IO Throughput                             | MB per second           | 평균 처리량(MB/초)입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                                                                                    | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>ioType \(Read, Write\)<br>                                                                                                                                                                     |
| LogicalBlocksRead                       | Logical Reads                             | reads per second        | 초당 SGA/메모리(버퍼 캐시)에서 읽은 평균 블록 수입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                                                                  | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| MaxTablespaceSize                       | Max Tablespace Size                       | GB                      | 가능한 최대 테이블스페이스 크기입니다. CDB의 경우 이 메트릭은 루트 컨테이너 테이블스페이스에 대한 데이터를 제공합니다\.<br><br>Statistic: Max<br>Interval: 30 minutes<br>                                                                                                               | 30 minutes           | <br>tablespaceName<br>tablespaceType<br>                                                                                                                                                                                                         |
| MemoryUsage                             | Memory Usage                              | MB                      | 메모리 풀의 총 크기입니다\.<br><br>Statistic: Mean<br>Interval: 15 minutes<br>                                                                                                                                                                   | 15 minutes           | <br>instanceNumber<br>instanceName<br>hostName<br>memoryType \(SGA, PGA\)<br>memoryPool \(AllocatedPGA, BufferCache, FixedSGA, JavaPool, LargePool, LogBuffer,<br>                                    OtherPools, SharedPool, StreamsPool \)<br> |
| NonReclaimableFRA                       | Non Reclaimable Fast Recovery Area        | percent                 | 회수 불가능한 빠른 복구 영역입니다\.<br><br>Statistic: Mean<br>Interval: 15 minutes<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                                   | 15 minutes           | NA                                                                                                                                                                                                                                               |
| ParsesByType                            | Parses By Type                            | parses per second       | 초당 하드 또는 소프트 구문 분석 수입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                                                                            | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>parseType \(HardParse, SoftParse\)<br>                                                                                                                                                         |
| ProblematicScheduledDBMSJobs            | Problematic Scheduled DBMS Jobs           | count                   | 문제가 있는 예약된 데이터베이스 작업의 수입니다\.<br><br>Statistic: Max<br>Interval: 15 minutes<br><br>_CDB에는 적용되지 않습니다_\.<br>                                                                                                                             | 15 minutes           | type \(Broken, Failed\)                                                                                                                                                                                                                          |
| Processes                               | Process Count                             | count                   | 데이터베이스 프로세스의 수입니다\.<br><br>Statistic: Max<br>Interval: 1 minute<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                                        | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| ProcessLimitUtilization                 | Process Limit Utilization                 | percent                 | 프로세스 제한 활용\.<br><br>Statistic: Mean<br>Interval: 1 minute<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                                              | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| ReclaimableFRA                          | Reclaimable Fast Recovery Area            | percent                 | 회수 가능한 빠른 복구 영역\.<br><br>Statistic: Mean<br>Interval: 15 minutes<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                                       | 15 minutes           | NA                                                                                                                                                                                                                                               |
| ReclaimableFRASpace                     | Flash Recovery Area Reclaimable Space     | GB                      | 플래시 복구 영역 회수 가능 공간입니다\.<br><br>Statistic: Mean<br>Interval: 15 minutes<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                                 | 15 minutes           | NA                                                                                                                                                                                                                                               |
| RedoSize                                | Redo Generated                            | MB per second           | 생성된 Redo 의 평균 양입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                                                                                 | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| SessionLimitUtilization                 | Session Limit Utilization                 | percent                 | 세션 제한 사용률입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                           | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| Sessions                                | Sessions                                  | count                   | 데이터베이스의 세션 수입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                                                              | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>                                                                                                                                                                                               |
| TransactionsByStatus                    | Transactions By Status                    | transactions per second | 초당 커밋되거나 롤백된 트랜잭션 수입니다\.<br><br>Statistic: Mean<br>Interval: 1 minute<br>                                                                                                                     | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>transactionStatus \(Committed, RolledBack\)<br>                                                                                                                                                |
| UnusableIndexes                         | Unusable Indexes                          | count                   | 데이터베이스 스키마에서 사용할 수 없는 인덱스의 수입니다\.<br><br>Statistic: Max<br>Interval: 24 hours<br><br>_CDB에는 적용되지 않습니다_\.<br>                                                                                                     | 24 hours             | schemaName                                                                                                                                                                                                                                       |
| UsableFRA                               | Usable Fast Recovery Area                 | percent                 | 사용 가능한 빠른 복구 영역\.<br><br>Statistic: Mean<br>Interval: 15 minutes<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                         | 15 minutes           | NA                                                                                                                                                                                                                                               |
| UsedFRASpace                            | Flash Recovery Area Usage                 | GB                      | 플래시 복구 영역 공간 사용량입니다\.<br><br>Statistic: Max<br>Interval: 15 minutes<br><br>_PDB에는 적용되지 않습니다_\.<br>                                                                                                                    | 15 minutes           | NA                                                                                                                                                                                                                                               |
| WaitTime                                | Wait Time                                 | seconds per second      | 시간 간격 동안 데이터베이스 인스턴스의 포그라운드 세션에 의한 비유휴 대기 시간의 평균 누적 비율입니다. 평균 활성 세션의 대기 시간 구성 요소입니다\.<br><br>Statistic: Mean<br>Interval: 5 minutes<br> | 5 minutes            | <br>instanceNumber<br>instanceName<br>hostName<br>waitClass<br>                                                                                                                                                                                  |

### 성능 허브 (Performance Hub)의 기능 알아보기

성능 허브(Performance Hub)는 여러 탭과 옵션으로 구성되어 있으며 데이터베이스를 모니터링할 수 있도록 다양한 보고서를 제공합니다.
성능 허브는 데이터베이스 세부정보 화면에서 **"성능 허브"** 버튼을 클릭하여 이동할 수 있습니다. <mark>(데이터베이스 관리 기능이 활성화 되어야 사용 가능)</mark>

![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-1.png)

![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-2.png)

#### 성능 허브(Performance Hub) 지원 탭

* ASH (Active Session History) 분석
  * ASH 분석 탭에는 ASH 데이터를 탐색하는 데 사용할 수 있는 활성 세션 기록(Active Session History) 분석 차트가 표시됩니다.
  * 이 탭을 사용하여 Consumer Group, Wait Class, SQL ID, User Name 등과 같은 여러 차원에서 데이터베이스 성능을 드릴다운할 수 있습니다.
  * ASH 분석 탭에서 평균 활성 세션 차원을 선택하고 선택한 기간 동안 해당 차원의 상위 활동을 볼 수 있습니다. 평균 활성 세션 차트에는 차트 오른쪽 끝에 표시되는 ASH 데이터의 해상도를 선택할 수 있는 컨트롤이 있습니다.
  <br><br>_ASH 분석 탭 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-3.png)
  <br><br>_ASH 분석 탭 세션 세부정보 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-4.png)
  <br><br>_ASH 분석 탭 세션 세부정보 측정항목 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-5.png)
  <br><br>_ASH 분석 탭 세션 세부정보 SQL 모니터 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-6.png)<br>

* SQL 모니터링
  * SQL 모니터링 탭에는 모니터링되는 SQL 문을 표시하는 테이블이 포함되어 있습니다.
  * SQL 모니터링 탭의 테이블에는 마지막 활성 시간, CPU 시간, 데이터베이스 시간 등과 같은 차원별로 SQL 문 실행이 표시됩니다. 현재 실행 중인 SQL 문에 대한 정보뿐만 아니라 완료, 실패 또는 종료된 SQL 문에 대한 정보도 제공합니다. 이 테이블은 모니터링되는 SQL 문에 대한 상태, 기간, SQL ID 등을 포함하는 열로 구성됩니다.
  <br><br>_SQL 모니터링 탭 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-7.png)
  <br><br>_실시간 SQL 모니터링 - 계획 통계 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-8.png)
  <br><br>_실시간 SQL 모니터링 - 병렬 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-9.png)
  <br><br>_실시간 SQL 모니터링 - SQL 텍스트 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-10.png)<br>

* 자동 데이터베이스 진단 모니터(ADDM) - _<mark>해당 기능은 기본(Basic) 관리에서 제공되지 않습니다.</mark>_
  * ADDM은 AWR( Automatic Workload Repository ) 데이터를 정기적으로 분석한 다음 성능 문제의 근본 원인을 찾고 문제 해결을 위한 권장 사항을 제공하며 응용 프로그램의 문제가 아닌 영역을 식별합니다. AWR은 과거 성능 데이터의 저장소이므로 ADDM을 사용하여 이벤트 후 성능 문제를 분석할 수 있으므로 문제를 재현하는 데 필요한 시간과 리소스를 절약할 수 있습니다.
  <br><br>_ADDM 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-11.png)<br>

* 차단 세션 - _<mark>해당 기능은 기본(Basic) 관리에서 제공되지 않습니다.</mark>_
  * 차단 세션 탭에는 현재 차단 및 대기 중인 세션이 계층 구조로 표시됩니다.
  * 이 탭에서 다음을 수행할 수 있습니다. 
    * 각 차단 세션에 대한 자세한 정보를 확인하고 각 차단 세션에서 차단된 세션을 확인합니다. 
    * 관련된 SQL을 검사하거나 드릴다운하여 차단의 원인을 확인합니다. 
    * 대기 중인 세션 문제를 해결하기 위해 하나 이상의 나열된 세션 종료를 포함하여 여러 문제 해결 작업을 수행합니다.
  <br><br>_차단 중인 세션 화면_
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/perfomance-hub-12.png)<br>

* 워크로드 - _<mark>해당 기능은 기본(Basic) 관리에서 제공되지 않습니다.</mark>_
  * 워크로드 탭에는 데이터베이스 워크로드를 모니터링하고 급증 및 병목 현상을 식별하는 데 사용할 수 있는 네 가지 통계 세트가 그래픽으로 표시됩니다.
* 엑사데이터 - _<mark>해당 기능은 기본(Basic) 관리에서 제공되지 않습니다.</mark>_
  * Exadata 탭은 Oracle Exadata 하드 디스크 및 플래시 성능 통계의 통합 보기를 제공합니다. 
  * 데이터베이스, Exadata 스토리지 셀 및 ASM(Automatic Storage Management)을 포함한 시스템 구성 요소의 상태와 성능에 대한 깊은 통찰력을 제공합니다. Exadata 데이터베이스에 대한 향상된 성능 진단을 위해 Exadata 탭을 사용할 수 있습니다

#### 성능 허브(Performance Hub)를 통해 분석할 수 있는 사례 예시

성능 허브의 다양한 탭과 옵션을 활용하여 선택한 데이터베이스를 모니터링하고 성능을 분석할 수 있습니다. 아래는 분석할 수 있는 요건 예시이며 이 외에도 더 많은 케이스에 대한 분석을 제공할 수 있습니다.

* CPU 또는 디스크 I/O와 같은 리소스를 기다리는 데이터베이스의 양
* 지정된 기간 동안 데이터베이스 성능이 저하되었는지 여부 및 가능한 원인
* 어떤 특정 모듈이 시스템에 로드를 유발하고 대부분의 데이터베이스 시간이 모듈에 소요되는 위치
* 어떤 SQL 문이 데이터베이스 성능 변화의 주요 원인이며 어떤 실행이 이러한 변화를 일으키는가
* 성능 병목 현상을 일으키는 사용자 세션
* 현재 차단 중인 세션 및 잠금에 대한 미해결 요청이 있는 경우
* 현재 데이터베이스를 방해할 수 있는 데이터베이스
* 어떤 데이터베이스, 디스크 및 셀이 높은 I/O 로드를 유발하고 있으며 로드가 백업, 재조정 또는 사용자 I/O에 대한 것인지 여부
* 어떤 셀이 CPU 바운드이며 셀 오프로드를 결정하는 방법
* 소프트웨어 버전 및 디스크 상태를 포함한 데이터베이스 구성 정보


### 데이터베이스 관리(Database Management) 기능 알아보기

데이터베이스 관리 서비스에서는 플리트 요약, 대시보드, 데이터베이스 그룹 등의 기능을 제공합니다. 다만 <mark>기본 관리에서는 대시보드의 일부 항목만 표시됩니다.</mark>

#### 플리트 요약(Fleet Summary) 기능 사용하기

플리트 요약 화면을 통해 사용자는 데이터베이스가 위치한 구획이나 데이터베이스 그룹 전체에 속한 오라클 데이터베이스의 인벤토리에 대한 모니터링과 Insight를 확보할 수 있습니다.

1. 전체 메뉴에서 "관찰 가능성 및 관리 - 데이터베이스 관리 - 플리트 요약" 메뉴를 클릭하여 서비스 화면으로 이동합니다.
   ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-0.png)

2. 이동한 화면에서 모니터링하고자 하는 구획 또는 데이터베이스 그룹을 선택합니다.
   ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-1.png)

3. 해당 구획이나 데이터베이스 그룹에 속한 데이터베이스의 **<mark>평균 활성 세션, CPU, 스토리지 I/O</mark>** 등의 항목에 대한 상태와 성능을 모니터링 합니다.
   ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-2.png)

4. 각 데이터베이스에는 현재 CPU 및 스토리지 사용량이 있으며 선택한 기간과 비교 기간 사이의 데이터베이스 메트릭 비교를 퍼센트로 보여주는 기능도 포함됩니다. 이 기능을 사용하면 데이터베이스 리소스 사용량 추세를 파악할 수 있습니다.
   ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-5.png)


#### 특정 데이터베이스 모니터링 하기

플리트 요약 페이지나 데이터베이스 세부정보 화면에서 특정 데이터베이스를 모니터링 할 수 있는 화면으로 이동할 수 있습니다.

* 플리트 요약 페이지에서 이동하려면 CDB 또는 PDB의 이름을 클릭하여 관리 데이터베이스 세부정보 화면으로 이동할 수 있습니다.
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-3.png)

* 데이터베이스 세부정보 화면에서 이동하려면 데이터베이스 정보의 "연관된 서비스 - 데이터베이스 관리"의 링크 버튼을 클릭하여 관리 데이터베이스 세부정보 화면으로 이동할 수 있습니다.
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-4.png)

##### 데이터베이스 관리 콘솔 살펴보기

데이터베이스 관리 세부정보 화면으로 이동하면 관리 기능이 연결된 CDB, PDB를 아래와 같이 확인할 수 있습니다.
각 데이터베이스 별로 타임라인 별 데이터베이스 상태와 현재 데이터베이스의 작업, 스토리지 I/O, 메모리 활용율, 스토리지 할당 및 사용 현황을 확인할 수 있습니다.

CDB 요약 화면 예시
![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-6.png)

PDB 요약 화면 예시 (PDB가 여러개인 경우 목록에서 PDB를 선택하여 세부정보로 이동할 수 있습니다.)
![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-7.png)<br><br>
![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-8.png)

##### 경보 로그 확인하기

데이터베이스 관리 화면 우측 리소스 패널에서 "경보 로그" 메뉴를 클릭하여 해당 데이터베이스의 경보 로그, 주의 로그를 확인할 수 있습니다. 
주의 로그는 21c 버전 이후 부터 사용할 수 있습니다.

![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-9.png)

##### 테이블스페이스 현황 확인 및 관리 기능 사용하기

데이터베이스 관리 화면 우측 리소스 패널에서 "테이블스페이스" 메뉴를 클릭하여 해당 데이터베이스의 테이블스페이스 현황을 확인하거나, 새로운 테이블스페이스를 생성하거나 기존 테이블스페이스를 편집할 수 있습니다.
테이블스페이스를 생성하거나 편집하려면 SYSDBA 권한이 있는 사용자 정보가 필요합니다. (비밀번호는 Vault에 저장되어 있어야 함)

**_테이블스페이스 생성 예시_** - <mark>데이터베이스 사용자 비밀번호가 Vault에 저장되어 있어야 합니다.</mark>
![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-10.png)<br><br>
![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-11.png)

**_테이블스페이스 현황 예시_** - <mark>우측 Action 버튼을 클릭하여 테이블스페이스 관리 메뉴를 확인할 수 있습니다.</mark>
![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-12.png)

##### 사용자별 권한 및 현황 확인 기능 사용하기

데이터베이스 관리 화면 우측 리소스 패널에서 "사용자" 메뉴를 클릭하여 해당 데이터베이스의 사용자 현황을 확인할 수 있습니다.
사용자 메뉴에서는 사용자 계정 상태와 만료일자등의 정보를 확인할 수 있습니다.

![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-13.png)

##### 데이터베이스 매개변수 관리 기능 사용하기

데이터베이스 관리 화면 우측 리소스 패널에서 "데이터베이스 매개변수" 메뉴를 클릭하여 해당 데이터베이스의 매개변수를 확인하고 값을 편집할 수 있습니다.
매개변수를 편집하려면 SYSDBA 권한이 있는 사용자 정보가 필요합니다. (비밀번호는 Vault에 저장되어 있어야 함)

**_매개변수 현황 확인하기_**
![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-14.png)

**_매개변수 편집 하기_** - <mark>데이터베이스 사용자 비밀번호가 Vault에 저장되어 있어야 합니다.</mark>
![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-15.png)

#### 데이터베이스 그룹 기능 사용하기

데이터베이스 관리 기능에서는 여러개의 데이터베이스를 관리하기 위한 도구로 데이터베이스 그룹 기능을 제공합니다.
CDB 및 PDB를 원하는 목적에 따라 그룹화 할 수 있으며 이러한 그룹에 대량 SQL 작업을 실행할 수 있는 SQL 템플릿을 만들고 실행할 수 있습니다.

1. 전체 메뉴에서 "관찰 가능성 및 관리 - 데이터베이스 관리 - 데이터베이스 그룹" 메뉴를 클릭하여 서비스 화면으로 이동합니다.
   ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-16.png)

2. 이동한 화면에서 데이터베이스 그룹 생성 버튼을 클릭하여 정보를 입력 후 그룹을 생성합니다.
   ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-17.png)

3. 생성된 그룹에서 관리하고자 하는 데이터베이스를 선택하여 추가합니다.
   ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-19.png)

4. 생성된 그룹으로 플리트 요약 화면을 조회할 수 있습니다.
   ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-20.png)


#### 대시보드 기능 사용하기

데이터베이스 관리에서는 데이터베이스를 모니터링 하기 위해 사전에 정의된 4개의 대시보드를 제공합니다.
사용자는 모니터링을 수행할 구획와 데이터베이스를 선택하여 대시보드를 통해 데이터베이스에 대한 상태를 확인할 수 있습니다.

* Autonomous Database Performance
* Cloud DB 인프라 성능
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-21.png)

* 데이터베이스 플리트 성능
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-22.png)

* Cloud/External Database Performance
  ![]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/dbmgmt/dbmgmt-23.png)

## 마무리하며...

이번 포스팅에서는 OCI 데이터베이스 관리 기능의 옵션과 다양한 기능에 대해서 알아보았습니다.
데이터베이스 관리 기능을 사용하려고 고려하고 계시는 분들이 관리 옵션을 선택하는 데 도움이 되셨으면 좋겠습니다.

---