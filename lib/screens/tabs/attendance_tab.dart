import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/screens/tabs/courses_pages/open_record_page.dart';
import 'package:atieed/utlis/app_constants.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AttendanceTab extends StatelessWidget {
  const AttendanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Courses')
            .where('uid', isEqualTo: userId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          }

          final data = snapshot.requireData;
          return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Records')
                  .where('uid', isEqualTo: userId)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final recordsData = snapshot.requireData;
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text: 'Attendance',
                                fontSize: 24,
                                fontFamily: 'Bold',
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              // IconButton(
                              //   onPressed: () {},
                              //   icon: const Icon(
                              //     Icons.notifications_none_rounded,
                              //   ),
                              // ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileScreen()));
                                },
                                child: const CircleAvatar(
                                  minRadius: 15,
                                  maxRadius: 15,
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.person),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextWidget(
                            text: 'Upcoming Courses',
                            fontSize: 24,
                            color: Colors.black,
                            fontFamily: 'Bold',
                          ),
                          data.docs.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      top: 100, bottom: 100),
                                  child: Center(
                                    child: TextWidget(
                                      text: 'Your courses is empty.',
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontFamily: 'Medium',
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 400,
                                  height: 200,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        for (int i = 0;
                                            i < data.docs.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: 300,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            width: 100,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                20,
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: TextWidget(
                                                                text:
                                                                    'In Progress',
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Medium',
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      TextWidget(
                                                        text: data.docs[i]
                                                            ['semester'],
                                                        fontSize: 12,
                                                      ),
                                                      TextWidget(
                                                        align: TextAlign.start,
                                                        maxLines: 2,
                                                        text: data.docs[i]
                                                            ['name'],
                                                        fontSize: 18,
                                                        fontFamily: 'Bold',
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          TextWidget(
                                                            text: data.docs[i]
                                                                ['section'],
                                                            fontSize: 12,
                                                          ),
                                                          TextWidget(
                                                            text:
                                                                'First Semester SY 2023-2024 (SHS)',
                                                            fontSize: 12,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: 'Records',
                                  fontSize: 22,
                                  fontFamily: 'Bold',
                                ),
                              ],
                            ),
                          ),
                          data.docs.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      top: 100, bottom: 100),
                                  child: Center(
                                    child: TextWidget(
                                      text: 'Your records is empty.',
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontFamily: 'Medium',
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    for (int i = 0;
                                        i < recordsData.docs.length;
                                        i++)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Container(
                                          width: double.infinity,
                                          height: 350,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 115,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          20,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: TextWidget(
                                                          text: DateFormat.MMM()
                                                              .format(recordsData
                                                                  .docs[i][
                                                                      'dateTime']
                                                                  .toDate()),
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
                                                  text:
                                                      'Contemporary Philippine Arts from the Regions',
                                                  fontSize: 18,
                                                  fontFamily: 'Bold',
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width: 125,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.black,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          5,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: TextWidget(
                                                          text:
                                                              '${recordsData.docs[i]['timefrom']} - ${recordsData.docs[i]['timeto']}',
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontFamily: 'Medium',
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 125,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.black,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          5,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: TextWidget(
                                                          text: recordsData
                                                                  .docs[i]
                                                              ['section'],
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 75,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text:
                                                                '${recordsData.docs[i]['presents'].length}',
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Medium',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: (recordsData
                                                                        .docs[i]
                                                                            [
                                                                            'students']
                                                                        .length -
                                                                    recordsData
                                                                        .docs[i]
                                                                            [
                                                                            'presents']
                                                                        .length)
                                                                .toString(),
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Medium',
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 75,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: '0',
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Medium',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: '0',
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Medium',
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ButtonWidget(
                                                      fontSize: 14,
                                                      height: 40,
                                                      width: 150,
                                                      label: 'Open Record',
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        OpenRecordPage(
                                                                          data:
                                                                              recordsData.docs[i],
                                                                        )));
                                                      },
                                                    ),
                                                    ButtonWidget(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                      height: 40,
                                                      width: 150,
                                                      label: 'Download',
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
