import 'dart:ui';
import 'package:flutter/material.dart';
import '../components/weatherinfocontainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.weatherData, super.key});

  final dynamic weatherData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? locationName, country, description;
  dynamic temperature, minTemp, maxTemp, pressure;
  dynamic windSpeed, windDeg;
  @override
  void initState() {
    super.initState();
    updateScreen(widget.weatherData);
  }

  void updateScreen(dynamic weather) {
    setState(() {
      country = weather['sys']['country'];
      locationName = weather['name'];
      description = weather['weather'][0]['description'];
      temperature = weather['main']['temp'].toStringAsFixed(0);
      minTemp = weather['main']['temp_min'].toStringAsFixed(0);
      maxTemp = weather['main']['temp_max'].toStringAsFixed(0);
      pressure = weather['main']['pressure'];
      windSpeed = weather['wind']['speed'];
      windDeg = weather['wind']['deg'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/thunderstorm.jpg'),
          fit: BoxFit.cover,
        )),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              weatherInfoContainer(child: navbarData()),
              weatherInfoContainer(
                  child: mainWeatherData(
                location: locationName,
                country: country,
                temperature: temperature,
                minTemp: minTemp,
                maxTemp: maxTemp,
                description: description,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: weatherInfoContainer(
                          child: windData(
                              windDeg: windDeg, windSpeed: windSpeed))),
                  Expanded(
                      child: weatherInfoContainer(
                          child: pressureData(pressure: pressure))),
                ],
              ),
              weatherInfoContainer(child: pollutionData()),
            ],
          ),
        ),
      ),
    );
  }
}
