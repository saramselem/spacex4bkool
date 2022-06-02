class Rocket {
  final String rocketName;

  Rocket.fromJson(Map<String, dynamic> parsedJson)
      : rocketName = parsedJson['rocket_name'];
}