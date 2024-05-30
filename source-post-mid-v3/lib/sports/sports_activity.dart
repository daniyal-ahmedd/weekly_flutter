import 'dart:convert';

class SportsActiviy {
  String id = "";
  String description = "";
  String date = "";

  SportsActiviy(this.id, this.description, this.date);

  SportsActiviy.fromJson(String dataString) {
    Map<String, dynamic> dataMap = json.decode(dataString);
    id = dataMap['id'] ?? "";
    description = dataMap['description'] ?? "";
    date = dataMap['date'] ?? "";
  }

  SportsActiviy.fromJsonMap(Map<String, dynamic> dataMap) {
    id = dataMap['id'].toString() ?? "";
    description = dataMap['description'] ?? "";
    date = dataMap['date'] ?? "";
  }

  String toJson() {
    var dataMap = {"id": id, "description": description, "date": date};
    return json.encode(dataMap);
  }

  Map<String, dynamic> toJsonMap() {
    var dataMap = {"id": id, "description": description, "date": date};
    return dataMap;
  }
}
