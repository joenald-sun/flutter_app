
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_app/Source.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:english_words/english_words.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/netUtils.dart';


void main() => runApp(new MyApp());

//现在做标题行
class MyApp extends StatelessWidget {

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

    Widget _lineVertical = new Container(//数据列表里的小竖线
      width: 0.5,
      height: 15,
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      color: Colors.grey[500],
      child: new Text(' '),
    );
    Widget _lineCross = new Container(//数据列表里的小横线
      width: double.infinity,
      height: 0.5,
      color: Colors.grey[400],
      child: new Text(' '),
    );

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
              child: new Column(
                children: <Widget>[
                  new Container(//列表1
                    child:new Column(
                      children: <Widget>[
                        new Container(
                          child:new DefaultTextStyle(
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 18
                              ),
                              child: new Text('珠海大炼国际物流库')
                          ),
                          alignment:Alignment.centerLeft,
                        ),
                        new Row(
                          children: <Widget>[
                            new Container(
                              child: new DefaultTextStyle(
                                  style: new TextStyle(
                                    color:Colors.black,
                                    fontSize: 15,
                                  ),
                                  child: new Text('当前有183条待处理告警')
                              ),
//                                flex: 7,
                            ),
                            _lineVertical,
                            new Container(
                              child: new DefaultTextStyle(
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize:15,
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
                  new Container(//列表2
                    child:new Column(
                      children: <Widget>[
                        new Container(
                          child:new DefaultTextStyle(
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 18
                              ),
                              child: new Text('珠海大炼国际物流库')
                          ),
                          alignment:Alignment.centerLeft,
                        ),
                        new Row(
                          children: <Widget>[
                            new Container(
                              child: new DefaultTextStyle(
                                  style: new TextStyle(
                                    color:Colors.black,
                                    fontSize: 15,
                                  ),
                                  child: new Text('当前有183条待处理告警')
                              ),
//                                flex: 7,
                            ),
                            _lineVertical,
                            new Container(
                              child: new DefaultTextStyle(
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize:15,
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
                ],
              ),
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

