import 'dart:convert';
import 'package:skyze/credentials.dart';
import 'package:http/http.dart' as http;

class PollutionWorker {
  PollutionWorker({required this.lat, required this.lon});
  final String appId = appID;
  final double lat;
  final double lon;

  Future getPollutionData() async {
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/air_pollution',
        {'lat': '$lat', 'lon': '$lon', 'appid': appId});
    http.Response response = await http.get(uri);
    String data = response.body;
    if (response.statusCode == 200) {
      return jsonDecode(data);
    }
  }
}
