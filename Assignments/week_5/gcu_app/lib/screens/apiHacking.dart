import 'package:flutter/material.dart';
import '../common/menudrawer.dart';
import '../common/ownNavBar.dart';
class apiHacking extends StatelessWidget {
  const apiHacking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api hacking"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: ownNavBar(),
      body: Center(child: Text("Go to apisecuniversity.com, the best resource for learning API hacking.")),
    );
  }
}