---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "OCI Oracle Linux 에서 GUI 실행을 위한 X11-Forwarding 설정하기 (MobaXterm 사용)"
teaser: "OCI 의 Oracle Linux 에서 Database Configuration Assistant (DBCA) 와 같은 GUI 기반의 프로그램들을 실행시킬 수 있도록 X11 Forwarding 을 MobaXterm Tool 을 이용하여 설정하는 방법을 알아봅니다."
author: lim
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, oracle, X11, dbcs, GUI, dbca]
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

### OCI Oracle Linux 에서 X11-Forwarding 설정하기
이번 블로그에서는 OCI 의 Oracle Linux 에서 Database Configuration Assistant (DBCA) 와 같은 GUI 기반의 프로그램들을 실행시킬 수 있도록 X11 Forwarding 을 MobaXterm Tool 을 이용하여 설정하는 방법을 알아봅니다.
<br>

### X11-Forwarding 이란?
원격에 있는 리눅스에 SSH로 접속해서 GUI 기반의 X11 어플리케이션을 실행하기 위한 기법을 말합니다. 접속되어 있는 클라이언트 윈도우에 나타나도록 하는 것으로 서버와 클라이언트간의 통신에는 ssh 프로토콜을 이용하여 중계를 하게 됩니다.

### STEP 1 : MobaXterm 설치하기
X11-Forwarding 을 통해 GUI 기반의 어플리케이션을 원할하게 사용하기 위해 범용적으로 MobaXterm 이라는 Tool 을 많이 사용합니다.
MobaXterm 은 아래의 사이트에서 다운로드 받아 설치하실 수 있습니다.

- [MobaXterm 다운로드 URL](https://mobaxterm.mobatek.net/download-home-edition.html){:target="_blank" rel="noopener"} (https://mobaxterm.mobatek.net/download-home-edition.html)

![MobaXterm](/assets/img/dataplatform/2023/oracle/01_mobaxterm_download.png)


- 다운로드 후 zip 파일 해제 후 MobaXterm 설치를 마치면 아래와 같은 MobaXterm 프로그램 화면이 나타납니다. (기본적으로 Putty Session 설정들이 User Sessions 에 추가됨)

![MobaXterm](/assets/img/dataplatform/2023/oracle/02_mobaxterm_main_screen.png)

### STEP 2 : SSH 서비스 설정 변경 하기
X11-Forwarding 이 가능하게 하기 위해서 ssh 데몬 서비스에 대한 설정을 변경해 줍니다.

- MobaXterm 의 접속하고자 하는 호스트의 Edit Session 세팅에서 X11-Forwarding 이 체크되어 있는지 점검합니다.

![Terminal](/assets/img/dataplatform/2023/oracle/04_mobaxterm_session_setting_01.png)

- 아래와 같이 X11-Forwarding 이 체크되어 있어야 합니다.

![Terminal](/assets/img/dataplatform/2023/oracle/05_mobaxterm_session_setting_02.png)


- MobaXterm 의 ssh session 중에서 X11-Forwarding 을 구성할 터미널 세션에 opc user 로 접속합니다.

![Terminal](/assets/img/dataplatform/2023/oracle/03_mobaxterm_session_login.png)

- 아래의 명령어를 입력하여 sshd_config 를 수정합니다.

```text
$ sudo vi /etc/ssh/sshd_config
```

- X11UseLocalhost 항목을 찾아 '#' 으로 주석되어 있는 부분을 아래 화면 처럼 해제합니다.
- X11Forwarding 항목도 찾아 주석을 해제하고 'yes' 로 세팅되어 있도록 설정합니다.

![Terminal](/assets/img/dataplatform/2023/oracle/06_mobaxterm_x11forward_setting_01.png)

- 수정한 sshd_config 파일을 저장 후 vi 에디터를 빠져나옵니다.
- 아래 명령을 입력하여 sshd 데몬을 재시작합니다.

```text
$ sudo systemctl restart sshd
```

### STEP 3 : xterm, xauth, xclock 설치 및 실행하기

- 아래 명령을 입력하여 xauth, xterm, xclock 을 설치합니다.

```text
$ sudo yum -y install xauth
$ sudo yum -y install xterm
$ sudo yum -y install xclock
```

![Terminal](/assets/img/dataplatform/2023/oracle/07_mobaxterm_xauth_install_01.png)

- Oracle Linux 8 버전 이상은 xclock 이 기본 yum 명령으로 설치가 되지 않습니다.

![Terminal](/assets/img/dataplatform/2023/oracle/08_mobaxterm_xclock_install_error.png)

- Oracle Linux 8 이상에서는 아래 명령으로 xclock 을 설치해 주어야 합니다.

```text
$ sudo dnf config-manager --enable ol8_codeready_builder
$ sudo dnf install xorg-x11-apps
```
![Terminal](/assets/img/dataplatform/2023/oracle/09_mobaxterm_xclock_install_on_ole8.png)

- xclock 명령을 입력하여 아래 화면처럼 GUI 기반의 시계가 나타나는지 확인합니다.

```text
$ xclock
```
![Terminal](/assets/img/dataplatform/2023/oracle/10_mobaxterm_xclock.png)

xclock 명령을 통해 시계가 나타났다면 opc 사용자에 대해서는 GUI 프로그램들을 실행시킬 수 있는 환경 구성이 완료된 것입니다.

### STEP 4 : Oracle 사용자 X11-Forwarding 설정하기
앞서 opc 사용자에 대해 GUI 프로그램들을 실행시킬 수 있는 X11-Forwarding 구성을 해 보았습니다. opc 사용자 외에 Oracle Database 서비스를 관리하는 oracle 사용자 같은 경우 Oracle Database 세팅을 위한 Database Configuration Asstant (dbca) 와 같은 GUI 기반의 프로그램 실행이 필요합니다. oracle 사용자에 대한 X11-Forwarding 설정은 아래 절차에 따라 세팅합니다.

- opc 사용자로 접속하여 X11-Forwarding 설정 구성 파일인 .Xauthority 파일을 oracle 사용자의 home diretory 복사하고 opc 사용자의 DISPLAY 환경을 확인합니다. 확인된 DISPLAY 환경은 oracle 사용자에게 동일하게 설정합니다.

```text
$ sudo cp .Xauthority /home/oracle/
$ echo $DISPLAY
```

![Terminal](/assets/img/dataplatform/2023/oracle/11_copy_display_check.png)

- root 사용자로 전환하여 .Xauthority 파일에 대한 소유권을 확인합니다. 

```text
$ sudo su –
$ cd /home/oracle
$ ls -al
```
![Terminal](/assets/img/dataplatform/2023/oracle/12_xauthority_owner_check.png)

- 아래 명령을 실행하여 .Xauthority 파일에 대한 소유권을 oracle:oinstall 로 변경합니다.

```text
$ chown oracle .Xauthority
$ chgrp oinstall .Xauthority
$ ls -al
```
![Terminal](/assets/img/dataplatform/2023/oracle/13_xauthority_owner_change.png)

- root 사용자에서 oracle 사용자로 전환 후 DISPLAY 환경 변수를 opc 사용자에서 확인했던 DISPLAY 값으로 변경해 줍니다.

```text
$ exit
$ sudo su - oracle
$ export DISPLAY=localhost:10.0
$ echo $DISPLAY
localhost:10.0
```
![Terminal](/assets/img/dataplatform/2023/oracle/14_xauthority_oracle_setting.png)

### STEP 5 : Oracle 사용자로 GUI 프로그램 실행하기
로
- xclock 명령으로 GUI 프로그램이 실행되는지 확인합니다.

```text
$ xclock
```
![Terminal](/assets/img/dataplatform/2023/oracle/15_oracle_xclock.png)

- dbca 명령으로 GUI 프로그램이 실행되는지 확인합니다.

```text
$ dbca
```
![Terminal](/assets/img/dataplatform/2023/oracle/16_oracle_dbca.png)

![Terminal](/assets/img/dataplatform/2023/oracle/17_oracle_dbca_02.png)

<br>
이상 oracle 사용자에서 GUI 기반의 프로그램을 실행시킬 수 있는 X11-Forwarding 을 설정하는 방법을 알아봤습니다. oracle 사용자가 로그인 시 기본적으로 X11-Forwarding 설정을 사용하게끔 하려면 .bash_profile 에 DISPLAY 설정값을 저장해 두면 로그인 시 바로 사용이 가능합니다.

<br>

---

