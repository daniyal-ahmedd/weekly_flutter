import 'dart:convert';

import 'package:http/http.dart' as http;
import 'weather.dart';

class httpHelper {
 // https://api.openweathermap.org/data/2.5/weather?lat=31.573152&lon=74.3078585&appid=f0ca8d982e6f08914927ce0bf69b0972

  final String domain = "api.openweathermap.org";
  final String path = "data/2.5/weather";
  final apiKey = "f0ca8d982e6f08914927ce0bf69b0972";
  Future<Weather> GetWeather(String lat, String lon) async {
    Map<String, dynamic> parameters = {"lat": lat, "lon": lon, "appid": apiKey};
    Uri url = Uri.https(domain, path, parameters);
    http.Response response = await http.get(url);
    var data = json.decode(response.body);

    Weather obj = Weather.fromJson(data);

    return obj;
  }
}
