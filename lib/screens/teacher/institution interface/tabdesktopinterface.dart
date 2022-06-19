import 'package:classify/models/route_meta.dart';
import 'package:flutter/material.dart';
import 'package:classify/utils/buttons.dart';
import '../attendance/attendance.dart';

class DesktopInterface extends StatelessWidget {
  DesktopInterface({Key? key}) : super(key: key);

  final List<RouteMeta> buttonsContentandRoute = [
    RouteMeta('Expected Pay', ''),
    RouteMeta('Take Attendence', StudentsAttendence.routeName),
    RouteMeta('View Schedule', ''),
    RouteMeta('Total Lectures', ''),
  ];

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (RouteMeta e in buttonsContentandRoute)
        CustomButtons(
          text: e.MetaName,
          height: 70,
          width: mq.width * 0.4,
          callback: () {
            Navigator.pushNamed(context, e.routeName);
          },
          padding: const EdgeInsets.all(8),
        )
    ]);
  }
}
