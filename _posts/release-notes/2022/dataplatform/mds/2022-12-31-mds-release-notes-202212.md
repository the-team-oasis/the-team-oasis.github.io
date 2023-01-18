---
layout: page-fullwidth
#
# Content
#
subheadline: "Release Notes 2022"
title: "12월 OCI MDS (MySQL Database Service) 업데이트 소식"
teaser: "2022년 12월 OCI MDS (MySQL Database Service) 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2022-mds
tags:
  - oci-release-notes-2022
  - Dec-2022
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

## MySQL Database Service: Read Replicas with Load Balancer
* **Services:** MySQL Database
* **Release Date:** Dec. 7, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/beda8415-9e7e-45a4-9cdf-b5327fc888da/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/beda8415-9e7e-45a4-9cdf-b5327fc888da/){:target="_blank" rel="noopener"}

### 기능 소개
MySQL Database Service 사용자는 이제 최대 18개의 읽기 복제본을 쉽게 배포하고 유지 관리하여 읽기 집약적인 워크로드를 스케일아웃/스케일아웃할 수 있습니다. 응용프로그램은 DB 시스템의 모든 읽기 복제본 간에 쿼리 균형을 조정하는 읽기 전용 끝점에 연결할 수 있습니다. 따라서 읽기 쿼리의 균형을 맞추기 위해 추가 인프라를 관리할 필요 없이 읽기 확장성을 달성할 수 있습니다. 

> Stand alone 기준 6개까지 생성 가능하므로, HA 구성시 최대 18개까지 구성이 가능합니다. (HA 구성시, 3대가 만들어 집니다.)



Resources -> Read Replicas (DB 생성 이후 초기 화면)
![](/assets/img/dataplatform/2022/release-note/mds/12/SCR-20230118-jlo.png)

Resources -> Endpoints (DB 생성 이후 초기 화면)
![](/assets/img/dataplatform/2022/release-note/mds/12/SCR-20230118-jkf.png)

Resources -> Endpoints (Read replica load balancer)
![](/assets/img/dataplatform/2022/release-note/mds/12/SCR-20230118-jrj.png)





## MySQL Database Service: Replication Channel Filters and Sources Without GTIDs
* **Services:** MySQL Database
* **Release Date:** Dec. 7, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/011ec02c-b243-4850-9ab1-3fe9bfc14df7/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/011ec02c-b243-4850-9ab1-3fe9bfc14df7/){:target="_blank" rel="noopener"}

### 기능 소개

GTID는 Global Transaction Identifier의 약자로 MySQL 복제에서 서버의 각 트랜잭션을 구분하는 고유한 식별자입니다. GTID는 모든 트랜잭션과 1:1 관계이며, GTID를 활용하면 복제본으로 장애 조치, 계층적 복제, 특정 시점으로 백업 복구하는 등의 작업을 더 쉽게 구현할 수 있으며, 오류 발생 빈도도 줄일 수 있습니다.

여러 대에서 복제를 구성하는 경우 운영 관리를 단순화하기 위해 GTID(Global Transaction ID)가 구현되었습니다. GTID는 트랜잭션을 고유하게 식별할 수 있는 식별자입니다. 기존의 복제에서는 바이너리 로그의 위치 정보를 사용하여 복제가 어디까지 전파되었는지를 관리하고 있기 때문에 슬레이브를 새로운 마스터로 승격시키는 경우 등에 위치 정보를 확인할 필요가 있습니다. 번거로웠습니다. GTID를 사용하면 이 문제를 해결할 수 있습니다. GTID를 사용하면 슬레이브가 이미 실행 완료된 트랜잭션을 고유하게 식별할 수 있어 위치 정보를 확인하지 않고 슬레이브를 새 마스터로 승격시킬 수 있습니다.

복제 실행시, 어디까지 바이너리 로그를 전파했는지의 포지션의 정보나, 전파된 로그 파일의 내용을 어디까지 슬레이브에 반영했는지의 포지션의 정보는, 데이터베이스의 데이터를 포함하는 파일과는 다른 파일에 기록되었습니다. 따라서 데이터베이스의 데이터와 위치 정보는 동시에 변경할 수 없습니다.
이로 인해 슬레이브 서버에서 충돌이 발생하면 데이터가 업데이트되었지만 위치 정보는 업데이트되지 않았다는 불일치가 발생할 수 있습니다. 이 경우 불일치를 제거하지 않으면 복제를 다시 시작할 수 없으므로 위치 정보를 수정한 다음 복제를 다시 시작하거나 슬레이브를 다시 작성해야 합니다.

이 문제를 해결하기 위해 MySQL 5.6에서는 위치 정보를 InnoDB의 테이블에 기록하여 데이터 변경 및 위치 정보 변경을 트랜잭션에 쓸 수 있습니다. 이렇게 하면 슬레이브 서버가 충돌할 경우에도 데이터와 위치 정보의 무결성을 유지할 수 있으며 슬레이브를 충돌 안전 상태로 만들 수 있습니다.


>GTID는 source_id:transaction_id의 형태로 저장됩니다.

```shell
  GTID = source_id:transaction_id
```


![](/assets/img/dataplatform/2022/release-note/mds/12/SCR-20230118-day.png)



## MySQL HeatWave now supports AMD E4
* **Services:** MySQL Database
* **Release Date:** Dec. 12, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/62e247f0-0c8a-40f0-9381-ccf492485748/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/62e247f0-0c8a-40f0-9381-ccf492485748/){:target="_blank" rel="noopener"}

### 기능 소개
HeatWave는 MySQL Database Service를 위해 개발된 인메모리 쿼리 가속기이며 Oracle Cloud Infrastructure에서만 사용할 수 있습니다. HeatWave를 사용한 MySQL Database 서비스를 사용하면 애플리케이션을 변경하지 않고도 MySQL 데이터베이스에서 직접 OLTP(온라인 트랜잭션 처리) 및 OLAP(Online Analytical Processing) 작업 로드를 실행할 수 있습니다. 따라서 별도의 분석 데이터베이스가 필요하지 않습니다.

![](/assets/img/dataplatform/2022/release-note/mds/12/SCR-20230116-jyq.png)