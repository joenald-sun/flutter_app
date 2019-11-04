import 'package:flutter/material.dart';
import 'package:flutter_app/product.dart';

class ProductList extends StatelessWidget{

  final List<Product> products;

  ProductList({Key key,@required this.products}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(title: Text('商品列表嘞'),),
      body: ListView.builder(
        itemCount: products.length,
          itemBuilder:(context,index){
          return ListTile(
            title: Text(products[index].title),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder:(context) => ProductDetail(product:products[index])
                ),
                );
            },
          );
          }
      ),
    );
  }
}
class ProductDetail extends StatelessWidget{

  final Product product;
  ProductDetail({Key key,@required this.product}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
      body: Center(
        child: Text('${product.description}'),
      ),
    );
  }
}