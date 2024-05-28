import 'dart:ui';

import 'package:a2v1/screens/aboutscreen.dart';
import 'package:a2v1/screens/homescreen.dart';
import 'package:a2v1/screens/meritscreen.dart';
import 'package:a2v1/screens/sportsscreen.dart';
import 'package:a2v1/screens/sportsscreenfirebase.dart';
import 'package:a2v1/screens/sportsscreensqlite.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        child: Text(
      "GCU App Options",
      style: TextStyle(fontSize: 30),
    )));

    final Set<String> menuTitles = {
      "Home",
      "Merit Calculator",
      "Sports",
      "Sports SQlite",
      "Sports Firebase",
      "About"
    };
    menuTitles.forEach((element) {
      menuItems.add(ListTile(
        title: Text(
          element,
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {
          Widget screen = Container();
          switch (element) {
            case "Home":
              screen = HomeScreen();
              break;
            case "Merit Calculator":
              screen = MeritScreen();
              break;
            case "About":
              screen = AboutUsScreen();
            case "Sports":
              screen = SportsScreen();
            case "Sports SQlite":
              screen = SportsScreenSQlite();
            case "Sports Firebase":
              screen = const SportsScreenFirebase();
            default:
          }

          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
