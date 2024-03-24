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
    return sports_entry.toJson(spref.getString(id.toString()) ?? "");
  }
}