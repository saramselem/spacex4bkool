// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spacex4bkool/views/details.dart';
import 'package:spacex4bkool/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX4BKool',
      debugShowCheckedModeBanner: false,
      initialRoute: 'HomePage',
      routes: {
        'HomePage': (BuildContext context) => HomePage(),
        'details': (BuildContext context) => Details(),
      },
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
