import 'package:flutter/material.dart';

class TeacherAttendence extends StatefulWidget {
  const TeacherAttendence({Key? key}) : super(key: key);
  static const String routeName = '/TeacherAttendence';

  @override
  State<TeacherAttendence> createState() => _TeacherAttendenceState();
}

class _TeacherAttendenceState extends State<TeacherAttendence> {
  final teachers = [
    'Hindustani bhau',
    'CarryMinatti',
    'John Wick',
    'Light Yagami',
    'L'
  ];

  String? seletedTeacher;
  DateTime seletedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Teacher's Attendence")),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              value: seletedTeacher,
              hint: const Text("Select Teacher"),
              items: teachers
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(),
                        ),
                      ))
                  .toList(),
              onChanged: (item) => setState(() {
                seletedTeacher = item;
              }),
            ),
            Text(seletedDate.toString()),
          ],
        ),
      ),
    ));
  }
}
