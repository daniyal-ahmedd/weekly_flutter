class Weather {
  String city = "";
  double temp = 0;
  int cloudStatus = 0;
  int wind_speed = 0;
  int humidity = 0;
  String description = "";

  Weather(this.city, this.temp, this.cloudStatus, this.wind_speed,
      this.humidity, this.description);

  Weather.fromJson(Map<String, dynamic> data) {
    city = data['name'] ?? "";
    temp = data['main']['temp'] ?? 0;
    cloudStatus = data['clouds']['all'] ?? 0;
    wind_speed = data['wind']['speed'] ?? 0;
    humidity = data['main']['humidity'] ?? 0;
    description = data['weather'][0]['description'] ?? "";
  }
}
