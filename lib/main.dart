import 'package:flutter/material.dart';
import 'package:skyze/screens/home.dart';
import 'package:skyze/screens/loading.dart';

void main() {
  return runApp(const SkyzeApp());
}

class SkyzeApp extends StatelessWidget {
  const SkyzeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LoadingScreen(),
    );
  }
}
