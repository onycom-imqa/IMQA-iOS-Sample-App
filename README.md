# Quickstart for IMQA iOS


## Introduction
IMQA를 사용하기 앞서 iOS SDK 연동된 샘플 앱으로 연동 샘플 코드 구성을 확인하고, 동작시켜 볼 수 있습니다

IMQA에 대해 궁금하시다면 저희 [랜딩페이지](https://imqa.io)에서 다양한 내용을 확인 해보세요. 

모바일 앱 성능에 관한 좋은 컨텐츠도 있으니 저희 [블로그](https://blog.imqa.io)를 통해 다양한 컨텐츠를 읽어보세요. 
- 추천 컨텐츠 : [모바일 앱 성능 저하, 크래시 솔루션으로 해결될까요?](https://blog.imqa.io/decreased-app-performance-resolution/)

## IMQA 시작하기
IMQA에 회원가입/로그인을 진행하시기 바랍니다

[IMQA 시작하기](https://docs.imqa.io/installation/imqa)

### IMQA 프로젝트 생성
IMQA에 로그인하여 프로젝트를 생성해주세요

[IMQA Lite 프로젝트 시작하기](https://docs.imqa.io/installation/imqa/project-lite)

프로젝트를 생성 후 발급받은 `Project Key`를 이용하여 SDK 연동을 진행합니다

[프로젝트 키 확인하기](https://docs.imqa.io/installation/imqa/project-key)

[<img src="https://842389420-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FzFyCopc6yAp3UcEYW6la%2Fuploads%2FZCGQMpp55OSw14VeJCBG%2FUntitled.png?alt=media&token=c635d854-7d83-48cc-bf87-56d52924ac7a" width="800"/>](image.png)


## IMQA Sample 앱을 이용하여 서비스 연동하기

### IMQA SDK 설치

iOS는 Crash, MPM 2개의 SDK를 설치하셔야 합니다. 자세한 설치 방법은 아래 링크를 통해 확인하세요.

- [iOS MPM 설치 가이드](https://docs.imqa.io/installation/ios-sdk/mpm-sdk-install)
- [iOS Crash 설치 가이드](https://docs.imqa.io/installation/ios-sdk/crash-sdk-install)

1. `Podfile`을 열어 아래와 같이 셋팅되어 있는지 확인합니다. 

```
use_frameworks!
pod 'IMQACrashAgent', '3.9.0'
pod 'IMQAMPMAgent', '3.9.0'
```

2. 터미널에서 해당 프로젝트 위치에서 `pod install`을 실행해 주세요.
> CocoaPods 이 아닌 다른 설치 방법은 위 가이드를 통해 확인하시거나 [포럼](http://imdev.imqa.io/)에서 문의를 남겨주세요.

3. 프로젝트 파일을 열고 AppDelegate.swift에서 프로젝트 키를 설정합니다. 

```swift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        initProjectKey(project_key: "<프로젝트 키 입력하기>")
        initSampleApp()
        initImqaSdk()
        
        return true
    }
}
```

4. 프로젝트를 빌드하고 실행하면 아래와 같은 화면과 Debug 메시지가 뜨면 성공입니다. 

[<img src="https://raw.githubusercontent.com/onycom-imqa/IMQA_IOS_SAMPLE/main/images/ios-1.png" width="250"/>](image.png)

```
[IMQA LOG] IMQA MPM Initalize Status : OK
[IMQA LOG] IMQA MPM Version Infomation : 3.9.0
[IMQA] Sent dump data
```

-----

## 샘플 앱 구조

IMQA는 성능 데이터를 수집후 수집 주기에 따라 데이터를 전송하거나, 앱이 재기동 되는 시점에 데이터를 전송합니다
데이터를 생성 후(앱을 사용 후) 설정된 수집주기(1분)만큼 기다리거나, 앱을 껏다 켜면 앱이 IMQA 수집서버로 전송됩니다

> 앱에 뒤로가기 버튼이 없습니다. 왼쪽 화면 끝에서 슬라이드 하는 제스처를 해주시면 이전 화면으로 돌아 갈 수 있습니다. 

### SDK 설정 

프로젝트 키 또는 수집서버를 설정하실 수 있습니다. 

[<img src="https://raw.githubusercontent.com/onycom-imqa/IMQA_IOS_SAMPLE/main/images/ios-2.png" width="250"/>](image.png)


### Uncaught Objective-C Exception 

강제종료가 되는 크래시를 발생 시킵니다. 
이 경우에는 디버깅 모드에서는 사용할 수 없습니다. Xcode와의 연결을 끊어주신 다음 사용하시면 정상적으로 수집이 됩니다. 

### Custom Error

IMQA에서는 커스텀한 에러를 발생 시킬 수 있습니다. `CustomErrorViewController.swift`에서 사용예시를 확인 할 수 있습니다.  

### Page Move 

IMQA는 별도의 화면마다 코드 설정 필요없이 자동으로 화면 데이터를 수집합니다. 
다양하게 이동하면서 테스트 해보실 수 있습니다. 

### WKWebview 

IMQA는 Webview 정보도 중요한 데이터라 생각하여 다양한 데이터를 수집합니다. 
웹뷰 데이터를 수집하는 방법이 알고 싶으시다면 [가이드](https://docs.imqa.io/installation/ios-sdk/mpm-sdk/wkwebview)를 확인해주세요.

저희의 블로그 컨텐츠 "[웹 페이지 로딩 과정 이해하기](https://blog.imqa.io/webpage_loading_process/)" 컨텐츠도 읽으시면 도움이 됩니다. 

### URL Session 

네이티브 내에서 네트워크 통신하는 데이터도 수집을 하고 있습니다. 
별도의 설정 없이 네트워크 통신을 수집해보세요.  

## Release Note
[릴리즈 노트 페이지](https://docs.imqa.io/release-note/update)


## IMQA 포럼
포럼으로 바로가기 (IM Dev)

http://imdev.imqa.io/
