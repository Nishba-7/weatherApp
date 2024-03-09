
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final String apiKey;
  final String baseUrl;

  WeatherRepository({required this.apiKey, required this.baseUrl});

  Future<Map<String, dynamic>> fetchWeatherData(double latitude, double longitude) async {
    final url = Uri.parse('$baseUrl/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

