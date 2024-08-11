---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Management Hub"
title: "OCI Management Hub 사용하기"
teaser: "OCI에서 OS Management Hub 방법에 대해서 실습해 보았습니다."
author: "kskim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, compute, management Hub, image]
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

# 1. OCI OS Management Hub (OS 관리 허브)

 운영체제(OS) 관리의 중요성은 모든 IT 인프라를 운영하는 기업에게 큰 관심사입니다. 운영체제는 서버, 데이터베이스, 네트워크 장비 등의 핵심 IT 인프라를 운영하는 데 필수적인 역할을 합니다. 따라서 이를 효과적으로 관리하고 유지하는 것이 기업의 IT 전략에 중요한 요소가 됩니다.

여러 서버와 다양한 운영체제를 동시에 관리하는 상황에서는, 효율적이고 중앙 집중화된 관리 솔루션이 필요합니다. 이를 위해 Oracle Cloud Infrastructure(OCI)의 OS Management Hub는 이러한 요구를 충족시키는 도구를 제공합니다. 이는 다양한 환경에서 운영체제를 효과적으로 관리하는 주요 도구로서, 중앙 집중식 관리, 자동 패치 관리, 설정 관리 등의 기능을 제공합니다.

OS Management Hub의 중앙 집중식 관리 기능을 통해, 기업은 여러 서버와 운영체제의 관리를 한 곳에서 진행할 수 있습니다. 이는 관리 효율성을 향상시키며, 일관된 정책 적용과 모니터링을 가능하게 합니다. 또한, 자동 패치 관리 기능은 소프트웨어의 보안 상태를 유지하는 데 필수적인 역할을 합니다. 이를 통해 기업은 운영체제의 패치를 자동으로 관리하고, 최신 보안 업데이트를 적용할 수 있습니다.

또한, 설정 관리 기능을 통해, 기업은 운영체제의 설정을 손쉽게 관리하고 변경할 수 있습니다. 이는 시스템의 안정성과 성능을 유지하는 데 중요한 역할을 합니다.

이러한 기능을 통해 보안과 운영 효율성을 향상시키며, 기업의 IT 인프라를 안전하게 운영할 수 있습니다. 따라서 Oracle Cloud Infrastructure의 OS Management Hub는 IT 인프라를 운영하는 기업에게 필수적인 도구로서의 역할을 하고 있습니다.

# 2. 아키텍처

![](/assets/img/infrastructure/2024/osmh/osmh0.png)

OS 관리 허브는 운영 체제 환경을 관리하는 차세대 관리 솔루션입니다. OS 관리 허브는 Oracle Cloud Infrastructure 서비스로 제공되어 기능을 확장하고 복잡성을 줄입니다. 이 서비스는 Oracle Cloud Infrastructure (OCI), 사설 데이터 센터 및 지원되는 타사 클라우드에서 인스턴스를 관리하는 것을 지원합니다.

## 2-1. Agent Plugin

OS Management Hub는 업데이트를 관리하고 적용하기 위해 에이전트 플러그인을 사용합니다. 이 플러그인은 OS Management Hub가 지시하는대로 인스턴스의 OS 컨텐츠와 상호 작용하며 데이터와 결과를 서비스로 보고하는 에이전트입니다. 에이전트는 OCI와 온프레미스 또는  third-party cloud 를 지원 합니다.

OCI 인스턴스의 경우, OS Management Hub는 Oracle Cloud Agent 플러그인을 사용합니다. OS Management Hub를 사용하려면 플러그인을 활성화해야 합니다. 아래 5-2 참조 하세요

> **OS Management Hub는 최소 Oracle Cloud Agent 버전 1.40을 필요로 합니다. 2024년 4월 이전에 출시된 플랫폼 이미지를 사용하는 인스턴스의 경우, Oracle Cloud Agent를 1.40 이상으로 업그레이드 해야 합니다.**
>

# 3. 특징

OS 관리 허브는 다양한 환경에서 운영체제를 효율적으로 관리 할 수 있도록 설계된 중앙 집중화된 관리 플랫폼으로 아래와 같은 특징을 가지고 있습니다.
  1. 중앙 집중식 관리 : OS 관리 허브는 중앙 관리 콘솔을 통해 다양한 환경에 분산된 서버를 한 곳에서 관리하며, 웹 기반 인터페이스로 사용자가 쉽게 접근하고 관리할 수 있습니다. 또한, Oracle Linux뿐만 아니라 Windows, 다양한 운영체제를 지원하여 다양한 IT 환경에 적용할 수 있습니다.
  
  2. 자동화된 패치 관리 : OS 관리 허브는 관리 콘솔을 통해 패치 적용 작업을 자동으로 스케줄링하고 배포하며, 필요한 패치를 자동으로 다운로드하여 서버에 적용합니다. 또한, 패치 적용 후 문제가 발생할 경우 이전 상태로 롤백할 수 있는 기능을 제공하여 시스템 안정성을 유지합니다.
  
  3. 설정 관리 : OS 관리 허브는 다양한 서버의 설정을 중앙에서 관리하고 일관성을 유지하며, 설정 변경 내역을 추적하고 감사하여 컴플라이언스 요구사항을 충족합니다.




# 4. 서비스 제약 및 지원 OS 종류

> **무료 테넌시에서는 지원되지 않습니다.**
>

> 온-프레미스 환경 혹은 다른 클라우드에서 사용하기 위해서는 오라클 리눅스 기반의 프리미엄 지원이 구독되어 있어야 합니다.
>

- 지원되는 OS 종류
    - OCI 환경
        - Oracle Linux 6,7,8 or 9
        - Windows Server 2016, 2019, or 2022 Standard, Datacenter
        - Oracle Autonomous Linux 7 or 8
    - On-premises or third-party 클라우드
        - Oracle Linux 7, 8, or 9
    - 다른 클라우드
        - AWS 에서 Oracle Linux 인스턴스
        - 마이크로 소프트 애저


---

# 5. 설정 및 테스트 (OCI)
아래 내용은 OCI 환경에서 인스턴스 생성하여, OS 관리 허브에 등록하고 대쉬보드에 대해서 간단히 설명 하고자 합니다. 해당 테스트는 OS 관리 허브가 출시된 이후의 내용이므로 이전에 생성된 인스턴스는 OCI Agent 버전을 확인하여 맞게 업데이트 해주셔야 합니다. (참조 : 5-2-3. Cloud Agent 트러블 슈팅)

**!! 운영환경에 적용하기 위해서는 먼저, 테스트 이후 점진적으로 적용해야 합니다.!! **

## 5-1. 환경 설정
환경 설정은 아래 정채 및 동적그룹 생성부터 시작됩니다. 아래 내용에 따라서 확인해 주세요.

### 5-1-1 관리자 그룹 생성, 동적 그룹 생성, 정책 생성

- 관리자 그룹 생성
    - “osmh-admin-grp” 그룹 생성 및 사용자 추가

- 동적 그룹 생성
    - “osmh-dynamic-group” 생성
    - “osmh-dynamic-group” 규칙 추가 (수동 /규칙 빌더 사용)

    ```
    
    **//OCI**
    ANY {instance.compartment.id='<compartment_ocid>',instance.compartment.id='<subcompartment_ocid>'}
    
    **//Non-OCI (추가정책)**
    ALL {resource.type='managementagent', resource.compartment.id='<compartment_ocid>'}
    ALL {resource.type='managementagent', resource.compartment.id='<subcompartment_ocid>'}
    ```

- 정책 생성
    - “required_osmh_policy” 생성

    ```
    **### OCI 환경 (Tenancy Level 정책)**
    **// OCI**
    allow dynamic-group <osmh_dynamic_group> to {OSMH_MANAGED_INSTANCE_ACCESS} in tenancy where request.principal.id = target.managed-instance.id
    allow group <user_group> to manage osmh-family in tenancy
    
    **//On-premises or third-party cloud (추가정책)**
    allow group <user_group> to manage management-agents in tenancy
    allow group <user_group> to manage management-agent-install-keys in tenancy
    
    **### Non-Tenancy Level**
    **// OCI**
    allow dynamic-group <osmh_dynamic_group> to {OSMH_MANAGED_INSTANCE_ACCESS} in compartment <compartment_name> where request.principal.id = target.managed-instance.id
    allow group <user_group> to manage osmh-family in compartment <compartment_name>
    
    **//On-premises or third-party cloud(추가정책)**
    allow group <user_group> to manage management-agents in compartment <compartment_name>
    allow group <user_group> to manage management-agent-install-keys in compartment <compartment_name>
    ```


### 5-1-2. OCI 관리 허브 → 소프트웨어 소스 생성

- 소프트웨어 소스 생성 (사용자 정의 소프트웨어, 공급업체 소프트웨어)
    - 아래 그림과 같이 OS Management Hub로 이동 합니다.

  ![](/assets/img/infrastructure/2024/osmh/osmh1.png)

    - **소프트웨어 소스** 생성

  ![](/assets/img/infrastructure/2024/osmh/osmh2.png)

    - **소프트웨어 생성하기 전에 사용자 정의 소프트웨어가 아닌 “공급업체 소프트웨어 소스 추가” 클릭 합니다.**

  ![](/assets/img/infrastructure/2024/osmh/osmh3.png)

    - 아래와 같이 “공급어체 소프트웨어 소스 추가” 내용을 입력 합니다.

  ![](/assets/img/infrastructure/2024/osmh/osmh4.png)

    - ① OS 공급업체 : Oracle 선택 합니다.
    - ② OS 버전 : Oracle Linux 6,7,8,9 중 선택 합니다. (테스트에서는 Oracle Linux 8 를 선택 합니다.)
    - ③ 구조 : x86_64 또는 aarch64 선택 합니다. (테스트에서는 x86_64 선택 합니다.)
    - ④ 사용 가능한 소프트웨어 소스 : 1,2,3 선택에 따라서 같은한 소프트웨어 소스가 보여 집니다. (필요한 패키지를 선택 합니다. )

  ![](/assets/img/infrastructure/2024/osmh/osmh5.png)

    - **공급업체 소프트웨어의 경우, 루드(Root) 구획에서 만든 이후  원하는 구획에 복제 합니다. (테스트에서는 “osmh-demo” 구획에 복제합니다.)**

  ![](/assets/img/infrastructure/2024/osmh/osmh6.png)


### 5-1-3. OCI 관리 허브 → 프로필 생성

- **모든 컴퓨트 리소스는 OS 관리 허브를 사용하기 위해 프로파일이라는 설정이 필요합니다.**
- OS Management Hub에 인스턴스를 등록하려면 프로필이 필요합니다. 프로필은 인스턴스가 서비스에 어떻게 등록하는지를 일관되게 정의하는 방법을 제공합니다.인스턴스는 하나 또는 하나의 프로필에만 등록됩니다. 그러나 서비스에 여러 인스턴스를 등록하기 위해 단일 프로필을 반복적으로 사용할 수 있습니다. 프로필은 등록 시 인스턴스에 적용할 연결을 지정합니다. 이에는 소프트웨어 소스, 생명주기 단계 멤버십, 또는 그룹 멤버십이 포함될 수 있습니다. 등록이 완료되면, 프로필은 더 이상 인스턴스에 의해 사용되지 않습니다.

## 5-2. OCI 관리허브 Compute 활성화 하기

### 5-2-1. 기존 Compute 활성화

- 컴퓨트의 상세정보에서 Oracle Cloud 에이전트 하위  **“Oracle Management Hub Agent”** 플러그인 사용 으로 변경하면 됩니다.

  ![](/assets/img/infrastructure/2024/osmh/osmh7.png)


### 5-2-2.  Compute 생성시 OS 관리 허브 활성화

![](/assets/img/infrastructure/2024/osmh/osmh8.png)

- "OS Management Hub Agent"를 활성화할 때는 아래와 같이 프로파일을 선택해야 합니다. (프로파일은 OS Management Hub를 생성할 때 만든 프로파일을 선택하면 됩니다.)

![](/assets/img/infrastructure/2024/osmh/osmh9.png)

### 5-2-3. Cloud Agent 트러블 슈팅

- 아래 경우에 따른 통신 및 버전 확인 등을 하셔야 합니다.
- 일부 Cloud Agent 아래와 같이 수동으로 버전 및 정상적인 통신 여부를 확인해야 합니다.

    ```bash
    //For Oracle Linux and CentOS, run the following command: 패키지 정보 확인
    sudo yum info oracle-cloud-agent
    
    //For Oracle Linux Cloud Developer, run the following command:
    rpm -qa | grep oracle-cloud-agent
    
    //For Ubuntu, run the following command:
    snap info oracle-cloud-agent
    
    //Windows
    Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq "Oracle Cloud Agent" }
    
    ```


    ```bash
    sudo yum info oracle-cloud-agent
    sudo yum install -y oracle-cloud-agent
    
    sudo systemctl status oracle-cloud-agent
    sudo systemctl restart oracle-cloud-agent
    ```

- Log 확인 (/var/log/oracle-cloud-agent/plugins/gomon/monitoring.log)

    ```bash
    sudo tail -15 /var/log/oracle-cloud-agent/plugins/gomon/monitoring.log
    2024/06/25 23:53:18.020385 base_client.go:87: fetched metadata from http://169.254.169.254/opc/v2/instance/ , status 200 OK
    2024/06/25 23:53:18.024696 base_client.go:87: fetched metadata from http://169.254.169.254/opc/v2/instance/ , status 200 OK
    2024/06/25 23:53:18.071202 base_client.go:87: fetched metadata from http://169.254.169.254/opc/v2/instance/ , status 200 OK
    2024/06/25 23:53:18.217565 base_client.go:87: fetched metadata from http://169.254.169.254/opc/v2/instance/ , status 200 OK
    2024/06/25 23:53:18.217735 clients.go:415: telemetry endpoint: https://telemetry-ingestion.ap-seoul-1.oraclecloud.com
    2024/06/25 23:53:18.270611 t2.go:145: Sent metrics status: 200; took: 53ms; with opc-request-id:235caeea753b8fc18a8b6f9a7a148e38/BDF55CEE7AEAEC3194E7756C5FEC65F6/76777F61B589D50B4F5EE59E38096BBE;
    2024/06/25 23:54:18.048159 t2.go:145: Sent metrics status: 200; took: 37ms; with opc-request-id:55658fc16a3edb9bfb1ac25e6cb86957/8A07251A7944CAF775F64D485FC08AD9/DFD94EA0348DE48E3344BC7DF835BBD6;
    2024/06/25 23:55:18.020014 base_client.go:87: fetched metadata from http://169.254.169.254/opc/v2/instance/ , status 200 OK
    2024/06/25 23:55:18.056261 t2.go:145: Sent metrics status: 200; took: 36ms; with opc-request-id:cda5e77d2c5dc0cdffef07745e534e96/B8C6DBA820E3AE42599D7A09C0F01B6E/2ADF9108EBAD002AC0AABC77DD0927A4;
    2024/06/25 23:56:18.048529 t2.go:145: Sent metrics status: 200; took: 37ms; with opc-request-id:7d6c014ba971e8015aaa857b311069d3/3096E602E1A16B54BC5C6E7F0594B8F3/A2EADD59A6BBDE526B9A1CFAD0B6503F;
    2024/06/25 23:57:18.018116 base_client.go:87: fetched metadata from http://169.254.169.254/opc/v2/instance/ , status 200 OK
    2024/06/25 23:57:18.048241 t2.go:145: Sent metrics status: 200; took: 30ms; with opc-request-id:d045e0ef223341105e9f3d23c27df3fa/D94D5D5A429FB42BE224782DEA311D71/0375F3B6114062EFDD36A3F7BF8C22FB;
    2024/06/25 23:58:18.037391 t2.go:145: Sent metrics status: 200; took: 35ms; with opc-request-id:5ec6d9e0f4e248b49b8ee1df80ef50ba/0FF177F649844D2E83BC3AF46402C9B3/CD9F1FAA0BD498399FD5CB83ACA5F958;
    2024/06/25 23:59:18.015779 base_client.go:87: fetched metadata from http://169.254.169.254/opc/v2/instance/ , status 200 OK
    2024/06/25 23:59:18.052652 t2.go:145: Sent metrics status: 200; took: 37ms; with opc-request-id:5b7056302871790d769003012015b0fa/9E55255917559F78FC6FA6E792A3753F/63CF6E66F06CA2CFFCAF78E55163C573;
    ```


- 통신 확인 (Agent가 OCI 관리허브 통신 여부 확인)

    ```bash
    *   Trying 169.254.169.254...
    * TCP_NODELAY set
    * Connected to 169.254.169.254 (169.254.169.254) port 80 (#0)
    > GET /opc/v2/instance/ HTTP/1.1
    > Host: 169.254.169.254
    > User-Agent: curl/7.61.1
    > Accept: */*
    > Authorization: Bearer Oracle
    >
    < HTTP/1.1 200 OK
    < Server: server
    < Date: Tue, 25 Jun 2024 23:56:44 GMT
    < Content-Type: application/json
    < Transfer-Encoding: chunked
    < Connection: keep-alive
    < Etag: ecf47ded-3327
    < Last-Modified: Tue, 25 Jun 2024 23:51:54 GMT
    < X-Request-Id: 527b4c9a-f860-4d4f-854d-bdd440e3de09
    <
    {
      "agentConfig": {
        "allPluginsDisabled": false,
        "managementDisabled": false,
        "monitoringDisabled": false,
        "pluginsConfig": [
          {
            "desiredState": "DISABLED",
            "name": "Vulnerability Scanning"
          },
          {
            "desiredState": "DISABLED",
            "name": "Oracle Java Management Service"
          },
          {
            "desiredState": "DISABLED",
            "name": "OS Management Service Agent"
          },
          {
            "desiredState": "ENABLED",
            "name": "OS Management Hub Agent"
          },
          {
            "desiredState": "DISABLED",
            "name": "Management Agent"
          },
          {
            "desiredState": "ENABLED",
            "name": "Custom Logs Monitoring"
          },
          {
            "desiredState": "DISABLED",
            "name": "Compute RDMA GPU Monitoring"
          },
          {
            "desiredState": "ENABLED",
            "name": "Compute Instance Run Command"
          },
          {
            "desiredState": "ENABLED",
            "name": "Compute Instance Monitoring"
          },
          {
            "desiredState": "DISABLED",
            "name": "Compute HPC RDMA Auto-Configuration"
          },
          {
            "desiredState": "DISABLED",
            "name": "Compute HPC RDMA Authentication"
          },
          {
            "desiredState": "ENABLED",
            "name": "Cloud Guard Workload Protection"
          },
          {
            "desiredState": "DISABLED",
            "name": "Block Volume Management"
          },
          {
            "desiredState": "DISABLED",
            "name": "Bastion"
          }
        ]
      },
      "availabilityDomain": "TqvH:AP-SEOUL-1-AD-1",
      "canonicalRegionName": "ap-seoul-1",
      "compartmentId": "ocid1.compartment.oc1..aaaaaaaayv7vc7ij6kpgjxvhr75fbcthp3znrzg74fa4wa2jxozbjmdrquoq",
      "definedTags": {
        "Oracle-Tags": {
          "CreatedBy": "default/ggoggodec@naver.com",
          "CreatedOn": "2024-06-25T23:51:31.828Z"
        }
      },
      "displayName": "instance-linux-8",
      "faultDomain": "FAULT-DOMAIN-1",
      "hostname": "instance-linux-8",
      "id": "ocid1.instance.oc1.ap-seoul-1.anuwgljrw7dtmeicej3wh6l5hgtlagx6sbor3poihgox7zde2nfa22d3thtq",
      "image": "ocid1.image.oc1.ap-seoul-1.aaaaaaaaow2nrto4fmtyo6all6twcr2wwjcim2qhguiipymbimmfxe773nyq",
      "metadata": {
        "ssh_authorized_keys": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDX3qWljCNTYrcENsTk1k8kKR22/CU1HojqZIdEc9uWjXxy9p2It8VAbhH9M96kWvjnXgsaoGneIdTPWzj13k8FV8s+CQMceVcRP+oO2WRNYgc6e0vxGWAvGRzIYVzl5k9+eFo2Kh7jvdsRVO1OpJMSj6r1nzViR81BoeXW89W7rcOJ6E0rOVzJIbyUBgpJJ/FfZ3Z/BxIiCMbC0Y+xqpnjBAucMaDTOit5Jbp4AN6tCHrAGDUUJRzpAmQhsuUk3AGBsm2FmZsC/EetCUsc95CX2bJjgXR9AMX9B6DbUDzGQm+XsYtoOq/6HZgCjkMht0duKDDmRuGM+i3Sh0CJOtQL5YMUSnJP1xw7d55INeGNiXMjo7I2LIPRzkB4ncvGmjB5Tuf/hhVGxSzaU2Ib98d6jxy5PhnzrZlwR4ToapJsY5GIgSVOKUvUGUmIcad3mmZJrtUD1ur0VWgY3G6EZI4njg0i+6elEa9wRxDFnCQiD1F9OZfs6lSNdBRdE18Rs4k= ggoggodec@gimgisuui-MacBookPro.local"
      },
      "ociAdName": "ap-seoul-1-ad-1",
      "region": "ap-seoul-1",
      "regionInfo": {
        "realmDomainComponent": "oraclecloud.com",
        "realmKey": "oc1",
        "regionIdentifier": "ap-seoul-1",
        "regionKey": "ICN"
      },
      "shape": "VM.Standard.E4.Flex",
      "shapeConfig": {
        "maxVnicAttachments": 2,
        "memoryInGBs": 16.0,
        "networkingBandwidthInGbps": 1.0,
        "ocpus": 1.0
      },
      "state": "Running",
      "tenantId": "ocid1.tenancy.oc1..aaaaaaaaqeufcu4qs6cqnwaixgaox3wiosz2evuvrwm2f7hacz3mhkizaafq",
      "timeCreated": 1719359492266
    * Connection #0 to host 169.254.169.254 left intact
    }
    ```


- 참조 링크

  > [https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/manage-plugins.htm#manage-plugins](https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/manage-plugins.htm#manage-plugins)
  >

  > [https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/manage-plugins-troubleshooting.htm](https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/manage-plugins-troubleshooting.htm)
>



# 6. 결과화면

- 정상적으로 OS 관리 허브가 활성화가 이루어지며 아래와 같은 화면을 확인 할 수 있습니다. (정상적으로 화면이 보이지 않는다면, 아래 구획을 확인해 주세요.)

  ![](/assets/img/infrastructure/2024/osmh/osmh11.png)


- **보안 업데이트 보고서**: 보안 패치가 최신 상태인 인스턴스의 수와 비율을 표시합니다. (인스턴스의 보안 패치가 최신 상태인지 여부를 표시하고 관련 보안 권고에 대한 세부 정보를 제공합니다.)
- **버그 업데이트 보고서**: 버그 패치가 최신 상태인 인스턴스의 수와 비율을 표시합니다. (인스턴스의 버그 패치가 최신 상태인지 여부를 나타내며 버그 수정 권고에 대한 세부 정보를 제공합니다.)
- **인스턴스 활동 보고서**: OS 관리 허브 서비스와 연결 상태 확인 중인 인스턴스의 수와 비율을 표시합니다. 다음의 상태 값은 OS 관리 허브 서비스와 연결 상태를 확인 중인 인스턴스에 적용됩니다. (OS 관리 허브에 체크인 중인 인스턴스의 상태와 개수를 표시하는 인스턴스 활동 보고서를 확인 할 수 있습니다.)
    - **활성**: 서비스와 활동적으로 연결 상태를 확인하는 인스턴스. 활성 인스턴스는 서비스와 2분 간격으로 연결 상태를 확인합니다.
    - **오프라인**: 24시간 (또는 그 이상) 동안 서비스와 연결 상태를 확인하지 않은 인스턴스.
    - **비활성**: 30분 (또는 그 이상) 동안 서비스와 연결 상태를 확인하지 않은 인스턴스.
    - **등록 중**: 서비스에 등록 중인 인스턴스.
    - **등록 실패**: 서비스에 등록하지 못한 인스턴스.
    - **등록 취소 중**: 서비스에서 등록을 취소하는 인스턴스. 등록을 취소하면, OS 관리 허브는 더 이상 인스턴스를 관리하지 않습니다.


![](/assets/img/infrastructure/2024/osmh/osmh12.png)

- 위 화면을 보시면 리소스 하위에 업데이트, 패키지, 모듈, 소프트웨어 소스, 작업, 보고서를 확인 할 수 있습니다.
    - 업데이트 : 인스턴스 사용 가능한 업데이트 목록을 볼 수 있습니다.
      - 패키지 : 인스턴스 설치된 패키지 혹은 사용 가능한 패키지를 확인 할 수 있으며, 패키지의 삭제도 가능합니다.
    - 모듈 : 소프트웨어 모듈 정보를 확인 할 수 있습니다.
    - 소프트웨어 소스 : 인스턴스에 등록된 프로파일에 해당되는 내용입니다.
    - 작업 : 인스턴스의 작업에 대해서 확인 할 수 있습니다. (일정, 진행중인 작업, 완료된 작업)
    - 보고서 : 취약성 보고서를 확인 할 수 있습니다.



# 7. 설정 및 테스트 (Non-OCI)

- OCI 이외 third-party 와 on-prem 환경에서 사용하기 위해서 아래와 같이 설정이 필요합니다.
- **다음 블로그 통해서 업데이트 하도록 하겠습니다.**

# 8. 마이그레이션 하기 (OS Management service →  OS Management HUB)

- OS Management HUb는 EOL(April 23, 2025)이 될 예정입니다. 따라서 기존에 OS Management HUB 사용자는 OS Management service 로 마이그레이션 하셔야 합니다.

  > [https://docs.oracle.com/en-us/iaas/os-management/osms/osms-migration-osmh.htm](https://docs.oracle.com/en-us/iaas/os-management/osms/osms-migration-osmh.htm)
>