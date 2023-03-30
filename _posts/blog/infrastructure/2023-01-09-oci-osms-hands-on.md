---
layout: page-fullwidth
#
# Content
#
subheadline: "Compute"
title: "Compute의 OS Management service 서비스 이용하기"
teaser: "Compute의 OS Management service 설정하는 방법을 설명합니다."
author: kskim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, Compute, OSMS]
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

아래 내용에 대해서 설정 화면 가이드이며, 내용에 대해서 수정이 필요한 부분은 일부 업데이트하여 수정 할 수 있도록 하겠습니다.
#### 전제조건
1. 최상위 구획 하위에 OSMS 구획(Compartmets) 생성
2. 다이나믹(Dynamic Groups) 그룹 생성
   다이나믹 그룹에 OSMS 구획 OCID 설정
```text
    instance.compartment.id = 'ocid1.compartment.oc1..aaaaaaaawdpz2mexvtmooizu57ocqx3v45hwonpfnty7owkvkvsil7lriopq'
```
3. 최상위 root에 정책 설정
```text
    Allow service osms to read instances in tenancy
    Allow dynamic-group osms to read instance-family in tenancy
    Allow dynamic-group osms to use osms-managed-instances in tenancy
```
4. OSMS 구획(Compartmets) compute 생성

##### 사용자 그룹의 경우, Administrators를 기준으로 사용하였습니다.

#### OSMS (OS Management service) 란?

![](/assets/img/infrastructure/2023/osms/SCR-20230109-iah.png)
OSMS는 OS Management service 서비스로 OS 관련 보안패치 , 설치된 패키지 업데이트 삭제 및 추가를 OCI WebConsole로 관리 할 수 있는 서비스입니다.

지원되는 OS는 아래와 같습니다.
- Oracle Linux 6 and later
- Oracle Linux 7 and later
- Oracle Linux 8 and later
- Oracle Linux 9 and later
- Oracle Autonomous Linux
- Windows Server 2012 R2 Standard, Datacenter
- Windows Server 2016 Standard, Datacenter
- Windows Server 2019 Standard, Datacenter

주의사항 : Free tier의 경우, 해당 서비스를 지원하지 않습니다. Public Subnet의 경우 Internet gateway 설정이 되어야하며, Private Subnet의 경우 OCI 서비스 게이트웨이에 연결되어 있어야합니다.

#### Dynamic Groups 생성하기
리소스에 대한 접근을 하기 위한 Dynamic Groups 생성합니다.
아래 그림은 OSMS 다이나믹 그룹을 생성하여, Compartment id를 입력하여 생성한 결과입니다. 

![](/assets/img/infrastructure/2023/osms/SCR-20230109-ih7.png)


아래 compartment.id의 경우, OSMS 그룹(Compartments) 만들어진 OCID 값입니다.

```text
  instance.compartment.id = 'ocid1.compartment.oc1..aaaaaaaawdpz2mexvtmooizu57ocqx3v45hwonpfnty7owkvkvsil7lriopq'	
```

#### Policy 생성하기
OSMS 관련해서 사용하기 위한 Policy 정책을 넣어줍니다. 
 

![](/assets/img/infrastructure/2023/osms/SCR-20230109-im0.png)

```text
Allow service osms to read instances in tenancy
Allow dynamic-group osms to read instance-family in tenancy	
Allow dynamic-group osms to use osms-managed-instances in tenancy	
```


#### Compute 설정하기
OSMS에 정상적인 실행 및 로그 확인을 위해서 Compute Terminal 접속합니다.

![](/assets/img/infrastructure/2023/osms/SCR-20230109-iwg.png)


오라클 리눅스8의 경우 아래 명령어를 통해서 설정이 필요합니다.
```shell
sudo sed -i.saved -e '/^  osms:/,/^  [a-z]*:/{
s/\(.*disabled:.*\)true/\1false/
/^.*disableByOs:$/,/^  [a-z]*:/{
/^.*-.*Oracle Linux Server.*:$/d
/^.*-.*8.x/d}}' /etc/oracle-cloud-agent/agent.yml
```

아래 위치에 해당되는 yml 파일의 OSMS 설정을 확인합니다. 
```shell
sudo vim /etc/oracle-cloud-agent/agent.yml

 osms:
    disabled: false
    disableByOs:
      - "CentOS Linux":
    disableByRealm:
      - "oc7"
    exec: "/usr/libexec/oracle-cloud-agent/plugins/osms/osms-agent"
    elevated: true
    args: []
```

Agent 확인
```terminal
ps -elf | grep osms | grep -v grep
4 S root        2234    2012  0  80   0 - 36878 -      04:48 ?        00:00:00 /usr/bin/sudo -n /usr/libexec/oracle-cloud-agent/plugins/osms/osms-agent
4 S root        2328    2234  0  80   0 - 311408 -     04:48 ?        00:00:04 /usr/libexec/oracle-cloud-agent/plugins/osms/osms-agent
4 S root        2661    2328  0  80   0 - 309777 -     04:48 ?        00:00:00 /usr/libexec/oracle-cloud-agent/plugins/osmsv2/osmsv2 -plugin=false
```

Agent 재시작
```terminal
sudo systemctl restart oracle-cloud-agent.service
```

OSMS Agent의 로그를 아래 위치를 통해서 확인이 가능합니다.(/var/log/oracle-cloud-agent/plugins/osms/agent.log) , 로그 상에서 OSMS 관련 로그가 확인 되어야합니다.
(OSMS check completed successfully. Next check in 120 seconds.)
```terminal
tail -200f /var/log/oracle-cloud-agent/plugins/osms/agent.log

2023-01-09 03:39:26,249 - INFO - gRPC Start: OSMS Agent service started
2023-01-09 03:39:29,851 - INFO - OSMS check completed successfully. Next check in 120 seconds.
2023-01-09 03:39:30,403 - INFO - Called action 'activate' with opc-request-id: /EC67DD85DD87873CF18B8111B40D80C9/814DDE6FC96F20DC732AA1E460E84C6A; response-headers: {'Date': 'Mon, 09 Jan 2023 03:39:30 GMT', 'opc-request-id': '/EC67DD85DD87873CF18B8111B40D80C9/814DDE6FC96F20DC732AA1E460E84C6A', 'Content-Type': 'application/json', 'Content-Length': '111'}; status: 404; took: 0.504s
2023-01-09 03:39:30,405 - ERROR - Failed to call action 'activate' POST https://cp.appmgmt.ap-tokyo-1.oci.oraclecloud.com/20210330/monitoredInstances/ocid1.instance.oc1.ap-tokyo-1.anxhiljrgfm2vwqckygapczc25vc6xgwrveeldwm3a2v4lyck3bq4ou5sprq/actions/activateMonitoringPlugin, status: 404
2023-01-09 03:41:33,959 - INFO - OSMS check completed successfully. Next check in 120 seconds.
2023-01-09 03:43:36,607 - INFO - OSMS check completed successfully. Next check in 120 seconds.
2023-01-09 03:43:36,947 - INFO - Called action 'activate' with opc-request-id: /8C7747F3F38390C37D1CBDAD33F86EB1/24F58837715F8350CBBBCFA3F412E2E0; response-headers: {'Date': 'Mon, 09 Jan 2023 03:43:36 GMT', 'opc-request-id': '/8C7747F3F38390C37D1CBDAD33F86EB1/24F58837715F8350CBBBCFA3F412E2E0', 'Content-Type': 'application/json', 'Content-Length': '111'}; status: 404; took: 0.30s
2023-01-09 03:43:36,948 - ERROR - Failed to call action 'activate' POST https://cp.appmgmt.ap-tokyo-1.oci.oraclecloud.com/20210330/monitoredInstances/ocid1.instance.oc1.ap-tokyo-1.anxhiljrgfm2vwqckygapczc25vc6xgwrveeldwm3a2v4lyck3bq4ou5sprq/actions/activateMonitoringPlugin, status: 404
2023-01-09 03:45:41,418 - INFO - OSMS check completed successfully. Next check in 120 seconds.
2023-01-09 03:47:44,788 - INFO - OSMS check completed successfully. Next check in 120 seconds.
2023-01-09 03:49:48,269 - INFO - OSMS check completed successfully. Next check in 120 seconds.
2023-01-09 03:51:51,432 - INFO - OSMS check completed successfully. Next check in 120 seconds.
```



#### OSMS 상세 정보 확인 및 설정

Compute의 상세 페이지의 OS Managemnet의 상세 내용을 보면 아래와 같이 보안, 버그, 패치등에 대해서 화면에 노출됩니다. 
상세 페이지 클릭시 OSMS 관련된 보안 패치 등이 보여집니다.
![](/assets/img/infrastructure/2023/osms/SCR-20230109-ja4.png)

Compute의 OS 필요한 상세 내용 화면이 보여집니다.
![](/assets/img/infrastructure/2023/osms/SCR-20230109-jbw.png)

필요한 업데이트건을 설치시 아래와 같이 작업이 진행이 되며, 완료됩니다. (업데이트시, CPU, 메모리의 리소스를 사용합니다.)
업데이트시, 운영 시간이외에 패치 및 업데이트를 권장합니다. (업데이트에 따른 CPU, 메모리 부하가 생깁니다.) , 해당 부분 Work Requests에 해당 작업 관련해서 작업 진행 결과가 보여집니다.
![](/assets/img/infrastructure/2023/osms/SCR-20230109-l3i.png)

완료 후 상태값에 진행된 이후 해당 부분 종료됩니다. 
![](/assets/img/infrastructure/2023/osms/SCR-20230109-l3p.png)



#### Troubleshooting OS Management
https://docs.oracle.com/en-us/iaas/os-management/osms/osms-troubleshooting-availability.htm



