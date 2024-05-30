import 'package:flutter/material.dart';
import 'package:lec1v1/screens/homescreen.dart';
import 'package:lec1v1/screens/meritscreen.dart';

void main() {
  runApp(GCUApplicationHome());
}

class GCUApplicationHome extends StatelessWidget {
  const GCUApplicationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HomeScreen(),
        "/merit": (context) => MeritScreen()
      },
      initialRoute: "/",
    );
  }
}
