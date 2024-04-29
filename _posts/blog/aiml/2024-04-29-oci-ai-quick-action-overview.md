---
layout: page-fullwidth
#
# Content
#
subheadline: "Data Science"
title: "OCI AI Quick Action 서비스 둘러보기"
teaser: ""
author: yhcho
date: 2024-04-29 00:00:00
breadcrumb: true
categories:
  - aiml
tags:
  - [oci, data science, generative ai, gen ai, aqua, ai quick action, ai, llm]
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

# -------------- 내용 필독 -------------------
# 작성할 내용은 아래부터 작성
# 작성 방법
# 각 챕터별 제목은 "###"로 시작한다.
# 하위 제목은 "####"로 시작한다.
# 이미지는 images 폴더안에 Category(getting-started, infrastructure, platform, database, aiml)에 넣고 사용 시 "../../images/카테고리명/이미지" 형태로 참조한다.
# Bold는 **글자**
# Bold + Italic은 ***글자***
# ------------------------------------------
---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

## OCI AI Quick Action 서비스 소개
AI Quick Actions(AQUA)는 AI의 기능을 빠르게 활용하려는 사용자를 대상으로 OCI Data Science 서비스를 통해 Foundation 모델을 배포, 평가 및 Fine-tuning 하는 데 함께 사용할 수 있는 일련의 작업을 간소화 한 서비스 입니다.
이 기능은 Foundation 모델을 더 많은 사용자에게 제공하기 위해 코드가 필요 없고 효율적인 환경에서 기초 모델을 사용할 수 있는 간소화된 환경을 제공합니다. AI Quick Action(AQUA)은 OCI Data Science 노트북에서 액세스할 수 있습니다.

### AI Quick Action 기능 둘러보기

- AI Quick Action 메뉴 위치
  - AI Quick Action 메뉴는 노트북 세션에 접속하면 Launcher 페이지에서 확인하실 수 있습니다.
  - 메뉴 확인을 위해 정책 작성이 필요하며, 작성 후 세션을 비활성화 후 다시 활성홯 하여 확인할 수 있습니다. (또는 정책 작성 후 생성된 세션에서 확인 가능)
    ![](/assets/img/aiml/2024/aqua/aqua-overview-1.png " ")

- AI Quick Action (AQUA) 메인 화면
  - 기본 화면에서는 AQUA에서 제공되는 Foundation 모델을 확인할 수 있습니다.
  - `Ready To Deploy`, `Ready To Fine Tune` 뱃지를 통해 배포 또는 Fine-tune 가능한 모델을 확인할 수 있습니다.
  - Fine tunning한 모델은 Fine-tuned models 탭에서 확인할 수 있습니다.
  ![](/assets/img/aiml/2024/aqua/aqua-overview-2.png " ")
- 모델 배포 화면
  - 배포하고자 하는 모델을 클릭하면 해당 모델의 세부정보를 확인할 수 있는 페이지로 이동합니다.
  - 페이지 우측 상단 `Deploy` 버튼을 클릭하면 모델을 배포할 수 있습니다.
    ![](/assets/img/aiml/2024/aqua/aqua-overview-3.png " ")
  - 모델 배포 이름, Compute Shape 등 간단한 정보만 입력 후 모델을 배포할 수 있습니다.
    ![](/assets/img/aiml/2024/aqua/aqua-overview-4.png " ")
- 모델 Fine-Tune 화면
  - Fine-tune 하고자 하는 모델을 클릭하면 해당 모델의 세부정보를 확인할 수 있는 페이지로 이동합니다.
  - 페이지 우측 상단 `Fine Tune` 버튼을 클릭하면 모델을 Fine-tune 할 수 있습니다.
    ![](/assets/img/aiml/2024/aqua/aqua-overview-3.png " ")
  - Fine-tune 을 위한 정보들을 입력, 선택 후 Fine-tune을 진행할 수 있습니다.
    ![](/assets/img/aiml/2024/aqua/aqua-overview-5.png " ")
    ![](/assets/img/aiml/2024/aqua/aqua-overview-6.png " ")
    ![](/assets/img/aiml/2024/aqua/aqua-overview-7.png " ")
    ![](/assets/img/aiml/2024/aqua/aqua-overview-8.png " ")
    ![](/assets/img/aiml/2024/aqua/aqua-overview-9.png " ")
    ![](/assets/img/aiml/2024/aqua/aqua-overview-10.png " ")
  - Fine-tune 결과는 Fine-tuned models 탭에서 확인할 수 있습니다.
    ![](/assets/img/aiml/2024/aqua/aqua-overview-11.png " ")
- 모델 평가 기능
  - 배포한 모델을 평가할 수 있는 작업을 간단하게 생성할 수 있는 기능을 제공합니다.
  - 간단한 평가 결과는 화면에서 바로 확인 가능하며, Report를 통해 더 자세한 결과를 확인할 수 있습니다.
    ![](/assets/img/aiml/2024/aqua/aqua-overview-20.png " ")
    ![](/assets/img/aiml/2024/aqua/eval-7.png " ")



