---
layout: page-fullwidth
#
# Content
#
subheadline: "CloudNative"
title: "OCI OpenSearch 2.3 버전에서 2.11 버전으로 업그레이드 하기"
teaser: "OCI OpenSearch 에 새롭게 출시된 2.11 버전을 사용하기 위해서 2.3 버전에서 2.11 로 업그레이드 하는 방법에 대해 소개합니다."
author: dankim
breadcrumb: true
categories:
  - cloudnative
tags:
  - [oci, opensearch, opendashboard, elasticsearch, 2.11, 2.3, upgrade]
#
# Styling
#
header: no
#  image:
#    title: {{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2022/weblogic_oke_0.png
#     thumb: {{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2022/weblogic_oke_0.png
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

### OCI Opensearch 클러스터 업그레이드 준비
Opensearch 2.11 버전으로 업그레이드 하기 위해서 먼저 이전 버전 (2.3)의 OCI OpenSearch Cluster를 준비합니다. OCI OpenSearch 서비스에 대한 소개와 Cluster 생성 방법은 아래 포스팅을 참고합니다.

[OCI Opensearch 서비스 살펴보기](http://localhost:4000//cloudnative/oci-opensearch-overview/#5-oci-opensearch-%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0-%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0){:target="_blank" rel="noopener"}

### OCI Opensearch 2.3 버전의 클러스터 확인
먼저 업그레이드 해야 할 OCI Opensearch 클러스터의 버전을 확인합니다.
OCI 콘솔에서 Opensearch 클러스터를 선택하고, 클러스터 상세 정보에서 버전을 확인합니다.
만약 1.2.4 버전을 사용 중 이라면 [OCI Opensearch 1.2.4 버전에서 2.3 버전으로 업그레이드 하기](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Tasks/upgradingacluster.htm){:target="_blank" rel="noopener"} 공식 문서를 참조하여 업그레이드를 진행해야 합니다.

#### 1. OpenSearch Dashboard 접속 정보 확인
OCI Opensearch 클러스터 상세보기 화면에서 아래 SSH 터널링을 위한 Dashboard Private IP 정보를 확인합니다.
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-1.png " ")

#### 2. 로컬 PC에서 OpenSearch Dashboard 접속하기 위해 SSH 터널링 하기
앞서 설명한 내용과 같이 OpenSearch 클러스터 뿐 아니라 OpenSearch Dashboard 역시 Private 네트워크 위에 프로비전 됩니다.
로컬에서 Dashboard에 접속하려면 아래 내용을 따라 SSH 터널링 작업이 필요합니다.
1. 아래 명령어를 입력하여 터널링을 수행합니다.
    - your_opensearch_dashboards_private_IP : 클러스터 정보 화면에서 opensearch dashboard 전용(Private) IP를 복사하여 입력합니다.
    - your_instance_public_ip : Bastion VM 의 Public IP를 복사하여 입력합니다.
    - path_to_your_private_key : Bastion VM에 접속하기 위한 Key 파일의 로컬 경로를 입력합니다.
   ````terminal
     $ ssh -C -v -t -L 127.0.0.1:5601:<your_opensearch_dashboards_private_IP>:5601 opc@<your_instance_public_ip> -i <path_to_your_private_key>
   ````

#### 3. OpenSearch Dashboard 접속
터널링이 완료되면 로컬 PC에서 브라우저를 열고 아래 URL로 접속합니다.
````terminal
https://localhost:5601
````
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-2.png " ")

#### 4. OpenSearch 클러스터 2.11 버전으로 업그레이드
접속하여 클러스터의 버전을 확인 후 2.11 버전으로 업그레이드 하기 위해 OCI 콘솔로 돌아 옵니다.
세부정보 화면에서 `Upgrade` 버튼을 클릭하여 가능한 버전 목록에서 '2.11' 버전을 선택하고 "변경사항 저장" 버튼을 클릭하여 업그레이드를 진행합니다.
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-2-1.png " ")
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-3.png " ")
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-4.png " ")

#### 5. 업그레이드 완료 확인
업그레이드가 완료되면 OCI 콘솔에서 클러스터 상세 정보에서 상태가 "UPDATING" 에서 "ACTIVE"로 변경되었는지 확인하고 Software 버전이 2.11로 변경되었는지 확인합니다.

![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-5.png " ")
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-6.png " ")

#### 6. OCI Opensearch Dashboard 접속하여 업그레이드 확인하기
업그레이드가 완료되면 OCI Opensearch Dashboard에 접속하여 업그레이드 내용을 확인할 수 있습니다.

![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-7.png " ")
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-8.png " ")
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-9.png " ")

#### 7. 샘플데이터 확인하기
샘플데이터를 추가해서 Dashboard에서 샘플데이터를 기반으로 확인할 수 있습니다

![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-10-1.png " ")
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-10.png " ")
![](/assets/img/cloudnative-security/2024/opensearch-upgrade/opensearch-upgrade-11.png " ")