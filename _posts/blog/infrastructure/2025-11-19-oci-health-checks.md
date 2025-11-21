---
layout: page-fullwidth
#
# Content
#
subheadline: "Networking"
title: "OCI Health Checks 사용하기"
teaser: "OCI Health Checks를 사용하여 외부에 노출된 서비스의 모니터링하는 방법을 소개합니다.."
author: "kisukim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, monitoring, health, checks]
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


### Health Checks Service

OCI Health Checks는 **인터넷에 노출된 Public Endpoint에 대해 외부 위치에서 주기적으로 Ping/TCP/HTTP 검사**를 수행하여, 서비스의 상태를 확인하는 모니터링 서비스입니다.

### 1.Health Checks란?
**OCI Health Checks 서비스는 외부에서 주기적으로 엔드포인트 상태를 점검(Probe)하여 장애나 성능 문제를 빠르게 감지하는 외부 모니터링 서비스**입니다.

✔️ 웹 서비스/애플리케이션 가용성 확보  
✔️ SLA 준수 모니터링  
✔️ 로드밸런서 및 API 엔드포인트 상태 확인  
✔️ 글로벌 vantage point 기반 멀티 리전 체크

### 2.Key Components (핵심 구성 요소)

#### 2.1 Monitors (모니터)

- HTTP 또는 Ping 기반의 지속적인 헬스 체크 수행  
- **10초 간격이면 Premium**, 그보다 길면 Basic
- 기능 차이는 없으며 빈도만 다름
- 여러 vantage point에서 동시에 체크 가능
  
#### 2.2 On-demand Probes (온디맨드 프로브)

- API를 통해 **1회성 헬스 체크** 실행
- HTTP/Ping 모두 지원
- 24시간 기준 실행 제한 있음
- On-demand Credits 방식을 통해 점진적으로 사용량 회복

#### 2.3 Vantage Points (관측 지점)

- Oracle이 전 세계에 운영하는 외부 체크 위치
- **최소 3개 이상의 서로 다른 Provider 기반 vantage point 사용 권장**
- 다양한 네트워크/리전 시나리오에서 안정적인 체크 가능
    
#### 2.4 Protocols (프로토콜)
- HTTP/HTTPS
- ICMP Ping
- 각각의 프로토콜 특성에 따라 정상 여부 판단
    
#### 2.5 지원되는 리소스
- URL 또는 IP로 접근 가능한 리소스라면 Health Check 대상이 될 수 있습니다.


#### 2.5 주요 특징

| 기능  | 설명  |
| --- | --- |
| 외부 모니터링 | 전 세계 여러 vantage point에서 Endpoint 체크 |
| Public Endpoint 지원 | 공용 IP, DNS 기반 서비스 모니터링 가능 |
| HTTP/HTTPS 검사 | Status code, 응답시간, Body 매칭 등 심층 체크 |
| Ping/TCP 체크 | 네트워크 Layer 체크 |
| 알림 연동 | OCI Events + Notifications로 Slack/Email 알림 가능 |
| Metrics 기반 Dashboard | 응답 시간/성공률 등 그래프화된 모니터링 제공 |

* * *

### 3.Policy(정책) 적용하기

&nbsp;

```shell
Allow group HealthCheckAdmins to manage health-checks in compartment my-compartment

```


### 4. 탐지 프로세스 (원리) 

사용자 (Console/API/CLI)  
        │  
        ▼  
 OCI Health Checks Control Plane  
        │ (설정된 모니터 정보)  
        ▼  
Oracle Global Vantage Points (여러 지역)  
        │ (실제 HTTP/Ping 트래픽 발생)  
        ▼  
Customer Endpoint (Public-facing Service)  
        │  
        ▼ (결과 반환)  
Vantage Points → Health Checks Control Plane → OCI Monitoring

* * *

### 5. 실제 적용하기 (OCI Web Console)

"관찰 가능성 및 관리->모니터링-> 건정성 검사" 클릭하여 이동 합니다.
![](/assets/img/infrastructure/2025/health-check-1.png " ")

"건전성 검사 생성" 클릭하여 모니터링 할 대상과 타켓을 입력 하도록 합니다.
![](/assets/img/infrastructure/2025/health-check-2.png " ")

건전성 검사 생성을 클릭하면, 모니터링 할 대상과 설정을 위한 페이지로 이동 합니다.

![](/assets/img/infrastructure/2025/health-check-4.png " ")
건정성 검사 생성을 위한 입력을 합니다. 
- 대상 :  OCI 리소스 중에서 건전성 검사가 필요한 리소스를 선택 할 수 있으며, select box로 현재 모니터링이 가능한 리소스에 대해서 리스트업이 됩니다.
- 유리한 위치 : Azure, GCP, AWS 외부 위치한 Vantage point를 선택 할 수 있습니다. (리전에 따른 선택이 가능힙니다.)
- 요청 유형 : HTTP, PING 두가지 타입이 선택 가능합니다.
- 간격 : 건전섬 검사를 하기 위한 간격으로 10초부터 선택이 15분까지 가능합니다. 
- 시간초과 : 건전성 검사를 위한 요청에 대한 응답을 실패로 하기 위한 최대 대기 시간 입니다. 

건정성 검사를 위한 데이터를 입력 후 완료가 되면 아래와 같이 건전성 검사 목록에서 등록된 건전성 검사를 확인 할 수 있습니다. (등록된 건전성 검사는 활성/비활성화를 할 수 있습니다.)
![](/assets/img/infrastructure/2025/health-check-7.png " ")

등록된 건정성 검사는 아래와 같이 상세 페이지에서 정보를 확인 할 수 있습니다. 
- 세부정보 : 등록된 건정성 검사의 프로토콜 및 Vantage points를 확인 할 수 있습니다.
- 건전성 검사 내역 : 세부정보에서 등록된 값을 기준으로 건정성 검사한 결과 내역을 확인 할 수 있습니다.
- 모니터링 : 메트릭 지표를 보여줍니다.

*세부정보*
![](/assets/img/infrastructure/2025/health-check-8.png " ")

*건전성 검사 내역*
![](/assets/img/infrastructure/2025/health-check-9.png " ")

*모니터링*

아래의 경우,  Ping 결과에 따른 Latency 결과를 모니터링 하기 위해서 "Ping Test Latency Measurement" 메트릭 값을 기준으로 알람을 생성합니다.
![](/assets/img/infrastructure/2025/health-check-5.png " ")

Latency 설정을 위해서는 위 화면의 Ping Test Latency Measurement를 통해서 알람을 생성 할 수 있습니다. 알람을 만들기 위해서는 위 점 (...) 클릭 후 생성 알람 만들기를 클릭하면 아래와 같은 화면으로 이동 됩니다. 

**캡처된 내용에서는 Ping Latency 과 통계는 P50으로 설정 하였습니다. (P50는 1분 동안 수집한 데이터를 순위를 매겨서 중간의 값을 확인하는 방법으로 시스템의 전체적인 흐름을 확인 할 수 있습니다.)**

![](/assets/img/infrastructure/2025/health-check-3.png " ")

입력된 모니터링 지표를 통해서 e-mail로 등록된 사용자에게 메일을 시스템이 발송해 줍니다. 
![](/assets/img/infrastructure/2025/health-check-6.png " "){: style="width: 70%; max-width: 800px;"}


감사합니다. 외부에서 OCI 밖으로 노출된 즉 공용 IP를 가지고 있는 리소스에 대한 모니터링을 하기 위한 서비스로 최종 사용자에 대한 모니터링으로 사용 할 수 있는 서비스를 소개 시켜 드렸습니다. 

공식 블로그 : [Health Checks Service](https://docs.oracle.com/en-us/iaas/Content/HealthChecks/Concepts/healthchecks.htm)