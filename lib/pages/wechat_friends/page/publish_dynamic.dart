import 'package:flutter/material.dart';
import 'dart:async';

import '../chat_style.dart';
import '../ui/asset_view.dart';

import 'package:wechat_flutter/tools/wechat_flutter.dart';

class PublishDynamicPage extends StatefulWidget {
//  final List<Asset> images;
  final List images;
  final int maxImages;

  PublishDynamicPage({Key key, this.images: const [], this.maxImages: 9})
      : super(key: key);

  @override
  createState() => _PublishDynamicPageState();
}

class _PublishDynamicPageState extends State<PublishDynamicPage> {
//  List<Asset> _images = [];

  int imageNum;

  @override
  void initState() {
    super.initState();

//    _images = widget.images;
//
//    imageNum = _images.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
            child: RaisedButton(
                onPressed: () {
                  /// TODO
                  Navigator.of(context).pop();
                },
                child: Text('发表', style: TextStyle(color: Colors.white)),
                color: Colors.green),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              height: 100,
              child: Form(onWillPop: _onBackPressed, child: TextField()),
            ),
            Line(color: Colors.grey),
            GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: (winWidth(context) - 20) / 3,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 1.0),
                itemBuilder: (context, index) => AssetView(
//                      asset: index == imageNum ? null : _images[index],
                      asset: null,
                      onTap: () {
                        if (imageNum < widget.maxImages && index == imageNum) {
                          loadAssets();
                        }

                        /// TODO 进入预览界面
                      },
                    ),
                itemCount:
                    imageNum < widget.maxImages ? imageNum + 1 : imageNum,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false),
            Line(color: Colors.grey, margin: EdgeInsets.all(0)),
            ListTile(
                leading: Icon(Icons.location_on),
                title: Text('所在位置'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {}),
            Line(color: Colors.grey, margin: EdgeInsets.all(0)),
            ListTile(
                leading: Icon(Icons.remove_red_eye),
                title: Text('谁可以看'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {}),
            Line(color: Colors.grey, margin: EdgeInsets.all(0)),
            ListTile(
                leading: Icon(Icons.attachment),
                title: Text('提醒谁看'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {}),
            Line(color: Colors.grey, margin: EdgeInsets.all(0)),
          ],
        ),
      ),
    );
  }

  Future<void> loadAssets() async {
//    List<Asset> resultList = List<Asset>();
//
//    try {
//      resultList = await MultiImagePicker.pickImages(
//        maxImages: widget.maxImages,
//        enableCamera: false,
//        selectedAssets: _images,
//        materialOptions: MaterialOptions(
//          actionBarColor: "#ff00a5",
//          actionBarTitle: "Flutter App",
//          actionBarTitleColor: "#ffffffff",
//          allViewTitle: "All Photos",
//          useDetailsView: true,
//          lightStatusBar: false,
//          selectCircleStrokeColor: "#ff11ab",
//          statusBarColor: '#ff00a5',
//          startInAllView: true,
//          selectionLimitReachedText: "You can't select any more.",
//        ),
//        cupertinoOptions: CupertinoOptions(
//          selectionFillColor: "#ff11ab",
//          selectionTextColor: "#ff00a5",
//          selectionCharacter: "✓",
//        ),
//      );
//
//      for (var r in resultList) {
//        var t = await r.filePath;
//        print(t);
//      }
//    } on PlatformException catch (e) {
//      debugPrint(e.message.toString());
//    } on NoImagesSelectedException catch (e) {
//      debugPrint(e.message.toString());
//    } on PermissionDeniedException catch (e) {
//      debugPrint(e.message.toString());
//    } on PermissionPermanentlyDeniedExeption catch (e) {
//      debugPrint(e.message.toString());
//    } on Exception catch (e) {
//      debugPrint(e.toString());
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      _images = resultList;
//      imageNum = _images.length;
//      debugPrint(_images.toString());
//    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('保留此次编辑？', style: TextStyles.textBlue16),
            //标题
            titlePadding: EdgeInsets.all(20),
            //标题的padding值
            actions: <Widget>[
              //操作按钮数组
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, false);
                },
                child: Text('不保留', style: TextStyles.textGrey14),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
                child: Text('保留', style: TextStyles.textRed14),
              ),
            ],
          );
        });
  }
}
