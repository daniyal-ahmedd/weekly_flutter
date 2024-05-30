import 'package:flutter/material.dart';
import 'package:sourcev1/common/bottomnavbar.dart';
import 'package:sourcev1/common/menudrawer.dart';

class MeritScreen extends StatefulWidget {
  const MeritScreen({super.key});

  @override
  State<MeritScreen> createState() => _MeritScreenState();
}

class _MeritScreenState extends State<MeritScreen> {
  bool isInterSelected = true;
  bool isOLevelSelected = false;
  late List<bool> isSelectedFlags;
  TextEditingController tecInterOLevel = TextEditingController();
  TextEditingController tecEntryTest = TextEditingController();
  String hintMessageForInterOLev = "";
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
      hintMessageForInterOLev = "Please Enter the marks of intermediate";
    } else {
      hintMessageForInterOLev = "Please Enter the percentage of o-Level";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Merit Calculator"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MyBottomNavBar(),
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
                    default:
                  }

                  setState(() {
                    isSelectedFlags = [isInterSelected, isOLevelSelected];
                  });
                },
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: hintMessageForInterOLev),
              keyboardType: TextInputType.number,
              controller: tecInterOLevel,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: "Please Enter the marks of Entry Test"),
              controller: tecEntryTest,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: onMeritButtonPress, child: Text("Calculate Merit")),
            Text(computedMerit)
          ],
        ),
      ),
    );
  }

  void onMeritButtonPress() {
    double merit = 0;
    if (isInterSelected) {
      double interMarks = double.tryParse(tecInterOLevel.text) ?? 0;
      double entryTest = double.tryParse(tecEntryTest.text) ?? 0;

      merit = (((interMarks / 1100) * .6) + ((entryTest / 30) * .4)) * 100.0;
    } else {
      double olevelPercentage = double.tryParse(tecInterOLevel.text) ?? 0;
      double entryTest = double.tryParse(tecEntryTest.text) ?? 0;

      merit =
          (((olevelPercentage / 100) * .6) + ((entryTest / 30) * .4)) * 100.0;
    }

    setState(() {
      computedMerit = "Merit Score: " + merit.toStringAsFixed(3);
    });
  }
}
