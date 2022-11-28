import 'package:http/http.dart' as http;

import '../data_models/city_model.dart';

class CityApi {
  //used to call the api and parse it from json to an object of the City class
  // which is a data model from which retrieved data can be accessed
  Future<List<City>?> getCity(String stateName) async {
    var headers = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJ5b2xvMTM3OTBAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiNXpCNkZnbWJUaVQ5SURvdnMxWFB4VWxsSnl1MTRBYUMzakVBMGRydVZPbl9aMVRDVnpUTXJiVEVMSnBjRjc2NTNzMCJ9LCJleHAiOjE2Njk3Mjk3OTJ9.Vj2PRnwV0BgdAyG8yg6FSt5bxBLtAH7A-afK6chg5bM",
      "Accept": "application/json"
    };
    http.Response response = await http.get(
        Uri.parse(
          'https://www.universal-tutorial.com/api/cities/$stateName',
        ),
        headers: headers);
    //status code of 200 means that the request was successful
    if (response.statusCode == 200) {
      //parsing the json into Objects of City class
      var respBody = City.cityFromJson(response.body);
      return respBody;
    } else {
      //return nothing if the call to the api failed
      return null;
    }
  }
}
