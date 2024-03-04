---
layout: page-fullwidth
#
# Content
#
subheadline: "CloudNative"
title: "OCI OpenSearch, Filebeat, Logstash를 활용한 OKE 로그 모니터링"
teaser: "OKE Cluster에 Filebeat와 Logstash를 구성하고 OCI OpenSearch 서비스를 활용하여 모니터링 하는 방법에 대해서 살펴봅니다."
author: dankim
breadcrumb: true
categories:
  - cloudnative
tags:
  - [oci, opensearch, opendashboard, elasticsearch, kibana, filebeat, logstash]
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

### OCI Opensearch 클러스터 준비
먼저 OCI OpenSearch Cluster를 준비합니다. OCI OpenSearch 서비스에 대한 소개와 Cluster 생성 방법은 아래 포스팅을 참고합니다.

[OCI Opensearch 서비스 살펴보기](http://localhost:4000//cloudnative/oci-opensearch-overview/#5-oci-opensearch-%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0-%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0){:target="_blank" rel="noopener"}

### OKE Cluster 준비
OKE Cluster는 편의상 OCI OpenSearch Cluster가 생성된 동일한 VCN에 구성하도록 합니다. (다른 VCN에 구성하는 경우에는 VCN Peering 구성 필요)

OpenSearch에서 사용하는 VCN을 활용해야 하므로, OKE Cluster 생성 시 사용자 정의 생성 (Custom Create) 옵션을 선택하고, CNI 플러그인은 Flannel CNI 플러그인을 사용하여 구성하도록 하겠습니다. Flannel CNI 플러그인을 사용하여 사용자 정의로 OKE Cluster 생성하는 내용은 다음 포스트를 참고합니다. 

[Flannel CNI 플러그인으로 사용자 정의 OKE Cluster(Oracle Container Engine for Kubernetes) 클러스터 구성](https://the-team-oasis.github.io/cloudnative/oke-cluster-with-flannel-cni/)

### 구성 아키텍처
여기서는 Log Collector(로그 수집)로 Filebeat, Log Aggregator (로그 집계 및 처리)로 Logstash를 사용하도록 구성합니다. Log Collector 및 Aggregator를 모두 Logstash로 구성할 수도 있고, 혹은 Filebeat로만 수집하여 바로 목적지에 전달할 수도 있습니다. 하지만 여기서는 다양한 소스로부터 데이터를 집계 및 처리하고 라우팅하는 등의 작업을 중앙에서 처리해야 한다는 가정하에, Logstash보다 훨씬 경량의 Filebeat로 Collector 역할만 따로 담당하도록 분리하여 구성하고, 복잡한 집계 처리 및 라우팅은 Logstash에 맡기는 형태로 구성해 보도록 합니다. 

![](/assets/img/cloudnative-security/2023/opensearch-filebeat-logstash-1.png)

OKE Cluster에 Filebeat와 Logstash 구성 아키텍처입니다. Filebeat는 모든 노드의 로그를 수집하기 위해 DaemonSet으로 구성이 되며, 수집된 로그는 Logstash 전달되는 구성입니다.

![](/assets/img/cloudnative-security/2023/opensearch-filebeat-logstash-2.png)

### Filebeat 설치
Filebeat을 OKE Cluster에 구성할 수 있게 Helm Chart가 제공됩니다. Helm은 쿠버네티스 패키지 매니저로 설치는 다음 링크를 참고합니다.

[Installing Helm](https://helm.sh/docs/intro/install/)

우선 Filebeat Helm 저장소를 추가합니다.

```terminal
$ helm repo add elastic https://helm.elastic.co
"elastic" has been added to your repositories
```

Filebeat Helm Chart에서 사용할 values.yaml을 준비합니다. yaml 내용은 output을 Logstash로 구성하고, Image의 경우 Filebeat OSS로 구성하였습니다. yaml 파일은 아래 Github 저장소에서 다운받을 수 있습니다.

[Filebeat_OSS_values_8.10.3.yaml](https://github.com/donghukim2023/OpenSearch-Log-Ingestion/blob/main/filebeat-logstash/Filebeat_OSS_values_8.10.3.yaml)

Filebeat Helm Chart를 활용하여 OKE 배포합니다.
```
$ helm install filebeat elastic/filebeat -f Filebeat_OSS_values_8.10.3.yaml
```

배포된 Filebeat을 확인합니다. Output이 Logstash로 설정이 되어 있기 때문에 Logstash가 배포되어야 Filebeat도 READY가 됩니다.
```terminal
$ kubectl get all
NAME                                      READY   STATUS    RESTARTS   AGE
pod/filebeat-filebeat-5shwn               0/1     Running   0          4s
pod/filebeat-filebeat-6tvw5               0/1     Running   0          4s
pod/filebeat-filebeat-mcbsm               0/1     Running   0          4s

NAME                               DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
daemonset.apps/filebeat-filebeat   3         3         0       3            0           <none>          5s
```

### Logstash 설치
Filebeat와 마찬가지로 Logstash도 Helm Chart가 제공됩니다. Helm 레파지토리는 앞서 추가한 레파지토리를 그대로 사용합니다.

Logstash Helm Chart에서 사용할 values.yaml을 준비합니다. yaml 파일은 아래 Github 저장소에서 다운받을 수 있습니다.

[Logstash_OSS_Opensearch_Output_Plugin_values_8.9.0.yaml](https://github.com/donghukim2023/OpenSearch-Log-Ingestion/blob/main/filebeat-logstash/Logstash_OSS_Opensearch_Output_Plugin_values_8.9.0.yaml)

yaml 파일내의 `<OPENSEARCH URL>`을 OCI OpenSearch URL로 변경합니다. OpenSearch URL은 생성한 OCI OpenSearch Cluster 상세 페이지에서 확인할 수 있습니다. user와 password는 Opensearch Cluster 생성 시에 생성한 User와 Password로 설정합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2022/opensearch-fluentbit-fluentd-3.png)

변경 예시
```text
output {
  opensearch {
    hosts => ["https://amaaaaaavsea7yia7qowt3....................opensearch.ap-seoul-1.oci.oraclecloud.com:9200"]
    index => "logstash-%{[@metadata][beat]}"
    user => "opensearch"
    password => "changeme"
    ssl => true
    ssl_certificate_verification => false
  }
}
```

이제 Logstash Helm Chart를 활용하여 OKE 배포합니다.
```terminal
$ helm install logstash elastic/logstash -f Logstash_OSS_Opensearch_Output_Plugin_values_8.9.0.yaml
```

배포된 Logstash를 확인합니다. Logstash 배포가 완료되고 READY가 되면 Filebeat도 READY가 됩니다.
```terminal
$ kubectl get all
NAME                                      READY   STATUS    RESTARTS   AGE
pod/filebeat-filebeat-5shwn               1/1     Running   0          16m
pod/filebeat-filebeat-6tvw5               1/1     Running   0          16m
pod/filebeat-filebeat-mcbsm               1/1     Running   0          16m
pod/logstash-logstash-0                   1/1     Running   0          103s

NAME                                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
service/logstash-logstash            ClusterIP   10.96.136.13   <none>        5044/TCP   105s
service/logstash-logstash-headless   ClusterIP   None           <none>        9600/TCP   105s

NAME                               DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
daemonset.apps/filebeat-filebeat   3         3         3       3            3           <none>          16m

NAME                                 READY   AGE
statefulset.apps/logstash-logstash   1/1     105s
```

### 샘플 애플리케이션 배포
간단한 애플리케이션을 배포하여 모니터링 해보도록 합니다. 

먼저 Ingress Controller를 생성합니다.
```terminal
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.3/deploy/static/provider/cloud/deploy.yaml
```

간단한 애플리케이션 (docker-hello-world)을 배포하기 위해 다음 Manifest를 작성합니다.

***hello-world-ingress.yaml***
```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: docker-hello-world
  labels:
    oke-app: docker-hello-world
spec:
  selector:
    matchLabels:
      oke-app: docker-hello-world
  replicas: 3
  template:
    metadata:
      labels:
        oke-app: docker-hello-world
    spec:
      containers:
      - name: docker-hello-world
        image: scottsbaldwin/docker-hello-world:latest
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: docker-hello-world-svc
spec:
  selector:
    oke-app: docker-hello-world
  ports:
    - port: 8088
      targetPort: 80
  type: ClusterIP
```

Deployment와 서비스를 생성합니다.

```terminal
$ kubectl create -f hello-world-ingress.yaml
```

Ingress Manifest 파일을 작성합니다

***ingress.yaml***
```yml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: hello-world-ing
  annotations:
    kubernetes.io/ingress.class: "nginx"
spec:
  rules:
  - http:
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: docker-hello-world-svc
              port:
                number: 8088
```

Ingress를 생성합니다.
```terminal
$ kubectl create -f ingress.yaml
````

External IP를 확인합니다.
```terminal
$ kubectl get svc -n ingress-nginx
NAME                                 TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                      AGE
ingress-nginx-controller             LoadBalancer   10.96.44.164   146.xx.xx.xx   80:31713/TCP,443:32598/TCP   11m
ingress-nginx-controller-admission   ClusterIP      10.96.44.45    <none>         443/TCP                      11m
```

curl을 사용해서 호출 테스트를 합니다.
```terminal
$ curl -I http://146.xx.xx.xx
HTTP/1.1 200 OK
Date: Sat, 22 Oct 2022 07:56:06 GMT
Content-Type: text/html
Content-Length: 71
Connection: keep-alive
Last-Modified: Sat, 22 Oct 2022 07:47:02 GMT
ETag: "63539ff6-47"
Accept-Ranges: bytes
```

### OpenSearch 대시보드에서 로그 모니터링
아래 포스트 참고하여 OpenSearch 대시보드를 오픈합니다. 

[OCI Opensearch 서비스 살펴보기](http://localhost:4000//cloudnative/oci-opensearch-overview/#5-oci-opensearch-%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0-%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0){:target="_blank" rel="noopener"}

메뉴에서 **Stack Management > Index Patterns**를 선택한 후 **Create index pattern** 을 클릭합니다.

![]({{site.urlblogimg2022_2023}}/assets/img/cloudnative-security/2022/opensearch-fluentbit-fluentd-4.png)

**Index pattern name**에 **logstash-filebeat**로 입력한 후 **Next Step**을 클릭합니다.

![](/assets/img/cloudnative-security/2023/opensearch-filebeat-logstash-3.png)

**Time filed**를 선택한 후 **Create index pattern**을 클릭합니다.

![](/assets/img/cloudnative-security/2023/opensearch-filebeat-logstash-4.png)

매뉴에서 **Discover**를 선택합니다. Index pattern을 앞에서 생성한 **logstash-filebeat**로 변경합니다.

![](/assets/img/cloudnative-security/2023/opensearch-filebeat-logstash-5.png)

다음과 같이 앞서 배포한 docker-hello-world 서비스에 대한 로그를 확인할 수 있습니다.

![](/assets/img/cloudnative-security/2023/opensearch-filebeat-logstash-6.png)
![](/assets/img/cloudnative-security/2023/opensearch-filebeat-logstash-7.png)

### 참고
* https://github.com/elastic/helm-charts/tree/main/filebeat
* https://github.com/elastic/helm-charts/tree/main/logstash
* https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupingresscontroller.htm
