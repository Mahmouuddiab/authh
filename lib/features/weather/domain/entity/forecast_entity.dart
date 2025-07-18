import 'package:equatable/equatable.dart';

class ForecastEntity extends Equatable {
  final String condition;
  final String iconUrl;
  final double avgTemp;

   ForecastEntity({
    required this.condition,
     required this.iconUrl,
     required this.avgTemp
  });

  @override
  List<Object?> get props => [condition, iconUrl,avgTemp];
}