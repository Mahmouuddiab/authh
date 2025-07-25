import 'package:authh/core/exceptions/failures.dart';
import 'package:authh/features/prediction/domain/entities/prediction_entity.dart';
import 'package:authh/features/prediction/domain/repositories/prediction_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPredictionUseCase {
  final PredictionRepository repository;

  GetPredictionUseCase(this.repository);

  Future<Either<Failure, PredictionEntity>> call(String city) {
    return repository.getPrediction(city);
  }
}
