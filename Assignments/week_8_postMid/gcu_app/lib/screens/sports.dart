import 'package:flutter/material.dart';
import 'package:gcu_app/data/shared_prefs_helper.dart';
import 'package:gcu_app/data/sports_entry.dart';
import '../common/ownNavBar.dart';
import '../common/menudrawer.dart';

class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  shared_pref_Helper sharedPrefHelper = shared_pref_Helper();
  List<sports_entry> sportsEntries = [];
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedPrefHelper.init().then((value) {
      sportsEntries = sharedPrefHelper.getAllSportsData();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports"),
        backgroundColor: Colors.deepPurple.shade600,
      ),
      body: ListView(
        children: getAllData(),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: onAddSportsEntry()),
    );
  }

  List<Widget> getAllData(){
      List<Widget> listSportsEntriesWidget = [];
    
    sportsEntries.forEach((element) {
      listSportsEntriesWidget.add(
        ListTile(
          title: Text(element.date),
          subtitle: Text(element.description),
        ),
      );
    });

    return listSportsEntriesWidget;
      
  }

  Future onAddSportsEntry() async {
        return AlertDialog(
          title: Text("Add the sports entry here"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: dateController,
                  onTap: _selectDate,
                  readOnly: true,
                ),
                TextField(
                  controller: descController;
                  onTap:
                )
              ],
            )
          )
        )
  }
}


