import 'package:flutter/material.dart';
import 'attendeeslist.dart';
import '../../../utils/colors.dart';
import '../../../utils/responsive.dart';

class AttendancePageBodyContent extends StatelessWidget {
  const AttendancePageBodyContent(
      {Key? key, required this.width, required this.studentNames})
      : super(key: key);

  final double width;
  final List<String> studentNames;

  @override
  Widget build(BuildContext context) {
    bool ismobile = Responsive.isMobile(context);

    return Column(
      children: [
        SizedBox(
          width: width,
          child: Row(
            children: const [
              Text("Name of Students"),
              Spacer(),
              Text("Mark Present"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: widgetBackgroundWhtie,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, right: 25, bottom: 10, left: 25),
              child: Column(
                children: [
                  for (String e in studentNames)
                    AttendeesListName(studentName: e)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
