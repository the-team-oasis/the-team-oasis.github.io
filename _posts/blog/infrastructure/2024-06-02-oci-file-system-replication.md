---
layout: page-fullwidth
#
# Content
#
subheadline: "Storage"
title: "OCI File Storage 서비스에 복제 (Replication) 구성하기"
teaser: "OCI에서 제공하는 네트워크 파일시스템 File Storage 서비스의 복재 (Replication) 구성 방법에 대해 알아봅니다."
author: "yhcho"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, nfs, fss, nas, file, storage, file storage, network storage, replication]
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

## OCI 파일 스토리지 시스템의 복제 (Replication) 기능 살펴보기
OCI 파일 스토리지 시스템 복제 기능은 아래 포스팅을 참고해주세요.
> [OCI File Storage 서비스에 복제 (Replication)에 대해 알아보기](/infrastructure/oci-file-system-replication-overview/){:target="_blank"}


## 1. 파일 시스템 복제 구성하기
파일 시스템의 복제 대상 시스템은 아래와 같이 제약 사항이 존재 합니다.
- 한 번도 익스포트 경로를 구성하지 않은 파일 시스템만 대상 파일 시스템으로 사용할 수 있습니다. 이전에 익스포트를 구성한 파일 시스템을 사용하려면 **먼저 해당 파일 시스템의 클론을 생성한 후 클론을 대상으로 사용해야 합니다.**
- **사용자 스냅샷을 생성하거나 삭제한 파일 시스템은 복제 대상 파일 시스템으로 사용할 수 없습니다.**
- **스냅샷 정책이 부착된 파일 시스템은 대상 파일 시스템으로 사용할 수 없습니다.**

> 파일 시스템 세부정보 화면에서 "대상화 가능" 값이 True 일 경우 대상으로 지정할 수 있습니다.

- 대상화 지정 불가한 경우
  ![](/assets/img/infrastructure/2024/fss/replication-4.png)
- 대상화 지정이 가능한 경우
  ![](/assets/img/infrastructure/2024/fss/replication-6.png)

### 1-1. 사전에 생성된 파일 시스템으로 복제 구성하기 (춘천 - 서울)
파일 시스템의 복제 기능 중 기존 파일 시스템을 활용하여 복제를 구성하는 방법에 대해 알아보도록 하겠습니다.

- 복제용 파일 시스템을 생성할 리전을 선택하여 파일 시스템을 생성합니다. 생성 시 `복제용 파일 시스템` 유형을 선택하여 생성 합니다.
  - 복제 대상 파일 시스템은 "서울" 리전에 생성 하였습니다.
  - 생성 후 대상 파일 시스템의 OCID를 복사합니다.
    ![](/assets/img/infrastructure/2024/fss/replication-5.png)
- 복제 원본 파일 시스템 세부정보 화면에서 복제 생성 버튼을 클릭하여 아래와 같이 선택 및 입력하여 복제를 생성합니다.
  - 이름 : **Replication-seoul**
  - **기존 대상 파일 시스템 사용** 선택
  - 대상 파일 시스템 OCID : 앞서 생성한 서울 리전의 파일 시스템의 OCID를 입력합니다.
    ![](/assets/img/infrastructure/2024/fss/replication-7.png)
- 복제 생성이 완료되었습니다.
  ![](/assets/img/infrastructure/2024/fss/replication-13.png)

### 1-2. 새로운 파일 시스템을 생성하여 복제 구성하기 (춘천 - 도쿄)
파일 시스템의 복제 기능 중 새로운 파일 시스템을 생성하여 복제를 구성하는 방법에 대해 알아보도록 하겠습니다.

- 복제 원본 파일 시스템 세부정보 화면에서 복제 생성 버튼을 클릭하여 아래와 같이 선택 및 입력하여 복제를 생성합니다.
  - 이름 : **Replication-tokyo**
  - **새 대상 파일 시스템 생성** 선택
    - 이름 : fss-tokyo-target
    - 대상 영역 : Japan East (Tokyo)
      ![](/assets/img/infrastructure/2024/fss/replication-8.png)
      ![](/assets/img/infrastructure/2024/fss/replication-9.png)
- 복제가 생성 되었습니다.
  ![](/assets/img/infrastructure/2024/fss/replication-10.png)
- 복제 구성 시 생성된 파일 시스템은 익스포트를 구성할 수 없습니다. 필요한 경우 최근 스냅샷을 이용하여 새로운 파일 시스템을 클론하여 구성할 수 있습니다.
  ![](/assets/img/infrastructure/2024/fss/replication-14.png)

### 1-3. 복제 구성 후 원본 파일 시스템 스냅샷 살펴보기
복제를 구성하게 되면 구성하는 시점 기준으로 아래와 같이 복제를 위한 스냅샷이 "복제" 유형으로 생성 됩니다.
이 스냅샷은 복제 구성별로 최근 2개의 스냅샷까지 보관되며, 이전 스냅샷은 시스템에 의해 자동으로 삭제됩니다.

- 구성 직후 스냅샷 목록
  ![](/assets/img/infrastructure/2024/fss/replication-12.png)
- 구성 후 몇 시간이 지난 후 스냅샷 목록
  ![](/assets/img/infrastructure/2024/fss/replication-16.png)

## 2. 복제된 파일 시스템 마운트 하기 (도쿄)
복제된 파일 시스템을 마운트 하기 위해서는 복제된 스냅샷으로 새로운 파일시스템을 구성한 후 익스포트 및 마운트 대상을 생성해야 합니다.

### 2-1. 최근 복제된 스냅샷으로 새로운 파일 시스템 만들기
- 복제 대상으로 지정된 리전의 파일 시스템 세부정보 화면에서 "복제 대상"의 링크를 클릭합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-22.png)
- 이동한 화면에서 "마지막 스냅샷" 항목의 링크를 클릭합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-23.png)
- 스냅샷 세부정보 화면에서 "복제 (Clone)" 버튼을 클릭하여 새로운 파일 시스템을 생성합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-24.png)

#### (Option) 대상 파일 시스템의 스냅샷 목록에서도 아래와 같이 새로운 파일 시스템을 생성할 수 있습니다.
- 스냅샷 목록에서 가장 최근 스냅샷의 우측 액션 버튼을 클릭 후 복제(Clone) 버튼을 클릭합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-25.png)
- 복제 생성 화면에서 이름 및 구획을 선택하여 파일 시스템 클론을 생성합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-26.png)


### 2-2. 익스포트 및 마운트 대상 생성하기
- 아래와 같이 앞서 생성한 파일 시스템의 익스포트 경로 및 마운트 대상을 생성합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-30.png)

### 2-3. Linux VM 에 마운트 후 결과 확인하기
- 익스포트의 세부정보 화면에서 마운트 명령을 확인 후 Linux VM에서 순서대로 입력하여 파일 시스템의 내용을 조회합니다.
  ![](/assets/img/infrastructure/2024/fss/replication-27.png)
  ![](/assets/img/infrastructure/2024/fss/replication-28.png)
- 원본 파일 시스템의 파일 목록과 동일한 목록을 확인할 수 있습니다.
  ![](/assets/img/infrastructure/2024/fss/replication-29.png)

## 3. 파일 시스템 복제 모니터링 측정항목 살펴보기
파일 스토리지 서비스는 복제 작업과 잠재적 장애를 추적할 수 있는 메트릭을 제공합니다. 
이 메트릭을 통해 소스와 대상 파일 시스템 간의 전송, 대역폭, 복제 리소스에 의해 수행된 메타데이터 작업 등을 분석할 수 있습니다. 
예를 들어, 대역폭 문제와 잠재적 병목 현상을 모니터링하려면 소스 파일 시스템의 총 쓰기 작업 수와 소스에서 대상 파일 시스템으로의 총 데이터 송출량을 모니터링할 수 있습니다. 
또한, 소스 파일 시스템에서 스냅샷이 생성된 시간과 대상 파일 시스템에 적용된 시간 간의 차이를 모니터링하여 대상 파일 시스템이 소스에 얼마나 뒤처져 있는지, 장애 발생 시 얼마나 많은 데이터가 손실될지를 파악할 수 있습니다.

### 3-1. 파일 시스템 복제 리소스에서 제공하는 모니터링 항목들
<table>
  <tr>
    <th>이 차트는...</th>
    <th>이 정보를 보여줍니다...</th>
    <th>다음 기본값을 사용하여...</th>
    <th>다음을 할 수 있습니다...</th>
  </tr>
  <tr>
    <td>복제 처리량 (Replication Throughput)</td>
    <td>
      <b>복제 소스</b>: 소스 파일 시스템에서 전송된 데이터의 평균 처리량. 1분 간격으로 초당 바이트 수로 계산됩니다. 기본 <b>평균(mean)</b> 통계만 유의미합니다.
      <br><br>
      <b>복제 대상</b>: 대상 파일 시스템에 적용된 데이터의 평균 처리량. 1분 간격으로 초당 바이트 수로 계산됩니다. 기본 <b>평균(mean)</b> 통계만 유의미합니다.
    </td>
    <td>
      <ul>
        <li>통계: 평균 (mean)</li>
        <li>간격: 1분</li>
        <li>시간 범위: 1시간</li>
        <li>y축: 초당 바이트 (bytes per second)</li>
      </ul>
    </td>
    <td>
      <ul>
        <li>처리량이 가장 높은 복제와 가장 낮은 복제를 식별합니다.</li>
        <li>처리량이 허용 범위 이하일 때 알림을 받아 조치를 취할 수 있습니다.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>복제 송출 바이트 (Replication Egress Bytes)</td>
    <td>
      <b>복제 소스</b>: 소스 지역에서 복사된 바이트 수. 크로스 리전 복제에 대해서만 유의미합니다.
      <br><br>
      <b>복제 대상</b>: 해당 없음 (N/A)
    </td>
    <td>
      <ul>
        <li>통계: 합계 (sum)</li>
        <li>간격: 1분</li>
        <li>시간 범위: 1시간</li>
        <li>y축: 바이트 (bytes)</li>
      </ul>
    </td>
    <td>크로스 리전 복제와 관련된 네트워크 전송 비용을 모니터링합니다.</td>
  </tr>
  <tr>
    <td>복제 복구 지점 나이 (Replication Recovery Point Age)</td>
    <td>소스에서 완전히 복사되어 복제 대상에 적용된 마지막 스냅샷의 나이. 소스 스냅샷이 생성된 이후의 시간으로 표현됩니다.</td>
    <td>
      <ul>
        <li>통계: 평균 (mean)</li>
        <li>간격: 1분</li>
        <li>시간 범위: 1시간</li>
        <li>y축: 초 (seconds)</li>
      </ul>
    </td>
    <td>대상 파일 시스템의 데이터가 요구 사항(RPO)보다 오래되지 않았는지 확인합니다.</td>
  </tr>
</table>
![](/assets/img/infrastructure/2024/fss/replication-21.png)

아래와 같이 모니터링 측정항목에 옵션 메뉴를 클릭하여 원하는 항목을 이용하여 알림을 설정할 수 있습니다.
![](/assets/img/infrastructure/2024/fss/replication-31.png)


## 다음 단계...
이번 포스팅에서는 파일 시스템 복제를 구성하는 방법에 대해 알아보았습니다. 다음은 OCI 파일 시스템을 이용하여 DR을 구성하는 방법에 대해 알아보도록 하겠습니다.

- [OCI File Storage 서비스의 복제 (Replication) 기능을 이용하여 재해 복구(DR) 구성 실습하기](/infrastructure/oci-file-system-dr-overview/){:target="_blank"}