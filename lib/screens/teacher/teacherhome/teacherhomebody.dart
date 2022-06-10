import 'package:flutter/material.dart';
import '../../../utils/buttons.dart';
import '../../../utils/responsive.dart';
import '../institution interface/institionmain.dart';

class TeacherHomeBody extends StatelessWidget {
  TeacherHomeBody({Key? key, required this.className}) : super(key: key);

  final String className;
  final radius = BorderRadius.circular(
    12.0,
  );

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: radius),
          child: Responsive(
            mobile: CustomButtons(
              text: 'Institution $className',
              height: 50,
              width: mq.width * 0.85,
              callback: () {
                Navigator.pushNamed(context, TeacherInstitutionPage.routeName);
              },
              borderradius: 12.0,
            ),
            tablet: CustomButtons(
              text: 'Institution $className',
              height: 50,
              width: mq.width * 0.7,
              callback: () {
                Navigator.pushNamed(context, TeacherInstitutionPage.routeName);
              },
              borderradius: 12.0,
            ),
            desktop: CustomButtons(
              text: 'Institution $className',
              height: 60,
              width: mq.width * 0.4,
              callback: () {
                Navigator.pushNamed(context, TeacherInstitutionPage.routeName);
              },
              borderradius: 12.0,
            ),
          )),
    );
  }
}
