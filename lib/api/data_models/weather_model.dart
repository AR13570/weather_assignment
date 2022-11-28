// this class has been made using quicktype.io
// the above website creates classes based on the response from an API

import 'dart:convert';

class WeatherInfo {
  WeatherInfo({
    required this.coord,
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
  });

  Coord coord;
  List<Weather> weather;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;

  static WeatherInfo weatherInfoFromJson(String str) =>
      WeatherInfo.fromJson(json.decode(str));

  static String weatherInfoToJson(WeatherInfo data) =>
      json.encode(data.toJson());

  factory WeatherInfo.fromJson(Map<String, dynamic> json) => WeatherInfo(
        coord: Coord.fromJson(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"] ?? "Not Available",
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"] ?? "Not Available",
        sys: Sys.fromJson(json["sys"]),
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
      };
}

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"]?.toDouble() ?? 0,
        tempMin: json["temp_min"]?.toDouble() ?? 0,
        tempMax: json["temp_max"]?.toDouble() ?? 0,
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
        seaLevel: json["sea_level"] ?? 0,
        grndLevel: json["grnd_level"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
      };
}

class Sys {
  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"] ?? "Not Available",
        sunrise: json["sunrise"] ?? 0,
        sunset: json["sunset"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] ?? 0,
        main: json["main"] ?? "Not Available",
        description: json["description"] ?? "Not Available",
        icon: json["icon"] ?? "Not Available",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double speed;
  int deg;
  double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble() ?? 0,
        deg: json["deg"] ?? 0,
        gust: json["gust"]?.toDouble() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
