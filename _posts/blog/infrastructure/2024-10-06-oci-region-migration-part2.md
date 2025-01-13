---
layout: page-fullwidth
#
# Content
#
subheadline: "Migration"
title: "2세대 Shape 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하기 Part2: WebLogic for OCI"
teaser: "2세대 Shape WebLogic for OCI 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하는 방법을 설명합니다."
author: "dankim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, compute, migration]
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
이 전 포스팅에서는 구세대 Shape의 일반 VM 인스턴스를 다른 리전에 최신 세대 Shape의 인스턴스로 마이그레이션 하는 방법을 살펴 보았습니다.

[2세대 Shape 인스턴스(구세대)를 다른 리전에 3세대 Shape 인스턴스로 마이그레이션하기 Part1: Compute Instance](https://the-team-oasis.github.io/infrastructure/oci-region-migration-part1/)

일반 VM 인스턴스는 Custom Image로 마이그레이션을 수행할 수 있지만, 구세대 Shape 기반의 WebLogic for OCI를 최신 Shape으로 마이그레이션하는 경우 다음과 같은 이슈가 있습니다.
* Oracle에서 제공하는 Marketplace 이미지는 특정 라이선스 또는 구성이 포함되어 있기 때문에, 이를 그대로 다른 환경에 Custom Image를 통해 내보내는 데 제약이 있을 수 있음
* 구세대 기반 WebLogic for OCI와 최신 WebLogic for OCI의 블록 볼륨 구성이 달라서, Custom Image + Block Volume Repliation 마이그레이션 방식은 추천하지 않음

이번 포스팅에서는 구세대 Shape에 구성된 WebLogic for OCI 인스턴스를 다른 리전에 최신 세대 Shape으로 마이그레이션 하는 방법을 설명합니다. 

### 시나리오
서울 리전에 있는 2세대 Shape을 가지는 WebLogic for OCI 인스턴스 (Oracle Linux 7.7)를 춘천 리전으로 이전하되, 3세대 Shape을 가지는 WebLogic for OCI 인스턴스로 마이그레이션 합니다. 마이그레이션 방식은 Pack/Unpack 도구를 활용합니다.

#### 서울 리전 (소스 리전)
* Shape: VM.Standard2.1
* OS: Oracle Linux 7.x
* WebLogic EE version: 12.2.1.3

#### 춘천 리전 (대상 리전)
* Shape: VM.Standard3.Flex
* OS: Oracle Linux 8.x
* WebLogic EE version: 12.2.1.3

<img src = "/assets/img/infrastructure/2024/oci-region-migration-part2-1.png" width="50%" height="50%">

### 마이그레이션 실행
#### 1. 서울 리전 준비 (소스)
구세대 Shape 기반의 WebLogic for OCI는 테라폼 0.1 버전으로 작성되어 있으며, 일반적으로 12.2.1.3 버전을 사용하며, 하나의 블록 볼륨으로만 구성됩니다. (현재는 2개(mw, data)) 해당 테라폼 구성은 현재 구할수가 없어서(구하더라도 현재 OCI Resource Manager에서는 테라폼 0.1은 지원하지 않아 실행 불가능), 현재 마켓 플레이스에서 제공되는 테라폼 스택에 12.2.1.3 설치가 되도록 수정한 버전을 사용하도록 합니다.

[WebLogic_EE_12.2.1.3_UCM_Stack.zip](/assets/files/infrastructure/2024/WebLogic_EE_12.2.1.3_UCM_Stack.zip)

1.1. 위 테라폼 구성 파일을 다운로드 받습니다.  
1.2. ***메뉴 > Developer Serices > Resource Manager > Stacks*** 선택 후 **Create Stack**을 클릭합니다. Stack Configuration에서 **.Zip** 파일을 선택한 후 위에서 다운로드 받은 **WebLogic_EE_12.2.1.3_UCM_Stack.zip** 파일을 업로드 한 후 **Next**를 선택합니다.  
1.3. **Stack Configuration** 구성에서 다음과 같이 구성합니다.
  * **Resource Name Prefix:** 모든 리소스명 앞에 붙게됩니다. (e.g. wls12)
  * **SSH Public Key:** 인스턴스에 접속할 때 사용할 SSH 키
  * **OCI Policies:** WebLogic for OCI 관련 리소스 생성을 위해 필요한 Policy를 자동으로 생성 (생성되어 있다면 선택하지 않습니다.)
  * **Use Resource Manager Private Endpoint:** Resource Manager Private Endpoint를 통해서 Private Subnet에 있는 리소스 상태를 체크합니다. 선택합니다.
  * **Provision Load Balancer:** 자동으로 로드발란서를 추가합니다. 여기서는 선택하지 않습니다.  

1.4. **Virtual Cloud Networking** 구성에서 다음과 같이 구성합니다.  
  * **Existing Network:** 구성할 VCN을 선택합니다.
  * **Subnet Type:** Subent 유형을 Private과 Public중에서 선택합니다. 편의상 Public으로 진행합니다.  

1.5. **WebLogic Domain Configuration** 구성에서 다음과 같이 구성합니다.  
* **Validated Secret for WebLogic Server Admin Password:** OCI Valut에 생성한 Secret을 선택 (별도 생성해야함)
* **Deploy Sample Application:** 샘플 애플리케이션 배포  

1.6. **WebLogic Server Compute Instance** 구성에서 다음과 같이 구성합니다. 
* **Compute Shape:** 구세대 Shape인 VM.Standard2.1을 선택합니다.
* **Node Count:** 1  

1.7. **Resource Manager Private Endpoint** 구성에서 다음과 같이 구성합니다.
* **Create or Use Existing Resource Manager Endpoint:** Create New Resource Manager Endpoint

1.8. Next를 클릭한 후 스택을 생성합니다.  
1.9. 생성된 스택에서 **Apply**를 클릭하여 WebLogic for OCI 리소스들을 생성합니다.  
1.10. Job 실행이 성공한 것을 확인합니다.  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part2-2.png" width="50%" height="50%">

1.11. WebLogic Console과 Sample Application이 정상적으로 실행되는지 확인합니다. 접속 정보는 Job 실행 로그에서 확인 가능합니다.

#### 2. 춘천 리전 준비 (대상)
춘천 리전도 서울 리전과 동일하게 Stack을 생성합니다. 단, **Compute Shape**은 최신 Shape인 **Standard3.Flex**를 선택합니다. 생성된 Stack을 사용하여 WebLogic for OCI 리소스를 춘천 리전에도 동일하게 생성합니다.

#### 3. 도메인 템플릿 생성을 위한 WebLogic Pack 수행 (서울 리전)
두 리전에 서로 다른 Shape을 가지는 WebLogic 인스턴스가 준비되었습니다. 이제 서울 리전(소스)에 접속하여 Pack 도구를 활용하여 도메인 템플릿을 생성합니다.

서울 리전 WebLogic Admin 인스턴스에 접속한 후 oracle 사용자로 전환합니다
```
$ sudo su - oracle
```

모든 인스턴스와 Node Manager를 중지합니다.
```
$ /opt/scripts/restart_domain.sh -o stop
```

Pack을 이용하여 도메인 템플릿을 생성합니다. 템플릿 파일명은 mydomain_template.jar 템플릿명은 MyDomainTemplate이라 지정하겠습니다.

```
$ cd /u01/app/oracle/middleware/oracle_common/common/bin

$ ./pack.sh -domain=$DOMAIN_HOME -template=/home/oracle/mydomain_template.jar -template_name=MyDomainTemplate
..................................................
>>  succeed: write template to "/home/oracle/mydomain_template.jar"
<< close template
>>  succeed: close template
```

생성된 템플릿을 확인합니다.
```
$ cd /home/oracle
$ ls
mydomain_template.jar
```

#### 4. 도메인 템플릿을 춘천 리전(대상) WebLogic 인스턴스로 전송
춘천 리전에 있는 WebLogic Admin 인스턴스에 접속한 후 Oracle 사용자의 Private 키를 복사합니다.
```
$ sudo su - oracle
$ cat ~/.ssh/id_rsa
```

다시 서울 리전 WebLogic 인스턴스에 춘천 리전에서 복사한 Oracle 사용자의 Private 키를 붙여넣기 하여 id_rsa_target 키를 생성합니다.
```
$ vi /home/oracle/.ssh/id_rsa_target
```

키의 퍼미션을 변경합니다.
```
$ chmod 400 /home/oracle/.ssh/id_rsa_target
```

서울 리전의 도메인 템플릿을 춘천 리전의 WebLogic 인스턴스로 전송합니다.
```
$ scp -i ~/.ssh/id_rsa_target mydomain_template.jar oracle@{춘천리전_웹로직_인스턴스_IP}:/home/oracle
```

#### 5. 도메인 템플릿에 대한 Unpack 수행 (춘천 리전)
Unpack을 위해서는 Wallet을 먼저 생성하여야 합니다. 우선 춘천 리전 WebLogic 인스턴스에 접속한 후 모든 서버 인스턴스를 중지합니다.

```
$ sudo su - oracle
$ /opt/scripts/restart_domain.sh -o stop
```

Wallet을 생성합니다.
```
$ mkdir /home/oracle/wallet

$ cd /u01/app/oracle/middleware/oracle_common/common/bin

$ ./configWallet.sh -walletDir /home/oracle/wallet -create admin_name weblogic
admin_name: weblogic
Confirm admin_name: weblogic
weblogic: welcome1
Confirm weblogic: welcome1
```

이제 기존 도메인을 백업한 후 Unpack을 수행합니다.
```
mv /u01/data/domains/wls12_domain /u01/data/domains/wls12_domain_bak

./unpack.sh -template=/home/oracle/mydomain_template.jar -domain=/u01/data/domains/wls12_domain -user_name=weblogic -walletDir=/home/oracle/wallet
..................................................
>>  succeed: write Domain to "/u01/data/domains/wls12_domain"
<< close template
>>  succeed: close template
```

#### 6. /etc/hosts에 서울 리전 Host및 FQDN 추가 (춘천 리전)
춘천 리전(대상)으로 도메인 템플릿을 Unpack하였으므로, 모든 구성은 서울 리전(소스)의 Host와 FQDN으로 되어 있습니다. config.xml을 포함한 구성 파일들을 찾아서 춘천 리전의 Host와 FQDN으로 변경하여도 되지만, 간단히 춘천 리전의 Host에 서울 리전의 Host와 FQDN을 추가하면 간단히 해결됩니다.

아래는 예시 입니다. 두 서버 모두 WebLogic 생성 시 동일한 Prefix를 사용하였으므로, Host명은 같습니다. 서울 리전의 FQDN (wls12-wls-0.sub03220956020.myvcn.oraclevcn.com)만 추가합니다.
```
sudo vi /etc/hosts
[/etc/hosts]
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
10.0.0.206 wls12-wls-0 wls12-wls-0.sub09301028330.myvcn.oraclevcn.com wls12-wls-0.sub03220956020.myvcn.oraclevcn.com
```

#### 7. JDBC 구성 변경 (춘천 리전)
JDBC도 춘천 리전(대상)에 맞게 변경이 필요 합니다. 이를 위해서 Oracle에서 제공하는 스크립트를 활용하여 쉽게 일괄적으로 변경할 수 있습니다.

먼저 스크립트를 다운로드 받은 후 압축해제 및 실행할 수 있도록 퍼미션을 변경합니다.
```
$ wget https://github.com/oracle-samples/maa/raw/refs/heads/main/wls_mp_dr/Block_Volume_Replica_Method/replacement_script_BVmodel.zip

$ unzip eplacement_script_BVmodel.zip
$ cd replacement_script_BVmodel
$ chmod 700 replacement_script_BVmodel.sh
```

replacement_script_BVmodel.sh 파일에서 수정할 부분은 다음 부분입니다. 
* LOCAL_PDB_SERVICE: 춘천 리전(대상)에서 사용하는 DB의 서비스명
* REMOTE_PDB_SERVICE: 서울 리전(소스)에서 사용하는 DB의 서비스명
* LOCAL_DB_SCAN_NAME: 춘천 리전(대상) DB의 SCAN_NAME (DB System 상세 화면에서 확인 가능)
* REMOTE_DB_SCAN_NAME: 서울 리전(대상) DB의 SCAN_NAME (DB System 상세 화면에서 확인 가능)

이제 해당 스크립트를 실행합니다.
```
$ ./replacement_script_BVmodel.sh
```

실행이 정상적으로 완료되면, 모든 JDBC 구성 파일의 내용이 변경되었는지 확인합니다.

#### 8. Node Manager boot.properties 생성 (춘천 리전)
WebLogic for OCI에서 제공하는 WebLogic 제어 스크립트(restart_domain.sh)는 Node Manager를 활용합니다. Node Manager 실행을 위해서는 boot.properties를 생성하여야 합니다.

```
sudo su - oracle
mkdir -p /u01/data/domains/wls12_domain/servers/wls12_adminserver/data/nodemanager
vi /u01/data/domains/wls12_domain/servers/wls12_adminserver/data/nodemanager/boot.properties
username=weblogic
password=welcome1
```

### 9. WebLogic 서버 인스턴스 시작 및 확인 (춘천 리전)
아래 명령어를 실행하여 WebLogic 서버 인스턴스를 가동합니다.
```
$ /opt/scripts/restart_domain.sh -o start
```

**https://{춘천리전 WebLogic Admin IP}:7002/console**  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part2-3.png" width="50%" height="50%">

**https://{춘천리전 WebLogic Managed Server IP}:7004/sample-app**  
<img src = "/assets/img/infrastructure/2024/oci-region-migration-part2-4.png" width="50%" height="50%">