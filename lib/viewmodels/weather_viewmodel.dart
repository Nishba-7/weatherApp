import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather.dart';

import '../repositories/weather_repositories.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository repository;
  Weather weatherData = Weather(location: '', temperature: 0,Condition: '');
  bool isLoading = false;
  String errorMessage = '';

  WeatherViewModel({required this.repository});

  Future<void> fetchWeatherData(double latitude , double longitude) async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await repository.fetchWeatherData(latitude,longitude);
      weatherData = Weather(
        location: '${data['name']}, ${data['sys']['country']}',
        Condition:data['weather'][0]['main'],
        temperature: data['main']['temp'].toDouble(),
      );
      errorMessage = '';
    } catch (e) {
      print('Error fetching weather data: $e');
      errorMessage = 'Error fetching weather data:$e';
    }

    isLoading = false;
    notifyListeners();
  }
}

