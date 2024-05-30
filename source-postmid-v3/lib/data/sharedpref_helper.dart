import 'package:shared_preferences/shared_preferences.dart';
import 'package:sourcev1/data/sports_entry.dart';

class SharedPrefHelper {
  late SharedPreferences spref;

  Future init() async {
    spref = await SharedPreferences.getInstance();
  }

  int getExisitingCounter() {
    return spref.getInt("counter") ?? 1;
  }

  Future writeSportsEntry(SportEntry entry) async {
    await spref.setString(entry.id.toString(), entry.toJson());
    int exitingCounter = spref.getInt("counter") ?? 1;
    await spref.setInt("counter", exitingCounter + 1);
  }

  SportEntry readSportsEntry(int id) {
    return SportEntry.fromJson(spref.getString(id.toString()) ?? "");
  }

  Future removeExistingEntry(String id) async {
    await spref.remove(id);
  }

  List<SportEntry> getAllofSportsDate() {
    List<SportEntry> listSportsEnties = [];

    var keys = spref.getKeys();

    keys.forEach((key) {
      if (key != "counter") {
        var jsonString = spref.getString(key);
        SportEntry entry = SportEntry.fromJson(jsonString ?? "");
        listSportsEnties.add(entry);
      }
    });

    return listSportsEnties;
  }
}
