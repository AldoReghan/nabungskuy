import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nabungskuy/page/home.dart';
import 'package:flutter/services.dart';
import 'package:nabungskuy/page/kategoriPage/kategoriList.dart';
import 'package:nabungskuy/page/tabunganPage/tabunganForm.dart';
import 'package:nabungskuy/page/tabunganPage/tabunganList.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: HomePage(),
      initialRoute: '/',
      routes: {
        '/kategorilist':(context)=>KategoriList(),
        '/tabunganlist':(context)=>TabunganList(),
        '/tabunganform':(context)=>TabunganForm()
      },
    );
  }
}
