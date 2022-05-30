import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';

class ModifyNotificationMessage extends StatefulWidget {
  final dynamic data;

  ModifyNotificationMessage(this.data);

  ModifyNotificationMessageState createState() =>
      ModifyNotificationMessageState();
}

class ModifyNotificationMessageState extends State<ModifyNotificationMessage> {
  String name;
  List membersData;

  @override
  void initState() {
    super.initState();
    String user = widget.data['opGroupMemberInfo']['user'];
    getCardName(user);
  }

  getCardName(String user) async {
    String strToData = "";
    membersData = json.decode(strToData);
    var userPhone = await getStoreValue('userPhone');
    if (listNoEmpty(membersData)) if (user == userPhone)
      name = '你';
    else if (strNoEmpty(membersData[0]['nameCard']))
      name = membersData[0]['nameCard'];
    else
      name = user;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: new Text(
        '${name ?? ''}' + ' 修改了群公告',
        style:
            TextStyle(color: Color.fromRGBO(108, 108, 108, 0.8), fontSize: 11),
      ),
    );
  }
}
