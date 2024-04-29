import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gcu_app/data/shared_prefs_helper.dart';
import 'package:gcu_app/data/sports_entry.dart';

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
  String error = "";
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
      floatingActionButton: FloatingActionButton(
        onPressed: onAddSportsEntry,
        child: Icon(Icons.add_alert)),
    );
  }

  List<Widget> getAllData(){
      List<Widget> listSportsEntriesWidget = [];
    
    sportsEntries.forEach((element) {
      listSportsEntriesWidget.add(
        Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            sharedPrefHelper.removeSportsEntry(element.id.toString()).then((value) {
              sportsEntries=sharedPrefHelper.getAllSportsData();
              setState(() {});
            });
          },
          child: ListTile(
            title: Text(element.date),
            subtitle: Text(element.description),
          ),
        ),
      );
    });

    return listSportsEntriesWidget;
      
  }

  Future onAddSportsEntry() async {
        return showDialog(
          context: context,
          builder: (context) {
          return StatefulBuilder( builder: (context, StateSetter stateSetter) 
             {
              return AlertDialog(
              title: Text("Add the sports entry here"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: dateController,
                      onTap: _selectDate,
                      readOnly: true, //so keyborad doesen't show up when showing the date picker element.
                      decoration: InputDecoration( hintText: "Please select Date of the match:"),
                    ),
                    TextField(
                      controller: descController,
                      decoration: InputDecoration( hintText: "Please give description of the match.")
                    ),
                    Text( error, style: TextStyle(color: Colors.red.shade900),)
                  ],
                )
              ),
              actions: [
                  TextButton(
                    onPressed: () {
                      dateController.text = "";
                      descController.text = "";
                      Navigator.of(context).pop();
                      error = "";
                      setState(() {});
                    } ,
                    child: Text("Cancel"),
                  ),
                  ElevatedButton( 
                    onPressed: () {
                    String date = dateController.text;
                    String desc = descController.text;
            
                    int savedCounter = sharedPrefHelper.getExistingCounter();
            
                    if(date != "" && desc != ""){
                      sports_entry entry = sports_entry(savedCounter, desc, date);
                      sharedPrefHelper.writeSportsEntry(entry);
                      dateController.text = "";
                      descController.text = "";
                      Navigator.of(context).pop();
                      sportsEntries = sharedPrefHelper.getAllSportsData();
                      setState(() {});
                    }
                    else{
                      error="Please provide appropriate information.";
                      stateSetter( 
                        () {}
                      );
                      //error = "";
                    }
                    },
                    child: Text("Save"),
                  ), 
              ],
            );
          });
  });
  }

  Future _selectDate() async {
      final DateTime? dated = await showDatePicker(context: context, 
        firstDate: DateTime(2024), 
        lastDate: DateTime(DateTime.now().year,DateTime.now().month + 1));
        
        if(dated !=null)
        {
          dateController.text = "${dated.day}-${dated.month}-${dated.year}";
        }
  }
}


