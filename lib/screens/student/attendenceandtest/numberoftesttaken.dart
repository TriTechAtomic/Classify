import 'package:flutter/material.dart';

class StudentTestTakenData extends StatefulWidget {
  const StudentTestTakenData({Key? key}) : super(key: key);

  @override
  State<StudentTestTakenData> createState() => _StudentTestTakenDataState();
}

class _StudentTestTakenDataState extends State<StudentTestTakenData> {
  List<String> lecturesTaken = [
    'Test 1',
    'Test 2',
    'Test 3',
    'Test 4',
    'Test 5',
    'Test 6',
    'Test 7',
    'Test 8',
    'Test 9',
    'Test 10',
    'Test 11',
    'Test 12',
    'Test 13',
    'Test 14',
    'Test 15',
    'Test 16',
    'Test 17',
    'Test 18',
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
