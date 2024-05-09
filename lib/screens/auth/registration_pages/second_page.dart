import 'package:atieed/screens/auth/registration_pages/third_page.dart';
import 'package:atieed/services/add_user.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:atieed/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class SecondPage extends StatefulWidget {
  Map auth;
  String inst;

  SecondPage({super.key, required this.auth, required this.inst});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

  Future<void> uploadPicture(String inputSource) async {
    final picker = ImagePicker();
    XFile pickedImage;
    try {
      pickedImage = (await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920))!;

      fileName = path.basename(pickedImage.path);
      imageFile = File(pickedImage.path);

      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: AlertDialog(
                title: Row(
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Loading . . .',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'QRegular'),
                ),
              ],
            )),
          ),
        );

        await firebase_storage.FirebaseStorage.instance
            .ref('Profiles/$fileName')
            .putFile(imageFile);
        imageURL = await firebase_storage.FirebaseStorage.instance
            .ref('Profiles/$fileName')
            .getDownloadURL();

        setState(() {});

        Navigator.of(context).pop();
        showToast('Image uploaded!');
      } on firebase_storage.FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  final bdate = TextEditingController();
  final gradelevel = TextEditingController();
  final studentnumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Divider(
                      thickness: 5,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    child: Divider(
                      thickness: 5,
                      color: primary,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 100,
                    child: Divider(
                      thickness: 5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          uploadPicture('gallery');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: CircleAvatar(
                            minRadius: 50,
                            maxRadius: 50,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(imageURL),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 100,
                        height: 25,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: 'Teacher',
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        width: 350,
                        controller: name,
                        label: 'Name',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 175,
                            child: TextFieldWidget(
                              controller: bdate,
                              label: 'Birthdate',
                            ),
                          ),
                          SizedBox(
                            width: 175,
                            child: TextFieldWidget(
                              controller: gradelevel,
                              label: 'Grade Level',
                            ),
                          ),
                        ],
                      ),
                      TextFieldWidget(
                        width: 350,
                        controller: studentnumber,
                        label: 'Teacher Number',
                      ),
                      TextFieldWidget(
                        width: 350,
                        controller: email,
                        label: 'Email',
                      ),
                      TextFieldWidget(
                        width: 350,
                        controller: password,
                        label: 'Password',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ButtonWidget(
                  fontSize: 18,
                  width: 150,
                  label: 'Next',
                  onPressed: () {
                    register(context);
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  register(context) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      // signup(nameController.text, numberController.text, addressController.text,
      //     emailController.text);
      addUser(email.text, widget.inst, name.text, bdate.text, gradelevel.text,
          studentnumber.text, user.user!.uid, imageURL);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      await FirebaseAuth.instance.currentUser!.sendEmailVerification();

      showToast("Registered Successfully! Verification was sent to your email");

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ThirdPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.toString());
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
