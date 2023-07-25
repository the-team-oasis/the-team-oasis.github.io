# OCI DevOps 프로젝트 생성

## 소개

실습을 위한 OCI DevOps 프로젝트를 생성하고 필요한 정책을 생성하는 과정을 실습을 통해 학습할 수 있습니다.

소요시간: 10 minutes

### 목표

- Notification Topic 생성
- OCI DevOps Project 생성
- Dynamic Group 생성 및 IAM Policy 적용

### 사전 준비사항

1. 실습을 위한 노트북 (Windows, MacOS)
1. Oracle Free Tier 계정

## Task 1: Notification 생성

> **Note**: 화면 언어는 English로 설정하고 진행합니다. 언어 변경은 우측 상단의 **Language** 아이콘을 선택하고 변경할 수 있습니다.

1. 좌측 상단의 **햄버거 아이콘**을 클릭하고, **Developer Services**을 선택한 후 Application Integration의 **Notifications**를 클릭합니다.
   ![Notifications](images/notification-create-1.png " ")

2. **Create Topic**을 클릭합니다.
   ![Notifications Screen](images/notification-create-2.png " ")

3. 다음과 같이 입력:
   - Name: Enter **TopicForDevOps\__[개인이니셜]_**
   - **Create** 클릭
   ![Notifications create](images/notification-create-3.png " ")

4. 생성된 Topic을 확인합니다.
   ![Topic Screen](images/notification-create-4.png " ")
5. "구독 생성" 버튼을 클릭하여 DevOps 프로젝트 관련 알림을 받을 구독을 구성합니다. 실습에서는 전자메일 유형으로 구성하기 위해 아래와 같이 입력하여 구독을 생성합니다.
   - 프로토콜: **전자메일**
   - 전자메일 : **개인 이메일 주소 입력**
   - **생성** 버튼 클릭
   ![Topic Screen](images/notification-create-4-1.png " ")
6. 구독을 생성할 경우 아래와 같이 이메일이 발신되는데, 이메일 본문의 "Confirm subscription" 링크를 클릭합니다.
   ![Topic Screen](images/notification-create-4-2.png " ")
7. 링크를 클릭하면 아래와 같이 페이지가 열리면서 구독이 정상적으로 완료되었다는 안내를 확인할 수 있습니다.
   ![Topic Screen](images/notification-create-4-3.png " ")
8. 다시 토픽의 구독 목록에 보면 조금 전 생성한 구독의 상태가 "Pending"에서 "Active"로 변경되었음을 확인할 수 있습니다.
   ![Topic Screen](images/notification-create-4-4.png " ")

## Task 2: OCI DevOps Project 생성

1. **햄버거 메뉴**를 클릭한 후, **Developer Services**, **DevOps**를 선택합니다.
   ![OCI DevOps](images/devops-create-1.png " ")

1. **OCIDevOpsHandsOn** 컴파트먼트를 선택한 후에 **Create Project**를 클릭합니다.
   ![OCI DevOps Screen](images/devops-create-2.png " ")

1. 다음과 같이 입력:
   - Name : **DevOpsHandsOn\__[개인이니셜]_**
   - **Select Topic** 클릭 후 앞서 생성한 Topic을 선택합니다.
   - **Create DevOps project** 클릭하여 Project를 생성합니다.
   ![OCI DevOps Create #1](images/devops-create-5.png " ")
   ![OCI DevOps Create #2](images/devops-create-3.png " ")

1. 프로젝트 생성 후 **Enable Log** 버튼을 클릭합니다.
   ![OCI DevOps Enable Log #1](images/devops-enable-log-1.png " ")

1. 프로젝트의 Logs 화면으로 이동 후 **Enable Log** 스위치 버튼을 클릭합니다
   ![OCI DevOps Enable Log #2](images/devops-enable-log-2.png " ")

1. 다음과 같이 선택 후 **Enable Log** 버튼을 클릭합니다.
   - Compartment : **OCIDevOpsHandsOn**
   - 나머지 항목은 기본값에서 변경하지 않습니다.
   ![OCI DevOps Enable Log #3](images/devops-enable-log-4.png " ")

## Task 3: 실습을 위한 IAM Policy 적용

1. **햄버거 메뉴**를 클릭한 후, **Identity & Security**, **Compartments**를 선택합니다.
   ![Compartments](images/identity-compartments.png " ")
2. Compartments 화면에서 **OCIDevOpsHandsOn** 클릭 후 OCID를 복사해 따로 보관합니다
   ![Compartments](images/identity-compartments-screen.png " ")
   ![Compartments](images/identity-compartment-detail.png " ")
3. **햄버거 메뉴**를 클릭한 후, **Identity & Security**, **Domain** 메뉴를 선택한 후 동적그룹을 생성할 도메인을 클릭하여 **Dynamic Group** 메뉴를 선택합니다.)
   ![Policies](images/identity-domain-dynamic-group.png " ")
   - Identity Domain 이 적용되지 않은 계정에서는 **햄버거 메뉴**를 클릭한 후, **Identity & Security**, **Dynamic Group**를 선택합니다.
     ![Policies](images/identity-dynamic-group.png " ")
4. 복사한 구획의 OCID를 이용하여 DevOps 서비스 정책을 작성하기 위해 필요한 동적 그룹을 생성합니다.
   - CoderepoDynamicGroup
    ````shell
    <copy>
    ALL {resource.type = 'devopsrepository', resource.compartment.id = '<Compartments OCID>'}
    </copy>
    ````
   - ConnectionDynamicGroup
    ````shell
    <copy>
    ALL {resource.type = 'devopsconnection', resource.compartment.id = '<Compartments OCID>'}
    </copy>
    ````
   - BuildDynamicGroup
    ````shell
    <copy>
    ALL {resource.type = 'devopsbuildpipeline', resource.compartment.id = '<Compartments OCID>'}
    </copy>
    ````
   - DeployDynamicGroup
    ````shell
    <copy>
    ALL {resource.type = 'devopsdeploypipeline', resource.compartment.id = '<Compartments OCID>'}
    </copy>
    ````
5. **햄버거 메뉴**를 클릭한 후, **Identity & Security**, **Policies**를 선택합니다.
   ![Policies](images/identity-policies.png " ")
6. **Create Policy** 버튼을 클릭합니다
   ![Policies](images/identity-policies-create-1.png " ")
7. 다음과 같이 입력합니다:
   - Name : **DevOpsPolicy_compartment**
   - Description : **DevOps 실습을 위한 Policy**
   - Comparments : **OCIDevOpsHandsOn**
   - Policy 입력 예시 **[Compartments OCID]** 에 위에서 복사한 구획의 OCID로 변환하여 입력합니다
    ````shell
    <copy>
    Allow dynamic-group CoderepoDynamicGroup to read secret-family in compartment <Compartments Name>
    Allow dynamic-group CoderepoDynamicGroup to manage devops-family in compartment <Compartments Name>
    
    Allow dynamic-group ConnectionDynamicGroup to read secret-family in compartment <Compartments Name>
   
    Allow dynamic-group BuildDynamicGroup to manage repos in compartment <Compartments Name>
    Allow dynamic-group BuildDynamicGroup to read secret-family in compartment <Compartments Name>
    Allow dynamic-group BuildDynamicGroup to manage devops-family in compartment <Compartments Name>
    Allow dynamic-group BuildDynamicGroup to manage generic-artifacts in compartment <Compartments Name>
    Allow dynamic-group BuildDynamicGroup to use ons-topics in compartment <Compartments Name>
    
    Allow dynamic-group DeployDynamicGroup to manage all-resources in compartment <Compartments Name>
    </copy>
    ````
8. OCIR Repository를 미리 생성하지 않은 경우 루트 구획의 Repository에 자동으로 생성되기 때문에 아래와 같이 루트 구획 레벨로 정책도 작성합니다.
   - Name : **DevOpsPolicy_root**
   - Description : **DevOps 실습을 위한 Root Policy**
   - Comparments : **루트 구획**
    ````shell
    <copy>
    Allow dynamic-group BuildDynamicGroup to manage repos in tenancy
    </copy>
    ````


### Jenkins 등 외부 도구에서 사용하기 위한 그룹 및 사용자, 정책 작성하기
만약 Jenkins와 같이 외부 CI 도구를 통해 소스코드를 빌드하고 OCIR로 결과물을 업로드하거나, DevOps의 Deployment Pipeline을 호출하기 위해서는 별도의 그룹 및 사용자를 생성한 후 최소한의 필요한 권한만 부여해야 합니다.

1. 그룹 생성하기
   - DevOps 서비스 관련 권한만 최소로 부여할 그룹을 생성합니다.
   - Name : **DevOps**
   - Description : Group for DevOps
2. 사용자 생성하기
   - 외부에서 Auth Token, API Key로 연동하기 위한 사용자를 생성합니다.
   - ID : **devops_[YourInitial]**
   - Description : User for DevOps Service
   - 사용자를 생성한 후 1번 단계에서 생성한 그룹에 사용자를 Assign 합니다.
3. 정책 작성하기
   - Name : **DevOpsPolicy\_root\_jenkins**
   - Description : **Jenkins를 이용한 DevOps 실습을 위한 Policy**
   - Comparments : **루트 구획**
    ````shell
    <copy>
    Allow group <YourGroupName> to manage repos in tenancy
    </copy>
    ````

   - Name : **DevOpsPolicy\_compartment\_jenkins**
   - Description : **Jenkins를 이용한 DevOps 실습을 위한 Policy**
   - Comparments : **OCIDevOpsHandsOn**
    ````shell
    <copy>
    Allow group <YourGroupName> to manage repos in compartment <Compartments Name>
    Allow group <YourGroupName> to manage devops-family in compartment <Compartments Name>
    </copy>
    ````

[다음 랩으로 이동](#next)
