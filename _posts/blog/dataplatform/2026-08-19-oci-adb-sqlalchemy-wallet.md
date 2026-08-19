---
layout: page-fullwidth
#
# Content
#
subheadline: "DataPlatform"
title: "SQLAlchemy로 OCI Autonomous Database에 Wallet(mTLS) 연결하기"
teaser: "OCI Autonomous Database(ADB)의 Instance Wallet을 사용하여 Python SQLAlchemy와 python-oracledb Thin mode로 안전하게 연결하고, Conda 환경 구성부터 테스트 쿼리와 샘플 데이터 생성까지 확인하는 방법을 정리합니다."
author: "yhcho"
breadcrumb: true
categories:
  - dataplatform
tags:
  - [oci, autonomous-database, adb, python, sqlalchemy, python-oracledb, wallet, mtls]
#
# Styling
#
header: no

---

<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>

### 개요

OCI Autonomous Database(ADB)는 데이터베이스 접속을 위해 TLS 또는 mTLS(Mutual TLS)를 사용할 수 있습니다. 이 글에서는 **Wallet을 사용하는 mTLS 방식**으로 Python 애플리케이션에서 ADB에 연결합니다.

일반 Oracle Database 연결은 보통 `호스트:포트/서비스명`을 URL에 넣어 구성합니다. 반면 ADB Wallet 연결에서는 Wallet에 포함된 `tnsnames.ora`의 **TNS alias**와 인증서를 사용해야 합니다. 따라서 `tcps` 프로토콜이나 포트를 SQLAlchemy URL에 직접 조합하기보다, `python-oracledb`의 연결 인자로 Wallet 디렉터리와 alias를 전달하는 방식이 명확하고 안전합니다.

이번 예제는 `python-oracledb`의 기본 **Thin mode**를 사용합니다. Thin mode는 Oracle Instant Client를 설치하지 않고도 ADB에 직접 연결할 수 있습니다.

```
Python application
        │
        │ SQLAlchemy + python-oracledb (Thin mode)
        │ Wallet: tnsnames.ora + ewallet.pem
        ▼
OCI Autonomous Database (mTLS / TCPS)
```

### 목표

* OCI Console에서 ADB Instance Wallet 다운로드
* Conda 기반 Python 3.11 환경 생성 및 패키지 설치
* 환경 변수로 DB 계정·Wallet 경로·TNS alias 관리
* SQLAlchemy로 ADB 접속 확인
* 조회 쿼리 실행 및 개발용 샘플 테이블·데이터 생성

### 사전 준비

* OCI Autonomous Database 인스턴스
* Wallet을 다운로드할 권한 또는 관리자에게서 전달받은 Wallet
* ADB 데이터베이스 사용자 계정과 비밀번호
* Python용 Conda 또는 Miniconda

> 이 글은 Wallet 기반 **mTLS** 연결 예제입니다. ADB에서 Wallet 없이 TLS 접속을 허용한 경우에는 별도의 Easy Connect 방식으로 연결할 수 있지만, Wallet 구성과는 다릅니다.

### 1. ADB Wallet 다운로드

OCI Console에서 다음 순서로 Wallet을 다운로드합니다. 아래 화면은 OCI Console의 한국어 UI를 기준으로 합니다.

**1) Oracle AI Database 서비스로 이동**

OCI Console의 탐색 메뉴에서 **Oracle AI Database > 자율운영 AI 데이터베이스**를 선택합니다.

![](/assets/img/dataplatform/2026/blog/sqlalchemy/adb-wallet-1.png "Oracle AI Database 메뉴에서 자율운영 AI 데이터베이스 선택")

**2) 대상 Autonomous Database 선택**

자율운영 AI 데이터베이스 목록에서 Wallet을 내려받을 대상 인스턴스를 선택합니다.

![](/assets/img/dataplatform/2026/blog/sqlalchemy/adb-wallet-2.png "자율운영 AI 데이터베이스 목록에서 대상 인스턴스 선택")

**3) 데이터베이스 접속 화면 열기**

인스턴스 상세 화면 오른쪽 위의 **데이터베이스 접속**을 클릭합니다.

![](/assets/img/dataplatform/2026/blog/sqlalchemy/adb-wallet-3.png "인스턴스 상세 화면의 데이터베이스 접속 버튼")

**4) Instance wallet 다운로드 선택**

**클라이언트 자격 증명(전자 지갑) 다운로드** 영역에서 전자 지갑 유형을 **인스턴스 전자 지갑**으로 선택하고 **전자 지갑 다운로드**를 클릭합니다.

![](/assets/img/dataplatform/2026/blog/sqlalchemy/adb-wallet-4.png "인스턴스 전자 지갑 선택 및 전자 지갑 다운로드")

**5) Wallet 암호 설정 및 다운로드**

다운로드 대화 상자에서 Wallet 암호와 암호 확인 값을 입력한 뒤 **다운로드**를 클릭합니다. 이 암호는 ADB 사용자 비밀번호가 아니라, 내려받는 Wallet 파일을 보호하기 위한 별도 암호입니다.

![](/assets/img/dataplatform/2026/blog/sqlalchemy/adb-wallet-5.png "Wallet 암호 입력 후 다운로드")

애플리케이션이나 일반 사용자에게는 특정 ADB 하나에만 유효한 **Instance wallet**을 사용하는 것이 좋습니다. Regional wallet은 같은 테넌시·리전의 여러 ADB에 접근할 수 있으므로 관리 목적 외에는 불필요하게 넓은 권한을 줄 수 있습니다.

다운로드한 파일은 보통 `Wallet_<DB명>.zip` 형식입니다. 압축을 풀고, 프로젝트 밖의 권한이 제한된 경로에 보관합니다.

```bash
mkdir -p ~/secure/Wallet_MYADB
unzip ~/Downloads/Wallet_MYADB.zip -d ~/secure/Wallet_MYADB
chmod 700 ~/secure/Wallet_MYADB
chmod 600 ~/secure/Wallet_MYADB/*
```

Thin mode에서 필요한 핵심 파일은 다음 두 개입니다.

* `tnsnames.ora`: 접속 서비스 alias와 connect descriptor를 정의합니다.
* `ewallet.pem`: mTLS 연결에 사용하는 PEM 형식 인증서 파일입니다.

Wallet에는 `cwallet.sso`, `ewallet.p12`, `sqlnet.ora`, `README` 등도 포함될 수 있습니다. `README`에서 Wallet 인증서 만료일도 확인합니다.

> Wallet 파일과 DB 사용자 ID/비밀번호를 모두 가진 사용자는 데이터베이스에 접근할 수 있습니다. Wallet을 Git에 커밋하거나 컨테이너 이미지에 포함하지 말고, 전달 시 Wallet 암호도 별도 채널로 관리합니다.

### 2. TNS alias 확인

Wallet 디렉터리의 `tnsnames.ora`를 열어 사용할 alias를 확인합니다.

```bash
grep -E '^[[:alnum:]_]+[[:space:]]*=' ~/secure/Wallet_MYADB/tnsnames.ora
```

ADB 이름이 `myadb`라면 일반적으로 아래와 유사한 alias가 보입니다.

```text
myadb_high =
myadb_medium =
myadb_low =
myadb_tp =
myadb_tpurgent =
```

분석·대량 조회처럼 동시성보다 리소스가 필요한 작업은 `high`, `medium`, `low` 서비스 중 워크로드에 맞는 것을 선택합니다. 트랜잭션 처리에는 `tp`, 지연 시간이 특히 중요한 짧은 트랜잭션에는 `tpurgent`를 검토합니다. 실제로 허용된 서비스와 워크로드 정책은 ADB 설정을 우선합니다.

### 3. Conda 환경 생성과 패키지 설치

호환성과 일반적인 라이브러리 생태계를 고려해 Python 3.11 환경을 사용합니다.

```bash
conda create -n adb-sqlalchemy python=3.11 -y
conda activate adb-sqlalchemy

python -m pip install --upgrade pip
python -m pip install "SQLAlchemy>=2.0" "oracledb>=2.0"
```

프로젝트에서 `requirements.txt`를 사용한다면 다음과 같이 작성할 수 있습니다.

```text
SQLAlchemy>=2.0
oracledb>=2.0
```

```bash
python -m pip install -r requirements.txt
```

`cx_Oracle`는 새 릴리스가 중단된 이전 드라이버입니다. 신규 코드에서는 이름이 바뀐 후속 드라이버인 `python-oracledb`와 SQLAlchemy URL `oracle+oracledb://`를 사용합니다.

### 4. 환경 변수 설정

소스 코드에 계정, DB 비밀번호, Wallet 비밀번호를 작성하지 않고 환경 변수로 주입합니다. 아래 값에서 `ADB_DSN`은 직접 만든 주소가 아니라 앞에서 확인한 `tnsnames.ora`의 alias입니다.

```bash
export ADB_USER='APP_USER'
export ADB_PASSWORD='데이터베이스_사용자_비밀번호'
export ADB_WALLET_DIR="$HOME/secure/Wallet_MYADB"
export ADB_WALLET_PASSWORD='Wallet_다운로드_암호'
export ADB_DSN='myadb_medium'
```

개발 환경에서 `.env` 파일을 사용한다면 반드시 Git에서 제외합니다.

```gitignore
.env
wallet/
Wallet_*/
*.pem
*.p12
*.sso
```

> DB 사용자 비밀번호(`ADB_PASSWORD`)와 Wallet 다운로드 암호(`ADB_WALLET_PASSWORD`)는 서로 다른 값입니다.

### 5. SQLAlchemy 연결 테스트

다음 코드는 Wallet 기반 mTLS 연결을 생성하고 `DUAL` 조회로 접속을 확인합니다. `config_dir`는 `tnsnames.ora`의 위치, `wallet_location`은 `ewallet.pem`의 위치를 뜻합니다. 두 파일을 같은 Wallet 디렉터리에 두었다면 두 값은 같습니다.

```python
import os

from sqlalchemy import create_engine, text

wallet_dir = os.environ["ADB_WALLET_DIR"]

engine = create_engine(
    "oracle+oracledb://@",
    connect_args={
        "user": os.environ["ADB_USER"],
        "password": os.environ["ADB_PASSWORD"],
        "dsn": os.environ["ADB_DSN"],
        "config_dir": wallet_dir,
        "wallet_location": wallet_dir,
        "wallet_password": os.environ["ADB_WALLET_PASSWORD"],
    },
    pool_pre_ping=True,
)

with engine.connect() as connection:
    row = connection.execute(
        text(
            """
            SELECT
                SYS_CONTEXT('USERENV', 'DB_NAME') AS db_name,
                SYS_CONTEXT('USERENV', 'CURRENT_USER') AS current_user,
                SYS_CONTEXT('USERENV', 'SERVICE_NAME') AS service_name,
                SYSTIMESTAMP AS connected_at
            FROM dual
            """
        )
    ).mappings().one()

print(dict(row))
engine.dispose()
```

파일을 `test_adb_connection.py`로 저장했다면 다음과 같이 실행합니다.

```bash
python test_adb_connection.py
```

성공 시 DB 이름, 실제 접속 계정, 서비스 이름, 접속 시각이 출력됩니다. 접속 URL이나 환경 변수 전체를 로그에 출력하면 비밀번호가 노출될 수 있으므로 주의합니다.

### 6. SELECT 쿼리 실행

연결 객체를 사용해 SQLAlchemy `text()`로 SQL을 실행할 수 있습니다.

```python
from sqlalchemy import text

with engine.connect() as connection:
    rows = connection.execute(
        text("SELECT table_name FROM user_tables ORDER BY table_name")
    ).mappings()

    for row in rows:
        print(row["TABLE_NAME"])
```

샘플 테이블을 만든 뒤에는 다음과 같은 조인 쿼리도 실행할 수 있습니다.

```python
sql = text(
    """
    SELECT c.customer_name, o.order_amount, o.order_status, o.ordered_at
    FROM app_customers c
    JOIN app_orders o ON o.customer_id = c.customer_id
    ORDER BY o.order_id
    """
)

with engine.connect() as connection:
    for row in connection.execute(sql).mappings():
        print(dict(row))
```

### 7. 개발용 샘플 테이블과 데이터 생성

아래 SQL은 현재 접속한 사용자 스키마에 `APP_CUSTOMERS`, `APP_ORDERS` 테이블을 생성하고 샘플 데이터를 입력합니다. 반복 실행할 수 있도록 기존 테이블을 먼저 제거합니다.

> 기존 테이블과 데이터를 삭제하므로 **개발·실습용 스키마에서만** 실행합니다. 운영 환경에서는 절대 그대로 실행하지 않습니다.

```sql
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE app_orders CASCADE CONSTRAINTS PURGE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE app_customers CASCADE CONSTRAINTS PURGE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

CREATE TABLE app_customers (
    customer_id   NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    email         VARCHAR2(255) NOT NULL UNIQUE,
    status        VARCHAR2(20) DEFAULT 'ACTIVE' NOT NULL,
    created_at    TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT app_customers_status_ck CHECK (status IN ('ACTIVE', 'INACTIVE'))
);

CREATE TABLE app_orders (
    order_id     NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    customer_id  NUMBER NOT NULL,
    order_amount NUMBER(12, 2) NOT NULL,
    order_status VARCHAR2(20) DEFAULT 'PENDING' NOT NULL,
    ordered_at   TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT app_orders_customer_fk
        FOREIGN KEY (customer_id) REFERENCES app_customers(customer_id),
    CONSTRAINT app_orders_amount_ck CHECK (order_amount > 0),
    CONSTRAINT app_orders_status_ck
        CHECK (order_status IN ('PENDING', 'PAID', 'CANCELLED'))
);

INSERT INTO app_customers (customer_name, email, status)
VALUES ('Kim Minji', 'minji.kim@example.com', 'ACTIVE');
INSERT INTO app_customers (customer_name, email, status)
VALUES ('Lee Jisoo', 'jisoo.lee@example.com', 'ACTIVE');
INSERT INTO app_customers (customer_name, email, status)
VALUES ('Park Junho', 'junho.park@example.com', 'INACTIVE');

INSERT INTO app_orders (customer_id, order_amount, order_status)
SELECT customer_id, 120000, 'PAID'
FROM app_customers WHERE email = 'minji.kim@example.com';
INSERT INTO app_orders (customer_id, order_amount, order_status)
SELECT customer_id, 38500, 'PENDING'
FROM app_customers WHERE email = 'minji.kim@example.com';
INSERT INTO app_orders (customer_id, order_amount, order_status)
SELECT customer_id, 79000, 'CANCELLED'
FROM app_customers WHERE email = 'jisoo.lee@example.com';

COMMIT;
```

Database Actions의 SQL Worksheet나 SQL Developer에서 위 스크립트를 전체 실행한 뒤, 다음 조회로 확인합니다.

```sql
SELECT
    c.customer_id,
    c.customer_name,
    c.status AS customer_status,
    o.order_id,
    o.order_amount,
    o.order_status
FROM app_customers c
LEFT JOIN app_orders o ON o.customer_id = c.customer_id
ORDER BY c.customer_id, o.order_id;
```

### 8. 트러블슈팅

#### `DPY-4026` 또는 TNS alias를 찾을 수 없는 오류

* `ADB_DSN`이 `tnsnames.ora`의 alias와 정확히 일치하는지 확인합니다.
* `ADB_WALLET_DIR`에 `tnsnames.ora`가 실제로 있는지 확인합니다.
* alias는 `host:port/service` 형식으로 임의 변경하지 않습니다.

#### 인증 또는 TLS 연결 오류

* DB 사용자 비밀번호와 Wallet 다운로드 암호를 바꾸어 입력하지 않았는지 확인합니다.
* `ewallet.pem`이 Wallet 경로에 있는지 확인합니다.
* Wallet이 만료되었다면 새 Wallet을 다운로드하고 배포합니다.

#### 접속 시간이 초과되거나 네트워크 오류가 발생하는 경우

* ADB의 Public endpoint 또는 Private endpoint 구성을 확인합니다.
* Private endpoint ADB라면 실행 환경이 해당 VCN에 도달할 수 있는지 확인합니다.
* NSG, Security List, 사내 방화벽·프록시 정책에서 ADB 연결을 막고 있지 않은지 확인합니다.

#### `DPI-1047: Cannot locate a 64-bit Oracle Client library`

이 예제의 Thin mode에서는 Oracle Instant Client가 필요하지 않습니다. 기존 코드에 `oracledb.init_oracle_client()` 또는 `cx_Oracle.init_oracle_client()`가 있다면 제거하고, `oracle+oracledb://` 드라이버를 사용하고 있는지 확인합니다.

### 마무리

ADB Wallet 연결의 핵심은 TCPS 주소를 직접 조립하는 것이 아니라, Wallet의 `tnsnames.ora` alias와 `ewallet.pem` 인증서를 `python-oracledb`에 전달하는 것입니다. 개발 환경에서는 Thin mode로 간단히 시작하고, 운영 환경에서는 Wallet과 비밀번호를 OCI Vault 또는 배포 환경의 Secret으로 관리하며 Wallet 만료·교체 절차도 운영 정책에 포함하는 것이 좋습니다.

### 참고 자료

* [SQLAlchemy Oracle Dialect - Connecting to Oracle Autonomous Database](https://docs.sqlalchemy.org/en/20/dialects/oracle.html)
* [Oracle - Connect Python Applications with a Wallet (mTLS)](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/connecting-python-mtls.html)
* [Oracle - Download Client Credentials (Wallets)](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/connect-download-wallet.html)
