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

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 30,
            mainAxisExtent: 200,
            mainAxisSpacing: 30,
            childAspectRatio: 1),
        itemCount: buttonsContentandRoute.length,
        itemBuilder: (context, index) {
          return CustomButtons(
              text: buttonsContentandRoute[index].MetaName,
              height: 200,
              width: 200);
        });
  }
}
