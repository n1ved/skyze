import 'package:flutter/material.dart';
import 'package:skyze/color.dart';
import 'package:skyze/components/snackbar.dart';
import 'package:skyze/util/process_data.dart';
import 'package:skyze/util/switches.dart';
import '../components/weatherinfocontainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skyze/styles.dart';
import '../util/location_worker.dart';
import '../util/data_worker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.weatherData, super.key});

  final dynamic weatherData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController inputController;
  late String cityNameInput;
  ProcessData processData = ProcessData();
  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
    updateScreen(widget.weatherData);
  }

  void updateScreen(dynamic weather) {
    setState(() {
      processData.processData(weather);
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image:
              AssetImage(processData.backgroundImageUrl ?? 'assets/clear.jpg'),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                          roundedSnackBar(
                              contentString: "Refreshing", loading: true));
                      LocationLoader locationLoader = LocationLoader();
                      var locationData = await locationLoader.getLocation();
                      GetData getData = GetData();
                      dynamic returnData =
                          await getData.getAllData(locationData);
                      updateScreen(returnData);
                    },
                    child: Icon(
                      FontAwesomeIcons.arrowsRotate,
                      color: textColor,
                    ),
                  ),
                  Text(
                    "Skyze",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: textColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext dialogueContext) =>
                              AlertDialog(
                                title: const Text("Search City"),
                                content: TextField(
                                  controller: inputController,
                                  onChanged: (value) {
                                    cityNameInput = value;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "City Name"),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(dialogueContext);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      GetData getData = GetData();
                                      Navigator.pop(dialogueContext);
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(roundedSnackBar(
                                                contentString: "Loading",
                                                loading: true));
                                      }
                                      dynamic returnData =
                                          await getData.getAllDataByName(
                                              cityName: cityNameInput);
                                      if (returnData != 'error') {
                                        updateScreen(returnData);
                                        cityNameInput = '';
                                      } else {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            roundedSnackBar(
                                              contentString:
                                                  "Unable to Find the city",
                                              loading: false,
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: const Text("Search"),
                                  ),
                                ],
                              ));
                    },
                    child: Icon(
                      FontAwesomeIcons.city,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            weatherInfoContainer(
                child: mainWeatherData(
              location: processData.locationName,
              country: processData.country,
              temperature: processData.temperature,
              minTemp: processData.minTemp,
              maxTemp: processData.maxTemp,
              description: processData.description,
              weatherIcon: processData.weatherIcon ?? Icons.error,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: weatherInfoContainer(
                        child: windData(
                            windDeg: processData.windDeg,
                            windSpeed: processData.windSpeed))),
                Expanded(
                    child: weatherInfoContainer(
                        child: pressureData(pressure: processData.pressure))),
              ],
            ),
            weatherInfoContainer(
                child: pollutionData(
              co: processData.co,
              no: processData.no,
              no2: processData.no2,
              o3: processData.o3,
              airQuality: processData.airQuality,
            )),
            Text(
              "$processData.imageAttribute",
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
