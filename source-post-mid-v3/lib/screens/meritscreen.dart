import 'package:flutter/material.dart';
import '../common/bottomnavbar.dart';
import '../common/sidedrawer.dart';

class MeritScreen extends StatefulWidget {
  const MeritScreen({super.key});

  @override
  State<MeritScreen> createState() => _MeritScreenState();
}

class _MeritScreenState extends State<MeritScreen> {
  bool isIntermediateSelected = true;
  bool isOLevelSelected = false;
  String hintMessageField1 = "";
  TextEditingController controllerField1 = TextEditingController();
  TextEditingController controllerField2 = TextEditingController();
  String computedMerit = "Merit Score: 0";
  @override
  Widget build(BuildContext context) {
    if (isIntermediateSelected) {
      hintMessageField1 = "Please Enter the marks of intermediate";
    } else {
      hintMessageField1 = "Please Enter the percentage of O-Level";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Merit Screen"),
        backgroundColor: Colors.amberAccent,
      ),
      drawer: const SideDrawer(),
      bottomNavigationBar: const MyBottomNavBar(),
      body: Column(
        children: [
          Center(
            child: ToggleButtons(
              isSelected: [isIntermediateSelected, isOLevelSelected],
              onPressed: (index) {
                switch (index) {
                  case 0:
                    isIntermediateSelected = true;
                    isOLevelSelected = false;
                    break;
                  case 1:
                    isIntermediateSelected = false;
                    isOLevelSelected = true;
                    break;
                  default:
                }

                setState(() {});
              },
              children: [Text("Intermediate"), Text("O-Level")],
            ),
          ),
          TextField(
            controller: controllerField1,
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(hintText: hintMessageField1),
          ),
          TextField(
              controller: controllerField2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Please Enter the marks of entry test")),
          ElevatedButton(
              onPressed: onMeritPressedClick, child: Text("Calculate Merit")),
          Text(computedMerit)
        ],
      ),
    );
  }

  void onMeritPressedClick() {
    double merit = 0;
    if (isIntermediateSelected) {
      double interMarks = double.tryParse(controllerField1.text) ?? 0;
      double entryTestMarks = double.tryParse(controllerField2.text) ?? 0;

      merit = ((interMarks / 1100 * .60) + (entryTestMarks / 30 * .40)) * 100;
    } else {
      double olevelpercentage = double.tryParse(controllerField1.text) ?? 0;
      double entryTestMarks = double.tryParse(controllerField2.text) ?? 0;

      merit =
          ((olevelpercentage / 100 * .60) + (entryTestMarks / 30 * .40)) * 100;
    }

    computedMerit = "Merit Score: ${merit.toStringAsFixed(3)}";

    setState(() {});
  }
}
