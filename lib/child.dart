import 'package:flutter/material.dart';
import 'package:flutter_app/product.dart';
import 'package:flutter_app/productDetails.dart';

class ChildScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('!这个是子页面了!用来数据传递'),),
      body:
        ProductList(
          products: List.generate(20,(i) => Product('展示 $i 号商品','这是个商品，编号为：$i')),
        )
//      Center(
//        child: RaisedButton(
//          child: Text('!返回上一级!'),
//          onPressed: (){
//            Navigator.pop(context);
//          },
//        ),
//      ),
    );
  }
}