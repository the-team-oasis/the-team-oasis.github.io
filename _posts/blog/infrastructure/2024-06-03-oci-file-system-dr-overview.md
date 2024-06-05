---
layout: page-fullwidth
#
# Content
#
subheadline: "Storage"
title: "OCI File Storage 서비스의 복제 (Replication) 기능을 이용하여 재해 복구(DR) 구성 실습하기"
teaser: "OCI에서 제공하는 네트워크 파일시스템 File Storage 서비스의 복제 기능을 이용하여 재해 복구 (DR)을 구성하는 방법에 대해 알아보기 위한 포스팅 입니다."
author: "yhcho"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, nfs, fss, nas, file, storage, file storage, network storage, dr, disaster recovery]
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

## 재해 복구를 위해 OCI File Storage 복제를 사용하는 방법 알아보기

> 재해 복구 계획을 세울 때, 예기치 않은 장애 조치에 필요한 클론, 파일 시스템, 마운트 타겟 등을 생성할 수 있는 충분한 리소스를 확보하는 것이 중요합니다. 일반적인 재해 복구 시나리오에서는 사용 불가능한 소스 파일 시스템마다 최소한 하나 이상의 추가 파일 시스템을 생성해야 합니다. 또한, 장애 조치 중에 생성된 파일 시스템에 접근하기 위해 최소한 하나의 마운트 타겟이 필요합니다.

### 파일 스토리지 복제를 사용한 복구 절차 소개

<table>
  <thead>
    <tr>
      <th>단계</th>
      <th>Primary 도메인 상태</th>
      <th>조치</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="#1-대상-파일-시스템으로-장애-조치-failover-to-target">1</a></td>
      <td>장애 발생</td>
      <td><a href="#1-대상-파일-시스템으로-장애-조치-failover-to-target">대상 파일 시스템으로 장애 조치</a></td>
    </tr>
    <tr>
      <td><a href="#2-원본-파일시스템-리전으로-복구-준비-prepare-to-failback-to-source">2</a></td>
      <td>복구됨</td>
      <td><a href="#2-원본-파일시스템-리전으로-복구-준비-prepare-to-failback-to-source">원본 파일시스템 리전으로 복구 준비</a>: 데이터를 소스에 동기화하기 위해 역방향 복제 사용</td>
    </tr>
    <tr>
      <td><a href="#3-소스에서-대상으로-복제-재구성">3</a></td>
      <td>복구됨</td>
      <td><a href="#3-소스에서-대상으로-복제-재구성">복제 재구성</a>: 소스에서 대상으로</td>
    </tr>
  </tbody>
</table>

### 재해 복구(DR) 구성 시 주의사항
재해 복구를 위해서는 소스와 대상 파일 시스템의 클론을 사용해야 합니다. 파일 시스템을 생성할 때는 파일 스토리지 서비스의 한도가 초과되지 않아야 하며, 클론이 필요한 이유는 복제 대상 시스템은 익스포트를 구성할 수 없기 때문입니다.

> 클론 생성은 즉시 이루어지며, 클론을 생성한 후 바로 읽기 및 쓰기 작업을 수행할 수 있습니다. 
다만, 하이드레이션(hydration) 과정이 진행되는 동안 부모 파일 시스템과 클론 모두에 약간의 성능 저하가 발생할 수 있습니다.
또한, 클론의 부모 파일 시스템을 삭제할 수 없습니다.

### 1. 대상 파일 시스템으로 장애 조치 (Failover to Target)
만약 원본 파일 시스템(파일 시스템 A)이 포함된 지역에 액세스할 수 없는 경우 복제된 대상 파일 시스템(파일 시스템B)에 마지막으로 생성된 복제 스냅샷을 이용하여 새로운 파일 시스템(파일 시스템C)을 클론하여 생성해야 합니다.
![](/assets/img/infrastructure/2024/fss/dr-4.png)

### 1-1. 최근 복제된 스냅샷으로 새로운 파일 시스템 만들기
- 복제 대상으로 지정된 리전의 파일 시스템 세부정보 화면에서 "복제 대상"의 링크를 클릭합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-22.png)
- 이동한 화면에서 "마지막 스냅샷" 항목의 링크를 클릭합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-23.png)
- 스냅샷 세부정보 화면에서 "복제 (Clone)" 버튼을 클릭하여 새로운 파일 시스템을 생성합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-24.png)

> 원본 파일 시스템 리전이 복구될 경우 마지막 복제된 스냅샷을 소스로 FailBack을 구성하게 됩니다. 따라서 현재 마지막으로 적용된 스냅샷의 출처 OCID를 기록해 놓아야 합니다.
![](/assets/img/infrastructure/2024/fss/replication-32.png)

### 1-2. 복제 대상 리소스 삭제하기
복제 대상 리소스를 삭제하지 않은 상태에서 원본 파일 시스템의 리전이 정상화 될 경우, 원본 파일 시스템으로 복원(Failback)하기 위한 스냅샷이 삭제 될 수 있기 때문에 꼭 삭제해야 합니다.

> 만약, 테스트 중인 경우 원본 파일 시스템 리전을 사용할 수 있기 때문에 원본 파일 시스템의 복제 리소스만 삭제 하면 됩니다. <br>(원본 파일 시스템의 복제 자원을 삭제하면 대상 리소스도 자동으로 함께 삭제됩니다.)

1. 원본 파일 시스템의 복제 구성 리스트에서 삭제하려고 하는 복제 링크를 클릭합니다. (Replication-tokyo)
   ![](/assets/img/infrastructure/2024/fss/dr-1.png)
2. 이동한 화면에서 삭제 버튼을 클릭합니다.
   ![](/assets/img/infrastructure/2024/fss/dr-2.png)
3. 삭제 모드를 선택하고 삭제 버튼을 클릭합니다.
   ![](/assets/img/infrastructure/2024/fss/dr-3.png)

   
### 1-3. 익스포트 및 마운트 대상 생성하기
- 아래와 같이 앞서 생성한 파일 시스템의 익스포트 경로 및 마운트 대상을 생성합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-30.png)

### 1-4. Linux VM 에 마운트 후 결과 확인하기
- 익스포트의 세부정보 화면에서 마운트 명령을 확인 후 Linux VM에서 순서대로 입력하여 파일 시스템의 내용을 조회합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-27.png)
  ![](/assets/img/infrastructure/2024/fss/replication-28.png)
- 원본 파일 시스템의 파일 목록과 동일한 목록을 확인할 수 있습니다.
  ![](/assets/img/infrastructure/2024/fss/replication-29.png)

### 2. 원본 파일시스템 리전으로 복구 준비 (Prepare to Failback to Source)
재해가 발생했던 리전이 복구되면 대상 파일시스템 리전에서 원본 파일 시스템 리전으로 Failback 하기 위한 준비가 필요합니다.
하지만 최초에 복제를 구성했던 파일 시스템(파일 시스템 A)의 경우 이미 Export를 구성했었기 때문에 다른 복제구성의 Target 으로 설정할 수 없습니다. 따라서 마지막 대상 파일시스템(파일 시스템 C)을 클론할 때 사용한 스냅샷을 이용하여 새로운 파일시스템(파일시스템 D)을 구성한 후 복제를 다시 구성해야 합니다.
![](/assets/img/infrastructure/2024/fss/dr-5.png)

#### 2-1. 원본 파일시스템 (파일시스템 A)의 복제 구성 삭제
`FAILED` 상태로 남아있는 원본 파일시스템의 복제 구성을 삭제합니다.

> 만약 테스트 중 이라면, 앞 단계에서 이미 복제 구성을 삭제하였기 때문에 이 단계를 건너 띄어도 됩니다.

1. 원본 파일 시스템의 복제 구성 리스트에서 삭제하려고 하는 복제 링크를 클릭합니다. (Replication-tokyo)
   ![](/assets/img/infrastructure/2024/fss/dr-1.png)
2. 이동한 화면에서 삭제 버튼을 클릭합니다.
   ![](/assets/img/infrastructure/2024/fss/dr-2.png)
3. 삭제 모드를 선택하고 삭제 버튼을 클릭합니다.
   ![](/assets/img/infrastructure/2024/fss/dr-3.png)

#### 2-2. Fail Over 단계에서 사용한 마지막 스냅샷을 식별합니다. 
앞 단계에서 저장해 두었던 출처 OCID를 이용하여 원본 파일시스템 (파일시스템 A)의 스냅샷 목록 중에서 사용된 스냅샷이 어떤 스냅샷인지 식별합니다.

#### 2-3. 복제 대상으로 구성할 새로운 파일 시스템(파일시스템 D) 만들기
이 단계에서 사용자는 2가지 유형으로 새로운 파일 시스템을 준비할 수 있습니다.

- 마지막 복제에 사용된 스냅샷을 이용하여 클론을 통해 새로운 파일 시스템 생성하기
   - 이렇게 생성할 경우 장애복구를 위해 새로운 파일 시스템에 마지막 스냅샷 내용까지 복원된 상태로 파일시스템을 준비할 수 있습니다.
- 비어있는 새로운 복제용 파일 시스템 생성하기
   - 이렇게 생성할 경우 Failback을 위해 파일 시스템을 준비할 수 있습니다. 다만, 추후 복제 스냅샷이 동기화된 이후에 별도로 스냅샷 내용을 파일 시스템에 복원하는 작업이 필요할 수 있습니다.

1. DR 리전의 대상 파일시스템(파일시스템 C) 를 생성할 때 사용한 스냅샷을 이용하여 클론을 생성합니다.
   ![](/assets/img/infrastructure/2024/fss/dr-7.png)
2. 생성된 새로운 대상 파일시스템 (파일시스템 D)의 OCID를 복사합니다.
   ![](/assets/img/infrastructure/2024/fss/dr-8.png)

#### 2-4. 새로운 복제 구성하기
이 단계에서는 장애복구 또는 Failback 을 준비하기 위해 새로운 파일시스템 (파일시스템 C)를 소스가 되는 새로운 복제를 구성해야 합니다.

> 복제 구성을 위해서는 동일한 시점에 생성된 스냅샷을 기반으로 생성된 파일시스템 끼리 복제를 구성할 수 있습니다. 만약 복제 생성시점에 오류가 발생할 경우 동일한 스냅샷을 이용하여 생성된 파일시스템인지 다시 한번 확인이 필요합니다.

1. 앞서 확인한 OCID를 사용하여 DR 리전의 파일 시스템에서 복제를 생성합니다.
   ![](/assets/img/infrastructure/2024/fss/dr-9.png)
   ![](/assets/img/infrastructure/2024/fss/dr-10.png)
   ![](/assets/img/infrastructure/2024/fss/dr-11.png)

### 3. 소스에서 대상으로 복제 재구성
주 리전에 생성한 새로운 파일시스템에서 DR 리전으로 구성되는 새로운 복제를 생성하기 위해서 DR리전에 새로운 파일시스템 (파일시스템 E)를 생성해야 합니다.
DR리전의 새로운 파일시스템은 파일시스템 D를 생성할 때 사용한 스냅샷과 동일한 스냅샷을 사용하여 생성해야 합니다.

![](/assets/img/infrastructure/2024/fss/dr-6.png)


#### 3-1. DR 리전의 소스 파일시스템 (파일시스템 C)의 복제 구성 삭제
새로운 복제를 구성하기 전에 먼저 기존 파일시스템의 복제 구성을 삭제해야 합니다.

- 도쿄 리전의 파일시스템의 복제 구성 세부정보 화면에서 삭제 버튼을 클릭하여 복제 구성을 삭제합니다.
  ![](/assets/img/infrastructure/2024/fss/dr-12.png)
  ![](/assets/img/infrastructure/2024/fss/dr-13.png)
  ![](/assets/img/infrastructure/2024/fss/dr-14.png)

#### 3-2. 주 리전의 새로운 원본 파일시스템의 마운트 대상을 생성하여 Linux VM에서 연결을 확인합니다.

- 새롭게 생성한 파일시스템 D에서 익스포트를 생성합니다.
  ![](/assets/img/infrastructure/2024/fss/dr-15.png)
- 마운트 명령어를 확인합니다.
  ![](/assets/img/infrastructure/2024/fss/dr-16.png)
- Linux VM에서 명령어를 입력 후 연결을 확인합니다.
  ![](/assets/img/infrastructure/2024/fss/dr-17.png)

#### 3-3. 새로운 복제 대상이 될 파일시스템(파일시스템 E)을 생성합니다.
- 파일시스템 D를 생성할 때 사용한 스냅샷을 이용하여 새로운 파일시스템을 클론 후 파일시스템의 OCID를 확인합니다.
  ![](/assets/img/infrastructure/2024/fss/dr-18.png)
- 주 리전의 새로운 원본 파일시스템 (파일시스템 D)에서 복사한 DR리전의 파일시스템의 OCID를 활용하여 새로운 복제를 생성합니다.
  ![](/assets/img/infrastructure/2024/fss/dr-19.png)
- 복제 생성 결과를 확인합니다.
  ![](/assets/img/infrastructure/2024/fss/dr-20.png)
  ![](/assets/img/infrastructure/2024/fss/dr-21.png)

## 마무리하며
이렇게 해서 OCI 파일 시스템을 활용하여 DR 시나리오를 구성하는 방법에 대해 확인했습니다.
아무쪼록 작성한 내용이 도움이 되셨으면 좋겠습니다.