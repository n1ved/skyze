import 'dart:convert';
import 'package:skyze/credentials.dart';
import 'package:http/http.dart' as http;

class WeatherWorker {
  WeatherWorker({required this.lat, required this.lon});
  final String appId = appID;
  final double lat;
  final double lon;

  Future getWeatherData() async {
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'lat': '$lat', 'lon': '$lon', 'appid': appId, 'units': 'metric'});
    http.Response response = await http.get(uri);
    String data = response.body;
    // print(data);
    if (response.statusCode == 200) {
      return jsonDecode(data);
    }
  }
}
