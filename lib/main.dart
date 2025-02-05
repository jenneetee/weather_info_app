import 'dart:math'; // Add this for generating random values
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: WeatherInfoApp(),
      ),
    );
  }
}

class WeatherInfoApp extends StatefulWidget {
  @override
  _WeatherInfoAppState createState() => _WeatherInfoAppState();
}

class _WeatherInfoAppState extends State<WeatherInfoApp> {
  final _cityController = TextEditingController();
  String city = '';
  String temperature = '';
  String weatherCondition = '';

  void fetchWeather() {
    setState(() {
      city = _cityController.text;
      temperature =
          '${Random().nextInt(16) + 15}°C'; // Random temperature between 15 and 30°C
      weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(hintText: 'Enter city name'),
            ),
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Fetch Weather'),
            ),
            Text('City: $city'),
            Text('Temperature: $temperature'),
            Text('Weather: $weatherCondition'),
          ],
        ),
      ),
    );
  }
}
