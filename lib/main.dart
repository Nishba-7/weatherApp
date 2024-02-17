import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/homepage.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final weatherRepository;
   MyApp({super.key, this.weatherRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create:(context)=>WeatherViewModel(repository: weatherRepository),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Custom font',
        ),
        home:HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );

  }
}

