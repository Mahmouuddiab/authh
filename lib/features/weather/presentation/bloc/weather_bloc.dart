import 'package:authh/features/weather/domain/usecase/get_current_weather.dart';
import 'package:authh/features/weather/domain/usecase/get_forecast_weather.dart';
import 'package:authh/features/weather/presentation/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final GetCurrentWeather getCurrentWeather;
  final GetForecastWeather getForecastWeather;

  WeatherCubit({required this.getCurrentWeather,required this.getForecastWeather}) : super(WeatherInitial());


  Future<void> fetchWeather(String cityName) async {
    emit(WeatherLoading());
    final response = await getCurrentWeather(cityName);
    return response.fold(
        (l) {
          emit(WeatherError(message: l.message));
        },
        (r) {
          emit(WeatherLoaded(weatherEntity: r));
        },
    ) ;
  }

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