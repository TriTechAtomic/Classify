import 'package:classify/utils/buttons.dart';
import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

import 'create_class.dart';
import 'delete_class.dart';

class ManageCourses extends StatefulWidget {
  const ManageCourses({Key? key}) : super(key: key);
  static const String routeName = '/ManageCourses';

  @override
  State<ManageCourses> createState() => _ManageCoursesState();
}

class _ManageCoursesState extends State<ManageCourses> {
  bool createClass = false;
  void flipcreateClass() {
    setState(() {
      createClass = !createClass;
    });
  }

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
                body: TabBarView(
                  children: [
                    createClass
                        ? CreateCustomClass(
                            flipper: flipcreateClass,
                          )
                        : Scaffold(
                            backgroundColor: adminBackground,
                            body: Center(
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomButtons(
                                      text: "User Template",
                                      height: 200,
                                      width: 200,
                                      callback: () {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomButtons(
                                      text: "Create Custom",
                                      height: 200,
                                      width: 200,
                                      callback: () {
                                        setState(() {
                                          createClass = true;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    const Scaffold(
                      body: CustomButtons(
                          text: "User Template", height: 250, width: 250),
                    ),
                    DeleteClass(),
                    const Scaffold(
                      body: CustomButtons(
                          text: "User Template", height: 250, width: 250),
                    ),
                  ],
                ))));
  }
}
