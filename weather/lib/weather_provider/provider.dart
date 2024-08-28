import 'package:flutter/cupertino.dart';
import '../services/weather_model.dart';
import '../services/weather_services.dart';

class WeatherProvider with ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  WeatherModel? _weather;
  String _city = "London";

  WeatherModel? get weather => _weather;
  String get city => _city;
  Future<void> fetchWeather(String city) async {
    _city = city;
    try {
      _weather = await WeatherService().weatherFetch(city);
      notifyListeners();
    } catch (e) {
      // Handle error
      _weather = null;
      notifyListeners();
    }
  }
}