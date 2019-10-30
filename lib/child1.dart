//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  //测试部件
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      theme: new ThemeData(
//        primaryColor: Colors.red,//主题的风格
//      ),
//      color: Colors.pink,
////      home: new RandomWords(),//部件测试
//      home:new TestTools(),//组件测试
//    );
//  }
  MyApp({this.title});
  final Widget title;
  //测试组件
  @override
  Widget build(BuildContext context){
    return new Container(
      height: 58.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: null,//禁用button
            tooltip:'导航员按钮',
          ),
          new Expanded(child: title,),//扩充
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: null,
            color: Colors.blueGrey[800],
            tooltip: '搜索',
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyApp(
            title:new Text(
              '例子标题',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child:new Center(
              child: new Text('你好，在这里'),
            ),
          ),
        ],
      ),
    );
  }
}

//void main(){
//  runApp(new MaterialApp(
//    title: '我的 App',
//    home:new MyScaffold(),
//  ));
//}

/*有状态的部件 1*/
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

/*测试组建的部件 2*/
//class TestTools extends StatefulWidget{
//  @override
//  createState() => new TestsTools();
//}
///*组件：定义元素的长宽*/
//class TestsTools extends State<RandomWords> {
//
//
//}

/*部件:无限滚动的ListView,有状态的widget‘❤型tap点击关注’增加交互,导航到新页面（router路由跳转）*/
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(
    fontSize: 15.0,
    color: Colors.pink,
  );
  final _saved = new Set<WordPair>();

// 创建的主页的集合排列
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(10.0),//内边距
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
  /*给行添加图♥，去掉图♥*/
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,//图形形状
          color: alreadySaved ? Colors.green : null,//图形颜色
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
  }
  /*把之前的widget重写了*/
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('开始了一个新的Tab功能展示'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
  /*新增上去的几个字段*/
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map(
            (pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided =
      ListTile.divideTiles(tiles: tiles, context: context).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('保留的一些建议'),
        ),
        body: new ListView(children:divided,),
      );
    }));
  }
}
/*部件：交互*/
//class RandomWordsState extends State<RandomWords>{
//  final _suggestions = <WordPair>[];
//  final _saved = new Set<WordPair>();
//  final _biggerFont = const TextStyle(fontSize: 18.0);
//
//  Widget _buildRow(WordPair pair){
//    final alreadySaved = _saved.contains(pair);
//    return new ListTile(
//      title: new Text(
//        pair.asPascalCase,
//        style: _biggerFont,
//      ),
//      trailing: new Icon(
//        alreadySaved ? Icons.favorite : Icons.favorite_border,
//        color: alreadySaved ? Colors.red : null,
//      ),
//      onTap:(){
//        setState(() {
//          if(alreadySaved){
//            _saved.remove(pair);
//          }else{
//            _saved.add(pair);
//          }
//        });
//      }
//    );
//  }
//}
//void main() {
//  runApp(new MaterialApp(
//    title: '我的 App',
//    home: new MyButton(),
//  ));
//}
//
//class MyButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      theme: new ThemeData(
//        primaryColor: Colors.red, //主题的风格
//      ),
//      color: Colors.pink,
//      home: new GestureDetector(
//        onTap: () {
//          print('这个按钮被点击了');
//        },
//        child: new Container(
//          height: 36.0,
//          padding: const EdgeInsets.all(10.0),
//          margin: const EdgeInsets.all(20.0),
//          decoration: new BoxDecoration(
//            borderRadius: new BorderRadius.circular(25.0),
//            color: Colors.lightBlue[500],
//          ),
//          child: new Center(
//            child: new Text('参与进去'),
//          ),
//        ),
//      ), //组件测试
//    );
//  }
//}
//
//class TutorialHome extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        leading: new IconButton(
//            icon: new Icon(Icons.menu), tooltip: '领航员菜单', onPressed: null),
//        title: new Text('举个栗子'),
//        actions: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.search), tooltip: '搜索', onPressed: null),
//        ],
//      ),
//      body: new Center(
//        child: new Text('这里是大部分'),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: null,
//        tooltip: '添加',
//        child: new Icon(Icons.add),
//      ),
//    );
//  }
//}
//
//class MyAppBar extends StatelessWidget {
//  MyAppBar({this.title});
//
//  final Widget title;
//
//  //测试组件
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      height: 58.0,
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
//      decoration: new BoxDecoration(color: Colors.blue[500]),
//      child: new Row(
//        children: <Widget>[
//          new IconButton(
//            icon: new Icon(Icons.menu),
//            onPressed: null, //禁用button
//            tooltip: '导航员按钮',
//          ),
//          new Expanded(
//            child: title,
//          ), //扩充
//          new IconButton(
//            icon: new Icon(Icons.search),
//            onPressed: null,
//            color: Colors.blueGrey[800],
//            tooltip: '搜索',
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class MyScaffold extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Material(
//      child: new Column(
//        children: <Widget>[
//          new MyAppBar(
//            title: new Text(
//              '例子标题',
//              style: Theme.of(context).primaryTextTheme.title,
//            ),
//          ),
//          new Expanded(
//            child: new Center(
//              child: new Text('你好，在这里'),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
