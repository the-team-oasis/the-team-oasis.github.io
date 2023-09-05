---
layout: page-fullwidth
#
# Content
#
subheadline: "Release Notes 2022"
title: "11월 OCI AI/ML 업데이트 소식"
teaser: "2022년 11월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2022-aiml
tags:
  - oci-release-notes-2022
  - nov-2022
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

## Addition of new regions
* **Services:** Anomaly Detection
* **Release Date:** Nov 6, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/16ab7f97-37da-4957-b1f8-a4157ad8fbd3/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/16ab7f97-37da-4957-b1f8-a4157ad8fbd3/){:target="_blank" rel="noopener"}

### 업데이트 내용
Anomaly Detection 서비스가 이제 아래 Region에서도 사용하실 수 있게 되었습니다.
- Spain Central (Madrid)

For more information about Anomaly Detection and features in Cloud regions, see:
- [Anomaly Detection](https://docs.oracle.com/iaas/Content/anomaly/using/home.htm)
- [Regions and Availability Domains](https://docs.oracle.com/iaas/Content/anomaly/using/overview.htm#regions)
- [OCI Data Regions](https://www.oracle.com/cloud/data-regions/#lad)


## Data Science now connects to Data Flow
* **Services:** Data Science
* **Release Date:** Nov 15, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/1ad72b97-333a-441c-bfd5-47982040bc10/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/1ad72b97-333a-441c-bfd5-47982040bc10/){:target="_blank" rel="noopener"}


### 서비스 소개
Data Science를 통해서 OCI Data Flow 클러스터를 손쉽게 생성하고, 쿼리할 수 있도록 연계가 되었습니다.

### 신규 변경 사항
Data Science 와 Data Flow 통합은 완전히 관리되는 Jupyter 노트북을 사용하여 데이터 과학자와 데이터 엔지니어가 데이터 엔지니어링 및 데이터 과학 애플리케이션을 생성, 시각화, 협업 및 디버그할 수 있도록 합니다. Python, Scala 및 PySpark에서 이러한 애플리케이션을 작성할 수 있습니다. Data Science 노트북 세션을 Data Flow에 연결하여 애플리케이션을 실행할 수도 있습니다. Data Flow 스튜디오 Kernal 및 애플리케이션은 Oracle Cloud Infrastructure Data Flow에서 실행됩니다.

* Data Sicence notebook - Data Flow 연계 흐름도
![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/03.oci-data_flow-data_science-integration.png)

* Data Science notebook 의 Conda Environment 세팅
![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/04.oci-data_flow-data_science-integration-2.png)

* Data Science notebook session 에서 Data Flow Spark Cluster 생성 요청
![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/05.oci-data_flow-provisioning.png)

* Data Flow 의 Data Source 인 Object Storage 의 CSV 파일을 SQL 로 쿼리
![](/assets/img/dataplatform/2022/release-note/db-bigdata/2022/11/06.oci-data_flow-object-storage-query.png)

### 제한사항
* Data Flow 세션의 지속 시간은 최대 7일 또는 10,080분 입니다.
* Data Flow 세션의 기본 idle timeout 값은 480분(8시간)이며, 다른 값을 설정할 수 있습니다.
* Data Flow 세션은 Data Science Notebook 세션을 통해서만 사용할 수 있습니다.
* 현재 Spark version 3.2.1 만 지원됩니다.

## Document Understanding is now Available
* **Services:** Document Understanding
* **Release Date:** Nov 22, 2022
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/5cb955f4-7e93-4aaa-a07d-6b8556c28f91/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/5cb955f4-7e93-4aaa-a07d-6b8556c28f91/){:target="_blank" rel="noopener"}

### 서비스 소개
OCI Document Understanding 서비스는 기존 AI Vision의 Document 관련 기능이 별도의 서비스로 런칭되었습니다.

### 서비스 주요 내용
[Document Understanding](https://docs.oracle.com/iaas/document-understanding/document-understanding/using/home.htm){:target="_blank" rel="noopener"}은 개발자가 API와 명령줄 인터페이스 툴을 통해 문서 파일에서 텍스트, 테이블 등 주요 데이터를 추출할 수 있는 AI 서비스입니다.
Document Understanding을 사용하면 사전 구축된 AI 모델로 반복적이고 지루한 업무 처리 작업을 자동화하고 업무별 요구에 맞게 문서 추출을 사용자 지정할 수 있습니다. Document Understanding 서비스에서는 아래와 같이 사전 훈련된 모델이 지원됩니다:

- 광학 문자 인식(OCR): 문서 이해(Document Understanding)는 문서의 텍스트를 감지하고 인식할 수 있습니다.
- 텍스트 추출 (Text extraction): 문서 이해(Document Understanding)는 단어 수준과 줄 수준 텍스트, 텍스트가 위치한 경계 상자 좌표를 제공합니다.
- 키 값 추출 (Key-value extraction): 문서 이해(Document Understanding)는 영수증, 송장, 여권 및 운전자 ID에서 미리 정의된 키-값 쌍 정보 목록을 추출합니다.
- 테이블 추출 (Table extraction): 문서 이해(Document Understanding)는 셀의 행 및 열 관계를 유지하면서 표 형식으로 내용을 추출합니다.
- 문서 분류 (Document classification): 문서 이해(Document Understanding)는 시각적 모양, 고급 기능 및 추출된 키워드를 기준으로 문서를 여러 유형으로 분류합니다. 예를 들어 송장, 영수증 및 이력서와 같은 문서 유형이 있습니다.
- 광학 문자 인식 (OCR - Optical Character Recognition) PDF: 문서 이해는 개체 저장소에 검색 가능한 PDF 파일을 생성합니다.

### 제한사항
기존 AI Vision 서비스와 동일하게 현재는 영어만 공식적으로 지원하고 있습니다. 그 외의 제한사항은 아래 테이블을 참조하세요

<table class="table vl-table-bordered vl-table-divider-col" id="limits__table_limits" summary="What has a limitation and what the limits are."><caption><span class="title">Limits for <span class="ph">Document Understanding</span></span></caption><colgroup><col><col></colgroup><thead class="thead">
<tr class="row">
<th class="entry align-left" id="limits__table_limits__entry__1">Limit</th>
<th class="entry align-left" id="limits__table_limits__entry__2">Limit Value</th>
</tr>
</thead><tbody class="tbody">
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Accepted File Formats</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">JPEG, PNG, PDF, and TIFF</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Maximum File Size</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">500 MB per document</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Maximum Document Count (Console)</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">Single request of five pages or fewer, and of no more than 8 MB in
                  size.</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Maximum Document Count (API)</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">
<ul class="ul">
<li class="li">2,000 pages per document</li>
<li class="li">Each job can have 2,000 documents or fewer, or 500 KB or less in the body of
                      the request</li>
</ul>
</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Minimum Resolution</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">32 x 32 pixels</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Maximum Resolution</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">10,000 x 10,000 pixels</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Text Alignment</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">Text can be text aligned horizontally within the document. Vertical text
                  alignment within the document isn’t supported.</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Languages</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">OCR supports English.</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Character Size</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">The minimum height for text to be detected is 15 pixels. At 150 DPI, the height
                  is the same as eight-point font.</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Character Type</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">Handwritten character and printed character recognition are supported.</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Characters</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">
<ul class="ul">
<li class="li">a - z</li>
<li class="li">A - Z</li>
<li class="li">0–9</li>
<li class="li">% } + ~ ^ = * ; ÷ _ ( € &lt; , " @ # ¤ £ ¢ / § ? ] . ¥ &gt; ₹ - ® ` ! © &amp; $ \
                      ' { \\ [ | ) :</li>
</ul>
</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Maximum Number of Asynchronous Jobs in Pending State Allowed in a
                  Tenancy</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">200</td>
</tr>
<tr class="row">
<td class="entry align-left" headers="limits__table_limits__entry__1">Maximum Number of Asynchronous Transactions  Allowed per Minute in a
                  Tenancy</td>
<td class="entry align-left" headers="limits__table_limits__entry__2">300</td>
</tr>
</tbody></table>

### Document Understanding를 통해 Document 이미지의 Key-Value 라벨링 (2023-01 추가된 기능)
* Data Labeling 서비스에서 데이터 셋 생성 (Document Labeling, Key-Value 선택)
![]({{site.urlblogimg2022_2023}}/assets/img/aiml/2022/release-note/document-1.png)

* Datasets의 Label 추가 (Key값)
![]({{site.urlblogimg2022_2023}}/assets/img/aiml/2022/release-note/document-2.png)

* 생성된 레코드 라벨링 (Value 텍스트를 먼저 선택하고 우측에서 라벨 선택함)
![]({{site.urlblogimg2022_2023}}/assets/img/aiml/2022/release-note/document-3.png)

* 모든 Label에 대한 텍스트를 라벨링하면 Summary 섹션에서 결과 확인할 수 있음
![]({{site.urlblogimg2022_2023}}/assets/img/aiml/2022/release-note/document-4.png)