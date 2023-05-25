import 'package:flutter/material.dart';
import 'package:skyze/util/switches.dart';
import '../components/weatherinfocontainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skyze/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.weatherData, super.key});

  final dynamic weatherData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? locationName, country, description, backgroundImageUrl, airQuality;
  dynamic temperature,
      minTemp,
      maxTemp,
      pressure,
      windSpeed,
      windDeg,
      co,
      no,
      no2,
      o3,
      airQIndex;
  IconData? weatherIcon;
  @override
  void initState() {
    super.initState();
    updateScreen(widget.weatherData);
  }

  void updateScreen(dynamic weather) {
    setState(() {
      CheckCondition checkCondition =
          CheckCondition(condition: weather['weather'][0]['id']);
      weatherIcon = checkCondition.getIcon();
      backgroundImageUrl = checkCondition.getBackground();
      country = weather['sys']['country'];
      locationName = weather['name'];
      description = weather['weather'][0]['description'];
      temperature = weather['main']['temp'].toStringAsFixed(0);
      minTemp = weather['main']['temp_min'].toStringAsFixed(0);
      maxTemp = weather['main']['temp_max'].toStringAsFixed(0);
      pressure = weather['main']['pressure'];
      windSpeed = weather['wind']['speed'];
      windDeg = weather['wind']['deg'];
      co = weather['list'][0]['components']['co'];
      no = weather['list'][0]['components']['no'];
      no2 = weather['list'][0]['components']['no2'];
      o3 = weather['list'][0]['components']['o3'];
      airQIndex = weather['list'][0]['main']['aqi'];
      switch (airQIndex) {
        case 1:
          airQuality = "Good";
          break;
        case 2:
          airQuality = "Fair";
          break;
        case 3:
          airQuality = "Moderate";
          break;
        case 4:
          airQuality = "Poor";
          break;
        case 5:
          airQuality = "Very Poor";
          break;
        default:
          airQuality = "Error";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(backgroundImageUrl ?? 'assets/clear.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
              padding: defaultPadding,
              decoration: weatherBoxDecoration(),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FontAwesomeIcons.arrowsRotate,
                    color: Color(0xfff9d5ff),
                  ),
                  Text(
                    "Skyze",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.city,
                    color: Color(0xfff9d5ff),
                  ),
                ],
              ),
            ),
            weatherInfoContainer(
                child: mainWeatherData(
              location: locationName,
              country: country,
              temperature: temperature,
              minTemp: minTemp,
              maxTemp: maxTemp,
              description: description,
              weatherIcon: weatherIcon ?? Icons.error,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: weatherInfoContainer(
                        child:
                            windData(windDeg: windDeg, windSpeed: windSpeed))),
                Expanded(
                    child: weatherInfoContainer(
                        child: pressureData(pressure: pressure))),
              ],
            ),
            weatherInfoContainer(
                child: pollutionData(
              co: co,
              no: no,
              no2: no2,
              o3: o3,
              airQuality: airQuality,
            )),
          ],
        ),
      ),
    );
  }
}
