import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addCourse(name, section, semester, days, timefrom, timeto) async {
  final docUser = FirebaseFirestore.instance.collection('Courses').doc();

  final json = {
    'name': name,
    'section': section,
    'semester': semester,
    'days': days,
    'timefrom': timefrom,
    'timeto': timeto,
    'dateTime': DateTime.now(),
    'uid': FirebaseAuth.instance.currentUser!.uid,
    'students': [],
    'studentDetails': [],
    'present': [],
    'late': [],
    'absent': [],
    'excuse': [],
  };

  await docUser.set(json);
}
