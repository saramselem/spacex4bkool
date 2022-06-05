class Launch {
  final String flight_number;
  final String launch_date_utc;
  final String rocketName;
  final String rocketType;
  final String detail;

  Launch({this.flight_number, this.launch_date_utc, this.rocketName, this.rocketType, this.detail});

  factory Launch.fromJson(dynamic json) {
    return Launch(
        flight_number: json['flight_number'] as String,
        launch_date_utc: json['launch_date_utc'] as String,
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
    return 'Launch {flight_number: $flight_number, launch_date_utc: $launch_date_utc, rocketName: $rocketName, rocketType: $rocketType, detail: $detail}';
  }
}