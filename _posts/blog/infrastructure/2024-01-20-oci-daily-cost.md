---
layout: page-fullwidth
#
# Content
#
subheadline: "Network"
title: "OCI 전일 비용 관리 소개"
teaser: "OCI 전날 비용에 관해서 임계치 이상의 경우 이메일로 통보받을 수 있는 부분에 대해서 알아봅니다."
author: kisukim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, cost]
#published: false

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


### 비용 관리란?
비용 관리란 OCI에 사용되는 리소스에 대해서 과금에 대해서 분석할 수 있는 기능입니다. 월단위 일 단위 서비스 혹은 서비스에 대한 시간대 별 과금 현황을 볼 수 있습니다.
- 비용은 실시간으로 처리되지 않으며, UTC 기준으로 2~3시간의 텀을 가지고 있습니다.

### 설정 방법
이번 블로그에서는 사용자가 전날 사용금액이 특정 임계치 이상 사용할 경우에 대해서 notifications 서비스의 토픽을 통해서 관리자에게 메일을 전달할 수 있도록 하는 기능에 대해서 설명하고자 합니다. 

먼저 아래와 같은 필수 조건이 있습니다. (주기적인 호출을 위해서 하나의 compute 생성 후 crontab 등록을 통해서 호출해야 합니다.) 
1. [OCI-CLI 연동하기](https://the-team-oasis.github.io/getting-started/ocicli-config/){:target="_blank" rel="noopener"}
2. [Python SDK 설치 공식문서](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/pythonsdk.htm){:target="_blank" rel="noopener"}
3. Notifications 토픽 설정 및 python 소스 코드 설정


개발자 서비스에 Notifications 을 클릭합니다.
![](/images/infrastructure/cost-1.png " ")

토픽을 생성합니다. 토픽의 이름 내용에 대해서 입력합니다. 이름은 공백 빈칸 없이 입력해야 합니다.
![](/images/infrastructure/cost-2.png " ")

Subscription 생성을 클릭하고 프로토콜에 Email 선택합니다. Email 주소는 메일을 수신하고자 하는 Email 주소를 입력합니다.
- 주소를 입력한 사용자는 시스템으로부터 scription 관련 확인 메일을 수신하게 되며, 수신된 메일에 내용 중에 confrim을 클릭하여 수신을 완료해야 합니다.

![](/images/infrastructure/cost-3.png " ")

정상적으로 생성된 토픽은 OCID 값을 가집니다. 해당 OCID을 아래 소스상에서 입력해야 합니다.
![](/images/infrastructure/cost-4.png " ")


아래 소스는 python으로 작성되었으며, usage_api_client.request_summarized_usages를 통해서 하루 동안 시간 단위 json을 리턴 받아서 computed_amount 키에 해당되는 값을 리턴 받아서 합을 구합니다.
ons_client.publish_message는 토픽 서비스를 통해서 mail의 내용을 받아서 토픽에 전달해 줍니다.

아래 입력된 조건문은 사용자의 테넌시에 설정된 통화단위로 계산되게 됩니다.

```source
# This is an automatically generated code sample.
# To make this code sample work in your Oracle Cloud tenancy,
# please replace the values for any parameters whose current values do not fit
# your use case (such as resource IDs, strings containing ‘EXAMPLE’ or ‘unique_id’, and
# boolean, number, and enum parameters with values not fitting your use case).

from datetime import datetime

import oci

# Create a default config using DEFAULT profile in default location
# Refer to
# https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#SDK_and_CLI_Configuration_File
# for more info
config = oci.config.from_file("~/.oci/config","DEFAULT")


# Initialize service client with default config file
usage_api_client = oci.usage_api.UsageapiClient(config)

# 29일이면, 28일날 하루치 사용량이 560만원이 초과되었는지 확인하고 29일 오전에 안내메일 발송.


# Send the request to service, some parameters are not required, see API
# doc for more info
request_summarized_usages_response = usage_api_client.request_summarized_usages(
    request_summarized_usages_details=oci.usage_api.models.RequestSummarizedUsagesDetails(
        tenant_id="[테넌시 OCID]",
        time_usage_started=datetime.strptime(
            "2024-01-28",
            "%Y-%m-%d"),
        time_usage_ended=datetime.strptime(
            "2024-01-29",
            "%Y-%m-%d"),
    opc_request_id="T1KHFJV54BBWJA6RO6XX<unique_ID>",
    # page="EXAMPLE-page-Value",
    limit=419)

# Get the data from response
print(request_summarized_usages_response.data)


# Get the data from response
data = request_summarized_usages_response.data

# Initialize the sum variable
total_compute_amount = 0

# Iterate over the data items and add the compute_amount values to the sum
for item in data.items:
    # print(item.time_usage_started)
    #print(item.computed_amount)
    if(item.computed_amount != None):
        total_compute_amount += item.computed_amount



# Initialize service client with default config file
ons_client = oci.ons.NotificationDataPlaneClient(config)


# Send the request to service, some parameters are not required, see API
# doc for more info

publish_message_response = ons_client.publish_message(
    topic_id="[토픽 OCID]",
    message_details=oci.ons.models.MessageDetails(
        body="Daily consumption was exceed - 5,600,000 KRW",
        title="OCI consumption warning"),
    opc_request_id="7CQVBC31WCKCS1SCWMJ3<unique_ID>",
    message_type="RAW_TEXT")

# Get the data from response


# Print the total compute amount
print("Total Compute Amount:", total_compute_amount , data.items[0].currency)

if(total_compute_amount > 5600000):
    print(publish_message_response.data)

````

### 참고
* https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.6/oci_cli_docs/cmdref/usage-api/usage-summary/request-summarized-usages.html
