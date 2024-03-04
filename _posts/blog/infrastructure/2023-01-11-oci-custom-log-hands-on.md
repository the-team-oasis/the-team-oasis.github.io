---
layout: page-fullwidth
#
# Content
#
subheadline: "Compute"
title: "Compute의 Custom Log 이용하기"
teaser: "Compute의 Custom Log 이용하여 Log 연동하는 방법을 설명합니다."
author: kskim
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, Compute, Custom Log, Log]
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

#### 테스트 환경
아래 내용은 하나의 Compute를 생성하여 httpd를 설치하고, httpd 서버의 Accesss.log를 연동해서 모니터링 화면에 보여질 수 있게 합니다.
- Custom log 활용하여 하나의 compute에 httpd를 설치하고 /va/log/httpd 내 로그 파일 수집하도록 설정합니다.

#### 진행 순서
1. Dynamic Group 생성 하기
2. Log Group 생성 하기
3. Log 에 custom Log 생성 하기
4. Logging에서 Agent Configurations 생성 하기
5. Compute 상세보기에서 “Oracle Cloud Agent” 탭 안에 Custom Logs Monitoring 활성화 하기

#### Dynamic Group 생성 하기
Identity & Security -> Dynamic Groups -> Create Group)

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log1.png " ")

1. Name, Description 입력 후, 적용 할 Matching Rules 만들기 위해서 ”Rule Builder” 클릭 합니다.
2. Create Matching Rule 에서 
  - Include instance that match : ”All of the following” 선택 합니다.
  - Match instance with :   Compartment OCID 선택 후 value에 OCID 입력 합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log2.png " ")

- 입력이 완료된 이후 정책 결과 확인 합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log3.png " ")

#### Log Group 생성 하기
Observability & Management -> Logging -> Log Groups -> Create Log Group 생성 합니다.
- Name, Description 입력 후 생성 합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log4.png " ")

- Log Group 생성이 완료된 화면

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log5.png " ")


#### Log 에 custom Log 생성 하기
Observability & Management -> Logging -> Logs -> Create custom log 클릭 (앞에 만든 로그 그룹에 속한 로그 생성 합니다.)

- "Create Custom log" 클릭 합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log6.png " ")

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log7.png " ")

#### Logging에서 Agent Configurations 생성 하기
Observability & Management -> Logging -> Log Groups -> Agent Configurations -> Create agent config (로그와 custom log 에 매핑을 위해서 생성 합니다.)

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log8.png " ")

- Agent Configuration 완료 이후 상세 정보 및 Log input 관련 정보는 아래와 같습니다. 

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log9.png " ")


#### Compute 상세보기에서 “Oracle Cloud Agent” 탭 안에 Custom Logs Monitoring 활성화 하기.
Compute 에서 custom log 활성화를 위해서는 compute에서 “Oracle Cloud Agent” 가 ”Enable”  되어야 합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log10.png " ")


Custom logs 정상 활성화 이후엔 log path에 설정된 파일 or 디렉토리로부터 log가 수집되며, compute 의 Resources 에  Custom logs 에서 확인이 가능합니다. 

![]({{site.urlblogimg2022_2023}}/assets/img/infrastructure/2023/custom_log/custom_log11.png " ")


### 참고 자료
- [Custom Logs Document](https://docs.oracle.com/en-us/iaas/Content/Logging/Concepts/custom_logs.htm)
- [A simple guide to custom log consolidation using OCI Logging](https://blogs.oracle.com/cloud-infrastructure/post/simple-guide-to-custom-log-consolidation-using-oci-logging)






