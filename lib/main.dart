import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_forecaster/ui/loading_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const WeatherForecaster());
}

class WeatherForecaster extends StatelessWidget {
  const WeatherForecaster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}
