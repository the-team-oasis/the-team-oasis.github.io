---
layout: page-fullwidth
#
# Content
#
subheadline: "Release Notes 2022"
title: "12월 OCI AI/ML 업데이트 소식"
teaser: "2022년 12월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2022-aiml
tags:
  - oci-release-notes-2022
  - dec-2022
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

## Data Science notebook session timeout change
* **Services:** Data Science
* **Release Date:** Dec 16, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/b238dd71-4ad4-4b31-a08c-2df89b2b84f6/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/b238dd71-4ad4-4b31-a08c-2df89b2b84f6/){:target="_blank" rel="noopener"}

### 업데이트 내용
사용자의 계정 (테넌시)에서 허용하는 최대 시간까지 노트북 세션을 연장할 수 있는 옵션 하나만 있도록 프로세스가 간소화 되었습니다. 
이전에는 다른 연장할 시간을 선택하여 선택한 시간만큼만 노트북 세션 시간을 연장할 수 있었지만, OCI 사용자의 피드백에 따라 콘솔의 기능을 변경했습니다.

* 기존 세션 연장 화면 예시
  ![](/assets/img/aiml/2022/release-note/notebook-session-1.png)
* 신규 세션 연장 버튼
  ![](/assets/img/aiml/2022/release-note/notebook-session-2.png)
* 세션 연장 결과 예시
  ![](/assets/img/aiml/2022/release-note/notebook-session-3.png)


## Document Functionality is Moving to a New Service
* **Services:** Vision
* **Release Date:** Dec 8, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/a4237954-f6f2-4896-b3af-ae11aaa90d73/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/a4237954-f6f2-4896-b3af-ae11aaa90d73/){:target="_blank" rel="noopener"}


### 업데이트 내용
2022년 11월에 런칭된 신규 Document AI 서비스로 인해 기존 AI Vision의 Document 관련 서비스가 Document Understanding 서비스로 이관되었습니다.
영향을 받는 AI VIsion 기능은 아래 목록과 같습니다.
- Table detection
- Document classification
- Receipt key-value extraction
- Document OCR

기존 AI Vision의 Document 관련 기능은 <mark><b>2024년 1월 1일까지 제공 되며, 이후에는 Document Understanding을 통해서만 서비스를 사용할 수 있습니다.</b></mark>
