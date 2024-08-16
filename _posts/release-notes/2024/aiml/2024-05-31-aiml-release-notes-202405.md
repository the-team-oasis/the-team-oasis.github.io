---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "5월 OCI AI/ML 업데이트 소식"
teaser: "2024년 5월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-aiml
tags:
  - oci-release-notes-2024
  - May-2024
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



## Language 4.0 now available
* **Services:** Language
* **Release Date:** May 10, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/503a52b9-f940-4278-b6d6-71a1da78ca39/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/503a52b9-f940-4278-b6d6-71a1da78ca39/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 새롭게 출시된 OCI Language 4.0은 다음과 같은 기능을 제공합니다.

- 헬스케어 자연어 처리(NLP): 전자의료기록(EHR), 경과 기록, 임상 시험 문서 등에서 엔티티를 추출하는 AI 모델을 제공합니다. 헬스케어 NLP는 다음과 같은 모델들을 포함합니다:
  - 헬스 네임드 엔티티 인식(Health NER): 질병, 약물, 증상, 검사 결과, 치료 등 중요한 의료 정보를 텍스트에서 식별합니다. 
  - 관계 추출: 약물과 용량 간의 관계와 같은 서로 다른 의료 엔티티 간의 관계를 식별합니다. 
  - 명제 탐지: 추출된 엔티티에 대한 상태, 주체, 시간, 확실성 등을 식별합니다. 
  - 의료 엔티티 연결: 추출된 엔티티를 SNOMED-CT와 ICD-10 같은 의학 용어와 코드로 연결합니다.
  ![](/assets/img/aiml/2024/release/202405-language4.avif " ")
- 보호된 건강 정보(PHI) 식별 및 비식별화: PHI 서비스는 기존의 PII 서비스를 확장하여 PHI 엔티티를 탐지하고, 식별된 엔티티를 비식별화하여 익명화하는 옵션을 제공합니다.
  ![](/assets/img/aiml/2024/release/202405-language4-2.jpeg " ")
- 다국어 사전학습 모델: OCI Language의 사전 학습 모델은 이제 다국어 텍스트 처리를 지원합니다. 이미 영어와 스페인어로 감정 분석, 핵심 구문 추출, NER을 지원하며, 이번 릴리스에서는 아랍어, 프랑스어, 독일어, 이탈리아어를 추가 지원합니다.
  ![](/assets/img/aiml/2024/release/202405-language4-3.gif " ")


## Data Science now offers ML Monitoring
* **Services:** Data Science
* **Release Date:** May 16, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/99829a6a-3d48-4c48-b4b8-b069a3129175/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/99829a6a-3d48-4c48-b4b8-b069a3129175/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI Data Science에서 ML Monitoring과 ML Insights에 대한 새로운 기능이 출시되었습니다. 이 도구는 데이터 과학자들이 머신러닝 모델을 효과적으로 관리하고 모니터링할 수 있도록 도와줍니다.
- 내장된 데이터 리더를 사용하여 Object Storage에서 데이터를 읽을 수 있습니다.
- 라이브러리를 확장하여 새로운 데이터 리더를 만들 수 있습니다.
- Conditional Features를 사용하여 데이터를 변환함으로써 데이터에 더 많은 깊이를 추가할 수 있습니다.

ML Monitoring 기능은 두 가지 사용 옵션을 제시하고 있습니다:
- 간편한 방법: 코드를 직접 수정하지 않고 ML Monitoring을 사용하고 싶다면, 서비스에서 관리하는 ML Monitoring Application 컨테이너를 사용할 수 있습니다. 이 컨테이너는 ML Job 내에서 실행되며, 사용자가 별도의 코드 작성 없이 모니터링 기능을 이용할 수 있게 해줍니다.
- 고급 사용자 방법: 더 많은 customization이 필요한 경우, ML Insights Library SDK의 코드를 직접 확장할 수 있습니다. 이를 통해 다음과 같은 사용자 정의 기능을 추가할 수 있습니다:
  - 사용자 정의 데이터 리더: 특정 형식의 데이터를 읽기 위한 custom reader
  - 사용자 정의 메트릭: 특정 비즈니스 요구사항에 맞는 새로운 측정 지표
  - 사용자 정의 후처리기: 분석 결과를 추가로 처리하거나 변환하는 기능


### 관련 문서
- [ML Insights 공식 문서](https://docs.oracle.com/en-us/iaas/tools/ml-insights-docs/latest/ml-insights-documentation/html/index.html){:target="_blank" rel="noopener"}
- [ML Monitoring Application 공식 문서](https://docs.oracle.com/en-us/iaas/tools/ml-monitoring-docs/latest/ml-monitoring-documentation/html/index.html){:target="_blank" rel="noopener"}


## Data Science now Supports Deeplinking inside Data Science Notebook.
* **Services:** Language
* **Release Date:** May 16, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/4ff69dc6-78f0-491d-9c59-5d2f5273f25b/index.htm](https://docs.oracle.com/en-us/iaas/releasenotes/changes/4ff69dc6-78f0-491d-9c59-5d2f5273f25b/index.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
노트북 세션의 Deeplinking 기능은 OCI Data Science 고객들이 기본 위치(Welcome 홈 페이지나 가장 최근 파일 위치)가 아닌 특정 파일 경로에서 노트북 세션을 열 수 있게 해줍니다.
"Deeplinking"의 일반적인 개념, 즉 웹사이트의 특정 콘텐츠로 연결되는 하이퍼링크의 사용을 기반으로, 이 기능을 통해 고객은 특정 파일 경로 컨텍스트의 특정 노트북 세션으로 라우팅되는 링크를 클릭할 수 있습니다.
파일을 공유하기 위해, 고객들은 브라우저 창에서 링크를 복사하거나 파일을 우클릭하여 "공유 가능한 링크 복사"를 선택함으로써 링크를 얻을 수 있습니다.

![](/assets/img/aiml/2024/release/202405-deeplinking.png " ")