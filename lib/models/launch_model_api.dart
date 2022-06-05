// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:spacex4bkool/models/launch_model.dart';
import 'package:http/http.dart' as http;

class LaunchModelApi {
  
    Future<Launch> fetchLaunch() async {

    final response = await http.get('https://api.spacexdata.com/v3/launches/upcoming'); {
     var json = convert.jsonDecode(response.body);

    var launch = Launch.fromJson(json[0]);

    return launch;
  }

}
    };
  
   