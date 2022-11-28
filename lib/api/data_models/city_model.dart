// this class has been made using quicktype.io
// the above website creates classes based on the response from an API

import 'dart:convert';

class City {
  City({
    required this.cityName,
  });
  static List<City> cityFromJson(String str) =>
      List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

  static String cityToJson(List<City> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  String cityName;

  factory City.fromJson(Map<String, dynamic> json) => City(
        cityName: json["city_name"],
      );

  Map<String, dynamic> toJson() => {
        "city_name": cityName,
      };
}
