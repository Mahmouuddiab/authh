import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName;
  final double temperatureCelsius;
  final String condition;
  final String iconUrl;
  final int humidity;

  const WeatherEntity({
    required this.cityName,
    required this.temperatureCelsius,
    required this.condition,
    required this.iconUrl,
    required this.humidity
  });

  @override
  List<Object?> get props => [cityName, temperatureCelsius, condition, iconUrl,humidity];
}