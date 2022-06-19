import 'package:classify/utils/buttons.dart';
import 'package:flutter/material.dart';
import '../attendance/attendance.dart';
import '../../../models/route_meta.dart';

class MobileInterface extends StatelessWidget {
  MobileInterface({Key? key}) : super(key: key);

  final List<RouteMeta> buttonsContentandRoute = [
    RouteMeta('Expected Pay', ''),
    RouteMeta('Take Attendence', StudentsAttendence.routeName),
    RouteMeta('View Schedule', ''),
    RouteMeta('Total Lectures', ''),
  ];

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          for (RouteMeta e in buttonsContentandRoute)
            CustomButtons(
              text: e.MetaName,
              height: mq.width * 0.3,
              width: mq.width * 0.43,
              callback: () {
                Navigator.pushNamed(context, e.routeName);
              },
              padding: const EdgeInsets.all(8),
            )
        ],
      ),
    );
  }
}
