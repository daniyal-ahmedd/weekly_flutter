import 'package:flutter/material.dart';
import 'package:sourcev1/screens/meritscreen.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(const GCUAPP());
}

class GCUAPP extends StatelessWidget {
  const GCUAPP({super.key});

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
