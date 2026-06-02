---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "OCI Base Database에서 Autonomous Recovery Service 구성하기"
teaser: "OCI Base Database Service의 자동 백업 목적지를 Autonomous Recovery Service로 설정하기 위한 Recovery Service Subnet 생성, 보안 규칙 구성, Subnet 등록, 백업 설정 및 Active 상태 확인 절차를 정리합니다."
author: "dankim"
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, database, base-database, autonomous-recovery-service, backup, ars]
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

### Autonomous Recovery Service 소개

**Oracle Database Autonomous Recovery Service**는 OCI Database의 백업을 전용 복구 서비스에 저장하고 관리할 수 있도록 제공되는 완전 관리형 백업/복구 서비스입니다. Oracle Zero Data Loss Recovery Appliance 기술을 기반으로 하며, Object Storage 기반 백업과 동일한 비용 구조를 유지하면서 더 빠른 백업, 낮은 데이터베이스 부하, 안정적인 복구, 백업 보호 상태에 대한 가시성을 제공하는 것이 특징입니다.

Oracle 공식 튜토리얼에서는 Autonomous Recovery Service를 통해 자동 백업을 구성하고, 실시간 데이터 보호(Real-Time Data Protection), 백업 모니터링, 기존 백업을 이용한 복원/복구까지 수행할 수 있는 절차를 소개하고 있습니다.

이번 포스팅에서는 OCI **Base Database Service**를 생성할 때 백업 목적지를 **Autonomous Recovery Service**로 설정하기 위해 필요한 사전 네트워크 구성과 콘솔 설정 절차를 정리합니다.

### 목적

이 포스팅에서 다루는 구성 목표는 다음과 같습니다.

* Recovery Service에서 사용할 전용 Subnet 생성
* Database Subnet에서 Recovery Service Subnet으로 백업 트래픽이 이동할 수 있도록 Security List Rule 추가
* Database Backup 메뉴에서 Recovery Service Subnet 등록
* Base Database 생성 시 Backup destination을 Autonomous Recovery Service로 설정
* 생성 후 Automatic Backup의 상태가 Active인지 확인

### 고려사항

Autonomous Recovery Service를 구성하기 전에 다음 항목을 확인합니다.

* Recovery Service는 Oracle Database 19.16 이상에서 지원됩니다.
* Recovery Service Subnet은 Database가 위치한 VCN에 구성해야 합니다.
* Oracle 공식 문서 기준으로 Recovery Service용 Subnet은 IPv4 전용 Private Subnet 구성을 권장합니다.
* Recovery Service Subnet은 일반적으로 `/24` 크기를 권장하며, 여러 Protected Database가 동일한 Recovery Service Subnet을 사용할 수 있습니다.
* Database와 Recovery Service 사이의 백업 네트워크 통신을 위해 TCP 2484, TCP 8005 포트가 허용되어야 합니다.
* 운영 환경에서는 Security List보다 NSG(Network Security Group)를 사용하여 Database VNIC의 egress rule을 더 세밀하게 제어하는 구성을 권장합니다.

### 구성 환경

이번 예시에서는 다음과 같은 네트워크 구성을 사용합니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="Autonomous Recovery Service configuration example"><caption></caption><colgroup><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="About__entry__1">항목</th>
      <th class="entry" id="About__entry__2">값</th>
      <th class="entry" id="About__entry__3">설명</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">VCN</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">myvcn</span></td>
      <td class="entry" headers="About__entry__3">Base Database와 Recovery Service Subnet이 위치한 VCN</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Database Subnet CIDR</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">10.0.0.0/24</span></td>
      <td class="entry" headers="About__entry__3">Security List Rule의 Source CIDR로 사용</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">Recovery Service Subnet CIDR</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">10.0.2.0/24</span></td>
      <td class="entry" headers="About__entry__3">Recovery Service 전용 Subnet</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="About__entry__1"><span class="ph">허용 포트</span></td>
      <td class="entry" headers="About__entry__2"><span class="ph">TCP 2484, TCP 8005</span></td>
      <td class="entry" headers="About__entry__3">Database와 Recovery Service 간 백업 통신 포트</td>
      </tr>
      </tbody>
</table>

### 1. Recovery Service Subnet 생성

먼저 Database가 위치한 VCN에 Recovery Service에서 사용할 Subnet을 생성합니다. OCI Console에서 **Networking > Virtual cloud networks > VCN 선택 > Subnets > Create Subnet**으로 이동하여 Recovery Service용 Subnet을 생성합니다.

이번 예시에서는 `recovery service subnet-myvcn`이라는 이름으로 `10.0.2.0/24` CIDR의 Subnet을 생성했습니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-ars-01.png " ")

> Oracle 공식 문서에서는 Recovery Service Subnet을 Database VCN 내의 Private Subnet으로 구성하는 것을 권장합니다. 실제 운영 환경에서는 보안 정책과 네트워크 설계 기준에 맞춰 Private Subnet 및 NSG 기반 제어를 우선 검토하는 것이 좋습니다.

### 2. Security List Rule 추가

Recovery Service Subnet을 생성한 후에는 Database가 위치한 Subnet에서 Recovery Service Subnet으로 백업 트래픽이 전달될 수 있도록 Security List Rule을 추가합니다.

Recovery Service Subnet에 연결된 Security List의 **Ingress Rules**에 다음 규칙을 추가합니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="Security list rules for Autonomous Recovery Service"><caption></caption><colgroup><col><col><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="Rule__entry__1">Source CIDR</th>
      <th class="entry" id="Rule__entry__2">IP Protocol</th>
      <th class="entry" id="Rule__entry__3">Destination Port Range</th>
      <th class="entry" id="Rule__entry__4">설명</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="Rule__entry__1"><span class="ph">10.0.0.0/24</span></td>
      <td class="entry" headers="Rule__entry__2"><span class="ph">TCP</span></td>
      <td class="entry" headers="Rule__entry__3"><span class="ph">2484</span></td>
      <td class="entry" headers="Rule__entry__4">Recovery Service 백업 통신</td>
      </tr>
      <tr class="row">
      <td class="entry" headers="Rule__entry__1"><span class="ph">10.0.0.0/24</span></td>
      <td class="entry" headers="Rule__entry__2"><span class="ph">TCP</span></td>
      <td class="entry" headers="Rule__entry__3"><span class="ph">8005</span></td>
      <td class="entry" headers="Rule__entry__4">Recovery Service 백업 통신</td>
      </tr>
      </tbody>
</table>

여기서 **Source CIDR**는 Database가 위치한 Subnet CIDR입니다. 예시에서는 Database Subnet CIDR이 `10.0.0.0/24`이므로 Source CIDR에 `10.0.0.0/24`를 입력합니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-ars-02.png " ")

> Security List 대신 NSG를 사용하는 경우에는 Database VNIC 또는 관련 NSG에 TCP 2484, TCP 8005 egress rule을 함께 검토합니다.

### 3. Recovery Service Subnet 등록

Subnet과 보안 규칙을 준비한 후에는 해당 Subnet을 Recovery Service Subnet으로 등록해야 합니다.

OCI Console에서 **Oracle Database > Database Backups > Recovery Service Subnets** 메뉴로 이동한 후 **Add Recovery Service subnet** 버튼을 클릭합니다. 앞에서 생성한 VCN과 Subnet을 선택하여 등록합니다.

등록이 완료되면 Recovery Service Subnet의 상태가 **Active**로 표시됩니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-ars-03.png " ")

Recovery Service Subnet은 Database에서 Recovery Service Appliance로 백업 데이터를 전송할 때 사용되는 Private Endpoint 생성을 위한 네트워크 영역입니다. 여러 Protected Database가 동일한 Recovery Service Subnet을 사용할 수 있으므로, 운영 환경에서는 예상되는 Database 수와 IP 사용량을 고려하여 Subnet 크기를 산정합니다.

### 4. Base Database 생성 시 Autonomous Recovery Service 설정

이제 Base Database를 생성하면서 자동 백업 목적지를 Autonomous Recovery Service로 설정합니다.

Base Database 생성 화면의 **Database backups** 섹션에서 다음과 같이 설정합니다.

* **Enable automatic backups:** 활성화
* **Backup destination:** Autonomous Recovery Service (Recommended)
* **Compartment:** Recovery Service Subnet 및 Protection Policy가 있는 Compartment 선택
* **Protection policy:** 백업 보존 기간에 맞는 정책 선택

예시에서는 **Silver (35-days recovery window)** Protection Policy를 선택했습니다.

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-ars-04.png " ")

Autonomous Recovery Service의 기본 Protection Policy는 다음과 같은 보존 기간을 제공합니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="Autonomous Recovery Service protection policies"><caption></caption><colgroup><col><col></colgroup><thead class="thead">
      <tr class="row">
      <th class="entry" id="Policy__entry__1">Protection Policy</th>
      <th class="entry" id="Policy__entry__2">Recovery Window</th>
      </tr>
      </thead><tbody class="tbody">
      <tr class="row">
      <td class="entry" headers="Policy__entry__1"><span class="ph">Platinum</span></td>
      <td class="entry" headers="Policy__entry__2"><span class="ph">95 days</span></td>
      </tr>
      <tr class="row">
      <td class="entry" headers="Policy__entry__1"><span class="ph">Gold</span></td>
      <td class="entry" headers="Policy__entry__2"><span class="ph">65 days</span></td>
      </tr>
      <tr class="row">
      <td class="entry" headers="Policy__entry__1"><span class="ph">Silver</span></td>
      <td class="entry" headers="Policy__entry__2"><span class="ph">35 days</span></td>
      </tr>
      <tr class="row">
      <td class="entry" headers="Policy__entry__1"><span class="ph">Bronze</span></td>
      <td class="entry" headers="Policy__entry__2"><span class="ph">14 days</span></td>
      </tr>
      </tbody>
</table>

필요한 경우 사용자 정의 Protection Policy를 생성하여 별도의 보존 기간을 적용할 수도 있습니다. 또한 Retention Lock을 활성화하면 보존 기간이 만료되기 전까지 백업의 수정 또는 삭제를 제한할 수 있습니다.

### 5. Backup State 확인

Base Database 생성이 완료되면 Database 상세 화면으로 이동하여 **Backups** 탭을 확인합니다.

자동 백업이 정상적으로 구성되면 Backup 목록에서 다음과 같은 정보를 확인할 수 있습니다.

* **Name:** Automatic Backup
* **State:** Active
* **Type:** Incremental Backup, Initiated by Auto Backup
* **Backup destination:** Autonomous Recovery Service
* **Encryption Key:** Oracle-managed key

![](/assets/img/dataplatform/2026/blog/oci-dbcs-config-ars-05.png " ")

State가 **Active**로 표시되면 Autonomous Recovery Service를 통한 자동 백업 구성이 정상적으로 완료된 것입니다.

### 복구 옵션

Autonomous Recovery Service에 저장된 자동 백업은 Database 복구 시 사용할 수 있습니다. Oracle 공식 튜토리얼에서는 다음 세 가지 복구 지점을 제공합니다.

* **Restore to latest:** 마지막 정상 상태로 복구
* **Restore to a timestamp:** 지정한 시간으로 복구
* **Restore to SCN:** 지정한 SCN(System Change Number) 기준으로 복구

운영 환경에서는 백업이 Active 상태인지만 확인하는 것에 그치지 않고, 필요한 Recovery Window와 실제 복구 요구사항(RPO/RTO)에 맞는 Protection Policy를 선택했는지 함께 검토하는 것이 중요합니다.

### 마무리

Autonomous Recovery Service를 사용하면 Base Database의 자동 백업을 OCI의 전용 복구 서비스로 저장하고, 백업 상태와 복구 지점을 더 체계적으로 관리할 수 있습니다. 구성의 핵심은 Database가 위치한 VCN 안에 Recovery Service Subnet을 준비하고, Database Subnet CIDR에서 TCP 2484 및 8005 포트가 허용되도록 네트워크 규칙을 구성한 뒤, Database Backup 메뉴에서 해당 Subnet을 등록하는 것입니다.

Base Database 생성 시 Backup destination을 **Autonomous Recovery Service (Recommended)**로 선택하고 Protection Policy를 지정하면, 이후 Backups 탭에서 Automatic Backup의 State가 **Active**인지 확인하여 구성이 완료되었는지 검증할 수 있습니다.

### 참고 문서

* [Configure Oracle Autonomous Recovery Service in OCI](https://docs.oracle.com/en/learn/configure-ars-oci/index.html#introduction)
