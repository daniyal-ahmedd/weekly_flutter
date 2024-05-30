import 'package:flutter/material.dart';
import 'package:sourcev1/screens/aboutus.dart';
import 'package:sourcev1/screens/homescreen.dart';
import 'package:sourcev1/screens/meritscreen.dart';
import 'package:sourcev1/screens/sportsscreen.dart';
import 'package:sourcev1/screens/sportsscreen_firebase.dart';
import 'package:sourcev1/screens/sportsscreen_sqlite.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: buildMenuItems(context)),
      backgroundColor: Colors.blueGrey,
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<Widget> menuItems = [];

    menuItems.add(const DrawerHeader(
        child: Text(
      "GCU Application Options",
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
        title: Text(element, style: TextStyle(fontSize: 20)),
        onTap: () {
          Widget screen = Container();

          switch (element) {
            case 'Home':
              screen = const HomeScreen();
              break;
            case 'Merit Calculator':
              screen = const MeritScreen();
              break;
            case 'About':
              screen = const AboutUs();
              break;
            case 'Sports':
              screen = const SportsScreen();
              break;
            case 'Sports SQlite':
              screen = const SportsScreenSQlite();
              break;
            case 'Sports Firebase':
              screen = const SportsScreenFirebase();
              break;
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
