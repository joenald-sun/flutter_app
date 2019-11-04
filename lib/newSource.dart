import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/Source.dart';

class TestPage extends StatefulWidget{
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>{
  List formList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp().then((val){
      setState(() {
        formList = val['result'].toList();
      });
    });
  }
  Future getHttp() async{
    try{
      Response response;
      Dio dio = new Dio();
      response =await dio.get("http://localhost:3030/andya/cacheList");
      print(response);
      return response.data;
    }catch(e){
      return print(e);
    }
  }
  Widget buildGrid(){
    List<Widget> tiles = [];
    for(var item in formList){
      tiles.add(
        new Column(
          children: <Widget>[
            Text(item['title'])
          ],
        )
      );
    }
    return Column(
      children: tiles,
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text("数据循环渲染到组件"),
      ),
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            buildGrid(),
          ],
        ),
      ),
    );
  }
}