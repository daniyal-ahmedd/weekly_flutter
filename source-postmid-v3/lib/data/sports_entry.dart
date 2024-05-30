import 'dart:convert';

class SportEntry {
  String date = "";
  String description = "";
  int id = 0;

  SportEntry(this.id, this.description, this.date);

  String toJson() {
    return json.encode({"id": id, "description": description, "date": date});
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "description": description, "date": date};
  }

  SportEntry.fromJson(String dataString) {
    var data = json.decode(dataString);
    id = data["id"] ?? 0;
    description = data["description"] ?? "";
    date = data["date"] ?? "";
  }

  SportEntry.fromMap(Map<String, dynamic> dataMap) {
    id = dataMap["id"] ?? 0;
    description = dataMap["description"] ?? "";
    date = dataMap["date"] ?? "";
  }
}
