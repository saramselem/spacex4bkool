// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spacex4bkool/views/widgets/card_swiper.dart';
import '../models/launch_model.dart';
import '../models/launch_model_api.dart';

class Details extends StatelessWidget {
  final fetchLaunches = LaunchModelApi();
  @override
  Widget build(BuildContext context) {
    final Launch launch = ModalRoute.of(context)!.settings.arguments as Launch;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 19, 19, 19),
        body: CustomScrollView(
          slivers: <Widget>[
            crearAppBar(launch),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 10.0,
                ),
                _descripcion(launch),
              ]),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.indigo,
          backgroundColor: Colors.indigo,
          child: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'HomePage', (Route<dynamic> route) => false);
          },
        ));
  }

  Widget crearAppBar(Launch launch) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.white,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(launch.missionName,
            style: TextStyle(color: Colors.white, fontSize: 26.0)),
        background: Image(
          image: NetworkImage(
              'https://danielmarin.naukas.com/files/2021/06/51171019709_19e6fc54b3_k.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _descripcion(Launch launch) {
    launch.details ??= "Información no disponible en este momento.";

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        launch.details!,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
