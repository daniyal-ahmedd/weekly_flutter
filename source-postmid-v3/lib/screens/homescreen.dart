import 'package:flutter/material.dart';
import '../common/menudrawer.dart';
import "../common/bottomnavbar.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GCU Application"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MyBottomNavBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/tower_opac.jpg"), fit: BoxFit.fill)),
        child: Center(
            child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white70),
          child: Text(
            "Welcome to the Department of Computer Science, GCU, Lahore",
            style: TextStyle(fontSize: 20),
          ),
        )),
      ),
    );
  }
}
