import 'package:authh/core/exceptions/exceptions.dart';
import 'package:authh/core/exceptions/failures.dart';
import 'package:authh/features/weather/data/data_source/weather_remote_data_source.dart';
import 'package:authh/features/weather/data/model/ForecastModel.dart';
import 'package:authh/features/weather/domain/entity/weather_entity.dart';
import 'package:authh/features/weather/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;


  WeatherRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName) async {
      try {
        final response = await remoteDataSource.getCurrentWeather(cityName);
        return Right(response);
      }
      on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
      on NetworkException catch (e) {
        return Left(NetworkFailure(e.message));
      }

  }

  @override
  Future<List<ForecastModel>> getForecastWeather(String cityName)async{
    return remoteDataSource.getForecastWeather(cityName) ;
    }
  }

