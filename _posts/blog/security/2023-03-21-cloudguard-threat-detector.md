---
layout: page-fullwidth
#
# Content
#
subheadline: "Security"
title: "OCI Cloud Guard Threat Detector 소개"
teaser: "OCI Cloud Guard Threat Detector는 클라우드 사용자의 악의적인 활동을 지속적으로 모니터링하고 감지하는 Cloud Guard 의 Detector Recipe입니다. 이번 글에서는 Threat Detector에 대해서 설명합니다."
author: dankim
breadcrumb: true
categories:
  - security
tags:
  - [oci, security, cloudguard]
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

### Cloud Guard Threat Detector란?
Cloud Guard Threat Detector는 OCI Audit Event를 기반으로 악의적인 행위로 의심되는 활동을 지속적으로 모니터링하는 Cloud Guard에서 제공하는 Detector Recipe입니다. 조직 내에 누군가가 인프라를 악용하거나 혹은 계정 정보를 탈취당하여 악의적인 목적으로 사용되는 경우(Threat Detector에서는 이를 Rogue User(악성 혹은 불량 사용자)라 부릅니다)가 있을 수 있는데, Threat Detector는 이러한 다양한 악의적인 행동을 모니터링한 후 위험이 감지되면 Cloud Guard Responder Recipe의 **Disable IAM User** Rule을 통해서 계정의 권한을 비활성화할 수 있습니다.

Cloud Guard에 대한 소개 및 기본 사용 방법은 아래 포스팅을 참고하세요.  
[OCI Cloud Guard 소개](https://the-team-oasis.github.io/security/intro-cloudguard/)

Threat Detector는 [MITRE ATT&CK(마이터 어택)](https://attack.mitre.org/) 프레임워크에 매핑되었으며, 오라클의 Threat Intelligence 및 Data Science 기술을 적용하였습니다.

> MITRE ATT&CK은 MITRE Adversarial Tactics, Techniques, and Common Knowledge의 약자입니다. MITRE ATT&CK 프레임워크는 마이터(MITRE Corp)가 개발한 ATT&CK 프레임워크로 사이버 공격과 침입을 분류하고 설명하기 위한 지침입니다.
<cite>Wikipedia</cite>

> 마이터(MITRE Corp)는 취약점 데이터베이스인 CVE(Common Vulnerabilities and Exposures)를 감독하는 비영리 단체입니다.

### Cloud Guard Threat Detector 사용 방법
Threat Detector의 경우도 다른 Detector Recipe와 마찬가지로 OCI에서 기본적으로 제공하는 Recipe인 Oracle-managed detector recipe와 사용자가 직접 정의할 수 있는 User-managed detector recipe로 제공됩니다. User-managed detector를 생성하기 위해서는 기본 제공되는 Oracle-managed Threat Detector를 선택한 후 **Clone** 버튼을 클릭하여 생성합니다. 현재 User-managed Threat Detector에서 사용자 정의할 수 있는 부분은 Detector의 상태를 **활성 혹은 비활성**으로 변경하는 부분과 특정 조건에만 동작하도록 Conditional Group을 지정하는 부분입니다.

![](/assets/img/cloudnative-security/2023/cloudguard-threat-detector-1.png)

기본 Oracle-managed Threat Detector Recipe를 활용하여도 상관없지만, 여기서는 Clone 한 Threat Recipe를 사용해 보도록 하겠습니다. Cloud Guard의 Targets 메뉴를 선택한 후 생성되어 있는 Target을 선택, Detector Recipe를 순서대로 선택합니다.
그리고 **Add recipes**를 선택한 후 앞서 Clone 한 Threat Recipe를 선택하면 설정이 완료됩니다.

![](/assets/img/cloudnative-security/2023/cloudguard-threat-detector-2.png)

추가된 Threat Detector를 선택해보면 **Rogue User** Rule을 볼 수 있으며, 오른쪽 <svg width="15" height="15" viewBox="0 0 20 20" focusable="false" xmlns="http://www.w3.org/2000/svg" ratio="0.75"> <circle cx="10" cy="3" r="2"></circle> <circle cx="10" cy="10" r="2"></circle> <circle cx="10" cy="17" r="2"></circle></svg> 아이콘을 클릭하면 해당 Rule에 특정 조건에 Rule이 동작하도록 Conditional Group을 추가할 수 있습니다.
![](/assets/img/cloudnative-security/2023/cloudguard-threat-detector-3.png)

오른쪽에 있는 **⌄** 아이콘을 클릭하면 **Sighting type(목격 유형)**을 볼 수 있습니다.
![](/assets/img/cloudnative-security/2023/cloudguard-threat-detector-4.png)

### Sighting Type
Rogue User(악성 혹은 불량 사용자)를 판별하기 위한 기준으로 현재 총 7개의 Sighting Type을 제공합니다. 각 Sighting Type은 MITRE ATT&CK 프레임워크의 전략과 기술을 기반으로 동작합니다. Sighting Type의 심각도 및 신뢰도 요소에 많이 포함될수록 심각도와 확신 수준이 높아집니다.

#### Sighting Type 1: Elevated Access
* 설명: 공격자들이 사용자의 일상적인 책임/권한을 넘어서는 활동을 수행하거나 과도하게 프로비저닝을 수행하는 행위를 할 수 있습니다.
* MITRE ATT&CK 프레임워크 참조
  * 전략: [Privilege Escalation](https://attack.mitre.org/tactics/TA0004/)
  * 기술 또는 하위 기술: [[Valid Accounts](https://attack.mitre.org/techniques/T1078/): [Cloud Account (T1078.004)](https://attack.mitre.org/techniques/T1078/004/)]
* 데이터 출처:
  * OCI Audit 이벤트
  * IP 주소 평가
* 학습 기간: 새로운 사용자의 패턴 학습 기간은 90일이 소요됩니다.
* 심각도 및 확신 수준: 다음과 같은 요소를 기반으로 심각도와 확신 수준이 할당됩니다.
  * 사용자가 요청한 권한이 특정 서비스와 관련하여 지난 몇 주간 요청된 권한에 비해 과도하게 높은 권한입니까?
  * 사용자의 요청이 의심스로운 IP 주소 또는 기존에 접속하지 않았던 위치에서 시작되었습니까?
  * 요청에 새로운 에이전트가 사용되었습니까?
  * 요청 전 최소 7일간 사용자가 휴먼 상태였습니까?
  * 요청이 TOR Exit Node, 공용 프록시 또는 익명의 VPN을 통해서 이루어졌습니까?

#### Sighting Type 2: Elevated Number of Pre-Authenticated Requests (PARs)
* 설명: 사전 인증된 요청(Pre-Authenticated Requests: PARs)이 비정상적으로 생성되는 경우입니다. PARs는 별도의 자격 증명 없이 Private Bucket이나 Object에 액세스할 수 있는 방법을 제공하므로 공격자가 특정 명령이나 제어 채널을 통하지 않고 데이터를 유출할 수 있습니다.
* MITRE ATT&CK 프레임워크 참조
  * 전략:  [Exfiltration](https://attack.mitre.org/tactics/TA0010)
  * 기술 또는 하위 기술: [Exfiltration Over Web Service: Exfiltration to Cloud Storage (T1567.002)](https://attack.mitre.org/techniques/T1567/002)
* 데이터 출처:
  * OCI Audit 이벤트
* 학습 기간: PARs이 시간적으로 간격이 없이 생성된다면, Threat Detector는 이러한 공격이 시작된 몇 시간 내에 감지를 하게 됩니다. 만약 PARs가 시간적으로 간격을 길게 생성하면, Threat Detector에 의해서 감지되는 시간은 더 오래 소요될 수 있습니다.
* 심각도: PAR의 기간, 개수 및 유형에 따라 심각도 수준을 할당합니다. 기간이 길고 PAR 수가 많을수록 할당된 심각도 수준이 높아집니다.
* 확신 수준: Threat Detector는 감지된 PAR 관련 활동 패턴을 기반으로 확신 수준을 할당합니다. PAR 관련 활동 패턴이 의심스러울수록 할당되는 확신 수준은 높아집니다.

#### Sighting Type 3: Impair Defenses
* 설명: 공격자는 획득한 권한을 악용하여 클라우드 보안 도구, VCN(가상 클라우드 네트워크) 보안 목록 및 데이터 백업과 같은 방어 메커니즘을 비활성화할 수 있습니다.
* MITRE ATT&CK 프레임워크
  * 전술: [Defense Evasion](https://attack.mitre.org/tactics/TA0005/)
  * 기술 또는 하위 기술: [Impair Defenses: Disable or Modify Tools (T1562.001)](https://attack.mitre.org/techniques/T1562/001/)
* 데이터 출처:
  * OCI Audit 이벤트
* 학습 기간: Threat Detector는 이러한 유형의 공격이 시작된 후 몇 시간 이내에 Impair Defense를 감지하기 시작합니다.
* 심각도: Threat Detector는 Impair Defense 관련 API 및 영향을 받는 서비스 유형의 요청 상태를 기반으로 심각도 수준을 할당합니다. 영향을 받는 보안 관련 서비스가 많을수록 할당되는 심각도 수준이 높아집니다.
* 확신 수준: Threat Detector는 감지된 Impair Defense 활동의 패턴을 기반으로 확신 수준을 할당합니다. 발생한 의심스러운 활동의 인스턴스가 많을수록 Impair Defense 관련 활동의 패턴이 의심스러울수록 할당된 확신 수준이 높아집니다.

#### Sighting Type 4: Impossible Travel
* 설명: 공격자는 클라우드 계정에 대한 자격 증명을 획득하고 남용하여 제한된 리소스에 대한 액세스를 제공할 수 있습니다. 적법한 자격 증명의 불법 사용을 감지하는 한 가지 방법은 액세스 간격이 짧음에도 불구하고 물리적으로 불가능한 서로 다른 지리적 위치에서 동일한 계정에 의한 접속을 식별하는 것입니다.
* MITRE ATT&CK 프레임워크
  * 전술: [Initial Access (TA0001)](https://attack.mitre.org/tactics/TA0001)
  * 기술 또는 하위 기술: [Valid Accounts](https://attack.mitre.org/techniques/T1078/): [Cloud Account (T1078.004)](https://attack.mitre.org/techniques/T1078/004/)
* 데이터 출처:
  * IP 주소
* 학습 기간: Threat Detector는 연속적인 액세스에서 IP 주소 비교를 시작하기 전, 새 사용자의 활동 패턴을 학습하는 데 7일이 소요됩니다.
* 심각도: Threat Detector는 대상 사용자의 관찰된 IAM 권한 수준을 기반으로 심각도 수준을 할당합니다. 사용자의 권한이 높을수록 할당되는 심각도 수준이 높아집니다.
* 확신 수준: Threat Detector는 주로 순차적인 액세스 사이의 시간과 거리에서 감지된 패턴을 기반으로 확신 수준을 할당합니다. 시간 대비 거리가 짧을수록 할당된 확신 수준이 높아집니다. 또한 권한 사용 패턴의 차이도 고려합니다. 현재 사용되는 권한 패턴이 과거 패턴과 다를수록 할당된 확신 수준이 높아집니다.

#### Sighting Type 5: Password Guessing
* 설명: 공격자는 단일 사용자를 대상으로 하는 무차별적인 암호 대입 공격으로 암호를 추측할 수 있습니다. 계정의 암호를 알지 못하는 공격자는 반복적인 메커니즘을 사용하거나 일반적인 암호 목록을 사용하여 체계적으로 암호를 추측하려고 시도할 수 있습니다. 공격자의 자동화된 프로세스에 실패한 인증 시도 사이에 충분한 기본 제공 대기 시간이 있는 경우 계정 잠금도 발생하지 않습니다.
* MITRE ATT&CK 프레임워크
  * 전술: [Credential Access](https://attack.mitre.org/tactics/TA0006)
  * 기술 또는 하위 기술: [Brute Force: Password Guessing (T1110.001)](https://attack.mitre.org/techniques/T1110/001/)
* 데이터 출처:
  * 로그인 이벤트
  * IP 주소 평가
  * 비밀번호 변경 로그
* 학습 기간: Threat Detector는 이러한 유형의 공격이 시작된 후 몇 시간 이내에 Password Guessing을 감지하기 시작합니다.
* 심각도: Threat Detector는 대상 사용자의 관찰된 IAM 권한 수준을 기반으로 심각도 수준을 할당합니다. 사용자의 권한이 높을수록 할당되는 심각도 수준이 높아집니다.
* 확신 수준: Threat Detector는 감지된 의심스러운 활동 패턴에 따라 확신 수준을 할당합니다. 의심스러운 활동이 더 많이 발생하고 의심스러운 개별 인스턴스 많을수록 할당된 확신 수준이 높아집니다.

#### Sighting Type 6: Password Spraying
* 설명: 공격자가 여러 사용자를 대상으로 하는 무차별적인 암호 대입 공격으로 암호를 추측할 수 있습니다. 공격자는 유효한 계정 자격 증명을 얻기 위해 다양한 계정에 대해 일반적으로 사용되는 단일 혹은 소량의 암호 목록을 사용할 수 있습니다. 무차별 암호 대입 공격을 가할 때 일반적으로 발생하는 잠금을 방지하기 위해 여러 다른 계정에 대해 로그인을 시도합니다.
* MITRE ATT&CK 프레임워크
  * 전술: [Credential Access](https://attack.mitre.org/tactics/TA0006)
  * 기술 또는 하위 기술: [Brute Force: Password Spraying (T1110.003)](https://attack.mitre.org/techniques/T1110/003/)
* 데이터 출처:
  * 로그인 이벤트
  * IP 주소 평가
  * 비밀번호 변경 로그
* 학습 기간: Threat Detector는 이러한 유형의 공격이 시작된 후 몇 시간 이내에 Password Spraying을 감지하기 시작합니다.
* 심각도: Threat Detector는 대상 사용자의 관찰된 IAM 권한 수준을 기반으로 심각도 수준을 할당합니다. 사용자의 권한이 높을수록 할당되는 심각도 수준이 높아집니다.
* 확신 수준: Threat Detector는 감지된 의심스러운 활동 패턴에 따라 확신 수준을 할당합니다. 의심스러운 활동이 더 많이 발생하고 의심스러운 개별 인스턴스 많을수록 할당된 확신 수준이 높아집니다.

#### Sighting Type 7: Persistence
설명: 공격자는 피해자 계정 및 인스턴스에 대한 지속적인 액세스를 유지하기 위해 공격자가 제어하는 ​​API 키를 추가할 수 있습니다.
* MITRE ATT&CK 프레임워크
  * 전술: [Persistence](https://attack.mitre.org/tactics/TA0003/)
  * 기술 또는 하위 기술: [Additional Cloud Credentials](https://attack.mitre.org/techniques/T1098/001/)
* 데이터 출처:
  * IP 주소 평가
  * OCI Audit Event
* 학습 기간: Threat Detector는 이러한 유형의 공격이 시작된 후 며칠 이내에 Persistence를 감지하기 시작합니다.
* 심각도: Threat Detector는 피해를 당한 사용자의 관찰된 IAM 권한 수준을 기반으로 심각도 수준을 할당합니다. 사용자의 권한이 넓을수록 할당되는 심각도 수준이 높아집니다.
* 확신 수준: Threat Detector는 감지된 Persistence 활동 패턴을 기반으로 신뢰 수준을 할당합니다. 의심스러운 개별 인스턴스가 많고, Persistence 관련 활동의 패턴이 의심스러울수록 할당된 확신 수준이 높아집니다.

### 사용 사례
아래는 Anakin이라는 사용자에 대한 Threat Detector Monitoring 화면입니다.
![](/assets/img/cloudnative-security/2023/cloudguard-threat-detector-5.png)

처음 Anakin 사용자에 대한 무차별 암호 대입에 대한 Sighting이 발견되었습니다. **Password Guessing**과 **Password Spraying**이 나타났지만, Anakin의 권한이 낮아 중간 정도의 심각도와 확신 수준을 보여줄 정도로 위험도가 낮아 보입니다. 

며칠 후 Thread Detector는 시간적으로나 물리적으로 불가능한 위치에서 Anakin이 접속한 것(Impossible Travel)을 감지합니다. 이는 이전의 무차별 암호 대입 공격이 성공했다는 증거일 수 있습니다. 이 상태에서 심각도는 중간이지만, 확신 수준은 증가하였습니다. 또한 **Pre-Authenticated Requests**를 통해 오브젝트 스토리지 Bucket에 대한 요청 수가 증가하면 다시 확신 수준이 다시 올라갑니다. 각 Sighting을 개별적으로 보고 판단하는 것은 어렵습니다. 하지만 이러한 내용을 종합적으로 보고 판단하면 현재 매우 위험한 상태인 것을 알 수 있습니다. 그림에서와 같이 전반적인 위험 점수 (Risk score)가 점점 증가하는 것을 확인할 수 있습니다. 

이는 Cloud Guard Threat Detector Recipe의 Rogue User Rule에 대한 임계치(80)를 초과하게 되고, Cloud Guard에서 Problem으로 판단하여 Cloud Guard Responder Recipe를 통해 관리자에게 경고 및 자동 혹은 수동적인 Remediation을 수행(Disable IAM User)하게 됩니다.

![](/assets/img/cloudnative-security/2023/cloudguard-threat-detector-6.png)

### 마무리
지금까지 2회에 걸쳐서 Cloud Guard 및 Thread Detector에 대해서 알아보았습니다. Public Cloud를 사용함에 있어서 보안은 매우 중요하고 어려운 주제이지만, 반드시 이해하고 있어야 합니다. OCI Cloud Guard는 무료 서비스이면서 다양한 기능과 최신의 보안 감지 규칙이 매우 빠르게 업데이트되고 있기 때문에 잘 활용하면 OCI 보안에 매우 도움이 될 것이라 생각됩니다.

### 참고
* https://blogs.oracle.com/cloudsecurity/post/cloud-guard-threat-detector-available
* https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/cloud-guard/using/detect-recipes.htm#detect-recipes-ref-threat