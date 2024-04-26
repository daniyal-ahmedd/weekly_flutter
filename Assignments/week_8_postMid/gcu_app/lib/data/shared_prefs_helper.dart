import 'package:shared_preferences/shared_preferences.dart';
import '../data/sports_entry.dart';

class shared_pref_Helper {
  late SharedPreferences spref;

  Future init() async {
    spref = await SharedPreferences.getInstance();
  }

  Future writeSportsEntry(sports_entry entry) async {
    await spref.setString(entry.id.toString(), entry.toJson());
  }

  sports_entry readSportsEntry(int id) {
    return sports_entry.fromJson(spref.getString(id.toString()) ?? "");
  }

  List<sports_entry> getAllSportsData() {
    List<sports_entry> list_sports_entries = [];

    var keys = spref.getKeys();

    keys.forEach((element) {
      var jsonString = spref.getString(element);
      sports_entry entry = sports_entry.fromJson(jsonString ?? "");
      list_sports_entries.add(entry);
    });


    return list_sports_entries;
  }
}