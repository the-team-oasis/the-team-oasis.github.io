---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "3월 OCI AI/ML 업데이트 소식"
teaser: "2024년 3월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-aiml
tags:
  - oci-release-notes-2024
  - Mar-2024
  - AI/ML
  - Gen AI
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

## Anomaly Detection End of Life
* **Services:** Anomaly Detection
* **Release Date:** March 7, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/b11b7735-87fa-4d4a-a7ac-d72b95418e86/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/b11b7735-87fa-4d4a-a7ac-d72b95418e86/){:target="_blank" rel="noopener"}

### 서비스 종료 공지 
- 서비스 변경 내용 : Oracle Cloud Infrastructure 의 Anomaly Detection 서비스가 종료 됩니다.
- 종료 공지 일자 : 2024년 3월 7일
- 종료 적용 일자 : 2025년 3월 6일

### 서비스 종료 상세 내용
- 세부 정보 : 2025년 3월 6일부터 Oracle Cloud Infrastructure 의 Anomaly Detection 서비스가 종료됩니다. 종료날짜가 도래하기 전에 Anomaly Detection 서비스를 Data Science 서비스를 사용하도록 변경해야 합니다. 

### Data Science 서비스를 활용하여 이상징후 탐지방법
Oracle Cloud Infrastructure Data Science 서비스 Accelerated Data Science Operator를 사용하여 이상 징후를 탐지할 수 있습니다. 단변량 및 다변량 이상 징후 탐지를 모두 지원합니다.
자세한 내용은 아래 링크를 참조해주세요.
[Anomaly Detection Operator](https://accelerated-data-science.readthedocs.io/en/latest/user_guide/operators/anomaly_detection_operator/index.html){:target="_blank" rel="noopener"}




## Autoscaling for Model Deployments in Data Science is now Available
* **Services:** Data Science
* **Release Date:** March 13, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/8118fa2b-f75d-48ab-ada0-71f10f1dcdf3/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/8118fa2b-f75d-48ab-ada0-71f10f1dcdf3/){:target="_blank" rel="noopener"}

### 업데이트 내용
데이터 사이언스 프로젝트에서 모델을 배치할 때 Autoscaling 설정 포함하여 배포할 수 있습니다.
Autoscaling 구성과 함께 모델 배치하면 얻을 수 있는 몇 가지 주요 이점은 다음과 같습니다:

- Dynamic Resource Adjustment: 자동 스케일링은 실시간 수요에 따라 컴퓨팅 리소스의 수를 자동으로 증가시키거나 감소시킵니다. 이를 통해 배포된 모델이 다양한 부하를 효율적으로 처리할 수 있습니다.
- 비용 효율성: 리소스를 동적으로 조정함으로써 자동 스케일링을 통해 필요한 리소스만 사용(및 비용 지불)할 수 있습니다. 이를 통해 정적 배포에 비해 비용을 절감할 수 있습니다.
- 향상된 가용성: 로드 밸런서와 쌍을 이루는 자동 스케일링은 한 인스턴스에 장애가 발생할 경우 트래픽을 정상적인 인스턴스로 라우팅하여 중단 없는 서비스를 보장합니다.
- 사용자 지정 트리거: 사용자는 [MQL 식](https://docs.oracle.com/iaas/Content/Monitoring/Reference/mql.htm){:target="_blank" rel="noopener"} 을 사용하여 자동 스케일링 쿼리를 사용자 지정할 수 있습니다.
- 로드 밸런서 호환성: 자동 조정 기능은 로드 밸런서와 함께 작동하며, LB 대역폭을 자동으로 조정하여 더 많은 트래픽을 지원하고 최상의 성능을 보장하며 병목 현상을 줄일 수 있습니다.
- Cool-Down Periods(쿨다운 기간): 스케일링 작업 후 자동 스케일러가 추가 작업을 수행하지 않는 정의된 쿨다운 기간이 있을 수 있습니다. 이를 통해 짧은 시간 내에 과도한 스케일링 작업을 방지할 수 있습니다.

![](/assets/img/aiml/2024/release/202403-ds-autoscaling.png " ")

## Burstable Instances for Model Deployment in Data Science is now Available
* **Services:** Data Science
* **Release Date:** March 13, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/4c940c7e-064d-4c7f-81c3-250632f71686/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/4c940c7e-064d-4c7f-81c3-250632f71686/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해서 OCI DataScience 프로젝트에서 모델을 배포할 때 Burstable 인스턴스를 사용할 수 있게되었습니다.

#### 주요 기능
- Burstable Instance for Machine Learning: 유연한 CPU 사용으로 가상 시스템에 머신 러닝 모델을 배포할 수 있습니다.
- 기준 CPU 활용도: OCI는 다양한 워크로드 요구사항에 적합한 일반적인 CPU 기준치 미만을 제공합니다. 옵션은 50% 또는 12.5%이므로 다양한 워크로드 요구사항에 적합합니다. 기계 학습 모델을 배포하는 경우 50% 기준치만 사용할 수 있습니다.
- 서지 기능: 서버 요청이 가끔 급증하는 동안 더 높은 수준으로 급증하여 변화하는 계산 요구에 적응할 수 있습니다.
- 기존 VM과 비교: CPU 리소스가 고정된 기존 VM 인스턴스와 달리 버스트 가능한 인스턴스는 표준 CPU 사용률 수준을 유지합니다.
- 사용자 선택 기준선 및 버스트: 프로비저닝된 CPU 코어의 최대 100%에 해당하는 이 기준선 이상의 CPU 사용량을 일시적으로 증가시킬 수 있는 기능을 통해 사용자가 기준 CPU 활용률을 선택할 수 있습니다.

![](/assets/img/aiml/2024/release/202403-ds-burstable.png " ")




## Speech 2.4 now available
* **Services:** Speech
* **Release Date:** March 19, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/8cda5b24-4b9f-487f-ae92-96597a8ed1a2/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/8cda5b24-4b9f-487f-ae92-96597a8ed1a2/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해서 OCI AI Speech 서비스의 일부 기능이 개선, 추가 되었습니다.

- OpenAI 의 Whisper 모델을 사용하여 transcription 작업을 생성할 수 있게 되었습니다.
- 음성, 비디오 파일의 화자가 여러명 인 경우 구분하여 트랜스크립션 작업을 생성할 수 있게 되었습니다.
- OCI 콘솔에 추가된 transcription 작업 기능 삭제
- transcription 작업 삭제를 위한 새 정책 추가
- transcription 작업 삭제를 위한 새 API 추가
- 화면 둘러보기
  - ![](/assets/img/aiml/2024/release/202403-speech-1.png " ")
  - ![](/assets/img/aiml/2024/release/202403-speech-2.png " ")
  - ![](/assets/img/aiml/2024/release/202403-speech-3.png " ")


### OpenAI Whisper 모델
OpenAI에서 개발한 자동 음성 인식(Automatic Speech Recognition, ASR) 모델로 2022년 9월에 오픈 소스로 공개했으며, 2022년 12월에는 기존 large 모델에서 더욱 개선된 large-v2 모델을 출시했습니다.
Whisper는 680,000시간 분량의 다국어 및 다목적 감독 데이터를 학습했으며, ChatGPT 앱의 음성 인식 기능이 위스퍼 모델을 기반으로 만들어졌습니다.
Whisper 모델은 한국어를 포함한 50개가 넘은 언어를 지원합니다. [Whisper 모델의 지원 언어에 대한 OpenAI 공식문서](https://platform.openai.com/docs/guides/speech-to-text/supported-languages){:target="_blank" rel="noopener"}를 참고하세요

<table class="mXFZ16l9 _240e72fbd1bfec0c20ab498e804ea4f7" style="width:100%; border:2px solid #ddd;" data-dark-style="border:2px solid #010101;" data-v-a685f87a=""><tbody data-v-a685f87a=""><tr style="background-color:#ddd; color:#000;" data-dark-style="background-color:#010101; color:#fff;" data-v-a685f87a="" class="_859676c45c8c9099482a4d9e3ee5ad4b"><td style="width:20%; text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a=""><strong data-v-a685f87a="">크기</strong></div></td><td style="width:20%; text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a=""><strong data-v-a685f87a="">매개변수</strong></div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a=""><strong data-v-a685f87a="">영어 전용 모델</strong></div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a=""><strong data-v-a685f87a="">다국어 모델</strong></div></td></tr><tr data-v-a685f87a=""><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">tiny</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">39 M</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">✓</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">✓</div></td></tr><tr data-v-a685f87a=""><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">base</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">74 M</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">✓</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">✓</div></td></tr><tr data-v-a685f87a=""><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">small</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">244 M</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">✓</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">✓</div></td></tr><tr data-v-a685f87a=""><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">medium</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">769 M</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">✓</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">✓</div></td></tr><tr data-v-a685f87a=""><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">large</div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">1550 M</div></td><td style="text-align:right;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a=""></div></td><td style="text-align:center;" data-v-a685f87a=""><div class="_5ucTZhY4" data-v-a685f87a="">✓</div></td></tr></tbody></table>

출처 :  [나무위키 OpenAI Whisper](https://namu.wiki/w/OpenAI%20Whisper){:target="_blank" rel="noopener"}