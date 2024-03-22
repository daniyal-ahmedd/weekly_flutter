import 'package:http/http.dart' as http;
import 'weather.dart';

class httpHelper {
 // https://api.openweathermap.org/data/2.5/weather?lat=31.573152&lon=74.3078585&appid=f0ca8d982e6f08914927ce0bf69b0972

  final String GetWeather(String lat, String lon) async {
    Map<String, dynamic> parameters = {}
    Uri url = Uri.https(domainName, path, parameters);
    http
  }
}
