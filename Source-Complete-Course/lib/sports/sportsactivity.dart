import 'dart:convert';

class SportsActivity {
  String id = "";
  String date = "";
  String gameDetail = "";

  SportsActivity(this.id, this.date, this.gameDetail);

  String toJsonString() {
    String encodedString =
        json.encode({"id": id, "date": date, "gameDetail": gameDetail});
    return encodedString;
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "date": date, "gameDetail": gameDetail};
  }

  SportsActivity.fromJsonString(String jsonString) {
    var dataMap = json.decode(jsonString);
    id = dataMap["id"] ?? "";
    date = dataMap["date"] ?? "";
    gameDetail = dataMap["gameDetail"] ?? "";
  }

  SportsActivity.fromMap(Map<String, dynamic> dataMap) {
    id = dataMap["id"].toString() ?? "";
    date = dataMap["date"] ?? "";
    gameDetail = dataMap["gameDetail"] ?? "";
  }
}
