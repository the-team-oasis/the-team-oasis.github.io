---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "4월 OCI Infrastructure 업데이트 소식"
teaser: "2026년 4월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2026-infrastructure
tags:
   - oci-release-notes-2026
   - Apr-2026
   - Infrastructure
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

## New Experience in Oracle Cloud Console for Network Firewall
* **Services**: Network Firewall
* **Release Date**: April 14, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/services/network-firewall/](https://docs.oracle.com/en-us/iaas/releasenotes/services/network-firewall/){:target="_blank" rel="noopener"}
* **Documentation:** [New Console Experience](https://docs.oracle.com/en-us/iaas/Content/GSG/Concepts/new-console.htm){:target="_blank" rel="noopener"}, [Network Firewall](https://docs.oracle.com/en-us/iaas/Content/network-firewall/home.htm){:target="_blank" rel="noopener"}, [Overview of the Network Firewall Service](https://docs.oracle.com/en-us/iaas/Content/network-firewall/overview.htm){:target="_blank" rel="noopener"}, [Overview of Creating a Firewall](https://docs.oracle.com/iaas/Content/network-firewall/setting-up-network-firewall.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
Network Firewall에 새로운 Oracle Cloud Console Experience가 적용되었습니다. 이번 업데이트는 OCI Console 전반의 사용성과 일관성을 높이기 위한 디자인 개편의 일부이며, Resource List Page, Resource Details Page, Resource Creation Workflow가 새 UI 패턴에 맞춰 정리됩니다.

![](https://docs.oracle.com/en-us/iaas/Content/GSG/images/redwood-nav.png)

Network Firewall은 OCI VCN에 대해 Managed Next-generation Firewall과 Intrusion Detection and Prevention 기능을 제공하는 서비스입니다. Firewall은 Subnet에 생성되는 고가용성 리소스이며, 연결된 Firewall Policy의 Security Rule, Decryption Rule, Tunnel Inspection Rule, NAT Rule 등을 기준으로 트래픽을 허용, 차단, 검사합니다.

### 주요 변경 포인트
새 Console Experience의 공통 변화는 다음과 같습니다.

* Service Resource 사이를 이동하기 위한 좌측 Navigation Pane 제공
* Resource List Page에서 Search, Filter, Sort, Column 관리 기능 개선
* Resource Details Page의 정보와 Subresource를 Tab 기반으로 정리
* Resource Creation Workflow를 단일 Panel 또는 단계별 Section으로 구성

Network Firewall 운영 관점에서는 Firewall, Firewall Policy, Policy Rule, Work Request, Monitoring, Logging 관련 화면을 더 일관된 Console 패턴에서 확인할 수 있습니다. 특히 Firewall 생성은 Policy 생성, Policy Rule 구성, Firewall 생성, Route Table을 통한 트래픽 경유 설정 순서로 진행되므로, 새 UI에서는 각 리소스의 목록/상세/작업 흐름을 더 쉽게 따라갈 수 있습니다.

## Object Storage Supports Updating Buckets to Support Amazon S3 Virtual-Hosted Style URLs
* **Services**: Object Storage
* **Release Date**: April 20, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/objectstorage/s3_vhost_existing_buckets.htm](https://docs.oracle.com/en-us/iaas/releasenotes/objectstorage/s3_vhost_existing_buckets.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Updating a Bucket to Support Virtual-hosted Style URLs](https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/managingbuckets_topic-To_update_to_support_vhost_urls.htm){:target="_blank" rel="noopener"}, [Amazon S3 Compatibility API Hosted Style Support in Object Storage](https://docs.oracle.com/en-us/iaas/Content/Object/s3-virtual-style.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
Object Storage에서 기존 Bucket을 업데이트해 Amazon S3 Virtual-hosted Style URL을 지원하도록 변경할 수 있게 되었습니다. 기존 Bucket이 조건을 만족하고 Bucket Scope를 `REGION`으로 설정할 수 있는 경우, S3 Compatibility API 사용 시 Bucket 이름을 URL Path가 아니라 Subdomain에 포함하는 Virtual-hosted Style URL을 사용할 수 있습니다.

지원되는 URL 형식은 다음과 같습니다.

```text
Path style:
https://<namespace>.compat.objectstorage.<region>.oci.customer-oci.com/<bucket_name>/<object_name>

Virtual-hosted style:
https://<bucket_name>.vhcompat.objectstorage.<region>.oci.customer-oci.com/<object_name>
```

Virtual-hosted Style에서는 Bucket 이름이 Domain Name의 일부가 되고, Object 이름만 Path에 포함됩니다. AWS SDK나 S3 호환 도구가 Virtual-hosted Style Endpoint를 기대하는 경우, OCI Object Storage의 S3 Compatibility API와 더 자연스럽게 연동할 수 있습니다.

### Bucket 업데이트 조건
기본적으로 OCI Object Storage Bucket Scope는 Tenancy Namespace입니다. 기존 Bucket을 `REGION` Scope로 업데이트하려면 다음 조건을 만족해야 합니다.

* Bucket 이름이 동일 Region의 모든 Tenancy에서 고유해야 합니다.
* Bucket 이름은 소문자, 숫자, 하이픈만 포함해야 합니다.
* Bucket 이름은 하이픈으로 시작할 수 없고, 연속된 하이픈을 포함할 수 없습니다.
* Bucket 이름은 3자 이상 63자 이하여야 합니다.
* Bucket 이름이 Subdomain으로 사용되므로 표준 DNS Naming Rule을 따라야 합니다.

조건을 만족하지 않거나, 같은 Region 내 다른 Tenancy에서 이미 동일한 Bucket 이름을 사용 중이면 Bucket Scope를 업데이트할 수 없습니다.

### 변경 방법
Console에서는 Bucket의 Actions 메뉴에서 **Edit Bucket Scope**를 선택한 뒤 `REGION`을 선택해 업데이트합니다. CLI에서는 다음과 같이 `--bucket-scope REGION`을 지정합니다.

```bash
oci os bucket update --name my-bucket --bucket-scope REGION
```

주의할 점은 Scope 변경은 `NAMESPACE`에서 `REGION`으로만 가능합니다. 한 번 `REGION`으로 변경하면 다시 `NAMESPACE`로 되돌릴 수 없습니다.

## Time-Based Snapshot Locks in File Storage
* **Services**: File Storage
* **Release Date**: April 21, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/filestorage/snapshot-lock-time-based.htm](https://docs.oracle.com/en-us/iaas/releasenotes/filestorage/snapshot-lock-time-based.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Snapshot Locks](https://docs.oracle.com/en-us/iaas/Content/File/Tasks/snapshot_lock_overview.htm){:target="_blank" rel="noopener"}, [Using Time-Based Locks on a Snapshot](https://docs.oracle.com/en-us/iaas/Content/File/Tasks/snapshot_immutable_lock_howTo.htm){:target="_blank" rel="noopener"}

### 업데이트 내용
File Storage에서 Snapshot에 **Time-Based Lock**을 설정할 수 있게 되었습니다. Time-Based Snapshot Lock은 Snapshot 삭제를 지정한 기간 동안 방지해 Retention 요구사항, 규제 준수, Ransomware Recovery, 내부 Governance 요구사항을 충족하는 데 사용할 수 있습니다.

기존에는 Resource-Based Lock만 제공되어 삭제나 업데이트를 막을 수 있었지만, 시간 기반 Retention을 강제하지는 못했습니다. 이번 업데이트로 Snapshot에 Governance Mode 또는 Compliance Mode 기반의 Time-Based Lock을 적용할 수 있습니다.

### Lock Mode
Time-Based Lock은 두 가지 Mode를 제공합니다.

* **Governance Mode:** 지정한 Lock Duration 동안 Snapshot 삭제를 막습니다. Legal Hold를 선택하면 종료 시점 없이 보호할 수 있습니다. 필요한 권한이 있으면 Lock Duration 변경 또는 Lock 제거가 가능합니다.
* **Compliance Mode:** 엄격한 Retention을 위한 Mode입니다. Cool-off Duration 동안에는 권한이 있으면 변경 또는 제거할 수 있지만, Cool-off 이후에는 Lock을 제거하거나 기간을 줄일 수 없고 기간 연장만 가능합니다.

Lock Duration은 최소 1일, 최대 100년(36,500일)까지 설정할 수 있습니다. Compliance Mode의 Cool-off Duration 기본값은 14일이며, 즉시 강제하려면 `0`으로 설정할 수 있습니다.

### 사용 방법
Console에서는 File System 상세 화면에서 Snapshot을 선택한 뒤 **Update snapshot lock** 메뉴를 통해 Lock Mode와 Duration을 설정합니다. API 또는 CLI를 사용하는 경우 `CreateSnapshot` 또는 `UpdateSnapshot` 작업에 `LockDurationDetails`를 전달하거나, CLI에서 `fs snapshot create`, `fs snapshot update` 명령에 `lock_duration_details`를 지정합니다.

Time-Based Lock이 활성화된 Snapshot은 삭제할 수 없으며, 해당 Snapshot을 포함하는 File System도 삭제할 수 없습니다. Snapshot Expiration Time이 도래하더라도 Lock이 남아 있으면 삭제는 실패하며, Retention 기간이 끝나거나 Legal Hold가 제거된 뒤에만 삭제할 수 있습니다.

### IAM 권한
Snapshot Lock을 관리하려면 Lock 종류와 Mode에 맞는 IAM 권한이 필요합니다. Governance Mode에서 Snapshot Lock을 생성하려면 `FILE_SYSTEM_MANAGE_SNAPSHOT_LOCK_GOVERNANCE` 권한이 필요하고, Compliance Mode에서는 `FILE_SYSTEM_MANAGE_SNAPSHOT_LOCK_COMPLIANCE` 권한이 필요합니다.
