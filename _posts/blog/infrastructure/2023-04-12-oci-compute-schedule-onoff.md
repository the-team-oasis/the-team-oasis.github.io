---
layout: page-fullwidth
#
# Content
#
subheadline: "Compute"
title: "OCI CLI를 이용하여 특정 구획의 Compute Instance 정지/시작 스케쥴링 하기"
teaser: "OCI CLI를 이용하여 특정 구획의 Compute Instance를 스케쥴링하여 정지/시작 하는 방법에 대해 알아봅니다."
author: yhcho
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, infrastructure, compute, crontab, autostop, autostart, schedule]
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

### OCI CLI를 이용하여 특정 구획 하위의 Compute Instance 시작/중지 스케쥴링 하기
클라우드에서 비용을 효율적으로 사용하기 위해서 원하는 시간에만 Compute Instance를 사용할 수 있습니다. 
하지만 만약에 Compute Instance의 개수가 많다면 매번 원하는 시간에 수작업으로 중지/시작 하기는 너무 번거롭기 때문에 이번 포스팅에서는 간단한 스크립트+크론탭을 활용하여 특정 구획의 인스턴스를 중지/시작하는 방법에 대해 소개해드리고자 합니다.

### 진행 순서
1. API/CLI을 통해 특정 구획의 인스턴스를 중지/시작할 그룹(Group) 및 사용자(User) 생성
2. 특정 구획의 인스턴스만 중지/시작 할 수 있는 정책 작성하기
3. VM의 OCI CLI 설정 확인하기 (최저 사양으로 구성하길 권장드립니다)
4. 작업 대상 구획의 OCID 확인하기
5. 스크립트 파일 다운로드 및 실행해보기
6. 크론탭 파일에 스케쥴 작성하기
7. 크론탭 로그 확인하기

### 실습 진행

#### 1. API/CLI을 통해 특정 구획의 인스턴스를 중지/시작할 그룹(Group) 및 사용자(User) 생성
> 이번 포스팅 에서는 Identiy Domain이 적용된 Cloud Account 계정을 기준으로 작성되었습니다.

OCI CLI를 통해 작업하기 위해 API Key를 등록해야 합니다. API나 CLI를 사용하시는 경우 실제 사용하는 용도에 맞는 권한만 부여할 수 있게 별도로 그룹/사용자를 생성하여 관리하는것이 좋습니다.
이번 실습에서도 특정 구획의 Compute Instance만 중지/시작할 수 있는 권한만 별도로 관리하기 위해 그룹(Group)을 생성하여 관리할 예정입니다.

1. 전체메뉴에서 "ID & 보안" > "ID" > "도메인(Domain)" 메뉴를 클릭합니다.
   ![](/assets/img/infrastructure/2023/compute-onoff/compute-onoff-1.png)
2. 그룹을 생성할 도메인을 클릭합니다. 기본 도메인만 존재하는 경우 "Default"를 클릭합니다. (도메인이 보이지 않는 경우 좌측 하단의 구획이 선택되었는지 확인해야 합니다.)
   ![](/assets/img/infrastructure/2023/compute-onoff/compute-onoff-2.png)
3. 우측 서비스 메뉴에서 "그룹"을 클릭하고 "그룹 생성" 버튼을 클릭한 다음 아래와 같이 입력하여 그룹을 생성합니다.
    - 이름 : compute-onoff
    - 설명 : 특정구획의 Compute를 중지/시작할 수 있는 사용자의 그룹
    - "생성" 버튼 클릭
   ![](/assets/img/infrastructure/2023/compute-onoff/compute-onoff-3.png)
4. 우측 서비스 메뉴에서 "사용자"를 클릭하고 "사용자 생성" 버튼을 클릭한 다음 아래와 같이 입력하여 사용자를 생성합니다.
    - 성 : compute-onoff
    - "전자메일 주소를 사용자 이름으로 사용" 옵션 비활성화
    - 사용자 이름 : compute-onoff
    - 전자메일 : 개인 이메일주소 입력
    - 하단 그룹에서 "compute-onoff" 그룹을 선택하여 활성화 합니다.
    - "생성" 버튼 클릭
   ![](/assets/img/infrastructure/2023/compute-onoff/compute-onoff-4.png)

#### 2. 특정 구획의 인스턴스만 중지/시작 할 수 있는 정책 작성하기
1. 전체메뉴에서 "ID & 보안" > "ID" > "정책(Policy)" 메뉴를 클릭합니다.
   ![](/assets/img/infrastructure/2023/compute-onoff/compute-onoff-5.png)
2. 정책을 생성할 구획을 선택합니다. (실제 컴퓨트를 중지/시작할 구획에 생성하시면 됩니다.)
3. "정책 생성" 버튼을 클릭하여 아래와 같이 입력하여 정책을 생성합니다.
  ```text
  Allow group compute-onoff to use instances in compartment [구획이름]
  ```

   ![](/assets/img/infrastructure/2023/compute-onoff/compute-onoff-6.png)
#### 3. VM의 OCI CLI 설정 확인하기 (최저 사양으로 구성하길 권장드립니다)
이번 실습에서는 특정 구획 하위에 존재하는 모든 컴퓨트 인스턴스를 중지/시작하기 때문에 가급적이면 작업하고자 하는 구획이 아닌 다른 구획을 생성하여 관리하는 것을 권장합니다.
하지만 부득이 동일한 구획에 생성하시는 경우 컴퓨트 인스턴스의 이름을 "compute-onoff"로 지정하여 생성할 경우 해당 인스턴스는 스킵됩니다.

- 이번 포스팅에서는 OCI CLI 설정에 대한 내용은 자세히 다루지 않습니다. 만약 OCI CLI 설정이 안되어있다면 [Oracle Linux 이나 CentOS 에서 OCI CLI 도구 설치 및 설정하기](/getting-started/oracle-linux-ocicli-config/){:target="_blank" rel="noopener"} 포스팅을 통해 먼저 설정해야 합니다.
- 이번 포스팅에서는 인스턴스 생성에 대한 내용을 자세히 다루지 않습니다. 인스턴스 생성은 [OCI에서 리눅스 인스턴스 생성 튜토리얼](/getting-started/launching-linux-instance/){:target="_blank" rel="noopener"} 포스팅을 통해 먼저 생성해야 합니다.
- 인스턴스는 최저 사양으로 구성하시면 됩니다. (1 ocpu / 1GB memory)

#### 4. 작업 대상 구획의 OCID 확인하기
1. 전체메뉴에서 "ID & 보안" > "ID" > "구획(Compartment)" 메뉴를 클릭합니다.
   ![](/assets/img/infrastructure/2023/compute-onoff/compute-onoff-7.png)
2. 작업을 원하는 구획을 클릭하여 세부정보 화면에서 구획의 OCID를 복사하여 저장합니다.
   ![](/assets/img/infrastructure/2023/compute-onoff/compute-onoff-8.png)

#### 5. 스크립트 파일 다운로드 및 실행해보기

스크립트 파일을 실행하기 위해서는 2가지 파라미터가 필요합니다.
- action : STOP / START 중 입력, 그 외의 값이 입력되면 오류 발생
- compartmentId : 작업할 대상 구획의 OCID를 입력합니다.
- 명령어 예시
  ```shell
  ./compute-onoff.sh STOP ocid1.compartment.oc1..~~~~~~~~~~
  ```

스크립트 파일의 내용은 다음과 같습니다. 파일 다운로드는 [다운로드](/assets/files/infrastructure/2023/compute-onoff.sh){:target="_blank" rel="noopener"}를 클릭하여 다운로드할 수 있습니다.
VM에서 다운로드 하기 위해서는 아래 명령어를 입력하여 다운로드 가능합니다.
  ```shell
wget https://the-team-oasis.github.io/assets/files/infrastructure/2023/compute-onoff.sh
  ```

  ```shell
#!/bin/bash
set -e

action=$1
compartmentId=$2

if [ "$action" == "START" ]; then
  echo "START command received"
elif [ "$action" == "STOP" ]; then
  echo "STOP command received"
else
  echo "Invalid parameter. Please enter 'START' or 'STOP'"
  echo "./compute-onoff.sh [START or STOP] [enter CompartmentID]"
  exit 1
fi
echo "action: $action"

if [ -z "$compartmentId" ]; then
  echo "Error: compartmentId parameter is required"
  echo "./compute-onoff.sh [START or STOP] [enter CompartmentID]"
  exit 1
fi

# compartmentId parameter is present, continue with the script
echo "compartmentId: $compartmentId"

computeList=$(eval "oci compute instance list --compartment-id $compartmentId")

for i in $(echo "$computeList" | jq '.data | keys | .[]'); do
  echo "loop: $i"

  ID=$(echo "$computeList" | jq -r ".data[$i].\"id\"")
  displayName=$(echo "$computeList" | jq -r ".data[$i].\"display-name\"")
  lifecycleState=$(echo "$computeList" | jq -r ".data[$i].\"lifecycle-state\"")

  echo "ID: $ID"
  echo "displayName: $displayName"
  echo "lifecycleState: $lifecycleState"
  echo "****"

  if [ "$displayName" == "compute-onoff" ]; then
    echo "skip compute-onoff instance"
    continue
  fi
  if [ "$1" == "START" ] && [ "$lifecycleState" == "STOPPED" ]; then
    echo "start instance $displayName"
    oci compute instance action --action START --instance-id $ID
  elif [ "$1" == "STOP" ] && [ "$lifecycleState" == "RUNNING" ]; then
    echo "stop instance $displayName"
    oci compute instance action --action STOP --instance-id $ID
  else
    echo "Nothing to do"
  fi
done
  ```

#### 6. 크론탭 파일에 스케쥴 작성하기

- 크론탭 파일열기
```bash
crontab -e
```

- 스케쥴 추가
```bash
0 9 * * 1-5 /bin/bash /home/opc/scripts/compute-onoff.sh START [compartmentId]
0 18 * * 1-5 /bin/bash /home/opc/scripts/compute-onoff.sh STOP [compartmentId]
```

위 스케쥴은 평일(월요일부터 금요일까지) 오전 9시와 오후 6시에 실행하도록 설정되어 있습니다. 스크립트의 경로와 컴파트먼트 ID를 실제 값으로 대체해야 합니다.
위 스케쥴은 다음과 같이 해석됩니다.

- 0 9 * * 1-5: 매주 월요일부터 금요일까지 오전 9시에 실행
- 0 18 * * 1-5: 매주 월요일부터 금요일까지 오후 6시에 실행

위의 설정대로 스케쥴을 추가하면, 지정된 시간에 스크립트가 실행됩니다.

#### 7. 크론탭 로그 확인하기
크론탭이 스케쥴을 입력 후 실행 결과를 확인하기 위해서 아래 경로의 로그의 내용을 확인하여 실행 결과를 확인할 수 있습니다.
```bash
sudo vi /var/log/cron
```

### 마무리하며...
이번 포스팅에서는 크론탭 + OCI CLI를 사용하여 특정 구획의 컴퓨트 인스턴스를 자동으로 중지/시작하는 방법에 대해 알아보았습니다.
아무쪼록 도움이 되셨으면 좋겠습니다.




