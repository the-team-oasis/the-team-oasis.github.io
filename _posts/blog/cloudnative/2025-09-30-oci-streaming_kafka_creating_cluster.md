---
layout: page-fullwidth
#
# Content
#
subheadline: "CloudNative"
title: "OCI Streaming with Apache Kafka Cluster 생성하기"
teaser: "OCI에서 제공하는 관리형 Apache Kafka 서비스인 Streaming with Apache Kafka 서비스에 대해서 알아보고 Cluster를 생성하는 방법에 대해서 소개합니다."
author: dankim
breadcrumb: true
categories:
  - cloudnative
tags:
  - [oci, kafka]
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

### OCI Streaming with Apache Kafka 서비스는?
OCI의 Streaming with Apache Kafka는 완전 관리형서비스로, 사용자가 직접 관리할 필요 없이 Kafka 클러스터를 생성하고 운영할 수 있게 해 줍니다. 기본적으로 Apache Kafka에서 제공하는 이벤트 스트림 쓰기/읽기, 스트림 저장, 실시간 및 배치 스트림 처리를 그대로 제공합니다.

#### 주요 특징
몇 가지 주요 특징은 다음과 같습니다.

1. **완전 관리형:** 패치, 업그레이드, 백업, 고가용성, 복제, 확장, 성능 관리 등의 자동화를 지원합니다.
2. **내구성과 가용성:**
  - 클러스터는 여러 가용성 도메인(Availability Domains) 또는 오류 도메인(Fault Domains)에 걸쳐 고가용성 및 스토리지를 여러 곳에 저장하여 장애가 발생해도 안전하도록 구성됩니다.
  - 브로커 장애를 자동으로 감지하고 복구하거나 대체하며, 가능한 경우 기존 저장소를 재사용하여 데이터 복제를 최소화할 수 있습니다.
3. **Kafka API 호환성:** Kafka 애플리케이션 코드를 거의 바꾸지 않고 그대로 쓸 수 있도록 100프로 호환성을 제공합니다.
4. **OCI 생태계 통합:**
  - OCI Vault: Superu ser 자격증명 관리
  - OCI Monitoring: 클러스터 메트릭 모니터링
  - OCI Logging: 클러스터 로그 관리

### Cluster 생성을 위해 필요한 Policy
Cluster를 생성하기 위해 필요한 Policy입니다. 

**User Permission**
그룹에 속한 사용자에게 Kafka Cluster에 대한 다양한 Action을 수행할 수 있는 권한을 부여합니다.
```
allow group <kafka_admin_group_name> to 
{KAFKA_CLUSTER_INSPECT, KAFKA_CLUSTER_READ,KAFKA_CLUSTER_CREATE, 
KAFKA_CLUSTER_DELETE, KAFKA_CLUSTER_UPDATE, KAFKA_CLUSTER_CONFIG_READ, 
KAFKA_CLUSTER_CONFIG_INSPECT, KAFKA_CLUSTER_CONFIG_CREATE, KAFKA_CLUSTER_CONFIG_UPDATE, 
KAFKA_CLUSTER_CONFIG_DELETE } in compartment <compartment-name> | tenancy
```

**Service Permission**
Kafka 서비스(Policy에서는 rawfka로 정의)가 vnics를 use할 수 있는 권한 부여
```
allow service rawfka to use vnics in compartment <compartment-name>
```

Kafka서비스가 subnets를 use할 수 있는 권한 부여
```
allow service rawfka to use subnets in compartment <compartment-name>
```

Kafka서비스가 network-security-groups를 use할 수 있는 권한 부여
```
allow service rawfka to use network-security-groups in compartment <compartment>
```

SASL_SCRAM 인증을 사용하는 경우 Vault Secret에 접근할 수 있는 권한 부여
```
allow service rawfka to read secrets in compartment <compartment-name>
```

### Cluster 생성
OCI Streaming with Apache Kafka 서비스에서 Cluster 생성을 위해 ***OCI Console 메뉴 > Developer Services > Application Integration > OCI Streaming with Apache Kafka***를 순서로 클릭하여 이동합니다. 이제 **Create cluster** 버튼을 클릭한 후 다음과 같이 입력하여 Cluster를 생성합니다.

1. **Cluster name:** <<Cluster 이름>>
  - ***예시: kafka_cluster_1***
2. **Compartment:** <<Kafka Cluster 생성할 구획>>
3. **Apache Kafka version:** 3.5.0, 3.6.0, 3.7.0 버전 중 선택 (2025년 9월 30일 기준)
4. Cluster type: Starter Cluster, High Availability Cluster 중 선택
  - Starter Cluster: 개발 및 테스트용도 (1-24 Broker 까지 생성 가능)
  - High Availability Cluster: 운영 환경을 위한 용도 (3-24 Broker까지 생성 가능)
5. Broker setup
  - Number of brokers: <<브로커 개수>> # Starter일 경우 Default 1
  - CPU per broker: <<각 브로커별 OCPU 수>> # Starter일 경우 Default 2
6. Storage
  - Storage per broker (GB): <<브로커별 스토리지 사이즈>>
7. Cluster Configuration
  - Cluster Configuration은 Broker와 Topic이 어떻게 설정되는지를 정의하는 매개변수입니다. Cluster 생성 시 기본 구성이 자동으로 생성됩니다. 만약 다른 구성이 필요한 경우 여기서 추가 및 수정합니다. Cluster를 생성한 후에는  CLI 또는 SDK를 사용해야만 구성을 변경할 수 있습니다.
8. Mutual TLS (mTLS)
  -  Mutual TLS(mTLS)를 사용할 경우 CA 인증서를 PEM 형식으로 입력합니다. Cluster 생성한 후에도 Console UI에서 CA 인증서를 추가 제공할 수 있습니다.
9. Choose VCN and subnet
  - Virtual cloud network: <<Cluster를 생성할 VCN 선택>>
  - Subnet: <<Cluster에서 사용할 Subnet 선택>>
10. Review and create
  - 마지막으로 전체 내용을 리뷰한 후에 **Create**버튼을 눌러 생성합니다.

생성이 완료되어 **Active** 상태가 되면 다음과 같이 Cluster 상세 화면에서 Cluster 정보를 확인할 수 있습니다.  
***SASL-SCRAM의 Bootstrap URL을 메모합니다.**
![](/assets/img/cloudnative-security/2025/oci-streaming_kafka_creating_cluster_1.png " ")

### SASL-SCRAM 인증 설정
OCI Streaming with Apache Kafka는 **SASL-SCRAM** 방식과 **mTLS** 방식의 인증을 제공합니다. 여기서는 **SASL-SCRAM** 방식의 인증 설정하는 방법을 설명합니다. SASL-SCRAM 방식의 인증을 사용하기 위해서는 다음 두 가지가 필요합니다.
1. Kafka Cluster에서 사용하는 Subnet의 Security List에 Ingress TCP 9092 포트 오픈
2. Vault Secret 생성

#### Kafka Cluster에서 사용하는 Subnet의 Security List에 Ingress TCP 9092 포트 오픈
우선 Kafka Cluster에서 사용하는 Subnet의 Security List로 이동해서 Security Rule에 9092 포트를 추가합니다. (참고: mTLS의 경우 9093포트 사용) 아래 그림에서는 어디에서든 Kafka Client로 접속할 수 있도록 Source CIDR를 **0.0.0.0/0**으로 지정하였습니다. 그 외 IP Protocol은 **TCP**, Destination Port Range는 **9092**로 설정하고 추가합니다.
![](/assets/img/cloudnative-security/2025/oci-streaming_kafka_creating_cluster_2.png " ")

#### Vault Secret 생성
Vault 및 Secret 생성을 위해 *** OCI Console 메뉴 > Identity and Security > Key Management & Secret Management > Vault***를 차례로 클릭한 후 **Create Vault** 버튼을 클릭합니다. Vault Name (예. MyVault)을 입력한 후 **Create** 버튼을 클릭합니다.

생성된 Vault를 클릭한 후 **Master encryption keys** 탭을 클릭합니다. **Create key** 버튼을 클릭한 후 다음과 같이 입력하고 생성합니다.
1. Protection Mode: {HSM, Software 중 선택}
  - Software protected Keys는 무료
  - HSM protected Keys는 첫 20개 키 버전까지만 무료
2. Name: {키 이름 입력}
  - 예시: MyKey
3. Key Shape: 
  - Algorithm: <<AES, RSA, ECDSA 중 선택>> (Default: AES)
  - Length: <<알고리즘에 따른 Length 선택>> (Default: 256 bits)

**Secrets** 탭을 클릭한 후 **Create secret** 버튼을 클릭합니다. 다음과 같이 입력하고 생성합니다.
1. Name: <<Secret 이름>>
  - 예시: kafka_secret
2. Encryption Key: <<앞에서 생성한 Master Encryption Key 선택>>
3. Secret generation
  - Kafka Cluster는 수동 Secret Generation만 지원하므로 **Manual secret generation** 선택
4. Secret Type Template: <<Plan-Text와 Base64 선택>>
  - **Plan-Text** 선택하여 진행
5. Secret contents: <<패스워드>>
그외 나머지는 Default로 설정한 후 생성합니다.

#### SASL/SCRAM 업데이트
이제 앞서 생성한 Kafka Cluster를 클릭하여 상세 화면으로 이동합니다. 우측 상단의 **Actions** 드롭다운 버튼을 클릭한 후 **Update SASL SCRAM**을 클릭합니다. 앞서 생성한 Vault와 Secret을 선택한 후 **Update** 버튼을 클릭합니다. 업데이트가 완료되면 다시 앞서 생성한 Vault Secret으로 이동합니다. 위 **Versions** 탭 선택하면 한 개의 버전이 추가된 것을 확인할 수 있습니다. 
![](/assets/img/cloudnative-security/2025/oci-streaming_kafka_creating_cluster_3.png " ")

오른쪽 버튼을 클릭한 후 **View Secret Contents**를 클릭합니다. 그리고 **Show decoded Base64 digit**을 Disable하면 `{"username": "super-user-xxxxxxxxx", "password": "2a984e42-4533-4b60-b1f0-xxxxxxxxxxx"}`와 같은 Secret을 확인할 수 있습니다. ***이 부분을 메모합니다.**
![](/assets/img/cloudnative-security/2025/oci-streaming_kafka_creating_cluster_4.png " ")

### Kafka Client 구성
Kafka Client는 Kafka Cluster의 Subnet에 하나의 VM 인스턴스를 생성하여 구성해 보도록 합니다. 준비된 인스턴스에 접속한 후에 OpenJDK를 설치합니다.

```
$ sudo yum install java-11-openjdk -y
```

Apache Kafka를 설치합니다. 여기서는 3.8.0 버전으로 접속 테스트를 진행합니다.
```
$ wget https://downloads.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz
```

압축을 해제합니다.
```
$ tar -xzf kafka_2.13-3.8.0.tgz
```

client.properties 파일을 생성을 위해 config 디렉토리로 이동합니다.
```
$ cd kafka_2.13-3.8.0/config
```

client.properties 파일을 생성합니다. username과 password는 앞서 Valut Secret에서 메모한 username과 password 값을 참고하여 수정한 후 저장합니다.
```
$ vi client.properties

## For SASL_SCRAM authentication  - add the following (replace OCI Secret name and password)
security.protocol=SASL_SSL 
sasl.mechanism=SCRAM-SHA-512 
sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required username="<user name from OCI Secret>" password="<password from OCI Secret>";
```

### Kafka CLI를 사용해서 Topic Create/Update/Delete 하기
환경 변수 (앞서 메모한 SASL-SCRAM Bootstrap URL 필요)
```
$ BOOTSTRAP_URL=<앞서 메모한 SASL-SCRAM Bootstrap URL>
$ TOPIC=topic1
```

**Topic 생성**
```
$ ./bin/kafka-topics.sh --create --bootstrap-server $BOOTSTRAP_URL --replication-factor 1 --partitions 1 --topic $TOPIC --command-config ./config/client.properties
Created topic topic1.
```

**Topic 목록**
```
$ ./bin/kafka-topics.sh --list --bootstrap-server=$BOOTSTRAP_URL --command-config ./config/client.properties
topic1
```

**Topic 상세 정보**
```
$ ./bin/kafka-topics.sh --bootstrap-server=$BOOTSTRAP_URL --describe --topic $TOPIC --command-config ./config/client.properties
./bin/kafka-topics.sh --bootstrap-server=$BOOTSTRAP_URL --describe --t
opic $TOPIC --command-config ./config/client.properties
[2025-09-30 08:49:43,137] WARN [AdminClient clientId=adminclient-1] The DescribeTopicPartitions API is not supported, using Metadata API to describe topics. (org.apache.kafka.clients.admin.KafkaAdminClient)
Topic: topic1	TopicId: 6TBOlsQLRdyYaLJbB4CiYA	PartitionCount: 1	ReplicationFactor: 1	Configs: min.insync.replicas=1,message.format.version=3.0-IV1
	Topic: topic1	Partition: 0	Leader: 0	Replicas: 0	Isr: 0	Elr: N/A	LastKnownElr: N/A
```

**Topic 업데이트: Partition 수 3개로 변경**
```
$ ./bin/kafka-topics.sh --bootstrap-server=$BOOTSTRAP_URL --alter --topic $TOPIC --partitions 3 --command-config ./config/client.properties
```

**Topic 삭제**
```
$ ./bin/kafka-topics.sh --delete --topic $TOPIC --bootstrap-server=$BOOTSTRAP_URL --command-config ./config/client.properties
```

### Kafka CLI를 사용해서 Message Produce, Consume 하기
**Produce**
```
./bin/kafka-console-producer.sh --bootstrap-server=$BOOTSTRAP_URL --topic $TOPIC --producer.config ./config/client.properties
> Hello Kafka
```

**Consume**
```
./bin/kafka-console-consumer.sh --bootstrap-server=$BOOTSTRAP_URL --to
pic $TOPIC --consumer.config ./config/client.properties
Hello Kafka
```