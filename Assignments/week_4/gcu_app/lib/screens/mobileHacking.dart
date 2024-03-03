import 'package:flutter/material.dart';
import '../common/ownNavBar.dart';
import '../common/menudrawer.dart';


class mobileHacking extends StatelessWidget {
  const mobileHacking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile hacking"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: ownNavBar(),
      body: Center(child: Text("Go to HacksPlanning.com OR Hackerstop.org, the best resource for learning mobile app hacking.")),
    );
  }
}