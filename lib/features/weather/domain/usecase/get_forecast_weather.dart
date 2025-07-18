import 'package:authh/features/weather/data/model/ForecastModel.dart';
import 'package:authh/features/weather/domain/repository/weather_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetForecastWeather{
  WeatherRepository repository;
  GetForecastWeather({required this.repository});
  Future<List<ForecastModel>> call(String cityName)async{
    return repository.getForecastWeather(cityName);
  }
}