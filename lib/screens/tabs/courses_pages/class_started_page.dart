import 'dart:convert';

import 'package:atieed/screens/home_screen.dart';
import 'package:atieed/screens/profile_screen.dart';

import 'package:atieed/screens/tabs/courses_pages/gps_page.dart';
import 'package:atieed/screens/tabs/courses_pages/qr_page.dart';
import 'package:atieed/screens/tabs/courses_pages/students_page.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ClassStartedPage extends StatefulWidget {
  dynamic data;

  ClassStartedPage({super.key, required this.data});

  @override
  State<ClassStartedPage> createState() => _ClassStartedPageState();
}

class _ClassStartedPageState extends State<ClassStartedPage> {
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Padding(padding: const EdgeInsets.all(10.0), child: courseWidget()),
      ),
    );
  }

  Widget courseWidget() {
    return SingleChildScrollView(
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
            height: 20,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection('Courses')
                            .doc(widget.data.id)
                            .update({
                          'hasStarted': false,
                        });

                        await FirebaseFirestore.instance
                            .collection('Records')
                            .doc()
                            .set(widget.data.data());

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      },
                      child: Container(
                        width: 125,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: 'Stop',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.stop,
                              color: Colors.white,
                              size: 18,
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
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GPSPage(
                                data: widget.data,
                              )));
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              color: Colors.white,
                              size: 48,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              text: 'GPS',
                              fontSize: 22,
                              fontFamily: 'Bold',
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QRPage(
                                data: widget.data,
                              )));
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.qr_code,
                              color: Colors.white,
                              size: 48,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              text: 'QR Code',
                              fontSize: 22,
                              fontFamily: 'Bold',
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: DateFormat.yMMMd().format(DateTime.now()),
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 125,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: DateFormat.EEEE().format(DateTime.now()),
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Students',
                        fontSize: 22,
                        fontFamily: 'Bold',
                      ),
                      TextWidget(
                        text: 'Time',
                        fontSize: 18,
                        fontFamily: 'Bold',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Name',
                        fontSize: 12,
                        fontFamily: 'Regular',
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < widget.data['students'].length; i++)
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                minRadius: 25,
                                maxRadius: 25,
                                child: Icon(Icons.person),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: widget.data['name'],
                                    fontSize: 16,
                                    fontFamily: 'Bold',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 125,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: widget.data['presents']
                                              .contains(widget.data.id)
                                          ? green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                    child: Center(
                                      child: TextWidget(
                                        text: widget.data['presents']
                                                .contains(widget.data.id)
                                            ? 'Present'
                                            : 'Absent',
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Medium',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: DateFormat('hh:mm a')
                                        .format(DateTime.now()),
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
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
                  ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
