import 'package:skyze/credentials.dart';
import 'package:location/location.dart';

class WeatherLoader {
  String appId = appID;
  late final double lat, lon;

  void getLocation() async{
  Location location = Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if(!_serviceEnabled){
    _serviceEnabled = await location.requestService() ;
    if(!_serviceEnabled){
      return;
    }
  }

  _permissionGranted = await location.hasPermission() ;
  if(_permissionGranted == PermissionStatus.denied){
    _permissionGranted = await location.requestPermission() ;
    if(_permissionGranted != PermissionStatus.granted){
      return;
    }
  }
  location.changeSettings(
    accuracy: LocationAccuracy.low,
  );
  _locationData = await location.getLocation()  ;

  lat = _locationData.latitude ?? 0;
  lon = _locationData.longitude ?? 0;

  print("$lat $lon");
}



}
