---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "8월 OCI Infrastructure 업데이트 소식"
teaser: "2026년 8월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2026-infrastructure
tags:
  - oci-release-notes-2026
  - Aug-2026
  - Infrastructure
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

## Management Agent Updates
* **Services:** Management Agent
* **Release Date:** August 05, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-agent/aug26-macs-updates.htm](https://docs.oracle.com/iaas/releasenotes/management-agent/aug26-macs-updates.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/management-agents/doc/enable-management-agent-oca.html](https://docs.oracle.com/iaas/management-agents/doc/enable-management-agent-oca.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Cloud Agent용 Management Agent Plugin이 JDK 8 Update 501로 갱신되었고, Kubernetes용 OCI Management Agent container image 1.14.0에는 JDK 관련 중요 보안 수정이 포함되었습니다. REST collection을 사용하는 Oracle Log Analytics 개선, TLS 1.3 지원, 자동 업그레이드 개선과 기타 bug 및 security fix도 함께 제공됩니다.

## Object Storage supports dual-stack endpoints for IPv6
* **Services:** Object Storage
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/objectstorage/ipv6-support.htm](https://docs.oracle.com/iaas/releasenotes/objectstorage/ipv6-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/Object/Concepts/use-ipv6-urls.htm](https://docs.oracle.com/iaas/Content/Object/Concepts/use-ipv6-urls.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Object Storage에 IPv6와 IPv4를 모두 처리하는 dual-stack endpoint가 추가되어 동일한 hostname이 두 주소 체계 중 하나로 해석될 수 있습니다. 기존 IPv4-only endpoint도 계속 사용할 수 있으므로 IPv6 접근이 필요한 client부터 선택적으로 전환할 수 있습니다.

### API별 URI와 list·upload·download 확인

Dual-stack 주소는 Dedicated Endpoint 형식을 사용하며 hostname 앞에 tenancy namespace와 적용 region을 포함합니다. V2, Swift, S3 API별 URI가 다르므로 공식 구성 표에 따라 client endpoint를 설정합니다. DNS의 A·AAAA record, client IPv6 지원, route와 security rule을 확인한 뒤 같은 bucket의 list·upload·download를 IPv4와 IPv6 경로에서 비교하고, 미전환 client는 기존 IPv4-only endpoint로 계속 동작하는지 확인합니다.

## OCI Block Storage Adds Ransomware-Resilient Backup Protection
* **Services:** Block Volume
* **Release Date:** August 11, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/blockvolume/retention-lock.htm](https://docs.oracle.com/iaas/releasenotes/blockvolume/retention-lock.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/Block/Concepts/blockvolumebackups.htm](https://docs.oracle.com/iaas/Content/Block/Concepts/blockvolumebackups.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/Block/Concepts/overview.htm](https://docs.oracle.com/iaas/Content/Block/Concepts/overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Block Storage backup에 장기 보존을 위한 Endurance, 관리자 유연성을 유지하는 Governance, 강제 불변성을 제공하는 Compliance retention lock, 조사나 소송을 위한 Legal Hold 보호 방식이 추가되었습니다. 보존 기간 중 backup의 조기 삭제와 retention 변경을 제한할 수 있어 ransomware 대응과 규정 준수에 필요한 복구 데이터 보호 수준을 높일 수 있습니다.

### 보호 정책과 잠금

Backup의 업무 목적에 따라 장기 보존, 삭제 방지, 강제 불변성 또는 무기한 보존 중 적절한 보호 방식을 선택하고, 담당자 권한과 해제 절차를 함께 정의해야 합니다. 특히 Compliance와 Legal Hold는 운영자가 즉시 삭제하거나 보존 조건을 바꾸는 일반 절차에 제약을 주므로 비용, 데이터 lifecycle, 감사 요구사항을 검토한 뒤 적용해야 합니다.

### 복구 가능성 확인

불변성 설정은 사고 이후가 아니라 보호할 backup을 생성하고 관리하는 단계에서 정책으로 설계해야 하며, 복구 가능성 자체는 별도의 restore 검증으로 확인해야 합니다. 테스트 backup에 정책을 적용해 허용·차단되는 변경과 삭제 동작을 확인하고, 복원 시험으로 데이터 정합성과 복구 절차가 목표에 맞는지 검증합니다.

## View and download detailed logs for Resource Manager work requests
* **Services:** Resource Manager
* **Release Date:** August 12, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-manager/resource-manager-work-request-logs.htm](https://docs.oracle.com/iaas/releasenotes/resource-manager/resource-manager-work-request-logs.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/ResourceManager/Tasks/list-work-request-logs.htm](https://docs.oracle.com/iaas/Content/ResourceManager/Tasks/list-work-request-logs.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/ResourceManager/Tasks/get-work-request-log-entries-content.htm](https://docs.oracle.com/iaas/Content/ResourceManager/Tasks/get-work-request-log-entries-content.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Manager에서 drift detection과 기존 compartment 기반 stack 생성 등 지원되는 work request의 상세 log를 볼 수 있게 되었습니다. Console에서 log 검색, timestamp 숨김, 출력 다운로드를 사용할 수 있고 API와 CLI로 log entry 및 raw content를 가져올 수 있습니다. Raw log content 응답은 최대 100,000개 log entry를 포함합니다.

## IPv6 support for Search API
* **Services:** Search
* **Release Date:** August 13, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/search/search-api-ipv6.htm](https://docs.oracle.com/iaas/releasenotes/search/search-api-ipv6.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/api/#/en/search/latest/](https://docs.oracle.com/iaas/api/#/en/search/latest/){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/Search/Tasks/dual-stack-endpoints.htm](https://docs.oracle.com/iaas/Content/Search/Tasks/dual-stack-endpoints.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/Search/home.htm](https://docs.oracle.com/iaas/Content/Search/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Search API가 IPv6와 IPv4를 모두 지원하는 dual-stack endpoint를 제공합니다. 기존 IPv4-only endpoint는 계속 지원되므로 IPv6 연결이 필요한 client만 새 endpoint를 선택할 수 있습니다.

### `.ds` endpoint와 query 결과 비교

IPv4-only endpoint는 `https://query.<region>.oci.oraclecloud.com`, dual-stack endpoint는 region 뒤에 `.ds`를 넣은 `https://query.<region>.ds.oci.oraclecloud.com` 형식입니다. 공식 endpoint 목록에서 대상 region 값을 확인한 뒤 DNS, IPv6 route, outbound security rule과 client 지원 여부를 점검합니다. 두 주소 체계에서 같은 resource search query의 결과와 인증·오류 처리가 일치하는지 비교하고, 기존 endpoint 조회도 유지되는지 확인합니다.

## OCI Logging supports dual-stack endpoints for IPv6
* **Services:** Logging
* **Release Date:** August 13, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/logging/IPv6.htm](https://docs.oracle.com/iaas/releasenotes/logging/IPv6.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/Logging/Concepts/loggingoverview.htm#how_logging_works__logging_apis](https://docs.oracle.com/iaas/Content/Logging/Concepts/loggingoverview.htm#how_logging_works__logging_apis){:target="_blank" rel="noopener"}

### 업데이트 내용

모든 OCI Logging API가 IPv6와 IPv4를 함께 지원하는 dual-stack API endpoint를 사용할 수 있게 되었습니다. IPv4 지원은 기본으로 제공되지만 IPv6 지원은 별도로 활성화해야 하므로 기존 client 동작과 IPv6 전환을 구분해 계획해야 합니다.

### IPv6 활성화와 ingest·query 연속성

Log producer와 조회 client의 endpoint, DNS, IPv6 route와 network egress policy를 확인한 뒤 일부 workload부터 IPv6를 활성화합니다. Dual-stack DNS와 연결을 확인하고 IPv4·IPv6 경로에서 대표 log를 ingest·query해 event 수, timestamp와 조회 결과를 비교합니다. IPv4-only client의 기존 수집과 조회도 계속 정상인지 함께 확인합니다.

## Use BFD and BGP authentication with Google Cloud
* **Services:** Multicloud
* **Release Date:** August 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/multicloud/google-cloud-bfd-bgp.htm](https://docs.oracle.com/iaas/releasenotes/multicloud/google-cloud-bfd-bgp.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/multicloud/interconnect-gcp.htm](https://docs.oracle.com/iaas/Content/multicloud/interconnect-gcp.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Interconnect for Google Cloud 연결에서 Bidirectional Forwarding Detection(BFD)과 BGP MD5 authentication을 지원합니다. BFD는 upstream 경로 장애를 빠르게 감지해 BGP update를 유도하고, BGP authentication은 OCI와 Google Cloud 사이의 routing session을 인증해 멀티클라우드 연결의 가용성과 보안을 강화합니다.

### BFD·BGP 인증 구성

중복 연결의 OCI와 Google Cloud 양쪽에서 BFD 및 BGP authentication 설정을 일치시키고, BGP 인증 정보의 생성·보관·교체 절차를 운영 기준에 포함해야 합니다. BFD를 활성화하면 장애 감지와 경로 전환이 빨라질 수 있지만, routing session 설정 불일치나 과도한 민감도는 불필요한 session 변경으로 이어질 수 있습니다.

### Google Cloud 연결 전환

두 Cloud의 peer 구성과 redundant path가 준비된 상태에서 변경해야 하며, 인증 정보가 다르면 BGP session이 성립하지 않습니다. 적용 후 각 BGP session과 BFD 상태를 확인하고, 계획된 한쪽 경로 장애 시험을 통해 traffic이 대체 경로로 전환되는지와 route가 정상 복구되는지를 검증합니다.

## Console AI Experience Preview: Expanded OC1 Availability and Support Integration
* **Services:** Console
* **Release Date:** August 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-oc1-aug-2026.htm](https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-oc1-aug-2026.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

Console AI Experience Preview의 OC1 home region 가용 범위가 확대되었고, Console AI에서 Service Request를 생성하거나 live support agent에게 연결할 수 있게 되었습니다. 이 기능은 현재 사용자의 region, compartment, resource context와 기존 IAM 권한 안에서 동작하며 resource 변경은 항상 사용자 검토와 승인을 요구합니다.

## Console Support for Network Firewall Enhancements
* **Services:** Network Firewall
* **Release Date:** August 25, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/network-firewall/console-support-ngfw-enhancements.htm](https://docs.oracle.com/iaas/releasenotes/network-firewall/console-support-ngfw-enhancements.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/network-firewall/overview.htm](https://docs.oracle.com/iaas/Content/network-firewall/overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Console에서 Network Firewall 생성 시 firewall shape를 선택하고, policy와 하위 resource에 description을 추가하며, decryption rule용 mapped secret에 여러 secret을 선택할 수 있게 되었습니다. Firewall list와 details page에서 health를 확인할 수 있고 throughput, active session, 송수신 byte metric도 볼 수 있습니다.

### Console에 추가된 방화벽 설정

신규 firewall은 기본 4 Gbps shape 또는 tenancy에 허용된 경우 25 Gbps shape를 선택할 수 있습니다. 여러 mapped secret과 새 health·metric 표시는 decryption policy 관리와 capacity 관측을 개선하며, policy object의 description에는 운영 목적을 기록할 수 있습니다. Shape는 예상 traffic과 기존 routing 설계를 기준으로 선택합니다.

### 정책 반영과 traffic 확인

25 Gbps shape는 해당 기능이 활성화된 tenancy에서만 선택할 수 있으며, Console 지원이 기존 firewall policy와 traffic rule의 의미를 자동 변경하지는 않습니다. 생성 또는 변경 후 firewall health, throughput, active session과 송수신 byte metric을 확인하고, 허용·차단 및 decryption 대상 traffic이 policy대로 처리되는지 확인합니다.

## Add ZPR security attributes for Recovery Service subnets
* **Services:** Oracle Database Autonomous Recovery Service
* **Release Date:** August 26, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/recovery-service/zpr-support.htm](https://docs.oracle.com/iaas/releasenotes/recovery-service/zpr-support.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/recovery-service/doc/recoveryservicesubnet-security-attributes.html](https://docs.oracle.com/iaas/recovery-service/doc/recoveryservicesubnet-security-attributes.html){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/home.htm](https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/home.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Recovery Service subnet에 Zero Trust Packet Routing(ZPR) security attribute를 추가할 수 있게 되었습니다. Security attribute를 ZPR policy에서 참조해 명시적으로 허용하지 않은 network traffic을 제한함으로써 Recovery Service 연결에 least-privilege 통신 모델을 적용할 수 있습니다.

### Recovery Service subnet 속성

Recovery Service subnet에 업무 역할을 나타내는 security attribute를 지정하고, 해당 속성 사이에 필요한 통신만 허용하는 ZPR policy를 구성합니다. 적용 즉시 backup 및 recovery traffic 경로에 영향을 줄 수 있으므로 database와 Recovery Service 사이에 실제로 필요한 흐름을 먼저 식별하고 기존 network 제어와 함께 검토해야 합니다.

### ZPR 정책 영향

Security attribute만 추가해서는 접근이 허용되지 않으며, ZPR policy가 의도한 source와 destination 속성을 정확히 참조해야 합니다. 테스트 subnet에서 허용된 backup·recovery 흐름과 허용하지 않은 흐름을 각각 확인하고, 변경 후 backup 수행과 recovery 관련 연결 상태가 정상인지 검증합니다.

## Network Firewall as a VTAP Source
* **Services:** Network Firewall, Networking
* **Release Date:** August 26, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/network-firewall/network-firewall-as-vtap-source.htm](https://docs.oracle.com/iaas/releasenotes/network-firewall/network-firewall-as-vtap-source.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/Network/Tasks/vtap.htm](https://docs.oracle.com/iaas/Content/Network/Tasks/vtap.htm){:target="_blank" rel="noopener"}
* **Documentation:** [https://docs.oracle.com/iaas/Content/network-firewall/overview.htm](https://docs.oracle.com/iaas/Content/network-firewall/overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

OCI Network Firewall을 VTAP(Virtual Test Access Point)의 traffic mirror source로 사용하여 firewall traffic을 mirror target으로 복제할 수 있습니다.

### VTAP source 구성

Capture filter는 mirror할 traffic을 선택하며, 선택된 traffic은 지정한 target으로 복제됩니다.

### 방화벽 트래픽 복제 확인

Packet capture는 traffic 암호화를 해제하지 않습니다.

## Attach a file when creating a technical support request
* **Services:** Support Management
* **Release Date:** August 27, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/support/attach-new-request.htm](https://docs.oracle.com/iaas/releasenotes/support/attach-new-request.htm){:target="_blank" rel="noopener"}
### 업데이트 내용

OCI technical support request를 생성할 때 관련 파일을 최초 요청에 바로 첨부할 수 있게 되었습니다. Console의 technical support request 생성 절차에서 문제 설명과 함께 진단 자료를 제출할 수 있습니다.
