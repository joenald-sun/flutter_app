import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());
//现在做标题行
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    Widget titleSection = new Container(//标题块
      padding: const EdgeInsets.all(32.0),
      child:new Row(
          children:[
            new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: new Text(
                        '粗体加大字，第一排',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    )
                  ]
                )
            ),
            new  Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            new Text('520')
          ],
      )
    );
  }
}