import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/teacher/teacherhome/teacher_home.dart';
import 'package:classify/screens/widgets/form_heading.dart';
import 'package:classify/screens/widgets/proceed_button.dart';
import 'package:classify/screens/widgets/tf_flow.dart';
import 'package:classify/screens/widgets/transperent_app_bar.dart';
import 'package:flutter/material.dart';

class TeacherSignup extends StatefulWidget {
  const TeacherSignup({Key? key}) : super(key: key);
  static const String routeName = '/teacherSignup';

  @override
  State<TeacherSignup> createState() => _TeacherSignupState();
}

class _TeacherSignupState extends State<TeacherSignup> {
  final List<TFmeta> controllers = [
    TFmeta("Name"),
    TFmeta("username"),
    TFmeta("Phone number"),
    TFmeta("Email"),
    TFmeta("Password", ispass: true),
    TFmeta("Qualification"),
    TFmeta("Key Subject"),
    TFmeta("Address"),
  ];

  @override
  void initState() {
    super.initState();
    for (var ele in controllers) {
      ele.controller.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var ele in controllers) {
      ele.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transperentAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FormHeading(name: "For\nTeacher Signup"),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView(
                  children: [
                    for (var ele in controllers)
                      TFrow(data: ele, ss: MediaQuery.of(context).size),
                    ProceedButton(
                      ss: MediaQuery.of(context).size,
                      text: "Proceed",
                      onPressed: () {
                        Navigator.pushNamed(context, TeacherHome.routeName);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
