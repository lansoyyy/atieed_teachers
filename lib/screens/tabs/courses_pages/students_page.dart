import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
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
        Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.black, fontFamily: 'Regular', fontSize: 14),
                onChanged: (value) {
                  setState(() {
                    nameSearched = value;
                  });
                },
                decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(fontFamily: 'Regular'),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
                controller: searchController,
              ),
            ),
          ),
        ),
        for (int i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  minRadius: 30,
                  maxRadius: 30,
                  child: Icon(Icons.person),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Surname, First Name',
                      fontSize: 16,
                      fontFamily: 'Bold',
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: 'Grade Level          Section',
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
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
