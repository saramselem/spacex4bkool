// ignore_for_file: no_leading_underscores_for_local_identifiers, dead_code, import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:spacex4bkool/models/launch_model.dart';
import 'package:http/http.dart' as http;

class LaunchModelApi {
  Future<List<Launch>> fetchLaunch() async {
    final response =
        await http.get(Uri.parse('https://api.spacexdata.com/v3/launches/'));
    final decodedData = json.decode(response.body);
    final launches = Launches.fromJsonList(decodedData);

    return launches.items;

    /*if (response.statusCode == 200) {
        
        return Launch.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load launch');
      }*/
  }
}
