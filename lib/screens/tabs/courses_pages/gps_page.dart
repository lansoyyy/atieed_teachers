import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GPSPage extends StatelessWidget {
  const GPSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  TextWidget(
                    text: 'Class Started',
                    fontSize: 24,
                    fontFamily: 'Bold',
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    width: 125,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'Live',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      text: '1st Semester',
                      fontSize: 18,
                      fontFamily: 'Medium',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      maxLines: 2,
                      text: 'Contemporary Philippine Arts from the Regions',
                      fontSize: 28,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Center(
                        child: TextWidget(
                          text: 'In Progress',
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Medium',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: FlutterMap(
                          options: const MapOptions(
                            zoom: 18,
                            center: LatLng(14.110739, 121.550554),
                            minZoom: 1,
                            maxZoom: 18,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextWidget(
                                  text: 'You',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Medium',
                                ),
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: primary,
                            ),
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextWidget(
                                  text: 'Students',
                                  fontSize: 14,
                                  color: primary,
                                  fontFamily: 'Medium',
                                ),
                                Icon(
                                  Icons.location_on_rounded,
                                  color: primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    )));
  }
}
