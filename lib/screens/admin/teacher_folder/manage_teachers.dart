import 'package:classify/screens/admin/teacher_folder/invite_teacher.dart';
import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class ManageTeachers extends StatefulWidget {
  const ManageTeachers({Key? key}) : super(key: key);
  static const String routeName = '/ManageTeachers';

  @override
  State<ManageTeachers> createState() => _ManageTeachersState();
}

class _ManageTeachersState extends State<ManageTeachers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Manage Teachers"),
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: "Invite New Teachers"),
                  Tab(text: "Your Teachers"),
                ],
              ),
            ),
            body: const TabBarView(children: [
              Scaffold(
                body: InviteTeacher(),
              ),
              Scaffold(
                backgroundColor: Colors.red,
              )
            ])),
      ),
    );
  }
}
