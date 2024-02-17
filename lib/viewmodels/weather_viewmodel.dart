

import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather.dart';

class WeatherViewModel extends ChangeNotifier{
  final  repository ;
  late  Weather weatherData = Weather(location: '', temperature: 0, Condition: '');
  bool isLoading = false;
  String errorMessage = '';

  WeatherViewModel({required this.repository});

  Future<void> fetchWeatherData() async {
    isLoading = true;
    notifyListeners();

    try{
      final data = await repository .fetchWeatherData();
      weatherData = Weather(
        location:'${data['name']},${data['sys']['country']}',
        Condition :data ['weather'][0]['main'],
        temperature: data ['main']['temp'],
      );
      errorMessage = '';
    }catch (e){
      print('Error fetching weather data: $e');
      errorMessage = 'Error on fetching weather data';
    }
    isLoading =true;
    notifyListeners();
  }
}
