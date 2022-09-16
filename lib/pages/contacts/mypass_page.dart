// import 'dart:html';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';

// class MyPassPage extends StatefulWidget {

//   @override
//   _MyPassPageState createState() => _MyPassPageState();
// }

// class _MyPassPageState extends State<MyPassPage> {
//   Widget getWebView() {
//     final IFrameElement _iframeElement = IFrameElement();
//     _iframeElement.src = "https://www.baidu.com";
//     _iframeElement.style.border = 'none';
// // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       'iframeElement',
//       (int viewId) => _iframeElement,
//     );
//     Widget _iframeWidget;
//     _iframeWidget = HtmlElementView(
//       key: UniqueKey(),
//       viewType: 'iframeElement',
//     );
//     return Stack(
//       children: <Widget>[
//         IgnorePointer(
//           ignoring: true,
//           child: Center(
//             child: _iframeWidget,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       child: Center(
//         child: Container(
//           width: 700,
//           height: 700,
//           child: getWebView(),
//         ),
//       ),
//     );
//   }
// }