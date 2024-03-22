import 'package:flutter/material.dart';
import 'package:gcu_app/screens/homepage.dart';
import 'package:gcu_app/screens/webAppHacking.dart';
import 'package:gcu_app/screens/mobileHacking.dart';
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
      "Web-App hacking",
      "About",
      "Mobile hacking",
      "Hacking Fee Calculator"
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
            case 'Web-App hacking':
              screen = webAppHacking();
              break;
            case 'About':
              screen = const About();
              break;
            case 'Mobile hacking':
              screen = const mobileHacking();
              break;
            case 'Hacking Fee Calculator':
              screen = const hackingFeeCalculator();
              break;
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