import 'package:classify/utils/buttons.dart';
import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class ManageCourses extends StatelessWidget {
  const ManageCourses({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text("Manage Courses",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  bottom: const TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: "Create New"),
                      Tab(text: "Edit Existing"),
                      Tab(text: "Delete"),
                      Tab(text: "Test Held"),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    Scaffold(
                      body: CustomButtons(
                          text: "User Template", height: 250, width: 250),
                    ),
                    Scaffold(
                      body: CustomButtons(
                          text: "User Template", height: 250, width: 250),
                    ),
                    Scaffold(
                      body: CustomButtons(
                          text: "User Template", height: 250, width: 250),
                    ),
                    Scaffold(
                      body: CustomButtons(
                          text: "User Template", height: 250, width: 250),
                    ),
                  ],
                ))));
  }
}
