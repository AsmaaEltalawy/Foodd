import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure this is imported correctly
import '../services/weather_model.dart';
import '../weather_provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    super.initState();
    // Initial fetch of weather for the default city
    Provider.of<WeatherProvider>(context, listen: false).fetchWeather("London");
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    WeatherModel? weather = provider.weather;

    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField to enter city name
            TextField(
              controller: provider.controller,
              decoration: InputDecoration(labelText: 'Enter city'),
              onSubmitted: (value) {
                // Call the method to fetch weather for the entered city
                provider.fetchWeather(value);
              },
            ),
            SizedBox(height: 20),
            // If weather data is null, show a loading indicator
            if (weather == null)
              CircularProgressIndicator()
            else
              Column(
                children: [
                  Text(
                    weather.conditionText,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Image.network(weather.icon),
                  SizedBox(height: 10),
                  Text(
                    '${weather.tempC}°C',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

