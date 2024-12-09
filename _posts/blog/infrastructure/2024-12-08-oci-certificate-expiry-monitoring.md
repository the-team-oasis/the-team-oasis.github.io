---
layout: page-fullwidth
#
# Content
#
subheadline: "Certificates"
title: "OCI Certificates 서비스로 관리되는 외부 공개 인증서 만료 기간 모니터링"
teaser: "OCI Certificates 서비스로 관리되는 외부 공개 인증서에 대한 만료 기간을 OCI Function을 활용하여 모니터링 하는 방법에 대해서 설명합니다."
author: "dankim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, cerfificates, functions]
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
> 이 포스팅은 오라클 솔루션 엔지니어인 ***Scotti Fletcher***의 다음 글을 참고하여 작성하였습니다.  
[Certificate expiry monitoring in Oracle Cloud Infrastructure](https://redthunder.blog/2023/06/16/certificate-expiry-monitoring-in-oracle-cloud-infrastructure)

OCI Certificates 서비스에서는 사설 인증서(Private Certificate)를 OCI Private CA를 통해 발급받을 수 있으며, 외부 인증 기관(Certificate Authority, CA)에서 발급받은 공개 인증서의 경우 가져오기(Import)기능을 통해 OCI Certificates 서비스에서 관리할 수 있습니다. 사설 인증서는 인증서 만료전에 자동으로 갱신이 가능하지만, 외부 공개 인증서의 경우에는 자동으로 갱신을 할 수 없기 때문에 사용자가 만료일에 대한 주의를 기울여야 합니다.  
하지만, OCI Certificates 서비스에서 관리되는 외부 공개 인증서에 대한 만료 기간 모니터링을 OCI Functions와 여러 OCI 서비스를 활용하여 구현할 수 있습니다.

### 사용하는 OCI 서비스 목록
* OCI Certificates Service
* OCI Functions
* OCI Logging
* OCI Email Delivery
* OCI Notification & Alarm
* OCI Valut

### 외부 공개 인증서를 OCI Certificates 서비스로 가져오기
우선 OCI Certificates 서비스에 외부 공개 인증서를 가져와야 합니다.  
이 과정은 아래 포스팅을 참고합니다. Let’s Encrypt 인증서를 OCI Certificates 서비스에 Import하는 과정에 대해서 자세히 설명하고 있습니다. 또한 인증서를 적용할 도메인을 OCI DNS Zone에서 관리하는 방법도 확인할 수 있습니다.  
[OCI Certificates - Let’s Encrypt로 생성한 인증서를 OCI 인증서 서비스에 Import 하기](https://the-team-oasis.github.io/infrastructure/oci-certificate-import-letsencrypt-cert/)

### 구성 방법
모든 작업은 OCI Cloud Shell에서 진행합니다. Cloud Shell은 OCI Console 오른쪽 위의 **Developer Tools**를 클릭한 후 **Cloud Shell**을 선택하면 사용할 수 있습니다.  
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-1.png" width="70%" height="50%">

#### Cloud Shell에서 Functions 설정
> OCI Functions에 대한 기본 내용은 아래 포스트를 참고합니다.  
[https://feellikeghandi.tistory.com/45](https://feellikeghandi.tistory.com/45)

우선 OCI Cloud Shell에서 OCI Functions를 사용하기 위한 구성이 필요합니다. Cloud Shell에는 기본적으로 OCI Functions 도구인 **fn**이 설치되어 있습니다. **fn list context** 명령어를 통해서 기본 Fn Context를 확인할 수 있습니다.

먼저 사용하기 위한 Context를 지정합니다.
```shell
fn use context <region-context>
```

아래는 서울 리전 예시입니다.
```shell
fn use context ap-seoul-1
```

Function을 생성하기 위한 구획을 지정합니다. `<compartment-ocid>` 부분을 구획의 OCID로 대체합니다.
```shell
fn update context oracle.compartment-id <compartment-ocid>
```

Function Image를 관리하기 위한 Container Repository를 생성할 구획을 지정합니다. `<compartment-ocid>` 부분을 구획의 OCID로 대체합니다.
```shell
fn update context oracle.image-compartment-id <compartment-ocid>
```

Function Image를 관리하기 위한 Container Repository를 지정합니다.
```shell
fn update context registry <region-key>.ocir.io/<tenancy-namespace>/<repo-name-prefix>
```

아래는 예시입니다. 
```shell
fn update context registry icn.ocir.io/axlpe*******/my-functions-repo
```

마지막으로 생성된 Context를 확인합니다.
```shell
donghu_kim@cloudshell:oci-certificate-expiry-monitor (ap-seoul-1)$ fn list context
CURRENT NAME            PROVIDER        API URL                                                 REGISTRY
*       ap-seoul-1      oracle-cs       https://functions.ap-seoul-1.oci.oraclecloud.com        icn.ocir.io/axlpe*******/my-functions-repo
        default         oracle-cs
```

#### Function 코드 다운로드 
Cloud Shell에서 사용할 Function 코드를 Clone 합니다.

```shell
donghu_kim@cloudshell:~ (ap-seoul-1)$ git clone https://github.com/scotti-fletcher/oci-certificate-expiry-monitor
Cloning into 'oci-certificate-expiry-monitor'...
remote: Enumerating objects: 11, done.
remote: Counting objects: 100% (11/11), done.
remote: Compressing objects: 100% (10/10), done.
remote: Total 11 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (11/11), done.
```

다운받은 Function은 이 글을 포스팅하는 현재(2024.12.08) 시점에서 FDK (Functions Development Kit)과 Ruby 버전 호환 이슈가 있습니다. 따라서 Gemfile과 func.yaml 파일을 다음과 같이 수정을 해야 합니다.  
***Gemfile***
```
source 'https://www.rubygems.org' do
  gem 'oci'
  gem 'fdk', '>= 0.0.72'
  gem 'pony'
end
```

***func.yaml***
```yaml
schema_version: 20180708
name: watchdog
version: 1.0.0
runtime: ruby
build_image: fnproject/ruby:3.1-dev
run_image: fnproject/ruby:3.1
entrypoint: ruby func.rb
memory: 1024
timeout: 300
```

#### Container Registry 접속
Function 코드는 Container 이미지로 빌드되어 OCI Container Registory에 생성한 Repository로 업로드 됩니다. 이를 위해서는 사전에 OCI Container Registry에 로그인 되어 있어야 합니다. (Private Registry인 경우 해당됨.) Cloud Shell에서 다음 명령어를 실행합니다. 아래 예시는 서울 리전의 Registry에 접속하는 예시입니다. Tenancy Namespace는 OCI Console의 오른쪽 위 **Profile**아이콘을 클릭한 후 Tenancy를 선택하면 확인할 수 있습니다. **Password**는 **Profile > 사용자 아이디**를 선택한 후 **Auth Token** 메뉴에서 생성할 수 있습니다.
```shell
docker login icn.ocir.io -u <tenancy_namespace>/<username>
Password: 
```

아래는 예시입니다.
```shell
donghu_kim@cloudshell:oci-certificate-expiry-monitor (ap-seoul-1)$ docker login icn.ocir.io -u axlpe*******/dan@aaa.com
Password: 
WARNING! Your password will be stored unencrypted in /home/dan_kim/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

#### Functions 애플리케이션 생성 및 Function 배포
Functions 애플리케이션을 생성합니다. OCI Console 메뉴에서 ***Developer Services > Functions > Applications*** 로 이동한 후 **Create application** 버튼을 클릭하고 다음과 같이 입력 및 선택합니다.
* **Name:** oci-certificate-monitor
* **VCN:** Functions 애플리케이션에서 사용할 VCN 선택
* **Subnets:** Functions 애플리케이션에서 사용할 Subnet 선택 (Private도 가능)
* **Shape:** GENERIC_X86

**Create** 버튼을 클릭하여 생성합니다.

Cloud Shell에서 다음 명령어로 생성된 Functions 애플리케이션을 확인할 수 있습니다.
```shell
donghu_kim@cloudshell:oci-certificate-expiry-monitor (ap-seoul-1)$ fn list apps
NAME                    ID
oci-certificate-monitor ocid1.fnapp.oc1.ap-seoul-1.aaaaaaaagycavzfp3jzaz5ldwzxyi2rlpe7hmssd42u6bea**************
```

이제 Function을 배포합니다. 다운로드 받은 **oci-certificate-expiry-monitor** 폴더로 들어가서 다음 명령어를 실행합니다.
```shell
fn deploy --app oci-certificate-monitor
```

아래는 예시입니다.
```shell
donghu_kim@cloudshell:oci-certificate-expiry-monitor (ap-seoul-1)$ fn deploy --app oci-certificate-monitor
Deploying watchdog to app: oci-certificate-monitor
Bumped to version 1.0.1
Using Container engine docker
Building image icn.ocir.io/axlpe*******/my-functions-repo/watchdog:1.0.1 TargetedPlatform:  amd64HostPlatform:  arm
...................................................................................................................................................................................................................................................................................................................................................................................................................................................................
Updating function watchdog using image icn.ocir.io/axlpe*******/my-functions-repo/watchdog:1.0.1...
Successfully created function: watchdog with icn.ocir.io/axlpe*******/my-functions-repo/watchdog:1.0.1
```

#### Function Logging 구성
배포한 Function은 인증서 만료 시 OCI Logging 서비스로 로그를 전달하는 기능을 포함하고 있습니다. 이 기능을 위해 먼저 Logging 서비스에서 Log Group과 Custom Log를 생성합니다.  
먼저 ***OCI Console 메뉴 > Observability & Management > Logging > Log Groups***를 차례로 클릭합니다. **Create Log Group** 버튼을 클릭한 후 **oci-certificate-expiry-monitor-logs**라는 이름으로 Log Group을 생성합니다.  
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-2.png" width="70%" height="70%">

이제 생성된 Log Group에서 라는 Custom Log를 생성합니다. 왼쪽 **Logs** 클릭한 후 **Create custom log**를 클릭한 후 **activity-log**라는 이름의 Log를 생성합니다.  
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-3.png" width="70%" height="70%">

**Add configuration later**를 선택한 후 **Create agent config** 버튼을 클릭하여 Log를 생성합니다.
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-4.png" width="70%" height="70%">

생성된 **activity-log**의 OCID는 Function 설정에서 필요하므로 기록해 놓습니다.
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-5.png" width="70%" height="70%">

#### OCI Valut 생성
이제 OCI Vault를 생성할 것입니다. 여기서는 Email Delivery 서비스를 사용하여 이메일을 전송하는데, 여기서 사용하는 SMTP Username과 Password를 OCI Valut에서 Secret으로 관리합니다. ***Console 메뉴 > Identity & Security > Key Management & Secret Management > Vault***로 이동한 후 **Create Vault**를 클릭합니다. 원하는 Valut 이름 (e.g. myvault)을 입력한 후 생성합니다. 이제 **Master Encryption Keys**를 생성해야 합니다. **Create Key**를 클릭한 후 다음과 같이 **Protection Mode**와 **Name**을 입력하고 키를 생성합니다. **Protection Mode**가 **Software**인 경우 가격은 **무료**입니다.
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-6.png" width="70%" height="70%">

**Secret** Email Delivery와 SMTP Credential을 생성한 후 생성할 것입니다.

#### Email Delivery 구성 및 SMTP Credential 생성, Valut Secret 등록
Function 코드에서는 OCI Email Delivery 서비스를 활용하여 다수의 수신자에게 Email을 발송합니다.  
Email Delivery 구성은 다음 포스트를 참고합니다.  
[OCI 전자메일 전송 서비스를 Java 코드를 통해 발송하기 (Javamail)](https://the-team-oasis.github.io/cloudnative/oci-sdk-emaildelivery-java/)

> 중요: Email Delivery 구성 시 꼭 Approved Senders(승인된 발송자)는 `certificatcher@이메일_도메인` 형태여야 합니다.

Email Delivery 구성이 완료되면 SMTP Credential 생성을 위해 OCI Console 오른쪽 위 **Profile** 아이콘을 클릭한 후 사용자 아이디를 클릭합니다. 왼쪽 **SMTP credentials**를 클릭한 후 **Generate credentials**을 클릭합니다. 다음과 같이 이름을 **Credentials for Email Delivery**로 입력한 후 **Username**과 **Password**를 복사하여 기록해 놓습니다. 이 값은 앞서 생성한 OCI Valut의 Secret으로 등록할 때 사용됩니다.
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-7.png" width="70%" height="70%">

이제 다시 앞에서 생성한 Valut로 이동한 후 왼쪽 **Secrets**과 **Create Secret**을 차례로 클릭하여 다음과 같이 두 개의 Secret을 등록합니다.  
**smtp-username**
* **Name:** smtp-username
* **Encryption Key:** 앞서 생성한 Master Encryption Key
* **Key Rotation:** Manual secret generation
* **Secret Type Template:** Plain-Text
* **Secret Contents:** 앞서 생성한 SMTP Credential의 Username

**smtp-password**
* **Name:** smtp-password
* **Encryption Key:** 앞서 생성한 Master Encryption Key
* **Key Rotation:** Manual secret generation
* **Secret Type Template:** Plain-Text
* **Secret Contents:** 앞서 생성한 SMTP Credential의 Password

#### Function Configuration에서 필요한 환경 변수 등록, Function Log 활성화
이제 Function 코드 내에서 사용하기 위한 환경 변수를 설정합니다. 앞서 생성한 Function Application으로 이동한 후 왼족 **Configuration**을 선택합니다. 다음과 같이 키와 값을 입력하고 추가합니다.
- OCI_TENANCY_OCID (값: Tenancy OCID)
- EXPIRY_CRITICAL_DAYS (값: 이메일 만료 전 **Critial** 이메일 및 로그로 받기 시작하고 싶은 날 (e.g. 100 (일)))
- EXPIRY_WARNING_DAYS (값: 이메일 만료 전 **Warning** 이메일 및 로그로 받기 시작하고 싶은 날 (e.g. 100 (일)))
- EMAIL_DOMAIN (값: Email Delivery에 설정한 도메인)
- SMTP_ENDPOINT (값: Email Delivery Configuration에서 확인 가능. (e.g. smtp.email.ap-seoul-1.oci.oraclecloud.com))
- OCI_LOG_OCID (값: 앞서 생성한 **activity-log**의 OCID)
- VAULT_OCID (값: 앞서 생성한 Valut의 OCID)
- OCI_SECRET_SMTP_USERNAME (값: 앞서 생성한 STMP Usernae Secret 명 (e.g. smtp-username))
- OCI_SECRET_SMTP_PASSWORD (값: 앞서 생성한 STMP Password Secret 명 (e.g. smtp-password))
- CERTIFICATE_ADMIN_EMAILS (값: 수신자 이메일 주소 (e.g. ociadmin@gmail.com, ocisecadmin@gmail.com))
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-8.png" width="70%" height="70%">

이제 앞서 생성한 Function Log(**activity-log**)를 활성화 합니다. 왼쪽 **Logs**를 클릭한 후 **Function Invocation Logs**를 아래와 같이 선택한 후 **Enable**합니다.  
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-9.png" width="70%" height="70%">

#### Function을 위한 Dynamic Group과 Policy 생성
Function을 위한 Dynamic Group을 생성합니다. 이 그룹은 특정 구획에 있는 Functions가 접근할 수 있는 리소스를 정책으로 정의하기 위해 사용됩니다. ***Identity & Security > Domains > 도메인 선택 > Dynamic groups***으로 이동해서 **Create dynamic group**을 클릭하고 아래 그림과 같이 Dynamic Group을 생성합니다. **resource.compartment.id** 값은 앞서 Function을 생성한 구획의 OCID입니다.

```
ALL {resource.type = 'fnfunc', resource.compartment.id = 'ocid1.compartment.oc1....'}
```

<img src = "https://redthunder.blog/wp-content/uploads/2023/06/image-21.png" width="50%" height="50%">

이제 마지막으로 다음과 같이 Policy를 생성합니다.***Identity & Security > Policies**로 이동하여 **OCI_Certificate_Expiry**라는 이름의 Policy를 생성합니다. Policy 구문은 다음과 같습니다.
```
allow dynamic-group certificate-expiry-monitor-dg to manage in compartment 구획명
```

만일 Function에서 접근 가능한 리소스를 구체적으로 다음과 같이 지정할 수도 있습니다. Secret은 두 개 (smtp-username, smtp-password)이므로 콤마(,)로 구분해서 입력할 수 있습니다.
```
allow dynamic-group certificate-expiry-monitor-dg to use log-content in tenancy where target.loggroup.id = ”
allow dynamic-group certificate-expiry-monitor-dg to {TENANCY_INSPECT} in tenancy
allow dynamic-group certificate-expiry-monitor-dg to read leaf-certificate-bundles in tenancy
allow dynamic-group certificate-expiry-monitor-dg to use secret-family in tenancy where target.secret.id in (”,”)
```

### Function 호출 및 결과 확인
이제 직접 이 Function을 호출해 보도록 하겠습니다. **Cloud Shell**에서 다음과 같이 실행합니다.
```
fn invoke oci-certificate-monitor watchdog

"Certificatcher watchdog checks completed 2024-12-09 16:27"
```

수신한 이메일입니다. **back2store**라는 인증서가 15일 이내에 만료될 예정이라는 Critical Email이 수신된 것을 확인할 수 있습니다.  
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-10.png" width="70%" height="70%">

Logging에서도 모니터링 되는 것을 확인할 수 있습니다.
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-11.png" width="70%" height="70%">

### OCI Notification과 Alarm을 활용하여 Function Scheduler 구현하기
앞서 Function을 Manual하게 호출하였습니다. 이번에는 OCI Notification과 Alarm을 활용하여 하루 한번씩 호출되도록 구현해 보겠습니다. 먼저 ***Console 메뉴 > Developer Services > Application Integration > Notifications***로 이동한 후 **Create Topic**을 클릭합니다. 다음과 같이 Topic을 생성합니다.
* **Name:** oci-certificate-expiry-cron

이제 생성한 Topic을 클릭한 후 **Create Subscription**을 클릭하고 다음과 같이 입력/선택 합니다.
* **Protocol:** Function
* **Function compartment:** Function을 생성한 구획
* **Oracle Functions application:** oci-certificate-monitor
* **Function:** watchdog

<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-12.png" width="70%" height="70%">

이제 Alarm을 생성합니다. ***Console 메뉴 > Observability & Management > Monitoring > Alarm Definitions***로 이동한 후 **Create Alarm**을 클릭하고 다음과 같이 설정하고 생성합니다.
* **Alarm name:** oci-certificate-expiry-cron

그리고 Alarm Metric은 항상 Alarm이 발생할 수 있도록 설정합니다. 물론 아래 부분에 실제 Alarm Notification이 발송되는 주기(e.g. 24시간)를 설정하므로, 실제 Alarm에 의한 Notification은 설정된 주기에 맞춰 발송됩니다. 여기서는 일반적으로 Compute 인스턴스가 하나 이상 운영되고 있다는 가정하에 Compute Metric을 이용해서 항상 Alarm이 발생하도록 Metric을 구성합니다.
* **Metric namespace:** oci_computeagent
* **Metric name:** CpuUtilization
* **Interval:** 1 minute
* **Static:** Count

<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-13.png" width="70%" height="70%">

Trigger Rule은 다음과 같이 설정합니다.
* **Operator:** greater than
* **Value:** 0
* **Trigger delay minutes:** 1
* **Alarm severity:** Info

<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-14.png" width="70%" height="70%">

이제 Alarm notification을 다음과 같이 설정합니다.
* **Destination service:** Notification
* **Topic:** oci-certificate-expiry-cron

<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-15.png" width="70%" height="70%">

마지막으로 **Message grouping**, **Message Format**, **Repeat notification**을 다음과 같이 설정하고 **Save alarm**을 클릭합니다.
* **Message grouping:** Group notifications across metric streams
* **Message Format:** Send formatted messages
* **Repeat notification? (if alarm continues to fire):** Check
  * **Notification frequency:** 24 hours

<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-16.png" width="70%" height="70%">

**Alarm Status** 대시보드에서 한 건의 **Informational alarm**이 발생한 것을 확인할 수 있습니다.

<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-17.png" width="70%" height="70%">

정상적으로 인증서 만료 경고 이메일이 발송되고 수신된 것을 확인할 수 있습니다.
<img src = "/assets/img/infrastructure/2024/oci-certificate-expiry-monitoring-18.png" width="70%" height="70%">