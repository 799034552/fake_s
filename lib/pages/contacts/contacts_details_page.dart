import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wechat_flutter/pages/chat/chat_page.dart';
import 'package:wechat_flutter/pages/chat/more_info_page.dart';
import 'package:wechat_flutter/pages/chat/set_remark_page.dart';
import 'package:wechat_flutter/pages/wechat_friends/page/wechat_friends_circle.dart';
import 'package:wechat_flutter/provider/global_model.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';
import 'package:wechat_flutter/ui/dialog/friend_item_dialog.dart';
import 'package:wechat_flutter/ui/item/contact_card.dart';
import 'package:wechat_flutter/ui/orther/button_row.dart';
import 'package:wechat_flutter/ui/orther/label_row.dart';

class ContactsDetailsPage extends StatefulWidget {
  final String avatar, title, id;

  ContactsDetailsPage({this.avatar, this.title, this.id});

  @override
  _ContactsDetailsPageState createState() => _ContactsDetailsPageState();
}

class _ContactsDetailsPageState extends State<ContactsDetailsPage> {
  List<Widget> body(bool isSelf) {
    return [
      new ContactCard(
        img: widget.avatar,
        id: widget.id,
        title: widget.title,
        nickName: widget.title,
        area: '北京 海淀',
        isBorder: true,
      ),
      new Visibility(
        visible: !isSelf,
        child: new LabelRow(
          label: '设置备注和标签',
          onPressed: () => Get.to(new SetRemarkPage()),
        ),
      ),
      new Space(),
      new LabelRow(
        label: '朋友圈',
        isLine: true,
        lineWidth: 0.3,
        onPressed: () => Get.to(new WeChatFriendsCircle()),
      ),
      new LabelRow(
        label: '更多信息',
        onPressed: () => Get.to(new MoreInfoPage()),
      ),
      new ButtonRow(
        margin: EdgeInsets.only(top: 10.0),
        text: '发消息',
        isBorder: true,
        onPressed: () =>
            Get.off(new ChatPage(id: widget.id, title: widget.title, type: 1)),
      ),
      new Visibility(
        visible: !isSelf,
        child: new ButtonRow(
          text: '音视频通话',
          onPressed: () => showToast(context, '敬请期待'),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final globalModel = Provider.of<GlobalModel>(context);
    bool isSelf = globalModel.account == widget.id;

    var rWidget = [
      new SizedBox(
        width: 60,
        child: new FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () => friendItemDialog(context, userId: widget.id),
          child: new Image.asset(contactAssets + 'ic_contacts_details.png'),
        ),
      )
    ];

    return new Scaffold(
      backgroundColor: chatBg,
      appBar: new ComMomBar(
          title: '',
          backgroundColor: Colors.white,
          rightDMActions: isSelf ? [] : rWidget),
      body: new SingleChildScrollView(
        child: new Column(children: body(isSelf)),
      ),
    );
  }
}
