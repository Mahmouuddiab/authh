class ForecastModel {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String conditionIcon;
  final String conditionText;

  ForecastModel({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.conditionIcon,
    required this.conditionText,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    final day = json['day'];
    return ForecastModel(
      date: json['date'],
      maxTemp: day['maxtemp_c'],
      minTemp: day['mintemp_c'],
      conditionIcon: day['condition']['icon'],
      conditionText: day['condition']['text'],
    );
  }
}
