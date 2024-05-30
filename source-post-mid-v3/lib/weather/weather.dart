class Weather {
  String cityName = "";
  double temperature = 0;
  String description = "";
  double feels_like = 0;
  int cloudCover = 0;
  double windSpeed = 0;

  Weather(this.cityName, this.temperature, this.description, this.feels_like,
      this.cloudCover, this.windSpeed);

  Weather.fromJson(Map<String, dynamic> data) {
    cityName = data['name'] ?? "";
    temperature = (data['main']['temp'] - 273.15) ?? 0;
    feels_like = (data['main']['feels_like'] - 273.15) ?? 0;
    cloudCover = (data['clouds']['all']) ?? 0;
    windSpeed = (data['wind']['speed']) ?? 0;
    description = (data['weather'][0]['description']) ?? "";
  }
}
