import 'package:spacex4bkool/models/rocket.dart';


class Launch {
  final DateTime launchUTC;
  final Rocket rocket;

  Launch({required this.launchUTC, required this.rocket});

  Launch.fromJson(Map<dynamic, dynamic> parsedJson)
      : launchUTC = DateTime.parse(parsedJson['launch_date_utc']),
        rocket = Rocket.fromJson(parsedJson['rocket']);
}