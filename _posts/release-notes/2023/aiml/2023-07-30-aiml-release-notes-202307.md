---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "7월 OCI AI/ML 업데이트 소식"
teaser: "2023년 7월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-aiml
tags:
  - oci-release-notes-2023
  - July-2023
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


## Accelerated Data Science 2.8.8 is released
* **Services:** Data Science
* **Release Date:** June 27, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/8336e48d-fac0-4025-ae8a-94f4053138cc/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/8336e48d-fac0-4025-ae8a-94f4053138cc/){:target="_blank" rel="noopener"}

### 업데이트 소개
OCI Data Science 서비스에서 제공하는 Python 라이브러리 인 ADS 2.8.8 패치에서는 아래와 같은 기능이 추가 및 개선 그리고 버그 픽스가 업데이트 되었습니다.

- Added `PyTorchDistributed` runtime option for Data Science jobs to add support for training large language models with PyTorch.
- Added options to configure flexible shape in `opctl`.
- Refactored `deploy()` in `GenericModel` to prioritize the parameters.
- Fixed the `opctl` commands delete/cancel/watch/activate/deactivate commands to add missing parameter options.
- Fixed the `opctl` commands to call run to start an ML job when no YAML is specified.
- Deprecated the `DatasetFactory` class, and refactored the code.

