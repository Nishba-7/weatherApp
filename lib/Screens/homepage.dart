import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/weather_viewmodel.dart';
import '../widgets/error_message.dart';
import '../widgets/loading_indicator.dart';
import 'Settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
          child: const Icon(Icons.settings, color: Colors.grey),
        ),
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (weatherViewModel.isLoading) LoadingIndicator(),
            if (weatherViewModel.errorMessage.isNotEmpty)
              ErrorMessage(message: weatherViewModel.errorMessage),
            if (!weatherViewModel.isLoading &&
                weatherViewModel.errorMessage.isEmpty)
              Column(
                children: [
                  Text(
                    weatherViewModel.weatherData.location,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    weatherViewModel.weatherData.Condition,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${weatherViewModel.weatherData.temperature.toStringAsFixed(1)}°C',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>weatherViewModel .fetchWeatherData(7.9312328, 76.2673041),
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
