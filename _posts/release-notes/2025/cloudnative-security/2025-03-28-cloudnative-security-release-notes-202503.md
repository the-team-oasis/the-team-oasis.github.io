---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2025"
title: "3월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2025년 3월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2025-cloudnative-security
tags:
  - oci-release-notes-2025
  - Mar-2025
  - cloudnative
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

## Document Generator pre-built function now supports cell styling
* **Services:** Functions
* **Release Date:** March 05, 2025
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functions_pbf_catalog_document_generator.htm](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functions_pbf_catalog_document_generator.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
The Document Generator pre-built function은 OCI에서 사전 구축된 Function의 하나로 Functions 서비스에서 사용할 수 있습니다. The Document Generator pre-built function은 Office 템플릿과 JSON 데이터를 오브젝트 스토리지(Object Storage)에 저장한 후, 해당 기능을 직접 호출하여 PDF 문서를 생성하고 결과를 다시 오브젝트 스토리지에 저장하는 기능을 제공합니다.

#### MS Excel 템플릿 관련 개선 사항
이번에 MS Excel 템플릿을 기반으로 문서를 생성할 때, 셀 스타일 태그를 사용할 수 있게 되었습니다. 이를 통해 각 셀에 대해 다음과 같은 속성을 JSON 데이터로 지정할 수 있습니다.
* 글꼴(Font)
* 수평 정렬(Horizontal alignment)
* 수직 정렬(Vertical alignment)
* 배경 색상(Background color)
* 테두리(Border)

#### MS Word 템플릿 관련 개선 사항
MS Word 템플릿을 사용할 때도 여러 기능이 개선되었습니다. 
* 줄바꿈(New lines) 및 탭(Tab) 문자의 처리 방식이 향상되어, JSON 데이터에 포함된 텍스트 포맷이 Word 문서에 더 자연스럽게 반영됩니다.
* 공백(White spaces) 처리도 개선되어, 문서 레이아웃이 보다 정확하게 유지됩니다.

