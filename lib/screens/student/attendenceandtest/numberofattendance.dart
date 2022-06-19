import 'package:flutter/material.dart';

class StudentAttendanceData extends StatefulWidget {
  const StudentAttendanceData({Key? key}) : super(key: key);

  @override
  State<StudentAttendanceData> createState() => _StudentAttendanceDataState();
}

class _StudentAttendanceDataState extends State<StudentAttendanceData> {
  List<String> lecturesTaken = [
    'Lecture 1',
    'Lecture 2',
    'Lecture 3',
    'Lecture 4',
    'Lecture 5',
    'Lecture 6',
    'Lecture 7',
    'Lecture 8',
    'Lecture 9',
    'Lecture 10',
    'Lecture 11',
    'Lecture 12',
    'Lecture 13',
    'Lecture 14',
    'Lecture 15',
    'Lecture 16',
    'Lecture 17',
    'Lecture 18',
  ];

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;

    return Column(
      children: [
        for (String e in lecturesTaken)
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              height: mq.height * 0.08,
              width: mq.width * 0.86,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Center(
                child: Text(e),
              ),
            ),
          ),
      ],
    );
  }
}
