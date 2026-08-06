---
layout: page-fullwidth
subheadline: "Networking"
title: "OCI VCN Flow Logs로 HTTP(80) 서비스 트래픽 분석하기"
teaser: "OCI VCN Flow Logs를 사용하여 HTTP(80) 서비스의 실제 접근 IP와 허용·차단 결과를 확인하는 방법을 알아봅니다."
author: yhcho
date: 2026-08-05 00:00:00
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, networking, vcn, flow logs, logging, security]
#published: false
header: no

# -------------- 내용 필독 -------------------
# 이미지는 images 폴더의 infrastructure 카테고리에 넣고,
# /assets/img/infrastructure/2026/oci-flow-logs/<파일명>.png 형식으로 참조합니다.
# ------------------------------------------
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

### OCI VCN Flow Logs란?

OCI VCN Flow Logs는 VCN에서 발생한 네트워크 흐름의 메타데이터를 OCI Logging에 기록하는 기능입니다. 패킷의 내용이나 HTTP 요청 본문은 수집하지 않으며, Source/Destination IP, Port, Protocol, 전송량, 허용(`ACCEPT`) 또는 거부(`REJECT`) 결과를 확인할 수 있습니다.

이번 글에서는 HTTP 서비스 Port인 **TCP/80**을 기준으로 다음을 확인해 보겠습니다.

* 실제로 서비스에 접속하는 Source IP
* 대상 Private IP와 TCP/80 접근 여부
* Security List 또는 NSG에서 허용·차단된 결과
* 외부 Public IP 접근 시 Flow Log에 보이는 Private IP

> Flow Logs는 특정 Port가 실제 사용 중인지 확인하고, 과도한 Security List/NSG 규칙을 정리할 근거를 마련할 때 특히 유용합니다.

OCI Console 메뉴에서 **네트워킹 > Network Command Center > 플로우 로그**로 이동합니다.

![Network Command Center의 플로우 로그 메뉴](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-1.png "Network Command Center의 플로우 로그 메뉴")

플로우 로그 화면에서는 기존 Flow Log를 확인하거나 **플로우 로그 사용**을 선택해 새 구성을 만들 수 있습니다.

![플로우 로그 목록 화면](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-2.png "플로우 로그 목록 화면")

### 구성 전 확인할 사항

Flow Log 생성 전 아래 정보를 준비합니다. Public IP가 연결된 서비스라면 Public IP뿐 아니라 연결된 Private IP와 VNIC OCID도 기록해야 합니다.

| 항목 | 예시 |
|---|---|
| Region | Korea Central (Seoul) |
| Compartment | 네트워크 운영 Compartment |
| 대상 VCN / Subnet | 서비스가 위치한 VCN / Subnet |
| 대상 자원 | Compute Instance 또는 Load Balancer |
| 대상 VNIC OCID | 특정 인스턴스만 분석할 때 필요 |
| Private IP / Public IP | 실제 분석 대상 주소 |
| Protocol / Port | TCP / 80 |
| 예상 Source CIDR | 사내망, VPN, 외부 연계망 등 |

Public IP로 접속하더라도 VNIC Flow Log의 Destination은 매핑된 **Private IP**로 나타날 수 있습니다. 또한 NAT, Proxy, Load Balancer가 Source NAT를 수행하면 원본 클라이언트가 아니라 중간 장비 IP가 Source로 보일 수 있습니다.

#### Public IP를 가진 서비스의 필터 기준

예를 들어 서비스에 연결된 Public IP가 `132.145.82.205`라면, 이 값은 외부 사용자가 **접속하는 대상 주소**이지 접속자의 주소가 아닙니다. 따라서 Capture Filter의 **Source IPv4 CIDR에는 입력하지 않습니다.** Source에 이 값을 입력하면 `132.145.82.205`에서 출발한 트래픽만 찾게 됩니다.

외부에서 들어오는 모든 HTTP 요청을 수집하려면 다음 기준을 사용합니다.

| 항목 | 권장값 |
|---|---|
| Enablement point | 해당 서비스의 Instance VNIC 또는 VNIC OCID |
| Source IPv4 CIDR | `0.0.0.0/0` — 모든 IPv4 Source |
| Destination IPv4 CIDR | `0.0.0.0/0` — 선택한 리소스에서 모든 IPv4 Destination |
| Protocol / Destination port | TCP / `80` |
| Traffic disposition | All(모두) |

현재 OCI Console의 Flow Log Capture Filter 화면에서는 Source와 Destination CIDR이 모두 필수입니다. 그러나 **수집 대상 리소스는 Capture Filter가 아니라 Enablement point에서 결정**합니다. 해당 Instance VNIC 또는 VNIC OCID를 Enablement point로 선택했다면 Destination에 Private IP `/32`를 반복해서 넣을 필요가 없습니다. 필수 입력값을 충족하도록 `0.0.0.0/0`을 입력하고, TCP Destination Port `80`으로 필요한 요청만 제한합니다.

반대로 Enablement point를 VCN이나 Subnet으로 넓게 지정한 경우에는 여러 VNIC의 로그가 수집되므로, Capture Filter의 Destination CIDR에 대상 리소스의 **Private IP `/32`**를 넣어 범위를 좁히는 것이 유용합니다. Public IP `132.145.82.205`를 통한 Compute 트래픽도 Flow Log에는 매핑된 Private IP로 기록될 수 있습니다.

`0.0.0.0/0`은 인터넷 Source만 의미하지 않고 VCN, DRG, VPN 등 모든 IPv4 Source를 포함합니다. 인터넷 접근만 분리하려면 수집 후 Logging Search에서 내부·온프레미스 CIDR을 제외하거나, 내부 CIDR Exclude 규칙을 Include 규칙보다 먼저 둡니다.

### 1. Log Group 생성

Flow Log는 OCI Logging의 Log Group에 저장됩니다. **Observability & Management > Logging > Log Groups**에서 **Create Log Group**을 선택합니다.

![관찰 가능성 및 관리의 로그 그룹 메뉴](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-3.png "관찰 가능성 및 관리의 로그 그룹 메뉴")

로그 그룹 화면에서 **로그 그룹 생성**을 선택합니다.

![로그 그룹 생성 버튼](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-4.png "로그 그룹 생성 버튼")

다음처럼 네트워크 분석 전용 Log Group을 생성합니다.

* Name: `lg-network-flowlog`
* Compartment: Logging 운영 Compartment
* Description: `VCN Flow Logs for network traffic analysis`

애플리케이션 로그나 Audit Log와 분리하면 보존 기간, IAM 권한, 비용을 독립적으로 관리하기 좋습니다.

![네트워크 Flow Log용 로그 그룹 생성](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-5.png "네트워크 Flow Log용 로그 그룹 생성")

### 2. Capture Filter 생성

이제 어떤 트래픽을 기록할지 정의하는 Capture Filter를 만듭니다. **Networking > Network Command Center > Capture Filters**에서 **Create Capture Filter**를 선택합니다.

![Network Command Center의 캡처 필터 메뉴](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-6.png "Network Command Center의 캡처 필터 메뉴")

캡처 필터 목록에서 **캡처 필터 생성**을 선택합니다.

![캡처 필터 생성 버튼](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-7.png "캡처 필터 생성 버튼")

기본 정보는 아래와 같이 입력합니다.

* Name: `cf-flowlog-tcp80`
* Filter type: **Flow log capture filter**
* Sampling rate: 초기 분석 기간에는 **100%**

![Flow Log 캡처 필터와 샘플링 비율 설정](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-8.png "Flow Log 캡처 필터와 샘플링 비율 설정")

#### TCP/80 요청 수집 규칙

첫 번째 규칙은 서비스로 들어오는 요청을 수집합니다.

| 설정 | 값 |
|---|---|
| Action | Include |
| Traffic disposition | All(모두) |
| Source CIDR | `0.0.0.0/0` |
| Destination CIDR | `0.0.0.0/0` — 특정 리소스를 Enablement point로 선택한 경우 |
| IP protocol | TCP |
| Source port range | All |
| Destination port range | `80` - `80` |

![TCP 80 요청 수집 규칙](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-9.png "TCP 80 요청 수집 규칙")

#### TCP/80 응답 수집 규칙

두 번째 규칙은 서버가 TCP/80에서 보내는 응답 흐름을 수집합니다.

| 설정 | 값 |
|---|---|
| Action | Include |
| Traffic disposition | All(모두) |
| Source CIDR | `0.0.0.0/0` — 특정 리소스를 Enablement point로 선택한 경우 |
| Destination CIDR | `0.0.0.0/0` |
| IP protocol | TCP |
| Source port range | `80` - `80` |
| Destination port range | All |

![TCP 80 응답 수집 규칙](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-10.png "TCP 80 응답 수집 규칙")

> **콘솔 UI 참고:** Flow Log Capture Filter를 선택하고 Sampling rate가 표시되는 것을 먼저 확인합니다. 현재 콘솔의 규칙 UI는 `Traffic disposition`(All, Accept, Reject, Deny)을 표시하고 Source·Destination CIDR을 모두 요구합니다. 이 글에서는 실제 허용·차단 흐름을 모두 분석하기 위해 **All(모두)** 을 선택합니다. 한국어 UI에서는 Reject와 Deny가 모두 “거절”로 번역될 수 있으므로, 두 값은 사용하지 않습니다.

`0.0.0.0/0`, 모든 Protocol을 포함하는 Catch-all 규칙은 추가하지 않습니다. Capture Filter는 위에서부터 평가되며, 조건에 일치하지 않는 트래픽은 기록되지 않습니다. 특정 서비스 Port만 분석하면 수집량과 분석 범위를 줄일 수 있습니다.

### 3. Flow Log 활성화

**Networking > Network Command Center > Flow Logs**에서 **Enable Flow Logs**를 선택합니다. 아래 값을 입력합니다.

![플로우 로그 사용 버튼](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-11.png "플로우 로그 사용 버튼")

* Flow Log name: `fl-service-tcp80`
* Flow log destination: 앞에서 생성한 `lg-network-flowlog`
* Capture filter: `cf-flowlog-tcp80`

![Flow Log 이름, 로그 그룹과 캡처 필터 선택](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-12.png "Flow Log 이름, 로그 그룹과 캡처 필터 선택")

다음 단계에서 수집 범위를 선택합니다.

| 적용 지점 | 권장 사용 사례 |
|---|---|
| VCN | VCN 전체의 현황을 조사할 때 |
| Subnet | 특정 Tier 또는 전용 Subnet을 분석할 때 |
| Instance VNIC | 단일 VM만 정확히 분석할 때 |
| VNIC OCID | 관리형 서비스 또는 특정 VNIC을 지정할 때 |
| Network Load Balancer | NLB 트래픽을 확인할 때 |

단일 서버를 확인할 때는 **Instance VNIC 또는 VNIC OCID**가 가장 명확합니다. 여러 VM으로 구성된 서비스나 Auto Scaling 환경은 **전용 Subnet**을 적용 지점으로 선택하는 편이 누락을 줄입니다.

VCN 전체를 대상으로 할 경우 VCN Compartment와 VCN을 선택합니다.

![VCN을 Enablement point로 선택](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-13.png "VCN을 Enablement point로 선택")

특정 Subnet 전체를 대상으로 할 경우 VCN에 이어 Subnet을 선택합니다.

![Subnet을 Enablement point로 선택](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-14.png "Subnet을 Enablement point로 선택")

이번 예시처럼 단일 서버의 HTTP 트래픽을 확인하려면 **리소스 > 인스턴스 VNIC**를 선택한 뒤 VCN, Subnet과 대상 Instance VNIC을 지정합니다. 리소스에서 대상을 이미 한정했으므로 Capture Filter에는 대상 Private IP를 반복해서 넣지 않고 Source/Destination CIDR `0.0.0.0/0`과 Port 조건을 사용했습니다.

![Instance VNIC을 Enablement point로 선택](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-15.png "Instance VNIC을 Enablement point로 선택")

설정을 검토하고 **Enable Flow Logs**를 선택하면 Flow Log가 활성화됩니다.

![선택한 Instance VNIC Enablement point 확인](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-16.png "선택한 Instance VNIC Enablement point 확인")

### 4. Flow Log 수집 결과 확인

Flow Log 활성화 후에는 허용된 Source, 미승인 Source, 서비스 응답을 각각 한 번 이상 테스트합니다.

| 테스트 | 예상 결과 |
|---|---|
| 승인된 내부 Source → Private IP:80 | `ACCEPT` 기록 |
| 승인된 외부 Source → Public IP:80 | 실제 외부 Source와 대상 Private IP, `ACCEPT` 기록 |
| 미승인 Source → 대상:80 | VNIC까지 도달한 경우 `REJECT` 기록 |
| 서비스 응답 | 대상 Private IP:80에서 클라이언트 임시 Port로의 Egress 기록 |

> 인터넷 경로나 외부 방화벽에서 VNIC에 도달하기 전에 차단된 패킷은 대상 VNIC의 Flow Log에 남지 않을 수 있습니다.

Flow Log 목록에서 생성한 항목이 **활성** 상태인지 확인합니다.

![활성 상태의 Flow Log](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-17.png "활성 상태의 Flow Log")

Flow Log 상세 화면에서는 대상 Log Group, 연결된 Capture Filter와 Sampling rate를 확인할 수 있습니다.

![Flow Log 상세정보](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-18.png "Flow Log 상세정보")

### 5. Logging Search로 TCP/80 분석하기

**Observability & Management > Logging > Search**에서 대상 Log Group과 Flow Log를 선택한 뒤 Advanced Mode로 조회합니다. 아래의 `<COMPARTMENT_OCID>/<LOG_GROUP_OCID>/<FLOW_LOG_OCID>`는 실제 값으로 교체합니다.

Log Group 상세 화면의 **로그** 탭에서 생성한 Flow Log를 선택할 수 있습니다.

![Log Group에서 Flow Log 선택](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-19.png "Log Group에서 Flow Log 선택")

Flow Log의 **로그 탐색** 탭에서 수집 건수를 확인하고 **로그 검색 탐색**을 선택합니다.

![Flow Log 로그 탐색 화면](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-20.png "Flow Log 로그 탐색 화면")

Logging Search 화면에서 **고급**을 선택합니다.

![Logging Search 고급 모드 선택](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-21.png "Logging Search 고급 모드 선택")

고급 모드에는 선택한 Compartment, Log Group과 Flow Log를 포함하는 기본 `search` 구문이 자동으로 표시됩니다.

![Logging Search 기본 Advanced query](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-22.png "Logging Search 기본 Advanced query")

#### TCP/80 요청 상세 조회

```text
search "<COMPARTMENT_OCID>/<LOG_GROUP_OCID>/<FLOW_LOG_OCID>"
| where data.status = 'OK'
  and data.protocol = 6
  and data.destinationPort = 80
| select datetime, data.action,
         data.sourceAddress, data.sourcePort,
         data.destinationAddress, data.destinationPort,
         data.packets, data.bytesOut, data.flowid
| sort by datetime desc
```

쿼리 실행 후 결과 행을 펼치면 Flow Log의 Source/Destination 주소, Port와 Action을 확인할 수 있습니다.

#### Source IP별 접근 집계

```text
search "<COMPARTMENT_OCID>/<LOG_GROUP_OCID>/<FLOW_LOG_OCID>"
| where data.status = 'OK'
  and data.protocol = 6
  and data.destinationPort = 80
| summarize count() as records,
            sum(data.packets) as packets,
            sum(data.bytesOut) as bytes
  by data.sourceAddress, data.destinationAddress, data.action
| sort by records desc
```

이 결과로 실제 사용하는 Source IP, 목적지별 사용량, 허용/차단 현황을 파악할 수 있습니다. `records`는 사용자 수나 애플리케이션 요청 수가 아니라 Flow Log 기록 건수이므로, 접속 수 분석에는 `flowid`, Source/Destination Port, 시간 구간을 함께 사용합니다.

검색할 쿼리를 입력 후 "검색" 버튼을 클릭해서 입력한 쿼리로 로그 검색을 수행합니다.

![Source IP별 집계 쿼리 실행](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-23.png "Source IP별 집계 쿼리 실행")

집계 결과 행을 펼치면 Source/Destination 주소, `ACCEPT` 또는 `REJECT`, 기록 수와 Packet/Byte 합계를 확인할 수 있습니다. (아래 예시는 수신/응답 별 Record 입니다.)

![Source IP별 Flow Log 집계 결과](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-24.png "Source IP별 Flow Log 집계 결과")

#### 거부된 접근 조회

```text
search "<COMPARTMENT_OCID>/<LOG_GROUP_OCID>/<FLOW_LOG_OCID>"
| where data.status = 'OK'
  and data.protocol = 6
  and data.destinationPort = 80
  and data.action = 'REJECT'
| select datetime, data.sourceAddress, data.sourcePort,
         data.destinationAddress, data.destinationPort,
         data.packets, data.flowid
| sort by datetime desc
```

`REJECT` 결과 화면은 실제 미승인 Source에서 테스트 트래픽을 발생시킨 뒤 같은 방법으로 확인할 수 있습니다. 실제 고객 IP·호스트명·OCID는 게시 전에 반드시 마스킹합니다.

#### 검색 결과 내보내기

Logging Search의 **작업** 메뉴에서 결과를 JSON 또는 CSV로 내보낼 수 있습니다. 분석 기간이 길거나 별도 보고서를 만들 때 유용합니다.

![Flow Log 검색 결과 JSON 또는 CSV 내보내기](/assets/img/infrastructure/2026/oci-flow-logs/oci-flow-logs-25.png "Flow Log 검색 결과 JSON 또는 CSV 내보내기")

### 6. 정리

특정 Port만 대상으로 Capture Filter를 만들고, VNIC 또는 전용 Subnet에 Flow Log를 적용하면 보안 규칙을 변경하기 전에 실제 통신 관계를 확인할 수 있습니다.

운영 환경에서는 최소 14일, 월말·배치 주기가 있는 서비스는 30일 이상 수집한 후 다음을 정리합니다.

* 실제 사용하는 Source CIDR과 Destination IP/Port
* 허용되어야 하는 `ACCEPT` 흐름
* 예외 처리 또는 원인 분석이 필요한 `REJECT` 흐름
* 더 이상 사용되지 않아 제거 가능한 Security List/NSG 규칙
