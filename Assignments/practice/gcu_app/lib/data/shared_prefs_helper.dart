import 'package:shared_preferences/shared_preferences.dart';
import '../data/sports_entry.dart';

class shared_pref_Helper {
  late SharedPreferences spref;

  Future init() async {
    spref = await SharedPreferences.getInstance();
  }

  int getExistingCounter() {
    return spref.getInt("counter") ?? 1;
  }

  Future writeSportsEntry(sports_entry entry) async {
    await spref.setString(entry.id.toString(), entry.toJson());
    int existingCounter = spref.getInt("counter") ?? 1;
    await spref.setInt("counter", existingCounter + 1);
  }

  sports_entry readSportsEntry(int id) {
    return sports_entry.fromJson(spref.getString(id.toString()) ?? "");
  }

  Future removeSportsEntry(String id) async {
     await spref.remove(id);
  }

  List<sports_entry> getAllSportsData() {
    List<sports_entry> list_sports_entries = [];

    var keys = spref.getKeys();

    keys.forEach((element) {
      if( element != "counter")
      {
        var jsonString = spref.getString(element);
        sports_entry entry = sports_entry.fromJson(jsonString ?? "");
        list_sports_entries.add(entry);
        }
    });


    return list_sports_entries;
  }
}