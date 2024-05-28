import 'package:a2v1/weather/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// https://api.openweathermap.org/data/2.5/weather?lat=31.573152&lon=74.3078585&appid=b2ffdc51f9cf000f1d73c1d3d33ccfd9
class HTTPHelper {
  String domainName = "api.openweathermap.org";
  String path = "data/2.5/weather";
  String apiKey = "b2ffdc51f9cf000f1d73c1d3d33ccfd9";
  String lat = "31.573152";
  String lon = "74.3078585";

  Future<Weather> GetWeatherOfGCU() async {
    Map<String, dynamic> parameters = {"lat": lat, "lon": lon, "appid": apiKey};

    Uri apiURL = Uri.https(domainName, path, parameters);

    http.Response response = await http.get(apiURL);

    String responseString = response.body;
    Map<String, dynamic> data = json.decode(responseString);

    Weather obj = Weather.fromJson(data);

    return obj;
  }
}
