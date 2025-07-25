import 'package:authh/features/prediction/data/model/prediction_model.dart';
import 'package:authh/features/prediction/domain/usecases/get_prediction_usecase.dart';
import 'package:authh/features/prediction/presentation/bloc/prediction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PredictionCubit extends Cubit<PredictionState> {
  final GetPredictionUseCase getPredictionUseCase;

  PredictionCubit(this.getPredictionUseCase) : super(PredictionInitial());

  Future<void> fetchPrediction(String city) async {
    emit(PredictionLoading());
    try {
      final weather = await getPredictionUseCase(city);
      emit(PredictionLoaded(weather as PredictionModel));
    } catch (e) {
      emit(PredictionError("Failed to load prediction"));
    }
  }
}
