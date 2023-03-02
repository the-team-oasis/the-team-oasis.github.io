---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "2월 OCI AI/ML 업데이트 소식"
teaser: "2023년 2월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-aiml
tags:
  - oci-release-notes-2023
  - Feb-2023
  - AI/ML
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

## Anomaly Detection now includes Univariate Anomaly Detection, Multivariate Anomaly Detection improvements, and Asynchronous Detection
* **Services:** Anomaly Detection
* **Release Date:** Feb 22, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/03c0171b-502a-4bd3-b37a-93266534fe7d/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/03c0171b-502a-4bd3-b37a-93266534fe7d/){:target="_blank" rel="noopener"}
* **Blog Post:** [https://blogs.oracle.com/ai-and-datascience/post/univariate-anomaly-detection-features](https://blogs.oracle.com/ai-and-datascience/post/univariate-anomaly-detection-features){:target="_blank" rel="noopener"}

### 업데이트 소개
이번 업데이트를 통해 이상 탐지(Anomaly Detection) 서비스에서 단변량 신호에서 다양한 유형의 이상 감지 기능과 다변량 이상 감지 기능 개선, 비동기 이상을 감지할 수 있는 기능이 추가했습니다.

#### 단변량 이상 감지
단변량 이상 탐지(UAD)는 단일 시계열 데이터에서 이상을 식별하는 문제를 말합니다. 단일 시계열 데이터에는 메트릭 또는 측정과 같은 하나의 신호에 대한 타임스탬프 값이 포함됩니다.
이번 업데이트에서는 단변량 신호에서 다양한 유형의 이상(포인트, 집단 및 컨텍스트 이상)을 감지할 수 있는 일변량 신호의 이상 감지에 대한 완전한 지원을 제공합니다.
![](/assets/img/aiml/2023/oci-releasenote-202301-16.png)

##### 지점 이상 감지(Point anomaly detection)
지점 이상 탐지는 데이터 집합의 나머지 데이터와 비교하여 특이한 단일 데이터 지점을 찾습니다.
![](/assets/img/aiml/2023/oci-releasenote-202301-17.png)

##### 집단 이상 감지(Collective anomaly detection)
집단 이상 탐지는 전체 데이터 세트와 비교하여 관련된 이상 데이터 인스턴스를 찾습니다.
![](/assets/img/aiml/2023/oci-releasenote-202301-18.png)

##### 상황별 이상 감지(Contextual anomaly detection)
상황별 이상 탐지는 데이터 포인트와 관련된 상황별 속성에 대해 볼 때 비정상적인 것으로 간주되는 데이터 포인트를 찾습니다. 시간의 맥락에서 또는 계절, 주중, 주말과 같은 시간 관련 개념의 맥락에서 데이터를 보면 그러한 맥락과 직접적으로 관련된 비정상적인 행동을 드러낼 수 있습니다.
![](/assets/img/aiml/2023/oci-releasenote-202301-19.png)

##### 기타 개선 사항 
* 교육 및 평가 모두에 대한 성능 개선
  * 이제 대수 및 초월 함수 평가를 위해 Numpy 대신 NumPy(NumExpr)에 대한 빠른 수치 표현식 평가기를 사용합니다.
  * 함수 평가를 가속화하기 위한 Intel MKL(Math Kernel Library) 지원
* 향상된 감지를 위한 sklearn 쌍별 거리 메트릭 계산의 성능 향상: sklearn 패키지에서 사용되는 루프를 대체하기 위해 단계별 행렬 곱셈을 구현했습니다.
* 대용량 배치 크기(최대 10K)에 대한 효율적인 메모리 처리 구현: 대용량 매트릭스 저장으로 인한 메모리 문제를 방지하기 위해 쌍별 거리를 계산하기 위해 배치 기반 열 처리를 구현했습니다. 
* 전처리 개선
  * 사분위수 범위(IQR) 기반 이상값 감지 및 제거
  * 추세 및 계절성 분해: Loess(STL) 또는 선형 디트렌딩을 사용한 계절성 추세 분해
* 자동 하이퍼파라미터 튜닝을 사용한 OCSVM(one-class support vector machine)에 대한 커널 개선: 주기성 감지 및 자기상관 기능과 휴리스틱 기반 주파수 감지기를 사용한 동적 창 크기 선택.
* 탐지 중 사후 처리 개선: 창 크기 데이터 포인트를 초과하는 과도한 플래그 지정을 방지하기 위해 창 크기보다 큰 그룹에서 연속적으로 나타나는 변칙을 억제하여 과도한 변칙을 제거합니다.
* 사용자 지정 조정: 탐지에 추가된 민감도 매개변수를 사용하면 재교육할 필요 없이 적절한 임계값을 선택하여 플래그가 지정된 이상 항목 수를 조정할 수 있습니다.

### 다변량 이상 탐지 MSET2
이번 업데이트는 MSET2 Multivariate AD 커널을 도입하여 비동기식 감지로 대규모 배치 크기 호출을 지원하도록 개선되었습니다.특히 예후(prognostics) 사용 사례에 대한 감지 정확도가 크게 향상되었습니다. 이 기능은 감시 기반 이상 감지 사용 사례에서 아래의 세부 정보를 사용하여 과거 상태 컨텍스트에서 이상을 감지하는 데 도움이 됩니다.
* 비동기 감지를 사용하는 다변량 MSET에 대한 명시적 옵션을 사용하여 서비스를 호출합니다.
* 서비스는 내부적으로 적절하게 큰 배치 크기를 사용하여 누적 합계를 기반으로 상태를 계산합니다.
* 이 가용성은 과거 컨텍스트를 유지함으로써 향상된 성능을 제공하므로 동기식 감지와 비교할 때 알람 누락 비율이 낮아집니다.
  ![](/assets/img/aiml/2023/oci-releasenote-202301-20.png)

### 비동기 감지
고객은 이제 대규모에서 초대형 데이터 세트(1억~10억 개의 데이터 포인트)에 대해 Asynchronous Detection API를 사용할 수 있습니다. 

**이 API에 포함된 기능은 아래와 같습니다.**
* 기존 Anomaly Detection 서비스 기능 확장
  * 대규모 데이터 세트 지원(30K 데이터 포인트에서 1억+ 데이터 포인트까지)
  * 최대 1000개 이상의 신호로 교육 데이터 지원(요청 시 사용 가능)
  * 창 크기 및 메모리 벡터와 같은 더 나은 모델 특성으로 모델 훈련을 가능하게 하여 높은 모델 정확도
* 인라인 입력 또는 OCI Object Storage의 객체 목록을 허용합니다. 다양한 입력 모드는 서비스에 온보딩하기 전에 유연성을 제공합니다.
* 대규모 데이터 세트에서 이상 탐지를 수행하기 위해 맞춤형 앱을 개발할 필요가 없습니다.
* 지속적인 모델 개선을 위해 자동화된 사전 처리, 재교육 및 실측 정보 통합과 같은 더 많은 기능을 제공하도록 확장할 수 있습니다.

**기타 비동기 감지 관련 개선 사항은 아래와 같습니다.**
* 중간 데이터 암호화
* 로드 밸런싱: 로드 밸런싱을 위한 K8s 클러스터 내 네트워크 라우팅을 위한 IPVS(IP 가상 서비스)
* 데이터베이스 쿼리의 병렬 요청 처리: 병렬 요청을 처리하기 위한 데이터베이스 쿼리의 낙관적 잠금
* Pod 수평 및 클러스터 자동 크기 조정


## Data Science notebook session JupyterLab interface enhancements
* **Services:** Data Science
* **Release Date:** Feb 22, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/495d89ee-8561-4094-a19d-653200fb5f45/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/495d89ee-8561-4094-a19d-653200fb5f45/){:target="_blank" rel="noopener"}

### 업데이트 소개
- 더 나은 성능을 위해 아이콘 캐시 메커니즘과 시작하기 노트북이 별도의 단추로 업데이트되었습니다. 시작 프로그램 시작 섹션 정보가 Environment Explorer 및 노트북 탐색기에 대한 링크, 설정 및 설명서를 포함하도록 업데이트되었습니다.
  ![](/assets/img/aiml/2023/oci-releasenote-202301-14.png)
- GitHub에서 예제 노트북에 대한 정보를 받도록 Notebook Explorer가 업데이트 되었으며 인터넷에 액세스할 수 없는 경우 개체 저장소 위치로 백업됩니다. Example Notebook 카드는 노트북 설명, 제목 및 개발된 콘도를 보여줍니다. [Example Notebook 링크](https://github.com/oracle-samples/oci-data-science-ai-samples/tree/master/notebook_examples){:target="_blank" rel="noopener"}
  ![](/assets/img/aiml/2023/oci-releasenote-202301-15.png)
