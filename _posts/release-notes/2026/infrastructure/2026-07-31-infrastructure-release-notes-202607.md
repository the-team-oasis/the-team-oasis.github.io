---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI Infrastructure 업데이트 소식"
teaser: "2026년 7월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
  - release-notes-2026-infrastructure
tags:
  - oci-release-notes-2026
  - Jul-2026
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

## New Overview page and guided setup for Resource Analytics
* **Services:** Resource Analytics
* **Release Date:** July 06, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-analytics/ux-wizard.htm](https://docs.oracle.com/iaas/releasenotes/resource-analytics/ux-wizard.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Creating an Instance](https://docs.oracle.com/iaas/Content/resource-analytics/create-instance.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Analytics에 새로운 Overview page와 guided setup이 추가되었습니다. 공식 Release Note는 service requirements를 소개하고, 필요한 prerequisite 생성·선택, 권한 조기 검증, 문제 즉시 표시를 통해 초기 설정 실패를 줄이는 흐름이라고 설명합니다.

운영자는 리소스 분석 인스턴스를 처음 구성할 때 누락되기 쉬운 권한과 전제 조건을 더 빨리 발견할 수 있습니다.

### 온보딩 흐름 변화

Resource Analytics의 새 Overview page와 guided setup은 서비스 요구사항을 먼저 보여주고 prerequisite 생성·선택, 권한 검증, 문제 표시를 초기 단계에서 수행하도록 개선되었습니다. 기존에는 설정을 진행한 뒤 실패 원인을 뒤늦게 파악하던 경험을 줄이는 데 초점이 있습니다.

### 구성 시 고려사항

분석 대상 compartment와 tag 전략을 먼저 정해야 합니다. Resource Analytics가 보여주는 리소스 범위는 IAM 권한과 선택한 scope에 따라 달라지므로, 처음부터 tenancy 전체를 대상으로 삼기보다 운영 목적에 맞는 compartment부터 시작하는 것이 좋습니다.

```text
도입 순서 예시
1. 분석 대상 compartment와 tag taxonomy 정의
2. Resource Analytics 사용 그룹과 read 권한 설계
3. Guided setup에서 prerequisite와 권한 검증
4. Overview에서 수집 범위와 표시 데이터 확인
5. 운영 리포트 또는 dashboard와 연결
```

### 운영상 영향

Guided setup은 구성 오류를 줄여주지만 governance 결정을 대신하지는 않습니다. 누가 어떤 분석 결과를 볼 수 있는지, 리소스명과 tag가 민감 정보를 포함하지 않는지 별도 검토해야 합니다.
## Resource Manager adds premium jobs for higher concurrent job limits
* **Services:** Resource Manager
* **Release Date:** July 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/resource-manager/resource-manager-premium-jobs.htm](https://docs.oracle.com/iaas/releasenotes/resource-manager/resource-manager-premium-jobs.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Enabling Premium Jobs](https://docs.oracle.com/iaas/Content/ResourceManager/Concepts/premium-jobs.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Resource Manager에서 더 높은 동시 실행 한도가 필요한 테넌시를 위해 Premium Job을 지원합니다. Terraform/OpenTofu 기반 IaC 작업을 많이 실행하는 조직은 여러 stack/job을 병렬로 처리해 배포 대기 시간을 줄일 수 있습니다.

다만 동시성 증가는 운영 변경의 속도와 범위를 동시에 키우기 때문에, 배포 통제와 실패 복구 전략이 더 중요해집니다.

### 어떤 환경에 필요한가

Resource Manager Premium Job은 더 많은 concurrent job이 필요한 테넌시를 위한 기능입니다. 여러 stack을 병렬로 plan/apply하는 platform team, landing zone을 여러 compartment에 동시에 배포하는 팀, 월간 정기 IaC 변경이 많은 팀에 의미가 있습니다.

### 동시성 설계

동시 실행 수를 늘리기 전에 stack 간 dependency와 shared state를 먼저 확인해야 합니다. 같은 VCN, IAM policy, tag namespace, shared service를 여러 job이 동시에 바꾸면 apply 충돌이나 예측하기 어려운 변경 순서가 발생할 수 있습니다.

```hcl
# Terraform/OpenTofu 모듈 분리 예시
module "network" {
  source = "./modules/network"
}

module "app_stack" {
  source     = "./modules/app"
  subnet_id  = module.network.private_subnet_id
  depends_on = [module.network]
}
```

### 운영 제어

Premium Job은 배포 속도를 높이지만 실패도 더 빨리 퍼질 수 있습니다. 변경 창, 승인 절차, rollback runbook, state lock 정책을 유지하고, 병렬 실행 가능한 stack과 순차 실행해야 하는 stack을 분리해 운영합니다.
## Console AI Experience Preview for Free Tier and Always Free Customers
* **Services:** Console
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-july-2026.htm](https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-july-2026.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Free Tier와 Always Free 고객도 Console AI Experience Preview를 사용할 수 있게 되었습니다. 이는 학습, 개인 실습, 초기 데모 환경에서도 OCI Console의 자연어 지원 경험을 확인할 수 있다는 의미입니다.

공식 Release Note는 Console AI가 사용자의 OCI IAM 권한과 현재 Console 컨텍스트를 기준으로 동작하며, 리소스 변경 작업에는 사용자의 검토와 승인이 필요하다고 설명합니다.

### Free Tier에서 확인할 수 있는 것

Free Tier와 Always Free 고객에게 Console AI Preview가 열리면서 학습·실습 계정에서도 자연어 기반 Console 지원을 시험할 수 있습니다. 리소스 탐색, 일반 작업 절차 확인, 사용량·billing 설명 같은 읽기 중심 시나리오가 초기 검증에 적합합니다.

### 실습 계정과 운영 테넌시의 차이

무료 계정은 quota, region, service availability가 제한될 수 있습니다. 따라서 무료 계정에서 보이는 결과를 그대로 운영 고객 환경의 지원 범위로 설명하면 안 됩니다. 운영 고객에게 안내하기 전에는 고객 테넌시의 realm, home region, IAM 권한으로 다시 확인해야 합니다.

```text
테스트 질문 예시
- "현재 compartment의 compute instance를 요약해줘"
- "Object Storage bucket을 만들 때 필요한 단계는?"
- "이번 달 사용량을 어디서 확인하지?"
```

### 교육 자료 반영 기준

Console AI 화면을 교육 자료에 포함할 때는 Preview 상태, 계정 조건, 리소스 변경 전 사용자 승인 필요성을 함께 적습니다. 기능이 빠르게 바뀔 수 있으므로 스크린샷 기반 문서는 정기적으로 갱신하는 것이 좋습니다.
## Add ZPR security attributes to Network Firewall
* **Services:** Network Firewall, Zero Trust Packet Routing
* **Release Date:** July 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/network-firewall/zpr-network-firewall-supported.htm](https://docs.oracle.com/iaas/releasenotes/network-firewall/zpr-network-firewall-supported.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Managing a Network Firewall Security Attributes](https://docs.oracle.com/iaas/Content/network-firewall/manage-security-attributes-network-firewall.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Security attributes](https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/security-attributes.htm){:target="_blank" rel="noopener"}
* **Documentation:** [ZPR policy overview](https://docs.oracle.com/iaas/Content/zero-trust-packet-routing/zpr-policy-overview.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Network Firewall에 Zero Trust Packet Routing(ZPR) 보안 속성을 추가할 수 있게 되었습니다. ZPR security attribute는 ZPR policy가 참조하는 label이며, 특정 보안 속성을 가진 endpoint 사이의 접근을 네트워크 수준에서 지속적으로 통제합니다.

이 업데이트로 Network Firewall도 ZPR 정책 체계 안에서 보안 속성 기반 접근 제어 대상에 포함할 수 있습니다. 방화벽 정책, 라우팅, 보안 속성 정책을 함께 설계해야 하므로 네트워크 보안 아키텍처에 미치는 영향이 큽니다.

### ZPR와 Network Firewall의 관계

Zero Trust Packet Routing(ZPR)의 security attribute는 ZPR policy가 참조하는 label입니다. 이번 업데이트로 Network Firewall에도 이 security attribute를 부여할 수 있게 되어, firewall 리소스를 보안 속성 기반 network-level 정책 체계에 포함할 수 있습니다. ZPR은 security list나 NSG를 단순히 대체하는 기능이 아니라, endpoint에 부여한 속성과 policy를 기준으로 접근 가능성을 추가로 판단하는 모델입니다.

### 구성 흐름

1. Security attribute namespace와 attribute를 설계합니다.
2. Network Firewall과 client/target endpoint에 필요한 attribute를 부여합니다.
3. ZPR policy에서 어떤 attribute 조합의 통신을 허용할지 정의합니다.
4. 기존 Network Firewall rule, route table, NSG/security list와 함께 실제 packet path를 검증합니다.

```text
# 정책 설계 의사코드 예시
security-attribute: app=payments
security-attribute: zone=inspection

허용 의도:
- app=payments endpoint는 zone=inspection Network Firewall을 경유한 경로만 사용
- 다른 app attribute를 가진 endpoint는 payments 경로에 접근 금지
```

### 변경 전 영향 분석

ZPR 적용은 정상 트래픽 차단으로 이어질 수 있으므로 먼저 flow log와 firewall log로 현재 통신 경로를 수집합니다. 운영 VCN에는 한 번에 전체 attribute를 부여하지 말고, 테스트 subnet 또는 비핵심 workload에 먼저 적용해 allow/deny 결과를 확인하는 것이 안전합니다.

### 용어 정리

* **Security attribute:** ZPR policy가 참조하는 label입니다.
* **ZPR policy:** attribute를 가진 endpoint 사이의 접근 규칙입니다.
* **Network Firewall:** packet inspection과 policy enforcement를 수행하는 네트워크 보안 리소스입니다.
## Export Sunburst and Treemap widget data to CSV
* **Services:** Management Dashboards
* **Release Date:** July 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/management-dashboard/sunburst-treemap-export-csv.htm](https://docs.oracle.com/iaas/releasenotes/management-dashboard/sunburst-treemap-export-csv.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Create a Custom Dashboard](https://docs.oracle.com/iaas/management-dashboard/doc/create-custom-dashboard.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Management Dashboards에서 Sunburst와 Treemap 시각화 위젯의 데이터를 CSV로 내보낼 수 있게 되었습니다. 기존에는 계층형·비율형 시각화 화면을 중심으로 확인하던 데이터를 외부 분석 도구, 보고서, 감사 근거 자료로 재사용하기 쉬워졌습니다.

리소스 사용량, 비용 분포, 태그별 구성비처럼 계층 구조가 중요한 지표를 CSV로 추출해 월간 보고서나 운영 리뷰 자료에 연결할 수 있습니다.

### 활용 시나리오

Sunburst와 Treemap은 계층과 비율을 빠르게 이해하기 좋은 시각화입니다. CSV export가 추가되면서 화면 캡처 중심 보고에서 벗어나, 원천 데이터를 Excel, BI 도구, Python 분석, 월간 운영 보고서에 재사용할 수 있습니다. 예를 들어 tag별 비용·리소스 분포, compartment별 사용량 비중, service별 resource count를 대시보드와 동일한 filter 조건으로 내려받아 후속 분석할 수 있습니다.

### 대시보드 구성 팁

Custom Dashboard를 만들 때는 export 결과가 반복 가능한 형태가 되도록 widget 이름, filter, time range, group-by 기준을 명확히 고정하는 것이 좋습니다. 정기 보고용 dashboard는 편집 권한을 제한하고, 변경 이력을 commit 또는 운영 문서로 관리합니다.

```python
# CSV export 후 간단 검증 예시
import pandas as pd

df = pd.read_csv('management-dashboard-export.csv')
print(df.columns)
print(df.head())
print(df.groupby('compartmentName').size().sort_values(ascending=False).head(10))
```

### 데이터 취급 주의

CSV에는 resource name, tag, compartment 같은 내부 식별 정보가 포함될 수 있습니다. 외부 공유 전에는 민감 정보, 고객명, project code, owner tag가 포함되어 있는지 확인해야 합니다.
## Console AI Experience Preview Availability
* **Services:** Console
* **Release Date:** July 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-oc1-july-2026.htm](https://docs.oracle.com/iaas/releasenotes/console/consoleai-preview-oc1-july-2026.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Deny Policies](https://docs.oracle.com/iaas/Content/Identity/policysyntax/denypolicies.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Console AI는 OCI Console 안에서 자연어로 리소스 탐색, 지원되는 리소스 생성·관리, 문제 해결, 과금·사용량 이해, 일반 작업 절차 학습을 돕는 대화형 Preview 기능입니다. 공식 Release Note에 따르면 Console AI는 사용자의 현재 OCI IAM 권한, 선택 리전, compartment, 리소스 컨텍스트를 기준으로 동작합니다.

중요한 점은 리소스를 변경하는 작업은 사용자의 검토와 승인이 필요하다는 것입니다. 따라서 운영자가 직접 수행하던 콘솔 탐색·가이드 작업을 보조하되, IAM 권한을 우회하거나 자동으로 변경을 확정하는 기능으로 이해하면 안 됩니다.

### 권한 모델과 동작 방식

Console AI는 OCI Console 안에서 동작하는 대화형 경험이며, 사용자의 현재 IAM 권한·선택 region·compartment·resource context를 사용합니다. Release Note 원문에서 중요한 부분은 리소스를 변경하는 action이 사용자의 검토와 승인을 요구한다는 점입니다. 즉, Console AI는 권한을 우회하는 자동 운영자가 아니라, 현재 사용자가 할 수 있는 작업을 자연어로 돕는 보조 인터페이스입니다.

Console AI가 안내할 수 있는 범위는 IAM policy가 결정합니다. 민감한 compartment를 다루는 사용자에게는 일반 Console 권한과 동일하게 최소 권한 원칙을 적용해야 하며, 필요한 경우 Deny Policy를 사용해 특정 operation을 명시적으로 막는 설계를 검토할 수 있습니다.

```text
# 정책 설계 예시: 운영 변경 권한은 별도 그룹에만 부여
Allow group ConsoleAI-Operators to read all-resources in compartment demo
Allow group ConsoleAI-Operators to manage instances in compartment demo
# 민감 compartment는 별도 policy set에서 분리하고, 필요 시 deny policy로 보호
```

### Preview 적용 범위

이 Preview는 OC1 realm과 home region 조건을 포함한 availability 조건이 있습니다. 고객 데모나 내부 가이드에 넣기 전에는 실제 테넌시에서 Console AI 메뉴 노출 여부, 지원되는 workflow, 변경 승인 화면을 확인해야 합니다.

### 보안 검토 포인트

* Console AI 사용자가 어떤 compartment를 볼 수 있는지 IAM policy로 확인합니다.
* 리소스 변경 action이 최종 승인 없이 실행되지 않는지 테스트합니다.
* 고객 데모에는 Preview 기능이며 동작 범위가 변경될 수 있다는 설명을 포함합니다.
## Oracle Interconnect for AWS
* **Services:** Oracle Cloud Infrastructure
* **Release Date:** July 29, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/console/interconnect-aws.htm](https://docs.oracle.com/iaas/releasenotes/console/interconnect-aws.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Interconnect for AWS](https://docs.oracle.com/iaas/Content/multicloud/interconnect-aws.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Oracle Interconnect for AWS가 공식 제공되면서 OCI와 AWS 사이의 멀티클라우드 연결을 OCI 문서 기준으로 설계할 수 있게 되었습니다. 이 항목은 단순 회선 추가가 아니라 AWS와 OCI에 분산된 애플리케이션, 데이터베이스, 분석 워크로드 사이의 사설 연결 경로를 표준화하는 의미가 있습니다.

고객 관점에서는 인터넷 경유 통신을 줄이고, 하이브리드·멀티클라우드 아키텍처에서 지연 시간과 보안 경계를 더 명확히 관리할 수 있습니다. 특히 OCI Database@AWS, OCI와 AWS 간 데이터 동기화, DR 또는 점진적 마이그레이션 시나리오를 검토하는 팀에게 유용합니다.

### 구성 흐름

공식 문서의 Interconnect for AWS 절차는 먼저 OCI와 AWS 양쪽 네트워크 경계를 정리하는 것에서 시작합니다. 대상 OCI VCN과 AWS VPC의 CIDR이 겹치지 않는지 확인하고, 어떤 subnet과 route table이 상호 통신해야 하는지 범위를 좁혀야 합니다. 이후 OCI 측 연결 리소스와 AWS 측 연결 리소스를 구성하고, 양쪽 route table에 상대 cloud prefix를 추가합니다.

운영 환경에서는 DNS 해석 경로도 함께 설계해야 합니다. 애플리케이션이 AWS private hosted zone 또는 OCI private DNS zone 이름을 사용한다면, 단순 L3 연결만으로는 충분하지 않을 수 있습니다. 필요한 경우 resolver forwarding, conditional forwarding, on-premises DNS 연계까지 포함해 테스트해야 합니다.

```text
검토 순서 예시
1. OCI VCN CIDR / AWS VPC CIDR 중복 확인
2. 통신 대상 subnet과 port 범위 정의
3. OCI route table과 AWS route table 업데이트
4. OCI NSG/security list와 AWS Security Group/NACL 정합성 확인
5. DNS 해석과 애플리케이션 connection test 수행
```

### 운영상 영향

Oracle Interconnect for AWS는 멀티클라우드 통신을 공식 경로로 다룰 수 있게 해주지만, 트래픽 경로가 늘어나는 만큼 장애 분석 지점도 늘어납니다. OCI와 AWS 각각에서 route, security rule, flow log, 비용 지표를 동시에 확인해야 합니다. 데이터 전송 비용과 지연 시간 요구사항은 PoC 단계에서 측정값으로 남기는 것이 좋습니다.

### 도입 시 체크리스트

* OCI와 AWS CIDR, DNS, routing, 보안 규칙을 한 장의 연결 매트릭스로 정리합니다.
* 업무별 허용 port를 최소화하고, 임시 테스트 규칙은 운영 전 제거합니다.
* OCI VCN Flow Logs와 AWS VPC Flow Logs를 함께 켜서 초기 장애 분석 근거를 확보합니다.
