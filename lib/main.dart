//import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter_app/Source.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:english_words/english_words.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/child1.dart';

void main() => runApp(new MyApp());


//现在做标题行
class MyApp extends StatelessWidget {

//  @override
//  _TestPageState createState() =>_TestPageState();
//  List formList;
//  initState(){
////    super.initState();
//    getHttp().then(val){
//      setState((){
//        formList = val['result'].toList();
//      })
//    }
//  }
//
//  Future getHttp() async{
//    try{
//      Response response;
//      Dio dio = new Dio();
//      response = await dio.get('httP://localhost:3030/andya/cacheList');
//      print(response);
//      return response.data;
//    }catch(e){
//      return print(e);
//    }
//}
//
//Widget buildGrid(){
//    List<Widget> tiles=[];//建立一个数组用来存放循环生成的widget
//    for(var item in formList){
//      tiles.add(
//        new Column(
//          children: <Widget>[
//            new Text(item['name'])
//          ],
//        )
//      );
//    }
//    return Column(
//      children: tiles,
//    );
//}

//  @override
//  SingleChildScrollView(//数据的渲染方式
//      child:Column(
//      children: <Widget>[
//        build()
//  ],
//      )
//      )

  MyApp({this.title});

  final Widget title;

  List<Widget> imageList = List();

  @override
  Widget build(BuildContext context) {


    @override
    void initSwiper() {
      //给轮播提供图片
      imageList..add(Image.asset("images/homePage/banner1.jpg", fit: BoxFit.fill));
      imageList..add(Image.asset("images/homePage/banner2.jpg", fit: BoxFit.fill));
      imageList..add(Image.asset("images/homePage/banner3.jpg", fit: BoxFit.fill));
      imageList..add(Image.asset("images/homePage/banner4.jpg", fit: BoxFit.fill));
      imageList..add(Image.asset("images/homePage/banner5.png", fit: BoxFit.fill));
    }

    Widget _lineSection = new Container(//带高度的黑色块
      width:double.infinity,
      height: 10,
      color: Colors.grey[200],
      child:  new Text(' '),
    );

    Widget _swiperBuilder(context, int index) {
      initSwiper();
      return (imageList[index]);
    }

    Widget swiperPageSection = new Container(
      //轮播图块
      margin: const EdgeInsets.only(top: 0,bottom: 0),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Swiper(
        itemCount: 5,//图片个数
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
        autoplay: true,//自动播放
        layout:SwiperLayout.DEFAULT,//设置样式
        autoplayDelay: kDefaultAutoplayDelayMs,
        autoplayDisableOnInteraction: true,//用户拖拽时是否停止autoplay
        duration: kDefaultAutoplayTransactionDuration,//动画时间，默认300ms
        onTap: (index) => print("这是点了$index个图"),
      ),
    );

    Widget warningSection = new Container(
        //预警监测块
//        padding: const EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget> [
            _lineSection,
            new Container(//小标题模块
              padding: const EdgeInsets.only(
                  left: 5, top: 10, right: 0, bottom: 10),
              decoration:new BoxDecoration(
              ) ,
              child: new DefaultTextStyle(
                  style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                    fontSize:17,
                  ),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(child: new Text('预警监测'),flex: 2,),
                      new Expanded(child: new Text(' '),flex: 1,)
                    ],
                  )
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: new BoxDecoration(
                border: new Border.all(width: 0.5,color: Colors.grey[400])
              ),
              child: new Row(
                children: <Widget>[
                  new Expanded(//左侧企业预警
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(//左侧文字
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: new Column(
                              children:<Widget>[
                                new DefaultTextStyle(
                                  style: new TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w100,
                                    fontSize:17,
                                  ),
                                    child: new Text('企业预警')
                                ),
                                new DefaultTextStyle(
                                    style: new TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w100,
                                      fontSize:15,
                                    ),
                                    child: new Text('警示企业风险')
                                )
                              ],
                            ),
                        ),flex: 3,),
                        new Expanded(
                          child: new Container(//右侧图片
                            height: 45,
                            width: 45,
                            child: Image.asset('images/homePage/home-features-qiyeyujing.png',fit:BoxFit.scaleDown,)
                        ),flex: 2,)
                      ],
                    ),
                    flex: 5,
                  ),
                  new Container(
                    height: 55,
                    child:new DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400],width: 0.5,)
                      ),
                    ),
                  ),

                  new Expanded(//右侧资产预警
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(//左侧文字
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: new Column(
                              children:<Widget>[
                                new DefaultTextStyle(
                                    style: new TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w100,
                                      fontSize:17,
                                    ),
                                    child: new Text('资产预警')
                                ),
                                new DefaultTextStyle(
                                    style: new TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w100,
                                      fontSize:15,
                                    ),
                                    child: new Text('监控资产安全')
                                )
                              ],
                            ),
                          ),flex: 3,),
                        new Expanded(
                          child: new Container(//右侧图片
                              height: 45,
                              width: 45,
                              child: Image.asset('images/homePage/home-features-zhiyajinggao.png',fit:BoxFit.scaleDown,)
                          ),flex: 2,)
                      ],
                    ),
                    flex: 5,
                  )
                ],
              ),
            ),
            _lineSection,
//            new Container(
//              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//              decoration: new BoxDecoration(
//                border: new Border.all(width: 0.5,color: Colors.grey[400])
//              ),
//              child: new Row(
//                children: <Widget>[
//                  new Row(//左侧企业预警
//                    children: <Widget>[
//                      new Expanded(
//                        child: new Container(
//                          child: new Text('字'),
//                        ),
//                        flex: 3,
//                      ),
//                      new Expanded(
//                        child: new Text('图'),
//                        flex: 2,
//                      )
//                    ],
//                  ),
//                  //右侧资产预警
//                ],
//              ),
//            ),
//            new Expanded(
//              flex: 2,
//              child: new Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    new Container(
////                      height:50,//高度w
////                      width: 50,//宽度
//                      alignment: Alignment(0, 0),
//                      //居中排列
////                      color:Colors.white,//这个是背景色,跟下面的decoration的color冲突
//                      padding: const EdgeInsets.only(
//                          left: 0, top: 10, right: 0, bottom: 10),
//                      margin: const EdgeInsets.all(0),
//                      //外边距
//                      decoration: new BoxDecoration(
//                        //边框
//                        color: Colors.grey[400],
//                        //背景颜色
//                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                        //设置：四周，角度--如果数据是父级Container高度的一半的话，就是半圆，如果父级Container宽高一样，就是“圆”
//                        border:
//                            new Border.all(width: 1, color: Colors.red), //边框颜色
//                      ),
//                      child: new DefaultTextStyle(
//                          style: new TextStyle(
//                            fontWeight: FontWeight.bold,
//                            fontSize: 15, //字体大小
//                            color: Colors.blue, //字体颜色
//                            decoration: TextDecoration.overline, //字横线下滑，中间，上滑
//                          ),
//                          maxLines: 2,
//                          //设置超出2行的内容自动隐藏
//                          softWrap: true,
//                          overflow: TextOverflow.ellipsis,
//                          child: new Text(
//                            '预警监测',
//                          )),
//                    ),
////                    new Text(
////                      '下面的小字，第二排',
////                      style: new TextStyle(
////                        color: Colors.grey[500],
////                      ),
////                    ),
//                  ]),
//            ),
//            new Expanded(
//                flex: 1,
//                child: new Icon(
//                  Icons.star,
//                  color: Colors.red[500],
//                )),
//            new Expanded(flex: 1, child: new Text('520'))
          ],
        ));

    Widget textSection = new Container(
      //文本块
      color: Colors.lightBlue[100],
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run',
        softWrap: true,
      ),
    );

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
      child:new Column(
        children: <Widget>[
          new Container(//小标题模块
            padding: const EdgeInsets.only(
                left: 5, top: 10, right: 0, bottom: 10),
            decoration:new BoxDecoration(
            ) ,
            child: new DefaultTextStyle(
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                  fontSize:17,
                ),
                child: new Row(
                  children: <Widget>[
                    new Expanded(child: new Text('常用模块'),flex: 2,),
                    new Expanded(child: new Text(' '),flex: 1,)
                  ],
                )
            ),
          ),
          new Container(//下面的图文并茂
              padding: const EdgeInsets.fromLTRB(10,10,10,10),
              decoration:new BoxDecoration(
                  border: new Border.all(width: 0.5,color: Colors.grey[400])
              ) ,
              child:new Row(
                children: <Widget>[
                  new Expanded(//企业巡检
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                      height: 100,
//                      width: 100,
                            child:new Image.asset('images/homePage/home-features-qiyexunjian.png',fit: BoxFit.none,),
                          ),
                          new DefaultTextStyle(
                              style: new TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                              child: new Text('企业巡检')
                          )
                        ],
                      ),
                    flex: 4,
                  ),
                  new Container(
                    height: 60,
                    child:new DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400],width: 0.5,)
                      ),
                    ),
                  ),
                  new Expanded(//资产巡检
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                      height: 100,
//                      width: 100,
                            child:new Image.asset('images/homePage/home-features-zichanxunjian.png',fit: BoxFit.none,),
                          ),
                          new DefaultTextStyle(
                              style: new TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                              child: new Text('资产巡检')
                          )
                        ],
                      ),
                    flex: 4,
                  ),
                  new Container(
                    height: 60,
                    child:new DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400],width: 0.5,)
                      ),
                    ),
                  ),
                  new Expanded(//资产行情
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                      height: 100,
//                      width: 100,
                            child:new Image.asset('images/homePage/home-features-zichanhangqing.png',fit: BoxFit.none,),
                          ),
                          new DefaultTextStyle(
                              style: new TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                              child: new Text('资产行情')
                          )
                        ],
                      ),
                    flex: 4,
                  )
                ],
              )
          ),

        ],
      )
    );

    Widget warningState = new Container(//告警动态块
        child:new Column(
          children: <Widget>[
            _lineSection,
            new Container(//小标题模块
              padding: const EdgeInsets.only(
                  left: 5, top: 5, right: 0, bottom: 0),
              decoration:new BoxDecoration(
              ) ,
              child: new DefaultTextStyle(
                  style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                    fontSize:17,
                  ),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(child: new Text('告警动态'),flex: 8,),
                      new Expanded(
                        child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new DefaultTextStyle(
                                      style: new TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[700]
                                      ),
                                      child: new Text('立即处理')
                                  ),
                               new IconButton(
                                    icon: new Icon(Icons.keyboard_arrow_right),
                                    onPressed: null,
                                    color: Colors.grey[700],
                                    tooltip: '立即处理',
                                  ),
                            ],
                        ),
                        flex: 3,)
                    ],
                  )
              ),
            ),
            new Container(//以下就是列表
//              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration:new BoxDecoration(
                  border: new Border.all(width: 0.5,color: Colors.grey[400])
              ) ,
            )
          ],
        )
    );

    return new MaterialApp(
      title: '一个四块demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new ListView(
          children: <Widget>[
            swiperPageSection,
            warningSection,
            normalSection,
            warningState,

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

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}

//Column buildButtonColume(IconData icon,String label){//按钮块配置方法
//  Color color=Theme.of(context).primaryColor;
//  return new Column(
//      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.center,
//      children:[
//        new Icon(icon,color: color,),
//        new Container(
//          margin: const EdgeInsets.only(top: 8.0),
//          child: new Text(
//            label,
//            style: new TextStyle(
//              fontSize: 12.0,
//              fontWeight: FontWeight.w400,
//              color: color,
//            ),
//          ),
//        )
//      ]
//  );
//}

//class SwiperPage extends StatelessWidget{
//  @override
//  SwiperPageState createState(){
//    return SwiperPageState();
//  }
//}
//
//class SwiperPageState extends State<SwiperPage>{
//  @override
//  Widget build
//}

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '有好的交谈',
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('朋友交谈屏幕'),
      ),
    );
  }
}
