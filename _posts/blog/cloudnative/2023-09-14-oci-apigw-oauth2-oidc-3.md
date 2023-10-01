---
layout: page-fullwidth
#
# Content
#
subheadline: "CloudNative"
title: "OCI API Gateway를 위한 OpenID Connect(OIDC) 인증 후 로그아웃 적용"
teaser: "OCI API Gateway를 위한 OpenID Connect(OIDC) 구성 후 로그아웃 적용 방법에 대해서 설명합니다."
author: dankim
breadcrumb: true
categories:
  - cloudnative
tags:
  - [api, oauth2, openid connect]
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

### 사전 준비 사항
이번 실습을 위해 사전에 [OCI API Gateway를 위한 OpenID Connect(OIDC) 구성](https://the-team-oasis.github.io/cloudnative/oci-apigw-oauth2-oidc-2/)을 통해서 OCI Identity Domain의 Credential Application 및 OCI API Gateway 사전 구성이 필요합니다.

### 실습 내용
[OCI API Gateway를 위한 OpenID Connect(OIDC) 구성](https://the-team-oasis.github.io/cloudnative/oci-apigw-oauth2-oidc-2/) 과정에서 API Gateway에 배치된 API 엔드 포인트에 OpenID Connect를 통한 인증을 적용하는 방법에 대해서 알아보았습니다. 이제 API Gateway의 로그아웃 API 엔드포인트를 통해서 IdP(Identity Domain)를 통해서 생성된 세션과 쿠키정보를 삭제하여 로그아웃을 구현해보도록 합니다.

### API Gateway에 로그아웃 API 배치
[OCI API Gateway를 위한 OpenID Connect(OIDC) 구성](https://the-team-oasis.github.io/cloudnative/oci-apigw-oauth2-oidc-2/) 과정에서 생성한 API Gateway (hello-apigw)를 활용합니다. 앞서 생성한 API Gateway (hello-apigw)를 선택한 후 Deployments에서 생성한 hello Deployment를 선택, Edit 버튼을 클릭합니다.
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-26.png " ")

**Authentication**단계에서 다음과 같이 추가 설정합니다.
* **Enable anonymous access:** Check
  * 로그아웃이 성공한 후 이동하는 페이지는 인증이 필요하지 않으므로 **Authorization Type**이 **Annonymous**여야 합니다. 따라서 이 부분을 체크해야 합니다.
  ![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-26-1.png " ")
* **Validation failure policy**
  * **Logout path:** /logout
  ![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-27.png " ")

Routes에서 **Another route**를 클릭한 후 다음과 같이 **Route 2**를 추가합니다.
* **Path:** /logout
* **Method:** GET
* **Backend Type:** Logout
* **Allowed post logout URIs:** 로그아웃이 성공하면 최종적으로 호출하는 URL입니다. 여기서는 아래 **Route 3**에서 등록한 Route로 이동하도록 해당 API Gateway 배치 엔드포인트와 Route를 포함한 전체 주소를 입력합니다.
  * 예시) https://dy5mzlv4uhvrn.........apigateway.ap-seoul-1.oci.customer-oci.com/home
* **Post logout state:** request.query[user]
  * 로그아웃 완료 후 이동하는 페이지로 전달할 데이터입니다.
* **Show route request policies:** 클릭
  * **Authorization:** Authentication only

![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-28.png " ")

동일하게 **Route 3**을 추가합니다. **Route 3**은 로그아웃이 성공한 후 이동하기 위한 API Route 입니다.
* **Path:** /home
* **Method:** GET
* **Backend Type:** Stock response
* **Status code:** 200
* **Body:** { "message": ":Logged out" }
* **Show route request policies:** 클릭
* **Header name:** Content-type, **Header value:** application/json
* **Authorization:** Annonymous
  * 로그아웃이 성공한 후 이동하는 페이지는 인증이 필요하지 않으므로 **Annonymous**를 선택해야 합니다.
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-29.png " ")

이제 **Next**를 클릭한 후 **Save changes**를 클릭하여 저장합니다.

### Identity Domain에서 Critical Application에 로그아웃 설정
[OCI API Gateway를 위한 OpenID Connect(OIDC) 구성](https://the-team-oasis.github.io/cloudnative/oci-apigw-oauth2-oidc-2/)과정에서 생성한 Critical Application(Hello APIGW Application)에 로그아웃 설정을 합니다.

**Hello APIGW Application**을 선택한 후 **Edit OAuth configuration**를 클릭합니다. 다음과 같이 추가합니다.

* **Redirect URL:** API Gateway에 배치된 로그아웃 API 엔드포인트
  * 예시) https://dy5mzlv4uhvrn.........apigateway.ap-seoul-1.oci.customer-oci.com/logout
* **Post-logout redirect URL:** API Gateway에 배치된 로그아웃 성공 후 호출하는 API 엔드포인트
  * 예시) https://dy5mzlv4uhvrn.........apigateway.ap-seoul-1.oci.customer-oci.com/home
* **Logout URL:** API Gateway에 배치된 로그아웃 API 엔드포인트
  * 예시) https://dy5mzlv4uhvrn.........apigateway.ap-seoul-1.oci.customer-oci.com/logout

![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-30.png " ")

**Save changes**를 클릭하여 저장합니다.

### 로그아웃 테스트
크롬 브라우저에서 테스트합니다. 브라우저에서 API Gateway에 배치한 **API 엔드포인트 + Route Path**(예시: https://dy5mzlv4uhvrn.........apigateway.ap-seoul-1.oci.customer-oci.com/hello)를 요청하면 다음과 같이 OCI 인증 페이지를 볼 수 있습니다. 
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-24.png " ")

인증을 완료하면, 다음과 같이 정상적으로 응답 결과를 볼 수 있습니다.
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-31.png " ")

이제 로그아웃을 합니다. 브라우저에서 API Gateway에 배치한 로그아웃 API 엔드포인트를 호출하면서 **Post logout state** 데이터로 **user={사용자}&postLogoutUrl={로그아웃 후 이동할 페이지}**을 같이 보냅니다.  

**예시**
```
https://dy5mzlv4uhvrn.........apigateway.ap-seoul-1.oci.customer-oci.com/logout?user=dankim&postLogoutUrl=https://dy5mzlv4uhvrn.........apigateway.ap-seoul-1.oci.customer-oci.com/home)
```

다음과 같이 로그아웃이 성공한 후 다음 페이지로 이동한 것을 확인할 수 있습니다.
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-32.png " ")

### 참고 웹사이트
https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayaddinglogoutbackends.htm
