---
layout: page-fullwidth
#
# Content
#
subheadline: "Monitoring"
title: "OCI Monitoring 서비스에 Custom Metrics 발행 하기 (SDK)"
teaser: "SDK를 활용해서 OCI Monitoring 서비스에 OS 디스크 활용률에 대한 Custom Metrics 발행 하기."
author: "yhcho"
breadcrumb: true
categories:
  - infrastructure
tags:
  - [oci, monitoring, metrics, custom metrics, disk]
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


### **소개** 
Oracle Observability 및 Management 플랫폼 서비스는 고객이 멀티클라우드 애플리케이션과 인프라 환경을 모니터링, 분석 및 관리할 수 있도록 지원합니다. 이 플랫폼은 메트릭을 사용하여 리소스를 모니터링하고, 알람을 통해 특정 조건이 충족될 때 알림을 제공합니다. 메트릭은 타임스탬프-값 쌍과 함께 차원 및 메타데이터로 Monitoring 서비스에 전달됩니다.

메트릭의 출처는 다음과 같습니다:
- Oracle Cloud Infrastructure(OCI) 리소스에서 자동으로 게시되는 리소스 메트릭(예: CpuUtilization).
- Monitoring API를 사용하여 게시된 커스텀 메트릭.

#### **목표**
OCI 커스텀 메트릭을 사용하여 디스크 사용률 모니터링.


### **사전 요구사항**
1. OCI 환경 및 접속 가능한 VM Instance
2. Dynamic Group 생성 및 정책 추가
   ```shell
    # Replace compartment_ocid as per your tenancy
    instance.compartment.id = '<compartment_ocid>'
   ```

3. 생성한 Dynamic Group에 Custom Metric 구현을 위한 정책을 작성합니다.
   ```shell
    # Replace group-name as per your tenancy
    Allow dynamic-group <group-name> to use metrics in tenancy
   ```

4. 디스크 사용률을 모니터링할 VM Instance에 OCI Python SDK 패키지를 설치합니다.
   ```shell
    # Using Oracle Linux 7 or 8
    sudo yum install python36-oci-sdk
   ```

### Task 1: Python 파일 생성하기
1. `disk_usage.py` 파일을 디스크 사용률 지표를 수집해야 하는 컴퓨팅 인스턴스에서 생성합니다.
2. 아래 샘플 스크립트를 생성한 파일 내용으로 복사합니다.
   ```shell
    # This is a sample python script to post disk utilization custom metric to oci monitoring.
    # Command: python disk_usage.py
    
    import oci,psutil,datetime
    from pytz import timezone
    
    # initialize service client with OCI python SDK
    signer = oci.auth.signers.InstancePrincipalsSecurityTokenSigner()
    monitoring_client = oci.monitoring.MonitoringClient(config={}, signer=signer, service_endpoint="https://telemetry-ingestion.ap-mumbai-1.oraclecloud.com")
    
    # get disk usage with psutil
    disk = psutil.disk_usage('/')
    disk_usage=disk.percent
    print(disk_usage)
    
    times_stamp = datetime.datetime.now(timezone('UTC'))
    
    # post custom metric to oci monitoring
    # replace "compartment_ocid“ with your compartmet ocid and srv01 with your compute instance
    post_metric_data_response = monitoring_client.post_metric_data(
      post_metric_data_details=oci.monitoring.models.PostMetricDataDetails(
        metric_data=[
          oci.monitoring.models.MetricDataDetails(
          namespace="custom_metrics",
          compartment_id="your_compartment_ocid",
          name="disk_usage",
          dimensions={'resourceDisplayName': 'srv01'},
          datapoints=[
            oci.monitoring.models.Datapoint(
              timestamp=datetime.datetime.strftime(
                times_stamp,"%Y-%m-%dT%H:%M:%S.%fZ"),
              value=disk_usage)]
        )]
      )
    )
    
    # Get the data from response
    print(post_metric_data_response.data)

   ```
3. 다음 명령을 실행해서 스크립트에 실행 권한을 추가합니다.
   ```shell
    chmod +x disk_usage.py
   ```
4. [End Point 확인 링크](https://docs.oracle.com/en-us/iaas/api/#/en/monitoring/20180401/)를 클릭하여 실습을 진행하고 있는 지역에 맞는 API End Point를 확인합니다.
    > **참고** : 엔드포인트는 작업에 따라 다릅니다. 메트릭을 게시하려면 telemetry-ingestion 엔드포인트를 사용하세요.

5. 요구 사항에 맞게 네임스페이스를 업데이트 합니다.
    > **참고** : 메트릭 네임스페이스의 경우 예약된 접두사(oci_ 또는 oracle_)를 사용하지 마세요.

6. 구획 OCID, 리소스 이름을 변경 합니다.
7. 필요한 경우 GB 단위로 사용 가능한 디스크 공간에 대한 정보를 수집하는 스크립트를 추가합니다.
   ```shell
    # get metric details using psutil
    disk_free=round(disk.free/1024/1024/1024,2)
    print(disk_free)
    
    # Add more metric to post if required
    post_metric_data_response = monitoring_client.post_metric_data(
      post_metric_data_details=oci.monitoring.models.PostMetricDataDetails(
        metric_data=[
          oci.monitoring.models.MetricDataDetails(
            namespace="custom_metrics",
            compartment_id="your_compartment_ocid",
            name="disk_free",
            dimensions={'resourceDisplayName': 'srv01'},
            datapoints=[
              oci.monitoring.models.Datapoint(
              timestamp=datetime.datetime.strftime(
                times_stamp,"%Y-%m-%dT%H:%M:%S.%fZ"),
              value=disk_free)]
            )]
      )
    )

   ```
   
### Task 2: Custom Metric 데이터 게시하기
1. 스크립트를 실행하여 결과를 확인합니다.
   ```shell
    python disk_usage.py
   ```
2. Cron 작업이나 스케줄링 작업을 통해 스크립트를 예약하여 OCI 모니터링 서비스에 데이터를 자주 게시합니다.
    > 참고 : 사용자 지정 메트릭은 1초마다 게시할 수 있으며 최소 집계 간격은 1분입니다. 모범 사례는 1분 또는 그 이상의 간격으로 사용자 지정 메트릭을 게시하는 것입니다.
   
   ```shell
    # Cron job example with every 1 min execution.  
    */1 * * * * /usr/bin/python3 /home/opc/disk_usage.py
   ```

### Task 3: OCI 메트릭 탐색기 (Metric Explorer)를 사용하여 디스크 사용률 메트릭 조회하기
1. 탐색 메뉴를 열고 관찰성 및 관리를 클릭합니다 . 
2. 모니터링 에서 메트릭 탐색기를 클릭합니다 . 
3. 보고 싶은 사용자 지정 메트릭이 포함된 구획을 선택한 다음 메트릭 네임스페이스 의 이름을 클릭합니다 . 예를 들어 custom_metrics. 
4. 리소스 에서 메트릭을 클릭합니다 . 메트릭 이름 , 간격 및 차원 이름 및 차원 값을 선택합니다 .
![](/assets/img/infrastructure/2025/custom-metric-sdk-1.png " ")