---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "OCI GoldenGate Trail File 관리 방법"
teaser: "OCI 의 GoldenGate 에서는 Trail File 을 통해 SOURCE DB 의  변경 사항을 TARGET DB 에 전달합니다. Trail File 이 쌓이는 것을 방지하기 위해 Purge 기능을 제공합니다. 이러한 Purge 기능을 설정하는 방법을 알아봅니다."
author: lim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, oracle, goldengate, dbcs, replication, cdc]
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

### OCI GoldenGate Trail File 관리
OCI GoldenGate 는 SOURCE DB 의 변경 사항을 캡쳐하여 TARGET DB 로 전달하기 위해 Trail File 이라는 것을 사용합니다. 이 Trail File 이 무엇이며 어떻게 관리하는지 알아보도록 하겠습니다.
<br>

### GoldenGate Trail File 이란?
GoldenGate 추출 프로세스는 비디오 레코더와 같습니다. 원본 데이터베이스에서 트랜잭션 데이터를 읽고 OCI GoldenGate 트레일 파일에 데이터를 기록합니다. 이는 OCI GoldenGate가 트랜잭션을 재생할 수 있도록 캡처된 데이터를 보존하는 비디오 테이프와 같습니다.  
<br>
GoldenGate Trail File은 GoldenGate 에서 정의한 고유한 바이너리 형식을 사용합니다. Trail File에는 복제에 필요한 데이터베이스 시간대, 문자 집합 및 메타데이터 정보가 포함됩니다.

- Trail File 에 담겨진 내용 샘플

![Trail File example]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/goldengate/01_oci_goldengate_trail_file_example.png)

### Trail File 생성
Trail File 은 Extract 프로세스를 생성할때 어떤 파일로 만들 것인지, 파일의 사이즈는 얼마정도까지 만들 것인지를 Extract (추출) 프로세스를 만들때 정의해 줍니다. 파일의 사이즈를 조정하지 않을 경우 Default 로 500 MB 사이즈 단위로 파일을 만듭니다.

- Extract 프로세스에서 Trail File 명 및 사이즈 정의

![Trail File Define]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/goldengate/02_oci_goldengate_trail_file_define.png)

<br>

### Trail File 조회
Extract Process 가 동작을 하면 Trail File 이 생성되며  생성된 Trail File 은 OCI GoldenGate 의 Deployments 화면에서 조회가 가능합니다. 
아래의 GoldenGate Deployment 상세 화면을 아래로 스크롤 다운 하면 Trail Files 라는 메뉴가 나타납니다. 해당 메뉴를 클릭하면 GoldenGate Deployment 서버내에 생성되어 있는 Trail File 들을 조회하실 수 있습니다.

- OCI GoldenGate Deployment 상세 화면

![Trail File Define]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/goldengate/03_oci_goldengate_deployment.png) 

- Trail File 메뉴 선택 (OCI GoldenGate Deployment 상세 화면 스크롤 다운)

![Trail File list]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/goldengate/04_oci_goldengate_trail_file_menu.png) 

<br>

### Trail File Purge
생성된 Trail File 들은 파일 사이즈가 생성 시 설정한 사이즈를 넘기게 되면 또 다른 Trail 파일을 만들게 됩니다. 이렇듯 오래된 Trail File 들이 쌓이게 되어 OCI GoldenGate 가 Deploy 된 서버의 Disk 용량이 Full 차게 되면 GoldenGate 서비스가 제대로 동작을 하지 않을 수 있습니다. 이러한 Trail File 들을 정리하기 위해 Purge 작업을 GoldenGate Admin Console 에서 설정해서 자동으로 정리하도록 TASK 를 설정하실 수 있습니다.

- OCI GoldenGate Admin Console 로그인

![GGADMIN]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/goldengate/05_oci_goldengate_admin_console.png) 

- Configuration -> TASKS 메뉴에서 "+" 버튼 클릭

![GGADMIN]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/goldengate/06_oci_goldengate_trail_file_purge_01.png)

- Purge Trail Task 에 대해 정의

  아래 화면처럼 Operation 이름과 Purge 할 Trail File을 명기하여 "+" 를 클릭하여 추가합니다.
  - Operation Name : E1TrailPurge
  - Trail : E1
  - Keep Rule : Days : 1 (최소 하루동안 파일 유지)
  - Purge Frequency : Days : 1 (하루 한번씩 수행)
  
![GGADMIN]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/goldengate/07_oci_goldengate_trail_file_purge_02.png)

### Trail File Purge TASK 
앞단계에서 생성한 Trail File에 대한 Purge TASK 에 대한 정의 화면은 아래와 같습니다.

- 정의된 Trail File Purge TASK 목록

![GGADMIN]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/goldengate/08_oci_goldengate_trail_file_purge_task.png)

정의된 Trail File Purge TASK 가 동작을 하게 되면 수행한 결과를 "Purge Tasks" 메뉴에서 확인하실 수 있습니다.

- Purge Tasks 수행 결과 확인

![GGADMIN]({{site.urlblogimg2022_2023}}/assets/img/dataplatform/2023/goldengate/09_oci_goldengate_trail_file_purge_task_result.png)

<br>
이상 OCI GoldenGate 에서는 자동으로 Trail File 을 Purge 하는 기능에 대해서 알아봤습니다. OCI GoldenGate 에서는 기본적으로 생성되는 Trail File 을 삭제하지 않기 때문에 Purge TASK 를 정의하여 정리하는 작업을 만들어 주어야 합니다. 이러한 Purge 기능을 통해 GoldenGate 서버의 Disk 가 모두 소진되는 오류를 사전에 방지하실 수 있습니다.

<br>

---

