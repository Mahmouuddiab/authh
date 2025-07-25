import 'package:authh/features/prediction/data/model/prediction_model.dart';

abstract class PredictionRemoteDataSource{
  Future<PredictionModel> getPrediction(String city);
}