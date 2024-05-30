import 'dart:convert';
import 'package:http/http.dart' as http;
import './weather.dart';

// protocol  domainname            path parameters
// https://api.openweathermap.org/data/2.5/weather?lat=31.573152&lon=74.3078585&appid=b2ffdc51f9cf000f1d73c1d3d33ccfd9
class HttpHelper {
  String domainName = "api.openweathermap.org";
  String path = "data/2.5/weather";
  String apiKey = "b2ffdc51f9cf000f1d73c1d3d33ccfd9";
  String lat = "31.573152";
  String lon = "74.3078585";

  Future<Weather> GetWeatherOfGCU() async {
    Map<String, dynamic> parameters = {"lat": lat, "lon": lon, "appid": apiKey};
    Uri apiUrl = Uri.https(domainName, path, parameters);
    http.Response response = await http.get(apiUrl);
    Map<String, dynamic> weatherData = json.decode(response.body);
    Weather weatherObj = Weather.fromJson(weatherData);
    return weatherObj;
  }
}
