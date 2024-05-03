import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OpenRecordPage extends StatefulWidget {
  const OpenRecordPage({super.key});

  @override
  State<OpenRecordPage> createState() => _OpenRecordPageState();
}

class _OpenRecordPageState extends State<OpenRecordPage> {
  final searchController = TextEditingController();
  String nameSearched = '';

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
              text: 'Records',
              fontSize: 24,
              fontFamily: 'Bold',
            ),
            const Expanded(
              child: SizedBox(),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const CircleAvatar(
              minRadius: 15,
              maxRadius: 15,
              backgroundColor: Colors.grey,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 115,
                        height: 30,
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: 'Attendance',
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 115,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: 'November',
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: '1st Semester',
                    fontSize: 12,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    maxLines: 2,
                    text: 'Contemporary Philippine Arts from the Regions',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 115,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: 'November',
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                      Container(
                        width: 115,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: '6:00 - 7:00',
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                      Container(
                        width: 115,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: '12STEMA2',
                            fontSize: 12,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: '00',
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'Medium',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: 'Present',
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: '00',
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'Medium',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: 'Absent',
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: '00',
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'Medium',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: 'Late',
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                        const SizedBox(
                          width: 75,
                        ),
                        Container(
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: '00',
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'Medium',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: 'Excuse',
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
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
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: 'Name',
                fontSize: 12,
                fontFamily: 'Regular',
              ),
              TextWidget(
                text: 'Time in        Time out',
                fontSize: 12,
                fontFamily: 'Regular',
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 225,
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
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Surname, First Name',
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
                            color: green,
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: 'Present',
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
                          text: '10:55 am',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 125,
                      height: 35,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Center(
                        child: TextWidget(
                          text: 'Mark as Present',
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Medium',
                        ),
                      ),
                    ),
                    Container(
                      width: 125,
                      height: 35,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Center(
                        child: TextWidget(
                          text: 'Mark as Absent',
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Medium',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 125,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Center(
                        child: TextWidget(
                          text: 'Mark as Excuse',
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Medium',
                        ),
                      ),
                    ),
                    Container(
                      width: 125,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Center(
                        child: TextWidget(
                          text: 'Mark as Late',
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Medium',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
