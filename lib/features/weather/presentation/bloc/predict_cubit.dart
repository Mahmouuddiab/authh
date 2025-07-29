import 'package:authh/features/weather/domain/usecase/GetPredictionUseCase.dart';
import 'package:authh/features/weather/presentation/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PredictCubit extends Cubit<WeatherState>{
  GetPredictionUseCase getPredictionUseCase;
  PredictCubit(this.getPredictionUseCase):super(WeatherInitial());
  Future<int?> getPrediction(List<int> features)async{
    emit(PredictionLoading());
    try{
      final response= await getPredictionUseCase.call(features);
      emit(PredictionLoaded());
    }catch(e){
      emit(PredictionError());
    }
  }
}