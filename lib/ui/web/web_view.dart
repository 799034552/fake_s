import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:wechat_flutter/ui/bar/commom_bar.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, this.title);

  @override
  State<StatefulWidget> createState() => new WebViewPageState();
}



class WebViewPageState extends State<WebViewPage> {
  WebViewController _controller_t;
  WebViewPlusController _controller;
  String _title="";
  String defaultValue = "2022-09-17@@2022-09-17@@琶洲@@看漫展@@宋书航@@202120212021@@土木与交通学院@@2022@@本科生";

  void set_key(String a) async {
    var sp = await SharedPreferences.getInstance();
    sp.setString("localstorage", a ?? defaultValue);
  }
  void get_key(WebViewController _controller_tt) async{
    var sp = await SharedPreferences.getInstance();
    var a = sp.getString("localstorage") ?? defaultValue;
    print("获取localstorage$a");
    _controller_tt.evaluateJavascript('localStorage.setItem("data","$a")');
  }
  void showToast(String a) {
    set_key(a);
    print("设置localstorage$a");
  }

  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toast',
        onMessageReceived: (JavascriptMessage message) {
          showToast(message.message);
        });
  }

  Widget body() {
    return new Builder(builder: (BuildContext context) {
      return 
        WebViewPlus(
                javascriptChannels: <JavascriptChannel>[
                    _alertJavascriptChannel(context),
                  ].toSet(),
                initialUrl: 'assets/html/mypass_first.html',
                onWebViewCreated: (controller) {
                  this._controller = controller;
                  _controller_t = controller.webViewController;
                  
                },
                onPageFinished: (url){
                  get_key(_controller_t);
                  _controller_t.evaluateJavascript("document.title").then((result){
                    setState(() {
                        // _title = result;
                        _title = result.substring(1,result.length - 1);
                        print(result);
                      });
                    }
                  );
                  // _controller.getHeight().then((double height) {
                  //   print("Height: " + height.toString());
                  //   setState(() {
                  //     _height = height;
                  //   });
                  // });
                },
                javascriptMode: JavascriptMode.unrestricted,
              );
      // new WebView(
      //   initialUrl: widget.url,
      //   javascriptMode: JavascriptMode.unrestricted,
      //   // onWebViewCreated: (WebViewController webViewController) {
      //   //   _controller.complete(webViewController);
      //   //   _controller.
      //   // },
      //   onWebViewCreated: (controller) {
      //         _controller = controller;
      //         print("重新加载");
      //         _loadHtmlFromAssets();
      //   },
      //   javascriptChannels: <JavascriptChannel>[
      //     _toasterJavascriptChannel(context),
      //   ].toSet(),
      //   navigationDelegate: (NavigationRequest request) {
      //     if (request.url
      //         .startsWith('https://github.com/fluttercandies/wechat_flutter')) {
      //       print('blocking navigation to $request}');
      //       return NavigationDecision.prevent;
      //     }
      //     print('allowing navigation to $request');
      //     return NavigationDecision.navigate;
      //   },
      //   onPageFinished: (String url) {
      //     print('Page finished loading: $url');
      //     _controller.evaluateJavascript("document.title").then((result){
      //       setState(() {
      //           // _title = result;
      //           _title = result.substring(1,result.length - 1);
      //           print(result);
      //         });
      //       }
      //     );
      //   },
      // );
    });
  }
  // _loadHtmlFromAssets() async {
  //   String fileHtmlContent = await rootBundle.loadString("assets/html/mypass_first.html");
  //   _controller.loadHtmlString(fileHtmlContent);
  //   // String jsContent = await rootBundle.loadString(jsPath);
  //   // _webViewController.runJavascript(jsContent);
  // }
  Future<bool> _goBack(BuildContext context) async {
    if (_controller_t != null && await _controller_t.canGoBack()) {
      _controller_t.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () {
        return _goBack(context);
      },
      child:  Scaffold(
        appBar: new ComMomBar(
            title: _title, leadingImg: 'assets/images/bar_close.png'),
        body: body(),
      ),
    );

  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return new JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        Scaffold.of(context).showSnackBar(
          new SnackBar(content: Text(message.message)),
        );
      },
    );
  }
}


