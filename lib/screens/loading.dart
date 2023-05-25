import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skyze/screens/home.dart';
import 'package:skyze/util/location_worker.dart';
import 'package:skyze/util/data_worker.dart';

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
    GetData getData = GetData();
    dynamic returnData = await getData.getAllData(locationData);
    moveToHome(returnData);
  }

  void moveToHome(weatherData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(weatherData: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
