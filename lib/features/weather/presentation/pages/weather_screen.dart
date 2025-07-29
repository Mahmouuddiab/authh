import 'package:authh/features/weather/data/model/ForecastModel.dart';
import 'package:authh/features/weather/presentation/bloc/forecast_bloc.dart';
import 'package:authh/features/weather/presentation/bloc/predict_cubit.dart';
import 'package:authh/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:authh/features/weather/presentation/bloc/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/weatherDi/di/weather_di.dart';


class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key? key}) : super(key: key);

  final TextEditingController _cityController = TextEditingController();

  final WeatherCubit weatherCubit = getIt<WeatherCubit>();
  final ForecastCubit forecastCubit = getIt<ForecastCubit>();
  final PredictCubit predictCubit=getIt<PredictCubit>();
  ForecastModel? forecastModel;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input Field
            TextField(
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2)),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final city = _cityController.text;
                if (city.isNotEmpty) {
                  await weatherCubit.fetchWeather(city); // first
                  await forecastCubit.getForecast(city); // then
                  List<int> features=[
                    forecastModel!.maxTemp > 40 ? 1 : 0,
                    forecastModel!.minTemp < 15 ? 1 : 0,
                    forecastModel!.conditionText.contains("rain") ? 1 : 0,
                  ];
                  await predictCubit.getPrediction(features);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              child: const Text(
                'Get Weather',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Weather BlocBuilder
            BlocBuilder<WeatherCubit, WeatherState>(
              bloc: weatherCubit,
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return const Text(
                    'Enter a city to get weather information.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  );
                } else if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherLoaded) {
                  final weather = state.weatherEntity;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(weather.cityName,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 10,),
                      Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        alignment:WrapAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("Current",style:TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white) ,),
                              Text('${weather.temperatureCelsius} °C',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Prediction",style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),),
                              Image.network(weather.iconUrl, height: 80),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text("Humidity",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              const SizedBox(height: 5),
                              Text('${weather.humidity}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Text(weather.condition,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Next 3 days forecast:",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Text('Error: ${state.message}',
                      style: const TextStyle(color: Colors.red));
                }
                return const SizedBox.shrink();
              },
            ),

            const SizedBox(height: 20),

            // Forecast BlocBuilder
            BlocBuilder<ForecastCubit, WeatherState>(
              bloc: forecastCubit,
              builder: (context, state) {
                if (state is ForecastLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ForecastLoaded) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.forecasts.length,
                    itemBuilder: (context, index) {
                      final forecast = state.forecasts[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: Image.network("http:${forecast.conditionIcon}"),
                          title: Text(forecast.date,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          subtitle: Text(
                              "${forecast.minTemp}°C - ${forecast.maxTemp}°C",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ),
                      );
                    },
                  );
                } else if (state is ForecastError) {
                  return Text(state.message,
                      style: const TextStyle(color: Colors.red));
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
