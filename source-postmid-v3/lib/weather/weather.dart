class Weather {
  String cityName = "";
  double temperature = 0;
  int cloudCover = 0;
  int windSpeed = 0;
  int humidity = 0;
  String description = "";

  Weather(this.cityName, this.temperature, this.cloudCover, this.windSpeed,
      this.humidity, this.description);

  Weather.fromJson(Map<String, dynamic> data) {
    cityName = data['name'] ?? "";
    temperature = (data['main']['temp'] - 273.15) ?? 0;
    cloudCover = data['clouds']['all'] ?? 0;
    windSpeed = (data['wind']['speed']) ?? 0;
    humidity = data['main']['humidity'] ?? 0;
    description = data['weather'][0]['description'] ?? "";
  }
}
