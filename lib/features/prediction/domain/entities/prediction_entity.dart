import 'package:equatable/equatable.dart';

class PredictionEntity extends Equatable {
  final String city;
  final double temp;
  final int humidity;
  final double wind;
  final String prediction;

  const PredictionEntity({
    required this.city,
    required this.temp,
    required this.humidity,
    required this.wind,
    required this.prediction
  });

  @override
  List<Object?> get props => [city, temp, humidity, wind,prediction];
}