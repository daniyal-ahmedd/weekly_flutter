import 'package:flutter/material.dart';
import '../common/menudrawer.dart';
import '../common/ownNavBar.dart';
class hackingFeeCalculator extends StatefulWidget {
  const hackingFeeCalculator({super.key});

  @override
  State<hackingFeeCalculator> createState() => _hackingFeeCalculatorState();
}

class _hackingFeeCalculatorState extends State<hackingFeeCalculator> {
  bool isSimpleSelected = true;
  bool isComprehensiveSelected = false;
  late List<bool> isSelectedFlags;
  TextEditingController tecDomains = TextEditingController();
  TextEditingController tecNoOfEmp = TextEditingController(); 
  String hintMessageForSimple = "";
  String computedFee = "";

  @override
  void initState() {
    isSelectedFlags = [isSimpleSelected, isComprehensiveSelected];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    if (isSimpleSelected) {
      hintMessageForSimple = "The number of domains for a simple Pen. test : ";
    } else {
      hintMessageForSimple = "The number of domains for a comprehensive Pen. test : ";
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Hacking Fee Calculator"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: ownNavBar(),
      body: Column(
        children:[
          Center(
            child: ToggleButtons(
              children: [Text("Simple penetration Test"), Text("Comprehensive Penetration Test"),],
              isSelected: isSelectedFlags,
              onPressed: (index) {
                switch (index) {
                  case 0:
                    isSimpleSelected = true;
                    isComprehensiveSelected = false;
                    break;
                  case 1:
                    isSimpleSelected = false;
                    isComprehensiveSelected = true;
                  default:
                }

                setState(() {
                  isSelectedFlags = [isSimpleSelected, isComprehensiveSelected];
                });
              },
            ),
          ),

          TextField(
            decoration: InputDecoration(hintText: hintMessageForSimple),
            keyboardType: TextInputType.number,
            controller: tecDomains,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Please enter the No. of employees in the company: "),
            keyboardType: TextInputType.number,
            controller: tecNoOfEmp,
          ),
          ElevatedButton(
            onPressed: onFeeCalculatePress, child: Text("Calculate Fee")
          ),
          Text(computedFee)
        ]
      ),
    );
  }


  void onFeeCalculatePress() {
    double fee = 0;
    if (isSimpleSelected) {
      double simpleDomains = double.tryParse(tecDomains.text) ?? 0;
      double simpleEmployees = double.tryParse(tecNoOfEmp.text) ?? 0;

      fee = (simpleDomains*simpleEmployees);
    } else {
      double compDomains = double.tryParse(tecDomains.text) ?? 0;
      double compEmployees = double.tryParse(tecNoOfEmp.text) ?? 0;

      fee = 2 * (compDomains*compEmployees);
    }

    setState(() {
      computedFee = "The fee for your company will be: " + fee.toString();
    });
  }
}