> 由于某些特殊需求，这是一个用两天时间速成的flutter仿造微信项目，项目基于@ahyangnb大佬的项目[fluttercandies/wechat_flutter: wechat_flutter Flutter版本微信，一个优秀的Flutter即时通讯IM开源库！ (github.com)](https://github.com/fluttercandies/wechat_flutter)，添加了企业号的入口，由于本人从这个项目之前没学过app快发，只花了一个小时看了一下flutter和dart的简单语法，所以修改后的代码质量不算高

# flutter环境

```
[✓] Flutter (Channel stable, 2.10.4, on Microsoft Windows [Version 10.0.19044.1889], locale zh-CN)
    • Flutter version 2.10.4 at F:\e\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision c860cba910 (6 months ago), 2022-03-25 00:23:12 -0500
    • Engine revision 57d3bac3dd
    • Dart version 2.16.2
    • DevTools version 2.9.2
    • Pub download mirror https://pub.flutter-io.cn
    • Flutter download mirror https://storage.flutter-io.cn

[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
    • Android SDK at F:\e\android_sdk
    • Platform android-33, build-tools 33.0.0
    • ANDROID_HOME = F:\e\android_sdk
    • Java binary at: F:\e\android_studio\jre\bin\java
    • Java version OpenJDK Runtime Environment (build 11.0.12+7-b1504.28-7817840)
    • All Android licenses accepted.

[✓] Chrome - develop for the web
    • Chrome at C:\Program Files\Google\Chrome\Application\chrome.exe

[✓] Visual Studio - develop for Windows (Visual Studio Professional 2019 16.10.4)
    • Visual Studio at D:\c\visual_studio\packages
    • Visual Studio Professional 2019 version 16.10.31515.178
    • Windows 10 SDK version 10.0.19041.0

[✓] Android Studio (version 2021.2)
    • Android Studio at F:\e\android_studio
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.12+7-b1504.28-7817840)

[✓] Connected device (4 available)
    • Android SDK built for x86 (mobile) • emulator-5554 • android-x86    • Android 11 (API 30) (emulator)
    • Windows (desktop)                  • windows       • windows-x64    • Microsoft Windows [Version 10.0.19044.1889]
    • Chrome (web)                       • chrome        • web-javascript • Google Chrome 100.0.4896.88
    • Edge (web)                         • edge          • web-javascript • Microsoft Edge 105.0.1343.33

[✓] HTTP Host Availability
    • All required HTTP hosts are available

• No issues found!
```



# 使用方法

先下载对应的包

`flutter pub get`

配置好vscode或者android_studio的环境后，就能够运行了。

打包成apk

`flutter build apk`

# 说明

* 初始聊天框里全是随机的假数据
* 对某些数据进行zip压缩

# 坑

* webview_flutter没有localstorage，网页读取数据时需要先传递给flutter，将网页本地数据作为应用数据保存，要使用时由flutter注入js

* webview_flutter中模拟器的表现和实机不太一样，要进行调整

* webview_flutter读取静态html比较麻烦，使用webview_flutter_plus能够创建本机http服务，然后对他进行访问

* 前端input与span的字在同等大小与字体时表现依旧不一致

  

