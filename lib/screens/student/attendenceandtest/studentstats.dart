import 'package:flutter/material.dart';
import 'attendance.dart';
import 'test.dart';

class StudentStatus extends StatelessWidget {
  const StudentStatus({Key? key}) : super(key: key);

  static const String routeName = '/studentstats';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Analytics"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Attendance",
              ),
              Tab(
                text: "Tests",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AttendanceStats(),
            TestStats(),
          ],
        ),
      ),
    );
  }
}
