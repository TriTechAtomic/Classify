import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/screens.dart';
import 'package:classify/screens/widgets/form_heading.dart';
import 'package:classify/screens/widgets/proceed_button.dart';
import 'package:classify/screens/widgets/tf_flow.dart';
import 'package:classify/screens/widgets/transperent_app_bar.dart';
import 'package:classify/utils/auth/classify_auth.dart';
import 'package:classify/utils/auth/models/user.dart';
import 'package:flutter/material.dart';

class TeacherSignup extends StatefulWidget {
  const TeacherSignup({Key? key}) : super(key: key);
  static const String routeName = '/teacherSignup';

  @override
  State<TeacherSignup> createState() => _TeacherSignupState();
}

class _TeacherSignupState extends State<TeacherSignup> {
  final List<TFmeta> controllers = [
    TFmeta("Qualification"),
    TFmeta("Phone number"),
    TFmeta("Key Subject"),
    TFmeta("username"),
    TFmeta("Email"),
    TFmeta("Password", ispass: true),
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

  bool TextfieldsAreValid() {
    for (var ele in controllers) {
      if (ele.controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  String buttonText = "Proceed";

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
                      text: buttonText,
                      onPressed: TextfieldsAreValid()
                          ? () async {
                              Teacher t = Teacher.fromTFMETA(controllers);
                              var instance = ClassifyAuth<Teacher>();
                              setState(() {
                                buttonText = "Signing up...";
                              });
                              var res = await instance.signUp(t);
                              setState(() {
                                buttonText = "Logging in...";
                              });
                              if (res) {
                                instance.signIn(t.email, t.password,
                                    'signinTeacher', context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("User already exists")));
                              }

                              Navigator.pushNamed(
                                  context, TeacherHome.routeName);
                            }
                          : null,
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
