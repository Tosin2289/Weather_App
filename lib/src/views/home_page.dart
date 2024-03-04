// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/constant/image_string.dart';
import 'package:weather_app/src/controller/weather_controller.dart';
import 'package:weather_app/src/views/current_location_page.dart';
import 'package:weather_app/src/views/loacation_screens.dart';
import 'package:weather_app/src/views/utils/weather_tile_1.dart';
import 'package:weather_app/src/views/utils/weather_tile_2.dart';

class HomePage extends StatefulWidget {
  final String? locate;
  const HomePage({
    Key? key,
    this.locate,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return Image.asset(
        WImages.thunder,
        height: 300,
      );
    } else if (code >= 300 && code < 400) {
      return Image.asset(
        WImages.rain,
        height: 300,
      );
    } else if (code >= 500 && code < 600) {
      return Image.asset(
        WImages.rainstorm,
        height: 300,
      );
    } else if (code >= 600 && code < 700) {
      return Image.asset(
        WImages.snow,
        height: 300,
      );
    } else if (code >= 700 && code < 800) {
      return Image.asset(
        WImages.mist,
        height: 300,
      );
    } else if (code == 800) {
      return Image.asset(
        WImages.sun,
        height: 300,
      );
    } else if (code > 800 && code <= 804) {
      return Image.asset(
        WImages.cloud,
        height: 300,
      );
    } else {
      return Image.asset(
        WImages.coolbreez,
        height: 300,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(WeatherController());
    var location = controllers.getWeather(widget.locate ?? "Lagos");
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: FutureBuilder(
          future: location,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(25),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(6, -0.3),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.deepPurple),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-8, -0.3),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.deepPurple),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, -1.2),
                        child: Container(
                          height: 300,
                          width: 600,
                          decoration: const BoxDecoration(color: Colors.orange),
                        ),
                      ),
                      BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100),
                          child: Container()),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: Text(
                                          '📍${snapshot.data.areaName.toUpperCase()}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const Text(
                                        'Good day',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const CurrentLocationPage();
                                            },
                                          ));
                                        },
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const CurrentLocationPage();
                                              },
                                            ));
                                          },
                                          icon: const Icon(
                                            Iconsax.location,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Center(
                                child: getWeatherIcon(
                                    snapshot.data.weatherConditionCode!),
                              ),
                              Center(
                                child: Text(
                                  '${snapshot.data.temperature!.celsius.round()}℃',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 55,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Center(
                                child: Text(
                                  snapshot.data.weatherMain!.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Center(
                                child: Text(
                                  DateFormat('EEEE dd •')
                                      .add_jm()
                                      .format(snapshot.data.date!),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Get.to(const LocationsPage());
                                  },
                                  child: ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const LinearGradient(colors: [
                                      Colors.purple,
                                      Colors.orange
                                    ]).createShader(
                                      Rect.fromLTWH(
                                          0, 0, bounds.width, bounds.height),
                                    ),
                                    child: const Text(
                                      "Change Location",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WeatherTile1(
                                    image: WImages.sunicon,
                                    time: DateFormat()
                                        .add_jm()
                                        .format(snapshot.data.sunrise!),
                                    title: 'Sunrise',
                                  ),
                                  WeatherTile1(
                                    image: WImages.moonicon,
                                    time: DateFormat()
                                        .add_jm()
                                        .format(snapshot.data.sunset!),
                                    title: 'Sunset',
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.0),
                                child: Divider(
                                  color: Colors.transparent,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WeatherTile2(
                                    image: WImages.hottemp,
                                    subtitle:
                                        '${snapshot.data.tempMax!.celsius!.round().toString()} ℃',
                                    title: 'Temp max',
                                  ),
                                  WeatherTile2(
                                    image: WImages.cooltemp,
                                    subtitle:
                                        '${snapshot.data.tempMin!.celsius!.round().toString()} ℃',
                                    title: 'Temp Min',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepOrange.shade100,
                ),
              );
            }
          }),
    );
  }
}
