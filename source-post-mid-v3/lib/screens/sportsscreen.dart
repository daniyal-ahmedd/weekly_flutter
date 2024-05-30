import 'package:flutter/material.dart';
import 'package:lec1v1/sports/sports_activity.dart';
import 'package:lec1v1/sports/sqlitehelper.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  // SharedPrefHelper sharedPrefHelperObj = SharedPrefHelper();
  SQliteHelper sQliteHelper = SQliteHelper();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  TextEditingController controllerSearch = TextEditingController();
  List<SportsActiviy> allSportsGames = [];
  List<SportsActiviy> filteredSportsGames = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sQliteHelper.init().then((value) {
      sQliteHelper.getAllData().then((value) {
        allSportsGames = value;
        filteredSportsGames = List.from(allSportsGames);
        setState(() {});
      });
    });
    controllerSearch.addListener(onSearchTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports Activities"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              controller: controllerSearch,
              decoration: const InputDecoration(
                  hintText: "Search Here!",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView(
              children: populateAlltheData(),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddActivityClicked,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future onAddActivityClicked() async {
    String errorMessage = "";
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter stateSetter) {
            return AlertDialog(
              title: const Text("Please Provide Following Information"),
              content: SingleChildScrollView(
                  child: Column(
                children: [
                  TextField(
                    readOnly: true,
                    onTap: showCalender,
                    controller: controllerDate,
                    decoration: const InputDecoration(
                        hintText: "Please Enter the Date"),
                  ),
                  TextField(
                      controller: controllerDesc,
                      decoration: const InputDecoration(
                          hintText: "Please Enter the Description")),
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.redAccent),
                  )
                ],
              )),
              actions: [
                TextButton(
                    onPressed: () {
                      controllerDate.text = "";
                      controllerDesc.text = "";
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      String date = controllerDate.text;
                      String description = controllerDesc.text;

                      if (date != "" && description != "") {
                        sQliteHelper.existingCounter().then((key) {
                          key++;
                          SportsActiviy sportsActiviy =
                              SportsActiviy(key.toString(), description, date);

                          sQliteHelper
                              .saveSportsActivity(sportsActiviy)
                              .then((value) {
                            controllerDate.text = "";
                            controllerDesc.text = "";
                            Navigator.of(context).pop();
                            controllerSearch.text = "";
                            sQliteHelper.getAllData().then((value) {
                              allSportsGames = value;
                              filteredSportsGames = List.from(allSportsGames);
                              errorMessage = "";
                              setState(() {});
                            });
                          });
                        });
                      } else {
                        errorMessage = "Please Enter all the values";
                        stateSetter(
                          () {},
                        );
                      }
                    },
                    child: const Text("Save"))
              ],
            );
          });
        });
  }

  Future showCalender() async {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    int day = DateTime.now().day;

    month = month + 1;
    if (month > 12) {
      year = year + 1;
      month = 1;
    }

    DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(year, month, day));

    if (pickedDate != null) {
      // controllerDate.text = pickedDate.day.toString() +
      //     "/" +
      //     pickedDate.month.toString() +
      //     "/" +
      //     pickedDate.year.toString();

      controllerDate.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      setState(() {});
    }
  }

  List<Widget> populateAlltheData() {
    List<Widget> listTiles = [];

    filteredSportsGames.forEach((element) {
      listTiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          sQliteHelper.removeSportsEntry(element.id).then((value) {
            sQliteHelper.getAllData().then((value) {
              allSportsGames = value;
              filteredSportsGames = List.from(allSportsGames);
              controllerSearch.text = "";
              setState(() {});
            });
          });
        },
        child: ListTile(
          title: Text(element.description),
          subtitle: Text(element.date),
        ),
      ));
    });

    return listTiles;
  }

  void onSearchTextChanged() {
    filteredSportsGames = allSportsGames
        .where(
          (element) => element.description
              .toLowerCase()
              .contains(controllerSearch.text.toLowerCase()),
        )
        .toList();
    setState(() {});
  }
}
