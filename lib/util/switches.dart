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
        return 'assets/rain.jpg';
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

  String getAttribute() {
    switch (code) {
      case 2:
        return 'Image by Gordon Johnson from Pixabay';
      case 3:
        return 'Image by Amy Art-Dreams from Pixabay';
      case 5:
        return 'Image by Amy Art-Dreams from Pixabay';
      case 6:
        return 'Image by Ieva from Pixabay';
      case 7:
        return 'Image by asrulaqroni on Freepik';
      case 8:
        return 'Image by coolvector on Freepik';
      default:
        return 'Image by asrulaqroni on Freepik';
    }
  }

  Color getBackgroundColor() {
    switch (code) {
      case 2:
        return const Color.fromARGB(255, 21, 103, 157);
      case 3:
        return const Color.fromARGB(255, 12, 42, 78);
      case 5:
        return const Color.fromARGB(255, 12, 42, 78);
      case 6:
        return const Color.fromARGB(255, 45, 85, 113);
      case 7:
        return const Color.fromARGB(255, 33, 62, 93);
      case 8:
        return const Color.fromARGB(255, 5, 104, 150);
      default:
        return const Color.fromARGB(255, 33, 62, 93);
    }
  }

  Color getTextColor() {
    switch (code) {
      case 2:
        return const Color.fromARGB(255, 7, 242, 250);
      case 3:
        return const Color.fromARGB(255, 200, 245, 194);
      case 5:
        return const Color.fromARGB(255, 200, 245, 194);
      case 6:
        return const Color.fromARGB(255, 173, 201, 211);
      case 7:
        return const Color.fromARGB(255, 166, 189, 205);
      case 8:
        return const Color.fromARGB(255, 182, 229, 223);
      default:
        return const Color.fromARGB(255, 166, 189, 205);
    }
  }
}
