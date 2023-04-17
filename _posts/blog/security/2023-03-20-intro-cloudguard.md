---
layout: page-fullwidth
#
# Content
#
subheadline: "Security"
title: "OCI Cloud Guard 소개"
teaser: "OCI에서 무료로 제공하는 보안관제 서비스인 Cloud Guard에 대해 소개합니다."
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

### 공동 책임 모델(Shared Responsibility)
2019 Cloud Security Intelligence Security Report에 따르면 전 세계 약 40만명의 Cloud and Information Security Member중 약 57%가 Cloud Adoption에 있어서 가장 큰 장벽은 보안이라고 답하였습니다. 사실 클라우드 사용자는 Cloud Provider(클라우드 제공자)가 제공하는 인프라나 서비스 자체에 대한 보안 문제에 대해서는 책임질 필요가 없지만, 그렇다고 책임져야 할 부분이 없는 것은 아닙니다. 일반적으로 퍼블릭 클라우드 환경에서 보안 사고가 발생할 경우 누구의 책임인지를 확인하게 되는데, 이는 클라우드 제공자들이 말하는 공동 책임 모델(Shared Responsibility)이라는 것을 따르기 때문입니다. 공동 책임 모델은 클라우드 환경에서의 보안은 클라우드 제공자와 클라우드 사용자가 함께 책임을 공유한다는 개념입니다. 위 57%의 사용자가 보안이 가장 큰 장벽이라고 답한 이유가 바로 사용자가 책임져야 하는 부분, 즉 클라우드를 사용하면서 보안에 위협이 되는 잘못된 설정(Misconfigurations)이나 비보안적인 행위(Insecure Activities)가 얼마든지 발생할 수 있기 때문입니다.

### Cloud Guard
Cloud Guard는 클라우드 사용자의 보안 취약한 잘못된 설정(Misconfigurations)이나 비보안적인 행위(Insecure Activities)에 대해 통합적으로 모니터링하고, 문제를 감지하여 제안 및 조치를 취할 수 있도록 도와주는 무료 보안 서비스입니다.

Cloud Guard를 사용하기 위해서는 우선 아래 구성과 4개의 요소에 대해서 이해하여야 합니다. 구성에 대해서 간략히 요약하면 지정된 특정 구획 또는 전체 테넌시(**TARGETS**)에 있는 리소스를 모니터링한 후 보안 취약점이 발견되면(**DETECTORS**) 이를 보안 문제로 기록(**PROBLEMS**)한 후 적절한 작업(**RESPONDERS**)을 수행하는 구성이라고 볼 수 있습니다. 그럼 각 요소에 대해서 좀 더 자세히 살펴보겠습니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-1.png)

#### TARGET
Cloud Guard에서 모니터링 할 범위, 대상을 TARGET이라고 부릅니다. OCI에서는 구획(Compartment)라고 부르는 OCI 리소스에 대한 그룹핑 및 접근관리등을 할 수있는 논리적인 개념이 존재하는데, 보통 Cloud Guard에서의 TARGET으로 특정 구획(Compartment)을 지정합니다.

#### DETECTORS
Detector는 TARGET의 특정 리소스 및 활동을 감지하기 위한 규칙의 모음(Recipe라고 부릅니다.)입니다. Detector로 정의된 규칙에 의해 TARGET에 있는 리소스들에서 발생할 수 있는 잠재적인 보안 문제를 감지하게 됩니다.

Detector에는 OCI에서 기본적으로 제공하는 Recipe인 Oracle-managed detector recipe와 사용자가 직접 정의할 수 있는 User-managed detector recipe가 있는데, 기본적으로 Oracle-managed detector recipe를 활용하고, 이를 클론하여 사용자가 일부 Recipe에 대한 사용여부 혹은 규칙을 수정하여 사용하는 것이 일반적입니다.

Detector는 다음 세 가지 유형의 Recipe가 제공됩니다.  

1. Configuration Detector Recipe: 특정 리소스에 대한 설정이 보안 문제를 일으킬 수 있는 경우 감지하는데, 예로 "Object Storage Bucket을 Public으로 설정한 경우"가 해당될 수 있습니다.
2. Activity Detector Recipe: 보안 문제를 야기하는 특정 행위를 감지합니다. 예를 들면 "Database 인스턴스 삭제"와 같은 경우에 해당됩니다.
3. Threat Detector Recipe: 특정 사용자 계정을 통해 보안 위협이 되는 행위를 하는 경우에 감지합니다. 예를 들면 "의심 스러운 IP 혹은 새로운 지리적 위치에서의 접속 및 행위, 일반적인 행위보다 과도한 프로비저닝 활동을 하는 경우, 특정 계정에 대한 무차별 암호 대입 기술 사용과 같은 경우"가 해당됩니다.

#### PROBLEM
Detector를 통해서 감지된 결과를 Problem(잠재적인 보안 문제)이라고 합니다. Problem 목록을 통해서 어떤 Problem들이 발생했는지 확인을 할 수 있으며, 관리자는 Problem 유형에 따라 보안에 위협이 되는 설정을 삭제/롤백을 수행하거나, 상태 변경(해결됨, 제외/무시)과 같은 작업을 수행할 수 있습니다.

#### RESPONDER
마지막으로 Responder는 발생한 Problem 유형에 따라서 자동 혹은 수동으로 수행하는 규칙들의 모음(Recipe)을 의미합니다. Responder Recipe에는 모든 보안 문제에 대해서 관리자 혹은 특정 사용자에게 경고 메일을 전달하거나, 특정 리소스에 대해서 자동 혹은 수동으로 설정을 삭제/롤백하는 규칙들이 제공됩니다. Detector와 마찬가지로 Oracle-managed와 User-managed recipe를 제공합니다.

### Cloud Guard 활성화
Cloud Guard는 기본적으로 비활성화 되어 있습니다. Cloud Guard를 활성화 하기 위해서는 OCI Console > Identity & Security > Cloud Guard 로 이동한 후 Enable 버튼을 클릭하여 활성화 하여야 합니다. (기본으로 제공하는 무료 크래딧 300$로 체험할 수 있습니다. 단 Always Free에서는 사용할 수 없으며, 300$ 소진 후에는 유료 계정으로 업그레이드 해야 합니다.)

![](/assets/img/cloudnative-security/2022/oci-cloudguard-2.png)

Cloud Guard에서 여러 OCI 리소스에 접근을 허락해줘야 하기 때문에 기본적으로 필요한 Policy를 추가해 줘야 하는데, 활성화 과정에서 친절하게 한번에 추가할 수 있는 기능을 제공합니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-3.png)

Cloud Guard에서 모니터링 할 TARGET을 지정합니다. Detector Recipe도 지정할 수 있는데, Cloud Guard를 활성화 할때 선택해줘도 되지만, 활성화 한 이후에 별도로 지정도 가능합니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-4.png)

Cloud Guard가 활성화 되면 다음과 같은 Cloud Guard 대시보드를 볼 수 있습니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-5.png)

### User-managed detector, resopnder recipe
기본은 아래와 같이 Oracle-managed Recipe를 사용하지만, 수정이 불가능하기 때문에 Clone 버튼을 클릭하여 해당 Recipe를 클론한 후에 사용합니다. 클론한 Recipe의 경우 사용자가 해당 규칙을 수정할 수 있게 됩니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-6.png)

Configuration Detector Recipe는 글을 작성하는 현재 50개의 Rule을 제공하고 있습니다. 클론한 경우 Status(Disble, Enable), Risk Level (Minor, Low, Medium, High, Critical), Condition (발생 조건)등을 수정할 수 있습니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-7.png)

Responder Recipe는 글을 작성하는 현재 10개의 Rule을 제공하고 있습니다. 마찬가지로 클론을 하게 되면 사용자가 내용을 수정할 수 있습니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-8.png)

Responder Rule은 NOTIFICATION(알림)과 REMEDIATION(복원) 2 가지 유형을 제공하는데, NOTIFICATION의 경우 발생한 Problem에 대한 정보를 OCI Event와 Notification 서비스를 통해서 이메일이나 OCI Function등으로 전달할 수 있는 유형이며, REMEDIATION은 Problem을 자동 혹은 관리자에 의해 해당 문제를 복원할 수 있도록 해주는 유형입니다. 현재는 Cloud Event Rule만 NOTIFICATION 유형에 해당되는데, 해당 Rule을 통해서 알림을 전달하기 위해서는 OCI Event와 OCI Notification 서비스를 구성하여야 합니다. OCI Event와 OCI Notification 서비스를 구성은 아래 포스팅을 참고합니다.

[OCI Cloud Guard를 위한 Event 및 Notifications 구성하기](https://the-team-oasis.github.io/security/cloudguard-event/)

### 예시 - Cloud Guard 대상 (TARGET)에서 Public Bucket 생성
간단히 Cloud Guard가 적요된 대상에서 Public Bucket을 하나 생성해 보도록 하겠습니다. 아래와 같이 Object Storage에서 Bucket 생성 후 Visibility를 Public으로 변경합니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-10.png)

Cloud Guard 대시보드에서 Critical을 포함하여 Problem이 4개 생성된 것을 확인할 수 있습니다. Responder Status에도 1개의 Pending이 걸려 있는데, 앞서 관련된 Responder Rule의 Rule Trigger를 "Ask me before executing rule"로 설정해 놨기 때문에 관리자 액션이 있어야 하므로, Pending이 된 것입니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-11.png)

**Responder Activity** 메뉴에서 Responder Recipe Rule에 의해 Private으로 변경하기 전에 확인 요청이 생성 된 것을 볼 수 있습니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-12.png)

Skip Execute 를 선택 하면 해당 Remediation 은 취소 되는데, 여기서는 **Execute**를 클릭 해봅니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-13.png)

Bucket의 Visibility가 다시 Private으로 변경된 것을 확인할 수 있습니다.
![](/assets/img/cloudnative-security/2022/oci-cloudguard-14.png)

### 다음에는
Public Cloud에서 가장 빈번하게 발생하는 보안 사고중 하나가 계정 탈취에 의한 해킹사고입니다. 클라우드 사용자는 자신의 계정 정보나 API Signing Key가 해커에 의해 탈취당할 수 있으며, 해커는 이를 이용하여 대량의 리소스를 생성하여 체굴장으로 사용할 수 있으며 이에 따른 피해는 고스란히 사용자가 책임지게 됩니다. 다음 포스팅에서는 이렇게 사용자의 계정을 불법적으로 사용하는 행위를 감지하기 위한 Threat Detector에 대해서 자세히 알아보도록 하겠습니다.

### 참고
* https://docs.oracle.com/en-us/iaas/cloud-guard/using/index.htm