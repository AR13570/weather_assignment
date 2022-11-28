import 'package:http/http.dart' as http;

import 'package:weather_assignment/api/data_models/weather_model.dart';

class WeatherApi {
  Future<dynamic> getWeather(String city) async {
    http.Response response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=f5c9e777d03741557aea5898b3dab060&units=metric',
      ),
    );

    if (response.statusCode == 200) {
      //parsing the json into Objects of Weather class
      var respBody = WeatherInfo.weatherInfoFromJson(response.body);
      return respBody;
    } else {
      //return this if the call to the api failed
      return "no data";
    }
  }
}
