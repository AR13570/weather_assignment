import 'package:http/http.dart' as http;
import 'package:weather_assignment/api/data_models/states_model.dart';
import 'dart:convert';

class StatesApi {
  //used to call the api and parse it from json to an object of the State class
  // which is a data model from which retrieved data can be accessed
  Future<List<States>?> getState() async {
    var headers = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJ5b2xvMTM3OTBAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiNXpCNkZnbWJUaVQ5SURvdnMxWFB4VWxsSnl1MTRBYUMzakVBMGRydVZPbl9aMVRDVnpUTXJiVEVMSnBjRjc2NTNzMCJ9LCJleHAiOjE2Njk3Mjk3OTJ9.Vj2PRnwV0BgdAyG8yg6FSt5bxBLtAH7A-afK6chg5bM",
      "Accept": "application/json"
    };
    http.Response response = await http.get(
        Uri.parse(
          'https://www.universal-tutorial.com/api/states/India',
        ),
        headers: headers);
    //status code of 200 means that the request was successful
    if (response.statusCode == 200) {
      //parsing the json into Objects of State class
      var respBody = States.statesFromJson(response.body);
      return respBody;
    } else {
      //return nothing if the call to the api failed
      return null;
    }
  }
}
