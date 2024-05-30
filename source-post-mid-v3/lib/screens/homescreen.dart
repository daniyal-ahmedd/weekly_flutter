import 'package:flutter/material.dart';
import 'package:lec1v1/common/sidedrawer.dart';

import '../common/bottomnavbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GCU LMS Application"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: const SideDrawer(),
      bottomNavigationBar: MyBottomNavBar(),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/tower_opac.jpg"),
                  fit: BoxFit.fill)),
          child: Center(
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    "Welcome to the GCU, Department of CS",
                    style: TextStyle(fontSize: 20),
                  )))),
    );
  }
}
