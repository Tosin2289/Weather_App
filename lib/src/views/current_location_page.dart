import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:weather_app/constant/image_string.dart';
import 'package:weather_app/src/controller/weather_controller.dart';
import 'package:weather_app/src/views/utils/weather_tile_1.dart';
import 'package:weather_app/src/views/utils/weather_tile_2.dart';

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({super.key});

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  Widget getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return Image.asset(WImages.thunder);
    } else if (code >= 300 && code < 400) {
      return Image.asset(WImages.rain);
    } else if (code >= 500 && code < 600) {
      return Image.asset(WImages.rainstorm);
    } else if (code >= 600 && code < 700) {
      return Image.asset(WImages.snow);
    } else if (code >= 700 && code < 800) {
      return Image.asset(WImages.mist);
    } else if (code == 800) {
      return Image.asset(WImages.sun);
    } else if (code > 800 && code <= 804) {
      return Image.asset(WImages.cloud);
    } else {
      return Image.asset(WImages.coolbreez);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(WeatherController());
    var location = controllers.getWeather(controllers.getCurrentCity());
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
                              shape: BoxShape.circle, color: Colors.purple),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-8, -0.3),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.purple),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, -1.2),
                        child: Container(
                          height: 300,
                          width: 600,
                          decoration:
                              BoxDecoration(color: Colors.deepPurple.shade800),
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
                              getWeatherIcon(
                                  snapshot.data.weatherConditionCode!),
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
                                height: 5,
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
