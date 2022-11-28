// this class has been made using quicktype.io
// the above website creates classes based on the response from an API
import 'dart:convert';

class States {
  States({
    required this.stateName,
  });

  String stateName;
  static List<States> statesFromJson(String str) =>
      List<States>.from(json.decode(str).map((x) => States.fromJson(x)));

  static String statesToJson(List<States> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory States.fromJson(Map<String, dynamic> json) => States(
        stateName: json["state_name"],
      );

  Map<String, dynamic> toJson() => {
        "state_name": stateName,
      };
}
