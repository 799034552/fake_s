import 'package:flutter/material.dart';
import 'package:wechat_flutter/config/dictionary.dart';
import 'package:wechat_flutter/im/model/contacts.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';
import 'package:wechat_flutter/ui/item/contact_item.dart';
import 'package:wechat_flutter/ui/item/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_flutter/pages/chat/chat_page.dart';
import 'package:wechat_flutter/pages/contacts/group_launch_page.dart';
import 'package:wechat_flutter/pages/home/search_page.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';

class HuaSelectPage extends StatefulWidget {
  _HuaSelectPageState createState() => _HuaSelectPageState();
}

class _HuaSelectPageState extends State<HuaSelectPage>
    with AutomaticKeepAliveClientMixin {
  var indexBarBg = Colors.transparent;
  var currentLetter = '';
  var isNull = false;

  ScrollController sC;
  List<Contact> _contacts = [];
  StreamSubscription<dynamic> _messageStreamSubscription;

  List<ContactItem> _functionButtons = [
    new ContactItem(
        avatar: "assets/myadd/4.png", title: '消息'),
    new ContactItem(
        avatar: "assets/myadd/5.png", title: '企业通讯录'),
    new ContactItem(avatar: "assets/myadd/6.png", title: '我')
  ];
  final Map _letterPosMap = {INDEX_BAR_WORDS[0]: 0.0};

  Future getContacts() async {
    // final str = await ContactsPageData().listFriend();
    // isNull = await ContactsPageData().contactIsNull();

    List<Contact> listContact = [];

    listContact.addAll([
      Contact(
        name: "财务处",
        identifier: "1",
        nameIndex: "C",
        avatar: "assets/myadd/7.png"
      ),
      Contact(
        name: "党委宣传部",
        identifier: "2",
        nameIndex: "D",
        avatar: "assets/myadd/8.png"
      ),
      Contact(
        name: "大学城校区",
        identifier: "3",
        nameIndex: "D",
        avatar: "assets/myadd/9.png"
      ),
      Contact(
        name: "eduroam",
        identifier: "4",
        nameIndex: "E",
        avatar: "assets/myadd/10.png"
      ),
      Contact(
        name: "分析测试中心",
        identifier: "4",
        nameIndex: "F",
        avatar: "assets/myadd/9.png"
      ),
      Contact(
        name: "国际校区综合办",
        identifier: "4",
        nameIndex: "G",
        avatar: "assets/myadd/8.png"
      ),
      Contact(
        name: "华工保卫处",
        identifier: "4",
        nameIndex: "H",
        avatar: "assets/myadd/11.png"
      ),
      Contact(
        name: "纪委办公室、监察处",
        identifier: "4",
        nameIndex: "J",
        avatar: "assets/myadd/8.png"
      ),
      Contact(
        name: "科学技术研究院",
        identifier: "4",
        nameIndex: "K",
        avatar: "assets/myadd/9.png"
      ),
      Contact(
        name: "木棉BBS (校园网内试运行)",
        identifier: "4",
        nameIndex: "M",
        avatar: "assets/myadd/12.png"
      ),
      Contact(
        name: "木棉乐享",
        identifier: "4",
        nameIndex: "M",
        avatar: "assets/myadd/13.png"
      ),
      Contact(
        name: "My Pass 我的通行证",
        identifier: "4",
        nameIndex: "M",
        avatar: "assets/myadd/9.png"
      ),
      Contact(
        name: "拾卡寻人",
        identifier: "4",
        nameIndex: "S",
        avatar: "assets/myadd/14.png"
      ),
      Contact(
        name: "社团OA",
        identifier: "4",
        nameIndex: "S",
        avatar: "assets/myadd/15.png"
      ),
      Contact(
        name: "师生服务中心",
        identifier: "4",
        nameIndex: "S",
        avatar: "assets/myadd/8.png"
      ),
      Contact(
        name: "实验室与设备管理处",
        identifier: "4",
        nameIndex: "S",
        avatar: "assets/myadd/9.png"
      ),
      Contact(
        name: "通知公告",
        identifier: "4",
        nameIndex: "T",
        avatar: "assets/myadd/9.png"
      ),
      Contact(
        name: "消息通知",
        identifier: "4",
        nameIndex: "X",
        avatar: "assets/myadd/16.png"
      ),
      Contact(
        name: "校园地图",
        identifier: "4",
        nameIndex: "X",
        avatar: "assets/myadd/17.png"
      ),
      Contact(
        name: "校园网",
        identifier: "4",
        nameIndex: "X",
        avatar: "assets/myadd/18.png"
      ),
      Contact(
        name: "校园一卡通",
        identifier: "4",
        nameIndex: "X",
        avatar: "assets/myadd/19.png"
      ),
      Contact(
        name: "新生数据采集",
        identifier: "4",
        nameIndex: "X",
        avatar: "assets/myadd/9.png"
      ),
      Contact(
        name: "学生资助",
        identifier: "4",
        nameIndex: "X",
        avatar: "assets/myadd/9.png"
      ),
      Contact(
        name: "虚拟华园",
        identifier: "4",
        nameIndex: "X",
        avatar: "assets/myadd/20.png"
      ),
      Contact(
        name: "移动门户",
        identifier: "4",
        nameIndex: "Y",
        avatar: "assets/myadd/8.png"
      ),
      Contact(
        name: "移动图书馆",
        identifier: "4",
        nameIndex: "Y",
        avatar: "assets/myadd/21.png"
      ),
      Contact(
        name: "医疗器械研究检验中心",
        identifier: "4",
        nameIndex: "Y",
        avatar: "assets/myadd/9.png"
      ),
      Contact(
        name: "疫情防控专区",
        identifier: "4",
        nameIndex: "Y",
        avatar: "assets/myadd/22.png"
      ),
      Contact(
        name: "一张表",
        identifier: "4",
        nameIndex: "Y",
        avatar: "assets/myadd/23.png"
      ),
    ]);
     
    _contacts.clear();
    _contacts..addAll(listContact);
    _contacts
        .sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
    sC = new ScrollController();

    /// 计算用于 IndexBar 进行定位的关键通讯录列表项的位置
    var _totalPos =
        _functionButtons.length * ContactItemState.heightItem(false);
    for (int i = 0; i < _contacts.length; i++) {
      bool _hasGroupTitle = true;
      if (i > 0 &&
          _contacts[i].nameIndex.compareTo(_contacts[i - 1].nameIndex) == 0)
        _hasGroupTitle = false;

      if (_hasGroupTitle) _letterPosMap[_contacts[i].nameIndex] = _totalPos;

      _totalPos += ContactItemState.heightItem(_hasGroupTitle);
    }
    if (mounted) setState(() {});
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    if (sC != null) sC.dispose();
    canCelListener();
  }

  String _getLetter(BuildContext context, double tileHeight, Offset globalPos) {
    RenderBox _box = context.findRenderObject();
    var local = _box.globalToLocal(globalPos);
    int index = (local.dy ~/ tileHeight).clamp(0, INDEX_BAR_WORDS.length - 1);
    return INDEX_BAR_WORDS[index];
  }

  void _jumpToIndex(String letter) {
    if (_letterPosMap.isNotEmpty) {
      final _pos = _letterPosMap[letter];
      if (_pos != null)
        sC.animateTo(_pos,
            curve: Curves.easeOut, duration: Duration(milliseconds: 200));
    }
  }

  Widget _buildIndexBar(BuildContext context, BoxConstraints constraints) {
    final List<Widget> _letters = INDEX_BAR_WORDS
        .map((String word) =>
            new Expanded(child: new Text(word, style: TextStyle(fontSize: 12))))
        .toList();

    final double _totalHeight = constraints.biggest.height;
    final double _tileHeight = _totalHeight / _letters.length;

    void jumpTo(details) {
      indexBarBg = Colors.black26;
      currentLetter = _getLetter(context, _tileHeight, details.globalPosition);
      _jumpToIndex(currentLetter);
      setState(() {});
    }

    void transparentMethod() {
      indexBarBg = Colors.transparent;
      currentLetter = null;
      setState(() {});
    }

    return new GestureDetector(
      onVerticalDragDown: (DragDownDetails details) => jumpTo(details),
      onVerticalDragEnd: (DragEndDetails details) => transparentMethod(),
      onVerticalDragUpdate: (DragUpdateDetails details) => jumpTo(details),
      child: new Column(children: _letters),
    );
  }

  @override
  void initState() {
    super.initState();
    getContacts();
    initPlatformState();
  }

  void canCelListener() {
    if (_messageStreamSubscription != null) _messageStreamSubscription.cancel();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    if (_messageStreamSubscription == null) {
      // _messageStreamSubscription =
      //     im.onMessage.listen((dynamic onData) => getContacts());
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    List<Widget> body = [
      new ContactView(
          sC: sC, functionButtons: _functionButtons, contacts: _contacts),
      new Positioned(
        width: Constants.IndexBarWidth,
        right: 0.0,
        top: 120.0,
        bottom: 120.0,
        child: new Container(
          color: indexBarBg,
          child: new LayoutBuilder(builder: _buildIndexBar),
        ),
      ),
    ];

    if (isNull) body.add(new HomeNullView(str: '无联系人'));

    if (currentLetter != null && currentLetter.isNotEmpty) {
      var row = [
        new Container(
            width: Constants.IndexLetterBoxSize,
            height: Constants.IndexLetterBoxSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.IndexLetterBoxBg,
              borderRadius: BorderRadius.all(
                  Radius.circular(Constants.IndexLetterBoxSize / 2)),
            ),
            child: new Text(currentLetter,
                style: AppStyles.IndexLetterBoxTextStyle)),
        new Icon(Icons.arrow_right),
        new Space(width: mainSpace * 5),
      ];
      body.add(
        new Container(
          width: winWidth(context),
          height: winHeight(context),
          child:
              new Row(mainAxisAlignment: MainAxisAlignment.end, children: row),
        ),
      );
    }
    var rWidget = [
      new InkWell(
        child: new Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          child: new Image.asset('assets/images/contact/ic_contact_add.webp',
              color: Colors.black, width: 22.0, fit: BoxFit.fitWidth),
        ),
        onTap: () => Get.to(new GroupLaunchPage()),
      ),
    ];
    return new Scaffold(
      appBar: new ComMomBar(title: '华南理工大学', rightDMActions: rWidget),
      body: new Stack(children: body)
      );
  }
}
