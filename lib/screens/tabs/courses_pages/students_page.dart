import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentsPage extends StatefulWidget {
  dynamic data;

  StudentsPage({
    super.key,
    required this.data,
  });

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
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
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Students').snapshots(),
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
          return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Courses')
                  .doc(widget.data.id)
                  .snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Loading'));
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                dynamic data111 = snapshot.data;
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
                          text: 'Students',
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
                    for (int i = 0; i < data.docs.length; i++)
                      Builder(builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                minRadius: 30,
                                maxRadius: 30,
                                backgroundImage:
                                    NetworkImage(data.docs[i]['img']),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: '${data.docs[i]['name']}',
                                    fontSize: 16,
                                    fontFamily: 'Bold',
                                    color: Colors.black,
                                  ),
                                  TextWidget(
                                    text:
                                        '${data.docs[i]['gradelevel']}          ${data.docs[i]['section']}',
                                    fontSize: 12,
                                    fontFamily: 'Medium',
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: SizedBox(
                                  width: 20,
                                ),
                              ),
                              Builder(builder: (context) {
                                List studs = data111['students'];
                                print(studs);
                                print(studs.contains(data.docs[i]['id']));
                                return Checkbox(
                                  value: studs.contains(data.docs[i].id)
                                      ? true
                                      : false,
                                  onChanged: (value) async {
                                    if (!studs.contains(data.docs[i].id)) {
                                      await FirebaseFirestore.instance
                                          .collection('Courses')
                                          .doc(widget.data.id)
                                          .update({
                                        'students': FieldValue.arrayUnion(
                                            [data.docs[i].id]),
                                        'studentDetails': FieldValue.arrayUnion(
                                            [data.docs[i].data()])
                                      });

                                      await FirebaseFirestore.instance
                                          .collection('Students')
                                          .doc(data.docs[i].id)
                                          .update({
                                        'class': FieldValue.arrayUnion(
                                            [widget.data.id]),
                                      });
                                    } else {
                                      print('2');
                                      await FirebaseFirestore.instance
                                          .collection('Courses')
                                          .doc(widget.data.id)
                                          .update({
                                        'students': FieldValue.arrayRemove(
                                            [data.docs[i].id]),
                                        'studentDetails':
                                            FieldValue.arrayRemove(
                                                [data.docs[i].data()])
                                      });
                                      await FirebaseFirestore.instance
                                          .collection('Students')
                                          .doc(data.docs[i].id)
                                          .update({
                                        'class': FieldValue.arrayRemove(
                                            [widget.data.id]),
                                      });
                                    }
                                  },
                                );
                              }),
                            ],
                          ),
                        );
                      }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ));
              });
        });
  }
}
