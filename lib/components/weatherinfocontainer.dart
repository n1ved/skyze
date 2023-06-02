import 'package:flutter/material.dart';
import 'package:skyze/styles.dart';
import '../color.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget weatherInfoContainer({required Widget child}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
    padding: defaultPadding,
    decoration: weatherBoxDecoration(),
    child: child,
  );
}

Widget mainWeatherData(
    {location,
    country,
    temperature,
    minTemp,
    maxTemp,
    description,
    required IconData weatherIcon}) {
  String locationString = "$location , $country";
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locationString.length > 10
                ? "${locationString.substring(0, 10)}..."
                : locationString,
            style: TextStyle(
              color: textColor,
              fontSize: 32.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$temperature°C",
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
                    "$minTemp°C",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: textColor,
                    ),
                  ),
                  Text(
                    "$maxTemp°C",
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
            weatherIcon,
            color: textColor,
            size: 84,
          ),
          Text(
            '$description',
            style: TextStyle(
              fontSize: 14.0,
              color: textColor,
            ),
          ),
        ],
      )
    ],
  );
}

Widget navbarData() {
  return const Row(
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
  );
}

Widget windData({windSpeed, windDeg}) {
  double windDegRadian = windDeg.toDouble() * (math.pi / 180);
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
      Transform.rotate(
        angle: windDegRadian,
        child: Icon(
          Icons.arrow_upward,
          size: 96,
          color: textColor,
        ),
      ),
      Text(
        '$windSpeed m/s $windDeg°',
        style: TextStyle(
          color: textColor,
          fontSize: 14.0,
        ),
      )
    ],
  );
}

Widget pressureData({pressure}) {
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
              '$pressure',
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

Widget pollutionData({airQuality, co, no, no2, o3}) {
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
              '$airQuality',
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
            Text('CO   : $co μg/m3', style: pollutionTextStyle),
            Text('NO   : $no μg/m3', style: pollutionTextStyle),
            Text('NO2 : $no2 μg/m3', style: pollutionTextStyle),
            Text('O3    : $o3 μg/m3', style: pollutionTextStyle),
          ],
        ),
      )
    ],
  );
}
