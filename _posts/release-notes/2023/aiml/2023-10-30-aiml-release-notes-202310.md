---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "10월 OCI AI/ML 업데이트 소식"
teaser: "2023년 10월 OCI AI/ML 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2023-aiml
tags:
  - oci-release-notes-2023
  - Oct-2023
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


## Private endpoint to access notebook sessions
* **Services:** Data Science
* **Release Date:** Oct 4, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/a958f2b9-e056-4a30-b865-10328c6afd82/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/a958f2b9-e056-4a30-b865-10328c6afd82/){:target="_blank" rel="noopener"}

### 업데이트 소개
이번 업데이트를 통해 노트북 세션을 생성할 때 클라우드 계정에 생성되어 있는 Private Endpoint를 이용하여 세션에 접속할 수 있도록 구성할 수 있습니다. 
Private Endpoint를 사용하여 접근하도록 구성할 경우, 노트북 세션에 한층 더 강화된 인터넷 보안을 적용할 수 있습니다.

#### 화면 예시
![](/assets/img/aiml/2023/releasenote/notebook-prv-ep.png " ")


## Notebook session lifecycle scripts
* **Services:** Data Science
* **Release Date:** Oct 4, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/127be4b9-9229-49dd-be2e-5115a5d34fd2/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/127be4b9-9229-49dd-be2e-5115a5d34fd2/){:target="_blank" rel="noopener"}

### 업데이트 소개
이번 업데이트를 통해서 이제 노트북 세션 라이프사이클 스크립트를 사용하여 다음과 같이 다양한 노트북 세션 라이프사이클 상태에서 사용자 정의 스크립트를 실행할 수 있습니다
- Create
- Activate
- Deactivate
- Delete

#### Notebook session Lifecycle 스크립트 관련 사용자 정의 환경 변수 목록
<table class="table" id="notebook-runtime__table_ser-env-vars" summary="Describes the service managed environment variable keys by name and description."><caption></caption><colgroup><col><col><col></colgroup><thead class="thead">
<tr class="row">
<th class="entry" id="notebook-runtime__table_ser-env-vars__entry__1">
<p class="p">Variable Key Name</p>
</th>
<th class="entry" id="notebook-runtime__table_ser-env-vars__entry__2">
<p class="p">Description</p>
</th>
<th class="entry" id="notebook-runtime__table_ser-env-vars__entry__3">Specified By</th>
</tr>
</thead><tbody class="tbody">
<tr class="row">
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__1">
<p class="p"><code class="ph codeph">NB_ONCREATE_SCRIPT_URL</code></p>
</td>
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__2">
<p class="p">Notebook session lifecycle script URL to run when creating.</p>
</td>
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__3">
<p class="p">User specified.</p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__1">
<p class="p"><code class="ph codeph">NB_ONACTIVATE_SCRIPT_URL</code></p>
</td>
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__2">
<p class="p">Notebook session lifecycle script URL to run when activating.</p>
</td>
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__3">
<p class="p">User specified.</p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__1">
<p class="p"><code class="ph codeph">NB_ONDEACTIVATE_SCRIPT_URL</code></p>
</td>
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__2">
<p class="p">Notebook session lifecycle script URL to run when deactivating.</p>
</td>
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__3">
<p class="p">User specified.</p>
</td>
</tr>
<tr class="row">
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__1">
<p class="p"><code class="ph codeph">NB_ONDELETE_SCRIPT_URL</code></p>
</td>
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__2">
<p class="p">Notebook session lifecycle script URL to run when deleting.</p>
</td>
<td class="entry" headers="notebook-runtime__table_ser-env-vars__entry__3">
<p class="p">User specified.</p>
</td>
</tr>
</tbody></table>

#### Lifecycle 스크립트 사용 방법 
+ 노트북 세션 생성 단계에서 "런타임 구성" 섹션에 관련 환경 변수키를 제공합니다. URL값은 Lifecycle 스크립트 파일이 업로드 된 OCI Object Storage의 URL을 입력합니다.
  ![](/assets/img/aiml/2023/releasenote/notebook-lifecycle-script-1.png " ")
+ URI 형식 예시 입니다. `https://objectstorage.region.oraclecloud.com/n/object-storage-namespace/b/bucket/o/filename`
+ Lifecycle Script 샘플 소스코드는 [oracle-sample 깃헙](https://github.com/oracle-samples/oci-data-science-ai-samples/tree/main/notebook_lifecycle_scripts_examples){:target="_blank" rel="noopener"}를 참고하세요.
+ Lifecycle Script 관련 더 자세한 설명은 [Using Custom Environment Variable Keys to Manage Notebook Session Lifecycle Scripts](https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/data-science/using/notebook-runtime.htm){:target="_blank" rel="noopener"} 문서를 참고하세요.

## Storage mounts are introduced.
* **Services:** Data Science
* **Release Date:** Oct 18, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/5d5c7ac7-ebe1-4852-b38c-4b96f1fd7218/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/5d5c7ac7-ebe1-4852-b38c-4b96f1fd7218/){:target="_blank" rel="noopener"}

### 업데이트 소개
이번 업데이트를 통해 노트북 세션 및 작업에서 File Storage Service의 마운트 타겟이나 Object Storage 서비스 버킷을 마운트 하도록 구성할 수 있습니다. 
이 기능을 사용할 경우 노트북 세션에서 자동으로 안전한 구성을 생성하여 데이터를 컴퓨터에 로컬인 것처럼 액세스할 수 있기 때문에 클라우드 계정의 데이터 저장소 작업 프로세스를 간소화할 수 있습니다.

> Note : File Storage Service는 네트워킹 유형을 "사용자 정의 네트워킹"으로 설정한 경우에만 선택할 수 있습니다.

#### 화면 예시
+ Storage 마운트 기능 추가
  ![](/assets/img/aiml/2023/releasenote/notebook-storage-mnt-1.png " ")
+ OCI File Storage Service 마운트 구성 화면
  ![](/assets/img/aiml/2023/releasenote/notebook-storage-mnt-2.png " ")
+ OCI Object Storage 마운트 구성 화면
  ![](/assets/img/aiml/2023/releasenote/notebook-storage-mnt-3.png " ")


## Vision now has Face Detection
* **Services:** Vision
* **Release Date:** Oct 16, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/53ea1264-a383-4963-9fa4-4cf4f68c714f/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/53ea1264-a383-4963-9fa4-4cf4f68c714f/){:target="_blank" rel="noopener"}

### 업데이트 소개
이번 업데이트를 통해서 Vision 서비스에 사전 학습된 Face Detection 모델이 추가되었습니다.
이미지에서 얼굴과 위치를 식별한 후 bounding box로 표시 하고, 식별된 얼굴마다 왼쪽 눈, 오른쪽 눈, 코끝, 왼쪽 입꼬리, 오른쪽 입꼬리를 인식하여 점으로 표시합니다..
또한 각 얼굴에 시각적 품질 점수를 부여하는데 점수가 높은 이미지의 경우 생체 인식에 활용하기에 적합합니다.

### 사용 사례
+ 개인 정보 보호: 얼굴 감지 기능을 통해 반환된 얼굴 위치 정보를 사용하여 이미지에 블러를 추가하여 신원을 숨깁니다.
+ 생체 인식의 전제 조건: 얼굴 품질 점수를 사용하여 얼굴이 깨끗하고 장애물이 없는지 결정합니다.
+ 디지털 자산 관리: 더 나은 인덱싱 및 검색을 위해 얼굴 정보가 포함된 이미지에 태그를 지정합니다.

### 화면 예시
+ 인식된 얼굴들을 상자로 표시 합니다.
  ![](/assets/img/aiml/2023/releasenote/vision-face-1.png " ")
+ 인식된 얼굴의 눈,코,입의 위치를 좌표로 제공합니다.
  ![](/assets/img/aiml/2023/releasenote/vision-face-2.png " ")