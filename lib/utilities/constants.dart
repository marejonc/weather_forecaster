import 'package:flutter/material.dart';

const kApiKey = '39f2d7fd4626e0a2c88aada1471e8e24';
const kImageSourceMainURL = 'http://openweathermap.org/img/wn';
const kOpenWeatherMapMainURL = 'http://api.openweathermap.org/data/2.5/weather';

const kPinkAccentColor = Color(0xFFEB1555);

const kCityNameTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
  shadows: [kTextShadow],
);

const kTemperatureTextStyle = TextStyle(
  fontSize: 70.0,
  fontWeight: FontWeight.bold,
  shadows: [kTextShadow],
);

const kTextShadow = Shadow(
  blurRadius: 10.0,
  color: Colors.black87,
  offset: Offset(3.0, 3.0),
);

const kEldersBigTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.white70,
);

const kEldersMediumTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.white70,
);
