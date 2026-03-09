---
layout: page-fullwidth
#
# Content
#
subheadline: "Storage"
title: "Shared block volume 업데이트 (OREL8,9) 및 shared block volume 추가방법"
teaser: "Shared block volume 업데이트 (OREL8,9) 및 shared block volume 추가방법 소개합니다."
author: "kisukim"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, storage, ocfs2]
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

### OSFS2 란?
OCFS2(Oracle Cluster File System 2)는 오라클에서 개발한 리눅스용 범용 공유 디스크 클러스터 파일 시스템입니다. 여러 서버(노드)가 동일한 저장 장치(디스크)에 동시에 접근하여 읽고 쓸 수 있도록 설계되었습니다

이전에 관련된 링크는 아래와 같으며, 이번 페이지에서는 오라클 리눅스8,9버전에서의 설정 방법 및 공유스토리지를 추가할 경우 설정 방법에 대해서 알아 보고자 합니다. 

[OCI Shared Blockvolume 구성](/infrastructure/oci-shared-blockvolume/)

### OREL8,9 설치방법

#### 공통 패키시 설치 

오라클 리눅스는 firewalld가 기본 Active 상태이므로, stop및 disable 처리하도록 해줍니다. 추가적으로 노드간의 통신을 위해서 TCP/UDP 포트 7777 허용하도록 VCN을 설정해 주도록 합니다. 

아래 명령어를 통해서 node1, node2에 패키지를 설치합니다. 

```bash
sudo dnf install -y ocfs2-tools
```

![](/assets/img/infrastructure/2026/ocfs2-1.png " ")




#### node1 설치방법

1.명령어를 통해서 cluster 추가도록 합니다. 여기서는 mycluster 라고 명칭하고 해당 부분을 추가하겠습니다.
```bash
[opc@compute1 ~]$ sudo o2cb add-cluster [클러스터이름]
```
![](/assets/img/infrastructure/2026/ocfs2-3.png " "){: style="width: 70%; max-width: 350px;"}

2.cluster에 노드를 하나씩 추가해 줍니다. 여기서는 2개의 노드를 사용하므로 2개의 노드를 입력합니다. 
```bash
[opc@compute1 ~]$ sudo o2cb add-node [클러스터이름] [호스트네임] --ip [내부IP]
```
![](/assets/img/infrastructure/2026/ocfs2-2.png " "){: style="width: 70%; max-width: 500px;"}

3.node가 정상적으로 추가되면 아래 위치의 파일에서 확인이 가능합니다. 
```bash
sudo vi /etc/ocfs2/cluster.conf
```
![](/assets/img/infrastructure/2026/ocfs2-4.png " "){: style="width: 70%; max-width: 300px;"}

4.초기 설정을 합니다.빨강색은 이미 선언한 클러스터 이름을 설정합니다.

![](/assets/img/infrastructure/2026/ocfs2-5.png " ")

5.시스템 커널값을 변경합니다. 

![](/assets/img/infrastructure/2026/ocfs2-6.png " ")

6.추가된 공유된 블록 스토리지의 확인하고서 포맷을 진행합니다. 

![](/assets/img/infrastructure/2026/ocfs2-7.png " ")

7.마운트할 디렉토리 만들어서 마운트 하도록 합니다.

![](/assets/img/infrastructure/2026/ocfs2-8.png " "){: style="width: 70%; max-width: 650px;"}



#### node2 설치방법
1. node1에서 만들어진 cluster.conf 파일을 node2에 동일한 위치에 파일을 만들어서 내용을 똑같이 복사해 줍니다. 

2. node1 설정에서 "5.시스템 커널값을 변경합니다." 변경해 줍니다. 

3. node1 설정에서 "7.마운트할 디렉토리 만들어서 마운트 하도록 합니다."

#### 주의사항 

각 node의 호스트명은 실제 cluster.conf 파일의 node의 내용과 일치해야 하므로 주의 하도록 합니다. 


### shared block volume 2개를 node1,2에 추가하는 방법 

이미 shared block volume 이외 추가 하고자 할 경우 cluster 의 변경 사항은 없습니다. 단 추가로 공유할 block volume을 아래 화면과 같이 각 node에 추가 합니다. 

![](/assets/img/infrastructure/2026/ocfs2-9.png " ")

위 화면에서 처음 "bk3"으로 공유하고 추가적으로 "bk45" 공유하기 위해서는 아래와 같습니다. 추가적으로 등록된 blockvolume의 path를 확인 후 해당 volume을 ocfs2 타입으로 포맷 후 각 노드에 마운트하면 node 2개가 서로 다른 shared block volume을 2개를 공유해서 사용합니다. 2개의 공유된 블록볼륨은 하나의 클러스터로 관리됩니다. 

1. 추가된 블록볼륨 path 확인
2. 포맷 후 마운트 (포맷은 한 node에서만 진행)


![](/assets/img/infrastructure/2026/ocfs2-10.png " "){: style="width: 70%; max-width: 650px;"}


### 참고링크
- [OCFS2 Load Balancing Use Case (Oracle Linux 8)](https://docs.oracle.com/en/operating-systems/oracle-linux/8/ocfs2/load-balancing-use-case_concept.html){:target="_blank" rel="noopener"}