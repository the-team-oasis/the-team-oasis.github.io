---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "10월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2026년 10월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2026-cloudnative-security
tags:
  - oci-release-notes-2026
  - Oct-2026
  - cloudnative
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

## Support for Kubernetes version 1.36.4

* **Services:** Kubernetes Engine
* **Release Date:** 2026년 10월 1일
**분류:** Cloud Native & Security

### 업데이트 내용

OCI Kubernetes Engine(OKE)이 Kubernetes 1.36.4를 지원합니다. OKE는 2026년 11월 3일부터 Kubernetes 1.36.1 지원을 종료할 예정이며, Oracle은 클러스터를 1.34.10, 1.35.2 또는 1.36.4로 업그레이드할 것을 권고합니다.

관리형 Vault 마스터 암호화 키를 사용하는 기존 클러스터를 1.36.1 이상으로 업그레이드하면, 새로 생성되거나 이후 수정되는 Kubernetes Secret은 KMS provider v2를 사용합니다. 다만 기존에 변경되지 않은 Secret은 자동으로 일괄 재암호화되지 않으며 v1 읽기 폴백으로 계속 읽을 수 있습니다. 모든 기존 Secret을 v2로 재암호화하려면 StorageVersionMigration 기반의 별도 마이그레이션을 계획해야 합니다.

### 워커 노드 이미지 조건

Kubernetes 1.35 이상 클러스터에서는 OKE OL8 이미지와 OKE OL8 이미지 기반 custom image를 지원합니다. OL8 platform image 기반 custom image를 계속 사용할 경우에는 cgroups v2를 활성화해야 합니다. 신규 배포와 업그레이드에는 OKE 이미지를 사용하는 것이 권장되며, platform image를 유지해야 한다면 이를 기반으로 custom image를 만들고 node pool에 해당 image OCID를 지정해야 합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-K8s-1-36-4-support.htm
- Kubernetes Secrets KMS v2 마이그레이션: https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengmigratingsecretstokmsv2.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## OCI Kubernetes Engine (OKE) support for GPU host repair

* **Services:** Kubernetes Engine
* **Release Date:** 2026년 10월 2일
**분류:** Cloud Native & Security

### 업데이트 내용

OKE에서 적격 관리형 베어메탈 GPU 워커 노드의 하드웨어 관련 상태에 대응하는 GPU 호스트 복구를 지원합니다. GPU Health Monitoring 애드온의 신호 또는 운영자의 판단에 따라 복구를 시작할 수 있으며, OKE는 새 워크로드 배치를 중단하고 워크로드 드레인을 시도한 뒤 Compute 작업을 조정합니다.

### 지원 복구 유형

- **사용자 시작 복구:** 운영자가 교체가 필요한 노드를 선택하면 OKE가 노드를 드레인하고 Compute에 상태를 보고한 후 인스턴스를 종료하며, 관리형 노드 풀 용량을 복원합니다.
- **GPU 인스턴스 복구:** GPU Health Monitoring이 적격한 심각도 신호를 보고하면 OKE가 노드를 드레인하고 해당 인스턴스를 재부팅합니다.

GPU 호스트 복구는 워크로드를 중단시킬 수 있으므로, 적용 전에 PodDisruptionBudget, 복제본 수, 체크포인트 요구 사항, 토폴로지 제약, 여유 GPU 용량을 검토해야 합니다. 문서는 실제 복구 전에 영향을 검토할 수 있는 dry-run 모드도 제공합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng_node-auto-repair.htm
- GPU Hosts 복구 가이드: https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengautorepairgpuworkernodes.htm

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Use OAuth resource indicators with identity domains

* **Services:** IAM
* **Release Date:** 2026년 10월 7일
**분류:** Cloud Native & Security

### 업데이트 내용

IAM Identity Domain에서 OAuth Resource Indicator를 지원합니다. OAuth 클라이언트는 토큰 요청의 `resource` 매개변수로 대상 리소스 서버를 지정하고, `scope` 매개변수로 필요한 권한을 요청할 수 있습니다. 요청 scope는 해당 클라이언트에 허용되어야 하며 선택한 리소스 서버에 속해야 합니다.

`resource`를 지정한 요청에서는 리터럴 scope와 완전 수식 scope를 사용할 수 있습니다. 액세스 토큰의 `aud` 클레임은 리소스 애플리케이션에 구성된 audience를 사용하며, audience가 구성되지 않은 경우 요청의 `resource` 값이 반영됩니다. 리소스 서버별 토큰 audience 검증을 운영하는 환경은 클라이언트의 허용 scope와 audience 구성을 함께 점검해야 합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/identity/oauth-resource-indicators-for-identity-domains.htm
- OAuth Resource Indicators 가이드: https://docs.oracle.com/en-us/iaas/Content/Identity/api-getstarted/oauth-resource-indicators.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Support for Kubernetes version 1.37.0 in a preview release of Kubernetes Engine

* **Services:** Kubernetes Engine
* **Release Date:** 2026년 10월 8일
**분류:** Cloud Native & Security

### 업데이트 내용

OKE가 Kubernetes 1.37.0의 미리 보기(Preview) 릴리스를 제공합니다. 이 버전은 초기 테스트 및 검증용이며 OC1 리전에서만 제공됩니다. 알려진 우회 방법이 없는 문제가 포함될 수 있으므로 프로덕션 워크로드에는 사용하지 않아야 하며, 프로덕션 환경은 Kubernetes 1.37.1 지원 릴리스를 기다리도록 안내합니다.

### LoadBalancer 변경 사항

Kubernetes 1.37부터 `LoadBalancer` 타입 Kubernetes Service는 기본적으로 최소·최대 대역폭 100Mbps의 Flexible Load Balancer를 프로비저닝합니다. 기존 로드 밸런서는 변환되거나 크기 조정되지 않으며, 명시적 shape annotation이 있는 경우 해당 설정이 우선합니다.

또한 `LoadBalancer` Service가 참조하는 TLS Secret은 Service와 동일한 네임스페이스에 있어야 합니다. 다른 네임스페이스의 Secret을 참조하는 기존 annotation은 1.37에서 거부되므로, 업그레이드 전에 대상 Service의 Secret을 동일 네임스페이스로 복사하고 annotation을 갱신해야 합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng-K8s-1-37-0-preview-support-Release-Note.htm
- Kubernetes `LoadBalancer` Service 정의: https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingloadbalancer.htm

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## ID-JAG token exchange across trust domains

* **Services:** IAM
* **Release Date:** 2026년 10월 9일
**분류:** Cloud Native & Security

### 업데이트 내용

OCI IAM은 ID-JAG(Identity Assertion JWT Authorization Grant) 토큰 교환을 지원합니다. ID-JAG는 신뢰 도메인 간에 ID를 전달하기 위한 짧은 수명의 서명된 JWT이며, 소스 Identity Domain은 ID 토큰을 ID-JAG로 교환할 수 있습니다. 대상 Identity Domain은 해당 grant를 OAuth 액세스 토큰으로 교환할지 독립적으로 결정합니다.

도메인 간 인증 연동을 설계할 때 소스 도메인의 assertion 발급과 대상 도메인의 토큰 교환 정책을 별도 경계로 검토해야 합니다. 특히 이 기능은 단순한 토큰 전달이 아니라 대상 도메인이 교환 허용 여부를 결정하는 신뢰 경계 모델입니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/identity/id-jag-token-exchange-across-trust-domains.htm
- ID-JAG 토큰 교환 가이드: https://docs.oracle.com/en-us/iaas/Content/Identity/api-getstarted/id-jag-support.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Updated Certified Components for IAM E-Business Suite Asserter

* **Services:** IAM
* **Release Date:** 2026년 10월 14일
**분류:** Cloud Native & Security

### 업데이트 내용

IAM E-Business Suite Asserter SSO 통합의 인증 구성 요소가 갱신되었습니다. 인증 구성에는 E-Business Suite Asserter `26.3.38-2609241351`, Oracle E-Business Suite 12.2.7 이상(NGTS)·12.2.x(Classic Technology Stack)·12.1.3, Oracle WebLogic Server 14.1.2, JDK 17이 포함됩니다.

E-Business Suite Asserter 기반 SSO를 신규 구성하거나 업그레이드하기 전에 현재 EBS, WebLogic, JDK 조합이 인증 구성과 호환되는지 확인해야 합니다. WebLogic Server 업그레이드 또는 패치 이슈는 Oracle WebLogic Server Product Support로 문의하도록 원문이 안내합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/identity/iam-ebs-asserter-support-weblogic-ebs-ngts.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Rate Limits for MFA Factor Enrollment and Sign-In Notifications

* **Services:** IAM
* **Release Date:** 2026년 10월 15일
**분류:** Cloud Native & Security

### 업데이트 내용

IAM은 리전별 사용자 단위로 일일 MFA 요소 등록 최대 10회와 MFA 로그인 알림 최대 30회의 제한을 적용합니다. 제한을 넘는 요청은 rate restriction 대상이 됩니다.

이 제한은 별도 설정 없이 자동 적용됩니다. 대량 온보딩, 재등록, 테스트 자동화, 반복 로그인 알림이 발생할 수 있는 프로세스에서는 사용자별 일일 요청량을 고려해 재시도·알림 흐름을 설계해야 합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/identity/rate_limits_for_mfa_factor_enrollment_and_sign_in_notifications.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## OCI Kubernetes Engine (OKE) support for GPU maintenance event repair

* **Services:** Kubernetes Engine
* **Release Date:** 2026년 10월 21일
**분류:** Cloud Native & Security

### 업데이트 내용

OKE는 Enhanced Cluster의 적격 베어메탈 GPU 워커 노드에 대해 maintenance event repair를 조정할 수 있습니다. GPU Health Monitoring 애드온이 적격한 심각 HPC 장애를 보고하면, OKE는 OCI Compute 유지보수 이벤트와 장애를 연계하고 노드를 새 워크로드에서 제외한 뒤 드레인을 시도합니다.

### STOP 및 TERMINATE 이벤트 처리

유지보수 이벤트의 지정 작업이 `STOP`이면 OKE는 유지보수 이벤트 처리를 조정한 뒤 같은 워커 노드를 서비스로 복귀시킵니다. `TERMINATE`이면 영향을 받은 Compute 인스턴스를 종료하며, 관리형 노드 풀은 일반 용량 관리로 대체 노드를 생성합니다. 운영자는 `NodeHealthReport` 및 Kubernetes node condition으로 연계된 이벤트와 복구 상태를 관찰할 수 있습니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/conteng/conteng_node-maintenance-event-repair.htm
- GPU Hosts 복구 가이드: https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengautorepairgpuworkernodes.htm

<!-- depth: detailed; rationale: 구성·지원 조건을 구분해야 하므로 해당 기능에 필요한 절만 유지한다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Oracle-Seeded Application Roles Protected from Modification

* **Services:** IAM
* **Release Date:** 2026년 10월 23일
**분류:** Cloud Native & Security

### 업데이트 내용

IAM Identity Domain은 Identity Domain Administrator를 포함한 관리자가 Oracle 제공 애플리케이션 역할(AppRole)을 수정·교체·삭제하지 못하도록 변경했습니다. 이 보호 기능은 Identity Domain 기능에 필요한 역할이 실수로 또는 지원되지 않는 방식으로 변경되는 것을 방지합니다.

고객이 생성한 애플리케이션과 Custom AppRole은 영향을 받지 않으며 별도 조치도 필요하지 않습니다. Oracle Cloud Services의 제공 역할을 검토하려면 Console에서 **Identity & Security > Domains > 대상 Identity Domain > Oracle Cloud Services**로 이동합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/identity/identity-protect-oracle-seeded-approles.htm
- Oracle Cloud Services 관리: https://docs.oracle.com/en-us/iaas/Content/Identity/oraclecloudservices/overview.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->

## Remove Email Suppressions with the UserEmailSuppressionRemover API

* **Services:** IAM
* **Release Date:** 2026년 10월 28일
**분류:** Cloud Native & Security

### 업데이트 내용

`UserEmailSuppressionRemover` API를 사용해 사용자의 이메일 주소에 연결된 이메일 suppression을 제거할 수 있습니다. suppression을 해제하면 해당 사용자는 Identity Domain 이메일 알림을 다시 수신할 수 있습니다.

알림 미수신 문제를 처리하는 운영 절차에 suppression 상태 확인과 API 기반 해제 단계를 포함할 수 있습니다. 해제 작업은 해당 사용자 이메일 알림 수신을 다시 허용하는 변경이므로, 요청자 검증과 변경 이력 관리 기준을 적용하는 것이 적절합니다.

### 참고

- Release Note: https://docs.oracle.com/en-us/iaas/releasenotes/identity/identity-remove-email-suppressions.htm
- 사용자 이메일 suppression 제거: https://docs.oracle.com/en-us/iaas/Content/Identity/notifications/removing-email-suppressions-user.htm

<!-- depth: concise; rationale: 공식 변경점과 지원 범위를 업데이트 내용 한 절로 전달할 수 있다. optional_elements: YAML/IAM/CLI/SQL examples=omit(설명·공식 문서로 충분하며 실행 예제 추가 불필요); blockquote=omit(필수 일반 개념 정의 없음); images/architecture_diagram=omit(지원 범위 전달에 시각 자료 불필요). -->
