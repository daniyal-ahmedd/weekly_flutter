import 'package:flutter/material.dart';
import 'package:gcu_app/screens/homepage.dart';
import 'package:gcu_app/screens/sportsFirebas.dart';
import 'package:gcu_app/screens/sportsSQL.dart';
import 'package:gcu_app/screens/googleMaps.dart';
import 'package:gcu_app/screens/sports.dart';
import 'package:gcu_app/screens/About.dart';
import 'package:gcu_app/screens/hackingFeeCalculator.dart';


class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: buildMenuItems(context)),
      backgroundColor: Colors.red,
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<Widget> menuItems = [];

    menuItems.add(const DrawerHeader(
      child: Text("Hacking Domains",
      style: TextStyle(fontSize: 25))
      ));

    final Set<String> menuTitles = {
      "Home",
      "Google Maps",
      "About",
      "Sports",
      "Hacking Fee Calculator",
      "Sports firebase",
      "Sports SQL"
    };

    menuTitles.forEach((element) {
      menuItems.add(ListTile(
        title: Text(element , style: TextStyle(fontSize: 20)),
        onTap: () {
          Widget screen = Container();

          switch (element) {
            case 'Home':
              screen = const HomePage();
              break;
            case 'Google Maps':
              screen = googleMaps();
              break;
            case 'About':
              screen = const About();
              break;
            case 'Sports':
              screen = const Sports();
              break;
            case 'Hacking Fee Calculator':
              screen = const hackingFeeCalculator();
              break;
            case 'Sports Firebase':
              screen = const sportsFirebase();
            case 'Sports SQL':
              screen = const sportsSQL();
            default:
          }

          Navigator.of(context).pop(); // so when we comeback the drawer doesn't stay open
          Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => screen));

        },
      ));
    });
    return menuItems;
  }
}