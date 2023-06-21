import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skyze/color.dart';
import 'package:skyze/screens/home.dart';
import 'package:skyze/util/location_worker.dart';
import 'package:skyze/util/data_worker.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String loadingText = 'Loading';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      loadingText = 'Finding location';
    });
    LocationLoader locationLoader = LocationLoader();
    var locationData = await locationLoader.getLocation();
    setState(() {
      loadingText = 'Requesting location data';
    });
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
    return Container(
      color: const Color.fromARGB(255, 0, 203, 248),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Skyze',
              style: TextStyle(
                color: Color.fromARGB(255, 30, 30, 30),
                decoration: TextDecoration.none,
                fontSize: 72,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoadingAnimationWidget.halfTriangleDot(
                  size: 20,
                  color: const Color.fromARGB(255, 30, 30, 30),
                ),
                const SizedBox(width: 10),
                Text(
                  loadingText,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 30, 30, 30),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
