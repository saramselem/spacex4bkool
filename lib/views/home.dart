// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:spacex4bkool/views/widgets/card_swiper.dart';
import 'package:spacex_api/models/launch/launch.dart';
import '../models/launch_model.dart';
import '../models/launch_model_api.dart';

class HomePage extends StatefulWidget {
  
@override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fetchLaunches = LaunchModelApi();
 
  @override
  void initState() {
    super.initState();
    fetchLaunches.fetchLaunch();
  }
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.rocket),
                SizedBox(width: 12),
                Text('Próximos lanzamientos'),
              ],
            ),
          ),
          body: Container (
            child: Column(
              children: [
                _cardSwiper(),
              ],
            ),
          ),
                
    );
  }
  Widget _cardSwiper() {
    return FutureBuilder(
      future: fetchLaunches.fetchLaunch(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(launches: snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
