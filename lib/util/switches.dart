import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckCondition {
  CheckCondition({required this.condition}) {
    initCode();
  }

  int condition;
  late int code;
  void initCode() {
    code = (condition ~/ 100);
  }

  IconData getIcon() {
    switch (code) {
      case 2:
        return FontAwesomeIcons.cloudBolt;
      case 3:
        return FontAwesomeIcons.cloudRain;
      case 5:
        return FontAwesomeIcons.cloudShowersHeavy;
      case 6:
        return FontAwesomeIcons.snowflake;
      case 7:
        return FontAwesomeIcons.smog;
      case 8:
        return FontAwesomeIcons.cloudSun;
      default:
        return Icons.error;
    }
  }

  String getBackground() {
    switch (code) {
      case 2:
        return 'assets/thunderstorm.jpg';
      case 3:
        return 'assets/drizzle.jpg';
      case 5:
        return 'assets/rain.jpg';
      case 6:
        return 'assets/snow.jpg';
      case 7:
        return 'assets/clouds.jpg';
      case 8:
        return 'assets/clear.jpg';
      default:
        return 'assets/clouds.jpg';
    }
  }
}
