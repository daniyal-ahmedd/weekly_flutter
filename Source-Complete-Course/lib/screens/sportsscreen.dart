import 'package:a2v1/sports/sharedprefhelper.dart';
import 'package:a2v1/sports/sportsactivity.dart';
import 'package:flutter/material.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  SharedPrefHelper sharedPrefHelper = SharedPrefHelper();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerGameDetail = TextEditingController();
  TextEditingController controllerSearch = TextEditingController();
  List<SportsActivity> listAllGames = [];
  List<SportsActivity> filteredGames = [];
  int counter = 1;
  String errorMsg = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedPrefHelper.init().then((value) {
      listAllGames = sharedPrefHelper.getAllGamesData();
      filteredGames = List.from(listAllGames);
      setState(() {});
    });
    controllerSearch.addListener(onSearchTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports Activities"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              controller: controllerSearch,
              decoration: InputDecoration(
                  hintText: "Search Here!",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .83,
            child: ListView(
              children: populateAllData(),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddSportsActivity,
        child: Icon(Icons.add),
      ),
    );
  }

  Future onAddSportsActivity() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, StateSetter stateSetterDialog) {
            return AlertDialog(
              title: const Text("Please Provide following information"),
              content: SingleChildScrollView(
                  child: Column(
                children: [
                  TextField(
                    controller: controllerDate,
                    readOnly: true,
                    onTap: _showDatePicker,
                    decoration:
                        InputDecoration(hintText: "Please Provide the Date"),
                  ),
                  TextField(
                    controller: controllerGameDetail,
                    decoration: InputDecoration(
                        hintText: "Please Provide the Game Detail"),
                  ),
                  Text(
                    errorMsg,
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              )),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      controllerDate.text = "";
                      controllerGameDetail.text = "";
                      errorMsg = "";
                      setState(() {});
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      if (controllerDate.text.isNotEmpty &&
                          controllerGameDetail.text.isNotEmpty) {
                        String date = controllerDate.text;
                        String gameDetail = controllerGameDetail.text;
                        int savedCounter =
                            sharedPrefHelper.getExistingCounter();
                        SportsActivity activity = SportsActivity(
                            savedCounter.toString(), date, gameDetail);
                        counter++;
                        sharedPrefHelper.saveSportsRecord(activity);

                        Navigator.pop(context);
                        controllerDate.text = "";
                        controllerGameDetail.text = "";
                        errorMsg = "";
                        listAllGames = sharedPrefHelper.getAllGamesData();
                        filteredGames = List.from(listAllGames);
                        controllerSearch.text = "";
                        setState(() {});
                      } else {
                        errorMsg = "Please Provide data in both of fields";
                        stateSetterDialog(() {});
                      }
                    },
                    child: const Text("Save"))
              ],
            );
          });
        });
  }

  Future _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month + 1, DateTime.now().day));

    if (pickedDate != null) {
      controllerDate.text = pickedDate.day.toString() +
          "/" +
          pickedDate.month.toString() +
          "/" +
          pickedDate.year.toString();

      setState(() {});
    }
  }

  List<Widget> populateAllData() {
    List<Widget> listTiles = [];
    for (var game in filteredGames) {
      listTiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          sharedPrefHelper.removeSportsRecord(game.id).then((value) {
            listAllGames = sharedPrefHelper.getAllGamesData();
            filteredGames = List.from(listAllGames);
            controllerSearch.text = "";
            setState(() {});
          });
        },
        child: ListTile(
          title: Text(game.gameDetail),
          subtitle: Text(game.date),
        ),
      ));
    }

    return listTiles;
  }

  void onSearchTextChanged() {
    filteredGames = listAllGames
        .where((element) => element.gameDetail
            .toLowerCase()
            .contains(controllerSearch.text.toLowerCase()))
        .toList();
    setState(() {});
  }
}
