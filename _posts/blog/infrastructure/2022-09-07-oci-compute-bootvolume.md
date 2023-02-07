---
youtubeId: fyqT6GqbZRQ
youtubeId2: wbUBIApC8Mo

layout: page-fullwidth
#
# Content
#
subheadline: "Compute"
title: "Compute 부트볼륨 사이즈 업 이후 재설정"
teaser: "Compute 부트볼륨 사이즈 업 이후 설정하는 방법에 대해서 배워보자."
author: "ks.kim"
breadcrumb: true
categories:
  - infrastructure 
tags:
  - [oci, compute]
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

### 작업순서 
1. 브라우저상에서 변경할 부트볼륨 사이즈 변경 (원래 크기보다 작게는 변경 안됩니다.)
2. 1번 변경 후 팝업의 Rescan 명령어 터미널 접속 후 실행
3. sudo /usr/libexec/oci-growfs 명령어 실행하여 최종 마무리


### 1.Compute 부트볼륨 변경하는 방법
compute 생성 이후 필요에 따라서 추가적인 block volume을 추가하기도 하지만 원천적인 boot volume의 사이즈를 변경해야하는 경우, 아래와 같이 진행하면 됩니다.
> 부트볼륨의 경우, 한 번 사이즈 업 된 이후에는 다시 사이즈 다운이 안됩니다!

![접근하기](/assets/img/infrastructure/bootvolume/boot1.png)
원하는 사이즈로 변경합니다.
![접근하기](/assets/img/infrastructure/bootvolume/boot2.png)

변경 이후 필요한 위 팝업의 명령어를 OS 상에서 실행하기 위해서 copy해 줍니다.

### 2.사이즈 변경 이후 OS상에서 실행해야하는 명령어

Web브라우저 통해서 boot volume  수정후 팝업창의 명령어를 실행 후 이후 oci-growfs 명령어를 실행해야합니다. 
1. 팝업에서 copy한 명령어 (예제이며, 실제 팝업의 명령어를 실행해 주세요!)

> 아래 명령어는 위 Bootvolume 사이즈 변경 이후 WebConsole 상에 명령어 예제이며, 실제 변경시 팝업의 commnad를 복사해서 실제 터미널에서 실행해야합니다!

2. OCI상에서 실행되는 명령어

> "sudo /usr/libexec/oci-growfs" 명령어를 통해서 실제 적용할 수 있도록 합니다. "Confirm? [y/n]: y" 입력합니다.

Rescan 이후 "sudo /usr/libexec/oci-growfs" 실행과정 참조
![실행과정](/assets/img/infrastructure/bootvolume/boot3.png)







