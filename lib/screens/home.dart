import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skyze/styles.dart';
import 'package:skyze/util/weatherloader.dart';
import '../color.dart';
import '../components/weatherinfocontainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WeatherLoader weatherLoader = WeatherLoader() ;
    weatherLoader.getLocation() ;
    super.initState();
  }
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
              weatherInfoContainer(child: mainWeatherData()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: weatherInfoContainer(child: windData())),
                  Expanded(child: weatherInfoContainer(child: pressureData())),
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
