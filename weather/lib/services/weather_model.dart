class WeatherModel {
  final String conditionText;
  final String icon;
  final double tempC;

  WeatherModel({
    required this.conditionText,
    required this.icon,
    required this.tempC,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      conditionText: json['current']['condition']['text'],
      icon: 'https:${json['current']['condition']['icon']}',
      tempC: json['current']['temp_c'].toDouble(),
    );
  }
}
