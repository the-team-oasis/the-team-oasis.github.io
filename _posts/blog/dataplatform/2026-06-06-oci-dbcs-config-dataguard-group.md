---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "OCI Base Database에서 Data Guard Group 구성하기"
teaser: "OCI Base Database Service의 Data Guard Group 리소스를 사용하여 동일 리전 HA용 Standby DB와 원격 리전 DR용 Standby DB를 구성하는 방법을 정리합니다."
author: "dankim"
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, base-database, data-guard, data-guard-group, standby, dr]
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

### 배경
OCI Base Database Service에서 HA와 DR을 구성할 경우, [Oracle MAA(Maximum Availability Architecture)](https://www.oracle.com/database/technologies/maximum-availability-architecture/) 기준 Gold 수준의 가용성을 달성하기 위해서는 RAC와 Active Data Guard를 조합하는 것이 권장됩니다. 그러나 이 구성은 RAC와 Active Data Guard 사용을 위해 Extreme Performance Edition 라이선스가 필요하므로 추가 비용이 발생합니다.

따라서 비용 효율성을 고려한다면, Enterprise Edition 환경에서 Data Guard를 활용하여 Active-Standby 방식의 HA 및 DR 구성을 적용하는 것이 현실적인 대안이 될 수 있습니다. 이 구성은 MAA의 Gold 수준에서 제공하는 RAC 기반의 고가용성 및 무중단 서비스 수준에는 미치지 않지만, 데이터베이스 또는 AZ 장애 발생 시 Silver 수준의 연속성을 확보할 수 있으며, 비용 대비 높은 수준의 가용성과 재해 복구 기능을 활용할 수 있습니다.

하지만 OCI Base Database Service의 Managed Data Guard(Console UI에서 제공하는 기능)는 기본적으로 1개의 Primary Database와 1개의 Standby Database 구성만 지원합니다. 따라서 HA용 Standby와 DR용 Standby를 각각 별도로 구성해야 하는 경우, OCI Managed Data Guard를 이용하여 하나의 Standby를 구성하고 나머지 Standby는 Manual 방식으로 추가 구성하거나 모든 Standby DB를 Manul 구성해야 합니다. 다만 이러한 방식은 OCI에서 제공하는 Managed Data Guard의 관리 편의성을 충분히 활용할 수 없으며, 구성 및 운영 관리 측면에서 추가적인 부담이 발생할 수 있습니다. 참고로 아래 포스트에서는 OCI Base Database에서 Standy DB를 수동으로 추가 구성하는 방법을 설명하고 있습니다.
* 참고: [OCI Base Database의 Data Guard에 Standby Database를 수동으로 추가 구성하는 방법](https://the-team-oasis.github.io/dataplatform/oracle-dataguard-manual-config_grid/)

### Data Guard Group 소개
위에서 언급한 바와 같이 기존 OCI Managed Data Guard(Data Guard Association 방식)는 Primary Database 기준으로 하나의 Standby Database만 구성할 수 있었습니다. 하지만 이번에 Base Database Service까지 확장된 **Data Guard Group** 기능을 사용하면 하나의 Primary Database에 여러 개의 Local/Remote Standby Database를 구성하고 관리할 수 있습니다. (Data Guard Group은 원래 Exadata Database Service 계열에서 먼저 제공되던 기능입니다.)

Oracle 공식 가이드에 따르면 Data Guard Group은 OCI Console, API/SDK, Terraform을 통해 사용할 수 있으며, Base Database Service에서 Primary Database 하나당 최대 6개의 Standby Database를 구성할 수 있습니다. 또한 Primary와 Standby Database를 하나의 Group 관점에서 확인하고, Switchover, Failover, Reinstate 같은 Data Guard 운영 작업을 콘솔에서 수행할 수 있습니다.

이번 포스팅에서는 OCI Base Database Service와 Data Guard Group을 사용하여 서울 리전에 Primary Database를 생성하고, 동일한 서울 리전에 HA 목적의 Standby Database를 먼저 구성한 후, 춘천 리전에 DR 목적의 Standby Database를 추가하는 구성을 기준으로 설명합니다.

### 구성 목표
* 서울 리전에 Primary Base Database 생성
* 서울 리전에 HA용 Standby Database 구성
* 춘천 리전에 DR용 Standby Database 구성
* Data Guard Group 리소스로 Primary와 Standby들을 하나의 Group에서 관리

### 고려사항
* Data Guard Group은 Oracle Database 19c 이상에서 지원됩니다.
* 기존 Data Guard Association 구성을 사용하는 경우에도 새 Data Guard Group 리소스로 전환할 수 있습니다.
* Manual 구성한 Data Guard 또는 Manual Multiple Standby 구성은 OCI Cloud Automation에서 인식하지 못합니다. 콘솔 자동화로 관리하려면 Data Guard Group 리소스를 사용하여 다시 구성해야 합니다.
* Remote (Cross-region) Standby Database를 구성하려면 Remote Peering, Route Table, Security List 또는 NSG 구성이 사전에 완료되어야 합니다.
* 테스트 편의를 위해 본 예시에서는 Public Subnet에 Database를 구성했지만, 운영 환경에서는 Private Subnet과 Bastion, NSG 기반 접근 제어를 우선 검토하는 것을 권장합니다.

### 아키텍처
전체 구성은 다음과 같습니다.

* **Primary Region:** South Korea Central (Seoul)
* **DR Region:** Chuncheon
* **Primary VCN CIDR:** 10.0.0.0/16
* **Primary Subnet CIDR:** 10.0.0.0/24
* **DR VCN CIDR:** 10.1.0.0/16
* **DR Subnet CIDR:** 10.1.0.0/24
* **Primary Database:** 서울 리전의 운영 Database
* **Standby For HA:** 서울 리전의 HA용 Standby Database
* **Standby For DR:** 춘천 리전의 DR용 Standby Database

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-01.png " ")

서울 리전의 Primary Database는 같은 리전의 Standby For HA와 춘천 리전의 Standby For DR로 데이터를 보호합니다. Standby For HA는 리전 내 장애 대응을 위한 고가용성 구성을 담당하고, Standby For DR은 리전 장애를 대비한 재해 복구 용도로 사용합니다. 두 리전은 Remote Peering으로 연결하고, 모든 Database는 하나의 Data Guard Group으로 묶어 관리합니다.

### 1. Network 구성
원격 리전에 Standby Database를 구성하려면 먼저 서울 리전 VCN과 춘천 리전 VCN 사이에 Remote Peering을 구성해야 합니다. Remote Peering 구성 절차는 아래 포스팅을 참고합니다.

[OCI Remote Peering - 서로 다른 리전간의 VCN 연결하기](https://the-team-oasis.github.io/infrastructure/oci-remote-peering/)

Remote Peering을 구성한 후에는 양쪽 VCN의 Route Table에 상대 VCN CIDR 대역으로 향하는 경로를 DRG로 추가합니다. 또한 Data Guard 통신을 위해 Database Listener 포트인 TCP 1521이 양쪽 방향에서 허용되어야 합니다.

#### 서울 리전 Security List 구성
서울 리전 VCN에서는 Primary Database와 HA용 Standby Database가 위치합니다. 서울 리전의 Database Subnet에 연결된 Security List 또는 NSG에서 다음 Ingress Rule을 추가합니다.

| Source CIDR | IP Protocol | Destination Port Range | 설명 |
| --- | --- | --- | --- |
| `10.0.0.0/16` | TCP | `1521` | 서울 리전 내 Primary/Standby 간 Data Guard 통신 |
| `10.1.0.0/16` | TCP | `1521` | 춘천 DR 리전 Standby와의 Data Guard 통신 |

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-02.png " ")

#### 춘천 리전 Security List 구성
춘천 리전 VCN에서는 DR용 Standby Database가 위치합니다. 춘천 리전의 Database Subnet에 연결된 Security List 또는 NSG에서 다음 Ingress Rule을 추가합니다.

| Source CIDR | IP Protocol | Destination Port Range | 설명 |
| --- | --- | --- | --- |
| `10.0.0.0/16` | TCP | `1521` | 서울 Primary/HA Standby와의 Data Guard 통신 |

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-03.png " ")

> 본 예시에서는 SSH 접속을 위해 TCP 22가 열려 있지만, 운영 환경에서는 필요한 관리 대역 또는 Bastion 경로로만 제한하는 것을 권장합니다.

### 2. Primary DB 생성
먼저 서울 리전에 Primary Database를 생성합니다. OCI Console에서 **Oracle Database > Oracle Base Database Service > DB Systems > Create DB system**으로 이동하여 DB System과 Database를 생성합니다.

이번 예시의 Primary DB System은 다음과 같이 생성했습니다. 서울 리전의 VCN 이름은 ``myvcn``으로 설정하였습니다.

| 항목 | 값 |
| --- | --- |
| DB System name | `Primary` |
| Region | Seoul |
| Availability Domain | `AP-SEOUL-1-AD-1` |
| Shape | `VM.Standard.E5.Flex` |
| CPU core count | `1` |
| VCN | `myvcn` |
| Client subnet | `public subnet-myvcn` |
| Port | `1521` |
| Hostname prefix | `primary-1` |

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-04.png " ")

Primary Database의 상태가 **Available**이 되었는지 확인합니다.
> Primary Database가 **Available** 상태가 되어야 Standby Database를 추가할 수 있습니다.

### 3. HA용 Standby DB 추가
Primary DB System 상세 화면에서 **Databases** 탭을 선택한 후 생성한 Database를 클릭합니다. Database 상세 화면으로 이동한 뒤 **Data Guard Associations** 탭을 선택하고 **Add standby** 버튼을 클릭합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-05.png " ")

Add standby 화면에서 Data Guard resource type을 선택합니다. Multiple Standby 구성을 위해서는 **Use the new Data Guard Group resource**를 선택합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-06.png " ")

이 옵션을 선택하면 Data Guard 구성이 Data Guard Group 리소스로 생성됩니다. 이후 동일한 Primary Database에 추가 Standby Database를 더 붙일 수 있고, Primary와 여러 Standby를 하나의 Group View에서 확인할 수 있습니다.

HA용 Standby DB는 Primary Database와 같은 서울 리전에 생성합니다. 이번 예시의 HA용 Standby DB System은 다음과 같이 생성되었습니다.

| 항목 | 값 |
| --- | --- |
| Data Guard resource type | Use the new Data Guard Group resource |
| Peer DB system name | `StandbyforHA` |
| Region | Seoul |
| Availability Domain | `AP-SEOUL-1-AD-1` |
| Shape | `VM.Standard.E5.Flex` |
| CPU core count | `1` |
| VCN | `myvcn` |
| Client subnet | `public subnet-myvcn` |
| Port | `1521` |
| Hostname prefix | `standbyforha` |

입력값을 확인한 뒤 **Add** 버튼을 클릭하면 Standby DB System 생성이 시작됩니다. 생성이 완료되면 `StandbyforHA` DB System 상세 화면에서 VCN, Subnet, Port, Hostname prefix 값을 확인합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-07.png " ")

생성이 완료되면 Primary Database의 **Data Guard Group** 탭 화면에서 Primary와 `StandbyforHA`가 같은 Data Guard Group 멤버로 표시됩니다.

### 4. DR용 Standby DB 추가
HA용 Standby DB 구성이 완료되면 동일한 Data Guard Group에 DR용 Standby DB를 추가할 수 있습니다. Primary Database 상세 화면의 **Data Guard Group** 탭 화면에서 **Add standby**를 클릭합니다.

DR용 Standby DB는 원격 리전인 **춘천**에 생성합니다. 앞에서 서울 리전과 춘천 리전 간 Remote Peering, Route Table, Security List 구성을 완료했으므로 Add standby 화면에서 춘천 리전의 VCN과 Subnet을 선택하여 Standby DB System을 생성합니다.

이번 예시의 DR용 Standby DB System은 다음과 같이 생성되었습니다. 춘천 리전의 VCN 이름은 ``myvcn-sg``로 설정하였습니다.

| 항목 | 값 |
| --- | --- |
| Peer DB system name | `StandbyforDR` |
| Region | Chuncheon |
| Availability Domain | `AP-CHUNCHEON-1-AD-1` |
| Shape | `VM.Standard.E5.Flex` |
| CPU core count | `1` |
| VCN | `myvcn-sg` |
| Client subnet | `public subnet-myvcn-sg` |
| Port | `1521` |
| Hostname prefix | `standbyfordr` |

생성이 완료되면 춘천 리전의 DB System 상세 화면에서 VCN, Subnet, Port, Hostname prefix 값을 확인합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-08.png " ")

### 5. Switchover
Switchover는 일종의 계획된 전환 작업을 의미합니다. Primary Database와 Standby Database가 모두 정상 상태일 때, 서비스 점검이나 역할 전환 테스트를 위해 Standby Database를 Primary Role로 승격하고 기존 Primary Database를 Standby Role로 전환할 수 있습니다.

이번 예시에서는 서울 리전의 기존 Primary Database와 HA용 Standby DB인 `StandbyforHA` 사이에서 Switchover를 수행합니다. **Data Guard Group** 콘솔 화면에서 `StandbyforHA` DB 아이콘을 선택한 후 Action 메뉴에서 **Switchover**를 클릭합니다. 확인 창에서 DB Admin Password를 입력하고 **Switchover** 버튼을 클릭하면 작업이 시작됩니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-09.png " ")

Switchover가 완료되면 `StandbyforHA`가 새로운 Primary Role을 가지며, 기존 Primary Database는 Standby Role로 전환됩니다. Data Guard Group 화면에서 각 Database의 Role이 의도한 대로 변경되었는지 확인합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-10.png " ")

### 6. Failover
Failover는 Primary Database 장애 상황에서 Standby Database를 새로운 Primary Database로 승격하는 작업입니다. Switchover가 계획된 전환이라면, Failover는 장애 대응을 위한 전환 작업으로 볼 수 있습니다.

이번 예시에서는 앞 단계의 Switchover 이후 Primary Role로 승격된 서울 리전의 `StandbyforHA`와 춘천 리전의 DR용 Standby DB인 `StandbyforDR` 사이에서 Failover를 수행합니다. **Data Guard Group** 콘솔 화면에서 `StandbyforDR` DB 아이콘을 선택한 후 Action 메뉴에서 **Failover**를 클릭합니다. 확인 창에서 DB Admin Password를 입력하고 **Failover** 버튼을 클릭하여 작업을 수행합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-11.png " ")

Failover가 완료되면 `StandbyforDR`이 새로운 Primary Role로 승격됩니다. 기존 Primary 역할을 수행하던 Database는 **Disabled Standby Role**로 표시됩니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-12.png " ")

### 7. Reinstate
Failover 이후 기존 Primary Database 또는 Failover 직전 Primary 역할을 수행하던 Database는 **Disabled Standby** 상태가 됩니다. 이 경우 **Reinstate** 작업을 통해 해당 Database를 다시 Data Guard Group의 Standby Database로 복구할 수 있습니다.

이번 예시에서는 Failover 이후 Disabled Standby 상태가 된 `StandbyforHA`를 다시 Standby Role로 복구합니다. **Data Guard Group** 콘솔 화면에서 `StandbyforHA` DB 아이콘을 선택한 후 Action 메뉴에서 **Reinstate**를 클릭합니다. 확인 창에서 DB Admin Password를 입력하고 **Reinstate** 버튼을 클릭하여 작업을 수행합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-13.png " ")

Reinstate가 완료되면 `StandbyforHA`는 다시 Standby Role로 Data Guard Group에 참여합니다. Data Guard Group 화면에서 Disabled Standby 상태가 해소되었는지, 그리고 Primary와 Standby 구성이 정상적으로 표시되는지 확인합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-14.png " ")

### 8. Primary DB를 Primary Role로 승격
테스트가 끝난 후 최초 Primary Database를 다시 Primary Role로 되돌리고 싶다면 Switchover를 한 번 더 수행합니다. 현재 Primary Role을 가진 Database 기준으로 Data Guard Group 화면에서 최초 Primary Database를 선택하고 **Switchover**를 실행합니다.

Switchover가 완료되면 최초 Primary Database가 다시 Primary Role을 가지며, 나머지 Database는 Standby Role로 정리됩니다. 최종적으로 Data Guard Group 화면에서 Primary, HA Standby, DR Standby의 Role과 상태를 확인합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-dataguard-group-15.png " ")

### 마무리
이번 포스팅에서는 OCI Base Database Service의 Data Guard Group 기능을 사용하여 하나의 Primary Database에 HA용 Standby Database와 DR용 Standby Database를 함께 구성하는 방법을 살펴보았습니다. 또한 Switchover, Failover, Reinstate를 수행하며 Data Guard Group의 주요 운영 기능도 확인해 보았습니다.

기존 OCI Managed Data Guard(Data Guard Association)는 Primary Database당 하나의 Standby Database만 지원했기 때문에 HA와 DR을 동시에 구성하려면 추가 Standby를 수동으로 구성해야 하는 제약이 있었습니다. 반면 Data Guard Group은 하나의 Primary Database에 여러 개의 Standby Database를 연결하고 통합 관리할 수 있어 이러한 한계를  해결할 수 있습니다.

실제 구성 과정에서는 Remote Peering 및 Security List 설정이 누락되거나 잘못되어 Standby Database 프로비저닝이 실패하는 경우가 많았습니다. 또한 프로비저닝 실패 시 OCI Console의 Work Requests에 표시되는 오류 메시지로 상세 원인을 파악하기 어려워 트러블슈팅에 다소 어려움이 있었습니다. 네트워크 설정과 관련해 좀 더 구체적인 오류 메시지가 제공되었다면 문제 해결에 큰 도움이 되었을 것으로 보이며, 이 점은 다소 아쉬웠습니다.

그럼에도 불구하고 Data Guard Group은 기존 Managed Data Guard의 Standby 제한을 보완하여, 하나의 Primary Database에 여러 Standby Database를 구성할 수 있도록 지원한다는 점에서 매우 유용한 기능입니다. 특히 HA와 DR을 동시에 고려해야 하는 환경에서는 Manual 구성에 대한 부담을 줄이고 운영상의 편의성을 높일 수 있다는 장점이 있습니다.

HA와 DR을 함께 고려해야 하는 환경이라면 OCI Base Database Service의 Data Guard Group 기능을 적극 활용해 보시기 바랍니다. 기존 방식보다 더욱 유연하고 효율적으로 고가용성 및 재해 복구 아키텍처를 구성할 수 있으며, 운영 및 관리 측면에서도 많은 이점을 얻을 수 있을 것입니다.

### 참고 문서
* [Configure Multiple Standby Databases Using Data Guard in Oracle Base Database Service](https://docs.oracle.com/en/learn/basedb-configure-multiple-standby/index.html#related-links)
