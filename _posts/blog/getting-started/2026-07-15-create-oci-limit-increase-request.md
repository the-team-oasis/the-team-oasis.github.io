---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI"
title: "OCI 콘솔에서 서비스 리밋 증가 요청하는 방법"
teaser: "OCI 콘솔에서 서비스 리밋 사용량을 확인하고 필요한 리밋 증가를 요청하는 방법을 설명합니다."
author: yhcho
date: 2026-07-15 00:00:02
breadcrumb: true
categories:
  - getting-started
tags:
  - [oci, service-limit, limit-increase]
#published: false

#
# Styling
#
header: no
# image:
#     title: image-title.jpg
#     thumb: image-thumb.jpg
#     homepage: image-home.jpg
#     caption: Image caption
#     caption_url: https://example.com/
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

### OCI 콘솔에서 서비스 리밋 증가 요청하기

OCI 서비스에는 테넌시, 리전 또는 가용성 도메인(Availability Domain, AD)을 기준으로 적용되는 서비스 리밋이 있습니다. 필요한 리소스가 현재 리밋을 초과하거나 리밋에 가까워진 경우 OCI 콘솔에서 **Limit increase request**를 생성하여 증가를 요청할 수 있습니다.

> 리밋 증가 요청을 시작하기 전에 필요한 서비스, 리밋 이름, 대상 리전 및 AD, 현재 사용량, 요청할 최종 리밋 값을 확인하는 것이 좋습니다. 요청 화면에 표시되는 단위(GB, TB, 개수 등)도 함께 확인하세요.

#### 리밋 증가 요청 화면 열기

OCI 콘솔에서는 다음 방법으로 리밋 증가 요청을 시작할 수 있습니다.

##### 방법 1. 도움말 메뉴에서 요청하기

- OCI 콘솔 오른쪽 위의 **도움말(?)** 아이콘을 클릭하고 **Request a limit increase**를 선택합니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-01.png " ")

##### 방법 2. 서비스 리밋 화면에서 요청하기

- 일부 서비스 화면에서는 현재 리밋과 사용량을 확인할 수 있습니다. 사용량이 리밋에 근접하거나 리밋에 도달한 항목에서 **Request a service limit increase**를 클릭합니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-02.png " ")

이 방법을 사용하면 해당 서비스와 관련된 리밋 정보를 확인한 상태에서 요청을 시작할 수 있습니다.

##### 방법 3. Limit increase requests 메뉴에서 요청하기

- OCI 콘솔의 탐색 메뉴를 열고 **Governance & Administration** > **Support** > **Limit increase requests**로 이동합니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-menu1.png " ")

- **Limit increase requests** 화면에서 **Create**를 클릭합니다. 이 화면에서는 기존 요청의 이름, 상태, 요청 항목 및 사유도 확인할 수 있습니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-menu2.png " ")

#### 요청 제목과 사유 작성하기

- **Request name**에 요청 내용을 쉽게 구분할 수 있는 제목을 입력합니다.
- **Reason for request**에 리밋 증가가 필요한 이유와 사용 목적을 구체적으로 작성합니다.
- 요청 제목과 사유는 한글 또는 영어로 작성할 수 있습니다. 필요한 서비스, 용도, 현재 상황과 증가가 필요한 이유를 명확하게 작성하면 요청 검토에 도움이 됩니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-03.png " ")

다음은 요청 사유 작성 예시입니다.

> OCI Base Database Service를 이용한 PoC를 진행하고 있습니다. 현재 VM DB Block Storage 리밋으로 인해 스토리지를 추가할 수 없습니다. PoC를 계속 진행할 수 있도록 서울 리전의 스토리지 리밋을 10,500GB로 증가해 주시기 바랍니다.

필요한 경우 다음과 같이 영어로 작성할 수 있습니다.

> We are testing OCI Base Database Service for a PoC. We need more storage, but we cannot add it because of the current limit. Please increase the storage limit in the Seoul region to 10,500 GB so that we can continue the PoC.

- 제목과 사유를 입력한 후 **Next**를 클릭합니다.

#### 요청할 서비스와 리밋 선택하기

- **Requested items** 단계에서 **Add**를 클릭한 후 리밋을 증가할 **Service**를 선택합니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-04.png " ")

- **Limit name**에서 증가가 필요한 리밋 항목을 선택합니다. 검색어를 입력하여 후보를 좁힐 수 있습니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-05.png " ")

> 같은 서비스에도 용도와 단위가 다른 여러 리밋 항목이 있을 수 있습니다. 실제로 증가가 필요한 서비스 카테고리와 리밋 이름을 서비스 리밋 화면의 항목과 대조하여 정확히 선택하세요. 잘못된 항목을 선택하면 필요한 리소스를 생성하지 못하거나 요청을 다시 제출해야 할 수 있습니다.

#### 새 리밋 값 입력하기

- 선택한 리밋에 표시되는 현재 리밋과 현재 사용량을 확인합니다.
- **Requested value**에 증가 후 적용할 최종 리밋 값을 입력합니다. 증가분이 아니라 원하는 **전체 리밋 값**을 입력해야 합니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-06.png " ")

- 요청값을 입력하고 **Save**를 클릭합니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-07.png " ")

> 요청값을 정할 때는 서비스에서 지원하는 리소스 크기와 증가 단위를 고려하세요. 예를 들어 개별 리소스가 특정 크기 단위로만 생성 또는 확장되는 서비스라면, 계획한 리소스를 수용할 수 있도록 요청값을 계산해야 합니다. 화면에 표시되는 리밋의 단위가 GB, TB 또는 리소스 개수인지도 반드시 확인하세요.

필요한 리밋 항목이 여러 개인 경우 **Add**를 다시 클릭하여 요청 항목을 추가할 수 있습니다.

#### 요청 내용 검토 및 제출하기

- **Review and create** 단계에서 요청 이름과 사유가 올바른지 확인합니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-08.png " ")

- **Requested items**에서 서비스, 리밋 이름, 대상 범위 및 요청값을 다시 확인합니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-09.png " ")

특히 다음 항목을 제출 전에 확인하세요.

- 실제 필요한 **리전**에 요청되었는지 확인합니다.
- AD 단위 리밋인 경우 실제 리소스를 생성할 **가용성 도메인(AD)**이 선택되었는지 확인합니다.
- 서비스와 리밋 이름이 실제 제한에 도달한 항목과 일치하는지 확인합니다.
- 요청값과 단위가 계획한 리소스 용량 또는 개수를 충족하는지 확인합니다.

> 예시 화면의 `DQly:AP-SEOUL-1-AD-1`과 같이 대상 범위에 리전 또는 AD 정보가 표시될 수 있습니다. 다른 리전이나 AD에 적용된 리밋은 실제 리소스를 생성하려는 위치의 리밋 문제를 해결하지 못하므로 주의해야 합니다.

- 모든 내용을 확인한 후 **Submit**을 클릭하여 요청을 제출합니다.

#### 요청 상태 확인하기

- 제출한 요청은 **Governance & Administration** > **Support** > **Limit increase requests**에서 확인할 수 있습니다.
- 요청 상세 화면에서 요청 OCID, 요청 사유, 생성 시각 및 처리 상태를 확인합니다.

![](/assets/img/getting-started/2026/oci-limit-request/oci-limit-request-10.png " ")

요청이 검토 중이면 상태가 **In Progress**로 표시됩니다. 요청이 더 이상 필요하지 않은 경우 처리 상태에 따라 상세 화면의 **Withdraw**를 사용하여 철회할 수 있습니다.

> 리밋 증가 요청은 제출과 동시에 자동 승인되는 작업이 아닐 수 있습니다. 리소스 생성 또는 확장 일정을 고려하여 필요한 시점보다 여유 있게 요청하세요.
