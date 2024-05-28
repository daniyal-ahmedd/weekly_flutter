import 'package:a2v1/sports/sportsactivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  late SharedPreferences sharedPreferencesObj;

  Future init() async {
    sharedPreferencesObj = await SharedPreferences.getInstance();
  }

  int getExistingCounter() {
    return sharedPreferencesObj.getInt("counter") ?? 1;
  }

  Future saveSportsRecord(SportsActivity activity) async {
    await sharedPreferencesObj.setString(activity.id, activity.toJsonString());
    await sharedPreferencesObj.setInt("counter", getExistingCounter() + 1);
  }

  Future removeSportsRecord(String id) async {
    await sharedPreferencesObj.remove(id);
  }

  List<SportsActivity> getAllGamesData() {
    List<SportsActivity> listGames = [];
    var keys = sharedPreferencesObj.getKeys();

    for (var key in keys) {
      if (key != "counter") {
        var sportsRecord = sharedPreferencesObj.getString(key) ?? "";
        SportsActivity obj = SportsActivity.fromJsonString(sportsRecord);
        listGames.add(obj);
      }
    }

    return listGames;
  }
}
