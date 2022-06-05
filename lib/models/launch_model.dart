class Launch {
  final String flightNumber;
  final String launchDateUtc;
  final String rocketName;
  final String rocketType;
  final String detail;

  Launch({this.flightNumber, this.launchDateUtc, this.rocketName, this.rocketType, this.detail});

  factory Launch.fromJson(dynamic json) {
    return Launch(
        flightNumber: json['flight_number'] as String,
        launchDateUtc: json['launch_date_utc'] as String,
        rocketName: json['rocket'] as String,
        rocketType: json['rocket'] as String,
        detail: json['detail'] as String);
  }

  static List<Launch> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Launch.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Launch {flight_number: $flightNumber, launch_date_utc: $launchDateUtc, rocketName: $rocketName, rocketType: $rocketType, detail: $detail}';
  }
}