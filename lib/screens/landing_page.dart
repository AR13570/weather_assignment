import 'package:flutter/material.dart';
import 'package:weather_assignment/api/data_models/states_model.dart';
import 'package:weather_assignment/api/services/stateApi.dart';
import 'city_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // the app bar comes with a button to navigate to the previous page by default
        appBar: AppBar(
          title: const Text(
            "Weather",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        // safe area is used to prevent data prom being displayed
        // behind the navigation bar or behind notification bar
        body: SafeArea(
          //singlechildscrollview is used to allow
          // the contents of the list to be scrollable
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "States in India",
                  style: TextStyle(fontSize: 26),
                ),
                //the future builder calls the function that calls and parses the api
                FutureBuilder<List<States>?>(
                    future:
                        StatesApi().getState(), //the above mentioned function
                    builder: (context, snapshot) {
                      //since there is some delay between calling the api
                      //and receiving a response, we display a loading animation
                      // until data is received
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          !snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        //the data is received as an Asynchronous snapshot
                        return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey)),
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data![index].stateName,
                                      ),
                                      trailing: const Icon(Icons.chevron_right),
                                      onTap: () {
                                        // go to the selected state's list of cities
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => CityPage(
                                                    state_name: snapshot
                                                        .data![index]
                                                        .stateName)));
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
        ));
  }
}
