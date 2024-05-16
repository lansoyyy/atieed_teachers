import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/screens/tabs/courses_pages/class_started_page.dart';
import 'package:atieed/screens/tabs/courses_pages/open_record_page.dart';
import 'package:atieed/screens/tabs/courses_pages/students_page.dart';
import 'package:atieed/services/add_course.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:atieed/widgets/toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  String _selectedOption = '1st Semester';
  bool isclicked = false;
  List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  List<String> selectedDays = [];

  final name = TextEditingController();
  final section = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Padding(padding: const EdgeInsets.all(10.0), child: mainWidget()),
      ),
    );
  }

  Widget mainWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          TextFieldWidget(
            radius: 15,
            borderColor: Colors.black,
            width: 300,
            controller: name,
            label: 'Course Name',
          ),
          TextFieldWidget(
            radius: 15,
            borderColor: Colors.black,
            width: 300,
            controller: section,
            label: 'Section',
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Semester',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: _selectedOption,
                    hint: const Text('Select an option'),
                    items: <String>['1st Semester', '2nd Semester']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOption = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Available at',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: days.map((day) {
                      return ChoiceChip(
                        label: Text(day),
                        selected: selectedDays.contains(day),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              selectedDays.add(day);
                            } else {
                              selectedDays.remove(day);
                            }
                          });
                        },
                      );
                    }).toList(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Time',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("From: ${_timeFrom.format(context)}"),
                          ElevatedButton(
                            onPressed: () => _selectTimeFrom(context),
                            child: const Text('Select Time From'),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: <Widget>[
                          Text("To: ${_timeTo.format(context)}"),
                          ElevatedButton(
                            onPressed: () => _selectTimeTo(context),
                            child: const Text('Select Time To'),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ButtonWidget(
                  fontSize: 18,
                  width: 250,
                  label: 'Add Course',
                  onPressed: () {
                    addCourse(
                        name.text,
                        section.text,
                        _selectedOption,
                        selectedDays,
                        _timeFrom.format(context),
                        _timeTo.format(context));
                    showToast('Course added!');
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  TimeOfDay _timeFrom = TimeOfDay.now();
  TimeOfDay _timeTo = TimeOfDay.now();

  Future<void> _selectTimeFrom(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeFrom,
    );
    if (picked != null && picked != _timeFrom) {
      setState(() {
        _timeFrom = picked;
      });
    }
  }

  Future<void> _selectTimeTo(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeTo,
    );
    if (picked != null && picked != _timeTo) {
      setState(() {
        _timeTo = picked;
      });
    }
  }
}
