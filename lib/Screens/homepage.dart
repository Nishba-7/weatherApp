import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/Settings.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';
import '../widgets/error_message.dart';
import '../widgets/loading_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading:  GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage()));
          },
            child: Icon(Icons.settings,color: Colors.grey,)),
        title: Text('Weather App',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (weatherViewModel.isLoading) LoadingIndicator(),
          if (weatherViewModel.errorMessage.isNotEmpty)
            ErrorMessage(message: weatherViewModel.errorMessage),
          if (!weatherViewModel.isLoading &&
              weatherViewModel.errorMessage.isEmpty)
            Column(
              children: [
                Text(
                  '${weatherViewModel.weatherData.location}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  '${weatherViewModel.weatherData.Condition}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${weatherViewModel.weatherData.temperature.toString()}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )
        ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => weatherViewModel.fetchWeatherData(),
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
