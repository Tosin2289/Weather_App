import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app/constant/image_string.dart';
import 'package:weather_app/src/controller/weather_controller.dart';
import 'package:weather_app/src/views/home_page.dart';
import 'package:weather_app/src/views/utils/location_tile.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  String getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return WImages.thunder;
    } else if (code >= 300 && code < 400) {
      return WImages.rain;
    } else if (code >= 500 && code < 600) {
      return WImages.rainstorm;
    } else if (code >= 600 && code < 700) {
      return WImages.snow;
    } else if (code >= 700 && code < 800) {
      return WImages.mist;
    } else if (code == 800) {
      return WImages.sun;
    } else if (code > 800 && code <= 804) {
      return WImages.cloud;
    } else {
      return WImages.coolbreez;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(WeatherController());

    var location1 = controllers.getWeather("Lagos");
    var location2 = controllers.getWeather("Abuja");
    var location3 = controllers.getWeather("Ibadan");
    var location4 = controllers.getWeather("Ojoto");
    var location5 = controllers.getWeather("Kano");
    var location6 = controllers.getWeather("Aba");
    var location7 = controllers.getWeather("Onitsha");
    var location8 = controllers.getWeather("Benin City");
    var location9 = controllers.getWeather("Sokoto");
    var location10 = controllers.getWeather("Apapa");
    var location11 = controllers.getWeather("Bida");
    var location12 = controllers.getWeather("Owerri");
    var location13 = controllers.getWeather("Minna");
    var location14 = controllers.getWeather("Osogbo");
    var location15 = controllers.getWeather("Maiduguri");

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.purple),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.pink.shade200),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 300,
              width: 600,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade700, shape: BoxShape.rectangle),
            ),
          ),
          BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 100.0,
                sigmaY: 100.0,
              ),
              child: Container()),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child:
                                  const Center(child: Icon(Icons.arrow_back)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Back",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(children: [
                      Center(
                          child: Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 30,
                      )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Select Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          FutureBuilder(
                            future: location1,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Lagos",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location2,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Abuja",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location3,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Ibadan",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location4,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Ojoto",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location5,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Kano",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location6,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Aba",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location7,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Onitsha",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location8,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Benin City",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location9,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Sokoto",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location10,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Apapa",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location11,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Bida",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location12,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Owerri",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location13,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Minna",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location14,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Osogbo",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                          const Divider(
                            thickness: .5,
                            color: Colors.white24,
                          ),
                          FutureBuilder(
                            future: location15,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!;
                                return LocationTile(
                                    onTap: () {
                                      Get.to(() => HomePage(
                                            locate: data.areaName,
                                          ));
                                    },
                                    location:
                                        data.areaName.toString().toUpperCase(),
                                    icon: getWeatherIcon(
                                        data.weatherConditionCode!),
                                    condition: data.weatherMain!.toUpperCase(),
                                    temperature:
                                        '${data.temperature!.celsius!.round()}℃');
                              } else {
                                return LocationTile(
                                    location: "Maiduguri",
                                    icon: WImages.snow,
                                    condition: "",
                                    temperature: "");
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 29,
            right: 0,
            child: Image.asset(
              WImages.snow,
              height: 150,
              width: 150,
            ),
          )
        ],
      ),
    );
  }
}
