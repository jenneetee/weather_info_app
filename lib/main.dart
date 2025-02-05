import 'dart:math'; // For generating random values
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
  List<Map<String, String>> sevenDayForecast = [];

  void fetchWeather() {
    setState(() {
      city = _cityController.text;
      temperature =
          '${Random().nextInt(16) + 15}°C'; // Random temperature between 15 and 30°C
      weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
    });
  }

  void fetchSevenDayForecast() {
    setState(() {
      sevenDayForecast = List.generate(7, (index) {
        // Simulating data for each day
        String day = 'Day ${index + 1}';
        String temp = '${Random().nextInt(16) + 15}°C';
        String condition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
        return {'day': day, 'temp': temp, 'condition': condition};
      });
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
            ElevatedButton(
              onPressed: fetchSevenDayForecast,
              child: Text('Fetch 7-Day Forecast'),
            ),
            SizedBox(height: 20),
            if (city.isNotEmpty) ...[
              Text(
                'City: $city',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Temperature: $temperature',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Weather: $weatherCondition',
                style: TextStyle(fontSize: 18),
              ),
            ],
            SizedBox(height: 20),
            if (sevenDayForecast.isNotEmpty) ...[
              Text(
                '7-Day Forecast:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sevenDayForecast.length,
                itemBuilder: (context, index) {
                  var dayForecast = sevenDayForecast[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(dayForecast['day']!),
                      subtitle: Text(
                          'Temp: ${dayForecast['temp']}, Condition: ${dayForecast['condition']}'),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
