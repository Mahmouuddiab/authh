import 'package:authh/features/weather/data/model/ForecastModel.dart';
import 'package:authh/features/weather/data/model/WeatherModel.dart';

abstract class WeatherRemoteDataSource{
  Future<WeatherModel> getCurrentWeather(String cityName);
  Future<List<ForecastModel>> getForecastWeather(String cityName);
  Future<int?> getPrediction(List<int> features);
}