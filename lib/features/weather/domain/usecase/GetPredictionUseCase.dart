import 'package:authh/features/weather/domain/repository/weather_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPredictionUseCase{
  final WeatherRepository weatherRepo;

  GetPredictionUseCase(this.weatherRepo);

  Future<int?> call(List<int> features) {
    return weatherRepo.getPrediction(features);
  }
}