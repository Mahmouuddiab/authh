import 'package:authh/core/exceptions/failures.dart';
import 'package:authh/features/weather/data/model/ForecastModel.dart';
import 'package:authh/features/weather/domain/entity/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository{
  Future<Either<Failure,WeatherEntity>> getCurrentWeather(String cityName);
  Future<List<ForecastModel>> getForecastWeather(String cityName);
  Future<int?> getPrediction(List<int> features);
}