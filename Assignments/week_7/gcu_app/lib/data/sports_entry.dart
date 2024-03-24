import 'dart:convert';

class sports_entry{
  String date = "";
  String description = "";
  String venue = "";
  int id = 0;

  sports_entry(this.id, this.description, this.venue, this.date);

  String toJson() {
    return json.encode(
      {"id": id, "description": description, "venue": venue, "date": date}
      );
  } 
}