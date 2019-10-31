import 'dart:async';
import 'package:dio/dio.dart';

var dio=new Dio();//new一个初始化连接

class NetUtils{
  static Future get(String url,{Map<String,dynamic> params}) async{
    var response = await dio.get(url);
    return response;
  }
  static Future post(String url,Map<String,dynamic> params) async{
    var response = await dio.post(url,data:params);
    return response;
  }
}