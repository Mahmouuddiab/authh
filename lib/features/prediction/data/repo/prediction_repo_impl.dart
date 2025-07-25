import 'package:authh/core/exceptions/exceptions.dart';
import 'package:authh/core/exceptions/failures.dart';
import 'package:authh/features/prediction/data/data_source/prediction_remote_data_source.dart';
import 'package:authh/features/prediction/domain/entities/prediction_entity.dart';
import 'package:authh/features/prediction/domain/repositories/prediction_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:PredictionRepository )
class PredictionRepoImpl implements PredictionRepository{
  PredictionRemoteDataSource predictionRemoteDataSource;
  PredictionRepoImpl({required this.predictionRemoteDataSource});
  @override
  Future<Either<Failure,PredictionEntity>> getPrediction(String city)async{
    try {
      final response = await predictionRemoteDataSource.getPrediction(city);
      return Right(response as PredictionEntity);
    }
    on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
    on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }
  
}