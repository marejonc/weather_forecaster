import 'package:flutter/material.dart';
import 'package:weather_forecaster/model/weather_data.dart';
import 'package:weather_forecaster/ui/elders_weather_data_display.dart';
import 'package:weather_forecaster/ui/regular_weather_data_display.dart';
import 'package:weather_forecaster/utilities/constants.dart';

import '../services/api_service.dart';

class WeatherDataScreen extends StatefulWidget {
  const WeatherDataScreen({Key? key, required this.locationWeather}) : super(key: key);

  final locationWeather;

  @override
  State<WeatherDataScreen> createState() => _WeatherDataScreenState();
}

class _WeatherDataScreenState extends State<WeatherDataScreen> {
  bool _isEldersModeOn = false;
  String _cityName = '';
  dynamic _retrievedData;
  WeatherData _weatherData = WeatherData(
    temperature: 0,
    iconCode: '',
    pressure: 0,
    description: '',
    sunrise: DateTime.now(),
    sunset: DateTime.now(),
    dateAndTime: DateTime.now(),
    cityName: '',
  );

  void _getWeatherObject(data) {
    _weatherData = WeatherData(
      temperature: data['main']['temp'].toInt(),
      iconCode: data['weather'][0]['icon'],
      pressure: data['main']['pressure'],
      description: data['weather'][0]['description'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(data['sys']['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(data['sys']['sunset'] * 1000),
      dateAndTime: DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000),
      cityName: data['name'],
    );
  }

  @override
  void initState() {
    _retrievedData = widget.locationWeather;
    if (_retrievedData != null) {
      _getWeatherObject(_retrievedData);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  _cityName = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(
                    Icons.location_city,
                    color: kPinkAccentColor,
                  ),
                  hintText: 'Enter City Name',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      _retrievedData = await WeatherModel.getCityWeather(_cityName);
                      setState(() {
                        _getWeatherObject(_retrievedData);
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                      color: kPinkAccentColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _weatherData.cityName,
                      style: kCityNameTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Image.network('$kImageSourceMainURL/${_weatherData.iconCode}.png'),
                    ),
                  ],
                ),
              ),
              Text(
                '${_weatherData.temperature}°C',
                style: kTemperatureTextStyle,
              ),
              Expanded(
                child: _isEldersModeOn
                    ? EldersWeatherData(
                        key: ValueKey<String>(_cityName),
                        data: _weatherData,
                      )
                    : RegularWeatherData(
                        key: ValueKey<String>(_cityName),
                        data: _weatherData,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isEldersModeOn = !_isEldersModeOn;
                    });
                  },
                  child: Text(
                    _isEldersModeOn ? 'REGULAR INTERFACE' : 'SIMPLIFIED INTERFACE',
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kPinkAccentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
