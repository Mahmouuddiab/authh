import 'package:authh/core/exceptions/failures.dart';
import 'package:authh/features/prediction/domain/entities/prediction_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PredictionRepository{
  Future<Either<Failure,PredictionEntity>> getPrediction(String city);
}