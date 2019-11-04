import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/routeButton.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_app/Source.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:english_words/english_words.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/netUtils.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_app/child.dart';
import 'package:flutter_app/routeButton.dart';

//void main() => runApp(
//    new MyApp(items: new List<String>.generate(100, (i) => '这里是循环list： $i+1'))
//);
void main(){
  runApp(MaterialApp(
    title:'导航',
    home:new MyApp(items: new List<String>.generate(100, (i) => '这里是循环list： $i+1'))
  ));
}

//现在做标题行
class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items, this.title}) : super(key: key);

//  MyApp({this.title});

  final Widget title;

  List<Widget> imageList = List();

  @override
  Widget build(BuildContext context) {

    var stack = new Stack(//stack布局
      alignment: const FractionalOffset(0.5, 0.5),//在x轴，y轴的位置
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage('http://img5.mtime.cn/mt/2019/10/22/153005.80455148_270X360X4.jpg'),
//          backgroundColor: Colors.lightBlue,
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
//            border:new Border.all(width: 0,color:Colors.black54),
          ),
          padding: EdgeInsets.all(5.0),
          child: Text('年少的你'),
        ),
        new Positioned(
          top:10.0,
          left: 10.0,
          height: 100.0,
          width: 100.0,
          child:new Image.asset('images/homePage/cat.jpg',fit: BoxFit.cover,)
        ),
        new Positioned(
            bottom: 10.0,
            right: 10.0,
            height: 100.0,
            width: 100.0,
            child: new Image.asset('images/homePage/fluffy.jpg',fit: BoxFit.cover,)
        )
      ],
    );

    var card = new Card(//card布局
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title:Text('卡片标题第一个',style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
            subtitle: Text("联系方式：QQer1/WeChater/instergramer"),
            leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
          ),
          ListTile(
            title:Text('卡片标题第二个',style: TextStyle(
                fontWeight: FontWeight.bold
            ),
            ),
            subtitle: Text("联系方式：QQer2/WeChater/instergramer"),
            leading: new Icon(Icons.access_time,color: Colors.lightBlue,),
          ),
          ListTile(
            title:Text('卡片标题第三个',style: TextStyle(
                fontWeight: FontWeight.bold
            ),
            ),
            subtitle: Text("联系方式：QQer3/WeChater/instergramer"),
            leading: new Icon(Icons.account_balance_wallet,color: Colors.lightBlue,),
          ),
        ],
      ),
    );

    @override
    void initSwiper() {
      //给轮播提供图片
      imageList
        ..add(Image.asset("images/homePage/banner1.jpg", fit: BoxFit.fill));
      imageList
        ..add(Image.asset("images/homePage/banner2.jpg", fit: BoxFit.fill));
      imageList
        ..add(Image.asset("images/homePage/banner3.jpg", fit: BoxFit.fill));
      imageList
        ..add(Image.asset("images/homePage/banner4.jpg", fit: BoxFit.fill));
      imageList
        ..add(Image.asset("images/homePage/banner5.png", fit: BoxFit.fill));
    }

    Widget _lineVertical = new Container(
      //数据列表里的小竖线
      width: 0.5,
      height: 15,
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      color: Colors.grey[500],
      child: new Text(' '),
    );
    Widget _lineCross = new Container(
      //数据列表里的小横线
      width: double.infinity,
      height: 0.5,
      color: Colors.grey[400],
      child: new Text(' '),
    );

    Widget _lineSection = new Container(
      //带高度的黑色块
      width: double.infinity,
      height: 10,
      color: Colors.grey[200],
      child: new Text(' '),
    );

    Widget _swiperBuilder(context, int index) {
      initSwiper();
      return (imageList[index]);
    }

    Widget swiperPageSection = new Container(
      //轮播图块
      margin: const EdgeInsets.only(top: 0, bottom: 0),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Swiper(
        itemCount: 5,
        //图片个数
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            )),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        //自动播放
        layout: SwiperLayout.DEFAULT,
        //设置样式
        autoplayDelay: kDefaultAutoplayDelayMs,
        autoplayDisableOnInteraction: true,
        //用户拖拽时是否停止autoplay
        duration: kDefaultAutoplayTransactionDuration,
        //动画时间，默认300ms
        onTap: (index) => print("这是点了$index个图"),
      ),
    );

    Widget warningSection = new Container(
        //预警监测块
//        padding: const EdgeInsets.all(32.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,//对齐的样式
      children: <Widget>[
        _lineSection,
        new Container(
          //小标题模块
          padding:
              const EdgeInsets.only(left: 5, top: 10, right: 0, bottom: 10),
          decoration: new BoxDecoration(),
          child: new DefaultTextStyle(
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w100,
                fontSize: 17,
              ),
              child: new Row(
                children: <Widget>[
                  new RaisedButton(
                    color: Colors.redAccent,
                      child: new Text('红色按钮 监测'),
                      onPressed: _tapSuddenly
                  ),
                  new Expanded(
                    child: new Text(
                      '预警监测',
//                        textAlign: TextAlign.start,//对齐方式
//                        maxLines: 1,//最大占用行数
//                        overflow: TextOverflow.ellipsis,//超出部分
                      style: TextStyle(//字体样式
                          //fontSize:25.0,//字体大小
//                          color:Colors.lightBlueAccent,//颜色
//                          decoration: TextDecoration.underline,//下划线
//                          decorationStyle: TextDecorationStyle.dashed,//下划线样式：虚线
                          ),
                    ),
                    flex: 2,
                  ),
                  new Expanded(
                    child: new Text(' '),
                    flex: 1,
                  )
                ],
              )),
        ),
        new Container(
//              color: Colors.lightBlue,//背景颜色，跟下面的decoration冲突，级别较低
//              alignment: Alignment.bottomLeft,//内容在左下角
//              width:50,//宽
//              height: 40,//高
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10), //内边距:左，上，右，下
          margin: const EdgeInsets.only(
              left: 0, top: 0, right: 0, bottom: 0), //外边距，随意设置
          decoration: new BoxDecoration(
//                gradient: const LinearGradient(
//                    colors:[Colors.red,Colors.greenAccent,Colors.purple],//背景颜色，渐变色
//                ),
//                color: Colors.red,//背景颜色，跟上面的color冲突，记得删除上面的color
              border: new Border.all(width: 0.5, color: Colors.grey[400])),
          child: new Row(
            children: <Widget>[
              new Expanded(
                //左侧企业预警
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        //左侧文字
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: new Column(
                          children: <Widget>[
                            new DefaultTextStyle(
                                style: new TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 17,
                                ),
                                child: new Text(
                                  '企业预警',
                                  textAlign: TextAlign.center,
                                )),
                            new DefaultTextStyle(
                                style: new TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                ),
                                child: new Text(
                                  '警示企业风险',
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                      ),
                      flex: 3,
                    ),
                    new Expanded(
                      child: new Container(
                          //右侧图片
                          height: 45, //高度
                          width: 45, //宽度
                          child: Image.asset(
                            'images/homePage/home-features-qiyeyujing.png',
//                              repeat: ImageRepeat.repeat,//是否repeat，以及怎样repeat
//                              color:Colors.greenAccent,//图片背景颜色
//                              colorBlendMode: BlendMode.darken,//图片的遮罩层，加个滤镜
                            fit: BoxFit
                                .scaleDown, //图片适配方式：fill是全填，图片会被拉伸，contain和cover是按比例填，scaleDown按照，带宽高的是按照宽高填。
                          )),
                      flex: 2,
                    )
                  ],
                ),
                flex: 5,
              ),
              new Container(
                height: 55,
                child: new DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey[400],
                    width: 0.5,
                  )),
                ),
              ),
              new Expanded(
                //右侧资产预警
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        //左侧文字
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: new Column(
                          children: <Widget>[
                            new DefaultTextStyle(
                                style: new TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 17,
                                ),
                                child: new Text('资产预警')),
                            new DefaultTextStyle(
                                style: new TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                ),
                                child: new Text('监控资产安全'))
                          ],
                        ),
                      ),
                      flex: 3,
                    ),
                    new Expanded(
                      child: new Container(
                          //右侧图片
                          height: 45,
                          width: 45,
                          child: Image.asset(
                            'images/homePage/home-features-zhiyajinggao.png',
                            fit: BoxFit.scaleDown,
                          )),
                      flex: 2,
                    )
                  ],
                ),
                flex: 5,
              )
            ],
          ),
        ),
        _lineSection,
      ],
    ));

    Column buildButtonSection(IconData icon, String label) {
      //按钮块配置方法
      Color color = Theme.of(context).primaryColor;
      return new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Icon(
              icon,
              color: color,
            ),
            new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(
                label,
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            )
          ]);
    }

    Widget normalSection = new Container(
        //常用模块块
        child: new Column(
      children: <Widget>[
        new Container(
          //小标题模块
          padding:
              const EdgeInsets.only(left: 5, top: 10, right: 0, bottom: 10),
          decoration: new BoxDecoration(),
          child: new DefaultTextStyle(
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w100,
                fontSize: 17,
              ),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Text('常用模块'),
                    flex: 2,
                  ),
                  new Expanded(
                    child: new Text(' '),
                    flex: 1,
                  )
                ],
              )),
        ),
        new Container(
            //下面的图文并茂
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: new BoxDecoration(
                border: new Border.all(width: 0.5, color: Colors.grey[400])),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  //企业巡检
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                      height: 100,
//                      width: 100,
                        child: new Image.asset(
                          'images/homePage/home-features-qiyexunjian.png',
                          fit: BoxFit.none,
                        ),
                      ),
                      new DefaultTextStyle(
                          style: new TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                          child: new Text('企业巡检'))
                    ],
                  ),
                  flex: 4,
                ),
                new Container(
                  height: 60,
                  child: new DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey[400],
                      width: 0.5,
                    )),
                  ),
                ),
                new Expanded(
                  //资产巡检
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                      height: 100,
//                      width: 100,
                        child: new Image.asset(
                          'images/homePage/home-features-zichanxunjian.png',
                          fit: BoxFit.none,
                        ),
                      ),
                      new DefaultTextStyle(
                          style: new TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                          child: new Text('资产巡检'))
                    ],
                  ),
                  flex: 4,
                ),
                new Container(
                  height: 60,
                  child: new DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey[400],
                      width: 0.5,
                    )),
                  ),
                ),
                new Expanded(
                  //资产行情
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                      height: 100,
//                      width: 100,
                        child: new Image.asset(
                          'images/homePage/home-features-zichanhangqing.png',
                          fit: BoxFit.none,
                        ),
                      ),
                      new DefaultTextStyle(
                          style: new TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                          child: new Text('资产行情'))
                    ],
                  ),
                  flex: 4,
                )
              ],
            )),
      ],
    ));

    Widget warningState = new Container(
        //告警动态块
        child: new Column(
      children: <Widget>[
        _lineSection,
        new Container(
          //小标题模块
          padding: const EdgeInsets.only(left: 5, top: 5, right: 0, bottom: 0),
          decoration: new BoxDecoration(),
          child: new DefaultTextStyle(
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w100,
                fontSize: 17,
              ),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Text('告警动态'),
                    flex: 8,
                  ),
                  new Expanded(
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new DefaultTextStyle(
                            style: new TextStyle(
                                fontSize: 12, color: Colors.grey[700]),
                            child: new Text('立即处理')),
                        new IconButton(
                          icon: new Icon(Icons.keyboard_arrow_right),
                          onPressed: null,
                          color: Colors.grey[700],
                          tooltip: '立即处理',
                        ),
                      ],
                    ),
                    flex: 3,
                  )
                ],
              )),
        ),
        new Container(
          //以下就是列表
//              margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: new BoxDecoration(
              border: new Border.all(width: 0.5, color: Colors.grey[400])),
          child: new Column(
            children: <Widget>[
              new Container(
                //列表1
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new DefaultTextStyle(
                          style: new TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                              fontSize: 18),
                          child: new Text('珠海大炼国际物流库')),
                      alignment: Alignment.centerLeft,
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          child: new DefaultTextStyle(
                              style: new TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              child: new Text('当前有183条待处理告警')),
//                                flex: 7,
                        ),
                        _lineVertical,
                        new Container(
                          child: new DefaultTextStyle(
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            child: new Text('已处理9条告警'),
                          ),
//                                flex: 5,
                        )
                      ],
                    )
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              ),
              _lineCross,
              new Container(
                //列表2
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new DefaultTextStyle(
                          style: new TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                              fontSize: 18),
                          child: new Text('上海冶炼国际物流库')),
                      alignment: Alignment.centerLeft,
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          child: new DefaultTextStyle(
                              style: new TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              child: new Text('当前有144条待处理告警')),
//                                flex: 7,
                        ),
                        _lineVertical,
                        new Container(
                          child: new DefaultTextStyle(
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            child: new Text('已处理25条告警'),
                          ),
//                                flex: 5,
                        )
                      ],
                    )
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              ),
              _lineCross,
            ],
          ),
        )
      ],
    ));

    Widget listView = new Container(
      //listView的使用
      width: double.infinity,
      height: 200.0,
      child: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new DefaultTextStyle(
                style: new TextStyle(color: Colors.red),
                child: new Text('${items[index]}')),
          );
        },
//                scrollDirection: Axis.horizontal,//横向排列
//                children: _list,
      ),
    );

    Widget gradeView = new Container(//栅格视图
        height: 250,
        width: double.infinity,
        child: new GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,//每行有几个子集
            mainAxisSpacing: 2.0,//每行之间的距离:上下
            crossAxisSpacing: 2.0,//每列之间的距离：左右
            childAspectRatio: 1.0,//每个子集多大：高，宽
          ),
          children: <Widget>[
            new Image.network('http://img5.mtime.cn/mt/2019/10/18/161351.41649493_100X140X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2019/10/30/104105.16992052_100X140X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2019/09/18/095839.16473700_100X140X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2019/10/02/105322.55848363_100X140X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2019/10/28/101232.59049099_100X140X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2019/09/26/092513.45212756_100X140X4.jpg',fit: BoxFit.cover),
          ],
        )
//      new GridView.count(
//        gridDelegate:
//        padding:const EdgeInsets.all(20.0),
//        crossAxisSpacing: 10.0,
//        children: <Widget>[
//          const Text("this is a flutter's test1"),
//          const Text('how about you?2'),
//          const Text('and you?3'),
//          const Text('yeah,this is Mike4'),
//          const Text('wow,welcome to flutter,Mike5'),
//          const Text('thanks6'),
//        ],
//      ),
        );

    return new MaterialApp(
      title: '一个四块demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new RaisedButton(
            color: Colors.orange,
            child: Text('商品列表'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => new ChildScreen(),//context是形参
                )
                );
              }
          ),
        ), //App的标题头，可有可无
        body: new ListView(
          children: <Widget>[
            swiperPageSection,
            warningSection,
            normalSection,
            warningState,
            listView,
            gradeView,
            new Center(
              child: stack,
            ),
            new Center(
              child: card,
            ),
            new Center(
                child: RouteButton(),
            ),
          ],
        ),
      ),
    );
  }

  void _tapSuddenly() {
    print('这个logo按钮被点击一次。');
  }

  void _tapBack() {
    print('这个返回按钮被点击一次');
  }

  void _tapList() {
    print('这个vert···按钮被点击一次');
  }
}

List<Widget> _list = <Widget>[
  new Container(
    width: 180.0,
    color: Colors.blue,
    alignment: Alignment.center,
    child: new DefaultTextStyle(
        style: new TextStyle(color: Colors.white), child: new Text('横向滑动1')),
  ),
  new Container(
    width: 180.0,
    color: Colors.red,
    alignment: Alignment.center,
    child: new DefaultTextStyle(
        style: new TextStyle(color: Colors.white), child: new Text('横向滑动2')),
  ),
  new Container(
    width: 180.0,
    color: Colors.black54,
    alignment: Alignment.center,
    child: new DefaultTextStyle(
        style: new TextStyle(color: Colors.white), child: new Text('横向滑动3')),
  ),
  new Container(
    width: 180.0,
    color: Colors.green,
    alignment: Alignment.center,
    child: new DefaultTextStyle(
        style: new TextStyle(color: Colors.white), child: new Text('横向滑动4')),
  ),
  new Container(
    width: 180.0,
    color: Colors.purple,
    alignment: Alignment.center,
    child: new DefaultTextStyle(
        style: new TextStyle(color: Colors.white), child: new Text('横向滑动5')),
  ),
//  new ListTile(
//    title: new Icon(Icons.perm_camera_mic),
//    subtitle: new Text(
//      '摄影',
//      style:new TextStyle(
//        color: Colors.grey
////          fontSize: 20.0
//      ),
//    ),
//    leading: new Icon(
//        Icons.mic,
//        color:Colors.blue[500]
//    ),
//  ),
//  new ListTile(
//    title: new Icon(Icons.perm_contact_calendar),
//    subtitle: new Text(
//      '日历',
//      style: new TextStyle(
//        color: Colors.grey
////          fontSize: 30.0
//      ),
//    ),
//    leading: new Icon(
//        Icons.calendar_view_day,
//        color:Colors.red[500]
//    ),
//  )
];
