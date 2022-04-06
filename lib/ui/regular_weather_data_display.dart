import 'package:flutter/material.dart';
import 'package:weather_forecaster/model/weather_data.dart';
import 'package:weather_forecaster/ui/widgets/table_view_divider.dart';
import 'widgets/single_table_info.dart';
import 'package:intl/intl.dart';

class RegularWeatherData extends StatefulWidget {
  const RegularWeatherData({Key? key, required this.data}) : super(key: key);

  final WeatherData data;

  @override
  State<RegularWeatherData> createState() => _RegularWeatherDataState();
}

class _RegularWeatherDataState extends State<RegularWeatherData> {
  int _pressure = 0;
  String _description = '';
  String _sunrise = '';
  String _sunset = '';
  String _dateAndTime = '';
  final DateFormat dateFormat = DateFormat('dd.MM.yyyy');
  final DateFormat hourFormat = DateFormat('HH:mm');

  void updateUI(WeatherData data) {
    _pressure = data.pressure;
    _description = data.description;
    _sunrise = hourFormat.format(data.sunrise);
    _sunset = hourFormat.format(data.sunset);
    _dateAndTime = '${dateFormat.format(data.dateAndTime)} ${hourFormat.format(data.dateAndTime)}';
  }

  @override
  void initState() {
    updateUI(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.black45,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SingleTableInfo(textInfo: 'Pressure'),
                  TableDivider(),
                  SingleTableInfo(textInfo: 'Description'),
                  TableDivider(),
                  SingleTableInfo(textInfo: 'Sunrise'),
                  TableDivider(),
                  SingleTableInfo(textInfo: 'Sunset'),
                  TableDivider(),
                  SingleTableInfo(textInfo: 'Date & Time'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SingleTableInfo(textInfo: '${_pressure.toString()} hPa'),
                  const TableDivider(),
                  SingleTableInfo(textInfo: _description),
                  const TableDivider(),
                  SingleTableInfo(textInfo: _sunrise),
                  const TableDivider(),
                  SingleTableInfo(textInfo: _sunset),
                  const TableDivider(),
                  SingleTableInfo(textInfo: _dateAndTime),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
