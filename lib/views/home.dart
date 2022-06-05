import 'package:flutter/material.dart';
import 'package:spacex4bkool/views/widgets/launch_card.dart';
import '../models/launch_model.dart';
import '../models/launch_model_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Launch> _launches;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLaunches();
  }

  Future<void> getLaunches() async {
    _launches = await LaunchModelApi.getLaunch();
    setState(() {
      _isLoading = false;
    });
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.rocket),
              SizedBox(width:12),
              Text('Próximos lanzamientos'),
            ],
          ),
        ),
        body: _isLoading
        ? Center (child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: _launches.length,
          itemBuilder: (context,index){
            return LaunchCard(
              flight_number: _launches[index].flightNumber,
              launch_date_utc: _launches[index].launchDateUtc,
              rocketName: _launches[index].rocketName,
              rocketType: _launches[index].rocketType,
              detail: _launches[index].detail,
            );
          },   
        ));
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}