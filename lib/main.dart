// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX 4 Bkool',
       theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX 4 Bkool'),
        centerTitle: true,
        ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('Próximo lanzamiento'),
                Text('00:00:00'),
                Text('Tipo de Cohete'),
                ]
              ),
            ),
            Flexible(
              flex:2,
              child: Image.asset('assets/images/rocket-dynamic-color.png'),
            )
          ],),
        ),
    );
  }
}
