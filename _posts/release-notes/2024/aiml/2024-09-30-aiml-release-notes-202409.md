---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "12월 OCI AI/ML 업데이트 소식"
teaser: "2024년 12월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-aiml
tags:
  - oci-release-notes-2024
  - Dec-2024
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

## Vision Service now Supports Stored Video Analysis
* **Services:** Vision
* **Release Date:** December 17, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/vision/stored-video.htm](https://docs.oracle.com/en-us/iaas/releasenotes/vision/stored-video.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
**OCI Vision 서비스**를 사용하면 **저장된 비디오(Stored Video)**를 분석하여  
각 프레임에서 **레이블(Label) 식별, 이미지 분류(Classification), 객체(Object) 및 얼굴(Face) 감지**를 수행할 수 있습니다.

#### **비디오 업로드 옵션**
비디오를 처리하기 위해 **두 가지 업로드 방법**을 제공합니다:
1. **로컬 저장소(Local Storage)**에서 비디오 업로드
2. **오브젝트 스토리지(Object Storage)**에서 비디오 업로드

#### **지원 기능 (Supported Features)**
- [**레이블 감지 (Label Detection)**](https://docs.oracle.com/iaas/Content/vision/using/stored_video_analysis.htm#pretrained_video_label_detection)
- [**객체 감지 (Object Detection)**](https://docs.oracle.com/iaas/Content/vision/using/stored_video_analysis.htm#pretrained_video_object_detection)
- [**텍스트 감지 (Text Detection)**](https://docs.oracle.com/iaas/Content/vision/using/stored_video_analysis.htm#pretrained_video_text_detection)
- [**얼굴 감지 (Face Detection)**](https://docs.oracle.com/iaas/Content/vision/using/stored_video_analysis.htm#pretrained_video_face_detection)

또한, **사전 학습된 모델(Pretrained Models)**을 사용할 수도 있으며,  
사용자가 직접 **맞춤형 모델(Custom Models)**을 학습하여 비디오를 처리할 수도 있습니다.

#### **지원 리전 (Stored Video Analysis 지원 리전)**

| **리전 이름**         | **위치**       | **리전 식별자 (Region Identifier)** | **리전 키 (Region Key)** |
|----------------------|-------------|---------------------------------|----------------------|
| **미국 동부 (Ashburn)** | 애쉬번, VA   | `us-ashburn-1`                 | `IAD`                |
| **영국 남부 (London)** | 런던         | `uk-london-1`                   | `LHR`                |
| **미국 서부 (Phoenix)** | 피닉스, AZ   | `us-phoenix-1`                  | `PHX`                |


#### **추가 정보**
OCI Vision 서비스에 대한 자세한 내용은 [**공식 문서**](https://docs.oracle.com/iaas/Content/vision/using/overview.htm)를 참고하세요.

![](/assets/img/aiml/2024/release/202407-genai-finetune-r.png " ")