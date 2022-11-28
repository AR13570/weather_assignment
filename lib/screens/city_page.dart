import 'package:flutter/material.dart';
import 'package:weather_assignment/api/services/city_api.dart';
import 'package:weather_assignment/api/data_models/city_model.dart';
import 'weatherPage.dart';

class CityPage extends StatelessWidget {
  //the name of the selected city is required from the previous screen
  String state_name;
  CityPage({Key? key, required this.state_name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Text(
                "Districts in $state_name",
                style: const TextStyle(fontSize: 26),
              ),
              FutureBuilder<List<City>?>(
                  future: CityApi().getCity(state_name),
                  //the above function is used to perform a call to the api
                  //to receive the list of districts within the selected state
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey)),
                                  child: ListTile(
                                    title: Text(snapshot.data![index].cityName),
                                    trailing: const Icon(Icons.chevron_right),
                                    onTap: () {
                                      //go to the selected district's weather info
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WeatherPage(
                                                    city: snapshot
                                                        .data![index].cityName,
                                                  )));
                                    },
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
