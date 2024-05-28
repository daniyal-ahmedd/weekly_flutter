import 'package:a2v1/common/menudrawer.dart';
import 'package:flutter/material.dart';
import '../common/bottomnavbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GCU Application"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: MyBottomNavBar(),
      body: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("tower_opac.jpg"), fit: BoxFit.fill)),
        child: Center(
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: Colors.white70),
                child: Text(
                  "Welcome to Deparment of CS, GCU, Lahore",
                  style: TextStyle(fontSize: 20),
                ))),
      ),
    );
  }
}
