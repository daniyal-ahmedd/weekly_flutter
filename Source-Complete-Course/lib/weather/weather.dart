class Weather {
  double temperature = 0;
  int humidity = 0;
  int cloudCover = 0;
  String description = "";
  double windSpeed = 0;
  String cityName = "";

  Weather(this.temperature, this.humidity, this.cloudCover, this.description,
      this.windSpeed, this.cityName);

  Weather.fromJson(Map<String, dynamic> data) {
    temperature = (data['main']['temp'] - 273.15) ?? 0;
    humidity = (data['main']['humidity']) ?? 0;
    cloudCover = (data['clouds']['all']) ?? 0;
    description = (data['weather'][0]['description']) ?? "";
    windSpeed = (data['wind']['speed']) ?? 0;
    cityName = (data['name']) ?? "";
  }
}
