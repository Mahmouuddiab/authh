

import 'package:authh/features/weather/data/model/ForecastModel.dart';
import 'package:authh/features/weather/domain/entity/weather_entity.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}
class WeatherLoaded extends WeatherState {
  final WeatherEntity weatherEntity;
   WeatherLoaded({required this.weatherEntity});

}
class WeatherError extends WeatherState {
  final String message;

   WeatherError({required this.message});


}

class ForecastLoading extends WeatherState{}
class ForecastLoaded extends WeatherState{
  List<ForecastModel> forecasts;
  ForecastLoaded({required this.forecasts});
}
class ForecastError extends WeatherState{
  String message;
  ForecastError({required this.message});
}

