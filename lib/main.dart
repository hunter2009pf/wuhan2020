import 'package:flutter/material.dart';
import 'package:wuhan2020/pages/WelcomePage.dart';
import 'package:wuhan2020/Routes.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "武汉疫情救助",
      home: WelcomePage(),
      routes: Routes.routeMap,
    );
  }

}