class PredictionModel{
  final String city;
  final double temp;
  final int humidity;
  final double wind;
  final String prediction;

  PredictionModel({
  required this.city,
  required this.temp,
  required this.humidity,
  required this.wind,
  required this.prediction,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
  return PredictionModel(
  city: json['city'],
  temp: json['input']['temp'].toDouble(),
  humidity: json['input']['humidity'],
  wind: json['input']['wind_kph'].toDouble(),
  prediction: json['prediction'],
  );
  }

}