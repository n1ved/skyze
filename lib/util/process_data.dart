import 'switches.dart';
import 'package:skyze/color.dart';
import 'package:flutter/material.dart';

class ProcessData {
  String? locationName,
      country,
      description,
      backgroundImageUrl,
      airQuality,
      imageAttribute;
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
  void processData(dynamic weather) {
    CheckCondition checkCondition =
        CheckCondition(condition: weather['weather'][0]['id']);
    weatherIcon = checkCondition.getIcon();
    backgroundImageUrl = checkCondition.getBackground();
    backgroundColor = checkCondition.getBackgroundColor();
    textColor = checkCondition.getTextColor();
    imageAttribute = checkCondition.getAttribute();
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
  }
}
