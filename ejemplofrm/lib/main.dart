import 'package:ejemplofrm/pages/my_home_page.dart';
import 'package:ejemplofrm/pages/second_page.dart';
import 'package:ejemplofrm/pages/third_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(title: "jadg",
    initialRoute: "/",
      routes: {
      "/": (context) => MyHomePage(),
        "/second": (context) => SecondPage(),
        "/third": (context) => ThirdPage(),
    },
    );
  }
}