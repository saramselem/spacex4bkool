// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:spacex4bkool/models/launch_model.dart';
import 'package:http/http.dart' as http;

class LaunchModelApi {
  static Future<List<Launch>> getLaunch() async {
    var uri = Uri.https('api.spacexdata.com', '/v4/launches/upcoming');
      
    final response = await http.get(uri, headers: {
      "host": "api.spacexdata.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Launch.launchesFromSnapshot(_temp);
  }
}