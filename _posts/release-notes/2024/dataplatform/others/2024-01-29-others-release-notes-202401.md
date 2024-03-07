---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2024"
title: "1월 OCI Database Service - Others 업데이트 소식"
teaser: "2024년 1월 OCI Database Service - Others 업데이트 소식입니다."
author: yhcho
breadcrumb: true
categories:
  - release-notes-2024-others
tags:
  - oci-release-notes-2024
  - Jan-2024
  - Others
  - Redis
  - OCI Cache with Redis
  - PostgreSQL
  - OCI Database with PostgreSQL
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

## OCI Database with PostgreSQL adds support for uuid-ossp extension
* **Services:** OCI Database with PostgreSQL
* **Release Date:** Jan. 16, 2024
* **Documentation:** [https://docs.oracle.com/en-us/iaas/releasenotes/changes/d9371373-a78f-49bc-b77d-12de5be5c8ea/](https://docs.oracle.com/en-us/iaas/releasenotes/changes/d9371373-a78f-49bc-b77d-12de5be5c8ea/){:target="_blank" rel="noopener"}

### 업데이트 내용
이번 업데이트를 통해 OCI Database with PostgreSQL 서비스에서 uuid-ossp extension을 지원합니다. 
이 extension은 UUID(Universally Unique Identifier)를 생성하고 다루는데 사용하는 개발자를 위한 강력한 도구 입니다.
이 extension은 OSF(Open Software Foundation)의 DCE(분산 컴퓨팅 환경) 표준에 따라 UUID(Universally Unique Identifier)를 생성합니다.

#### 설치 방법
uuid-ossp extension을 사용하려면 다음 명령을 실행하여 확장 프로그램을 설치할 수 있습니다.
```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

#### uuid-ossp extension 제공 function 과 간단한 사용 예제
- uuid_generate_v1() : 시간 기반 UUID 생성
- uuid_generate_v3(namespace uuid, name text) : MD5 해시 기반 UUID 생성
- uuid_generate_v4() : 랜덤 UUID 생성
- uuid_generate_v5(namespace uuid, name text) : SHA-1 해시 기반 UUID 생성

```sql
INSERT INTO my_table (id, name) VALUES (uuid_generate_v4(), 'My Name');
```
더 자세한 내용은 [PostgreSQL 공식 문서](https://www.postgresql.org/docs/13/uuid-ossp.html){:target="_blank" rel="noopener"}를 참조하세요.