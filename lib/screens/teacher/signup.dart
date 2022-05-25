import 'package:classify/assets/asset_register.dart';
import 'package:classify/screens/widgets/form_heading.dart';
import 'package:flutter/material.dart';

class TeacherSignup extends StatelessWidget {
  const TeacherSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Column(
        children: const [FormHeading(name: "For\nTeachers")],
      ),
    )));
  }
}
