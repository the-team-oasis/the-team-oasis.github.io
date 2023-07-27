---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "6월 OCI AI/ML 업데이트 소식"
teaser: "2023년 6월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-aiml
tags:
  - oci-release-notes-2023
  - Jun-2023
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


## ## Accelerated Data Science 2.8.6 is released
* **Services:** Data Science
* **Release Date:** June 13, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/808730ae-b28a-4025-8153-691ce33e4f20/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/808730ae-b28a-4025-8153-691ce33e4f20/){:target="_blank" rel="noopener"}

### 업데이트 소개
OCI Data Science 서비스에서 제공하는 Python 라이브러리 인 ADS 2.8.6 패치에서는 아래와 같은 기능이 추가 및 개선 그리고 버그 픽스가 업데이트 되었습니다.

- Resolved an issue in `ads opctl build-image job-local` when the build of `job-local` would get stuck. Updated the Python version to 3.8 in the base environment of the `job-local` image.
- Fixed a bug that prevented the support of defined tags for Data Science job runs.
- Fixed a bug in the `entryscript.sh` of `ads opctl` that attempted to create a temporary folder in the `/var/folders` directory.
- Added support for defined tags in the Data Flow application and application run.
- Deprecated the old `:py:class:`~ads.model.ModelDeploymentProperties` and `:py:class:`~ads.model.ModelDeployer` classes, and their corresponding APIs.
- Enabled the uploading of large size model artifacts for the `:py:class:`~ads.model.ModelDeployment` class.
- Implemented validation for shape name and shape configuration details in Data Science jobs and Data Flow applications.
- Added the capability to create `ADSDataset` using the Pandas accessor.
- Made `Docker` dependency optional for `ads opctl run`.
- Provided a prebuilt watch command for monitoring Data Science jobs with `ads opctl`.
- Eliminated the legacy `ads.dataflow` package from ADS.


## ## Accelerated Data Science 2.8.7 is released
* **Services:** Data Science
* **Release Date:** June 22, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/55fdef5a-035f-4340-ab75-2bde25976703/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/55fdef5a-035f-4340-ab75-2bde25976703/){:target="_blank" rel="noopener"}

### 업데이트 소개
OCI Data Science 서비스에서 제공하는 Python 라이브러리 인 ADS 2.8.7 패치에서는 아래와 같은 기능이 추가 및 개선 그리고 버그 픽스가 업데이트 되었습니다.

- Removed incorrect help information of `opctl` commands.
- Add pre-commit for OCIDs and secrets to these Github repositories: ads, ocifs, samples, and mlflow.
- Added support for token-based authentication.
