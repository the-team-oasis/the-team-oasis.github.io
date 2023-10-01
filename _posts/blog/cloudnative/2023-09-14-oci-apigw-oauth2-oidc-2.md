---
layout: page-fullwidth
#
# Content
#
subheadline: "CloudNative"
title: "OCI API Gateway를 위한 OpenID Connect(OIDC) 구성"
teaser: "OCI API Gateway를 위한 OpenID Connect(OIDC) 구성 방법에 대해서 알아봅니다."
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

### OCI API Gateway
OCI API Gateway는 여러 유형의 백엔드 엔드포인트 혹은 서비스를 프라이빗 혹은 퍼블릭의 단일 API 엔드포인트로 통합하고, 라우팅을 해주는 서비스입니다. API 엔드포인트는 API 유효성 검사, 요청 및 응답 변환, CORS, 인증 및 권한 부여, 요청 제한등의 기능을 수행할 수 있습니다. 여기서 API Gateway는 OCI Identity Domain과 통합되어 인증 및 인가를 통해 API를 보호할 수 있습니다. API 보안을 위해서 현재 OCI API Gateway는 OAuth2와 OpenID Connect(OIDC)를 지원합니다. 

이번 포스팅에서는 OCI API Gateway에서 OpenID Connect로 API 인증 적용을 위한 OCI Identity Domain 설정 및 API Gateway와의 통합 방법에 대해서 설명합니다. 
> OCI API Gateway에서 Auth2로 API 인증 적용 방법은 [OCI API Gateway를 위한 OAuth2 구성](https://the-team-oasis.github.io/cloudnative/oci-apigw-oauth2-oidc-1/)을 참고하세요.

> 이번 글에서는 API Gateway에 OpenID Connect 구성 방법에 대해서만 설명하며, 관련 개념에 대해서는 따로 다루지 않습니다.

### OCI API Gateway에서 OpenID Connect (OIDC)을 구성하는 방법
#### OpenID Connect란
OpenID Connect(이하 OIDC)는 비영리기관인 OpenID Foundation에서 추진하는 개방형 표준 및 분산 인증 프로토콜로 OAuth 2.0 프로토콜 위에서 동작하는 간단한 ID 레이어입니다. OAuth의 주 목적이 인가(Authorization)라면, OIDC는 인증(Authentication)이 주 목적입니다. 즉 OAuth2는 리소스 접근을 위한 Access Token을 얻는것이 목적이고, OIDC는 사용자의 정보를 담고 있는 ID 토큰을 얻는 것이 목적입니다. OIDC를 사용하면 웹 기반, 모바일, 자바스크립트 클라이언트 등을 포함한 모든 유형의 클라이언트에서 인증 세션과 최종 사용자에 대한 정보를 요청하고 받을 수 있습니다. OIDC에서 IdP(Identity Provider)는 OIDC 서비스를 제공하는 당사자(구글, 페이스북, 카카오등)를 얘기합니다. 여기서는 OCI의 Identity Domain이 이 역할을 수행합니다. 또한 RP (Reply Party)라는 용어도 나오는데, 이는 사용자를 인증하기 위해서 IdP에 의존하는 주체로 여기서는 OCI API Gateway가 이 역할을 수행한다고 볼 수 있습니다.

![](https://www.ateam-oracle.com/content/published/api/v1.1/assets/CONT09A8100E63B748F58CEF6691D8A38B96/Medium?cb=_cache_24c6&format=jpg&channelToken=12f676b76bf44b4e9b22e6b36ebfe358)
<div style="text-align:right"><small markdown="1" style="text-align:right">source: https://www.ateam-oracle.com/post/oidc-oci-api-gateway</small></div>

위 그림은 OIDC가 OCI Identity Domain(IdP), OCI API Gateway(RP)와 동작하는 과정을 보여줍니다.
1. 클라이언트에서 OCI API Gateway에 배치된 API 엔드포인트를 호출합니다.
2. OCI API Gateway는 인증을 위해 IdP(OCI Identity Domain)로 연결합니다.
3. 클라이언트는 IdP를 통해 인증합니다. 일반적으로 브라우저를 통해 인증을 수행합니다. 
4. 성공적으로 인증이 되면 클라이언트는 일회용 인증 코드(Authorization Code)를 받습니다.
5. 클라이언트는 인증 코드(Authorization Code)와 함께 다시 API Gateway에 배치된 API 엔드포인트로 리다이렉트합니다.
6. OCI API Gateway는 IdP(OCI Identity Domain)에 인증 코드(Authorization Code)를 Access Token으로 교체 요청을 합니다.
7. IdP(OCI Identity Domain)가 API Gateway로 Access Token을 전달합니다.
8. 발급받은 Access Token을 통해서 API Gateway는 배치된 API 엔드포인트를 통해 백엔드 서비스를 호출합니다.
9. API Gateway는 백엔드 서비스를 통해서 응답을 받습니다.
10. API Gateway는 전달받은 응답을 클라이언트로 전달합니다.

#### 사전 준비 사항
이번 실습을 위해 사전에 [OCI API Gateway를 위한 OAuth2 구성](https://the-team-oasis.github.io/cloudnative/oci-apigw-oauth2-oidc-1/)을 통해서 OCI Identity Domain의 Credential Application 및 API Gateway 사전 구성이 필요합니다.

#### OCI Identity Domain에서 Credential Application 구성 변경
[OCI API Gateway를 위한 OAuth2 구성](https://the-team-oasis.github.io/cloudnative/oci-apigw-oauth2-oidc-1/)에서 OAuth2를 위해 구성한 Credential Application을 활용합니다. 위에서 생성한 **Hello APIGW Application**을 클릭한 후 **Edit OAuth configuration**을 클릭합니다.

![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-19.png " ")

Resource Server 구성을 하여 별도의 Scope와 Audience를 설정할 수 있지만, OpenID의 표준 Scope인 ```openid```를 사용하여 구성할 수 있습니다. 여기서는 별도의 Resource Server 구성을 하지 않고 진행합니다. **No resource server configuration**를 선택합니다.

Client 구성에서는 IdP(Identity Domain)을 통해서 일회용 인증 코드(Authorization code)를 발급받아야 하므로, Allowed grant types에서 **Authorization Code**를 선택합니다.

인증 코드(Authorization code)를 선택하면 Redirect URL값은 필수입니다. API Gateway 배치 엔드포인트와 Route를 포함한 전체 주소를 입력합니다. 다음은 예시입니다.
```
https://dy5mzlv4uhvrn.........apigateway.ap-seoul-1.oci.customer-oci.com/hello
```
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-20.png " ")

마지막으로 클라이언트에서 Scope를 사용하지 않을 것이므로 **Add resources** 체크를 해제한 후 **Save changes**를 클릭하여 저장합니다.

#### API Gateway 배치 Route 구성 변경
[OCI API Gateway를 위한 OAuth2 구성](https://the-team-oasis.github.io/cloudnative/oci-apigw-oauth2-oidc-1/)에서 생성한 API Gateway(hello-apigw)를 선택한 후 좌측 Deployments에서 생성한 Deployment(hello)를 선택, **Edit**을 선택합니다. Basic Information은 Skip(Next 클릭)한 후 **Authentication** 단계에서 다음과 같이 수정합니다.

* **Audiences:** ```hello```를 ```Client ID 값으로 변경```로 변경 (예, ae09790ecc454fc8b619cced26948c4f)
  * API Gateway입장에서 Audiences는 토큰을 발급하는 주체(IdP)가 됨.
  * 따라서 IdP에 등록한 **Client ID** 혹은 **https://identity.oraclecloud.com/** 둘 다 가능
* **Validation failure policy:** OAuth2.0 redirect client to identity provider 선택
  * **Scopes:** openid (그 외에 profile, email, phone, address등도 가능하며, Resource Server 구성 시 별도의 Scope를 지정하였을 경우 해당 Scope도 추가 가능)
* **Response type:** CODE
* **Show advanced options**
  * **Use PKCE:** 체크

> PKCE(Proof Key for Code Exchange)는 인증 코드(Authorization Code)를 통한 Access Code 발급 과정에서 좀 더 강화된 보안을 제공해 주기위한 확장 버전으로, 클라이언트에서 인증 코드 요청 시 **Code Challenge**를 전달하게 되고(위 흐름에서 3번), API Gateway에서 인증 코드를 통해 Access Code 교환 요청 시 **code_verifier**를 전달(위 흐름에서 6번)하여 IdP가 두 코드를 비교한 후 Access Code를 발급하게 함으로써 인증 코드를 탈취 당하더라도 Access Code를 발급받지 못하도록 막을 수 있습니다.

![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-21.png " ")
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-22.png " ")

이제 **Next**를 클릭한 후 **Routes**단계에서 **Show route response policies** 를 클릭한 후 다음과 같이 **Header transformations** 설정을 합니다. 이 단계에서 클라이언트로 **id_token**과 **access_token**을 직접 전달할 수 있습니다.
* **Header transformations**
  * **Behavior:** Overwrite, **Header name:** id_token, **Values:** ${request.auth[id_token]}
  * **Behavior:** Overwrite, **Header name:** access_token, **Values:** ${request.auth[access_token]}

**Next**를 클릭한 후 **Review** 단계에서 **Save changes**를 클릭하여 저장합니다.
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-23.png " ")

### OpenID Connect 적용 테스트
크롬 브라우저에서 테스트합니다. 브라우저에서 API Gateway에 배치한 **API 엔드포인트 + Route Path**(예시: https://dy5mzlv4uhvrn.........apigateway.ap-seoul-1.oci.customer-oci.com/hello)를 요청하면 다음과 같이 OCI 인증 페이지를 볼 수 있습니다. 
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-24.png " ")

인증을 완료하면, 다음과 같이 정상적으로 응답 결과를 볼 수 있습니다. 인증 코드(Authorization Code)를 요청하는 과정에서 **code_challenge**가 같이 전달되는 것을 확인할 수 있으며, 발급받은 인증 코드를 통해서 API 엔드포인트를 호출하는 것을 확인할 수 있습니다.
![](/assets/img/cloudnative-security/2023/oci-apigw-oauth2-oidc-25.png " ")

### 참고 웹사이트
* https://docs.oracle.com/en-us/iaas/Content/APIGateway/Tasks/apigatewayaddingauthzauthn.htm
* https://www.ateam-oracle.com/post/oidc-oci-api-gateway
* https://hudi.blog/open-id/
* https://juniortech.tistory.com/15