import 'package:classify/screens/widgets/customdrawer.dart';
import 'package:flutter/material.dart';

class TeacherHome extends StatelessWidget {
  TeacherHome({Key? key}) : super(key: key);
  static const String routeName = '/teacherHome';
  final List<String> drawerWidgets = [
    "Rate us",
    "Share",
    "Contact us",
    "Credits",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Home"),
      ),
      drawer: CustomDrawer(
        name: "Teachers Name",
        email: "dummyteachersemail@gmail.com",
        drawerItems: drawerWidgets,
      ),
    );
  }
}
