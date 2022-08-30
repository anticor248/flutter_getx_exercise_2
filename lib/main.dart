import 'package:flutter/material.dart';
import 'package:flutter_getx_full_app/my_detail_page.dart';
import 'package:flutter_getx_full_app/my_home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //home: MyHomePage(),
      //Same below this code

      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/detail', page: () => DetailPage()),
      ],
    );
  }
}
