import 'package:flutter/material.dart';


class ownNavBar extends StatelessWidget {
  const ownNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        switch(index){
          case 0:
            Navigator.pushNamed(context, "/");
            break;
          case 1:
            Navigator.pushNamed(context, "/webApphacking");
            break;
          case 2:
            Navigator.pushNamed(context, "/mobileHacking");
            break;
          case 3:
            Navigator.pushNamed(context, "/apiHacking");
            break;
          case 4:
            Navigator.pushNamed(context, "/reverseEngineering");
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded, color: Colors.lightGreenAccent,), label: "Home",),
        BottomNavigationBarItem(icon: Icon(Icons.web_rounded, color: Colors.lightGreenAccent), label: "Web"),
        BottomNavigationBarItem(icon: Icon(Icons.mobile_screen_share_rounded, color: Colors.lightGreenAccent), label: "Mobile",),
        BottomNavigationBarItem(icon: Icon(Icons.api_rounded, color: Colors.lightGreenAccent), label: "API"),
        BottomNavigationBarItem(icon: Icon(Icons.precision_manufacturing_rounded, color: Colors.lightGreenAccent), label: "R.E")
      ],
      
    );
  }
}