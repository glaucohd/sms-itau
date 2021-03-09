import 'package:flutter/material.dart';
import 'package:sms_itau/view/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffEEE6DE),
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
