import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:skyze/screens/loading.dart';

void main() {
  return runApp(const SkyzeApp());
}

class SkyzeApp extends StatelessWidget {
  const SkyzeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: lightDynamic,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic,
            useMaterial3: true,
          ),
          home: const LoadingScreen(),
        );
      },
    );
  }
}
