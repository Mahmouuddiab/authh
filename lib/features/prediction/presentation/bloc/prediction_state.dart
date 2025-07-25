import 'package:authh/features/prediction/data/model/prediction_model.dart';

abstract class PredictionState{}
 class PredictionInitial extends PredictionState{}

 class PredictionLoading extends PredictionState{}
 class PredictionLoaded extends PredictionState{
  PredictionModel model;
  PredictionLoaded(this.model);
 }
 class PredictionError extends PredictionState{
  String message;
  PredictionError(this.message);
 }