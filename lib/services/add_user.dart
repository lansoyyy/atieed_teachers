import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(
    email, inst, name, bdate, gradelevel, studentnumber, id, img) async {
  final docUser = FirebaseFirestore.instance
      .collection('Teachers')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final json = {
    'email': email,
    'inst': inst,
    'name': name,
    'bdate': bdate,
    'gradelevel': gradelevel,
    'studentnumber': studentnumber,
    'type': 'Teachers',
    'id': docUser.id,
    'img': img,
    'class': [],
  };

  await docUser.set(json);
}
