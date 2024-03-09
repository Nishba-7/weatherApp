import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/homepage.dart';
import 'package:weather_app/repositories/weather_repositories.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherViewModel(repository: WeatherRepository(apiKey: 'f75803be83c947cf3a656a956f67874d', baseUrl: 'https://api.openweathermap.org/')),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'CustomFont', // Make sure the custom font name is correct
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
