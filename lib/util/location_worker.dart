import 'package:location/location.dart';
import 'package:skyze/util/weather_worker.dart';

class LocationLoader {
  Future getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.changeSettings(
      accuracy: LocationAccuracy.low,
    );
    locationData = await location.getLocation();

    WeatherWorker weatherWorker = WeatherWorker(
        lat: locationData.latitude ?? -1, lon: locationData.longitude ?? -1);
    var data = await weatherWorker.getWeatherData();
    print(data);
    return data;
  }
}
