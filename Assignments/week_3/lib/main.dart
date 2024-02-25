import 'package:flutter/material.dart';
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
      home: HomePage(),
    );
  }
}