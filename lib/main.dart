// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spacex4bkool/services/launch_service.dart';

import 'models/launch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   var  launchService = LaunchService();
    return FutureProvider(
      create: (context) => launchService.fetchLaunch(),
      initialData: null,
      child: MaterialApp(
      title: 'SpaceX 4 Bkool',
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Home(),
    ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer timer;
  late Launch launch;
  late String countdown;
  
  @override
  void initState() {
    countdown = '...';

  timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (launch != null) {
      var diff = launch.launchUTC.difference(DateTime.now().toUtc());
      setState(() {
        countdown = durationToString(diff);
      });
    }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var launch = Provider.of<Launch>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX 4 Bkool'),
        centerTitle: true,
        ),
      
      body:(launch != null) ? Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('Próximo lanzamiento', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text(countdown, style: GoogleFonts.robotoMono(fontSize: 40, fontWeight: FontWeight.bold),),
                Text(launch.rocket.rocketName,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ]
              ),
            ),
            
            Flexible(
              flex:2,
              child: Padding(
                padding: const EdgeInsets.only(bottom:30.0),
                //child: Image.asset("rocket-dynamic-color.png"),
              )
            )
          ],),
        ) : Center(child: CircularProgressIndicator(),),
    );
  }
  String durationToString(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }
    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitsMinutes:$twoDigitsSeconds";
}
}