import 'package:flutter/material.dart';
import 'package:gcu_app/screens/About.dart';
import 'package:gcu_app/screens/sports.dart';
import 'package:gcu_app/screens/hackingFeeCalculator.dart';
import 'package:gcu_app/screens/googleMaps.dart';
import 'screens/homepage.dart';

void main() {
  runApp(const GCUAPP());
}

class GCUAPP extends StatelessWidget {
  const GCUAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const HomePage(),
        "/webApphacking": (context) => const googleMaps(),
        // "/Sports": (context) => Sports(),
        "/apiHacking":(context) => About(),
        "/reverseEngineering":(context) => hackingFeeCalculator()
      },
      initialRoute: "/",
    );
  }
}