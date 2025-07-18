import 'package:authh/core/exceptions/failures.dart';
import 'package:authh/features/weather/domain/entity/weather_entity.dart';
import 'package:authh/features/weather/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentWeather{
  WeatherRepository repository;
  GetCurrentWeather({required this.repository});
  Future<Either<Failure,WeatherEntity>> call(String cityName)async{
    return await repository.getCurrentWeather(cityName);
  }
}