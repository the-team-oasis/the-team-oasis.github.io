---
layout: page-fullwidth
#
# Content
#
subheadline: "CloudNative"
title: "OCI Container Instances 소개 및 Spring Boot Application 배포해보기"
teaser: "OCI Container Instances 서비스에 대한 소개와 Spring Boot Application을 배포해 보도록 합니다."
author: dankim
breadcrumb: true
categories:
  - cloudnative
tags:
  - [oci, container instances]
#
# Styling
#
header: no
#  image:
#    title: /assets/img/cloudnative-security/2022/weblogic_oke_0.png
#     thumb: /assets/img/cloudnative-security/2022/weblogic_oke_0.png
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

### OCI Container Instances 서비스 소개
OCI Container Instances는 별도로 서버를 관리하지 않고도 Container를 바로 실행할 수 있는 서버리스 컴퓨팅 서비스입니다. 일반적으로 Container를 대규모로 실행하는 목적으로 Kubnernetes를 사용하지만, Kubernetes를 사용하지 않고 간단히 Container를 실행할 때는 VM을 프로비저닝하고 여기에 Container Runtime을 설치하여 구성하여야 합니다. 또한 사용자는 VM과 서버, OS를 관리하여야 하고, Container Runtime을 정기적으로 업데이트해야 하는등 운영에 대한 복잡성이 증대됩니다. OCI Container Instances를 활용하면 이러한 운영 복잡성을 없애고 인프라를 별도로 관리하지 않고도 Container를 실행시킬 수 있습니다.

### OCI Container Instances 내부
일반적으로 VM(Virtual Machine)은 하드웨어 가상화, 전용 IO, OS와 커널에 대한 완전환 유연성과 소유권을 통해 강력한 격리를 제공합니다. 반면에 Container는 클라우드가 제공하는 탄력성과 Microservices를 위한 OS 수준의 격리, 독립된 Container 환경에서의 실행, 빠른 애플리케이션 실행을 제공합니다. VM과 Container의 장점을 결합한 서비스가 바로 Container Instances 서비스입니다. OCI Container Instances는 직접 연결된 Block Storage와 같은 강력한 격리 및 전용 IO를 제공하는 하드웨어 가상화를 사용합니다.

일반적으로 단일 Pod에 포함되는 하나 이상의 Container를 호스팅하는 각 Container Instance는 완전히 격리된 베이스 OS와 커널을 사용합니다. Container Instance의 기본 이미지의 경우 인스턴스의 부팅 시간을 크게 줄이도록 간소화 및 최적화된 Oracle Linux 이미지를 사용합니다. 또한 OS 관리 오버헤드를 제거하면서 전반적인 보안 상태를 개선하기 위한 목적으로, OS 업데이트 기능만을 위한 VSOCK 인터페이스를 통해 Container Instance내의 베이스 OS를 관리합니다.

![](https://blogs.oracle.com/content/published/api/v1.1/assets/CONT0049DF174A3A454C9A7971E46B6BACCB/Medium?cb=_cache_95b1&format=jpg&channelToken=f7814d202b7d468686f50574164024ec) 
<cite>[Oracle Blog: First principles: Inside OCI Container Instances](https://blogs.oracle.com/cloud-infrastructure/post/first-principles-inside-oci-container-instances)</cite>

### OCI Container Instances 가격 및 가용할 수 있는 리소스
Container Instances를 구성할 때 선택한 Shape에 대해 일반 Computing Instance와 동일한 가격으로 CPU 및 메모리 비용을 지불합니다. 이 외에 Container Instances를 사용하기 위한 별도의 추가 비용은 발생하지 않습니다.

리소스의 경우 기본 Computing Shape에서 제공하는 모든 CPU, 메모리를 단일 Container Instance에 할당할 수 있습니다. 예를 들어 E3, E4 Flex Shape의 경우 최대 64 코어(128 vCPU) 및 1,024GB 메모리를 할당할 수 있습니다. 자세한 Compute Shape에 대한 정보는 아래 링크를 참고합니다.

[Compute Shapes](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm)

### OCI Container Instance 생성
#### 이미지 빌드 및 OCIR에 푸시
먼저 OCI Container Instance를 프로비저닝하기 전에 테스트를 위한 컨테이너 이미지가 필요합니다. 여기서는 SpringBoot 프레임워크로 간단히 Oracle Database의 테이블을 조회하여 JSON으로 응답하는 RESTful 서비스를 작성후 이미지로 빌드하여 Oracle Cloud Infrastructure Registry(Container Registry 혹은 OCIR이라고 부름)에 푸시하고, Container Instances에서 이를 활용하여 프로비저닝 하도록 하겠습니다.

먼저 OCIR에 올릴 이미지를 빌드합니다. OCIR에 올리기 위한 이미지 이름은 다음과 같은 형식을 갖습니다. registy url은 **리전키.ocir.io**와 같은 형태를 가집니다. 리전키는 [Regions and Availability Domains](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm)에서 확인할 수 있습니다.  

<mark>[registry url]/[tenancy namespace]/[image name]:[tag]</mark>

실제 사용할 이미지로 빌드합니다.
```
$ docker build --tag icn.ocir.io/axwawciiyibv/springboot-movie-people-api:latest .
```

OCIR에 로그인 합니다.
```
$ docker login icn.ocir.io -u [tenancy namespace]/[username]
```

이미지를 OCIR에 푸시 합니다.
```
$ docker push icn.ocir.io/axwawciiyibv/springboot-movie-people-api:latest
```

OCIR에 이미지가 올라온 것을 확인할 수 있습니다.
![](/assets/img/cloudnative-security/2023/oci-container-Instances-1.png " ")

#### Container Instance 프로비저닝
Container Instance 생성을 위해 **메뉴 > 개발자 서비스(Developer Services) > 컨테이너 인스턴스(Container Instances)**로 이동한 후 컨테이너 인스턴스 생성(Create Container Instance) 버튼을 클릭합니다.
![](/assets/img/cloudnative-security/2023/oci-container-Instances-2.png " ")

Container instance 이름, 구획, 배치할 가용성 도메인, Shape과 CPU/Memeory, 네트워킹 구성을 합니다. 네트워킹에서는 미리 생성한 VCN을 활용할 것이며, SpringBoot 서비스에서 사용할 8080 포트를 Security List에서 오픈해줘야 합니다. VCN 생성은 아래 포스트를 참고합니다.

[OCI에서 VCN Wizard를 활용하여 빠르게 VCN 생성하기](https://the-team-oasis.github.io/getting-started/create-vcn/)

**Container instance 이름, 구획, 배치할 가용성 도메인, Shape과 CPU/Memeory 설정**
![](/assets/img/cloudnative-security/2023/oci-container-Instances-3.png " ")

**네트워킹 설정**
![](/assets/img/cloudnative-security/2023/oci-container-Instances-4.png " ")

다음을 클릭한 후 Container 설정을 합니다. 컨테이너의 경우 한 개 이상의 컨테이너를 추가할 수 있습니다. 이미지 선택을 클릭한 후 앞에서 OCIR에 올린 이미지를 선택합니다. 사용자 이름과 암호는 앞서 이미지 푸시할 때 사용한 아이디와 암호를 사용합니다. 외부 레지스트리의 경우 기본은 도커허브(index.docker.io)이며, 그외 다른 3-party의 레지스트리(AWS ECR, Harbor, 다른 테넌시의 OCIR등)도 가능합니다.

![](/assets/img/cloudnative-security/2023/oci-container-Instances-5.png " ")
      
마지막으로 다음을 클릭한 후 생성 버튼을 클릭합니다.

정상적으로 Container Instance가 생성되었습니다. 
![](/assets/img/cloudnative-security/2023/oci-container-Instances-6.png " ")

이제 공용 IP 주소(Container Instance 상세 페이지에서 확인)를 활용하여 서비스를 호출해봅니다.  
**http://[공용 IP 주소]:8080/moviepeople**
![](/assets/img/cloudnative-security/2023/oci-container-Instances-7.png " ")

### 참고
* [https://blogs.oracle.com/cloud-infrastructure/post/announcing-the-availability-of-oci-container-instances](https://blogs.oracle.com/cloud-infrastructure/post/announcing-the-availability-of-oci-container-instances)
* [https://blogs.oracle.com/cloud-infrastructure/post/first-principles-inside-oci-container-instances](https://blogs.oracle.com/cloud-infrastructure/post/first-principles-inside-oci-container-instances)
* [https://docs.oracle.com/en-us/iaas/Content/container-instances/home.htm](https://docs.oracle.com/en-us/iaas/Content/container-instances/home.htm)