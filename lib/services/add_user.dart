import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(email, inst, name, bdate, gradelevel, studentnumber, id) async {
  final docUser = FirebaseFirestore.instance.collection('Teachers').doc(id);

  final json = {
    'email': email,
    'inst': inst,
    'name': name,
    'bdate': bdate,
    'gradelevel': gradelevel,
    'studentnumber': studentnumber,
    'type': 'Teachers',
    'id': docUser.id,
    'class': []
  };

  await docUser.set(json);
}