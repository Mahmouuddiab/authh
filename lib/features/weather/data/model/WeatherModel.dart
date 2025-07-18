import 'package:authh/features/weather/domain/entity/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.cityName,
    required super.temperatureCelsius,
    required super.condition,
    required super.iconUrl,
    required super.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      temperatureCelsius: json['current']['temp_c'].toDouble(),
      condition: json['current']['condition']['text'],
      iconUrl: 'https:${json['current']['condition']['icon']}',
      humidity: json['current']['humidity'],
    );
  }
}
