class Launches {
  List<Launch> items = [];

  Launches.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final launch = Launch.fromJsonMap(item);
      items.add(launch);
    }
  }
}

class Launch {
  late int flightNumber;
  late String missionName;
  late String? launchDateUtc;
  late Rocket rocket;
  late String? details;

  Launch({
    required this.flightNumber,
    required this.missionName,
    required this.launchDateUtc,
    required this.rocket,
    required this.details,
  });

  factory Launch.fromJsonMap(Map<String, dynamic> json) => Launch(
        flightNumber: json["flight_number"],
        missionName: json["mission_name"],
        launchDateUtc: json["launch_date_utc"],
        rocket: Rocket.fromJsonMap(json["rocket"]),
        details: json["details"],
      );
}

class Rocket {
  late String rocketName;
  late String rocketType;

  Rocket({
    required this.rocketName,
    required this.rocketType,
  });

  factory Rocket.fromJsonMap(Map<String, dynamic> json) => Rocket(
        rocketName: json["rocket_name"],
        rocketType: json["rocket_type"],
      );
}
