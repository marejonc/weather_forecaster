import 'package:weather_forecaster/services/location.dart';
import 'package:weather_forecaster/services/networking.dart';
import 'package:weather_forecaster/utilities/constants.dart';

class WeatherModel {
  static Future<dynamic> getCityWeather(String cityName) async {
    NetworkingService networkingService =
        NetworkingService('$kOpenWeatherMapMainURL?q=$cityName&units=metric&APPID=$kApiKey');

    var weatherData = await networkingService.getData();
    return weatherData;
  }

  static Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkingService networkingService = NetworkingService(
        '$kOpenWeatherMapMainURL?lat=${location.latitude}&lon=${location.longitude}&units=metric&APPID=$kApiKey');

    var weatherData = await networkingService.getData();
    return weatherData;
  }
}
