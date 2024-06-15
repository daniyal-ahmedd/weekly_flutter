import 'package:flutter/material.dart';
import '../common/menudrawer.dart';
// import '../common/ownNavBar.dart';

class googleMaps extends StatelessWidget {
  const googleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google maps"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      drawer: const MenuDrawer(),
      // bottomNavigationBar: ownNavBar(),
      body: Center(child: Text("Go to portswigger.net, the best resource for learning web-app hacking.")),
    );
  }
}