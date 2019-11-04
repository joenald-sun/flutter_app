import 'package:flutter/material.dart';

class RouteButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: (){_navigateToXiaoJieJie(context);},
      child: Text('子页传数据到父页'),
    );
  }
  _navigateToXiaoJieJie(BuildContext context) async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => XiaoJieJie()
      )
    );
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}
class XiaoJieJie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('这里是汤姆克兰西'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('F-22'),
              onPressed: (){
                Navigator.pop(context,'全球最牛的隐形战机');
              },
            ),
            RaisedButton(
              child: Text('J-20'),
              onPressed: (){
                Navigator.pop(context,'中国最牛的隐形战机');
              },
            ),
            RaisedButton(
              child: Text('Apache'),
              onPressed: (){
                Navigator.pop(context,'全球最牛的武装直升机');
              },
            ),
            RaisedButton(
              child: Text('WZ-10'),
              onPressed: (){
                Navigator.pop(context,'中国最牛的武装直升机');
              },
            ),
          ],
        ),
      ),
    );
  }
}