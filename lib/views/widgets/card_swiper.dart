// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:spacex4bkool/models/launch_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Launch> launches;

  CardSwiper({required this.launches});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      color: Colors.indigo,
      child: Swiper(
        layout: SwiperLayout.TINDER,
        itemWidth: 300.0,
        itemHeight: 400.0,
        itemBuilder: (BuildContext context, int index) {
          if (launches.length <= 1) {
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'details',
                      arguments: launches[index]),
                  child: Text(
                    launches[index].missionName,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }
          return Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: GestureDetector(
                     onTap: () => Navigator.pushNamed(context, 'details',
                         arguments: launches[index]),
                    child: Image(
                          image: NetworkImage(
                          "https://danielmarin.naukas.com/files/2021/06/51171019709_19e6fc54b3_k.jpg")),
                          ),
                ),
                 Text(launches[index].missionName,
                  overflow: TextOverflow.ellipsis),
                 Text(launches[index].flightNumber.toString(),
                  overflow: TextOverflow.ellipsis),
                 Text('Toca la tarjeta para más información'),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
