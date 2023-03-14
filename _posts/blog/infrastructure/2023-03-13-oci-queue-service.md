---
layout: page-fullwidth
#
# Content
#
subheadline: "Application Integration"
title: "OCI에서 OCI queue 사용하기"
teaser: "OCI에서 OCI queue 관련 정보에 대해서 알아봅니다.."
author: kisu.kim
breadcrumb: true
categories:
  - Governance
tags:
  - [oci, status]
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

### OCI Queue 소개
OCI 큐는 초당 수백만 개의 메시지를 수집할 수 있는 가용성이 높은 처리량 대기열 서비스입니다. 사용자는 대기열에서 메시지를 등록, 사용 및 삭제할 수 있으며 메시지의 가시성을 업데이트할 수도 있습니다.
OCI Queue는 표준 STOMP 지원할 뿐만 아니라 SDK를 통해 RESTful API를 지원합니다. 또한 완벽한 FIFO 방식은 아직 지원하고 있지 않습니다. 99.9% SLA지원 및 최대 7일의 메시지 보존 기간을 가지고 있습니다. 



### 정책 (Policy)
Administrators가 아닌 경우,아래와 같이 Queue id로 정책을 주거나, 테넌시 기준으로 그룹에 정책을 줄 수 있습니다.
```text
allow group <group-name> to manage queues in compartment <compartment-name> where target.queue.id = '<queue-ocid>'
//or
allow group <group-name> to manage queues in tenancy
```

### 제약사항
큐의 경우, 10MB/sec ingress and 10MB/sec data egress per queue (soft) 임계값을 초과하면 스트로링이 활성화 됩니다.

![](/assets/img/infrastructure/2023/queue/SCR-20230313-nbln.png){:width="70%":align="right"}


### Queue 장점

![](/assets/img/infrastructure/2023/queue/SCR-20230313-mecq.png)

- Enables Scaling : 메시지의 워크로드에 따라서 자동적으로 오토스케일링이 지원됩니다.
- Enables Decoupling : 다른 서비스와 종속되지 않은 서비스를 제공합니다.
- Enables Reliable Delivery : 소비자를 통해서 배달되지 않은 메시지는 DLQ로 이동하여 메시지를 보존합니다.

### Queue 용어
- message : 메시지는 문자열 형식의 페이로드를 포함하는 대기열의 요소입니다. 문자열은 XML, JSON, CSV, Base64로 인코딩된 바이너리 메시지, 심지어 gzip과 같은 압축 형식을 포함한 모든 형식이 될 수 있습니다. 생산자와 소비자는 메시지 형식에 동의해야 합니다. 각 메시지는 독립적으로 처리됩니다.
- producer : 대기열에 메시지를 보내는 클라이언트입니다.
- consumer : 대기열에서 메시지를 수신하는 클라이언트입니다. 소비자는 메시지를 받은 후 대기열에서 메시지를 삭제할 책임도 있습니다.
- maximum retention period : 소비자가 메시지를 삭제하지 않은 경우 메시지가 시스템에 의해 자동으로 삭제될 때까지 대기열이 메시지를 보관하는 기간입니다. 최대 보존 기간은 대기열 수준에서 10초에서 7일의 값으로 구성할 수 있습니다. 기본값은 1일입니다.
- delivery count : 요청 시 소비자에게 메시지가 전달되는 횟수입니다.
- maximum delivery attempts : 메시지가 소비자에게 전달되었지만 업데이트되거나 삭제되지 않은 채로 DLQ(죽은 편지 큐)로 보내지기 전까지의 횟수입니다. 최대 배달 시도는 큐 수준에서 1~20의 값으로 구성할 수 있습니다.
- polling timeout : 소비자가 메시지를 소비할 때까지 대기하는 시간입니다. 폴링 시간 제한을 늘리면 소비자가 대기열에서 메시지를 요청하지만 사용할 수 있는 메시지가 없다는 응답이 표시되는 횟수가 줄어듭니다. 폴링 시간 제한은 대기열 수준에서 0~30초의 값으로 구성할 수 있으며, 소비자는 메시지를 요청할 때 이 값을 설정할 수 있습니다. 기본값은 30초입니다.
- visibility timeout : 한 소비자가 대기열에서 받은 메시지가 다른 소비자에게 표시되지 않는 기간입니다. 공개 시간 제한은 대기열 수준에서 1초에서 12시간까지의 값으로 구성할 수 있으며, 소비자는 메시지를 요청할 때 이 값을 설정할 수 있습니다. 기본값은 30초입니다.
- visible messages : 현재 대기열에 있는 메시지 중 사용 가능한 메시지의 수입니다.
- in-flight messages : 소비자에게 전달되었지만 아직 삭제되지 않은 메시지 수입니다. 기내 메시지는 표시 시간 제한이 지날 때까지 다시 전달할 수 없습니다.
- dead letter queue : 메시지가 성공적으로 소비되지 않았고 배달 시도 횟수가 구성된 최대 배달 시도 횟수보다 많은 경우 해당 메시지는 DLQ(배달 실패 편지 큐)로 전송됩니다.



![](/assets/img/infrastructure/2023/queue/SCR-20230313-mnlw.png)

- "Applications & Integration"에서 Queue서비스로 이동합니다.

![](/assets/img/infrastructure/2023/queue/SCR-20230313-mnow.png)

- 위 화면에서 "Create Queue"를 클릭하여 Queue 서비스를 생성합니다.

![](/assets/img/infrastructure/2023/queue/SCR-20230313-mobb.png)

- Name : Queue에 사용할 이름을 적습니다.
- Compartment : 생성할 구획을 선택합니다.
- Queue Configuration
  - Default Configuration : 기본 설정으로 입력값은 OCI 에서 기본 셋팅값으로 생성됩니다.
  - Custom Configuration : 사용자가 몇가지 설정을 입력할 수 있습니다. 
    - 가시성 시간 초과 : 특정 소비자에게 전달된 메시지가 다른 소비자에게 표시되지 않는 시간입니다.
    - 최대 보존 기간 : 삭제 전까지 메시지가 대기열에 보존될 수 있는 시간입니다.
    - 전달되지 않은 메시지의 대기열 설정 (최대 전달 시도 횟수) : DLQ(전달되지 않은 메시지 대기열)로 전송되기 전 메시지 소비에 대한 최대 재시도 횟수입니다.

![](/assets/img/infrastructure/2023/queue/SCR-20230313-moej.png)

- 아래 생성된 큐의 상세정보를 확인할 수 있습니다.
  - 

![](/assets/img/infrastructure/2023/queue/SCR-20230313-mqbm.png)

![](/assets/img/infrastructure/2023/queue/SCR-20230313-mqew.png)

![](/assets/img/infrastructure/2023/queue/SCR-20230313-mqit.png)

### Queue 메시지 Put/Get 하기 
아래 소스는 Java 기준으로 예시이며, OCI 라이브러리를 통해서 만들어져 있습니다. 또한 OCI-CLI를 통해서 API Key가 등록되어 있어야합니다.

* [OCI-CLI 설정하기 ](https://the-team-oasis.github.io/getting-started/ocicli-config/)



Java dependencies 내용
```Java
    <dependencies>
        <dependency>
            <!-- Since this is the "application" pom.xml, choose the httpclient to use. -->
            <groupId>com.oracle.oci.sdk</groupId>
            <artifactId>oci-java-sdk-common-httpclient-jersey</artifactId>
        </dependency>
        <dependency>
            <groupId>com.oracle.oci.sdk</groupId>
            <artifactId>oci-java-sdk-queue</artifactId>
            <version>3.7.0</version>
        </dependency>
    </dependencies>
```

Publisher 소스 코드
```Java
  package org.example;

  import com.oracle.bmc.ConfigFileReader;
  import com.oracle.bmc.auth.AuthenticationDetailsProvider;
  import com.oracle.bmc.auth.ConfigFileAuthenticationDetailsProvider;
  import com.oracle.bmc.queue.QueueClient;
  import com.oracle.bmc.queue.model.PutMessagesDetails;
  import com.oracle.bmc.queue.model.PutMessagesDetailsEntry;
  import com.oracle.bmc.queue.requests.PutMessagesRequest;
  import com.oracle.bmc.queue.responses.PutMessagesResponse;
  
  import java.io.IOException;
  import java.util.ArrayList;
  import java.util.Arrays;
  
  public class PutMessage {
      public static void main(String[] args) throws IOException {
          final ConfigFileReader.ConfigFile configFile = ConfigFileReader.parse("/Users/ggoggodec/.oci/config","DEFAULT"); //OCI-CLI 설정에 따른 프로파일 선택
          final AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(configFile);
  
          QueueClient client = QueueClient.builder().endpoint("https://cell-1.queue.messaging.ap-seoul-1.oci.oraclecloud.com").build(provider); //큐의 end-point url
  
          PutMessagesDetails putMessagesDetails = PutMessagesDetails.builder().messages(new ArrayList<>(Arrays.asList(PutMessagesDetailsEntry.builder().content("My First Message").build()))).build(); //메시지내용
  
          PutMessagesRequest putMessagesRequest = PutMessagesRequest.builder().queueId("ocid1.queue.oc1.ap-seoul-1.amaaaaaagfm2vwqa6pbm5grcujbjifn4xf4wsol5com3cwsgfdxyu3r262ha").putMessagesDetails(putMessagesDetails).build();
  
          PutMessagesResponse response = client.putMessages(putMessagesRequest);
  
          System.out.println(response.getPutMessages().toString());
      }
  }
```

Consumer 소스 코드

```Java
  package org.example;
  
  import com.oracle.bmc.ConfigFileReader;
  import com.oracle.bmc.auth.AuthenticationDetailsProvider;
  import com.oracle.bmc.auth.ConfigFileAuthenticationDetailsProvider;
  import com.oracle.bmc.queue.QueueClient;
  import com.oracle.bmc.queue.model.GetMessage;
  import com.oracle.bmc.queue.requests.GetMessagesRequest;
  import com.oracle.bmc.queue.responses.GetMessagesResponse;
  
  import java.io.IOException;
  import java.util.List;
  
  public class GetMesssages {
      public static void main(String[] args) throws IOException {
          final ConfigFileReader.ConfigFile configFile = ConfigFileReader.parse("/Users/ggoggodec/.oci/config","DEFAULT"); //OCI-CLI 설정에 따른 프로파일 선택
          final AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(configFile);
  
          QueueClient client = QueueClient.builder().endpoint("https://cell-1.queue.messaging.ap-seoul-1.oci.oraclecloud.com").build(provider); //큐의 end-point url
  
          GetMessagesRequest getMessagesRequest = GetMessagesRequest.builder()
                  .queueId("ocid1.queue.oc1.ap-seoul-1.amaaaaaagfm2vwqa6pbm5grcujbjifn4xf4wsol5com3cwsgfdxyu3r262ha")
                  .visibilityInSeconds(10)
                  .timeoutInSeconds(7)
                  .build();
  
          GetMessagesResponse response = client.getMessages(getMessagesRequest);
          List<GetMessage> messages = response.getGetMessages().getMessages();
          for(GetMessage m : messages){
              System.out.println(m.getContent());
          }
      }
  }
```

### 가격
![](/assets/img/infrastructure/2023/queue/SCR-20230314-numu.png)