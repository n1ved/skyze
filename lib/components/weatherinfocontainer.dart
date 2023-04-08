import 'package:flutter/material.dart';
import 'package:skyze/styles.dart';
import '../color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget weatherInfoContainer({required Widget child}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
    padding: defaultPadding,
    decoration: weatherBoxDecoration(),
    child: child,
  );
}

Widget mainWeatherData() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "London,GB",
            style: TextStyle(
              color: textColor,
              fontSize: 32.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "13°C",
                style: TextStyle(
                  color: textColor,
                  fontSize: 57.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "4°C",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: textColor,
                    ),
                  ),
                  Text(
                    "6°C",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: textColor,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.cloud,
            color: textColor,
            size: 96,
          ),
          Text(
            'Scatterd Clouds',
            style: TextStyle(
              fontSize: 14.0,
              color: textColor,
            ),
          ),
          Text(
            'Light Breeze',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: textColor,
            ),
          )
        ],
      )
    ],
  );
}

Widget navbarData() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
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
  );
}

Widget windData() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Wind',
        style: TextStyle(
          fontSize: 11.0,
          color: textColor,
        ),
      ),
      Icon(
        Icons.assistant_navigation,
        size: 96,
        color: textColor,
      ),
      Text(
        '3.1m/s NW',
        style: TextStyle(
          color: textColor,
          fontSize: 14.0,
        ),
      )
    ],
  );
}

Widget pressureData() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pressure',
          style: TextStyle(
            fontSize: 11.0,
            color: textColor,
          ),
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              '1020',
              style: TextStyle(
                fontSize: 44.0,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Text(
              'hPa',
              style: TextStyle(
                fontSize: 18.0,
                color: textColor,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget pollutionData() {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Air Quality',
              style: TextStyle(
                fontSize: 11.0,
                color: textColor,
              ),
            ),
            Text(
              'Good',
              style: TextStyle(
                fontSize: 57,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('CO   : 201.94 μg/m3', style: pollutionTextStyle),
            Text('NO   : 0.02 μg/m3', style: pollutionTextStyle),
            Text('NO2 : 0.77 μg/m3', style: pollutionTextStyle),
            Text('O3    : 68.66 μg/m3', style: pollutionTextStyle),
          ],
        ),
      )
    ],
  );
}
