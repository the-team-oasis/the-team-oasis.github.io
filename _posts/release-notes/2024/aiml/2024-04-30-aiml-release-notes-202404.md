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
<table class="table vl-table-bordered vl-table-divider-col" summary="Document Types"><caption></caption><thead class="thead">
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

- 알려진 이슈 및 제약사항
<table class="table vl-table-bordered vl-table-divider-col" summary="Limitations"><caption></caption><thead class="thead">
<tr class="row">
<th class="entry" id="translate-document__entry__19"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">한정</font></font></th>
<th class="entry" id="translate-document__entry__20"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">추천</font></font></th>
</tr>
</thead><tbody class="tbody">
<tr class="row">
<td class="entry" headers="translate-document__entry__19">
<p class="p"><strong class="ph b"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">원본 콘텐츠의 품질</font></font></strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> : 이는 번역 품질에 영향을 미칠 수 있습니다. 번역 품질을 저하시킬 수 있는 고려해야 할 주요 영역은 다음과 같습니다.</font></font></p>
<ul class="ul">
<li class="li"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">약어, 철자 오류, 구두점 부족이 포함된 소스</font></font></li>
<li class="li"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">긴 문자열(&gt;20단어) 및 매우 짧은 문자열(1단어 또는 2단어 문자열)</font></font></li>
</ul>
</td>
<td class="entry" headers="translate-document__entry__20"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">철자 오류, 구두점 오류 및 문자열 길이가 있는지 소스 콘텐츠를 확인하세요.</font></font></td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__19"><strong class="ph b"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">컨텍스트 및 도메인별 용어 또는 명명된 엔터티:</font></font></strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> 콘텐츠에 특정 용어 또는 명명된 엔터티(사람 이름, 회사 이름, 브랜드 이름)가 포함되어 있는 경우 당사의 일반 번역 모델은 사용 사례의 요구 사항을 충족하기 위해 이 콘텐츠를 번역하지 못할 수 있습니다.</font></font></td>
<td class="entry" headers="translate-document__entry__20">
<p class="p"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">번역을 제어하고 사용 사례에 맞는 용어를 일관되게 번역하려면 용어집 기능을 사용하는 것이 좋습니다.</font></font></p>
</td>
</tr>
</tbody></table>

- 번역 제어 기능 (용어집)
  - 문서 번역을 사용하면 용어집 파일이나 특정 파일 속성을 사용하여 고급 속성을 통해 번역을 제어하고 사용자 정의할 수 있습니다. 용어집은 번역을 제어하기 위해 문서 번역 서비스 내에서 사용할 수 있는 사용자 제공 용어 목록입니다. 용어집을 사용하여 특정 용어를 번역하거나 번역하지 않는 방법을 지정할 수 있습니다.
  - 용어집의 주요 사용 사례는 다음과 같습니다. 
    - 상황별 및 분야별 용어가 콘텐츠 전반에 걸쳐 일관되게 번역되도록 합니다. 
    - 번역에서 특정 용어나 단어를 제한합니다. 예를 들어 번역하고 싶지 않은 브랜드 또는 제품 이름입니다. 
    - 파일 유형별 속성을 사용하면 번역되는 파일 요소를 선택적으로 제어할 수 있습니다. 예를 들어 CSV 파일에서 번역할 열 또는 JSON 파일에서 번역할 요소입니다.

<table class="table vl-table-bordered vl-table-divider-col" summary="Advanced properties"><caption></caption><colgroup><col style="width:50%"><col style="width:50%"></colgroup><thead class="thead">
<tr class="row">
<th class="entry" id="translate-document__entry__25"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">고급 속성</font></font></th>
<th class="entry" id="translate-document__entry__26"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">설명</font></font></th>
</tr>
</thead><tbody class="tbody">
<tr class="row">
<td class="entry" headers="translate-document__entry__25"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">용어집</font></font></td>
<td class="entry" headers="translate-document__entry__26">
<p class="p"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">특정 단어가 다르게 번역될 수 있는 작업별로 사용자 정의 용어를 지정할 수 있습니다. 용어집은 헤더 없이 쉼표로 구분된 값(CSV)으로 제공될 수 있습니다.</font></font></p>
<p class="p"><strong class="ph b"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">고급 속성의 샘플 값:</font></font></strong></p>
<p class="p"><code class="ph codeph">{"translation":{"glossary": {"type": "bucket","bucketDetails": {"bucketName": "source-bucket", "namespace": "idngwwc5ajp5","prefix": "glossary_text.csv"}}}}</code></p>
<p class="p"><strong class="ph b"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">샘플 용어집 csv 파일 콘텐츠(예: </font></font><code class="ph filepath">glossary_text.csv</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">):</font></font></strong></p>
<pre class="pre codeblock"><code>India,India<font></font>
Oracle,Oracle<font></font>
Oracle Cloud Infrastructure,Oracle Cloud Infrastructure<font></font>
Oracle NetSuite,Oracle NetSuite</code></pre>
</td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__25"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">CSV</font></font></td>
<td class="entry" headers="translate-document__entry__26"><p class="p"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">헤더가 있는지 여부와 번역할 열을 지정합니다.</font></font></p><ul class="ul">
<li class="li"><code class="ph codeph">columnsToTranslate</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">: 번역할 열의 인덱스(1부터 시작)입니다.</font></font></li>
<li class="li"><code class="ph codeph">hasHeaders</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">: csv에 헤더가 있는지 여부를 지정합니다. True인 경우 첫 번째 행은 번역되지 않은 상태로 남습니다.</font></font></li>
</ul><p class="p"><strong class="ph b"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">예</font></font></strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> :</font></font></p><code class="ph codeph">{"translation":{"csv":{"columnsToTranslate":[2],"hasHeaders":false}}}</code></td>
</tr>
<tr class="row">
<td class="entry" headers="translate-document__entry__25"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">JSON</font></font></td>
<td class="entry" headers="translate-document__entry__26"><p class="p"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">번역하려면 번역할 요소를 지정하세요.</font></font></p><p class="p"><strong class="ph b"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">예</font></font></strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> :</font></font></p><code class="ph codeph">{"translation":{"json":{"filter":"path","pathsToTranslate":["jsonData.title","jsonData.existingSkills","jsonData.structured.experience[*].role"]}}}</code></td>
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