import 'weather_worker.dart';
import 'polution_worker.dart';

class GetData {
  dynamic getAllData(locationData) async {
    WeatherWorker weatherWorker = WeatherWorker(
        lat: locationData.latitude ?? -1, lon: locationData.longitude ?? -1);
    PollutionWorker pollutionWorker = PollutionWorker(
        lat: locationData.latitude ?? -1, lon: locationData.longitude ?? -1);

    var weatherdata = await weatherWorker.getWeatherData();
    var pollutionData = await pollutionWorker.getPollutionData();

    var dataMap = {};
    dataMap.addAll(weatherdata);
    dataMap.addAll(pollutionData);

    return dataMap;
  }
}
