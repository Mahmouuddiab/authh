import 'package:authh/features/weather/domain/usecase/get_forecast_weather.dart';
import 'package:authh/features/weather/presentation/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForecastCubit extends Cubit<WeatherState>{
  final GetForecastWeather getForecastWeather;
  ForecastCubit(this.getForecastWeather):super(WeatherInitial());
  Future<void> getForecast(String cityName) async {
    emit(ForecastLoading());
    try {
      final forecasts = await getForecastWeather(cityName);
      emit(ForecastLoaded(forecasts: forecasts));
    } catch (e) {
      emit(ForecastError(message: e.toString()));
    }
  }
}