import 'package:flutter/material.dart';
import 'package:week_3/screens/homepage.dart';

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
      "Web-App Hacking",
      "Api hacking",
      "Mobile hacking",
      "Reverse Engineering"
    };

    menuTitles.forEach((element) {
      menuItems.add(ListTile(
        title: Text(element , style: TextStyle(fontseize: 20))
      ));
    });
    return menuItems;
  }
}