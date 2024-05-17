import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/screens/tabs/courses_pages/add_course_page.dart';
import 'package:atieed/screens/tabs/courses_pages/class_started_page.dart';
import 'package:atieed/screens/tabs/courses_pages/open_record_page.dart';
import 'package:atieed/screens/tabs/courses_pages/students_page.dart';
import 'package:atieed/utlis/app_constants.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CourseTab extends StatefulWidget {
  const CourseTab({super.key});

  @override
  State<CourseTab> createState() => _CourseTabState();
}

class _CourseTabState extends State<CourseTab> {
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isclicked ? courseWidget() : mainWidget()),
    );
  }

  dynamic courseData = {};

  Widget mainWidget() {
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
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextWidget(
                      text: 'Your Courses',
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
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
                Center(
                  child: ButtonWidget(
                    fontSize: 18,
                    width: 200,
                    label: 'Add Course',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddCoursePage()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < data.docs.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          courseData = data.docs[i];
                          isclicked = true;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Expanded(
                                    child: SizedBox(
                                      width: 20,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                    ),
                                    child: Center(
                                      child: TextWidget(
                                        text: 'In Progress',
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: 'Medium',
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.info,
                                    ),
                                  ),
                                ],
                              ),
                              TextWidget(
                                text: data.docs[i]['semester'],
                                fontSize: 12,
                              ),
                              TextWidget(
                                align: TextAlign.start,
                                maxLines: 2,
                                text: data.docs[i]['name'],
                                fontSize: 18,
                                fontFamily: 'Bold',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    text: data.docs[i]['section'],
                                    fontSize: 12,
                                  ),
                                  TextWidget(
                                    text: 'First Semester SY 2023-2024 (SHS)',
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
          );
        });
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
                  setState(() {
                    isclicked = false;
                  });
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              TextWidget(
                text: 'Courses',
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
                child: Icon(Icons.person),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                TextWidget(
                  text: courseData['semester'],
                  fontSize: 18,
                  fontFamily: 'Medium',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                  maxLines: 2,
                  text: courseData['name'],
                  fontSize: 28,
                  fontFamily: 'Bold',
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Wrap(
                    children: [
                      for (int i = 0; i < courseData['days'].length; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
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
                                text: courseData['days'][i],
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Medium',
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 125,
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
                          text:
                              '${courseData['timefrom']} - ${courseData['timeto']}',
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
                          text: courseData['section'],
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
                GestureDetector(
                  onTap: () async {
                    await FirebaseFirestore.instance
                        .collection('Courses')
                        .doc(courseData.id)
                        .update({
                      'hasStarted': true,
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ClassStartedPage(
                              data: courseData,
                            )));
                  },
                  child: Container(
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
                        text: 'Start Class',
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'Medium',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 75,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'Present',
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Bold',
                            ),
                            Center(
                              child: TextWidget(
                                text: courseData['presents'].length.toString(),
                                fontSize: 28,
                                color: Colors.white,
                                fontFamily: 'Bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 75,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'Absent',
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Bold',
                            ),
                            Center(
                              child: TextWidget(
                                text: (courseData['students'].length -
                                        courseData['presents'].length)
                                    .toString(),
                                fontSize: 28,
                                color: Colors.white,
                                fontFamily: 'Bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'Late',
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Bold',
                            ),
                            Center(
                              child: TextWidget(
                                text: '0',
                                fontSize: 28,
                                color: Colors.white,
                                fontFamily: 'Bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'Excuse',
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Bold',
                            ),
                            Center(
                              child: TextWidget(
                                text: '0',
                                fontSize: 28,
                                color: Colors.white,
                                fontFamily: 'Bold',
                              ),
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: 'Download Attendance Record',
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Medium',
                      ),
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
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
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 20),
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
                          for (int i = 0; i < recordsData.docs.length; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                width: double.infinity,
                                height: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 115,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: green,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: Center(
                                              child: TextWidget(
                                                text: DateFormat.MMM().format(
                                                    recordsData.docs[i]
                                                            ['dateTime']
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
                                          IconButton(
                                            onPressed: () async {
                                              await FirebaseFirestore.instance
                                                  .collection('Records')
                                                  .doc(recordsData.docs[i].id)
                                                  .delete();
                                            },
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
                                        text: recordsData.docs[i]['semester'],
                                        fontSize: 12,
                                      ),
                                      TextWidget(
                                        align: TextAlign.start,
                                        maxLines: 2,
                                        text: recordsData.docs[i]['name'],
                                        fontSize: 18,
                                        fontFamily: 'Bold',
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 125,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                                  BorderRadius.circular(
                                                5,
                                              ),
                                            ),
                                            child: Center(
                                              child: TextWidget(
                                                text: recordsData.docs[i]
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
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 75,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: green,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  5,
                                                ),
                                              ),
                                              child: Center(
                                                child: TextWidget(
                                                  text: recordsData
                                                      .docs[i]['presents']
                                                      .length
                                                      .toString(),
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  5,
                                                ),
                                              ),
                                              child: Center(
                                                child: TextWidget(
                                                  text: (recordsData
                                                              .docs[i]
                                                                  ['students']
                                                              .length -
                                                          recordsData
                                                              .docs[i]
                                                                  ['presents']
                                                              .length)
                                                      .toString(),
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 75,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(
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
                                                borderRadius:
                                                    BorderRadius.circular(
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ButtonWidget(
                                            fontSize: 14,
                                            height: 40,
                                            width: 150,
                                            label: 'Open Record',
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OpenRecordPage(
                                                            data: recordsData
                                                                .docs[i],
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
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Students',
                        fontSize: 22,
                        fontFamily: 'Bold',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              isclicked = false;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StudentsPage(
                                      data: courseData,
                                    )));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          label: TextWidget(
                            text: 'Edit',
                            fontSize: 14,
                            fontFamily: 'Medium',
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                for (int i = 0; i < courseData['students'].length; i++)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundImage: NetworkImage(
                              courseData['studentDetails'][i]['img']),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: courseData['studentDetails'][i]['name'],
                              fontSize: 16,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            ),
                            TextWidget(
                              text:
                                  '${courseData['studentDetails'][i]['gradelevel']}         ${courseData['studentDetails'][i]['section']}',
                              fontSize: 12,
                              fontFamily: 'Medium',
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
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
