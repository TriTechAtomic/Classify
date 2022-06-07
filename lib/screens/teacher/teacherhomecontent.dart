import 'package:flutter/material.dart';
import 'teacherheader.dart';
import 'teacherhomebody.dart';
import '../../utils/buttons.dart';
import '../../utils/responsive.dart';

class TeacherHomeContents extends StatelessWidget {
  const TeacherHomeContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const TeacherHeader(
                  name: "DummyTeacher",
                  contact: "1234567890",
                  email: "Dummyemail@gmail.com",
                  keysubject: "Pehele seekh lu"),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButtons(
                      text: "Join New Class",
                      height: Responsive.isMobile(context) ? 40 : 55,
                      width: Responsive.isMobile(context) ? 140 : 200,
                      color: const Color.fromARGB(255, 144, 145, 199),
                      textcolor: Colors.white,
                      callback: () {},
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  for (int i = 1; i < 4; i++)
                    TeacherHomeBody(
                      className: i.toString(),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
