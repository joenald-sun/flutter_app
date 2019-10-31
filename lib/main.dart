import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

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
      imageList..add(Image.asset("images/banner1.jpg", fit: BoxFit.fill));
      imageList..add(Image.asset("images/banner2.jpg", fit: BoxFit.fill));
      imageList..add(Image.asset("images/banner3.jpg", fit: BoxFit.fill));
      imageList..add(Image.asset("images/banner4.jpg", fit: BoxFit.fill));
    }

    Widget _swiperBuilder(context, int index) {
      initSwiper();
      return (imageList[index]);
    }

    Widget swiperPageSection = new Container(
      //轮播图块
      margin: const EdgeInsets.only(top: 0),
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
//      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Swiper(
        itemCount: 4,//图片个数
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

    Widget titleSection = new Container(
        //标题块
        padding: const EdgeInsets.all(32.0),
        child: new Row(
          children: [
            new Expanded(
              flex: 2,
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Container(
//                      height:50,//高度w
//                      width: 50,//宽度
                      alignment: Alignment(0, 0),
                      //居中排列
//                      color:Colors.white,//这个是背景色,跟下面的decoration的color冲突
                      padding: const EdgeInsets.only(
                          left: 0, top: 10, right: 0, bottom: 10),
                      margin: const EdgeInsets.all(0),
                      //外边距
                      decoration: new BoxDecoration(
                        //边框
                        color: Colors.grey[400],
                        //背景颜色
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        //设置：四周，角度--如果数据是父级Container高度的一半的话，就是半圆，如果父级Container宽高一样，就是“圆”
                        border:
                            new Border.all(width: 1, color: Colors.red), //边框颜色
                      ),
                      child: new DefaultTextStyle(
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15, //字体大小
                            color: Colors.blue, //字体颜色
                            decoration: TextDecoration.overline, //字横线下滑，中间，上滑
                          ),
                          maxLines: 2,
                          //设置超出2行的内容自动隐藏
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          child: new Text(
                            '粗体加大字，第一排',
                          )),
                    ),
                    new Text(
                      '下面的小字，第二排',
                      style: new TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
            ),
            new Expanded(
                flex: 1,
                child: new Icon(
                  Icons.star,
                  color: Colors.red[500],
                )),
            new Expanded(flex: 1, child: new Text('520'))
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

    Widget buttonSection = new Container(
      //按钮块
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButtonSection(Icons.call, '打电话'),
            buildButtonSection(Icons.near_me, '距离我'),
            buildButtonSection(Icons.share, '分享'),
          ]),
    );
    return new MaterialApp(
      title: '一个四块demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          leading: new Container(
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(55))),
            child: new IconButton(
                icon: new Icon(Icons.menu), //返回按钮
                onPressed: _tapBack),
          ),
          title: new Container(
            child: new Text('首页'),
          ),
          //标题
          actions: <Widget>[
            //右边部分的代码
            new Container(
              //文字
              alignment: Alignment(0, 0), //居中排列
              child: new DefaultTextStyle(
                  style: new TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                  child: new Text('200100张')),
            ),
            new Container(
              //头像
              height: 30,
              width: 30,
              margin: const EdgeInsets.only(left: 10),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: new Image.asset(
                'images/user@2x.png',
                width: 20,
                height: 20,
              ),
            ),
            new IconButton(
              //缩略图标
              icon: new Icon(Icons.more_vert),
              onPressed: _tapList,
            ),
          ],
        ),
        body: new ListView(
          children: <Widget>[
            swiperPageSection,
            titleSection,
            buttonSection,
            textSection
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
