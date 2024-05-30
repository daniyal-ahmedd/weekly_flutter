import 'package:flutter/material.dart';
import 'package:lec1v1/sports/sports_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  late SharedPreferences sharedPreferences;

  Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  int existingCounter() {
    int counter = sharedPreferences.getInt("counter") ?? 1;
    return counter;
  }

  Future saveSportsActivity(SportsActiviy activiy) async {
    await sharedPreferences.setString(activiy.id, activiy.toJson());
    int counter = sharedPreferences.getInt("counter") ?? 1;
    await sharedPreferences.setInt("counter", counter + 1);
  }

  List<SportsActiviy> getAllData() {
    List<SportsActiviy> allGamesData = [];

    var allKeys = sharedPreferences.getKeys();

    allKeys.forEach((key) {
      if (key != "counter") {
        var jsonStringSports = sharedPreferences.getString(key) ?? "";
        SportsActiviy activiy = SportsActiviy.fromJson(jsonStringSports);
        allGamesData.add(activiy);
      }
    });

    return allGamesData;
  }

  Future removeSportsEntry(String key) async {
    await sharedPreferences.remove(key);
  }
}
