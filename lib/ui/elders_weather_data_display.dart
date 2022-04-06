import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecaster/utilities/constants.dart';
import '../model/weather_data.dart';
import 'widgets/single_elders_mode_info_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EldersWeatherData extends StatefulWidget {
  const EldersWeatherData({Key? key, required this.data}) : super(key: key);

  final WeatherData data;

  @override
  State<EldersWeatherData> createState() => _EldersWeatherDataState();
}

class _EldersWeatherDataState extends State<EldersWeatherData> {
  int _pressure = 0;
  String _description = '';
  String _sunrise = '';
  String _sunset = '';
  String _currentDate = '';
  String _currentTime = '';
  final DateFormat dateFormat = DateFormat('dd.MM.yyyy');
  final DateFormat hourFormat = DateFormat('HH:mm');

  void updateUI(WeatherData data) {
    _pressure = data.pressure;
    _description = data.description;
    _sunrise = hourFormat.format(data.sunrise);
    _sunset = hourFormat.format(data.sunset);
    _currentDate = dateFormat.format(data.dateAndTime);
    _currentTime = hourFormat.format(data.dateAndTime);
  }

  @override
  void initState() {
    updateUI(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleCard(
            cardChild: Center(
              child: Text(
                _description,
                style: kEldersBigTextStyle,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Expanded(
          child: Row(
            children: [
              SingleCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      FontAwesomeIcons.arrowsDownToLine,
                      size: 40.0,
                      color: Colors.white70,
                    ),
                    Text(
                      '${_pressure.toString()} hPa',
                      style: kEldersMediumTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              SingleCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _currentDate,
                      style: kEldersMediumTextStyle,
                    ),
                    Text(
                      _currentTime,
                      style: kEldersMediumTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Expanded(
          child: Row(
            children: [
              SingleCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      FontAwesomeIcons.sun,
                      size: 40.0,
                      color: Colors.white70,
                    ),
                    Text(
                      _sunrise,
                      style: kEldersMediumTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              SingleCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      FontAwesomeIcons.moon,
                      size: 40.0,
                      color: Colors.white70,
                    ),
                    Text(
                      _sunset,
                      style: kEldersMediumTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
