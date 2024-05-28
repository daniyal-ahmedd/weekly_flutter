import 'dart:convert';

class sports_entry{
  String date = "";
  String description = "";
  int id = 0;

  sports_entry(this.id, this.description, this.date);

  String toJson() {
    return json.encode(
      {"id": id, "description": description, "date": date}
      );
  } 

  sports_entry.fromJson(String dataString){
    var data = json.decode(dataString);
    id = data["id" ?? ""];
    description = data["description" ?? ""];
    date = data["date" ?? ""];
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "description": description, "date": date};
  }

  sports_entry.fromMap(Map <String,dynamic> sql_map) {
    id = sql_map["id"] ?? 0;
    description = sql_map["description"] ?? "";
    date = sql_map["date"] ?? "";
  }
}