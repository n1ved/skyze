import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skyze/screens/home.dart';
import 'package:skyze/util/location_worker.dart';
import 'package:skyze/util/polution_worker.dart';
import 'package:skyze/util/weather_worker.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    LocationLoader locationLoader = LocationLoader();
    var locationData = await locationLoader.getLocation();

    WeatherWorker weatherWorker = WeatherWorker(
        lat: locationData.latitude ?? -1, lon: locationData.longitude ?? -1);
    PollutionWorker pollutionWorker = PollutionWorker(
        lat: locationData.latitude ?? -1, lon: locationData.longitude ?? -1);

    var weatherdata = await weatherWorker.getWeatherData();
    var pollutionData = await pollutionWorker.getPollutionData();

    var dataMap = {};
    dataMap.addAll(weatherdata);
    dataMap.addAll(pollutionData);
    moveToHome(dataMap);
  }

  void moveToHome(weatherData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(weatherData: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            FontAwesomeIcons.sun,
            color: Colors.white,
            size: 100,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Loading",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
