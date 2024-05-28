import 'package:flutter/material.dart';
import '../data/sqlite_helper.dart';
import '../data/sports_entry.dart';

class sportsSQL extends StatefulWidget {
  const sportsSQL({super.key});

  @override
  State<sportsSQL> createState() => _sportsSQLState();
}

class _sportsSQLState extends State<sportsSQL> {
  SQLite_helper sqLite_helper = SQLite_helper();
  List<sports_entry> sportsEntries = [];
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<sports_entry> filteredSportsEntries = [];
  String error = "";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    sqLite_helper.init().then((value) {
      // sportsEntries = sharedPrefHelper.getAllSportsData();
      sqLite_helper.getAllSportsData().then((value) {
        sportsEntries = value;
        filteredSportsEntries = List.from(sportsEntries);
        setState(() {});
      }
      );
      }
    );

    searchController.addListener(onSearchTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports SQL"),
        backgroundColor: Colors.deepPurple.shade600,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: "Search for matches",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              )
              ),
            Container(
          height: MediaQuery.of(context).size.height *0.75,
          child: ListView(
            children: getAllData(),
          )
          )
          ],
        ),
        
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
            sqLite_helper.removeSportsEntry(element.id.toString()).then((value) {
              sqLite_helper.getAllSportsData().then((value) {
                sportsEntries = value;
                filteredSportsEntries = List.from(sportsEntries);
                searchController.text = "";
                setState(() {});
              },);
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
    
                    if(date != "" && desc != ""){
                      sqLite_helper.getExistingCounter().then((value){
                        int savedCounter = value;
                        sports_entry entry = sports_entry(savedCounter, desc, date);
                        sqLite_helper.writeSportsEntry(entry);
                        dateController.text = "";
                        descController.text = "";
                        Navigator.of(context).pop();
                        sqLite_helper.getAllSportsData().then((value) {
                          sportsEntries = value;
                          filteredSportsEntries = List.from(sportsEntries);
                          searchController.text = "";
                          setState(() {});
                        },);
                        setState(() {});
                      });
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

  void onSearchTextChanged() {
    filteredSportsEntries = sportsEntries.
      where((element) => element.description
        .toLowerCase()
          .contains(searchController.text.toLowerCase())).toList();

    setState(() {});
  }
}