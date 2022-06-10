import 'package:classify/screens/admin/add_students.dart';
import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/buttons.dart';

class ManageStudents extends StatefulWidget {
  ManageStudents({Key? key}) : super(key: key);
  static const String routeName = '/ManageStudents';

  @override
  State<ManageStudents> createState() => _ManageStudentsState();
}

class _ManageStudentsState extends State<ManageStudents> {
  bool addStu = false;
  bool removeStu = false;

  void flipperClass() {
    setState(() {
      addStu = !addStu;
      removeStu = !removeStu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Students"),
      ),
      body: Center(
        child: addStu
            ? AddStudents(
                flipper: flipperClass,
              )
            : Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomButtons(
                      text: "Add Student",
                      height: 200,
                      width: 200,
                      color: accentColor,
                      callback: () {
                        setState(() {
                          addStu = true;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomButtons(
                      text: "Remove Students",
                      height: 200,
                      width: 200,
                      color: accentColor,
                      callback: () {},
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
