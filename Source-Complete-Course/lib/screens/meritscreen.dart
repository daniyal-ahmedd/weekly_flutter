import 'package:a2v1/common/menudrawer.dart';
import 'package:flutter/material.dart';

import '../common/bottomnavbar.dart';

class MeritScreen extends StatefulWidget {
  const MeritScreen({super.key});

  @override
  State<MeritScreen> createState() => _MeritScreenState();
}

class _MeritScreenState extends State<MeritScreen> {
  bool isInterSelected = true;
  bool isOLevelSelected = false;

  late List<bool> isSelectedFlags;
  TextEditingController controllerField1 = TextEditingController();
  TextEditingController controllerField2 = TextEditingController();
  String hintTextField1 = "";
  String computedMerit = "";

  @override
  void initState() {
    isSelectedFlags = [isInterSelected, isOLevelSelected];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isInterSelected) {
      hintTextField1 = "Please Enter the marks of intermediate";
    } else {
      hintTextField1 = "Please Enter the percentage of O-Level";
    }

    return Scaffold(
      appBar:
          AppBar(title: Text("Merit Screen"), backgroundColor: Colors.blueGrey),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ToggleButtons(
                children: [Text("Intermediate"), Text("O-Level")],
                isSelected: isSelectedFlags,
                onPressed: (index) {
                  switch (index) {
                    case 0:
                      isInterSelected = true;
                      isOLevelSelected = false;
                      break;

                    case 1:
                      isInterSelected = false;
                      isOLevelSelected = true;
                      break;

                    default:
                  }

                  setState(() {
                    isSelectedFlags = [isInterSelected, isOLevelSelected];
                  });
                },
              ),
            ),
            TextField(
              controller: controllerField1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: hintTextField1),
            ),
            TextField(
                controller: controllerField2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Please Enter the marks of Entry Test")),
            ElevatedButton(
                onPressed: onCalcualteMeritClicked,
                child: Text("Calculate Merit")),
            Text(computedMerit)
          ],
        ),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  void onCalcualteMeritClicked() {
    double merit = 0;
    if (isInterSelected) {
      double interMarks = double.tryParse(controllerField1.text) ?? 0;
      double entryTestMarks = double.tryParse(controllerField2.text) ?? 0;

      merit = 100 * ((interMarks / 1100 * .60) + (entryTestMarks / 30 * .40));
    } else {
      double olevelPercentage = double.tryParse(controllerField1.text) ?? 0;
      double entryTestMarks = double.tryParse(controllerField2.text) ?? 0;

      merit =
          100 * ((olevelPercentage / 100 * .60) + (entryTestMarks / 30 * .40));
    }

    computedMerit = "Merit: " + merit.toStringAsFixed(3);

    setState(() {});
  }
}
