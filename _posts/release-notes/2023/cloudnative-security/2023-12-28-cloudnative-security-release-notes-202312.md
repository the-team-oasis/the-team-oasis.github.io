---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2023"
title: "12월 OCI Cloud Native & Security 업데이트 소식"
teaser: "2023년 12월 OCI Cloud Native & Security 업데이트 소식입니다."
author: dankim
breadcrumb: true
categories:
  - release-notes-2023-cloudnative-security
tags:
  - oci-release-notes-2023
  - Dec-2023
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

## Support for multi-level claim extraction from id_token and access_token
* **Services:** API Gateway
* **Release Date:** Dec. 13, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewaycontextvariables.htm](https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewaycontextvariables.htm){:target="_blank" rel="noopener"}

### 릴리즈 내용
이제 OpenID Connect 플로우에서 ``id_token``과 ``access_token``에서 사용자 정의 Claim을 추출할 수 있습니다. 기본적으로 OCI API Gateway에서 OpenID Connect인 경우 JWT에 인코딩 되어 있는 ``id_token``값과 ``access_token``값이 반환될 수 있는데, OCI API Gateway에서는 이 두개의 값을 ``request.auth[id_token]`` 과 ``request.auth[access_token]`` Context 값에 저장합니다. 각각의 사용자 정의 Claim을 얻기 위해서는 ``request.auth[id_token_claims][<claim-name>]``과 ``request.auth[access_token_claims][<claim-name>]`` Context 값을 통해 추출할 수 있습니다.

> Claim이란 유저정보나 메타정보에 관해 정보를 가지고 있는 Key/Value Pair를 의미합니다. id_token은 사용자 식별 정보가 토큰에 인코딩되어 있으며, 이 정보를 id_token에 대한 Claim이라 합니다.

### 이점
이와 같이 사용자 정의 Claim을 추출하는 기능을 통해 다음과 같은 이점을 얻을 수 있습니다.
* 인증 요청에 대해 적절한 인증 서버를 동적으로 선택
  * 참고: [https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayaddingmultipleauthenticationservers.htm#apigatewayaddingmultipleauthenticationservers_topic-Examples__section_JWT_auth_only_example](https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayaddingmultipleauthenticationservers.htm#apigatewayaddingmultipleauthenticationservers_topic-Examples__section_JWT_auth_only_example)
* 백엔드 라우팅 요청에 대해 백엔드를 동적으로 선택
  * 참고: [https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewaydynamicroutingbasedonrequest_topic.htm#apigatewaydynamicroutingbasedonrequest_topic](https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewaydynamicroutingbasedonrequest_topic.htm#apigatewaydynamicroutingbasedonrequest_topic)
* 사용자 정의 Claim으로 부터 추출된 값을 Header 혹은 Query 파라미터를 통해 Backend로 전달

## Support for Kubernetes version 1.28.2
* **Services:** Container Engine for Kubernetes
* **Release Date:** Dec. 19, 2023
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/3035314e-45ea-45e9-b4d0-6c9339ba57ee/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/3035314e-45ea-45e9-b4d0-6c9339ba57ee/){:target="_blank" rel="noopener"}

### 릴리즈 내용
릴리즈 내용
OKE에 Kubernetes 1.28.2 버전이 추가되었습니다. 이로써 기존 1.25.12버전은 2024년 2월 15일부터 더 이상 지원하지 않습니다.

현재 지원 버전
1.28.2
1.27.2
1.26.7