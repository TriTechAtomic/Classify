import 'package:flutter/material.dart';
import 'attendancebody.dart';
import 'attendanceheader.dart';
import '../../../utils/colors.dart';
import '../../../utils/responsive.dart';

class StudentsAttendence extends StatefulWidget {
  const StudentsAttendence({Key? key}) : super(key: key);

  static const String routeName = '/TakingStudentsAttendence';

  @override
  State<StudentsAttendence> createState() => _StudentsAttendenceState();
}

class _StudentsAttendenceState extends State<StudentsAttendence> {
  List<String> courses = [
    "Course 1",
    "Course 2",
    "Course 3",
    "Course 4",
    "Course 5",
  ];

  List<String> studentNames = [
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
  ];

  String selectedCourse = "Course 1";

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student's Attendence"),
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day)
                .toString()
                .substring(0, 10)),
          )),
        ],
      ),
      backgroundColor: adminBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Responsive(
              mobile: AttendancePageHeader(
                courses: courses,
                selectedCourse: selectedCourse,
                height: 58,
                width: 170,
              ),
              tablet: AttendancePageHeader(
                courses: courses,
                selectedCourse: selectedCourse,
                height: 87,
                width: 145,
              ),
              desktop: AttendancePageHeader(
                courses: courses,
                selectedCourse: selectedCourse,
                height: 97,
                width: 250,
              ),
            ),
            Responsive(
              mobile: AttendancePageBodyContent(
                width: mq.width * 0.85,
                studentNames: studentNames,
              ),
              tablet: AttendancePageBodyContent(
                width: mq.width * 0.7,
                studentNames: studentNames,
              ),
              desktop: AttendancePageBodyContent(
                width: mq.width * 0.5,
                studentNames: studentNames,
              ),
            )
          ],
        ),
      ),
    );
  }
}
