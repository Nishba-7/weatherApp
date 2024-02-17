
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';


class Weather{
  final String apiKey;
  final String baseUrl;

  Weather({required this.apiKey, required this.baseUrl});

  Future<Map<String, dynamic>> fetchWeatherData() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    final response = await http.get(Uri.parse('$baseUrl?lat = ${position.latitude}&log=${position.longitude}&appid=$apiKey'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw Exception('Failed to load weather data');
    }
  }

}

void main() async {

  final String apiKey = 'f75803be83c947cf3a656a956f67874d';
  final String baseUrl = 'https://api.openweathermap.org/';

  final weather = Weather(apiKey: apiKey, baseUrl: baseUrl);

  try {
    Map<String, dynamic> weatherData = await weather.fetchWeatherData();
    print(weatherData);
  } catch (e) {
    print('Error fetching weather data: $e');
  }
}