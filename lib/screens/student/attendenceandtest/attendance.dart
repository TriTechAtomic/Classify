import 'package:flutter/material.dart';
import 'numberofattendance.dart';

class AttendanceStats extends StatelessWidget {
  const AttendanceStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: const [
          SizedBox(
            height: 150,
            child: Placeholder(),
          ),
          StudentAttendanceData(),
        ],
      ),
    );
  }
}
