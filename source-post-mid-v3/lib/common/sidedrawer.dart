import 'package:flutter/material.dart';
import 'package:lec1v1/screens/aboutus.dart';
import 'package:lec1v1/screens/homescreen.dart';
import 'package:lec1v1/screens/meritscreen.dart';
import 'package:lec1v1/screens/sportsscreen.dart';
import 'package:lec1v1/screens/sportsscreenfirebase.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(children: buildMenuItemsList(context)),
    );
  }
}

List<Widget> buildMenuItemsList(BuildContext context) {
  List<Widget> menuItems = [];
  menuItems.add(const DrawerHeader(
      child: Text(
    "GCU App Options",
    style: TextStyle(fontSize: 30),
  )));

  Set<String> menuTitles = {
    "Home",
    "Merit Calculator",
    "Sports Firebase",
    "Sports",
    "About"
  };

  menuTitles.forEach((element) {
    menuItems.add(ListTile(
      title: Text(
        element,
        style: TextStyle(fontSize: 20),
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
            screen = AboutUSScreen();
          case "Sports":
            screen = SportsScreen();
          case "Sports Firebase":
            screen = SportsScreenFirebase();
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
