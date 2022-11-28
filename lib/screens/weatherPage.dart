import 'package:flutter/material.dart';
import 'package:weather_assignment/api/services/weather_api.dart';

class WeatherPage extends StatelessWidget {
  String city;
  WeatherPage({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          city,
          style: const TextStyle(fontSize: 33),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: FutureBuilder<dynamic>(
              future: WeatherApi().getWeather(city),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  /*since different APIs have been used to obtain the
                   list of districts and the weather in a particular district
                   there may be some incompatibilities in the names of districts
                   and its corresponding weather.
                   So within the weatherApi I've made the .getWeather() method
                   return a string 'no data' in case the request faced an issue
                  */
                  if (snapshot.data is String) {
                    return const Center(
                        child: Text("Data Unavailable for this location",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 25)));
                  } else {
                    //if the request was a success and data was returned
                    return Center(
                      /* display relevant weather details like:
                        weather condition, temp, mintemp, maxtemp, humidity, and pressure

                        Additional information exists within the WeatherInfo class
                        and can be used if needed
                       */
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${snapshot.data!.main.temp}°C",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 70),
                          ),
                          Text(
                            snapshot.data!.weather[0].main.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 23),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Max Temp:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17)),
                                  Text("${snapshot.data!.main.tempMax}°C",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Min Temp:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17)),
                                  Text("${snapshot.data!.main.tempMin}°C",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Pressure:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17)),
                                  Text("${snapshot.data!.main.pressure}hPa",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Humidity:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17)),
                                  Text("${snapshot.data!.main.humidity}%",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                }
              }),
        ),
      ),
    );
  }
}
