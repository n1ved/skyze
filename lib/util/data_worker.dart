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

  dynamic getAllDataByName({required String cityName}) async {
    WeatherWorker weatherWorker = WeatherWorker(lat: 0, lon: 0);
    var weatherdata =
        await weatherWorker.getWeatherDataByName(cityName: cityName);

    if (weatherdata == 'error') {
      return "error";
    }

    double lat = weatherdata['coord']['lat'];
    double lon = weatherdata['coord']['lon'];

    PollutionWorker pollutionWorker = PollutionWorker(lat: lat, lon: lon);

    var pollutionData = await pollutionWorker.getPollutionData();

    var dataMap = {};
    dataMap.addAll(weatherdata);
    dataMap.addAll(pollutionData);

    return dataMap;
  }
}
