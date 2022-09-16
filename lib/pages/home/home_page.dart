import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_flutter/im/model/chat_list.dart';
import 'package:wechat_flutter/pages/chat/chat_page.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';
import 'package:wechat_flutter/ui/chat/my_conversation_view.dart';
import 'package:wechat_flutter/ui/edit/text_span_builder.dart';
import 'package:wechat_flutter/ui/view/indicator_page_view.dart';
import 'package:wechat_flutter/ui/view/pop_view.dart';
import 'dart:math';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<ChatList> _chatData = [];

  var tapPos;
  TextSpanBuilder _builder = TextSpanBuilder();
  StreamSubscription<dynamic> _messageStreamSubscription;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    getChatData();
  }
  
  
  

  // myimport
  // 聊天页
  Future getChatData() async {
    var rng = new Random();
    var nameList = ["税冰香","谷梁问筠","尹怡宁","璩鸿博","逮格菲","圣贤淑","牧鸿畅","茹忆敏","栗雨莲","邶澹","壬怿","尾秀美","袁紫雪","皇骏桀","泉季","冀华楚","阮晓凡","少淑君","寻珍","忻文墨","随翠霜","捷梦露","闾玟玉","锁睿敏","强雅","旅亦巧","度弘博","酒鸿晖","碧鲁叶春","范姜谷蓝","郁凝芙","巫马如","臧洁静","景子怡","哀霞英","宁智宇","香鹏翼","左丘梓馨","壤驷芸","关香之","伯天蓝","速思懿","祭忆秋","厍梓美","杨媛女","江米琪","道志新","奈寄琴","弭天翰","阙德佑","宫祺","赫连莹琇","翦绿竹","仆妍","鄢彬","广忆文","老念巧","麻清卓","宓骊洁","淦骞信","华维运","府韶","沐成弘","斋静娴","宣荣","越春华","虢毅然","母天蓝","霍真一","塞傲云","冠旷","买洁雅","喜渺","濮阳寻桃","淳于曼安","芒丽","公良元柳","合倚","爱嘉勋","英波鸿","宾青柏","禾痴","势丹萱","鲜于天蓝","勇琦巧","翁晶滢","律海之","宇悠馨","赫珠雨","公叔坚壁","司寇友桃","六水","蒿琼怡","寒高旻","边悦乐","苦雅逸","贡古香","汉溪蓝","家如南","藤璇珠","行俊力","寇晟睿","湛璟","书子","不忆彤","伊智刚","贸寄南","庄怀绿","杞靖柔","储诗柳","宰萌阳","漫静曼","宋木","赖家馨","饶沛柔","农恩霈","东方萌","阴妮娜","宿竹筱","成向雁","怀绮烟","靖阳朔","宦冰蝶","完颜彦珺","项笑天","谯敏智","严玮艺","丘信鸿","世鸿光","繁诗蕊","茂秀英","板旭炎","犁安静","荀祥","瓮雅素","元迎天","错俊杰","那拉紫夏","豆迎夏","琦文虹","蒉星星","睢煊","励如之","咎志行","泰半梅","庹新雨","官夜蓉","松傲安","是天青","依睿才","保雪儿","夫梦山","笪迎天","蔚赩","才友灵","匡祺福","萧嘉庆","栾怀桃","德芳懿","向乐容","飞鹏举","石卓然","庾存","融扬","蒲天睿","戚兴旺","顿建华","於幼仪","文茜茜","允芷雪","蛮驰月","闵津","东门康德","京乐心","羊舌晗玥","蒋春英","梁丘水儿","那凌霜","腾艳卉","晁昌淼","尉迟半","颜夏烟","首采萱","类朝","稽语海","花书文","毕芝英","申屠致","卜尚","拱夏月","平雅洁","哈冰双","仰竹萱","段干飞光","俞映雁","柯颐","骑兴文","释言","穆弘大","侯和硕","印昆琦","狄春柔","栋盼波","寿韵","蚁半兰","无晴画","司澜","红映雪","仝春晓","锐云淡","潜慧语","班问寒","树运珹","亓寄波","慕子民","朱弘懿","泷基","乐正采蓝","蓬诗槐","巫曼妮","廖云泽","郗曼蔓","何梦菲","习含玉","市运洁","范绮南","锺离恬欣","邱夜柳","孔诗晗","刘飞双","冉浩思","过梦香","告清宁","布凝珍","耿尔安","朴聪睿","赧思远","竺修谨","汪南烟","旷自强","仵秋颖","滕凌文","雍绮烟","同紫雪","奚涵育","郏昕珏","蔺安邦","黎阳","从飞翔","夕飞鸾","真舒","刑霞辉","孙芷烟","但奇正","诗韶仪","微生毅","终笑寒","衣雁蓉","战晓丝","简谷翠","莱盼夏","汗高阳","恽若翠","卫兰泽","时暄妍","源涵润","乜灵安","尤芝兰","常翠阳","摩忆然","罗采莲","端微熹","籍谷","封思柔","戴玲","厉雯丽","惠盼香","乔宛筠","位彩","任小凝","甲雪枫","东芷荷","衷雅柏","瑞鸿羲","莫承颜","承婷美","池识","步鲸","慕容桐欣","欧阳华","隐傲易","鹿雅宁","野兴怀","水青亦","许莹然","鞠壁","长孙娅欣","骆森","公西承望","折鑫","箕文心","桓忆丹","镜冷珍","年瑾瑶","养冷之","皮华翰","卢慧心","刁飞薇","言晴画","竹觅露","公羊冬菱","褚震博","方元驹","劳冰薇","蒙迪","委佳美","恭玟丽","全芮美","富恨风","卿宛白","貊白梅","轩辕晓畅","连远悦","奕俏丽","百里欣艳","千可儿","斛安梦","巴鹏天","剑阳伯","仲俊友","郝萧曼","泣高歌","昔文华","刀雨筠","薛琦","雷宏茂","钞晓曼","孟琴心","邸依波","钊伶","滑翠丝","乌孙绮怀","阎晴丽","盘娅玟","别雁山","丁逸","邹听筠","僧中震","扬皛","镇阳波","脱梦雨","桑丽华","段子墨","粘皓洁","楚河灵","麴修伟","迟坚秉","陀恨桃","开和畅","历琬凝","尚敏慧","祝飞沉","郎明亮","之学义","扈雅青","光昆纬","守秋蝶","宰父益","似成礼","于寻桃"];
    var pinList = ["s","g","y","q","d","s","m","r","l","b","r","w","y","h","q","j","r","s","x","x","s","j","l","s","q","l","d","j","b","f","y","w","z","j","ā","n","x","z","r","g","b","s","j","s","y","j","d","n","m","q","g","h","j","p","y","g","l","m","m","g","h","f","m","z","x","y","g","m","h","s","g","m","x","p","c","m","g","h","à","y","b","h","s","x","y","w","l","y","h","g","s","l","h","h","b","k","g","h","j","t","x","k","z","s","b","y","m","z","q","c","z","m","s","l","r","n","d","y","s","c","h","j","h","w","x","q","y","q","s","f","m","b","l","x","w","y","c","n","d","q","k","s","l","j","t","t","g","s","s","y","b","f","d","w","c","k","x","l","d","x","f","s","y","r","p","q","d","y","w","y","m","m","d","j","y","j","l","n","t","c","w","y","s","l","j","h","b","s","b","g","p","h","y","d","y","k","q","s","m","h","y","d","d","s","y","w","s","h","t","r","q","b","s","q","m","z","l","l","p","w","l","x","h","x","s","f","z","q","k","l","r","g","g","b","g","p","n","z","w","k","w","t","y","t","x","j","l","l","c","x","z","x","s","d","s","w","z","y","z","j","l","h","y","w","s","y","m","y","c","m","l","d","j","f","d","l","h","q","w","r","j","d","z","r","m","c","c","b","m","ō","y","l","y","s","x","j","z","l","g","z","j","h","j","n","y","p","l","d","y","z","g","c","f","l","m","w","g","q","f","q","m","x","l","y","b","q","h","b","j","z","h","q","x","d","x","l","c","m","d","z","h","w","y","p","b","d","z","s","y","z","t","s","d","z","c","q","c","t","k","l","s","z","l","z","h","g","s","z","s","y"];
    var chatList = ["我是你爹","等一下就去上班","生8dlc看着挺香","等明天","没有大轰龙失望","生化危机慢慢从科幻过度到魔幻了","有请双方选手入场","一个垃圾游戏这么开心？","屎上雕花","没做适配呗","刘海屏","不仔细看","都看不出来摄像头","写文章的也是无脑喷","图片经过刻意增加亮度","为了流量啥都弄啊","新闻瞎写","灵动岛的api刚给","当然没适配了","急什么","苹果的适配比安卓快多了","这个世界需要更多的卷王","阿b的游戏知识分享官活动","最近在招募游戏科普类up主","有很多奖励+官方编辑推荐扶持","感兴趣的铁子们可以点这个链接看看","甚至连TP都是抄出来的","瞬间没蚌住","问题描述","都财务自由了还要啥上岸","上岸都是为了稳定的工作","你不会是燕王","再这样取关了","记得提肛","老师不是我说你","你都是成仙成佛的人了","还在意上不上岸吗"];
    var avatarList = [];
    for(int i = 1; i < 75; ++i) {
      avatarList.add(i);
    }
    print("渲染聊天页表");
    List<ChatList> listChat = List.generate(
      30,
      (index) {
        final bool isGroup = index.isEven;
        var a = rng.nextInt(100000);
        int rand_av = rng.nextInt(avatarList.length);
        int av = avatarList[rand_av]; avatarList.removeAt(rand_av);
        int rand_name = rng.nextInt(nameList.length);
        String name = nameList[rand_name]; nameList.removeAt(rand_name);
        int rand_chat = rng.nextInt(chatList.length);
        String chat = chatList[rand_chat]; chatList.removeAt(rand_chat);

        return ChatList(
            identifier: '112$a',
            msgType: 'personal',
            avatar: 'assets/images/avatar/avatar ($av).jpg',
            content: {
              "message": {
                "text": chat,
                "type": "Text",
              }
            },
            name: name,
            type: isGroup ? "Group" : "Personnal",
            time: a);
      },
    );
    if (!listNoEmpty(listChat)) return;
    _chatData.clear();
    _chatData..addAll(listChat?.reversed);
    if (mounted) setState(() {});
  }

  _showMenu(BuildContext context, Offset tapPos, int type, String id) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromLTRB(tapPos.dx, tapPos.dy,
        overlay.size.width - tapPos.dx, overlay.size.height - tapPos.dy);
    showMenu<String>(
        context: context,
        position: position,
        items: <MyPopupMenuItem<String>>[
          new MyPopupMenuItem(child: Text('标为已读'), value: '标为已读'),
          new MyPopupMenuItem(child: Text('置顶聊天'), value: '置顶聊天'),
          new MyPopupMenuItem(child: Text('删除该聊天'), value: '删除该聊天'),
          // ignore: missing_return
        ]).then<String>((String selected) {
      switch (selected) {
        case '删除该聊天':
          getChatData();
          break;
        case '标为已读':
          break;
      }
    });
  }

  void canCelListener() {
    if (_messageStreamSubscription != null) {
      _messageStreamSubscription.cancel();
    }
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;

    if (_messageStreamSubscription == null) {
      // _messageStreamSubscription =
      //     im.onMessage.listen((dynamic onData) => getChatData());
    }
  }

  @override
  bool get wantKeepAlive => true;

  Widget timeView(int time) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);

    String hourParse = "0${dateTime.hour}";
    String minuteParse = "0${dateTime.minute}";

    String hour = dateTime.hour.toString().length == 1
        ? hourParse
        : dateTime.hour.toString();
    String minute = dateTime.minute.toString().length == 1
        ? minuteParse
        : dateTime.minute.toString();

    String timeStr = '$hour:$minute';

    return new SizedBox(
      width: 35.0,
      child: new Text(
        timeStr,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: mainTextColor, fontSize: 14.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (!listNoEmpty(_chatData)) return new HomeNullView();
    return new Container(
      color: Color(AppColors.BackgroundColor),
      child: new ScrollConfiguration(
        behavior: MyBehavior(),
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            ChatList model = _chatData[index];

            return InkWell(
              onTap: () {
                Get.to(new ChatPage(
                    id: model.identifier,
                    title: model.name,
                    type: model.type == 'Group' ? 2 : 1));
              },
              onTapDown: (TapDownDetails details) {
                tapPos = details.globalPosition;
              },
              onLongPress: () {
                if (Platform.isAndroid) {
                  _showMenu(context, tapPos, model.type == 'Group' ? 2 : 1,
                      model.identifier);
                } else {
                  debugPrint("IOS聊天长按选项功能开发中");
                }
              },
              child: new MyConversationView(
                imageUrl: model.avatar,
                title: model?.name ?? '',
                content: model?.content,
                time: timeView(model?.time ?? 0),
                isBorder: model?.name != _chatData[0].name,
              ),
            );
          },
          itemCount: _chatData?.length ?? 1,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    canCelListener();
  }
}
