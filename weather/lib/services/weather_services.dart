import 'package:dio/dio.dart';
import 'weather_model.dart';
class WeatherService {
  final Dio dio = Dio();

  Future<WeatherModel> weatherFetch(String city) async {
    try {
      final String apikey = '953b750d00d74be5aa495420250204';
      final String url =
          'https://api.weatherapi.com/v1/current.json?key=$apikey&q=$city';
      final response = await dio.get(url);
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}