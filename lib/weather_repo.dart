import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app_bloc/weather_model.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=f8f25b528af88c02c41b116f6560caa3");

    if (result.statusCode != 200) throw Exception();
    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded["main"];
    return WeatherModel.fromJson(jsonWeather);  
  }
}
