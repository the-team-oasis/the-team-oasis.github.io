---
layout: page-fullwidth
#
# Content
#
subheadline: "OCI Release Notes 2026"
title: "5월 OCI Infrastructure 업데이트 소식"
teaser: "2026년 5월 OCI Infrastructure 업데이트 소식입니다."
author: kskim
breadcrumb: true
categories:
   - release-notes-2026-infrastructure
tags:
   - oci-release-notes-2026
   - May-2026
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

## Full Stack Disaster Recovery introduces AI-generated log summaries, expands regional availability, and adds multicloud database support
* **Services**: Full Stack Disaster Recovery
* **Release Date**: May 15, 2026
* **Release Note:** [https://docs.oracle.com/en-us/iaas/releasenotes/disaster-recovery/may-2026.htm](https://docs.oracle.com/en-us/iaas/releasenotes/disaster-recovery/may-2026.htm){:target="_blank" rel="noopener"}
* **Documentation:** [Full Stack Disaster Recovery](https://docs.oracle.com/en-us/iaas/disaster-recovery/home.htm){:target="_blank" rel="noopener"}, [Who can use Full Stack Disaster Recovery?](https://docs.oracle.com/en/cloud/iaas/disaster-recovery/cssgm/disaster-recovery-usage.html){:target="_blank" rel="noopener"}, [Full Stack Disaster Recovery Terminology and Concepts](https://docs.oracle.com/en-us/iaas/disaster-recovery/doc/disaster-recovery-terminology.html){:target="_blank" rel="noopener"}

### 업데이트 내용

Full Stack Disaster Recovery에 AI 기반 로그 요약, 신규 리전 확장, Multicloud Oracle AI Database 지원이 추가되었습니다.

이번 릴리즈에서 Full Stack DR은 다음 리전에서 새로 사용할 수 있습니다.

- Italy North (Turin)
- Malaysia West 2 (Kulai)
- Morocco West (Casablanca)

### AI-generated log summaries

Full Stack DR Plan 실행 단계가 `Failed`, `Failed ignored`, `Succeeded with warning` 상태로 끝난 경우, **View Summary** 옵션으로 AI-generated summary를 확인할 수 있습니다. 이 기능은 OCI Generative AI를 사용해 DR plan execution step log를 간결한 plain language summary로 요약합니다.

운영자는 Switchover, Failover, DR Drill 중 실패 또는 경고가 발생했을 때 raw log를 처음부터 모두 읽지 않고, 요약된 오류 원인과 권장 조치 방향을 빠르게 파악할 수 있습니다. 이 기능은 built-in Full Stack DR plan step과 built-in precheck step에 적용됩니다.

### Multicloud Oracle AI Database support

Full Stack DR은 이제 다음 Multicloud Oracle AI Database 리소스를 Disaster Recovery Protection Group member로 추가할 수 있습니다.

- Oracle AI Database@Azure
- Oracle AI Database@AWS
- Oracle AI Database@Google Cloud

이 업데이트를 통해 OCI 리전뿐 아니라 Oracle Database@Hyperscaler 형태로 배치된 AI Database workload도 Full Stack DR orchestration 안에 포함할 수 있습니다.

### 활용 포인트

Full Stack DR은 DR Protection Group과 DR Plan을 사용해 Compute, Database, Storage, Load Balancer, Application 계층을 함께 전환하는 orchestration 서비스입니다. 이번 AI log summary 기능은 DR 실행 중 문제 파악 시간을 줄이는 데 도움이 되며, Multicloud Database 지원은 OCI와 hyperscaler 간에 분산된 Oracle AI Database 환경을 더 일관된 DR 운영 모델에 포함할 수 있게 해줍니다.
