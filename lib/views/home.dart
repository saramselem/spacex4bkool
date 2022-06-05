import 'package:flutter/material.dart';
import 'package:spacex4bkool/views/home.dart';
import 'package:spacex4bkool/views/widgets/launch_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Próximos lanzamientos'),
            ],
          ),
        ),
        body: LaunchCard(
          flight_number: '1',
          launch_date_utc: '2020-01-01',
          rocketName: 'Falcon 1',
          rocketType: 'Falcon 1',
          detail: 'Estoy improvisando',
         
        ));
  }
}