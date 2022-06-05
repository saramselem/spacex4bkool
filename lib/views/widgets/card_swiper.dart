import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:spacex4bkool/models/launch_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Fairings> launches;

  CardSwiper({required this.launches});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        scrollDirection: Axis.vertical,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          if (launches.length <= 1) {
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'details',
                      arguments: launches[index]),
                  child: FadeInImage(
                    image: NetworkImage('assets/images/rocket-dynamic-color.png'),
                    placeholder: AssetImage('assets/images/rocket-dynamic-color.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'detalle',
                    arguments: launches[index]),
                child: FadeInImage(
                  image: NetworkImage('assets/images/rocket-dynamic-color.png'),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        itemCount: launches.length,
      ),
    );
  }
}
