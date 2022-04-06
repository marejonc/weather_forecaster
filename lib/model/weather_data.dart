class WeatherData {
  WeatherData({
    required this.temperature,
    required this.iconCode,
    required this.pressure,
    required this.description,
    required this.sunrise,
    required this.sunset,
    required this.dateAndTime,
    required this.cityName,
  });

  final String cityName;
  final String iconCode;
  final int temperature;
  final int pressure;
  final String description;
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime dateAndTime;
}
