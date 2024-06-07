---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "OCI Cache with Redis 서비스 살펴보기"
teaser: "OCI의 관리형 Redis 서비스인 Cache with Redis 서비스에 대해서 살펴봅니다."
author: dankim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, redis]
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

### Key-Value Database (One of NoSQL Databases)
NoSQL(Not Only SQL)은 2009년 이후 Last.fm과 Facebook, Twitter, Google Analytics 등에서 데이터의 폭발적인 증가로 빅데이터 분산 처리 및 저장 기술과 함께 발달된 분산 데이터베이스 기술로, 2009년에 Last.fm의 Johan Oskarsson이라는 엔지니어에 의해 널리 알려졌습니다. NoSQL은 SQL만을 사용하지 않는 데이터베이스를 의미하며, 일반적으로 Key-Value, Document, Graph, Wide Column, Search Engine과 같은 유형의 데이터베이스를 포함합니다.
Key-Value Database는 NoSQL(Not Only SQL)의 한 종류로 Dictionary, Hash로 잘 알려져 있는 자료 구조인 연관 배열의 저장, 검색, 관리를 위해 설계된 데이터 베이스 패러다임입니다.

![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-1.png " ")

### Redis란?
Redis (Remote Dictionary Storage)는 2009년 이탈리아 해커인 Salvatore Sanfilippo가 개발한 BSD 라이센스 기반의 오픈소스 프로젝트로, 2015년부터 Redis Labs가 지원하는 오픈 소스 기반의 인메모리 Key Value 데이터베이스입니다.

Redis의 주요 특징은 다음과 같습니다.
* 다양한 유형의 데이터 구조(String, Hash, List, Set, Stored Set등)를 지원
* 데이터 분할(Partitioning)을 통해서 여러 서버에 분산 저장 및 처리
* 메모리 기반 저장소를 사용하므로, 서버 종료 및 재시작 시 데이터 손실 (휘발성)
* 단일 스레드 환경에서 동작하므로, 다중 처리나 동시성이 요구되는 작업에는 부적합
* 보통 캐싱, 메시징, 세션 클러스터링, 실시간 채팅, 랭킹, 분산 락과 같은 요건등에 많이 사용

### OCI Cache with Redis
OCI Cache with Redis는 오픈 소스 Redis 7.0.5를 기반으로 하는 완전관리형 분산 캐싱 서비스로 Redis를 분산 환경 배포 및 관리와 같은 반복적이고 복잡한 작업을 자동화해주는 관리형 서비스입니다.

OCI Cache with Redis의 주요 특징은 다음과 같습니다.

1. 완전 관리형
* 자동화된 클러스터 생성, OS 수준의 패치, 모니터링, Failover, SLA 99.95%
2. 단순성
* 메모리와 노드 수만 사용자가 지정하고 그 외는 모두 자동화 관리
* 처음부터 메모리를 과잉 설정할 필요 없음. 필요할 때 언제든 늘리거나 줄일 수 있음
3. 확장성
* 다운타임 없이 즉시 캐시 확장
* 클러스터당 최대 5개 노드까지 확장이 가능하고, 노드당 2GB에서 최대 500GB까지 확장
4. 강력한 인사이트
* 클러스터 상태 및 성능 모니터링
* CPU 및 메모리 사용 현황
* 전송 및 수신 네트워크 데이터 모니터링
5. 자동화된 고가용성
* 2개 이상의 노드를 배포할 경우 자동으로 여러 Availability Domain 혹은 Fault Domain에 분산 배치

### OCI Cache with Redis Cluster 프로비저닝
1. OCI Cache with Redis Cluster를 프로비저닝하기 위해 OCI Console 메뉴에서 ***Databases > OCI Cache > Clusters***를 클릭합니다.
![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-2.png " ")

2. **Create Cluster** 버튼을 클릭한 후 Cluster Name, Compartment(구획), 버전 (포스팅하는 시점에서 지원하는 버전은 7.0.5 입니다.)을 입력합니다.
![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-3.png " ")

3. Node Configuration에서 각 노드에서 사용하기 위한 메모리와 노드 개수를 입력합니다. 메모리는 노드당 최대 500GB, 노드 개수는 최대 5개까지 지정할 수 있습니다. (총 2500GB까지 확장 가능)
![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-4.png " ")

4. Redis Cluster가 배포될 VCN과 Subnet을 선택합니다.
![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-5.png " ")

5. 마지막으로 전체 구성 리뷰 후 **Create Cluster**를 클릭하여 Redis Cluster를 생성합니다.
![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-6.png " ")

6. 설치가 완료되면 Redis CLI를 통해 접속할 수 있는 Endpoint를 확인할 수 있습니다. Redis Cluster는 기본적으로 Public이 아닌 Primary입니다. 따라서 접속을 위해서는 Cluster가 위치한 Subnet과 통신이 가능한 VM 환경에서 접속하거나 OCI Bastion 서비스를 통해서 접속할 수 있습니다.
![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-7.png " ")

### 스케일링
OCI Cache with Redis는 노드 수와 메모리 확장이 가능합니다.

#### 노드 수 확장
![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-8.png " ")

#### 메모리 확장
![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-9.png " ")

### 가격
전체 사용 메모리가 10GB 이하인 경우 1GB당 $0.0194 비용이 발생합니다. 만일 전체 사용 메모리가 10GB 이상인 경우에는 1GB당 $0.0136 비용이 발생하게 됩니다. 자세한 가격 정보는 아래 링크에서 확인할 수 있습니다.

[OCI Cache with Redis 가격](https://www.oracle.com/kr/cloud/cache/pricing/)


### Redis CLI 설정 및 접속 테스트
여기서는 OCI Bastion 서비스를 통해서 로컬 PC(MacOS 환경)에서 접속해 보도록 하겠습니다. 먼저 Bastion 서비스와 세션을 다음과 같이 생성합니다. 접속할 환경은 Domain Name 타입으로 Redis Cluster의 Primary Endpoint를 입력합니다.
![](/assets/img/dataplatform/2024/release_note/others/oci-redis-overview-10.png " ")

Bastion 서비스에 대한 자세한 내용은 아래 포스트 참고합니다.  
[OCI Bastion Service 사용하기](https://the-team-oasis.github.io/infrastructure/oci-bastion-service/)

생성된 세션의 SSH Command를 이용해서 접속을 해봅니다.
```
ssh -i ./ssh/id_rsa -N -L 6379:amaaaaaakv6tzsaawibudjpviwffg3l7pd4f37zxji5dzhxmrwj3nvmczzpa-p.redis.ap-seoul-1.oci.oraclecloud.com:6379 -p 22 ocid1.bastionsession.oc1.ap-seoul-1.amaaaaaakv6tzsaaimwt6nu3e6gmwc36if6beyzs5d7cp4mdvzccp7ovchuq@host.bastion.ap-seoul-1.oci.oraclecloud.com
```

이제 로컬 환경에서 Redis CLI를 통해서 접속해 보도록 합니다. 우선 Redis CLI를 설치합니다. 설치 관련 가이드는 아래 링크 참고합니다.  
[Install Redis](https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/)

로컬 환경에서 Redis CLI를 통해서 접속한 후 테스트로 키/값 입력 및 조회를 해봅니다.
```
$ redis-cli --tls -h localhost
localhost:6379> ping
PONG
localhost:6379>

SET hkey "Hello Redis World!!!"
OK
localhost:6379> GET hkey
"Hello Redis World!!!"
```
