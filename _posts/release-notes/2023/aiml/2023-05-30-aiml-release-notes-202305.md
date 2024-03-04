---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "5월 OCI AI/ML 업데이트 소식"
teaser: "2023년 5월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-aiml
tags:
  - oci-release-notes-2023
  - May-2023
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


## Accelerated Data Science 2.8.4 is released
* **Services:** Data Science
* **Release Date:** May 5, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/7078c73c-c1ae-41b3-85aa-18c17feb8b26/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/7078c73c-c1ae-41b3-85aa-18c17feb8b26/){:target="_blank" rel="noopener"}

### 업데이트 소개
OCI Data Science 서비스에서 제공하는 Python 라이브러리 인 ADS 2.8.4 패치에서는 아래와 같은 기능이 추가 및 개선 그리고 버그 픽스가 업데이트 되었습니다.

- Added support for creating `ADSDataset` from pandas dataframe.
- Added support for multi-model deployment using Triton.
- Added support for model deployment local testing in `ads opctl` CLI.
- Added support in `ads opctl` CLI to generate starter YAML specification for the Data Science job, Data Flow application, Data Science model deployment, and pipeline resources.
- Added support for invoking model prediction locally with `predict(local=True)`.
- Added support for attaching customized `score.py` when preparing model.
- Added status check for model deployment delete, activate, or deactivate APIs.
- Added support for training and verifying `SparkPipelineModel` in Data Flow.
- Added support for generating `score.p`y for GPU model deployment.
- Added support for setting defined tags in Data Science jobs.
- Improved model deployment progress bar.
- Fixed bug when using `ads opctl` CLI to run jobs locally.
- Fixed bug in Dataflow magic when using `archive_uri` in Data Flow configuration.



## Accelerated Data Science 2.8.5 is released
* **Services:** Data Science
* **Release Date:** May 17, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/ddfe6e2f-f875-4646-87a5-1ba53186aebf/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/ddfe6e2f-f875-4646-87a5-1ba53186aebf/){:target="_blank" rel="noopener"}

### 업데이트 소개
OCI Data Science 서비스에서 제공하는 Python 라이브러리 인 ADS 2.8.5 패치에서는 아래와 같은 기능이 추가 및 개선 그리고 버그 픽스가 업데이트 되었습니다.

- Added support for `key_content` attribute in `ads.set_auth()` for the API KEY authentication.
- Fixed bug in `ModelEvaluator` when it returned incorrect ROC AUC characteristics.
- Fixed bug in `ADSDataset.suggest_recommendations()` API, when it returned an error if the target wasn't specified.
- Fixed bug in `ADSDataset.auto_transform()` API, when an incorrect sampling was suggested for imbalanced data.


## New media formats.
* **Services:** Speech
* **Release Date:** Mar 11, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/33620efb-5680-4633-8be4-25c6b619d5cb/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/33620efb-5680-4633-8be4-25c6b619d5cb/){:target="_blank" rel="noopener"}

### 업데이트 소개
OCI의 AI 서비스 중 하나인 Speech 서비스에서 새로운 Source Media 포멧을 지원하도록 업데이트 되었습니다.<br>
이번에 추가된 미디어 포멧은  `AU` , `M4A` , `OGA` , `WEBM`  유형이 추가 되었습니다.
이로인해 Speech 서비스에서 지원하는 미디어 포멧은 아래와 같습니다.
- AAC
- AC3
- AMR
- AU
- FLAC
- M4A
- MKV
- MP3
- MP4
- OGA
- OGG
- WAV
- WEBM



## ## New Services available in US Government Cloud
* **Services:** Data Labeling
* **Release Date:** Mar 31, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/b050efbe-c3b2-4927-a0bf-70414dc09252/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/b050efbe-c3b2-4927-a0bf-70414dc09252/){:target="_blank" rel="noopener"}

### 업데이트 소개
OCI Data Labeling 서비스가 FedRAMP 인증을 획득하고, US Government Cloud 에서 사용할 수 있게 되었습니다.
관련하여 미국 정부 클라우드 관련하여 더 많은 정보는 아래 링크를 통해 확인하실 수 있습니다.

- [For All US Government Cloud Customers](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/govinfo.htm){:target="_blank" rel="noopener"}
- [Oracle Cloud Infrastructure US Government Cloud with FedRAMP Authorization](https://docs.oracle.com/iaas/Content/General/Concepts/govfedramp.htm){:target="_blank" rel="noopener"}
- [Oracle Cloud Infrastructure US Federal Cloud with DISA Impact Level 5 Authorization](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/govfeddod.htm){:target="_blank" rel="noopener"}