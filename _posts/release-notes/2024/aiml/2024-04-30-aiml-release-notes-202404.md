---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "4월 OCI AI/ML 업데이트 소식"
teaser: "2024년 4월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-aiml
tags:
  - oci-release-notes-2024
  - Apr-2024
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

## AI Quick Actions are now Available in Data Science
* **Services:** Data Science
* **Release Date:** April 8, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/c1c57432-d534-4544-9682-2187cfeb2331/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/c1c57432-d534-4544-9682-2187cfeb2331/){:target="_blank" rel="noopener"}

### 업데이트 내용
AI 퀵 액션을 사용하면 재단 모델의 선별된 목록을 쉽게 탐색하고 Data Science 노트북에 배포, 미세 조정 및 평가할 수 있습니다. 활성 노트북 세션이 있는 경우 AI 퀵 액션에 액세스하려면 노트북을 비활성화하고 다시 활성화해야 합니다.
새로운 서비스와 관련된 포스팅에서 더 자세한 내용을 알아보세요

- [OCI AI Quick Action 서비스 둘러보기](/aiml/oci-ai-quick-action-overview/){:target="_blank" rel="noopener"}
- [OCI AI Quick Action 서비스 Hands-on](/aiml/oci-ai-quick-action-handson/){:target="_blank" rel="noopener"}


## Language 3.0 now available
* **Services:** Language
* **Release Date:** April 5, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/f299fe07-fac7-4c16-b38b-6b2aed520dc0/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/f299fe07-fac7-4c16-b38b-6b2aed520dc0/){:target="_blank" rel="noopener"}

### 업데이트 내용
OCI Language 3.0에서 업데이트 된 내용 입니다.

#### 문서 번역 기능 추가
이제 OCI Language를 사용하여 문서 번역을 수행할 수 있습니다. 문서단위로 번역을 하게 되어 한 언어에서 다른 언어로 문서를 쉽고 효율적으로 번역할 수 있습니다.
- 지원되는 문서 형식
<table class="table vl-table-bordered vl-table-divider-col" summary="Document Types"><caption></caption><colgroup><col style="width:50%"><col style="width:50%"></colgroup><thead class="thead">
<tr class="row">
<th class="entry" id="translate-document__entry__1">Document Type</th>
<th class="entry" id="translate-document__entry__2">Extensions</th>
</tr>
</thead><tbody class="tbody">
<tr class="row">
<td class="entry" headers="translate-document__entry__1">Microsoft Office</td>
<td class="entry" headers="translate-document__entry__2">docx, pptx, xlsx</td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__1">HTML</td>
<td class="entry" headers="translate-document__entry__2">.html</td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__1">JSON</td>
<td class="entry" headers="translate-document__entry__2">.json</td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__1">Text</td>
<td class="entry" headers="translate-document__entry__2">.txt</td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__1">CSV</td>
<td class="entry" headers="translate-document__entry__2">Comma-separated values, .csv</td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__1">TSV</td>
<td class="entry" headers="translate-document__entry__2">Tab-separated values, .tsv</td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__1">SRT</td>
<td class="entry" headers="translate-document__entry__2">SubRip Subtitle file, .srt</td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__1">Web VTT</td>
<td class="entry" headers="translate-document__entry__2">Web Video Text Tracks Format, .vtt</td>
</tr>
</tbody></table>

- 화면 둘러보기
  ![](/assets/img/aiml/2024/release/202404-language-1.png " ")
  ![](/assets/img/aiml/2024/release/202404-language-2.png " ")
  ![](/assets/img/aiml/2024/release/202404-language-3.png " ")

더 자세한 내용은 [공식 문서](https://docs.oracle.com/en-us/iaas/language/using/translate-document.htm){:target="_blank" rel="noopener"}를 참고하세요. 

#### 비동기 작업 추가
OCI Language는 백그라운드에서 실행되며 즉각적인 응답이 필요하지 않은 비동기 작업을 수행할 수 있습니다.
이러한 Aysnc 작업을 위해 API가 추가되었습니다.