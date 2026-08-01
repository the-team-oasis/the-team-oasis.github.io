---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "7월 OCI Oracle Data Platform 업데이트 소식"
teaser: "2026년 7월 OCI Oracle Data Platform 업데이트 소식입니다."
author: lim
breadcrumb: true
categories:
  - release-notes-2026-dataplatform
tags:
  - oci-release-notes-2026
  - Jul-2026
  - DATAPLATFORM, DATABASE, ORACLE
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


## Database Developer Portal for Database Tools
* **Services:** Database Tools
* **Release Date:** July 28, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-tools/dev-db.htm](https://docs.oracle.com/iaas/releasenotes/database-tools/dev-db.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Tools에 Database Developer Portal이 추가되었습니다. OCI에서 데이터베이스 개발자가 연결, SQL 작업, 개발 흐름을 더 중앙화된 포털에서 수행할 수 있습니다.

### 운영 시 참고 사항

개발자 포털은 접근 권한과 데이터베이스 연결 정보 관리가 중요합니다. compartment, IAM policy, connection secret 범위를 개발자 역할에 맞게 분리해야 합니다.

## New connection types added for GoldenGate
* **Services:** GoldenGate
* **Release Date:** July 27, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/goldengate/r11connections.htm](https://docs.oracle.com/iaas/releasenotes/goldengate/r11connections.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

GoldenGate에 AI Models 및 Google Managed Service for Apache Kafka 등 새로운 connection type이 추가되었습니다. 데이터 통합 대상과 소스 선택지가 확장됩니다.

### 운영 시 참고 사항

신규 connection type 사용 시 네트워크 접근, 인증 방식, 처리량, 장애 재처리 정책을 확인해야 합니다. 외부 서비스 연계는 보안 승인과 비용 영향도 함께 검토하는 것이 좋습니다.

## Explore Database Management Using Demo Mode
* **Services:** Database Management
* **Release Date:** July 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-management/enable-demo-mode.htm](https://docs.oracle.com/iaas/releasenotes/database-management/enable-demo-mode.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Management에서 Demo Mode를 사용할 수 있습니다. 실제 데이터베이스 연결 없이 주요 기능과 화면 흐름을 살펴볼 수 있어 학습과 데모 준비가 쉬워집니다.

### 운영 시 참고 사항

Demo Mode 결과는 실제 운영 지표가 아닙니다. 고객 설명 시 데모 데이터와 실제 Database Management 수집 데이터의 차이를 명확히 구분해야 합니다.

## Compare Period ADDM
* **Services:** Database Management
* **Release Date:** July 23, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/database-management/compare-period-addm.htm](https://docs.oracle.com/iaas/releasenotes/database-management/compare-period-addm.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Database Management에서 Compare Period ADDM을 사용할 수 있습니다. 서로 다른 기간의 성능 분석 결과를 비교해 성능 변화 원인을 파악하는 데 도움을 줍니다.

### 운영 시 참고 사항

비교 기간 선정이 분석 품질을 좌우합니다. 배포, 부하 변화, 통계 수집 시점을 함께 기록해 성능 변화 해석에 활용하는 것이 좋습니다.

## Availability Domain Selection in Autonomous AI Database
* **Services:** Autonomous Database Serverless
* **Release Date:** July 21, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-ad-selection.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-ad-selection.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database 생성 시 Availability Domain 선택을 지원합니다. 리소스 배치 요구사항이나 네트워크/복원력 설계를 더 세밀하게 반영할 수 있습니다.

### 운영 시 참고 사항

AD 선택은 장애 도메인 설계, 애플리케이션 배치, 지연 시간, 가용성 전략과 연계됩니다. 기존 네트워크와 애플리케이션 위치를 함께 고려해야 합니다.

## Oracle APEX 26.1
* **Services:** Autonomous Database Serverless
* **Release Date:** July 14, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-oracle-apex.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-oracle-apex.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous Database Serverless에서 Oracle APEX 26.1을 사용할 수 있습니다. APEX 애플리케이션 개발과 운영에 최신 기능을 적용할 수 있습니다.

### 운영 시 참고 사항

APEX 버전 변경은 애플리케이션 플러그인, 테마, 인증 구성에 영향을 줄 수 있습니다. 운영 앱은 사전 테스트 환경에서 호환성을 검증하는 것이 좋습니다.

## External Authentication Support for Database Tools in Autonomous AI Database
* **Services:** Autonomous Database Serverless
* **Release Date:** July 07, 2026
* **Release Note:** [https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-external-authentication.htm](https://docs.oracle.com/iaas/releasenotes/autonomous-database-serverless/2026-07-external-authentication.htm){:target="_blank" rel="noopener"}

### 업데이트 내용

Autonomous AI Database의 Database Tools에서 external authentication을 지원합니다. 중앙 인증 체계와 연계한 데이터베이스 도구 접근 모델을 구성할 수 있습니다.

### 운영 시 참고 사항

외부 인증 연계는 IAM, database user mapping, 감사 로그와 함께 설계해야 합니다. 권한 상승이나 공유 계정 사용을 피하고 최소 권한을 적용하는 것이 좋습니다.
